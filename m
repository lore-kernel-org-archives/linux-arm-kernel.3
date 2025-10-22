Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62432CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 10:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hFTKRB3EpCnke2ZmkBBVmSfA6Ud8FcONu4B97qhnZT8=; b=1HuXOVWKp5Gnb7m5vuspm3gFGf
	SZUONeevEErFjMsF4bEIbEZJDIX3H69pL+oBFb4x2K+kHICVBawxAkpyzIKxNitkhKkK+k4HJCpZI
	U7fTX4FvsG86ZC8e9MFOf6t6SeAX9iyc3nfBtF80UCzOaGgOdDl1Ka5mdAqecsQcF9t4Oa0QPCfVv
	IgkWpA1F3UGO70io/gHEhwmPk3sU3ZZ5q3/+JwWiE0gKB/bSMdlHbdipl+MVKlFs3kpsKHgHZcbz4
	exqWWMtzT1rt8pfIyelsdp0o+wH3a2HwBcJdoTGMDM1OndrOH4bjh4fLkf+f1JooPI9B8fkjelIRX
	MXL8m0Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBW28-00000002TzW-2dUy;
	Wed, 22 Oct 2025 10:25:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBW23-00000002Txq-2qfQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 10:25:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 228E11BD0;
	Wed, 22 Oct 2025 03:25:19 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.33.8.67])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C4E33F63F;
	Wed, 22 Oct 2025 03:25:26 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Dave Martin <dave.martin@arm.com>
Subject: [boot-wrapper PATCH 3/4] aarch64: enable access to HACDBS and HDBSS system registers
Date: Wed, 22 Oct 2025 11:25:02 +0100
Message-Id: <20251022102503.2878048-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251022102503.2878048-1-andre.przywara@arm.com>
References: <20251022102503.2878048-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_032527_763020_59A6D55D 
X-CRM114-Status: UNSURE (   8.05  )
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

ARMv9.5 introduced FEAT_HAFDBS and FEAT_HACBDS, both of which introduce
system registers accessible from EL1 and EL2. Access to them is guarded
by SCR_EL3 control bits HDBSSEn and HACDBSEn.

Since boot-wrapper has no business in limiting those features or trapping
access to those register, set the no-trap bits in SCR_EL3, if we detect
the respective CPU feature bits.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/aarch64/include/asm/cpu.h | 6 ++++++
 arch/aarch64/init.c            | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/aarch64/include/asm/cpu.h b/arch/aarch64/include/asm/cpu.h
index 1d86c23..9c794be 100644
--- a/arch/aarch64/include/asm/cpu.h
+++ b/arch/aarch64/include/asm/cpu.h
@@ -83,6 +83,8 @@
 #define SCR_EL3_EnFPM			BIT(50)
 #define SCR_EL3_PFAREn			BIT(53)
 #define SCR_EL3_FGTEN2			BIT(59)
+#define SCR_EL3_HDBSSEn			BIT(60)
+#define SCR_EL3_HACDBSEn		BIT(61)
 
 #define VTCR_EL2_MSA			BIT(31)
 
@@ -113,6 +115,7 @@
 #define ID_AA64MMFR0_EL1_FGT		BITS(59, 56)
 #define ID_AA64MMFR0_EL1_ECV		BITS(63, 60)
 
+#define ID_AA64MMFR1_EL1_HAFDBS		BITS(3, 0)
 #define ID_AA64MMFR1_EL1_HCX		BITS(43, 40)
 
 #define ID_AA64MMFR3_EL1_TCRX		BITS(3, 0)
@@ -124,6 +127,9 @@
 #define ID_AA64MMFR3_EL1_AIE		BITS(27, 24)
 #define ID_AA64MMFR3_EL1_D128		BITS(35, 32)
 
+#define ID_AA64MMFR4_EL1		s3_0_c0_c7_4
+#define ID_AA64MMFR4_EL1_HACDBS		BITS(15, 12)
+
 #define ID_AA64PFR0_EL1_RAS		BITS(31, 28)
 #define ID_AA64PFR0_EL1_SVE		BITS(35, 32)
 #define ID_AA64PFR0_EL1_MPAM		BITS(43, 40)
diff --git a/arch/aarch64/init.c b/arch/aarch64/init.c
index 004149f..05637d4 100644
--- a/arch/aarch64/init.c
+++ b/arch/aarch64/init.c
@@ -142,6 +142,12 @@ static void cpu_init_el3(void)
 	if (mrs_field(ID_AA64PFR1_EL1, PFAR))
 		scr |= SCR_EL3_PFAREn;
 
+	if (mrs_field(ID_AA64MMFR4_EL1, HACDBS))
+		scr |= SCR_EL3_HACDBSEn;
+
+	if (mrs_field(ID_AA64MMFR1_EL1, HAFDBS) >= 4)
+		scr |= SCR_EL3_HDBSSEn;
+
 	msr(SCR_EL3, scr);
 
 	msr(CPTR_EL3, cptr);
-- 
2.25.1


