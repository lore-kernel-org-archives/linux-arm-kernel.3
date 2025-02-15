Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06065C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 09:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=npj1EmujK4Rc80WdjHAmlETUDGFaqlJvXT146PAmYzc=; b=mqBSfzh+5iLcSHstlJNMUJzTjg
	PioTn9azVLyTH8MCewHV6neAllGwTvYi1nH7ifjgEBkvgUWuZ4uUMqdvoWAksEdXGGWzFOinXZfc5
	iyCyPRWfFUeFQd9SbsorgxXWmlohlwOFF7zRnAaWOBqQ4CLgq6udaSxTIu+wv6RmE9au9+dFLlMcA
	YXWXBhEzxnWJMfxXxvylklXfqRZGRbXLs0D33QX2re1wKqaO0hht/6Af53Kc2FMJMGtbsoFQsKcrh
	YKz5UIV5985WiOVBpHkHhwDvkGdgCOvcRqPwbHgii6xQkWNJOwRvDr5si0v1FKTM2zGScpCRCICu1
	4fJn+Q8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjEsY-0000000HNeQ-0qLS;
	Sat, 15 Feb 2025 09:54:30 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjEea-0000000HLgb-3GAR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 09:40:05 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5de4a8b4f86so4015720a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Feb 2025 01:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739612403; x=1740217203; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=npj1EmujK4Rc80WdjHAmlETUDGFaqlJvXT146PAmYzc=;
        b=GhOL2I63TTWfym0/oxkt363YyJGSDGj2zhn1QxVNsU7dzsqgFxaee0Zt/J6K0VAe8h
         hQtbqtq/9A73oO1J4D2bqyKGNko/cP4M3qOtpbLPFeWVHo98fIZhCR/SDo5z33ZQvXlZ
         BJk4nuGxleppgsCfE+P6U9MRHV6rCxxbM44lx3za41C/eAilOMM0SdYlpAb35tcF6++q
         l/ASasSnvSdtY3fBRfxHR3T1EVP2a6EpzWjoiKVLHAeNaJvRum/Ku/9wpr7qnk6FKlF5
         eGNv+ZtXAZrEYp1M5HG/7VyZeOUk+AaU18sS3/NXth9JNtAB5iR0z5x2651jcpKZxlM0
         tz4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739612403; x=1740217203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=npj1EmujK4Rc80WdjHAmlETUDGFaqlJvXT146PAmYzc=;
        b=iY5DjCTFx8GHw8jB3OfqvndfXW8NGveeo94UGbO8bHhEPsDJ8giYdSJXsz7RIYA8gO
         fxZmn3uBq9rWGc4XQfVzUq7c4E1w++6qG4S3s5Il+5jipb8ZlkAiJZ9Krwd+S4fJBwHs
         SzPxgh2UNK/k+hPz/D2uqrHZa0wZKtFcFBjeF9Yp+jNDjgSCgrc2EUM4ghp9n7AMfkEj
         TLCf0KRZ+8FkvpoO5jxDPAJXpG6S6V6+uuVepdwfXc+TU2MMpKCi9P80WAI+0CYv/NXR
         Vd2ngR6l6LdFU0htGLyv4naHUM4mO0Go5zuhuJ0lOwxBsxgnQWentfMFmakaNdAkppac
         KmTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXY2rN20jhcpPMC825jR0g/68aoQdfGLOSeBbIDp80DvHHWJmpjEYa/xkK28DrwKpBA9IICVo/siJ4yDRbwpgz7@lists.infradead.org
X-Gm-Message-State: AOJu0YyZs6ldypfAwui6JVeXvHkrixCQNKqdk3mCH1eG7RPp/+tXtnMe
	IaAQDkHfkCi+QJUFSOjPEngQjVF9WRj+QjMQ3ztv7FmX4WeE56/s
