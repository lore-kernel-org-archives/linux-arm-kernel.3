Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3283C2A06C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Jan 2026 13:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=35k2Qius4SFCnV/aj/qYOl0lTPhCwV+oICdVuqJczm4=; b=29i+Bs+OF1nfOmscuglMBRfxep
	Oi7+Sua8R/Zp1cxpOZizIwRX3xkt+vigA7NgXLWT1/jWI1+l/Piy3nPT9DGzj+F2iGbHhhERCaHku
	k6g3M+Ufr2m1cbIKZ6IaTG+G679gnUF5BHHl4cGWMWlyY+AtCqI7+DUakYnDrM8rnGUASnym84Hwo
	NLWeAbAHnFlrJTST7AmVTqUW7eWZ4Aq/J+9qxpx1LNT8c/Ik6aiLT2Ic8tTQF/fA0QT4YLaedTebq
	QbcxXVF4N/8vMCKTBCKGAzsC8HNufmmtg110bKEBt1bifPicr6tz+5+8GuZ0V/ohDzE0pZVK81nRr
	J/5wEv/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcOGB-0000000AG77-0lzG;
	Sun, 04 Jan 2026 13:35:07 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcOG8-0000000AG5s-1Viz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Jan 2026 13:35:06 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=35k2Qius4SFCnV/aj/qYOl0lTPhCwV+oICdVuqJczm4=;
	b=QJDPpwCj/f1x6vJ/sxE/k8xds5nH1n4hpcvGDKbgDLB6GSMUiEEPFiHzSKwlzwf/CzT1nsg4p
	c241toTjDFCKwx4K82z1AsKDjPqn1OrtCV8AJCxMjboQJrm1wTMv+0ttJJG3BqkFGM7hjQ7IIEa
	LzNhvN2HR72wYK7GkJtiHcY=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4dkdcc6RDNzmVB1;
	Sun,  4 Jan 2026 21:31:28 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 3606740565;
	Sun,  4 Jan 2026 21:34:43 +0800 (CST)
Received: from huawei.com (10.50.87.109) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Sun, 4 Jan
 2026 21:34:42 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <miko.lenczewski@arm.com>,
	<thuth@redhat.com>, <mark.rutland@arm.com>, <yeoreum.yun@arm.com>,
	<robh@kernel.org>, <james.clark@linaro.org>, <ahmed.genidi@arm.com>,
	<xry111@xry111.site>, <oupton@kernel.org>, <lpieralisi@kernel.org>,
	<catalin.marinas@arm.com>, <mrigendra.chaubey@gmail.com>,
	<suzuki.poulose@arm.com>, <maz@kernel.org>, <ardb@kernel.org>,
	<broonie@kernel.org>, <will@kernel.org>, <kevin.brodsky@arm.com>,
	<leo.yan@arm.com>, <anshuman.khandual@arm.com>,
	<yang@os.amperecomputing.com>, <frederic@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<bobo.shaobowang@huawei.com>
Subject: [PATCH] arm64: cpufeature: Add support for the MPAM v0.1 architecture version
Date: Sun, 4 Jan 2026 21:34:34 +0800
Message-ID: <20260104133434.1887677-1-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.87.109]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_053505_092755_E38531C6 
X-CRM114-Status: GOOD (  15.93  )
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

According to the MPAM spec [1], the supported architecture versions are
v1.0, v1.1 and v0.1. MPAM versions v0.1 and v1.1 are functionally
identical, but v0.1 additionally supports the FORCE_NS feature.

ID_AA64PR | ID_AA64PR | MPAM Extension | Notes
F0_EL1.   | F1_EL1.   | Architecture   |
MPAM      | MPAM_frac | version        |
---------------------------------------------------------------------------
0b0000    | 0b0001    | v0.1           | MPAM v0.1 is implemented.
          |           |                | MPAM v0.1 is the same as MPAM v1.1
          |           |                | with FORCE_NS which is
          |           |                | incompatible with MPAM v1.0.
---------------------------------------------------------------------------
0b0001    | 0b0000    | v1.0           | MPAM v1.0 is implemented.
---------------------------------------------------------------------------
0b0001    | 0b0001    | v1.1           | MPAM v1.1 is implemented.
          |           |                | MPAM v1.1 includes all features of
          |           |                | MPAM v1.0.
          |           |                | It must not include FORCE_NS.

FORCE_NS is a feature that operates in EL3 mode. Consequently, the current
Linux MPAM driver is also compatible with MPAM v0.1. To support v0.1, the
existing driver which only checks ID_AA64PFR0_EL1.MPAM for the major
version needs to examine ID_AA64PFR1_EL1.MPAM_frac for the minor version
as well.

