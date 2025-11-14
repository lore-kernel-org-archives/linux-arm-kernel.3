Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49693CE8D4F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EbNlS10Q+4u2UtKlT3LSQrqoMY2eup2VopLHhymNRD8=; b=Nv2F7hAJBCWiKRj3hzNUTHLChy
	0ycr02gyOiZnIbm9PBnapxBJ13OKieAUt89gYR91b8ZBlhL8/+TIm50N9fFNmWwYj4TAUHOCU1gTh
	LKSPQDbbkV+1+XMAoRlw8EVFmvwlfoV843O+rBERC4xcVShumtprmlCHOZQF/kqF91YiAx5XkFQ/k
	kmRZzVx8fZnCe0fGk/nRwSgZBF4kE9IWldrVR8Ji/klYEHVMultzO5M5bi/ew4a3YuenG8ihJFd6r
	KtRqKVJ8TSXJaF59P+fL1s+jtw+py+EpcMBMD45UDrtvfKk1V9EyLUzAykPz98QOpT+aQipP/Dbj4
	gnj6W41w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwLd-0000000Cfeh-1C1z;
	Fri, 14 Nov 2025 16:08:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwLP-0000000CfPq-1lFA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 16:08:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5EE7C1BB2;
	Fri, 14 Nov 2025 08:08:07 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D25153F5A1;
	Fri, 14 Nov 2025 08:08:12 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: james.clark@linaro.org,
	mark.rutland@arm.com,
	james.morse@arm.com
Subject: [RFC PATCH v6 16/35] KVM: arm64: Advertise SPE version in ID_AA64DFR0_EL1.PMSver
Date: Fri, 14 Nov 2025 16:06:57 +0000
Message-ID: <20251114160717.163230-17-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114160717.163230-1-alexandru.elisei@arm.com>
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_080815_582194_0C79AC4C 
X-CRM114-Status: GOOD (  14.31  )
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

The VCPU registers are reset during the KVM_ARM_VCPU_INIT ioctl, before
userspace can set the desired SPU. Assume that the VCPU is initialized from
a thread that runs on one of the physical CPUs that correspond to the SPU
that userspace will choose for the VM. Set PMSVer to that CPUs hardware
value.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/include/asm/kvm_spe.h |  6 ++++++
 arch/arm64/kvm/spe.c             | 10 ++++++++++
 arch/arm64/kvm/sys_regs.c        | 10 +++++++++-
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_spe.h b/arch/arm64/include/asm/kvm_spe.h
index 6ce70cf2abaf..5e6d7e609a48 100644
--- a/arch/arm64/include/asm/kvm_spe.h
+++ b/arch/arm64/include/asm/kvm_spe.h
@@ -33,6 +33,8 @@ static __always_inline bool kvm_supports_spe(void)
 void kvm_spe_init_vm(struct kvm *kvm);
 int kvm_spe_vcpu_first_run_init(struct kvm_vcpu *vcpu);
 
+u8 kvm_spe_get_pmsver_limit(void);
+
 int kvm_spe_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
 int kvm_spe_get_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
 int kvm_spe_has_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
@@ -53,6 +55,10 @@ static inline int kvm_spe_vcpu_first_run_init(struct kvm_vcpu *vcpu)
 {
 	return 0;
 }
+static inline u8 kvm_spe_get_pmsver_limit(void)
+{
+	return 0;
+}
 static inline int kvm_spe_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
 {
 	return -ENXIO;
diff --git a/arch/arm64/kvm/spe.c b/arch/arm64/kvm/spe.c
index 6bd074e40f6c..0c4896c6a873 100644
--- a/arch/arm64/kvm/spe.c
+++ b/arch/arm64/kvm/spe.c
@@ -68,6 +68,16 @@ int kvm_spe_vcpu_first_run_init(struct kvm_vcpu *vcpu)
 	return 0;
 }
 
+u8 kvm_spe_get_pmsver_limit(void)
+{
+	unsigned int pmsver;
+
+	pmsver = SYS_FIELD_GET(ID_AA64DFR0_EL1, PMSVer,
+			       read_sanitised_ftr_reg(SYS_ID_AA64DFR0_EL1));
+
+	return min(pmsver, ID_AA64DFR0_EL1_PMSVer_V1P5);
+}
+
 static u64 max_buffer_size_to_pmbidr_el1(u64 size)
 {
 	u64 msb_idx, num_bits;
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index e67eb39ddc11..ac859c39c2be 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -29,6 +29,7 @@
 #include <asm/kvm_hyp.h>
 #include <asm/kvm_mmu.h>
 #include <asm/kvm_nested.h>
+#include <asm/kvm_spe.h>
 #include <asm/perf_event.h>
 #include <asm/sysreg.h>
 
@@ -1652,6 +1653,9 @@ static s64 kvm_arm64_ftr_safe_value(u32 id, const struct arm64_ftr_bits *ftrp,
 		case ID_AA64DFR0_EL1_DebugVer_SHIFT:
 			kvm_ftr.type = FTR_LOWER_SAFE;
 			break;
+		case ID_AA64DFR0_EL1_PMSVer_SHIFT:
+			kvm_ftr.type = FTR_LOWER_SAFE;
+			break;
 		}
 		break;
 	case SYS_ID_DFR0_EL1:
@@ -2021,8 +2025,11 @@ static u64 sanitise_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu, u64 val)
 		val |= SYS_FIELD_PREP(ID_AA64DFR0_EL1, PMUVer,
 				      kvm_arm_pmu_get_pmuver_limit());
 
-	/* Hide SPE from guests */
 	val &= ~ID_AA64DFR0_EL1_PMSVer_MASK;
+	if (vcpu_has_spe(vcpu)) {
+		val |= SYS_FIELD_PREP(ID_AA64DFR0_EL1, PMSVer,
+				      kvm_spe_get_pmsver_limit());
+	}
 
 	/* Hide BRBE from guests */
 	val &= ~ID_AA64DFR0_EL1_BRBE_MASK;
@@ -3209,6 +3216,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	 */
 	ID_FILTERED(ID_AA64DFR0_EL1, id_aa64dfr0_el1,
 		    ID_AA64DFR0_EL1_DoubleLock_MASK |
+		    ID_AA64DFR0_EL1_PMSVer_MASK |
 		    ID_AA64DFR0_EL1_WRPs_MASK |
 		    ID_AA64DFR0_EL1_PMUVer_MASK |
 		    ID_AA64DFR0_EL1_DebugVer_MASK),
-- 
2.51.2