X-Gm-Gg: ASbGnctAtY12qj6xfOLUvXlTL1xQVVYXHFq2MgvDR8wlabjAKmRYRA9eXU32OP9ihlQ
	eqGYi6/2+we4Ty85JGW4RkBFKOpmul7ElgpwD+x2+UTsjLLivofnlNrJhecmydfXOwxhvLlRwwo
	7fEy9SPi9y5OMkI/O9WvMjjdgzMXueShSgJHnV/7+68CZRaRN88l74f5ycq+g41Jl3sRdHXv4my
	5oV9BSdloXmeHgKkmfNczWFsCzD9cAmJYpQWK6cOMhtOnieUOkmEkr7Vzj3XWo4xRkMJQKrFnnY
	iGtckrtS+kiLHwRrLfcc+U1FgIllJgc8PBoMGJfJDNEFFmz4nG504sfup8ScLQ==
X-Google-Smtp-Source: AGHT+IHhDJG2OKgZ99OHjaCv4S3GetWFGXNgYX3dY3ZP8clYIIVo+CT6TdzwkUJH+sTSHnORJS8f2g==
X-Received: by 2002:a17:907:9709:b0:ab7:d87f:665b with SMTP id a640c23a62f3a-abb70de2845mr171847766b.48.1739612402824;
        Sat, 15 Feb 2025 01:40:02 -0800 (PST)
