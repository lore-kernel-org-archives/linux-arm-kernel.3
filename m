Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81030C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 07:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mc99szM5NS9if/cxxc1jYyxG/jdxQF7Jhbt7r7vKNzw=; b=e+sBnzT2m1OsS2MqBlUu88qU+d
	TRaFas+tn4rrXSI2Uy+O7qhMckICr3qWkHVHA8dCyKKQWYZpV8DxlJqY+ajLokr1nCLdZP/DcwCTW
	8WC8DMh/qSCnle/ucz9Y4r09/0JZmWPwqBjdotelJks0B3WvjudVryy3JbtfD9NZr6krvS8zO/gJy
	X9FSQqsCN26wYC5n0UpeLOOEnE2REv3oYp6nchRWvmT4ReqQmvhmNyKWJDx7mYGlKfhqe2McjtI9P
	wf/KUFxC3Sas0hBqU3IlMWPrj6eX8ZXbmqUpfSplL73MJHSUIjZSaSYsxvk4VucFtgf7Plvaq4ZZK
	uKtj5vHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1bD-0000000Bx9w-13nt;
	Wed, 30 Apr 2025 07:11:19 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1XP-0000000BwSF-2eBp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 07:07:24 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5e677f59438so10822630a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 00:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745996841; x=1746601641; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mc99szM5NS9if/cxxc1jYyxG/jdxQF7Jhbt7r7vKNzw=;
        b=jGYNbcwxhXpc8yxAM27b4xYxw3iwdoLscK3Xvcu71rgr5PDHDlBSRA5zlFVrpMGUmE
         AQ9akyPubUp7gX56J7uomlWKo/eJGSLcZr0I+e6ZO0wht1SbARWM7OeyDXr4rhIQpglZ
         NqMK7cxP/Vp3C7jEBHF0E1GnDbol9TOqdqn7mIBVqvRcXNfyzZcLHC4WPCN1+G6FACOf
         /kPfAS3dJvSzKgmMWoeSN9WqiVDuYBFD4Hpzn51SCptFdN73NLgQdl8dZxudQNtli0GV
         Gf6O26DjYQQ1kNsF5FI16xZh+y5Yj9ofRxHC4C/am+I5mILGkaD5Rfm8pJbNxB/pUdXb
         jfMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745996841; x=1746601641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mc99szM5NS9if/cxxc1jYyxG/jdxQF7Jhbt7r7vKNzw=;
        b=Esa2RJGGENm2GetlFNGxiiXT/uzwSeYz/pJ7oBwAtegdbd/NGsUfS2auw30rH1hZyW
         ImNLpaVRboGDrPlWX++lRnlLnP92KIceHLbLBwlaKl/kaUKIaJmQL2tB5IEfkg1UqWNO
         VeEVxnMSANmV9k7cIZLrSh371vT4nPrKe3KlHtgL4iFC6+PB6Y0nBQFpApEjFaiTo293
         HJ3TaR8LJFR7U8X/dSzODYrqmMAe16QYx8WcGWtnHkzpNW1Vj5aHxCcZGRhX39M+pELL
         hUHSyYk93Sf6JdwZp32ScOniAZEjVzE6vcp5ucvf5i4E6a9LKtZZvvz4GAWpe9uv731E
         umtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJJtyZiWZYynuEp+/2etAS0AQJdoZ1O8FeIbRgz4XxYdAAGbOPsg/h5FvaYcvp32hkClPizd5OvMys+blWZbhQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyQY2JaLQEjR/Kkiezuxoq9YpikghI6BGU8CJDiCqh9TgygOGxN
	vsdXQHaWcIYiHe4tqZovCudl5lqAsvA4Y+r8fiTyVp72zVpzZx5e
X-Gm-Gg: ASbGncvWKAynSdm6Fa/vfbp9yC1J6utC/NYMgM0zkCXRHCtyBcLBouk7D7bTyAhnJTs
	4lxLmDjDnDbvNhaHYcXOO+ShJPpWzQ8elCyl7KW6YSt+dpdk67s60aIYokp6yRSMqz3vgGXZ6L4
	76WGyd+icas6qg4mqlcM1Z9Hzg7eOoIBqdpoMSLCiNgmI5U6zr+3b4JOCaidIN1ctZIVdEqaz3k
	v++qBhy6RhjrtBJjv5qXUXIMqRhHl77gIUClHgf7NiH3mY1eVqQQyKUnng+g/cb15K9pGp3NEAh
	l/IWZO+vHolG7wcQrycO4zp0e4cnp2p1zN5181+MtIKbWrG6s9OMvZmeSfOZUflnSYMTQhGKWcv
	Nl0rL9foqUxs=
X-Google-Smtp-Source: AGHT+IE9B7O3f2Zx9SbVPfFNhUAxKNJ1v598E122nhb3axEh52sxGI9kcl490JCRu0J7Tp/swxS71w==
X-Received: by 2002:a05:6402:5205:b0:5f6:dc67:639d with SMTP id 4fb4d7f45d1cf-5f89b446757mr1412264a12.15.1745996840053;
        Wed, 30 Apr 2025 00:07:20 -0700 (PDT)
