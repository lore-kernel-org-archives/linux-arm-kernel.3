Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04714C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 18:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=amKNxxzUeViOk51zJOZcbxy0m9EKEBmNEdChg+G2/50=; b=zMp6Q1QMVy0Lufi7q/WbnPMBV3
	rQJqhH4DLFYKDCHPV2jvHdsO9hnbTjNH2Wp4+SYvcHABLZ9QIPaFpBUd3nlNSWgzCElSrgpKWbeGq
	j8RNFg6nKwMaspGDsFn9KeptfS7AdmEAaU6iqenQw2uUD5WjxzmSdZXtmDYFk9KVp6P1Ezh9SRtAe
	vS4lvva5PjLAIbI0/cqlhMiHc6NBSGuNlExWbwYzIs7i4Y7NjMO2bCViwfQfs7L1uU5BzC+c8bWz1
	U0IjSsP2lLZeUr83yIyk/ZJsEdg5ylj+4k3e7DTMB1bkDWfGSawB5aj0OccqS3AAO+2g00DLh/lF1
	0TrkSVeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttss6-00000000TcM-1y1y;
	Sun, 16 Mar 2025 18:38:02 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttsaF-00000000S9j-46fq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 18:19:37 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso554042766b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Mar 2025 11:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742149174; x=1742753974; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=amKNxxzUeViOk51zJOZcbxy0m9EKEBmNEdChg+G2/50=;
        b=aR7664eeww+Rre3l2f+gC7TUysuZD7VidtNcNQ9389If6QUz//50rNSyHGxKXnjyIs
         w9xuSH7eMmzByrPjmhE66OC9lkwQVst/dR0q02AnP692i4OScjH2e8LC5HEAzTmCMk5s
         jlkN4MhZdo//JEevAihkByXNLvFx3c98CMUqyoA3mVax8W91Bb2w6a6SZ8Q7VE/udAHC
         m+IFDRLDTNWgmY1U6grlsgGSqmu4E3iDNZnNM9ZfL9uC1JVcIuOrn/OEwN9goFtXh+i1
         RO+UEs2vKeMk/T+7dJBq1g2fnQ7PttYxcvkCn8yJwtcS7KvIES8dXdBF/Jynk31GqTir
         WF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742149174; x=1742753974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=amKNxxzUeViOk51zJOZcbxy0m9EKEBmNEdChg+G2/50=;
        b=PsHRrCES4ZdQWEtTAdGqYSAAeyOMzx2hGsN0F1n+OzAanCr/sWmBqYf+KGpqknIVex
         m+DtTizuvoEoBMKD9H8/DM6uwztin3wl5sn5wlRJ1qocb9zsffMsX2MBpw/n/A44TEnK
         OEbBTxZA3keXDmr2NoDByQfTMi00DTEitkZUeRdxSLAdWM2xoEjlYBO7/EsG3qI9OdLZ
         Ceu5fetAnB+XAIg0qIZiRC6D0dTNY7/xopnqCb7R3UTltXb2SYBgMl7vlD8r8OVvFO2n
         QTf+bmo/PkqPW2jrhgAa1e17du9Dxv+y6MWlJinMSKpAzyA1O+VyoKQAYCtCmMvtSMms
         bNOA==
X-Forwarded-Encrypted: i=1; AJvYcCUazG9EQVcrycC+LaoY8HxJw3WlP0nq+IQCXceoaHDt3jUJ4B1g0MRpMgEcM+43+5/V8ErEmuFQxunRP11ULQWQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzZcRKpw5+hhR8N2fh/Qxl2JUYIE7JPC9oDkdk/5qkuXHOhghse
	9bLpHcCIqvAkmNyw9q4P20MLCMNABEqU9thYBPygmxoUUs6ms7c5