[1] https://developer.arm.com/documentation/ddi0598/db/?lang=en

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 arch/arm64/include/asm/cpufeature.h |  7 +++++++
 arch/arm64/include/asm/el2_setup.h  |  4 +++-
 arch/arm64/kernel/cpufeature.c      | 15 +++++++++++----
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index 4de51f8d92cb..a57870fa96db 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -620,6 +620,13 @@ static inline bool id_aa64pfr0_mpam(u64 pfr0)
 	return val > 0;
 }
 
+static inline bool id_aa64pfr1_mpamfrac(u64 pfr1)
+{
+	u32 val = cpuid_feature_extract_unsigned_field(pfr1, ID_AA64PFR1_EL1_MPAM_frac_SHIFT);
+
+	return val > 0;
+}
+
 static inline bool id_aa64pfr1_mte(u64 pfr1)
 {
 	u32 val = cpuid_feature_extract_unsigned_field(pfr1, ID_AA64PFR1_EL1_MTE_SHIFT);
diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index cacd20df1786..606cf14e4044 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -501,7 +501,9 @@
 #endif
 
 .macro finalise_el2_state
-	check_override id_aa64pfr0, ID_AA64PFR0_EL1_MPAM_SHIFT, .Linit_mpam_\@, .Lskip_mpam_\@, x1, x2
+	check_override id_aa64pfr0, ID_AA64PFR0_EL1_MPAM_SHIFT, .Linit_mpam_\@, .Lmpam_minor_\@, x1, x2
+.Lmpam_minor_\@:
+	check_override id_aa64pfr1, ID_AA64PFR1_EL1_MPAM_frac_SHIFT, .Linit_mpam_\@, .Lskip_mpam_\@, x1, x2
 
 .Linit_mpam_\@:
 	msr_s	SYS_MPAM2_EL2, xzr		// use the default partition
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index c840a93b9ef9..e8fa6f7cf2a2 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1159,6 +1159,14 @@ static __init void detect_system_supports_pseudo_nmi(void)
 static inline void detect_system_supports_pseudo_nmi(void) { }
 #endif
 
+static bool detect_ftr_has_mpam(void)
+{
+	u64 pfr0 = read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1);
+	u64 pfr1 = read_sanitised_ftr_reg(SYS_ID_AA64PFR1_EL1);
+
+	return id_aa64pfr0_mpam(pfr0) || id_aa64pfr1_mpamfrac(pfr1);
+}
+
 void __init init_cpu_features(struct cpuinfo_arm64 *info)
 {
 	/* Before we start using the tables, make sure it is sorted */
@@ -1206,7 +1214,7 @@ void __init init_cpu_features(struct cpuinfo_arm64 *info)
 		cpacr_restore(cpacr);
 	}
 
-	if (id_aa64pfr0_mpam(read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1))) {
+	if (detect_ftr_has_mpam()) {
 		info->reg_mpamidr = read_cpuid(MPAMIDR_EL1);
 		init_cpu_ftr_reg(SYS_MPAMIDR_EL1, info->reg_mpamidr);
 	}
@@ -1462,7 +1470,7 @@ void update_cpu_features(int cpu,
 		cpacr_restore(cpacr);
 	}
 
-	if (id_aa64pfr0_mpam(read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1))) {
+	if (detect_ftr_has_mpam()) {
 		info->reg_mpamidr = read_cpuid(MPAMIDR_EL1);
 		taint |= check_update_ftr_reg(SYS_MPAMIDR_EL1, cpu,
 					info->reg_mpamidr, boot->reg_mpamidr);
@@ -2473,7 +2481,7 @@ cpucap_panic_on_conflict(const struct arm64_cpu_capabilities *cap)
 static bool
 test_has_mpam(const struct arm64_cpu_capabilities *entry, int scope)
 {
-	if (!has_cpuid_feature(entry, scope))
+	if (!detect_ftr_has_mpam())
 		return false;
 
 	/* Check firmware actually enabled MPAM on this cpu. */
@@ -3078,7 +3086,6 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.capability = ARM64_MPAM,
 		.matches = test_has_mpam,
 		.cpu_enable = cpu_enable_mpam,
-		ARM64_CPUID_FIELDS(ID_AA64PFR0_EL1, MPAM, 1)
 	},
 	{
 		.desc = "Memory Partitioning And Monitoring Virtualisation",
-- 
2.25.1