Received: from hex.my.domain (83.8.121.197.ipv4.supernova.orange.pl. [83.8.121.197])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013fec3csm8334314a12.19.2025.04.30.00.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 00:07:19 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 30 Apr 2025 09:07:08 +0200
Subject: [PATCH v8 4/9] mfd: bcm590xx: Add support for multiple device
 types + BCM59054 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-bcm59054-v8-4-e4cf638169a4@gmail.com>
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
In-Reply-To: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745996831; l=3092;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=Kyf+JgIs1pOl50ZzUQw3gg0eoEVgfjFo16SyHRTN6/Q=;
 b=RcNBgUy/EgquttJsiJmhHwzgwB5v+B923kqzWeEaTLVETU8zGG4yVb3HtOTi01hx70EOwijBP
 0g9wZ0RdlmcD4NZtbfhVFBJsOljxuVw83FB2IYX0bHZnMz3jbRe0Q/w
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_000723_676515_D625744A 
X-CRM114-Status: GOOD (  20.30  )
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

The BCM59054 is another chip from the BCM590xx line of PMUs, commonly
used on devices with the BCM21664/BCM23550 chipsets.

Prepare the BCM590xx driver for supporting other devices by adding the
PMUID register values for supported chip types and store them in the
MFD data struct as "pmu_id". (These will be checked against the actual
PMUID register values in a later commit.)

Then, add a DT compatible for the BCM59054, and provide the PMU ID as
OF match data.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v6:
- Move PMUID value to MFD header
- Use PMUID value as OF data/device type value
- Add bcm59054 to I2C ID table

Changes in v4:
- Rewrite commit message description
- Rename "device_type" member to "dev_type"
- Drop awkward line break to fit function call
- Add PMU ID/revision parsing function

Changes in v3:
- Fix compilation warning about device_type pointer cast type
- Name the device types enum and use it as the type in the MFD struct
---
 drivers/mfd/bcm590xx.c       | 12 +++++++++++-
 include/linux/mfd/bcm590xx.h |  7 +++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/bcm590xx.c b/drivers/mfd/bcm590xx.c
index 8b56786d85d0182acf91da203b5f943556c08422..4620eed0066fbf1dd691a2e392e967747b4d125b 100644
--- a/drivers/mfd/bcm590xx.c
+++ b/drivers/mfd/bcm590xx.c
@@ -50,6 +50,8 @@ static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
 	bcm590xx->dev = &i2c_pri->dev;
 	bcm590xx->i2c_pri = i2c_pri;
 
+	bcm590xx->pmu_id = (uintptr_t) of_device_get_match_data(bcm590xx->dev);
+
 	bcm590xx->regmap_pri = devm_regmap_init_i2c(i2c_pri,
 						 &bcm590xx_regmap_config_pri);
 	if (IS_ERR(bcm590xx->regmap_pri)) {
@@ -91,12 +93,20 @@ static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
 }
 
 static const struct of_device_id bcm590xx_of_match[] = {
-	{ .compatible = "brcm,bcm59056" },
+	{
+		.compatible = "brcm,bcm59054",
+		.data = (void *)BCM590XX_PMUID_BCM59054,
+	},
+	{
+		.compatible = "brcm,bcm59056",
+		.data = (void *)BCM590XX_PMUID_BCM59056,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, bcm590xx_of_match);
 
 static const struct i2c_device_id bcm590xx_i2c_id[] = {
+	{ "bcm59054" },
 	{ "bcm59056" },
 	{ }
 };
diff --git a/include/linux/mfd/bcm590xx.h b/include/linux/mfd/bcm590xx.h
index c614d1b1d8a217ac2f212908a4c19ae71fa56f63..8d146e3b102a7dbce6f4dbab9f8ae5a9c4e68c0e 100644
--- a/include/linux/mfd/bcm590xx.h
+++ b/include/linux/mfd/bcm590xx.h
@@ -13,6 +13,10 @@
 #include <linux/i2c.h>
 #include <linux/regmap.h>
 
+/* PMU ID register values; also used as device type */
+#define BCM590XX_PMUID_BCM59054		0x54
+#define BCM590XX_PMUID_BCM59056		0x56
+
 /* max register address */
 #define BCM590XX_MAX_REGISTER_PRI	0xe7
 #define BCM590XX_MAX_REGISTER_SEC	0xf0
@@ -23,6 +27,9 @@ struct bcm590xx {
 	struct i2c_client *i2c_sec;
 	struct regmap *regmap_pri;
 	struct regmap *regmap_sec;
+
+	/* PMU ID value; also used as device type */
+	u8 pmu_id;
 };
 
 #endif /*  __LINUX_MFD_BCM590XX_H */

-- 
2.49.0


