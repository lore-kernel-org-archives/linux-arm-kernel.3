Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE26C88E6F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 17:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ztmcO6yye4Tb1cFcIyGxCqztyeWC3VXPsIKfytvBU1g=; b=USyl2V9MuxWgJqRwnpavrqHDNa
	kMVolLGjnElOsMltLV5OYv2cwFgsRPrZCQPjL0o10ACJCBq3MCY+y3SYaXdN/2WCAugnSIcCPrhR0
	x8l5rQty2p3kcKDhB2/G4iKMSLZ3mWtlwQGLG443sgOR97g9JKICNwEU/WQho7VDB02zN8XAUGKc1
	nwSNNzGvoNlDsjhwSWTcRSMFwD6KewlWeEwlN0Igy2hxEvcMQqtlYhCEeHPNPccF9AkvjtABOKzuO
	62K1xCG8Bm4y5AEH8yBtHJpb1WFJQKWNlNsxFAVTA5oLtjbQq49K36bnxGvII5CYq0Wabamp49D8Q
	Q68yk3Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6AkO-00000004Oxg-1VKV;
	Mon, 14 Sep 2026 17:45:40 +0000
Received: from out-177.mta0.migadu.com ([2001:41d0:1004:224b::b1] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6AkL-00000004OxN-49Wl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 17:45:39 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=PrgyValbiyYMTfVMJESIc+fLfCQaV5hw9qbA3T1oo9Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789407936; v=1; x=1790012736;
 b=mZh3roxx6BOjRcOhw8+Vh+gPXdJBh5Ry1ClvHQEBqTHfXsoypJg6N5nQlYg8KV/N5YGz/QxB
 pHJ5RhZ2D3NFe1QubA4hCtMxpccuAxmfiow2GMbD6JqCKTxoBvvccIPjbAA220jqQnx0E7/nLNm
 KAImMHyMquTxRv4FjkKAJOTc=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a45841c83f61cc60;
	Mon, 14 Sep 2026 17:45:22 +0000
X-Mizu-Trace-ID: a45841c83f61cc60
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: maz@kernel.org,
	oupton@kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	mark.rutland@arm.com,
	vdonnefort@google.com,
	qperret@google.com,
	tabba@google.com
Subject: [PATCH] KVM: arm64: Reject the stage-2 MMU pointer hypercalls under pKVM
Date: Mon, 14 Sep 2026 18:45:21 +0100
Message-Id: <20260914174521.832575-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_104538_174646_210E8899 
X-CRM114-Status: UNSURE (   7.97  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The five hypercalls that take a struct kvm_s2_mmu pointer remain
callable after pKVM finalises, and each dereferences the host pointer
in __load_stage2(). Under pKVM none of them has a valid caller: the
host walks no guest stage-2, its TLB flushes go through the handle-based
__pkvm_tlb_flush_vmid, and kvm_arch_vcpu_load() skips the CPU context
flush.

Reject all five when protected mode is enabled.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260914130152.F0D5F1F000FF@smtp.kernel.org/
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---

Notes:
    No in-tree host path reaches these, so no Fixes: tag.

 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 9a3b92e626adb..4b0d00e55e2ea 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -557,6 +557,9 @@ static void handle___kvm_tlb_flush_vmid_ipa(struct kvm_cpu_context *host_ctxt)
 	DECLARE_REG(phys_addr_t, ipa, host_ctxt, 2);
 	DECLARE_REG(int, level, host_ctxt, 3);
 
+	if (unlikely(is_protected_kvm_enabled()))
+		return;
+
 	__kvm_tlb_flush_vmid_ipa(kern_hyp_va(mmu), ipa, level);
 }
 
@@ -566,6 +569,9 @@ static void handle___kvm_tlb_flush_vmid_ipa_nsh(struct kvm_cpu_context *host_ctx
 	DECLARE_REG(phys_addr_t, ipa, host_ctxt, 2);
 	DECLARE_REG(int, level, host_ctxt, 3);
 
+	if (unlikely(is_protected_kvm_enabled()))
+		return;
+
 	__kvm_tlb_flush_vmid_ipa_nsh(kern_hyp_va(mmu), ipa, level);
 }
 
@@ -576,6 +582,9 @@ handle___kvm_tlb_flush_vmid_range(struct kvm_cpu_context *host_ctxt)
 	DECLARE_REG(phys_addr_t, start, host_ctxt, 2);
 	DECLARE_REG(unsigned long, pages, host_ctxt, 3);
 
+	if (unlikely(is_protected_kvm_enabled()))
+		return;
+
 	__kvm_tlb_flush_vmid_range(kern_hyp_va(mmu), start, pages);
 }
 
@@ -583,6 +592,9 @@ static void handle___kvm_tlb_flush_vmid(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct kvm_s2_mmu *, mmu, host_ctxt, 1);
 
+	if (unlikely(is_protected_kvm_enabled()))
+		return;
+
 	__kvm_tlb_flush_vmid(kern_hyp_va(mmu));
 }
 
@@ -602,6 +614,9 @@ static void handle___kvm_flush_cpu_context(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct kvm_s2_mmu *, mmu, host_ctxt, 1);
 
+	if (unlikely(is_protected_kvm_enabled()))
+		return;
+
 	__kvm_flush_cpu_context(kern_hyp_va(mmu));
 }
 

base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.39.5