X-Gm-Gg: ASbGncuVYGc7GE/eJhYtN3eaVuVsbP+NPiEMM/qPbFOlaR7ggoGHPOyQm2T38yrXjuE
	VLEz4nFeA4xWMT0+qKel7STm63+2FvOsMAtPQxdJEPYX5f6MR09fVLHSUYWL+WzLMkAYxrVhCKO
	EUg7ZSr5XsqDrLNYdrL32uRKMAmJFxg9CxePOj04fMNL73d/M+8s9M7OeKQYzzSHT7I7YS+xbhj
	TmG4UqkIW2jEknZiloXiddVSDIMAt6eicbP5fWWzxmZzMZavhYYlIxWlhx/8A7SppxgKIFRlPPt
	DL4VBknpQOX7GWPsTTosJODdvUTf2R3ysosepVLywvj2DG4Q6JAoH/Ty6SLlMypcMQWn6sXPXYn
	OVJp127FJ371NXH76cA==
X-Google-Smtp-Source: AGHT+IGoRJAKltltcbINqhFsAUE2+2go4TuA+ktyXtsviYbQJ4PGOLYMnjgdTcwc1M6oBU/H5rXicg==
X-Received: by 2002:a17:907:9712:b0:ac3:f06:d221 with SMTP id a640c23a62f3a-ac3301e1c7fmr1140524266b.3.1742149174052;
        Sun, 16 Mar 2025 11:19:34 -0700 (PDT)
