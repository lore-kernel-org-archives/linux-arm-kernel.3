Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B0AC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 14:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uB7IlMr42gg8DLRiDGyDmhiIGwhSKkQAZl2FLPhXodg=; b=LV0hERSK59YJbjUHN4ClK2OiIA
	dTWS6K+vxzbicIXQijdMjA6EuVAWof3Jo60yNoGaoUVM9W24fYKK6YG9NW7vxGZc7AbmIwlF5XdZI
	UVSj5XrhtMYjtd/mP2gfqGlaXaMnB3Lo5SiN1efCoYegtTXlYFw/gdUviRtminUD/lNgi1b2VPnsW
	b0YlCrm3KPXeJ/8fy0ZYUV9xrn2Xz1H4CqwtaaPPNShSHsP7vVohI9NDJvUd2zzxthw9tytrJyQZq
	Hk6BkwpIr5jyyOYFZIa4XXJ5E67Od4ShlbMizlu/Dk0vZDwNVgVS/30y1IS+ZSs68qVVfIDWwXOaO
	1fOycDNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZVz-00000000sR0-1Uav;
	Thu, 15 May 2025 14:24:51 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZO3-00000000qvz-3b8D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 14:16:40 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5fc3f0a5506so2019215a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 07:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747318598; x=1747923398; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uB7IlMr42gg8DLRiDGyDmhiIGwhSKkQAZl2FLPhXodg=;
        b=U9rcBpmYpio+kWYgGkARDPHTPjYPZrR5od6rxndk1x9voDf0S6xkUSROd1T3F54XoY
         z/JCp6GsKUAl786vZssEk0dw0iFHm3sP3r/OHnvx5DhfjoUqhI88Tf3HWmBu1G7rPRvX
         FPwm82r2PZF26R9dsBcH/01+9b/DU6K3Kz5ISlbLo71YwRdxjkYLdWfCFLMcS+vyOTh8
         mI7oCVKd+vvegzYTIbKQ+xbR6x4VLQKamgrdCH9+RXUKmSq2r1yYlG/7LoWukc6Hm2OC
         4OwQZ0Hlhn31Mayjw2ytgSFNiyFNLIkPU4A8Mkqo5IoTwQxbJGolOzDS8N/1/XnBh7/8
         16KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747318598; x=1747923398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uB7IlMr42gg8DLRiDGyDmhiIGwhSKkQAZl2FLPhXodg=;
        b=B4Pb4fq1yiaA1rZgOj2aIvht5P4aQlwyjXiJ47I4ROkC4C/SZmwphbmgqskElSGl+g
         VMXFDdn3HNgT/GgI3ZMTnPV8rsWBo1cJtoz9NSOvWwgmc8n2eKKpC/pQzjLtUaRvf+2p
         qUHShG4Rqe4KSAEDLOESXE/c9k7Rt6Sto8FGMJZhAK3YO0nzFsN7xTE08EnxAW5jo3OT
         AMZQnmuMuVztk5Wb8MCSIkerpsPL3QvTVeJdITWlcMybThpq31BRRUY4/znPBvCDGvIj
         aoeqeYFZoAfy/cm/nP2mhQQeGvaqF0HY0zdNKVNamG/SxtXJWidlw7i8sF0kbe2PlPsr
         DgxA==
X-Forwarded-Encrypted: i=1; AJvYcCWN4UW2ZybiYnmj6w4gFiyvtjbvkaXVF1Dw5Cp6d1XD6e7XauzB6OAJVb6+5lrgYuZNUx2dzIML0Q2xm2lE31/c@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl37XxiETreAe7BlQBaPzEM9G+wrYKTxhPmZACkyQnPUTJe88g
	0u/6Y1qD92ks8r18MZli9bzSzW6CYG+ZF3ESj2/7q23dho1vsXPP
X-Gm-Gg: ASbGncvHo9RBn136UsrOtxgi6cDOlUKa5IX5vYv9/xDZQW+bA4+9fLagNWuOm9N5V9b
	wblg6BPC+3TM7XBt3kuGx4jpERU7SfSSXSYamZAX7+z9cDrBsqIhEW1LBWFOJs1w61QJjFaVJxn
	j5dFtRLcZInAWClnPawu8h+DiXy3mTIVyfWeqdfpgKBuIDrCdq3fYpLrzEXF/1LFSTP5SIZLWQ2
	wlI08l6Kq2quQumDTaJeDEjMA/7AfbEFmz3HCK9nazvNUTsBQw3qQxItQ7ZrF1K+9gG7Ujxiac9
	S4MrY68gPDceBqw9V2jE26E0dXVEYl4ctCVYDhAbXhAoePCCNdhHUq81qr/nAloP2XTRmWyT1t6
	9Z/KDz7HaC4ALhUMzhk6KDw==
X-Google-Smtp-Source: AGHT+IExD8WCobcAmWiSwMceR9cRqXsORoxO5gU+uaajpgi9F6F/lCv8ew7TQkTfmbUu8IansJ4GbA==
X-Received: by 2002:a17:906:dc92:b0:ad2:50ef:492e with SMTP id a640c23a62f3a-ad4f717e01dmr778642466b.32.1747318597746;
        Thu, 15 May 2025 07:16:37 -0700 (PDT)
Received: from hex.my.domain (83.11.178.15.ipv4.supernova.orange.pl. [83.11.178.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192c8535sm1110143966b.8.2025.05.15.07.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 07:16:37 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Thu, 15 May 2025 16:16:30 +0200
Subject: [PATCH v9 3/8] mfd: bcm590xx: Add support for multiple device
 types + BCM59054 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-bcm59054-v9-3-14ba0ea2ea5b@gmail.com>
References: <20250515-bcm59054-v9-0-14ba0ea2ea5b@gmail.com>
In-Reply-To: <20250515-bcm59054-v9-0-14ba0ea2ea5b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747318592; l=3150;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=zc/KYGv+dOB7LPpRpR+zdnpyGPVsa6Afn4PttizqeaY=;
 b=tw9wbBZbDH75cMbnG5QmdWnMP+qBjOobs88M8T+2a8dUryao3viY7f8Qi6hbsTRbvQkjUwOA0
 jv1aJXcSlwQBfKIOrlfK4jTxC92saGWB3PIF6fqJl/+I92MmGaKdo6C
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_071639_899972_EC0D3900 
X-CRM114-Status: GOOD (  20.16  )
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

Reviewed-by: Stanislav Jakubek <stano.jakubek@gmail.com>
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


