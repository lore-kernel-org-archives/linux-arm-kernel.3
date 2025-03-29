Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE19C36010
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Mar 2025 03:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gubgaoNfqjw0eIO+mQbh9QtxLuc2yJNKDLZbI4YuNX4=; b=xt5Sc3jjjYZXi72PAAb8cNYzud
	OXayVFH5J91ByObzqXBeiSscRu+uFgtuSmo8ZT5MNBGJSODtRxKwb1dL7500PTQ0fetTc/aepD0AU
	whbqOflMQDd4R9KHXSYAC+Pv0EO1+NDdV16uKm7OKJuOrpI3HxKguqjMhI6jF+Q7YGatx60HfI63C
	IwPcQtmazobIGvsfqpzpAbmRQEUS0gbLqo6GO0t/UfiW5l3XwOg5MRA3DWovtZWRezWGfzofKpUgJ
	X2kaDjJ3yDdGY8ENmC/0kY483A9g2XRqHBVxXpJOmfIAyX/Ur4WuTQ790XsMfcCKZhUoSXOwylcoF
	Nb4UoqPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyNDy-0000000EfGa-2TVz;
	Sat, 29 Mar 2025 03:51:10 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyN79-0000000Eeus-0FZq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Mar 2025 03:44:09 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4ZPjpY3x3WzHrJR;
	Sat, 29 Mar 2025 11:40:37 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id F3BB11403D2;
	Sat, 29 Mar 2025 11:43:55 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Sat, 29 Mar 2025 11:43:55 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <maz@kernel.org>,
	<oliver.upton@linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>
CC: <joey.gouly@arm.com>, <suzuki.poulose@arm.com>,
	<shameerali.kolothum.thodi@huawei.com>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>, <yangyicong@hisilicon.com>,
	<linuxarm@huawei.com>
Subject: [PATCH 2/3] arm64/cpufeature: Add cpucap for HCR_EL2.E2H RES1 (!FEAT_E2H0)
Date: Sat, 29 Mar 2025 11:44:08 +0800
Message-ID: <20250329034409.21354-3-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20250329034409.21354-1-yangyicong@huawei.com>
References: <20250329034409.21354-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_204407_425169_28EE3ACA 
X-CRM114-Status: GOOD (  13.06  )
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

From: Yicong Yang <yangyicong@hisilicon.com>

Arm introduced a "new" feature FEAT_E2H0 indicates that HCR_EL2.E2H can
be programmed to the value 0 for legacy hardwares supported VHE. The
feature is indicated by ID_AA64MMFR4_EL1.E2H0 == 0. It is needed to
detect this feature for KVM mode initialization. Instead of bothering
the existed hardwares, introduce a new cpucap HAS_E2H_RES1 to indicate
FEAT_E2H0 is not supported. Make this a ARM64_CPUCAP_SYSTEM_FEATURE
just like VHE.

Introduce cpu_has_e2h_res1() for checking the feature's support
which can be used in the early boot stage where CPU capabilities
are not initialized.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 arch/arm64/include/asm/cpufeature.h | 23 +++++++++++++++++++++++
 arch/arm64/kernel/cpufeature.c      | 12 ++++++++++++
 arch/arm64/tools/cpucaps            |  1 +
 3 files changed, 36 insertions(+)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index c4326f1cb917..b35d393da28d 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -889,6 +889,29 @@ static inline bool cpu_has_hw_af(void)
 						ID_AA64MMFR1_EL1_HAFDBS_SHIFT);
 }
 
+/*
+ * Check whether FEAT_E2H0 is not supported, in which case HCR_EL2.E2H
+ * is implemented as RES1.
+ */
+static __always_inline bool cpu_has_e2h_res1(void)
+{
+	u64 mmfr4;
+	u32 val;
+
+	/*
+	 * It's also used for checking the kvm mode cfg in early_param()
+	 * where boot capabilities is not initialized. In such case read
+	 * mmfr4 directly. This works same after boot stage since
+	 * ARM64_HAS_E2H_RES1 is a system feature, the cached sanitised
+	 * value keeps same with every single CPU.
+	 */
+	mmfr4 = read_sysreg_s(SYS_ID_AA64MMFR4_EL1);
+	val = cpuid_feature_extract_signed_field(mmfr4,
+						 ID_AA64MMFR4_EL1_E2H0_SHIFT);
+
+	return val != ID_AA64MMFR4_EL1_E2H0_IMP;
+}
+
 static inline bool cpu_has_pan(void)
 {
 	u64 mmfr1 = read_cpuid(ID_AA64MMFR1_EL1);
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 75ef319c1ef8..64e99330b380 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2473,6 +2473,12 @@ test_has_mpam_hcr(const struct arm64_cpu_capabilities *entry, int scope)
 	return idr & MPAMIDR_EL1_HAS_HCR;
 }
 
+static bool
+has_e2h_res1(const struct arm64_cpu_capabilities *entry, int __unused)
+{
+	return cpu_has_e2h_res1();
+}
+
 static const struct arm64_cpu_capabilities arm64_features[] = {
 	{
 		.capability = ARM64_ALWAYS_BOOT,
@@ -3043,6 +3049,12 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.matches = has_pmuv3,
 	},
 #endif
+	{
+		.desc = "HCR_EL2.E2H RES1",
+		.capability = ARM64_HAS_E2H_RES1,
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.matches = has_e2h_res1,
+	},
 	{},
 };
 
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 772c1b008e43..dd6631886d67 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -22,6 +22,7 @@ HAS_DCPODP
 HAS_DCPOP
 HAS_DIT
 HAS_E0PD
+HAS_E2H_RES1
 HAS_ECV
 HAS_ECV_CNTPOFF
 HAS_EPAN
-- 
2.24.0


