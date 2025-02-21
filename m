Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE949C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 20:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6wjZ5pN/HhmFRAahEKqBfrFaTj2GU3BUMT0DWllxLuo=; b=fI8MSe0knlnFuqJb8bvigrCyxh
	VmXcIS6K3kg+aJ7G5gotfibu84CYraM8qMtTuNW/TDCfRYcsqmI/YCIe83KbU5ck3VBYwpq7MUOQd
	wP3EkwdB/NXD7BkRHOT0usZZRTR8vfw4g7P/3PyV3BbXM6X3qI2LPP4ykoEgxZYBY0DOauDnM6hTG
	6P1A74VIGoXerflPOad+yw0AZuIt7iqAn2d6M4evs+a4WW1KRcXqBu597PmzNxaUX53yEZc1OrX1e
	YQvrKPxZxAJSawiDTsO6uCtxtjI3TfSrgK269XRfmE3+6drhNMT055J/qT7IF0WRA+NFNsm9Oio9v
	DpkSSVqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlZaV-00000006mMv-0rcA;
	Fri, 21 Feb 2025 20:25:31 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlZRz-00000006knq-1KLn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 20:16:44 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5dee07e51aaso4707147a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 12:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740169002; x=1740773802; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6wjZ5pN/HhmFRAahEKqBfrFaTj2GU3BUMT0DWllxLuo=;
        b=Iyrv7QIg5C8fTympX+DF0KRb06vP7g8UaGMAfr8i0awm9CJVCPLqoPuxSgBrUVPe7Q
         L/MC5XomQRT2ve92Pprz7Lmkxz+dH2N6EvVG+qKl/X5CbyaCeGWQ+GzGjXA+AmsuE7+c
         Toim15nRpO1fzoOmgwBiTEO4gS6mXo3RBSUeB+9QZqYjxRgzETDb1BczhVY3JCKcNFsj
         uFGwSdCKYijH+oYFlbp2CcUqsIn5K/CtKhVW3Rp1DReZ//9kCh0G7F1DgoY/vWE1rIfw
         Q4XZSff/EvWRa3BZR7pZsX+th/LkfbN0gHmcCKzLqB2HbV6bnI7mR9LlLT2DDMi3QxIx
         Tnkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740169002; x=1740773802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wjZ5pN/HhmFRAahEKqBfrFaTj2GU3BUMT0DWllxLuo=;
        b=cp3L06HSaMX/vEo8vK5DMn+OFHHpdEHKxajZ7fFtEAzF0pE8P1qK7sDfVXGej3yffB
         p/5pz22z+VhDt8afP/Ef14uUZWX/Es7P2+Lmf6kjGdDo0+8u6jA11b2TmqNEx+A1rigL
         cLARk/qzpsS8WcN7XQ2vxEOaqvUQaJojyA7KJnAATLXAft0Jpaz78aYmOB6Qvn6buiCZ
         IEHO50pnJLh956+MjC3eGbwsi466Ih8F6RjV//3tzZ/G7SdAr47riwUH5kptVoVmFxQ9
         NpxqKe3o65QLHTcDfSBfpyJK6iEhB9j05B5qGoHjRZv19ZzG7/t2RyLtTBl0MYnTCBXz
         mLjA==
X-Forwarded-Encrypted: i=1; AJvYcCUvNXCH6Z4qMicIQfjHsd90HwDJiyzjTISBFysMTvDRXCY9dAzzRdqClef4cOu9AdoZGqmHhWDgwVsqbctxtQFz@lists.infradead.org
X-Gm-Message-State: AOJu0Yyvy/dlD1/RIkoYkdPS1dLBQ1RnGQO4mWI0nBF9vrN5bVpRVpNW
	+RgOHancZT9zGzmZKS/PjLx61IuCf8JElTg9EK/asijYm6CDmfOS
