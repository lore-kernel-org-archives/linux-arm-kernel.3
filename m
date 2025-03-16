Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FECFC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 18:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+2M+lUouAH0+Jr+nyjeHl+wxA0K/oLUPdCGmVRRMGE=; b=ZSSbcpfoRZBL3E/v2o+3La3zhb
	fbPNVpRJkqmC7OpJbvJVZs4CzM9QRKHNjlRh6ZqOjhsOK63WjC3Wus+afm1ae1+qg3DaVvXcpaZAt
	BImtFT5y40Wm0BDK6N4FpUDZuai/isRr3pVYAXfRorM3B99CzFv4NUo/8XD8sPlrgPCkHGGfdUd7E
	7U49z9lu2syXkKH66XdlRMUnbJwCfXYZbxWIggcCacCZCv5KC95fT9+oEUSAQtITW3RDgenUyngQW
	XmuoIAx487W1H8KpA5PCZ7Sw6kscTFVNEkJdFUXHuEaggMJsh3m3NZeWYSsNhdPJrYVTmvJ0pzSWC
	MTArJQSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttsjr-00000000T5A-23Nj;
	Sun, 16 Mar 2025 18:29:31 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttsa5-00000000S5T-2twu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 18:19:26 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ac2aeada833so726511166b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Mar 2025 11:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742149164; x=1742753964; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+2M+lUouAH0+Jr+nyjeHl+wxA0K/oLUPdCGmVRRMGE=;
        b=b/1SFVDG/5WhvBo1snDPSbpbhNfaWQSTyvg1dDMC5xeF/jyEgYSCihOHSXRsWJcpkc
         ap4va3J5BoAWM/G1bzvMw28ChMXixZO/CrWxi0IGiTjkhVw0ICKPuir3NbrJt+ULSndq
         gC+K3TYgPwpaKeFNuyxL4VSM4WPUYAY5XFyAsGlc0942XerkZsXqnTRx21Z74G9hgfWW
         OlEbohGU+1YExMCkN9MW+kCg+nyWmXk9bvNxk27mdfJ7Y2yLeZOT8/Bczoc8tqdyjBGQ
         KGNAkyonpq6RsBU142MiEroVwBRh3hwOQeN0MAARkb+135zVav12p3qRvwUWNB38AT0P
         VqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742149164; x=1742753964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3+2M+lUouAH0+Jr+nyjeHl+wxA0K/oLUPdCGmVRRMGE=;
        b=a1WjyQTGeYXREs/p2y4JBk8r6i0Ar6ZlfuEE15s1YlMGcIUZ96hqm/sWV6F3KoJT+Y
         ZP1AUqVD3Qyv/XUhpTSSICJnEZ5jSNNkrE4DGSLLcBlAFy1jT5H7c4V4sBx/tQZ/BtBj
         WseLELfHeSyfOcmVf3xvIZxvtxfBeZi9+Z9iZ2aw61ywVHDy8zejOhYsAWlFVmX1ktsy
         M+kze5VaA9bZr+Db0C1PEdF2XcQtETSMrv5aaGHNdxblTG1EySf+Jzn1NoJBJP4RkLx4
         CfS1kZHB4uNyDJH5bnfUVjOxtyWo4SpielWcNzpQdB1FppDY56enjU6zptNWAFk6u4eN
         0oLg==
X-Forwarded-Encrypted: i=1; AJvYcCW2yImRsLuOH6Kd2GWhXcPUo7aFcI7i7zxGN9SNmpdKLCEPwVyb9x5pgwmUjeKMMzsafnr5KhX0EEq3H2gOiMj9@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4eOAmDpYVX43q/BES5UFEvjqinA3Y395BLIF9+p8S1U8Qm0G4
	OeKDIqbw8jNndhmtnhPBMuSuMaODeG+3+jj27RCb9iyo3bSilU8t
X-Gm-Gg: ASbGncuoYqiNLP1sKnhdl3OQsm4fAEt3lalmqkvBlZjG9lgPlrh3PBDEXmhs37R7COe
	cixmN0QXoKjitvdEd23IAxki4h3lsPq07647Ic1lc4MiaN7tz2mij+0U0XhDkruj/WYC4TbUwoH
	cuXRTzp6gkyoAfAEiEBPmYY+DHGdKT00VUBQvH0hGHBt0sYsmbtJLFSyaUIcdRb18inBlh+vHDZ
	eoJdlM8GiEvlzBpIipfJ17sZuFF+QiLTFMk3z5d9WCb1eVVHGmWX3tsM4X/XPozU4KjyUEj8LkY
	S8xV3KbmZQn02jVWjaoqUKBYagCLdhXEc6m9SxXYiE3Mu16PxmAcVXVLxDU68ZBm1IgIme8FtXb
	8iHjW1YDbJWIO4y5u8g==
X-Google-Smtp-Source: AGHT+IFsTvbuptCDYunQGEX3V0GFkwHGo4NapBLiRy6Vd2DahCTU9/K1cdfNQ0FqD/7wqDp8TOiXNw==
X-Received: by 2002:a17:907:c5c3:b0:abf:6f95:22fc with SMTP id a640c23a62f3a-ac31250d4edmr1435495666b.28.1742149163867;
        Sun, 16 Mar 2025 11:19:23 -0700 (PDT)
Received: from hex.my.domain (83.11.178.210.ipv4.supernova.orange.pl. [83.11.178.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a48b51sm537951266b.149.2025.03.16.11.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 11:19:23 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sun, 16 Mar 2025 19:18:53 +0100
Subject: [PATCH v7 05/10] mfd: bcm590xx: Add support for multiple device
 types + BCM59054 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250316-bcm59054-v7-5-4281126be1b8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742149152; l=3092;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=Vau+qtkiLKbsSAyta7HK/1aydJ9QZlhuWFoLqVhFrJQ=;
 b=Puz/3rKPW+vwQzNF9UX3IyuvqUyjRTbdWltpxzMJVrt/04G9WW1WaR+0YI8snfqoouVhlGiHZ
 k8OUNSztcexBGxV73E4xGFmXY1qw2F3+nF0cL/yVTd+++L2hKHw87Ft
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_111925_735778_AA59DF2B 
X-CRM114-Status: GOOD (  19.36  )
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