Received: from hex.my.domain (83.8.115.239.ipv4.supernova.orange.pl. [83.8.115.239])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb7aecd3d5sm69698966b.148.2025.02.15.01.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 01:40:02 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sat, 15 Feb 2025 10:39:44 +0100
Subject: [PATCH v4 9/9] regulator: bcm590xx: Add support for BCM59054
 regulators
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250215-bcm59054-v4-9-dbfb2d76a855@gmail.com>
References: <20250215-bcm59054-v4-0-dbfb2d76a855@gmail.com>
In-Reply-To: <20250215-bcm59054-v4-0-dbfb2d76a855@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739612381; l=17777;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=K+fEAI3FKWYtSLQxgtsc7acLnt2h/zJjYMsxJYC7FvU=;
 b=w42oWHqXVrvZa9ig1clVS9YpIcWWfgPeiaoyn+ogV6opHAsQBRE+m5yMrFL0Os5vpJEbmOTHJ
 rFwLoOm9h9fBtRX/E4w4gf0Iw4Sey+s/BMiu/e3M5cB9BwsL5uLmvGC
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_014004_826638_5D5E131A 
X-CRM114-Status: GOOD (  17.03  )
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
index ccae8f82999b0af085eb40dc31227d345e41462b..d03edf8c411b8e86201a23b97df8897955c3234d 100644
--- a/drivers/regulator/bcm590xx-regulator.c
+++ b/drivers/regulator/bcm590xx-regulator.c
@@ -57,6 +57,17 @@ static const struct regulator_ops bcm590xx_ops_ldo = {
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
@@ -111,6 +122,13 @@ static const struct regulator_ops bcm590xx_ops_vbus = {
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
@@ -471,6 +489,617 @@ static const struct bcm590xx_reg_info bcm59056_regs[BCM59056_NUM_REGS] = {
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
+static const struct bcm590xx_reg_info bcm59054_regs[BCM59054_NUM_REGS] = {
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(RFLDO, rfldo, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(CAMLDO1, camldo1, ldo_2_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(CAMLDO2, camldo2, ldo_2_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(SIMLDO1, simldo1, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(SIMLDO2, simldo2, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(SDLDO, sdldo, ldo_2_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(SDXLDO, sdxldo, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(MMCLDO1, mmcldo1, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(MMCLDO2, mmcldo2, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(AUDLDO, audldo, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
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
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(USBLDO, usbldo, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(VIBLDO, vibldo, ldo_2_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_SR_DESC(CSR, csr, dcdc_csr_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_SR_DESC(IOSR1, iosr1, dcdc_sr_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_SR_DESC(IOSR2, iosr2, dcdc_sr_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_SR_DESC(MMSR, mmsr, dcdc_sr_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_SR_DESC(SDSR1, sdsr1, dcdc_sr_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_SR_DESC(SDSR2, sdsr2, dcdc_sr_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_SR_DESC(VSR, vsr, dcdc_sr_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_GPLDO,
+		.regmap = BCM590XX_REG_REGMAP_SEC,
+		.desc = {
+			BCM59054_LDO_DESC(GPLDO1, gpldo1, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_GPLDO,
+		.regmap = BCM590XX_REG_REGMAP_SEC,
+		.desc = {
+			BCM59054_LDO_DESC(GPLDO2, gpldo2, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_GPLDO,
+		.regmap = BCM590XX_REG_REGMAP_SEC,
+		.desc = {
+			BCM59054_LDO_DESC(GPLDO3, gpldo3, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_GPLDO,
+		.regmap = BCM590XX_REG_REGMAP_SEC,
+		.desc = {
+			BCM59054_LDO_DESC(TCXLDO, tcxldo, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_GPLDO,
+		.regmap = BCM590XX_REG_REGMAP_SEC,
+		.desc = {
+			BCM59054_LDO_DESC(LVLDO1, lvldo1, ldo_3_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_GPLDO,
+		.regmap = BCM590XX_REG_REGMAP_SEC,
+		.desc = {
+			BCM59054_LDO_DESC(LVLDO2, lvldo2, ldo_3_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_VBUS,
+		.regmap = BCM590XX_REG_REGMAP_SEC,
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
+static const struct bcm590xx_reg_info bcm59054_a1_regs[BCM59054_NUM_REGS] = {
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(RFLDO, rfldo, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(CAMLDO1, camldo1, ldo_2_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(CAMLDO2, camldo2, ldo_2_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(SIMLDO1, simldo1, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(SIMLDO2, simldo2, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(SDLDO, sdldo, ldo_2_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(SDXLDO, sdxldo, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(MMCLDO1, mmcldo1, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(MMCLDO2, mmcldo2, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(AUDLDO, audldo, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
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
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(USBLDO, usbldo, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(VIBLDO, vibldo, ldo_2_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_SR_DESC(CSR, csr, dcdc_csr_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_SR_DESC(IOSR1, iosr1, dcdc_sr_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_SR_DESC(IOSR2, iosr2, dcdc_sr_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_SR_DESC(MMSR, mmsr, dcdc_sr_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_SR_DESC(SDSR1, sdsr1, dcdc_sr_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_SR_DESC(SDSR2, sdsr2, dcdc_sr_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_SR_DESC(VSR, vsr, dcdc_vsr_a1_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_GPLDO,
+		.regmap = BCM590XX_REG_REGMAP_SEC,
+		.desc = {
+			BCM59054_LDO_DESC(GPLDO1, gpldo1, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_GPLDO,
+		.regmap = BCM590XX_REG_REGMAP_SEC,
+		.desc = {
+			BCM59054_LDO_DESC(GPLDO2, gpldo2, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_GPLDO,
+		.regmap = BCM590XX_REG_REGMAP_SEC,
+		.desc = {
+			BCM59054_LDO_DESC(GPLDO3, gpldo3, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_GPLDO,
+		.regmap = BCM590XX_REG_REGMAP_SEC,
+		.desc = {
+			BCM59054_LDO_DESC(TCXLDO, tcxldo, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_GPLDO,
+		.regmap = BCM590XX_REG_REGMAP_SEC,
+		.desc = {
+			BCM59054_LDO_DESC(LVLDO1, lvldo1, ldo_3_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_GPLDO,
+		.regmap = BCM590XX_REG_REGMAP_SEC,
+		.desc = {
+			BCM59054_LDO_DESC(LVLDO2, lvldo2, ldo_3_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_VBUS,
+		.regmap = BCM590XX_REG_REGMAP_SEC,
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
@@ -485,8 +1114,24 @@ static int bcm590xx_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	pmu->mfd = bcm590xx;
-	pmu->n_regulators = BCM59056_NUM_REGS;
-	pmu->regs = bcm59056_regs;
+
+	switch (pmu->mfd->dev_type) {
+	case BCM59054_TYPE:
+		pmu->n_regulators = BCM59054_NUM_REGS;
+		if (pmu->mfd->rev_ana == BCM59054_REV_ANA_A1)
+			pmu->regs = bcm59054_a1_regs;
+		else
+			pmu->regs = bcm59054_regs;
+		break;
+	case BCM59056_TYPE:
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


