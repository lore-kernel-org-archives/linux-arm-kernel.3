Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B4DC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 14:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mAfYRb1T6G29hzIpEHo9jVHkiJJjtzpQh/U6sQZy24M=; b=pvk+n4RjqzfnZbIHw7W2v1vN10
	2/7SF7vjPd8dRvUtbfwu8UsgZyhCO/85JPS0pTHzgmUP3KUL35UfJmrq87xP057OUYEAskv9nJ3wv
	GZRRU03pB0qmTymd+oCN0Q7c5nletb/IqLoerlONwHR4SX8ar44Nd1SO9aBnaREcloLA8s2OIua45
	e9aBc9qjkoTjv/yeC27MLdIcwnpziTAQWZF2G7eAlnR4b7f1g78M86NA/2sLJdPOTVE6MI8/OfPAj
	Ij3SnUL3rr/blJXm7Xnza/BTOgveBJpk46wmkDnBY/Fz1vSsgqUF9LdUZav382qVqwoBbVkNF4K77
	yFLnNSqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlTyi-00000005oaH-30RR;
	Fri, 21 Feb 2025 14:26:08 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlTj5-00000005lNx-36k7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 14:10:01 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YzsRN65mhz6HJhN;
	Fri, 21 Feb 2025 22:08:16 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 54BAE140134;
	Fri, 21 Feb 2025 22:09:58 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 21 Feb 2025 15:09:50 +0100
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <kvmarm@lists.linux.dev>, <maz@kernel.org>, <oliver.upton@linux.dev>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<cohuck@redhat.com>, <eric.auger@redhat.com>, <sebott@redhat.com>,
	<yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
	<jonathan.cameron@huawei.com>, <anthony.jebson@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linuxarm@huawei.com>
Subject: [PATCH v8 6/6] KVM: selftests: Add test for KVM_REG_ARM_VENDOR_HYP_BMAP_2
Date: Fri, 21 Feb 2025 14:02:29 +0000
Message-ID: <20250221140229.12588-7-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20250221140229.12588-1-shameerali.kolothum.thodi@huawei.com>
References: <20250221140229.12588-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.203.177.241]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_061000_064706_CFD5AEA0 
X-CRM114-Status: GOOD (  18.33  )
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

One difference here with other pseudo-firmware bitmap registers
is that the default/reset value for the supported hypercall
function-ids is 0 at present. Hence, modify the test accordingly.

Reviewed-by: Sebastian Ott <sebott@redhat.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 tools/arch/arm64/include/uapi/asm/kvm.h       | 12 +++++
 .../selftests/kvm/arm64/get-reg-list.c        |  1 +
 .../testing/selftests/kvm/arm64/hypercalls.c  | 46 +++++++++++++++----
 3 files changed, 49 insertions(+), 10 deletions(-)

diff --git a/tools/arch/arm64/include/uapi/asm/kvm.h b/tools/arch/arm64/include/uapi/asm/kvm.h
index 66736ff04011..6d44f8c8a18f 100644
--- a/tools/arch/arm64/include/uapi/asm/kvm.h
+++ b/tools/arch/arm64/include/uapi/asm/kvm.h
@@ -374,6 +374,7 @@ enum {
 #endif
 };
 
