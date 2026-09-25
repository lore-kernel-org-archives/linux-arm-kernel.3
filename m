Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4261C98324
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 09:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HyoxaBB+Uu+rPZn5YTdys1T79Bj3yyewywpS0Yclwi8=; b=GP4ubdJ7m31pQzdlEceoVAHU4H
	Y0P6BIrT+iLGe39idc637zKHKLZ6SQpoz9i7DESbqwEa/lUmhB7MGS/0wa68aax8fS5/5jJdxAGGD
	9cfKYSAe6a8eg/zimBUW3hNXDs6ANXBqnu6/lllgzDpwa13PgnSaudYuaBDwVbqQj3hNGw+M0TNLK
	DWx+FR55paZgy1CLVUDHW1Stz7YuoUaIysCO72AXQOdmEWWg6Bsg4CMHEB7BlvR1Xdm3ooRBBtJzx
	DkIeOneVEQf9XVi3qiMsnonhFyE8NDdidrxS/a18/W8miufwpLi1h3gGAt4kXI3KvdIJVWo2fJMYi
	Zcb3YmLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1tA-0000000Cy9H-2VEd;
	Fri, 25 Sep 2026 09:06:40 +0000
Received: from out-82.mta1.migadu.com ([95.215.58.82] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1st-0000000Cy3p-3C3A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 09:06:25 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Y9ZAnxNOH2lrJRb3LRr5HWYioWfcGxX3qidODsECads=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790327182; v=1; x=1790931982;
 b=crUleeVmfIlutHO5eNR+jLwnRRv15dZpW06mzdKd0s1X+7Xg9ol/yHJECz796zSqWriZdPZ9
 oydZmhpyPrGj8yXBIIlbXI4yFXUrEgo8EDrcNq1YL0pFmqwbQB7NtMRwK7sAkDpBGNhG9aQjag/
 JUC7v+ekj9W3v82/sOK3xW1E=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 09c974e8f8fc8fd1;
	Fri, 25 Sep 2026 09:06:21 +0000
X-Mizu-Trace-ID: 09c974e8f8fc8fd1
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Quentin Perret <qperret@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/4] KVM: arm64: Use the host's HCR_EL2 for non-protected VMs in pKVM
Date: Fri, 25 Sep 2026 10:06:18 +0100
Message-Id: <20260925090619.852995-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260925090619.852995-1-fuad.tabba@linux.dev>
References: <20260925090619.852995-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_020623_982012_780C8E99 
X-CRM114-Status: GOOD (  17.78  )
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

In pKVM, a non-protected VM gets only TWI, TWE and VSE from the HCR_EL2
the host computes for it. EL2 sets the rest in pkvm_vcpu_reset_hcr(),
which covers only part of vcpu_set_hcr(). On a CPU with MTE the VM can
then read GMID_EL1, on one without FGT it can execute a TLBI OS its ID
registers hide, and it never gets the host's TVM, VI or VF.

Use the host's HCR_EL2 on every entry instead, except for the bits EL2
owns. The other bits only control what the VM's own execution traps on
and which virtual exceptions are pending for it. The host computes them
from the vCPU's features, ID registers and flags, which EL2 already
takes from the host for a non-protected VM, as it takes MDCR_EL2,
HCRX_EL2 and the fine-grained traps.

ATA, an owned bit, stays clear, as pKVM doesn't support MTE for any
guest. TID2 and TID4 move to pvm_init_traps_hcr(), since EL2 now sets
them only for a protected VM. A protected VM's HCR_EL2 is unchanged.

Fixes: b56680de9c648 ("KVM: arm64: Initialize trap register values in hyp in pKVM")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_arm.h       |  1 +
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h | 13 +++++++++++++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c     |  7 ++++---
 arch/arm64/kvm/hyp/nvhe/pkvm.c         | 18 ++++++++----------
 4 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
index 4bfbd827c5aa7..8d187650e463e 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -30,6 +30,7 @@
 #define HCR_AMVOFFEN	__HCR(AMVOFFEN)
 #define HCR_TICAB	__HCR(TICAB)
 #define HCR_TID4	__HCR(TID4)
+#define HCR_GPF		__HCR(GPF)
 #define HCR_FIEN	__HCR(FIEN)
 #define HCR_FWB		__HCR(FWB)
 #define HCR_NV2		__HCR(NV2)
diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
index c904647d2f760..75b1122db4c91 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
@@ -12,6 +12,19 @@
 #include <nvhe/gfp.h>
 #include <nvhe/spinlock.h>
 
