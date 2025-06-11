Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C737C71137
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 16:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q1Cool/KkGodX8Z3AKXl7cQge0BzoVtk/glY1zU+OpQ=; b=YL/6CjUrmGO1K+8/kD8wpg7Ihy
	GwOvJntEAkd3/BZPGj/Xa+WZZKE2QsQxMbfOMn+7aVt64VWDBD9TfrU3jne+zAVruBtaVbZamejhw
	R3ySh5lyPr95ShQ8GLOEkysGMoP3mF7kNHaaTsH1z6S1l6P2qvzYrs2Cw5Ha8odq1Q/CoFMwGUw5m
	XK8KckqzOtuA2QGKP9YmvVySFPlEmqlIOZ8kjHTUNuq5SIwkoaGXzkVVGXO9lXNCLPsEqe3QRSW1R
	TVshTtLEloZpkVgX6XgVHjrWNQtL5In+HVFC17QH9mepfmajfdX/g9ZohFPgYZb7i+PwQT5BcVH01
	uQRl2oow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPO5l-0000000AZEl-40YM;
	Wed, 11 Jun 2025 16:14:21 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKy9-00000009t7j-1IM0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 12:54:21 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so56315675e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 05:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749646456; x=1750251256; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q1Cool/KkGodX8Z3AKXl7cQge0BzoVtk/glY1zU+OpQ=;
        b=0KaHEqNUlQlmcibJrX6TywoGlW+wDGwzmIVy/wa2slf5yOL3UtDWxim33swZEScgng
         s2uSQ9O729KQR6xG8jCDvOn0P0JtCVeoEsX96LK/0c4xr7YDe4l14gejPgy0epgpvUcL
         +4S8CqQFjDy3y56rCg9pKq3R4J4V9FFr3AGc3V83L0gA0hcyZU4mdY8TNudc7KQ3azrz
         Eb/ugmOByslNqxbiFFZ4eN/960AACwBZ3d8KeuZE7KA9lr+L44pDDt4bEvTGqvUbLz1g
         O8SGewUo/IQ7strxv0Mv4vBVR1Jy9UbLHvxNFkRB7HEMsQ2cE5x0SsHl530cfkTMcE1p
         czuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646456; x=1750251256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q1Cool/KkGodX8Z3AKXl7cQge0BzoVtk/glY1zU+OpQ=;
        b=TUxyaVCIuhE9hZ8Fi13MZ0MRk4Ak0kQO1a9TG1gc3W04slYirBF3FNlcEg09yE/JoB
         rCrZWBJs9SQORvTnLw+wmAlDolTHSZQ8ICSCkEgJhWZ3m2m3aCvLqAOab0ARvvT4AU6a
         hJ0LZU4/UnM9yBUPI6naAP1qwNIcmpwSSPzxIvlKWU+U0lp09H3RYwErpJAoTWsCYKQH
         ti3d6+7ninM34rxhDsuBh7dm+yAKdgh6erCe/LYOx4QIEJn1PdfdGI8doQAKf91C5G+c
         ZMn8xZoosEOOviYQOnGmUG3nh5GelrYuysYcndkkEjMuPNBJCazW3gjSoa7JnMhRhgPI
         GrrA==
X-Forwarded-Encrypted: i=1; AJvYcCW2AMODnha6GTssb+QeoRWMOM/NCCvs0RQNJ32fxArTqoL2FbWWpgtd9vbkIOcJ4T5Pm7thSTx4hOLQhxtdVlfC@lists.infradead.org
X-Gm-Message-State: AOJu0YyG13kfBDyPELrGlyRHsOHzoPqmoBrRc+b/1VpPuoFZa5EMQzAu
	0h7Dkny09RdwCKSGScblAzSA84Nysa0p0qvOYAsAOS37l89cAcBPE2xFZMOfNR3tXXXmTzDkpaI
	nFJlv
X-Gm-Gg: ASbGncsoPNb7aEyGJNq1UanHN1egc0uCvgjr49yA19++QB++ERyO2YU/fmCeD3Mf7GZ
	ybQ9A1sbi9lxrWE7dEzgspT5Ec5c+NPeVtleIwDG0GvnyeBCnQpdBYS1smFtGxyBnjufLHhTkdC
	sJJhN4HcWSXUjocCqXwEleRvSavr1GK97uUAZ57K244O8S2Xcfcs7pJFbuKq7VDOv7LkKbAnYLE
	/EHu+0JEWCw2dxr4h+tlt9zUZwNHXpat0pOxEWiXlX2PamY/oXSZKMSX3DWpH0agFSYigewD5S1
	Gvj5rmui10IkBpBQDhEU+5hhySdOotXetJMvMmrARTCkj3XxFMP1jMzRu2ayLEaBlREOM1BYZub
	6VkBW5Ccx/To=
X-Google-Smtp-Source: AGHT+IEndovK5i60dXofmzfCQEmqHj9LiO/Bu6tcHs2EUY63JiHkYLaL474UbWr6R/p7cwzGJjwkKA==
X-Received: by 2002:a05:6000:4202:b0:3a4:c9d4:2fb2 with SMTP id ffacd0b85a97d-3a558aff029mr2487239f8f.46.1749646455662;
        Wed, 11 Jun 2025 05:54:15 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:8ef3:a82f:ccaa:91b5])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a53245275esm15225486f8f.76.2025.06.11.05.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:54:15 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 11 Jun 2025 14:53:56 +0200
