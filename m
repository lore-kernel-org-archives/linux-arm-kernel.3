Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E43C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 18:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U2WGpLSZw0pQ2JyUw8cq5eE/wZXTd4ilCeNkW1xDF4Y=; b=qkVHQMbBsgzWZtDcrSd7zycRjc
	Kx70HPmcz3EsrDkMMnD3WZgBntM4S6JjAYNMy8mmUozRo9QK5nyYUSTxgLCHfIxpFDFwT+j2HLAaw
	ItYchNtHliSlRjQ7RfH9At8TUvMhQjlIKXmYzwti3PbKEu0BU5IIz8XIbWA6S0jr2KyDhvu2e+GXS
	ihJuxUlO4asYoI+Dv3LknRYRM4zwNPdFg7BHBCpfKBnlF0/eOqAvwuSzvU/CvBwo6cnWZhEgggrWI
	gbWc1RYIZedbYxgd4GlakFwiHuOFwQOuZkpMTzU/4M6EphU8xVKrYGlFnRPpriZd+qWJyVsDC5Ud+
	F62C8tsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttslW-00000000TAz-198A;
	Sun, 16 Mar 2025 18:31:14 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttsa7-00000000S69-1t4u
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 18:19:28 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-abf3d64849dso595405566b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Mar 2025 11:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742149166; x=1742753966; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U2WGpLSZw0pQ2JyUw8cq5eE/wZXTd4ilCeNkW1xDF4Y=;
        b=aNDy+31zCWcKQPzu4WU3e7MXHPyAMDGfR/zo3TZHKp/gX1mZU7/2IykGjsggeTxuNA
         hUhPRFoUbdxGv46f2clZv+TCbZuAHO31+FMNgVuOirWiKCv5uyIAGjwW5dLFzdBJ8sSp
         rG7mjQAYsTepHSu3Id4m7EPMXr9rVKhS0xlXIMMGwpJoM9RZhaPkO2v3MwMviu00x1Hi
         6xq7VfONDe+xkoJCGQ/Ergh4l8UAT49bmF0B279I0lhzgdvw78Egn56gNJHVsdV4+Ife
         U1XZt4qmgnPFRpX0Kv5AB26lbQy4Fb7tsFp1qwDzlMfq/zN7yhnJI3TFVxzpvkjI22N3
         OT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742149166; x=1742753966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U2WGpLSZw0pQ2JyUw8cq5eE/wZXTd4ilCeNkW1xDF4Y=;
        b=nhuyfimTEJj/SpA7T//nyP0XsB4yNt8QdL7i0DmVLIApHoCNIhZpKnPP3+hHZiUqbH
         FhMd7wYU3BMtAtPx0swWVy0MoanI0V1NSvaGwYEkar8Z7IzK4e+MvwqQYQrDXZr4OhzN
         anafMejNm0PtCanAStcaOe887z1wFH90mJqowi9S2+ez39CWRvo8wRQEusRAk/CMBNqI
         MNAcmIdqH9mWZnlT0Aokw5Idik5TdD7vd/eFYg3JkpKMLh0n4r14StiBuqqixnPi3KdW
         PzZuH0bGEIwjxyRtYO4ogrH46Yd9w1ajqBPIvT2B3XPxU5smLMBiMUXMkf5bABkdhU2C
         xTEA==
X-Forwarded-Encrypted: i=1; AJvYcCXHcsU4yweftJtdct6QP8+VsNOwc9Vww5lU+5VBs2Dd338LCB4WfY13E//q6XWAmAjVtQI8PKsbQd7+G7fmsnvH@lists.infradead.org
X-Gm-Message-State: AOJu0YxlO8EDQMRfW5YuAGPKzNPxK0K9a0KIUiDKqmV8RrZl15U+lZXQ
	fdC5/bj5XK+8U32tG84qniJRHDqEX6Teyl1vUxsE3rpK9hJkwV/j
X-Gm-Gg: ASbGncsoa5aREayRCrhmd5bkkuI3t1UaAFxoWdoFyxdKQFItWclJJquJ+VJPyvPRSAH
	rO7wgwqCPHNz7IDNYFsISIkwtTtLYwP4Y1zw+vb8qSR4GYSYIM1Hsmqzl5dVEHs29rBRx5JosFe
	dRmZqXSxYijpxAVrlF8ncfCh9PwUBotMUAfV9vg1IMReSvnnJ4KSrO1mnSdbAb0Pg5amMois3CC
	dVQwKgMNhFw8yVYOk8p+bqrReCo//6lPBHbcDmGDXPEuXTbjZijJTcm5pbkzlwD4tEog6gEsGHY
	sp+393bpXPULcKPdYpdWHljDODFboNgqhIcLfmjNEUanJErs7ruk7V6oyO4t1yv+XV7hlNxHo2I
	llK2uAYbv8giHA0rCZQ==
X-Google-Smtp-Source: AGHT+IGXOWQRDAcYMd/Exc8yvwI1iOo50BCvMmRGoY19tx/OzEDExs7J9Jn98aan+JZt52qJvtFkHg==
X-Received: by 2002:a17:906:4795:b0:abf:78ff:e26a with SMTP id a640c23a62f3a-ac3303f76c3mr950349766b.35.1742149165906;
        Sun, 16 Mar 2025 11:19:25 -0700 (PDT)