X-Gm-Gg: ASbGncsugzYcjYNOST47H9JDombqBQPCg2BbGWPqbtTW4UM6sIu2qgwsMPWnemPzDPM
	xLfXMg5nA2BFJEtr0WZnGQ2mdxlBGp5LZgItxIYPSBtmvHNPnV2qSb9hco5t1tPK6IEZbEb6wzW
	nFheIEEkJzZoLD5Ocktjxeg4TN/s4a2x3RPJWeJoFTV23ebQRn/xuDz+hSo/sVMcjIW8+rLklJy
	kGj11kzh6OBCrH7wPnaK12lHJZ62TQGyhsKEOb/+9+TKNDF4Eu6K2cNVd315lYfXh+LFCkuLC57
	Dr5NuGtu4TDP0ppUgYFYWySHJuGDNhevTpTC2xsz/0Gb29hufvrWx0OgQwrOKXtFCf2vYNk8
X-Google-Smtp-Source: AGHT+IFQavg/u6GXqPap5byMtJIE7uLPNliZ4KpjB8rQy5CAoh4E7eCI9gi7pYRF4U8U+uVjMMHpWw==
X-Received: by 2002:a05:6402:2691:b0:5e0:3f83:92ab with SMTP id 4fb4d7f45d1cf-5e0b7246c97mr4719984a12.30.1740169001697;
        Fri, 21 Feb 2025 12:16:41 -0800 (PST)
Received: from hex.my.domain (83.8.202.192.ipv4.supernova.orange.pl. [83.8.202.192])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4f70sm14127594a12.12.2025.02.21.12.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 12:16:41 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 21 Feb 2025 21:16:27 +0100
Subject: [PATCH v5 5/9] mfd: bcm590xx: Add PMU ID/revision parsing function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-bcm59054-v5-5-065f516a9042@gmail.com>
References: <20250221-bcm59054-v5-0-065f516a9042@gmail.com>
In-Reply-To: <20250221-bcm59054-v5-0-065f516a9042@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740168989; l=4799;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=lQpDyLwD1v0ICLejI1CnQE4idFDW19bqjeBaJhBeGzw=;
 b=tA22jfFcQLrM8fzLcUdryGdYMiFXvQ/0EmyyKnCeciO3hD90+oZWx7ILF/h+/+egt+bDeGWV8
 elHjquag3IrBKCmMQpvFdwbqoEbbwYH1zzba+NxcuZ7LItYq/+tuQGc
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_121643_368361_80864CDA 
X-CRM114-Status: GOOD (  24.47  )
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

The BCM590xx PMUs have two I2C registers for reading the PMU ID
and revision. The revision is useful for subdevice drivers, since
different revisions may have slight differences in behavior.

Add a function to parse the data contained in the ID/revision
registers. Use the ID value to verify that the correct compatible is
used; store the revision value as two separate variables, rev_dig
and rev_ana, for later usage.

Also add some known revision values to bcm590xx.h, for convenience
when writing subdevice drivers.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v5:
- Add REG_ prefix to register offset constant names

Changes in v4:
- Added this commit
---
 drivers/mfd/bcm590xx.c       | 81 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/bcm590xx.h | 14 ++++++++
 2 files changed, 95 insertions(+)

