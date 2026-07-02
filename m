Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B523C44507
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jlKRqeuAHeiHYifY33jkifn9qRcM+UmxYlbf8Yr05cs=; b=N0YmCI7NF7ATnGCfJ9rMPN9R4u
	2lIZ9u5ZxzNpzvAt0Zbk94YdUy1lSBMKbnEgGO9P7vpXsx/YAkp+Ux9MCzX60BcyJOlBXYaWHV60A
	P8x4kl7b6X/hd/bWffjwxWyJiQFEum0kVlcskii1Dba6MkIz0NLVC3qj5S7PJwOu/6X1a/hN8zfBx
	J2SnanDxA5pitVNdZKbAp5hMrVM6dRud9MvYxZhuc56/PrbfMT2g1RRxO+iZWS2/NUkl83sWmLkgn
	DdYL2zXbGc3OuvQ1TCD+q6Q0JkV9WTDhXZ0rOqsu1CLih3ln4GAaeLQ4hJAkbMVk/DXUryd5vDojP
	j+jdlnmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsg-00000004ue4-41BF;
	Thu, 02 Jul 2026 16:03:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsX-00000004uIb-47Z0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 16:03:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9CAAC40AC7;
	Thu,  2 Jul 2026 16:03:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82B771F0155D;
	Thu,  2 Jul 2026 16:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783008185;
	bh=jlKRqeuAHeiHYifY33jkifn9qRcM+UmxYlbf8Yr05cs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Y3XgsiaF+BDaDucvqw2+1J6+OQI+cApN0VtERQJv7UQOsnO5EZCUMm3uhMMY++0Iv
	 A94XfxWMl1WQzXRsAH2L0u8V/+2iTumSNkzDFaG2E2pfAiBFHX19Bao7FAs7+CPjzw
	 YJS2bdWlRZ4oe7eYshByzqdQRgkc88acihLsY51cwlzjQYg1wK8xCILP8xaF55sWoj
	 83GLaPyS7z9nz8FGXtBZBMudAFD7vY6vE4vIOHD1D+D058JQowq6wrWqjm/8PsxApe
	 CCJ1E6sN2uvmKhNt0gwRhdS3LvimRMYn4hz0Fbucfsub3WMtyl9rXRerkF2ctnZPGn
	 CG4NVRqvqP8Og==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wfJsV-00000000ojd-3SJC;
	Thu, 02 Jul 2026 16:03:03 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 28/28] arm64: Add override for ID_AA64MMFR4_EL1.NV_frac
Date: Thu,  2 Jul 2026 17:02:48 +0100
Message-ID: <20260702160248.1377250-29-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702160248.1377250-1-maz@kernel.org>
References: <20260702160248.1377250-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
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

In a very unsurprising turn of events, there is a large class of
firmware that is totally unable to deal with FEAT_NV3, and doesn't
set the required SCR2_EL3.NV3En bit, leading to an UNDEF exception
or an unhandled trap to EL3, depending on the implementation.

Allow the unfortunate user to override ID_AA64MMFR4_EL1.NV_frac
and get a working system. Hopefully firmware will be fixed before
actually HW ships, but I have been there before... :-/

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/cpufeature.h   |  1 +
 arch/arm64/kernel/cpufeature.c        |  4 +++-
 arch/arm64/kernel/image-vars.h        |  1 +
 arch/arm64/kernel/pi/idreg-override.c | 10 ++++++++++
 4 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index a57870fa96db5..a42683af79fb5 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -968,6 +968,7 @@ struct arm64_ftr_reg *get_arm64_ftr_reg(u32 sys_id);
 extern struct arm64_ftr_override id_aa64mmfr0_override;
 extern struct arm64_ftr_override id_aa64mmfr1_override;
 extern struct arm64_ftr_override id_aa64mmfr2_override;
+extern struct arm64_ftr_override id_aa64mmfr4_override;
 extern struct arm64_ftr_override id_aa64pfr0_override;
 extern struct arm64_ftr_override id_aa64pfr1_override;
 extern struct arm64_ftr_override id_aa64zfr0_override;
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 6ae1c816e2010..14fbfa8e6b7b5 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -785,6 +785,7 @@ static const struct arm64_ftr_bits ftr_raz[] = {
 struct arm64_ftr_override __read_mostly id_aa64mmfr0_override;
 struct arm64_ftr_override __read_mostly id_aa64mmfr1_override;
 struct arm64_ftr_override __read_mostly id_aa64mmfr2_override;
+struct arm64_ftr_override __read_mostly id_aa64mmfr4_override;
 struct arm64_ftr_override __read_mostly id_aa64pfr0_override;
 struct arm64_ftr_override __read_mostly id_aa64pfr1_override;
 struct arm64_ftr_override __read_mostly id_aa64zfr0_override;
@@ -858,7 +859,8 @@ static const struct __ftr_reg_entry {
 	ARM64_FTR_REG_OVERRIDE(SYS_ID_AA64MMFR2_EL1, ftr_id_aa64mmfr2,
 			       &id_aa64mmfr2_override),
 	ARM64_FTR_REG(SYS_ID_AA64MMFR3_EL1, ftr_id_aa64mmfr3),
-	ARM64_FTR_REG(SYS_ID_AA64MMFR4_EL1, ftr_id_aa64mmfr4),
+	ARM64_FTR_REG_OVERRIDE(SYS_ID_AA64MMFR4_EL1, ftr_id_aa64mmfr4,
+			       &id_aa64mmfr4_override),
 
 	/* Op1 = 0, CRn = 10, CRm = 4 */
 	ARM64_FTR_REG(SYS_MPAMIDR_EL1, ftr_mpamidr),
diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index d4c7d45ae6bc8..d15c2cb1b0f28 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -51,6 +51,7 @@ PI_EXPORT_SYM(id_aa64isar2_override);
 PI_EXPORT_SYM(id_aa64mmfr0_override);
 PI_EXPORT_SYM(id_aa64mmfr1_override);
 PI_EXPORT_SYM(id_aa64mmfr2_override);
+PI_EXPORT_SYM(id_aa64mmfr4_override);
 PI_EXPORT_SYM(id_aa64pfr0_override);
 PI_EXPORT_SYM(id_aa64pfr1_override);
 PI_EXPORT_SYM(id_aa64smfr0_override);
diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
index bc57b290e5e7b..4e47616bcac23 100644
--- a/arch/arm64/kernel/pi/idreg-override.c
+++ b/arch/arm64/kernel/pi/idreg-override.c
@@ -106,6 +106,15 @@ static const struct ftr_set_desc mmfr2 __prel64_initconst = {
 	},
 };
 
+static const struct ftr_set_desc mmfr4 __prel64_initconst = {
+	.name		= "id_aa64mmfr4",
+	.override	= &id_aa64mmfr4_override,
+	.fields		= {
+		FIELD("nv_frac", ID_AA64MMFR4_EL1_NV_frac_SHIFT, NULL),
+		{}
+	},
+};
+
 static bool __init pfr0_sve_filter(u64 val)
 {
 	/*
@@ -220,6 +229,7 @@ PREL64(const struct ftr_set_desc, reg) regs[] __prel64_initconst = {
 	{ &mmfr0	},
 	{ &mmfr1	},
 	{ &mmfr2	},
+	{ &mmfr4	},
 	{ &pfr0 	},
 	{ &pfr1 	},
 	{ &isar1	},
-- 
2.47.3


