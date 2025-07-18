Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0B3C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 12:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QPllVCP3rN7C00I5jBr/mTEUkrf4ZR/bhltsFuZDGhI=; b=IDRns0D+3cAEZLMYHcW+8aedtn
	+D47AH+Hj6CU/MG/e61DhtTcx2AqzRZ7sn4eGTz/EScBnHjbBIJS+RcOgiNAnITBEkBl6E5YTE2D5
	f/vNDWa/jYPli2G6URgFpUqdTr40nr7TxZWFJHCEjahHTGON2/7/w5JbjaUt1AhMp9wZ0FUsjYxNS
	KD30abTZByVgAdbXUEL1qqUIMeW+BbX3nz+darkEW04ruKZnfV3fn6QpCNBZAxPUn1yDGsSJM8y18
	EHRnA16p/ByHo7Rmk8Og9mT/CW7CN04EpFryvLlugWvvA8uGZ4GeJ56h2CgolCNQkxmd5QMtbKMmN
	cJTHhJAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uck1Q-0000000CYkq-3Jsw;
	Fri, 18 Jul 2025 12:17:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucj0l-0000000CPBz-0nFh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 11:12:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 40A3B601DD;
	Fri, 18 Jul 2025 11:12:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C290EC4CEEB;
	Fri, 18 Jul 2025 11:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752837137;
	bh=mkewsOyzGITR5BSByRjCXYMXR6P9hcrQIS7Hdni3trc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ir+CXhZgkBDEZntUExHRUHBKxnoRmNESnXpdMhC9HhD40fa7CMC1PauCXyC4/oWiB
	 LcCNlR1XqFItFBKGbQFpP2BAtZN9WtQUQoU94vMQvRsvAHC0w4lg/ngZ7rPodAMCgL
	 DjBeZkGaQQ/wQ/RES753hPDYfSKKg9UoQCKmH05+dJAx8EJTHagB6Keh3NnlPjaJv+
	 Mg2MTdahPKjUvRr1DSb88FH4zmsQeaXKd5RJrk8qT7a7KKzts5ky1G1U64MkvTehIC
	 qXmw2Be3u4GxpROL7O5oiU3RnuP8uvqH1GmqYW11kpVZUKmWxK7SbyC6aYKFHEPx9T
	 A/CylXY4/tnLQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1ucj0h-00Gt2B-A0;
	Fri, 18 Jul 2025 12:12:15 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH 4/4] KVM: arm64: selftest: vgic-v3: Add basic GICv3 sysreg userspace access test
Date: Fri, 18 Jul 2025 12:11:54 +0100
Message-Id: <20250718111154.104029-5-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250718111154.104029-1-maz@kernel.org>
References: <20250718111154.104029-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

We have a lot of more or less useful vgic tests, but none of them
tracks the availability of GICv3 system registers, which is a bit
annoying.

Add one such test, which covers both EL1 and EL2 registers.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 tools/testing/selftests/kvm/arm64/vgic_init.c | 219 +++++++++++++++++-
 1 file changed, 217 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_init.c b/tools/testing/selftests/kvm/arm64/vgic_init.c
index b3b5fb0ff0a9a..7d508dcdbf23d 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_init.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_init.c
@@ -9,6 +9,8 @@
 #include <asm/kvm.h>
 #include <asm/kvm_para.h>
 
+#include <arm64/gic_v3.h>
+
 #include "test_util.h"
 #include "kvm_util.h"
 #include "processor.h"
@@ -18,8 +20,6 @@
 
 #define REG_OFFSET(vcpu, offset) (((uint64_t)vcpu << 32) | offset)
 
-#define GICR_TYPER 0x8
-
 #define VGIC_DEV_IS_V2(_d) ((_d) == KVM_DEV_TYPE_ARM_VGIC_V2)
 #define VGIC_DEV_IS_V3(_d) ((_d) == KVM_DEV_TYPE_ARM_VGIC_V3)
 
@@ -715,6 +715,220 @@ int test_kvm_device(uint32_t gic_dev_type)
 	return 0;
 }
 