diff --git a/drivers/mfd/bcm590xx.c b/drivers/mfd/bcm590xx.c
index 632eb57d0d9e9f20f801fac22eae21b3c46cefd5..6e53cf3dbf54636faab635634a31e9e36827cece 100644
--- a/drivers/mfd/bcm590xx.c
+++ b/drivers/mfd/bcm590xx.c
@@ -17,6 +17,17 @@
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
+/* Under primary I2C address: */
+#define BCM590XX_REG_PMUID		0x1e
+#define BCM590XX_PMUID_BCM59054		0x54
+#define BCM590XX_PMUID_BCM59056		0x56
+
+#define BCM590XX_REG_PMUREV		0x1f
+#define BCM590XX_PMUREV_DIG_MASK	0xF
+#define BCM590XX_PMUREV_DIG_SHIFT	0
+#define BCM590XX_PMUREV_ANA_MASK	0xF0
+#define BCM590XX_PMUREV_ANA_SHIFT	4
+
 static const struct mfd_cell bcm590xx_devs[] = {
 	{
 		.name = "bcm590xx-vregs",
@@ -37,6 +48,72 @@ static const struct regmap_config bcm590xx_regmap_config_sec = {
 	.cache_type	= REGCACHE_MAPLE,
 };
 
+/* Map device_type enum value to model name string */
+static const char * const bcm590xx_names[BCM590XX_TYPE_MAX] = {
+	[BCM59054_TYPE] = "BCM59054",
+	[BCM59056_TYPE] = "BCM59056",
+};
+
+/*
+ * Parse the version from version registers and make sure it matches
+ * the device type passed to the compatible.
+ */
+static int bcm590xx_parse_version(struct bcm590xx *bcm590xx)
+{
+	unsigned int id, rev;
+	int ret;
+
+	/* Get PMU ID and verify that it matches compatible */
+	ret = regmap_read(bcm590xx->regmap_pri, BCM590XX_REG_PMUID, &id);
+	if (ret) {
+		dev_err(bcm590xx->dev, "failed to read PMU ID: %d\n", ret);
+		return ret;
+	}
+
+	switch (bcm590xx->dev_type) {
+	case BCM59054_TYPE:
+		if (id != BCM590XX_PMUID_BCM59054) {
+			dev_err(bcm590xx->dev,
+				"Incorrect ID for BCM59054: expected %x, got %x. Check your DT compatible.\n",
+				BCM590XX_PMUID_BCM59054, id);
+			return -EINVAL;
+		}
+		break;
+	case BCM59056_TYPE:
+		if (id != BCM590XX_PMUID_BCM59056) {
+			dev_err(bcm590xx->dev,
+				"Incorrect ID for BCM59056: expected %x, got %x. Check your DT compatible.\n",
+				BCM590XX_PMUID_BCM59056, id);
+			return -EINVAL;
+		}
+		break;
+	default:
+		dev_err(bcm590xx->dev,
+			"Unknown device type, this is a driver bug!\n");
+		return -EINVAL;
+	}
+
+	/* Get PMU revision and store it in the info struct */
+	ret = regmap_read(bcm590xx->regmap_pri, BCM590XX_REG_PMUREV, &rev);
+	if (ret) {
+		dev_err(bcm590xx->dev, "failed to read PMU revision: %d\n",
+			ret);
+		return ret;
+	}
+
+	bcm590xx->rev_dig = (rev & BCM590XX_PMUREV_DIG_MASK)
+				 >> BCM590XX_PMUREV_DIG_SHIFT;
+
+	bcm590xx->rev_ana = (rev & BCM590XX_PMUREV_ANA_MASK)
+				 >> BCM590XX_PMUREV_ANA_SHIFT;
+
+	dev_info(bcm590xx->dev, "PMU ID 0x%x (%s), revision: dig %d ana %d",
+		 id, bcm590xx_names[bcm590xx->dev_type],
+		 bcm590xx->rev_dig, bcm590xx->rev_ana);
+
+	return 0;
+}
+
 static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
 {
 	struct bcm590xx *bcm590xx;
@@ -78,6 +155,10 @@ static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
 		goto err;
 	}
 
+	ret = bcm590xx_parse_version(bcm590xx);
+	if (ret)
+		goto err;
+
 	ret = devm_mfd_add_devices(&i2c_pri->dev, -1, bcm590xx_devs,
 				   ARRAY_SIZE(bcm590xx_devs), NULL, 0, NULL);
 	if (ret < 0) {
diff --git a/include/linux/mfd/bcm590xx.h b/include/linux/mfd/bcm590xx.h
index 83e62b5a6c45805bc2acc88ccc7119d86f9ac424..ba1cb3716b383d7a2ee396e0595a3b94d3b4ca5e 100644
--- a/include/linux/mfd/bcm590xx.h
+++ b/include/linux/mfd/bcm590xx.h
@@ -32,6 +32,20 @@ struct bcm590xx {
 	struct regmap *regmap_pri;
 	struct regmap *regmap_sec;
 	unsigned int id;
+
+	/* Chip revision, read from PMUREV reg */
+	u8 rev_dig;
+	u8 rev_ana;
 };
 
+/* Known chip revision IDs */
+#define BCM59054_REV_DIG_A1		1
+#define BCM59054_REV_ANA_A1		2
+
+#define BCM59056_REV_DIG_A0		1
+#define BCM59056_REV_ANA_A0		1
+
+#define BCM59056_REV_DIG_B0		2
+#define BCM59056_REV_ANA_B0		2
+
 #endif /*  __LINUX_MFD_BCM590XX_H */

-- 
2.48.1