+/*
+ * HCR_EL2 bits EL2 owns for a non-protected VM, whatever the host sets: those
+ * that restrict the guest, configure EL2 or what it switches (E2H, RW), or
+ * enable state EL2 doesn't switch or support. RES0 is included, so a bit comes
+ * from the host only once arch/arm64/tools/sysreg describes it.
+ */
+#define PKVM_HCR_EL2_OWNED	((HCR_GUEST_FLAGS & ~(HCR_TWI | HCR_TWE)) | HCR_BSU |	\
+				 HCR_E2H | HCR_TGE | HCR_TEA | HCR_GPF | HCR_TERR |	\
+				 HCR_FWB | HCR_DC | HCR_ID | HCR_CD | HCR_NV |		\
+				 HCR_NV1 | HCR_NV2 | HCR_API | HCR_APK | HCR_ATA |	\
+				 HCR_DCT | HCR_FIEN | HCR_AMVOFFEN | HCR_ENSCXT |	\
+				 HCR_EL2_RES0)
+
 /*
  * Holds the relevant data for maintaining the vcpu state completely at hyp.
  */
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 9a3b92e626adb..dec99d5bbee78 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -216,6 +216,7 @@ static void sync_debug_state(struct pkvm_hyp_vcpu *hyp_vcpu)
 static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 {
 	struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
+	u64 host_hcr_mask = HCR_TWI | HCR_TWE | HCR_VSE;
 
 	fpsimd_sve_flush();
 	flush_debug_state(hyp_vcpu);
@@ -228,6 +229,7 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 	if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu)) {
 		if (vcpu_get_flag(host_vcpu, PKVM_HOST_STATE_DIRTY))
 			flush_hyp_vcpu_state(hyp_vcpu);
+		host_hcr_mask = ~PKVM_HCR_EL2_OWNED;
 	} else {
 		hyp_vcpu->vcpu.arch.ctxt = host_vcpu->arch.ctxt;
 	}
@@ -241,9 +243,8 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 	 * trap-control bit, so it must flow to the hyp vCPU alongside TWI/TWE
 	 * for the vSError to be delivered. sync_hyp_vcpu() reflects it back.
 	 */
-	hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWI | HCR_TWE | HCR_VSE);
-	hyp_vcpu->vcpu.arch.hcr_el2 |= READ_ONCE(host_vcpu->arch.hcr_el2) &
-						 (HCR_TWI | HCR_TWE | HCR_VSE);
+	hyp_vcpu->vcpu.arch.hcr_el2 &= ~host_hcr_mask;
+	hyp_vcpu->vcpu.arch.hcr_el2 |= READ_ONCE(host_vcpu->arch.hcr_el2) & host_hcr_mask;
 
 	hyp_vcpu->vcpu.arch.iflags	= host_vcpu->arch.iflags;
 
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index affc9595fda20..2cf704036871b 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -30,6 +30,7 @@ unsigned int kvm_host_sve_max_vl;
  */
 static DEFINE_PER_CPU(struct pkvm_hyp_vcpu *, loaded_hyp_vcpu);
 
+/* A non-protected VM keeps only the PKVM_HCR_EL2_OWNED bits of the HCR_EL2 set here. */
 static void pkvm_vcpu_reset_hcr(struct kvm_vcpu *vcpu)
 {
 	vcpu->arch.hcr_el2 = HCR_GUEST_FLAGS;
@@ -47,13 +48,6 @@ static void pkvm_vcpu_reset_hcr(struct kvm_vcpu *vcpu)
 	if (cpus_have_final_cap(ARM64_HAS_STAGE2_FWB))
 		vcpu->arch.hcr_el2 |= HCR_FWB;
 
-	if (cpus_have_final_cap(ARM64_HAS_EVT) &&
-	    !cpus_have_final_cap(ARM64_MISMATCHED_CACHE_TYPE) &&
-	    kvm_read_vm_id_reg(vcpu->kvm, SYS_CTR_EL0) == read_cpuid(CTR_EL0))
-		vcpu->arch.hcr_el2 |= HCR_TID4;
-	else
-		vcpu->arch.hcr_el2 |= HCR_TID2;
-
 	/*
 	 * At EL2, vcpu_el1_is_32bit() reads HCR_EL2.RW, and EL2 switches the
 	 * *32_EL2 registers when it returns true; they're UNDEFINED without AArch32 EL1.
@@ -64,9 +58,6 @@ static void pkvm_vcpu_reset_hcr(struct kvm_vcpu *vcpu)
 
 	if (vcpu_has_ptrauth(vcpu))
 		vcpu->arch.hcr_el2 |= (HCR_API | HCR_APK);
-
-	if (kvm_has_mte(vcpu->kvm))
-		vcpu->arch.hcr_el2 |= HCR_ATA;
 }
 
 static void pvm_init_traps_hcr(struct kvm_vcpu *vcpu)
@@ -84,6 +75,13 @@ static void pvm_init_traps_hcr(struct kvm_vcpu *vcpu)
 	 */
 	val |= HCR_TACR | HCR_TIDCP | HCR_TID3 | HCR_TID1;
 
+	if (cpus_have_final_cap(ARM64_HAS_EVT) &&
+	    !cpus_have_final_cap(ARM64_MISMATCHED_CACHE_TYPE) &&
+	    kvm_read_vm_id_reg(kvm, SYS_CTR_EL0) == read_cpuid(CTR_EL0))
+		val |= HCR_TID4;
+	else
+		val |= HCR_TID2;
+
 	if (!kvm_has_feat(kvm, ID_AA64PFR0_EL1, RAS, IMP)) {
 		val |= HCR_TERR | HCR_TEA;
 		val &= ~(HCR_FIEN);
-- 
2.39.5


