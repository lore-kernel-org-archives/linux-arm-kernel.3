Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A162C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 06:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+2M+lUouAH0+Jr+nyjeHl+wxA0K/oLUPdCGmVRRMGE=; b=Yn+JqwQwYwno/LE+XxJHLqWxvD
	VsDUCGuwviW1ekCspdLH0NxhBo+z1IGt4OB2SslFwklMksFj5kBhVyKQYndZMW27yy88sFLFBYewq
	egxOGQ8rlrItI96Z+B/GCeJbQq5wwwKo3TJ9ZsX89MX5TTAV1ol2Od+rBMUakm1nsct4zrP9bR6Ae
	pJNfK7cDpXBW2vxfIp/7pLJ6bfwPUalbp2jCwcIFOxhufWbUbBEY2rvhMCjqHOK6pyqmo97h17Wp6
	uatBzzvzj+9tLHNzyTgv5dr7ynY7CgvsrlCTxuHe8ypEqke9R7p2nythNcvATMQcVjPDobNtVkH4/
	qPGZW69Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpLot-00000003Hpx-2B71;
	Tue, 04 Mar 2025 06:31:59 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpLeC-00000003Evn-18UP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 06:20:57 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5e4b410e48bso7943372a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 22:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741069254; x=1741674054; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+2M+lUouAH0+Jr+nyjeHl+wxA0K/oLUPdCGmVRRMGE=;
        b=KyXrGofLdruaX2cub1Rrqjh21e4r9iz9gGwls33QKFbMFVGzXQLcxikYGzc8DTJ/B3
         cLulMlS85eU4Fxx0bLMb+Z0mbGtn7u6KWIFcju+pYbEIhUVikxqmKEIktagLRndj4FpQ
         Qm5RWTAgNe8kNUumoXqUb8fsAvAKRVANwDGJ6YgiIWX29yVd36VSNxlC3ebO5+vtsQkb
         CIretTjQRkyXqxLz5ygnyvqFl6geYD66dwmwKFOZ9/La1oEsK3W6yHpZt5UVV5Z5FT7q
         Z7sb8aSjJleqRj0nkru+wXcG6KhbYryztVbQs/MrEZeW1lAckHkkpCDKf8+THA4M98lb
         ez/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741069254; x=1741674054;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3+2M+lUouAH0+Jr+nyjeHl+wxA0K/oLUPdCGmVRRMGE=;
        b=X5ZxP6RyBHXHvpk06yqVETG+aJtA2DVaKmRaAO2Lbbe6DdhxiRIrTwzU+/WA6h40YH
         Qg3X0Sx51jlcMDWFt+/eyVk7zXWMjju23beW88tDWhM5zXEERsLwmR4sobF/8vcKFiVM
         aRSRj9CTBHIhIaLHXHnuQAJHY0P9ZVE4/zWE6B4kuvEMLpycrH8ztziCNZoiT7cv87eE
         VC7XVx65uZqoI2yGVnlApAdfIJLBFfTBYSOh0NuuFB4X1st9FJg2mTGApkYmI8VmPLY5
         lEMz67FhD3IzZhwk6DvGBI5I2+hC9KeU9U06St464LrV7LXEWZIhL/yFvIcAMN+mWbBk
         Em7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWbr7or51HCRkFt+MjbrdRfMbQGSfutlEENt4Q/JyZE8BQ7PVnwwVYMi6Ld/EN0KN5LcC9xKRM8boVQWXbQaUBd@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9PlCTp/W6yopIGEXTCyxn6v2yonaagti3qnL+fa8uMwKZdkbz
	XVRFxzGdnpyf00pI4ZXksuE13K0YCoSZaeZiXuNhGnyVcOwpZHt7
X-Gm-Gg: ASbGncvAOEnAexqGaw4rbkfuftxRJstciQbLFT8QSbHW55plrwE4iVGD65zObL31tzB
	RTfIPNu+gNxW/mdVzIPjhhR4hei0bgFwkGgOm+JecslV+kaWJ711Zawtbapz8zAK1v/0CgZRkin
	6y0lJJfo4/21nU65QO0YekhTEQYZprqMBdfkHhmMBEk+fdFBBCXiZGOiNzFnIrx82+J/SknKEE2
	o7ip958WyyZow7E9chFJqKvxffxPIJ9AkYBeIglLQBBMXSOPJ5oH0sBK3KG2A9X+gGIun8NDx3h
	SUXHyAChZb2+tnaF5WoILxnCzwAz49Bp5JaWszPwdx/+vq66TedDQZ7PW1o+MCr5qES759yGGgB
	wbj3aZ512AmJ3DcA=
X-Google-Smtp-Source: AGHT+IHmRZJWXxinp3S9yKdKxAQxAmR8UYiXoV3pVFigexm+q7DYIkPX028aeA4Fom82uQG7EDBq9w==
X-Received: by 2002:a05:6402:5c8:b0:5df:6de2:1e38 with SMTP id 4fb4d7f45d1cf-5e4d6b0ca3dmr16714679a12.17.1741069254457;
        Mon, 03 Mar 2025 22:20:54 -0800 (PST)
Received: from hex.my.domain (83.8.122.142.ipv4.supernova.orange.pl. [83.8.122.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a663fsm7609036a12.68.2025.03.03.22.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 22:20:53 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Tue, 04 Mar 2025 07:20:36 +0100
Subject: [PATCH v6 05/10] mfd: bcm590xx: Add support for multiple device
 types + BCM59054 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-bcm59054-v6-5-ae8302358443@gmail.com>
References: <20250304-bcm59054-v6-0-ae8302358443@gmail.com>
In-Reply-To: <20250304-bcm59054-v6-0-ae8302358443@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741069240; l=3092;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=Vau+qtkiLKbsSAyta7HK/1aydJ9QZlhuWFoLqVhFrJQ=;
 b=cKgnfp5aYzSXknoJCrMwHDV0XkywmbrTIiMxmmHGahAu+caQfeqB75k3Wx8UG5AeiicIhr687
 AWQQPXVCrrkDI6kkEs//zqa40g8nM6JWbYYm5Mx+1OM2KurIy2kekwI
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_222056_314074_0E7D6BCB 
X-CRM114-Status: GOOD (  20.43  )
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
2.48.1