+/* Vendor hyper call function numbers 0-63 */
 #define KVM_REG_ARM_VENDOR_HYP_BMAP		KVM_REG_ARM_FW_FEAT_BMAP_REG(2)
 
 enum {
@@ -384,6 +385,17 @@ enum {
 #endif
 };
 
+/* Vendor hyper call function numbers 64-127 */
+#define KVM_REG_ARM_VENDOR_HYP_BMAP_2		KVM_REG_ARM_FW_FEAT_BMAP_REG(3)
+
+enum {
+	KVM_REG_ARM_VENDOR_HYP_BIT_DISCOVER_IMPL_VER	= 0,
+	KVM_REG_ARM_VENDOR_HYP_BIT_DISCOVER_IMPL_CPUS	= 1,
+#ifdef __KERNEL__
+	KVM_REG_ARM_VENDOR_HYP_BMAP_2_BIT_COUNT,
+#endif
+};
+
 /* Device Control API on vm fd */
 #define KVM_ARM_VM_SMCCC_CTRL		0
 #define   KVM_ARM_VM_SMCCC_FILTER	0
diff --git a/tools/testing/selftests/kvm/arm64/get-reg-list.c b/tools/testing/selftests/kvm/arm64/get-reg-list.c
index d43fb3f49050..d01798b6b3b4 100644
--- a/tools/testing/selftests/kvm/arm64/get-reg-list.c
+++ b/tools/testing/selftests/kvm/arm64/get-reg-list.c
@@ -332,6 +332,7 @@ static __u64 base_regs[] = {
 	KVM_REG_ARM_FW_FEAT_BMAP_REG(0),	/* KVM_REG_ARM_STD_BMAP */
 	KVM_REG_ARM_FW_FEAT_BMAP_REG(1),	/* KVM_REG_ARM_STD_HYP_BMAP */
 	KVM_REG_ARM_FW_FEAT_BMAP_REG(2),	/* KVM_REG_ARM_VENDOR_HYP_BMAP */
+	KVM_REG_ARM_FW_FEAT_BMAP_REG(3),	/* KVM_REG_ARM_VENDOR_HYP_BMAP_2 */
 	ARM64_SYS_REG(3, 3, 14, 3, 1),	/* CNTV_CTL_EL0 */
 	ARM64_SYS_REG(3, 3, 14, 3, 2),	/* CNTV_CVAL_EL0 */
 	ARM64_SYS_REG(3, 3, 14, 0, 2),
diff --git a/tools/testing/selftests/kvm/arm64/hypercalls.c b/tools/testing/selftests/kvm/arm64/hypercalls.c
index ec54ec7726e9..44cfcf8a7f46 100644
--- a/tools/testing/selftests/kvm/arm64/hypercalls.c
+++ b/tools/testing/selftests/kvm/arm64/hypercalls.c
@@ -21,22 +21,31 @@
 #define KVM_REG_ARM_STD_BMAP_BIT_MAX		0
 #define KVM_REG_ARM_STD_HYP_BMAP_BIT_MAX	0
 #define KVM_REG_ARM_VENDOR_HYP_BMAP_BIT_MAX	1
+#define KVM_REG_ARM_VENDOR_HYP_BMAP_2_BIT_MAX   1
+
+#define KVM_REG_ARM_STD_BMAP_RESET_VAL		FW_REG_ULIMIT_VAL(KVM_REG_ARM_STD_BMAP_BIT_MAX)
+#define KVM_REG_ARM_STD_HYP_BMAP_RESET_VAL	FW_REG_ULIMIT_VAL(KVM_REG_ARM_STD_HYP_BMAP_BIT_MAX)
+#define KVM_REG_ARM_VENDOR_HYP_BMAP_RESET_VAL	FW_REG_ULIMIT_VAL(KVM_REG_ARM_VENDOR_HYP_BMAP_BIT_MAX)
+#define KVM_REG_ARM_VENDOR_HYP_BMAP_2_RESET_VAL 0
 
 struct kvm_fw_reg_info {
 	uint64_t reg;		/* Register definition */
 	uint64_t max_feat_bit;	/* Bit that represents the upper limit of the feature-map */
+	uint64_t reset_val;	/* Reset value for the register */
 };
 
 #define FW_REG_INFO(r)			\
 	{					\
 		.reg = r,			\
 		.max_feat_bit = r##_BIT_MAX,	\
+		.reset_val = r##_RESET_VAL	\
 	}
 
 static const struct kvm_fw_reg_info fw_reg_info[] = {
 	FW_REG_INFO(KVM_REG_ARM_STD_BMAP),
 	FW_REG_INFO(KVM_REG_ARM_STD_HYP_BMAP),
 	FW_REG_INFO(KVM_REG_ARM_VENDOR_HYP_BMAP),
+	FW_REG_INFO(KVM_REG_ARM_VENDOR_HYP_BMAP_2),
 };
 
 enum test_stage {
@@ -171,22 +180,39 @@ static void test_fw_regs_before_vm_start(struct kvm_vcpu *vcpu)
 
 	for (i = 0; i < ARRAY_SIZE(fw_reg_info); i++) {
 		const struct kvm_fw_reg_info *reg_info = &fw_reg_info[i];
+		uint64_t set_val;
 
-		/* First 'read' should be an upper limit of the features supported */
+		/* First 'read' should be the reset value for the reg  */
 		val = vcpu_get_reg(vcpu, reg_info->reg);
-		TEST_ASSERT(val == FW_REG_ULIMIT_VAL(reg_info->max_feat_bit),
-			"Expected all the features to be set for reg: 0x%lx; expected: 0x%lx; read: 0x%lx",
-			reg_info->reg, FW_REG_ULIMIT_VAL(reg_info->max_feat_bit), val);
+		TEST_ASSERT(val == reg_info->reset_val,
+			"Unexpected reset value for reg: 0x%lx; expected: 0x%lx; read: 0x%lx",
+			reg_info->reg, reg_info->reset_val, val);
+
+		if (reg_info->reset_val)
+			set_val = 0;
+		else
+			set_val = FW_REG_ULIMIT_VAL(reg_info->max_feat_bit);
 
-		/* Test a 'write' by disabling all the features of the register map */
-		ret = __vcpu_set_reg(vcpu, reg_info->reg, 0);
+		ret = __vcpu_set_reg(vcpu, reg_info->reg, set_val);
 		TEST_ASSERT(ret == 0,
-			"Failed to clear all the features of reg: 0x%lx; ret: %d",
-			reg_info->reg, errno);
+			"Failed to %s all the features of reg: 0x%lx; ret: %d",
+			(set_val ? "set" : "clear"), reg_info->reg, errno);
 
 		val = vcpu_get_reg(vcpu, reg_info->reg);
-		TEST_ASSERT(val == 0,
-			"Expected all the features to be cleared for reg: 0x%lx", reg_info->reg);
+		TEST_ASSERT(val == set_val,
+			"Expected all the features to be %s for reg: 0x%lx",
+			(set_val ? "set" : "cleared"), reg_info->reg);
+
+		/*
+		 * If the reg has been set, clear it as test_fw_regs_after_vm_start()
+		 * expects it to be cleared.
+		 */
+		if (set_val) {
+			ret = __vcpu_set_reg(vcpu, reg_info->reg, 0);
+			TEST_ASSERT(ret == 0,
+			"Failed to clear all the features of reg: 0x%lx; ret: %d",
+			reg_info->reg, errno);
+		}
 
 		/*
 		 * Test enabling a feature that's not supported.
-- 
2.47.0