Received: from hex.my.domain (83.11.178.210.ipv4.supernova.orange.pl. [83.11.178.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a48b51sm537951266b.149.2025.03.16.11.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 11:19:33 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sun, 16 Mar 2025 19:18:58 +0100
Subject: [PATCH v7 10/10] regulator: bcm590xx: Add support for BCM59054
 regulators
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250316-bcm59054-v7-10-4281126be1b8@gmail.com>
References: <20250316-bcm59054-v7-0-4281126be1b8@gmail.com>
In-Reply-To: <20250316-bcm59054-v7-0-4281126be1b8@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742149152; l=17812;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=LP/C5IojHuNw7vhHpiuPpAUrBkJdBS43MpQdBCqEy2s=;
 b=WbuhX2cwPuPqfsZkX4CublsQ/s8DTGRSVhp9OiL5gnx4PjXCXfADLruMAVuhInULId4bz1JVB
 EKHkxK3R80eA+9/BpdgTbcY/Iiag34YWdk8WjLF8M+osMQqlAK8BoBu
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_111936_030081_E8A6A7BB 
X-CRM114-Status: GOOD (  16.99  )
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

The BCM59056 and BCM59054 are very similar in terms of regulators. Add
the register definitions for the BCM59054 and enable support for it in
the driver.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v6:
- dev_type -> pmu_id conversion, rev_ana -> rev_analog rename

Changes in v5:
- Adapt to regmap type enum being moved/value names being renamed
- Adapt to rename of bcm590xx_reg_info to bcm590xx_reg_data

Changes in v4:
- Lock MICLDO at 1.8v to match vendor kernel behavior
- Set different voltage table for VSR based on PMU revision
- Fix incorrect table being used for LVLDO1
- Add missing newline to "unknown device type" error message

Changes in v3:
- Adapt to regulator info being moved to tables
---
 drivers/regulator/bcm590xx-regulator.c | 649 ++++++++++++++++++++++++++++++++-
 1 file changed, 647 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/bcm590xx-regulator.c b/drivers/regulator/bcm590xx-regulator.c
index f35b2b72e46f70496e16be5244529a5d95d0546d..50414f4cb10958bb33a9fcfa5ed5aaecde9d0715 100644
--- a/drivers/regulator/bcm590xx-regulator.c
+++ b/drivers/regulator/bcm590xx-regulator.c
@@ -52,6 +52,17 @@ static const struct regulator_ops bcm590xx_ops_ldo = {
 	.map_voltage		= regulator_map_voltage_iterate,
 };
 
+/*
+ * LDO ops without voltage selection, used for MICLDO on BCM59054.
+ * (These are currently the same as VBUS ops, but will be different
+ * in the future once full PMMODE support is implemented.)
+ */
+static const struct regulator_ops bcm590xx_ops_ldo_novolt = {
+	.is_enabled		= regulator_is_enabled_regmap,
+	.enable			= regulator_enable_regmap,
+	.disable		= regulator_disable_regmap,
+};
+
 static const struct regulator_ops bcm590xx_ops_dcdc = {
 	.is_enabled		= regulator_is_enabled_regmap,
 	.enable			= regulator_enable_regmap,
@@ -106,6 +117,13 @@ static const struct regulator_ops bcm590xx_ops_vbus = {
 #define BCM59056_SR_DESC(_name, _name_lower, _ranges)			\
 	BCM590XX_SR_DESC(BCM59056, bcm59056, _name, _name_lower, _ranges)
 
+#define BCM59054_REG_DESC(_name, _name_lower)				\
+	BCM590XX_REG_DESC(BCM59054, _name, _name_lower)
+#define BCM59054_LDO_DESC(_name, _name_lower, _table)			\
+	BCM590XX_LDO_DESC(BCM59054, bcm59054, _name, _name_lower, _table)
+#define BCM59054_SR_DESC(_name, _name_lower, _ranges)			\
+	BCM590XX_SR_DESC(BCM59054, bcm59054, _name, _name_lower, _ranges)
+
 /* BCM59056 data */
 
 /* I2C slave 0 registers */
@@ -466,6 +484,617 @@ static const struct bcm590xx_reg_data bcm59056_regs[BCM59056_NUM_REGS] = {
 	},
 };
 
+/* BCM59054 data */
+
+/* I2C slave 0 registers */
+#define BCM59054_RFLDOPMCTRL1	0x60
+#define BCM59054_CAMLDO1PMCTRL1	0x62
+#define BCM59054_CAMLDO2PMCTRL1	0x64
+#define BCM59054_SIMLDO1PMCTRL1	0x66
+#define BCM59054_SIMLDO2PMCTRL1	0x68
+#define BCM59054_SDLDOPMCTRL1	0x6a
+#define BCM59054_SDXLDOPMCTRL1	0x6c
+#define BCM59054_MMCLDO1PMCTRL1	0x6e
+#define BCM59054_MMCLDO2PMCTRL1	0x70
+#define BCM59054_AUDLDOPMCTRL1	0x72
+#define BCM59054_MICLDOPMCTRL1	0x74
+#define BCM59054_USBLDOPMCTRL1	0x76
+#define BCM59054_VIBLDOPMCTRL1	0x78
+#define BCM59054_IOSR1PMCTRL1	0x7a
+#define BCM59054_IOSR2PMCTRL1	0x7c
+#define BCM59054_CSRPMCTRL1	0x7e
+#define BCM59054_SDSR1PMCTRL1	0x82
+#define BCM59054_SDSR2PMCTRL1	0x86
+#define BCM59054_MMSRPMCTRL1	0x8a
+#define BCM59054_VSRPMCTRL1	0x8e
+#define BCM59054_RFLDOCTRL	0x96
+#define BCM59054_CAMLDO1CTRL	0x97
+#define BCM59054_CAMLDO2CTRL	0x98
+#define BCM59054_SIMLDO1CTRL	0x99
+#define BCM59054_SIMLDO2CTRL	0x9a
+#define BCM59054_SDLDOCTRL	0x9b
+#define BCM59054_SDXLDOCTRL	0x9c
+#define BCM59054_MMCLDO1CTRL	0x9d
+#define BCM59054_MMCLDO2CTRL	0x9e
+#define BCM59054_AUDLDOCTRL	0x9f
+#define BCM59054_MICLDOCTRL	0xa0
+#define BCM59054_USBLDOCTRL	0xa1
+#define BCM59054_VIBLDOCTRL	0xa2
+#define BCM59054_CSRVOUT1	0xc0
+#define BCM59054_IOSR1VOUT1	0xc3
+#define BCM59054_IOSR2VOUT1	0xc6
+#define BCM59054_MMSRVOUT1	0xc9
+#define BCM59054_SDSR1VOUT1	0xcc
+#define BCM59054_SDSR2VOUT1	0xcf
+#define BCM59054_VSRVOUT1	0xd2
+
+/* I2C slave 1 registers */
+#define BCM59054_LVLDO1PMCTRL1	0x16
+#define BCM59054_LVLDO2PMCTRL1	0x18
+#define BCM59054_GPLDO1CTRL	0x1a
+#define BCM59054_GPLDO2CTRL	0x1b
+#define BCM59054_GPLDO3CTRL	0x1c
+#define BCM59054_TCXLDOCTRL	0x1d
+#define BCM59054_LVLDO1CTRL	0x1e
+#define BCM59054_LVLDO2CTRL	0x1f
+#define BCM59054_OTG_CTRL	0x40
+#define BCM59054_GPLDO1PMCTRL1	0x57
+#define BCM59054_GPLDO2PMCTRL1	0x59
+#define BCM59054_GPLDO3PMCTRL1	0x5b
+#define BCM59054_TCXLDOPMCTRL1	0x5d
+
+/*
+ * RFLDO to VSR regulators are
+ * accessed via I2C slave 0
+ */
+
+/* LDO regulator IDs */
+#define BCM59054_REG_RFLDO	0
+#define BCM59054_REG_CAMLDO1	1
+#define BCM59054_REG_CAMLDO2	2
+#define BCM59054_REG_SIMLDO1	3
+#define BCM59054_REG_SIMLDO2	4
+#define BCM59054_REG_SDLDO	5
+#define BCM59054_REG_SDXLDO	6
+#define BCM59054_REG_MMCLDO1	7
+#define BCM59054_REG_MMCLDO2	8
+#define BCM59054_REG_AUDLDO	9
+#define BCM59054_REG_MICLDO	10
+#define BCM59054_REG_USBLDO	11
+#define BCM59054_REG_VIBLDO	12
+
+/* DCDC regulator IDs */
+#define BCM59054_REG_CSR	13
+#define BCM59054_REG_IOSR1	14
+#define BCM59054_REG_IOSR2	15
+#define BCM59054_REG_MMSR	16
+#define BCM59054_REG_SDSR1	17
+#define BCM59054_REG_SDSR2	18
+#define BCM59054_REG_VSR	19
+
+/*
+ * GPLDO1 to VBUS regulators are
+ * accessed via I2C slave 1
+ */
+
+#define BCM59054_REG_GPLDO1	20
+#define BCM59054_REG_GPLDO2	21
+#define BCM59054_REG_GPLDO3	22
+#define BCM59054_REG_TCXLDO	23
+#define BCM59054_REG_LVLDO1	24
+#define BCM59054_REG_LVLDO2	25
+#define BCM59054_REG_VBUS	26
+
+#define BCM59054_NUM_REGS	27
+
+/* LDO group 1: supported voltages in microvolts */
+static const unsigned int bcm59054_ldo_1_table[] = {
+	1200000, 1800000, 2500000, 2700000, 2800000,
+	2900000, 3000000, 3300000,
+};
+
+/* LDO group 2: supported voltages in microvolts */
+static const unsigned int bcm59054_ldo_2_table[] = {
+	3100000, 1800000, 2500000, 2700000, 2800000,
+	2900000, 3000000, 3300000,
+};
+
+/* LDO group 3: supported voltages in microvolts */
+static const unsigned int bcm59054_ldo_3_table[] = {
+	1000000, 1107000, 1143000, 1214000, 1250000,
+	1464000, 1500000, 1786000,
+};
+
+/* DCDC group SR: supported voltages in microvolts */
+static const struct linear_range bcm59054_dcdc_sr_ranges[] = {
+	REGULATOR_LINEAR_RANGE(0, 0, 1, 0),
+	REGULATOR_LINEAR_RANGE(860000, 2, 60, 10000),
+	REGULATOR_LINEAR_RANGE(1500000, 61, 61, 0),
+	REGULATOR_LINEAR_RANGE(1800000, 62, 62, 0),
+	REGULATOR_LINEAR_RANGE(900000, 63, 63, 0),
+};
+
+/* DCDC group VSR (BCM59054A1): supported voltages in microvolts */
+static const struct linear_range bcm59054_dcdc_vsr_a1_ranges[] = {
+	REGULATOR_LINEAR_RANGE(0, 0, 1, 0),
+	REGULATOR_LINEAR_RANGE(860000, 2, 59, 10000),
+	REGULATOR_LINEAR_RANGE(1700000, 60, 60, 0),
+	REGULATOR_LINEAR_RANGE(1500000, 61, 61, 0),
+	REGULATOR_LINEAR_RANGE(1800000, 62, 62, 0),
+	REGULATOR_LINEAR_RANGE(1600000, 63, 63, 0),
+};
+
+/* DCDC group CSR: supported voltages in microvolts */
+static const struct linear_range bcm59054_dcdc_csr_ranges[] = {
+	REGULATOR_LINEAR_RANGE(700000, 0, 1, 100000),
+	REGULATOR_LINEAR_RANGE(860000, 2, 60, 10000),
+	REGULATOR_LINEAR_RANGE(900000, 61, 63, 0),
+};
+
+static const struct bcm590xx_reg_data bcm59054_regs[BCM59054_NUM_REGS] = {
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(RFLDO, rfldo, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(CAMLDO1, camldo1, ldo_2_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(CAMLDO2, camldo2, ldo_2_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(SIMLDO1, simldo1, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(SIMLDO2, simldo2, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(SDLDO, sdldo, ldo_2_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(SDXLDO, sdxldo, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(MMCLDO1, mmcldo1, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(MMCLDO2, mmcldo2, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(AUDLDO, audldo, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_REG_DESC(MICLDO, micldo),
+			.ops = &bcm590xx_ops_ldo_novolt,
+			/* MICLDO is locked at 1.8V */
+			.n_voltages = 1,
+			.fixed_uV = 1800000,
+			.enable_reg = BCM59054_MICLDOPMCTRL1,
+			.enable_mask = BCM590XX_REG_ENABLE,
+			.enable_is_inverted = true,
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(USBLDO, usbldo, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(VIBLDO, vibldo, ldo_2_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_SR_DESC(CSR, csr, dcdc_csr_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_SR_DESC(IOSR1, iosr1, dcdc_sr_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_SR_DESC(IOSR2, iosr2, dcdc_sr_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_SR_DESC(MMSR, mmsr, dcdc_sr_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_SR_DESC(SDSR1, sdsr1, dcdc_sr_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_SR_DESC(SDSR2, sdsr2, dcdc_sr_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_SR_DESC(VSR, vsr, dcdc_sr_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_GPLDO,
+		.regmap = BCM590XX_REGMAP_SEC,
+		.desc = {
+			BCM59054_LDO_DESC(GPLDO1, gpldo1, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_GPLDO,
+		.regmap = BCM590XX_REGMAP_SEC,
+		.desc = {
+			BCM59054_LDO_DESC(GPLDO2, gpldo2, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_GPLDO,
+		.regmap = BCM590XX_REGMAP_SEC,
+		.desc = {
+			BCM59054_LDO_DESC(GPLDO3, gpldo3, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_GPLDO,
+		.regmap = BCM590XX_REGMAP_SEC,
+		.desc = {
+			BCM59054_LDO_DESC(TCXLDO, tcxldo, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_GPLDO,
+		.regmap = BCM590XX_REGMAP_SEC,
+		.desc = {
+			BCM59054_LDO_DESC(LVLDO1, lvldo1, ldo_3_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_GPLDO,
+		.regmap = BCM590XX_REGMAP_SEC,
+		.desc = {
+			BCM59054_LDO_DESC(LVLDO2, lvldo2, ldo_3_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_VBUS,
+		.regmap = BCM590XX_REGMAP_SEC,
+		.desc = {
+			BCM59054_REG_DESC(VBUS, vbus),
+			.ops = &bcm590xx_ops_vbus,
+			.n_voltages = 1,
+			.fixed_uV = 5000000,
+			.enable_reg = BCM59054_OTG_CTRL,
+			.enable_mask = BCM590XX_VBUS_ENABLE,
+		},
+	},
+};
+
+/*
+ * BCM59054A1 regulators; same as previous revision, but with different
+ * VSR voltage table.
+ */
+static const struct bcm590xx_reg_data bcm59054_a1_regs[BCM59054_NUM_REGS] = {
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(RFLDO, rfldo, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(CAMLDO1, camldo1, ldo_2_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(CAMLDO2, camldo2, ldo_2_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(SIMLDO1, simldo1, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(SIMLDO2, simldo2, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(SDLDO, sdldo, ldo_2_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(SDXLDO, sdxldo, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(MMCLDO1, mmcldo1, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(MMCLDO2, mmcldo2, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(AUDLDO, audldo, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_REG_DESC(MICLDO, micldo),
+			.ops = &bcm590xx_ops_ldo_novolt,
+			/* MICLDO is locked at 1.8V */
+			.n_voltages = 1,
+			.fixed_uV = 1800000,
+			.enable_reg = BCM59054_MICLDOPMCTRL1,
+			.enable_mask = BCM590XX_REG_ENABLE,
+			.enable_is_inverted = true,
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(USBLDO, usbldo, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(VIBLDO, vibldo, ldo_2_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_SR_DESC(CSR, csr, dcdc_csr_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_SR_DESC(IOSR1, iosr1, dcdc_sr_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_SR_DESC(IOSR2, iosr2, dcdc_sr_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_SR_DESC(MMSR, mmsr, dcdc_sr_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_SR_DESC(SDSR1, sdsr1, dcdc_sr_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_SR_DESC(SDSR2, sdsr2, dcdc_sr_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM59054_SR_DESC(VSR, vsr, dcdc_vsr_a1_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_GPLDO,
+		.regmap = BCM590XX_REGMAP_SEC,
+		.desc = {
+			BCM59054_LDO_DESC(GPLDO1, gpldo1, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_GPLDO,
+		.regmap = BCM590XX_REGMAP_SEC,
+		.desc = {
+			BCM59054_LDO_DESC(GPLDO2, gpldo2, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_GPLDO,
+		.regmap = BCM590XX_REGMAP_SEC,
+		.desc = {
+			BCM59054_LDO_DESC(GPLDO3, gpldo3, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_GPLDO,
+		.regmap = BCM590XX_REGMAP_SEC,
+		.desc = {
+			BCM59054_LDO_DESC(TCXLDO, tcxldo, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_GPLDO,
+		.regmap = BCM590XX_REGMAP_SEC,
+		.desc = {
+			BCM59054_LDO_DESC(LVLDO1, lvldo1, ldo_3_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_GPLDO,
+		.regmap = BCM590XX_REGMAP_SEC,
+		.desc = {
+			BCM59054_LDO_DESC(LVLDO2, lvldo2, ldo_3_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_VBUS,
+		.regmap = BCM590XX_REGMAP_SEC,
+		.desc = {
+			BCM59054_REG_DESC(VBUS, vbus),
+			.ops = &bcm590xx_ops_vbus,
+			.n_voltages = 1,
+			.fixed_uV = 5000000,
+			.enable_reg = BCM59054_OTG_CTRL,
+			.enable_mask = BCM590XX_VBUS_ENABLE,
+		},
+	},
+};
+
 static int bcm590xx_probe(struct platform_device *pdev)
 {
 	struct bcm590xx *bcm590xx = dev_get_drvdata(pdev->dev.parent);
@@ -480,8 +1109,24 @@ static int bcm590xx_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	pmu->mfd = bcm590xx;
-	pmu->n_regulators = BCM59056_NUM_REGS;
-	pmu->regs = bcm59056_regs;
+
+	switch (pmu->mfd->pmu_id) {
+	case BCM590XX_PMUID_BCM59054:
+		pmu->n_regulators = BCM59054_NUM_REGS;
+		if (pmu->mfd->rev_analog == BCM59054_REV_ANALOG_A1)
+			pmu->regs = bcm59054_a1_regs;
+		else
+			pmu->regs = bcm59054_regs;
+		break;
+	case BCM590XX_PMUID_BCM59056:
+		pmu->n_regulators = BCM59056_NUM_REGS;
+		pmu->regs = bcm59056_regs;
+		break;
+	default:
+		dev_err(bcm590xx->dev,
+			"unknown device type, could not initialize\n");
+		return -EINVAL;
+	}
 
 	platform_set_drvdata(pdev, pmu);
 

-- 
2.48.1


