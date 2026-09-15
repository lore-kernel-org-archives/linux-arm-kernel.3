Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2B4C982C5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 12:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=89i0PjzlpnxoH8Xlp6XVpO7++jqE2crKVvCAXyLSxTI=; b=bCmxGNf245rZQM40tywXSNrjbh
	TL4GSKk/nEuhS4o9H0shh+Z4EU9kJcnOSlqxqX5j6pdn/4ksGkTYKUCI0K2D3thhI6FNvNVz9whyw
	X+l2ZJRHXm6QF5H+IB4ICwQd5xF4hR9AGZ3huJMfpDbsuCcU5Ds3X/1YzRqK4bQfvuRVnhlZh+ShG
	6WuDAG/4VO6NXqcg5kUUuEoKa284pIVWagKbLXfbhPhOPe8Uowam8Te4Te87XLxLiNKgryLpRpoZg
	JIh7dnszkUln5LAi3JxHApxC/Sirx1mfiEFuRssubMUlNGGdOFa3rnCFedn5rKgnnBErTkjhuUzRU
	UCRjSZkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SRP-00000006XYv-3Ix9;
	Tue, 15 Sep 2026 12:39:15 +0000
Received: from out-45.mta0.migadu.com ([2001:41d0:1004:224b::2d] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SR9-00000006X1I-4B4O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 12:39:01 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=UabJMBs9Z2dMomcvezICknlRvRSdmtK2yTGhqNrS3jk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789475937; v=1; x=1790080737;
 b=xBWwOu9m2XNP6rrRCyoIw9ylEsQyX47X8jfI9yg6LbgRwCNB1k+OruuMSsu2hkEUbY/Kufv7
 l5QManhMU5gv7Kw4fzSNovQJ1+ruRmy5FAmIFzNilapg9d599S9MmL0ert47LlM6H7JQq/99++C
 I49gkqBBl6uAP6Q9mVen4O6g=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 6cbd52d59c5a6876;
	Tue, 15 Sep 2026 12:38:57 +0000
X-Mizu-Trace-ID: 6cbd52d59c5a6876
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
	Sascha.Bischoff@arm.com,
	steven.price@arm.com,
	tabba@google.com
Subject: [PATCH 2/7] KVM: arm64: Reject the stage-2 flush hypercalls under pKVM
Date: Tue, 15 Sep 2026 13:38:41 +0100
Message-Id: <20260915123846.2317931-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260915123846.2317931-1-fuad.tabba@linux.dev>
References: <20260915123846.2317931-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_053900_289022_2A5751A9 
X-CRM114-Status: GOOD (  13.25  )
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

The stage-2 TLB and context flush hypercalls remain callable once pKVM
has finalised, and five of the six dereference a host-supplied
struct kvm_s2_mmu pointer. Under pKVM none has a valid caller: the host
walks no guest stage-2, its TLB flushes go through the handle-based
__pkvm_tlb_flush_vmid, and kvm_arch_vcpu_load() skips both the VMID
update and the CPU context flush.

Move them into the band the dispatcher rejects once pKVM has finalised.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260914130152.F0D5F1F000FF@smtp.kernel.org/
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_asm.h   | 12 ++++++------
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 11 ++++++-----
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index ea319c496bb26..b182c908c1a98 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -64,6 +64,12 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___vgic_v3_get_gic_config,
 	__KVM_HOST_SMCCC_FUNC___vgic_v5_save_apr,
 	__KVM_HOST_SMCCC_FUNC___vgic_v5_restore_vmcr_apr,
+	__KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
+	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_ipa,
+	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_ipa_nsh,
+	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid,
+	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_range,
+	__KVM_HOST_SMCCC_FUNC___kvm_flush_cpu_context,
 
 	MARKER(__KVM_HOST_SMCCC_FUNC_MIN_PKVM),
 
@@ -72,12 +78,6 @@ enum __kvm_host_smccc_func {
 	/* Hypercalls that are always available and common to [nh]VHE/pKVM. */
 	__KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
 	__KVM_HOST_SMCCC_FUNC___kvm_vcpu_run,
-	__KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
-	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_ipa,
-	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_ipa_nsh,
-	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid,
-	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_range,
-	__KVM_HOST_SMCCC_FUNC___kvm_flush_cpu_context,
 	__KVM_HOST_SMCCC_FUNC___kvm_timer_set_cntvoff,
 	__KVM_HOST_SMCCC_FUNC___tracing_load,
 	__KVM_HOST_SMCCC_FUNC___tracing_unload,
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 7c939baf9c1ba..b2657a3c65b40 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -913,16 +913,16 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__vgic_v3_get_gic_config),
 	HANDLE_FUNC(__vgic_v5_save_apr),
 	HANDLE_FUNC(__vgic_v5_restore_vmcr_apr),
-	HANDLE_FUNC(__pkvm_prot_finalize),
-
-	HANDLE_FUNC(__kvm_adjust_pc),
-	HANDLE_FUNC(__kvm_vcpu_run),
 	HANDLE_FUNC(__kvm_flush_vm_context),
 	HANDLE_FUNC(__kvm_tlb_flush_vmid_ipa),
 	HANDLE_FUNC(__kvm_tlb_flush_vmid_ipa_nsh),
 	HANDLE_FUNC(__kvm_tlb_flush_vmid),
 	HANDLE_FUNC(__kvm_tlb_flush_vmid_range),
 	HANDLE_FUNC(__kvm_flush_cpu_context),
+	HANDLE_FUNC(__pkvm_prot_finalize),
+
+	HANDLE_FUNC(__kvm_adjust_pc),
+	HANDLE_FUNC(__kvm_vcpu_run),
 	HANDLE_FUNC(__kvm_timer_set_cntvoff),
 	HANDLE_FUNC(__tracing_load),
 	HANDLE_FUNC(__tracing_unload),
@@ -969,7 +969,8 @@ static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
 
 	/*
 	 * If pKVM has been initialised then reject any calls to the
-	 * early "privileged" hypercalls. Note that we cannot reject
+	 * early "privileged" hypercalls, and to the ones the host has no
+	 * use for in protected mode. Note that we cannot reject
 	 * calls to __pkvm_prot_finalize for two reasons: (1) The static
 	 * key used to determine initialisation must be toggled prior to
 	 * finalisation and (2) finalisation is performed on a per-CPU
-- 
2.39.5