Received: from hex.my.domain (83.11.178.210.ipv4.supernova.orange.pl. [83.11.178.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a48b51sm537951266b.149.2025.03.16.11.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 11:19:24 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sun, 16 Mar 2025 19:18:54 +0100
Subject: [PATCH v7 06/10] mfd: bcm590xx: Add PMU ID/revision parsing
 function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250316-bcm59054-v7-6-4281126be1b8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742149152; l=4816;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=v7kmhFS4/FCZzYhNN4jZO2ljmvejdJbM30D2qESzPQQ=;
 b=kpXrClBmSYX3k1C5REpTgl5jPoh4zXLAQG26nF1819if64hNZGWA3wSHsZe41WMoHOycIlE2d
 DESPqq4/UARCSY2ttuRfnQ9tHHMH2xv2GhtDQlym1/DgAO+6eZ5nmcB
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_111927_507713_A5608F1D 
X-CRM114-Status: GOOD (  23.70  )
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
different revisions may have slight differences in behavior (for
example - BCM59054 has different regulator configurations for
revision A0 and A1).

Check the PMU ID register and make sure it matches the DT compatible.
Fetch the digital and analog revision from the PMUREV register
so that it can be used in subdevice drivers.

Also add some known revision values to bcm590xx.h, for convenience
when writing subdevice drivers.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v7:
- Return -ENODEV on PMU ID mismatch
- Drop "Check your DT compatible" from ID mismatch error message

Changes in v6:
- Adapt to PMUID being passed as device type value
- Rename rev_dig and rev_ana to rev_digital and rev_analog
- Rewrite commit message

Changes in v5:
- Add REG_ prefix to register offset constant names

Changes in v4:
- Added this commit
---
 drivers/mfd/bcm590xx.c       | 63 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/bcm590xx.h | 14 ++++++++++
 2 files changed, 77 insertions(+)

diff --git a/drivers/mfd/bcm590xx.c b/drivers/mfd/bcm590xx.c
index 4620eed0066fbf1dd691a2e392e967747b4d125b..140107263599777b30cce4cfc0f86a9278907d34 100644
--- a/drivers/mfd/bcm590xx.c
+++ b/drivers/mfd/bcm590xx.c
@@ -17,6 +17,15 @@
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
+/* Under primary I2C address: */
+#define BCM590XX_REG_PMUID		0x1e
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
@@ -37,6 +46,56 @@ static const struct regmap_config bcm590xx_regmap_config_sec = {
 	.cache_type	= REGCACHE_MAPLE,
 };
 
+/* Map PMU ID value to model name string */
+static const char * const bcm590xx_names[] = {
+	[BCM590XX_PMUID_BCM59054] = "BCM59054",
+	[BCM590XX_PMUID_BCM59056] = "BCM59056",
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
+	if (id != bcm590xx->pmu_id) {
+		dev_err(bcm590xx->dev,
+			"Incorrect ID for %s: expected %x, got %x.\n",
+			bcm590xx_names[bcm590xx->pmu_id], bcm590xx->pmu_id, id);
+		return -ENODEV;
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
+	bcm590xx->rev_digital = (rev & BCM590XX_PMUREV_DIG_MASK)
+				     >> BCM590XX_PMUREV_DIG_SHIFT;
+
+	bcm590xx->rev_analog = (rev & BCM590XX_PMUREV_ANA_MASK)
+				    >> BCM590XX_PMUREV_ANA_SHIFT;
+
+	dev_info(bcm590xx->dev, "PMU ID 0x%x (%s), revision: digital %d, analog %d",
+		 id, bcm590xx_names[id],
+		 bcm590xx->rev_digital, bcm590xx->rev_analog);
+
+	return 0;
+}
+
 static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
 {
 	struct bcm590xx *bcm590xx;
@@ -78,6 +137,10 @@ static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
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
index 8d146e3b102a7dbce6f4dbab9f8ae5a9c4e68c0e..fbc458e94bef923ca1b69afe2cac944adf6fedf8 100644
--- a/include/linux/mfd/bcm590xx.h
+++ b/include/linux/mfd/bcm590xx.h
@@ -17,6 +17,16 @@
 #define BCM590XX_PMUID_BCM59054		0x54
 #define BCM590XX_PMUID_BCM59056		0x56
 
+/* Known chip revision IDs */
+#define BCM59054_REV_DIGITAL_A1		1
+#define BCM59054_REV_ANALOG_A1		2
+
+#define BCM59056_REV_DIGITAL_A0		1
+#define BCM59056_REV_ANALOG_A0		1
+
+#define BCM59056_REV_DIGITAL_B0		2
+#define BCM59056_REV_ANALOG_B0		2
+
 /* max register address */
 #define BCM590XX_MAX_REGISTER_PRI	0xe7
 #define BCM590XX_MAX_REGISTER_SEC	0xf0
@@ -30,6 +40,10 @@ struct bcm590xx {
 
 	/* PMU ID value; also used as device type */
 	u8 pmu_id;
+
+	/* Chip revision, read from PMUREV reg */
+	u8 rev_digital;
+	u8 rev_analog;
 };
 
 #endif /*  __LINUX_MFD_BCM590XX_H */

-- 
2.48.1


