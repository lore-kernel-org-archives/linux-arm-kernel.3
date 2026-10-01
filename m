Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB31ECA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 13:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8kVSjCZluH6wc+gWSsvrjlZTbtoWhWaXMHde0Exq820=; b=bC83b8FgfEQBUiwkoUULADaI7M
	1jxraFhhGvZqtgJ2tSsg7BcwM0Xyfr919FeB2Ds/wfxxVYB4/lPjR9FZIofhjMyvbJzHGA54ZEpoA
	ffR6fLKVstwlIdHRYkMtTZF407q7S5YhNcmva4bUHRMyiq69iN/t6bu7kRH1xoGj6/FJV/sMMxQlQ
	JHn1yQdjmss2nqj0k0Dx9foEuMJcDnaeeBgw9eudqe5bpksqezDexNfK+3u11tgk8aaOuH7P3wyC1
	ajoXWrNDvAcrzYYvtqigMQ+3EFBF+3v4XZU6rzdRonq3mAAm1o+16sm0TOln3qze/9D25Dksq4lEx
	60Z1cQ2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHHz-00000009IMa-3HKQ;
	Thu, 01 Oct 2026 13:57:35 +0000
Received: from out-13.mta0.migadu.com ([2001:41d0:1004:224b::d] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHHx-00000009IJP-0q0P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 13:57:34 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=AhxiS1VQqXfslZ1woXmLPHR26jIknE+fBWoUb0tiCYQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790863050; v=1; x=1791467850;
 b=E6KqyELwfS11eeZOyXv10RVpsuYVJYR/rjZ86QFSvLbcfg4OgGC350a7FDiAQpd01X88gIJ3
 sQZiIWCtIR9WPhTmD+CGbdX7MBDVDjdVCgWQKfCj8bCLsCwULLxDNSDnpyDN+F1tWbbuhvpkYlX
 s/OpkGshWdBG+thUAy/xM7cM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 508d8d1a05bef4c8;
	Thu, 01 Oct 2026 13:57:30 +0000
X-Mizu-Trace-ID: 508d8d1a05bef4c8
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
	steven.price@arm.com,
	vdonnefort@google.com,
	qperret@google.com,
	tabba@google.com
Subject: [PATCH v4 03/18] KVM: arm64: Pin the host vCPU before adjusting its PC under pKVM
Date: Thu,  1 Oct 2026 14:56:56 +0100
Message-Id: <20261001135711.1640520-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261001135711.1640520-1-fuad.tabba@linux.dev>
References: <20261001135711.1640520-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_065733_386023_3410A36F 
X-CRM114-Status: GOOD (  13.04  )
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

Under pKVM, a page the host shares with EL2 is mapped at EL2 only while
it's pinned, and the host vCPU is pinned at its first KVM_RUN.
KVM_SET_VCPU_EVENTS with ext_dabt_pending reaches __kvm_adjust_pc() at
EL2 before that, and dereferencing the unmapped host vCPU panics the
hypervisor. Any process holding /dev/kvm on a pKVM host can trigger it.

Pin the host vCPU around the adjustment when no hyp vCPU is loaded for
it. A loaded hyp vCPU implies it's pinned. A pin fails only for memory
the host isn't sharing, and the request is then dropped like any other
bad host pointer.

Fixes: efa1368ba9f4b ("KVM: arm64: Commit exceptions from KVM_SET_VCPU_EVENTS immediately")
Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Reviewed-by: Joey Gouly <joey.gouly@arm.com>
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index b6bfe502bcd04..8b9d76e5336bb 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -546,8 +546,27 @@ static void handle___pkvm_host_mkyoung_guest(struct kvm_cpu_context *host_ctxt)
 static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
+	struct pkvm_hyp_vcpu *hyp_vcpu;
+	struct kvm_vcpu *host_vcpu;
 
-	__kvm_adjust_pc(kern_hyp_va(vcpu));
+	host_vcpu = __get_host_hyp_vcpus(vcpu, &hyp_vcpu);
+	if (host_vcpu) {
+		__kvm_adjust_pc(host_vcpu);
+		return;
+	}
+
+	/*
+	 * With no hyp vCPU loaded for it, the host vCPU may be unpinned,
+	 * and so unmapped at EL2: its first run pins it. A pin fails only
+	 * for memory the host isn't sharing, a bad pointer, so the request
+	 * is dropped.
+	 */
+	host_vcpu = kern_hyp_va(vcpu);
+	if (hyp_pin_shared_mem(host_vcpu, host_vcpu + 1))
+		return;
+
+	__kvm_adjust_pc(host_vcpu);
+	hyp_unpin_shared_mem(host_vcpu, host_vcpu + 1);
 }
 
 static void handle___kvm_flush_vm_context(struct kvm_cpu_context *host_ctxt)
-- 
2.39.5