Subject: [PATCH 1/4] clk: eyeq: use the auxiliary device creation helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250611-clk-aux-v1-1-fb6575ed86a7@baylibre.com>
References: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
In-Reply-To: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3080; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=911xKOJApKviZC+11zfPOxyXIb2TukqSX6c3EVx5nkQ=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoSXxyS4LF2NgHh6lDt4HtpPg68/w9OJYyIIHRQ
 pbd31+wpYGJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaEl8cgAKCRDm/A8cN/La
 ha5hD/wLniXN/Wdk0lE+moFPoRY5SqMESsaeB9W5MEi4ILxdPOGqiWLOjtZpsU9xfWIUaT0GO8I
 402HkOAnI8/gcBsBz7Xo663TN8FIChB/+plsclM8Yx4h0wjbZGA7O8FWT5mqDZkJ6QAKCtxftz8
 Y9JTHm7P2e4hGrVO+P6xiUkSQj8QZx9CRlcqpXA2JLlWA8t0WY6f3/5Q5ikgkK9AQpxmg3d/SbI
 F4eykgdy83+m7Sar8XsrSvwnbQMQ/eJU5PQewYVOOnkDHjss7jsdCU7aTxJHcD8WrrcnjzrqlSX
 pNybSBpRETU1JpLH9FOuV+dXTP5hBw3WB9whiYRoSWNjOdGuyk52zeSbNbmR1KK4Kp0Qx7kJ4hx
 CNFIDJ8/oBf3MMRjVa8TWO6zYa4ZvuH854db0sOivyrMS6Xxml3if+HpTAqQ6R+McVG0j4sBxec
 OzQ+QOTvaGsyZ/vuvnIT9ymNpzYNW2X4eqZOim4IFhXWs03rm+/9BKSMAj+WpwQT1SKIB2+/BHM
 Z1syPc2I4UnlAheE2uHP1Tkuo6SBUbfIvs3+43BU/e72C0UdNSQ+Ec2aGSdqiR/+Epsi0IZhKcE
 sMWbJC6gfc1WYr4Ua9VFkaoa+EOU2aYylmYQpq0CRPCmNfYsfOKs0KfHY/2e7Z7TAAGyb59FQ36
 LgtNe3dkZbYLE/w==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_055417_347157_CB48E2C4 
X-CRM114-Status: GOOD (  14.54  )
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

The auxiliary device creation of this driver is simple enough to
use the available auxiliary device creation helper.

Use it and remove some boilerplate code.

Tested-by: Théo Lebrun <theo.lebrun@bootlin.com>  # On Mobileye EyeQ5
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk-eyeq.c | 57 +++++++++++---------------------------------------
 1 file changed, 12 insertions(+), 45 deletions(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index 640c25788487f8cf6fb4431ed6fb612cf099f114..4094f34af05b488545cc87043fb3352968515a78 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -322,38 +322,18 @@ static void eqc_probe_init_fixed_factors(struct device *dev,
 	}
 }
 
-static void eqc_auxdev_release(struct device *dev)
-{
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
-
-	kfree(adev);
-}
-
-static int eqc_auxdev_create(struct device *dev, void __iomem *base,
-			     const char *name, u32 id)
+static void eqc_auxdev_create_optional(struct device *dev, void __iomem *base,
+				       const char *name)
 {
 	struct auxiliary_device *adev;
-	int ret;
-
-	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
-	if (!adev)
-		return -ENOMEM;
-
-	adev->name = name;
-	adev->dev.parent = dev;
-	adev->dev.platform_data = (void __force *)base;
-	adev->dev.release = eqc_auxdev_release;
-	adev->id = id;
 
-	ret = auxiliary_device_init(adev);
-	if (ret)
-		return ret;
-
-	ret = auxiliary_device_add(adev);
-	if (ret)
-		auxiliary_device_uninit(adev);
-
-	return ret;
+	if (name) {
+		adev = devm_auxiliary_device_create(dev, name,
+						    (void __force *)base);
+		if (!adev)
+			dev_warn(dev, "failed creating auxiliary device %s.%s\n",
+				 KBUILD_MODNAME, name);
+	}
 }
 
 static int eqc_probe(struct platform_device *pdev)
@@ -365,7 +345,6 @@ static int eqc_probe(struct platform_device *pdev)
 	unsigned int i, clk_count;
 	struct resource *res;
 	void __iomem *base;
-	int ret;
 
 	data = device_get_match_data(dev);
 	if (!data)
@@ -379,21 +358,9 @@ static int eqc_probe(struct platform_device *pdev)
 	if (!base)
 		return -ENOMEM;
 
-	/* Init optional reset auxiliary device. */
-	if (data->reset_auxdev_name) {
-		ret = eqc_auxdev_create(dev, base, data->reset_auxdev_name, 0);
-		if (ret)
-			dev_warn(dev, "failed creating auxiliary device %s.%s: %d\n",
-				 KBUILD_MODNAME, data->reset_auxdev_name, ret);
-	}
-
-	/* Init optional pinctrl auxiliary device. */
-	if (data->pinctrl_auxdev_name) {
-		ret = eqc_auxdev_create(dev, base, data->pinctrl_auxdev_name, 0);
-		if (ret)
-			dev_warn(dev, "failed creating auxiliary device %s.%s: %d\n",
-				 KBUILD_MODNAME, data->pinctrl_auxdev_name, ret);
-	}
+	/* Init optional auxiliary devices. */
+	eqc_auxdev_create_optional(dev, base, data->reset_auxdev_name);
+	eqc_auxdev_create_optional(dev, base, data->pinctrl_auxdev_name);
 
 	if (data->pll_count + data->div_count + data->fixed_factor_count == 0)
 		return 0; /* Zero clocks, we are done. */

-- 
2.47.2


