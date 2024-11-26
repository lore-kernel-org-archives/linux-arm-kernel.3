Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D0DD3B9A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 15:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XXwb9Wr0Su9+Y87AEoos6zK3eLNLue2M3gBuqsgW1So=; b=v/QOroBsMkuJHxKiAkAjphu6hI
	sWYTvKp6YFCejut9y1epPj9p9dwSDbfBASqWe+lP4sDqXQ7MG/JZYg/w+ixonLs5EEAS95JVBe4QH
	e9u8U8fL7aPflG6OiEinqB1ZtlicYowS1hV0i5pgxw+v0Gp+0n5V3dTLoGWx9BHxRxMy7aZYF4SD7
	Gx0QwKhxWT/fTLijrWv0uX7hmOFPT3Nrw8O35YgbmWe2W2660DfxLNSzMlFZFeWfy5WkaiCXO5XzW
	qDwqk+xsdJQZHWWtHUnxK6a4YfshGg0V9LN4GnEPgM3ZXA2vuuU4zYdOb4xEmWEgDaw3G6qNNtzOs
	Ax2/KWUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFxjK-0000000B2iX-0lRg;
	Tue, 26 Nov 2024 15:43:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFxff-0000000B28Y-1E5y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 15:40:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 817261A00;
	Tue, 26 Nov 2024 07:40:40 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D5C003F5A1;
	Tue, 26 Nov 2024 07:40:09 -0800 (PST)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	mark.rutland@arm.com
Subject: [BOOT-WRAPPER PATCH 3/3] aarch64: Enable use of GCS for EL2 and below
Date: Tue, 26 Nov 2024 15:39:55 +0000
Message-Id: <20241126153955.477569-4-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241126153955.477569-1-mark.rutland@arm.com>
References: <20241126153955.477569-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_074011_384694_B4FFF88F 
X-CRM114-Status: GOOD (  12.91  )
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

FEAT_GCS adds a number of new system registers and instructions. Usage
of some of these can trap to EL3 unless SCR_EL3.GCSEn is set, and so
boot-wrapper support is necessary.

Support for FEAT_GCS was added to Linux in the v6.13-rc1 merge window
without any boot-wrapper support. Consequently when GCS is enabled in a
model, the kernel will hang when attempting to write to GCS control
registers, which happens early in boot when the kernel configures EL2,
before any console output is produced.

FEAT_GCS is described in the latest ARM ARM (ARM DDI 0487K.a), which can
be found at:

  https://developer.arm.com/documentation/ddi0487/ka/?lang=en

Add boot-wrapper support for FEAT_GCS. In addition to setting
SCR_EL3.GCSEn, it's necessary to initialize GCSCR_EL2, GCSCR_EL1, and
GCSCRE0_EL1 such that older kernel which are not aware of GCS don't find
GCS enabled unexpectedly.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Mark Brown <broonie@kernel.org>
---
 arch/aarch64/include/asm/cpu.h | 6 ++++++
 arch/aarch64/init.c            | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/aarch64/include/asm/cpu.h b/arch/aarch64/include/asm/cpu.h
index 3ef58f3..4cf0ff7 100644
--- a/arch/aarch64/include/asm/cpu.h
+++ b/arch/aarch64/include/asm/cpu.h
@@ -62,6 +62,7 @@
 #define SCR_EL3_ECVEN			BIT(28)
 #define SCR_EL3_TME			BIT(34)
 #define SCR_EL3_HXEn			BIT(38)
+#define SCR_EL3_GCSEn			BIT(39)
 #define SCR_EL3_EnTP2			BIT(41)
 #define SCR_EL3_RCWMASKEn		BIT(42)
 #define SCR_EL3_TCR2EN			BIT(43)
@@ -115,6 +116,7 @@
 #define ID_AA64PFR1_EL1_MTE		BITS(11, 8)
 #define ID_AA64PFR1_EL1_SME		BITS(27, 24)
 #define ID_AA64PFR1_EL1_CSV2_frac	BITS(35, 32)
+#define ID_AA64PFR1_EL1_GCS		BITS(47, 44)
 #define ID_AA64PFR1_EL1_THE		BITS(51, 48)
 
 #define ID_AA64PFR2_EL1			s3_0_c0_c4_2
@@ -169,6 +171,10 @@
 #define SMCR_EL3_FA64		BIT(31)
 #define SMCR_EL3_LEN_MAX	0xf
 
+#define GCSCRE0_EL1		s3_0_c2_c5_2
+#define GCSCR_EL1		s3_0_c2_c5_0
+#define GCSCR_EL2		s3_4_c2_c5_0
+
 #define ID_AA64ISAR2_EL1	s3_0_c0_c6_2
 
 #define ID_AA64MMFR3_EL1	s3_0_c0_c7_3
diff --git a/arch/aarch64/init.c b/arch/aarch64/init.c
index 1f38516..61b55f9 100644
--- a/arch/aarch64/init.c
+++ b/arch/aarch64/init.c
@@ -124,6 +124,13 @@ static void cpu_init_el3(void)
 	if (mrs_field(ID_AA64PFR1_EL1, THE))
 		scr |= SCR_EL3_RCWMASKEn;
 
+	if (mrs_field(ID_AA64PFR1_EL1, GCS)) {
+		scr |= SCR_EL3_GCSEn;
+		msr(GCSCR_EL2, 0);
+		msr(GCSCR_EL1, 0);
+		msr(GCSCRE0_EL1, 0);
+	}
+
 	if (mrs_field(ID_AA64PFR2_EL1, FPMR))
 		scr |= SCR_EL3_EnFPM;
 
-- 
2.30.2