+struct sr_def {
+	const char	*name;
+	u32		encoding;
+};
+
+#define PACK_SR(r)						\
+	((sys_reg_Op0(r) << 14) |				\
+	 (sys_reg_Op1(r) << 11) |				\
+	 (sys_reg_CRn(r) << 7) |				\
+	 (sys_reg_CRm(r) << 3) |				\
+	 (sys_reg_Op2(r)))
+
+#define SR(r)							\
+	{							\
+		.name		= #r,				\
+		.encoding	= r,				\
+	}
+
+static const struct sr_def sysregs_el1[] = {
+	SR(SYS_ICC_PMR_EL1),
+	SR(SYS_ICC_BPR0_EL1),
+	SR(SYS_ICC_AP0R0_EL1),
+	SR(SYS_ICC_AP0R1_EL1),
+	SR(SYS_ICC_AP0R2_EL1),
+	SR(SYS_ICC_AP0R3_EL1),
+	SR(SYS_ICC_AP1R0_EL1),
+	SR(SYS_ICC_AP1R1_EL1),
+	SR(SYS_ICC_AP1R2_EL1),
+	SR(SYS_ICC_AP1R3_EL1),
+	SR(SYS_ICC_BPR1_EL1),
+	SR(SYS_ICC_CTLR_EL1),
+	SR(SYS_ICC_SRE_EL1),
+	SR(SYS_ICC_IGRPEN0_EL1),
+	SR(SYS_ICC_IGRPEN1_EL1),
+};
+
+static const struct sr_def sysregs_el2[] = {
+	SR(SYS_ICH_AP0R0_EL2),
+	SR(SYS_ICH_AP0R1_EL2),
+	SR(SYS_ICH_AP0R2_EL2),
+	SR(SYS_ICH_AP0R3_EL2),
+	SR(SYS_ICH_AP1R0_EL2),
+	SR(SYS_ICH_AP1R1_EL2),
+	SR(SYS_ICH_AP1R2_EL2),
+	SR(SYS_ICH_AP1R3_EL2),
+	SR(SYS_ICH_HCR_EL2),
+	SR(SYS_ICC_SRE_EL2),
+	SR(SYS_ICH_VTR_EL2),
+	SR(SYS_ICH_VMCR_EL2),
+	SR(SYS_ICH_LR0_EL2),
+	SR(SYS_ICH_LR1_EL2),
+	SR(SYS_ICH_LR2_EL2),
+	SR(SYS_ICH_LR3_EL2),
+	SR(SYS_ICH_LR4_EL2),
+	SR(SYS_ICH_LR5_EL2),
+	SR(SYS_ICH_LR6_EL2),
+	SR(SYS_ICH_LR7_EL2),
+	SR(SYS_ICH_LR8_EL2),
+	SR(SYS_ICH_LR9_EL2),
+	SR(SYS_ICH_LR10_EL2),
+	SR(SYS_ICH_LR11_EL2),
+	SR(SYS_ICH_LR12_EL2),
+	SR(SYS_ICH_LR13_EL2),
+	SR(SYS_ICH_LR14_EL2),
+	SR(SYS_ICH_LR15_EL2),
+};
+
+static void test_sysreg_array(int gic, const struct sr_def *sr, int nr,
+			      int (*check)(int, const struct sr_def *, const char *))
+{
+	for (int i = 0; i < nr; i++) {
+		u64 val;
+		u64 attr;
+		int ret;
+
+		/* Assume MPIDR_EL1.Aff*=0 */
+		attr = PACK_SR(sr[i].encoding);
+
+		/*
+		 * The API is braindead. A register can be advertised as
+		 * available, and yet not be readable or writable.
+		 * ICC_APnR{1,2,3}_EL1 are examples of such non-sense, and
+		 * ICH_APnR{1,2,3}_EL2 do follow suit for consistency.
+		 *
+		 * On the bright side, no known HW is implementing more than
+		 * 5 bits of priority, so we're safe. Sort of...
+		 */
+		ret = __kvm_has_device_attr(gic, KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS,
+					    attr);
+		TEST_ASSERT(ret == 0, "%s unavailable", sr[i].name);
+
+		/* Check that we can write back what we read */
+		ret = __kvm_device_attr_get(gic, KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS,
+					    attr, &val);
+		TEST_ASSERT(ret == 0 || !check(gic, &sr[i], "read"), "%s unreadable", sr[i].name);
+		ret = __kvm_device_attr_set(gic, KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS,
+					    attr, &val);
+		TEST_ASSERT(ret == 0 || !check(gic, &sr[i], "write"), "%s unwritable", sr[i].name);
+	}
+}
+
+static u8 get_ctlr_pribits(int gic)
+{
+	int ret;
+	u64 val;
+	u8 pri;
+
+	ret = __kvm_device_attr_get(gic, KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS,
+				    PACK_SR(SYS_ICC_CTLR_EL1), &val);
+	TEST_ASSERT(ret == 0, "ICC_CTLR_EL1 unreadable");
+
+	pri = FIELD_GET(ICC_CTLR_EL1_PRI_BITS_MASK, val) + 1;
+	TEST_ASSERT(pri >= 5 && pri <= 7, "Bad pribits %d", pri);
+
+	return pri;
+}
+
+static int check_unaccessible_el1_regs(int gic, const struct sr_def *sr, const char *what)
+{
+	switch (sr->encoding) {
+	case SYS_ICC_AP0R1_EL1:
+	case SYS_ICC_AP1R1_EL1:
+		if (get_ctlr_pribits(gic) >= 6)
+			return -EINVAL;
+		break;
+	case SYS_ICC_AP0R2_EL1:
+	case SYS_ICC_AP0R3_EL1:
+	case SYS_ICC_AP1R2_EL1:
+	case SYS_ICC_AP1R3_EL1:
+		if (get_ctlr_pribits(gic) == 7)
+			return 0;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	pr_info("SKIP %s for %s\n", sr->name, what);
+	return 0;
+}
+
+static u8 get_vtr_pribits(int gic)
+{
+	int ret;
+	u64 val;
+	u8 pri;
+
+	ret = __kvm_device_attr_get(gic, KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS,
+				    PACK_SR(SYS_ICH_VTR_EL2), &val);
+	TEST_ASSERT(ret == 0, "ICH_VTR_EL2 unreadable");
+
+	pri = FIELD_GET(ICH_VTR_EL2_PRIbits, val) + 1;
+	TEST_ASSERT(pri >= 5 && pri <= 7, "Bad pribits %d", pri);
+
+	return pri;
+}
+
+static int check_unaccessible_el2_regs(int gic, const struct sr_def *sr, const char *what)
+{
+	switch (sr->encoding) {
+	case SYS_ICH_AP0R1_EL2:
+	case SYS_ICH_AP1R1_EL2:
+		if (get_vtr_pribits(gic) >= 6)
+			return -EINVAL;
+		break;
+	case SYS_ICH_AP0R2_EL2:
+	case SYS_ICH_AP0R3_EL2:
+	case SYS_ICH_AP1R2_EL2:
+	case SYS_ICH_AP1R3_EL2:
+		if (get_vtr_pribits(gic) == 7)
+			return -EINVAL;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	pr_info("SKIP %s for %s\n", sr->name, what);
+	return 0;
+}
+
+static void test_v3_sysregs(void)
+{
+	struct kvm_vcpu_init init = {};
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	u32 feat = 0;
+	int gic;
+
+	if (kvm_check_cap(KVM_CAP_ARM_EL2))
+		feat |= BIT(KVM_ARM_VCPU_HAS_EL2);
+
+	vm = vm_create(1);
+
+	vm_ioctl(vm, KVM_ARM_PREFERRED_TARGET, &init);
+	init.features[0] |= feat;
+
+	vcpu = aarch64_vcpu_add(vm, 0, &init, NULL);
+	TEST_ASSERT(vcpu, "Can't create a vcpu?");
+
+	gic = kvm_create_device(vm, KVM_DEV_TYPE_ARM_VGIC_V3);
+	TEST_ASSERT(gic >= 0, "No GIC???");
+
+	kvm_device_attr_set(gic, KVM_DEV_ARM_VGIC_GRP_CTRL,
+			    KVM_DEV_ARM_VGIC_CTRL_INIT, NULL);
+
+	test_sysreg_array(gic, sysregs_el1, ARRAY_SIZE(sysregs_el1), check_unaccessible_el1_regs);
+	if (feat)
+		test_sysreg_array(gic, sysregs_el2, ARRAY_SIZE(sysregs_el2), check_unaccessible_el2_regs);
+	else
+		pr_info("SKIP EL2 registers, not available\n");
+
+	close(gic);
+	kvm_vm_free(vm);
+}
+
 void run_tests(uint32_t gic_dev_type)
 {
 	test_vcpus_then_vgic(gic_dev_type);
@@ -730,6 +944,7 @@ void run_tests(uint32_t gic_dev_type)
 		test_v3_last_bit_single_rdist();
 		test_v3_redist_ipa_range_check_at_vcpu_run();
 		test_v3_its_region();
+		test_v3_sysregs();
 	}
 }
 
-- 
2.39.2


