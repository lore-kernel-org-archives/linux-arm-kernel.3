Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8875DC021AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 20:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q1Cool/KkGodX8Z3AKXl7cQge0BzoVtk/glY1zU+OpQ=; b=Ki9GuUXzG+NA3oQkSZxTpg4U8Z
	Hb3jqaLonuLvRpVfoIJU4uPyqVslEv50/kmbZ3Fm8cicHrsJjIAOJLd7tbEERpBJSpVnDGj4kGhI3
	vWJPBeJFECrWh3eLjCGOTE1+VDy6I8aI8iQIGNs+MWEEppkPBLdx4m57Fr2ro5dQhhxHpRohobjkF
	W8PeSVImIrpjYBGBHVu6zqzuH7mXDZwQUKom9zoA6SzAJUMndVX2zywvSCiCDSN0HtbAFSeOzh+C+
	tb3v+BldqA7v2oVrrIeuVbmN3CIHnIi99tydEgFjNEm5/RjVPm4gWvLQ/BBE/bwFvhrVvmZoOC8Ks
	I1aycfVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkUTn-00000009q6N-3qXw;
	Tue, 18 Feb 2025 20:46:07 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTIu-00000009a8j-3PV4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 19:30:50 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5e058ca6806so1288132a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 11:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739907047; x=1740511847; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q1Cool/KkGodX8Z3AKXl7cQge0BzoVtk/glY1zU+OpQ=;
        b=bCfADLDlvvrSX5cYYePwcRpaHfUvZldLRp480Re2LfDqedRZ3ksrqE9s7sTe6nKBX9
         kGFcbGzH6qw/7pL4QpfaEu7YolSc5pxMfhCrl2f9Z9HPJcTOYKgo+ICh+zHO0M89ba3T
         Oykrc7upCN9CWBYWsvw9eXWhS/bh6F9vEjU0x6qWLI8UDrsP1h4cf+iH/ZSOXJYJKJ+Q
         LfSUmWPMo26CDxsjJbirBcG2IoSh/8GnU2kkD6qDXVnYkzzDhwTSYy29e8P7DsKOMT0Y
         mc4wDfsgPo04oSS0gLPxLq4g55037uZ5GO+E0Ar1L9i/RJOYnDXeJtLsgzLTuXpKtl1y
         MMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739907047; x=1740511847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q1Cool/KkGodX8Z3AKXl7cQge0BzoVtk/glY1zU+OpQ=;
        b=NcNkBNyUWG+y396vFLSMEY3DSxknnY0kaVDfD9fa+IH3D8nov08iWbCD49I6QliAso
         ibimYR97EkGzAvsJGPpMW5D+euumNYpYSG3vVLNAFTsnpvzh6CJdISCTyZUN/zqV9DNh
         oFZ5/7g/Am0RJitkZX7Z5teMATUj5Cf1/AzoR132Yss4/v0xp2PwhEDxSD8eRAYmJqpz
         6MYiFSZnK+bgxJrkuyIDaCjSlX483HVosUYgAhAzSiuxA/4S7yf2KsuCNNWE1tWSpow0
         4vT3G49QaOkmf2WzifPJkVKsQSTO+3mLNDjBj9kh7M1ciFqZ3isWirmb1z4BE+iDYm8A
         noGg==
X-Forwarded-Encrypted: i=1; AJvYcCXl73N9qPTpD3CIjKy4D9PKuZIlXtxHEADXQN7p9IsNvhBCqCEzoI64yZqcWNL06A+Sk1l0d2laTda0vYGs6Xk3@lists.infradead.org
X-Gm-Message-State: AOJu0YyL4rysaa+qU2A4k29MW27va80He+SDqTT/tX2/dAHwPrwi8Lsy
	06but2crtdUZywPYHeOn9AalUNUM1xqE7I64wOl2bOESnlXE3Tu6jx/B7acNYF4=
X-Gm-Gg: ASbGncsXiRrUM1Jy+dY/kAUQuZcBPwzFnonLhm2ufuIa0IoMTAUwFRfW9wLeoBiEuJW
	mmc6QFI3Gl1AGk7khKfKpVN06yv9BeZpE/N+ftGvsx23wpdcFnbd6Vyax+NY6vRc3FX1oKAvitx
	79cAzCM7DS8scMBp2a3SxV5ZKUpMIGzsDZ913qqXYrmtPrS31yYtoUlzBmt0bu0sARqZQiAbSLZ
	ajP8ygiULRZLXbUbDazkYfJ1XFfivN1e7YoU1bzK7+SZmhrrnawCrnlejHGkRf5eFKDZJgMX7I8
	XshC/7xdS0e/WBuNGKIqTdumYXh3
X-Google-Smtp-Source: AGHT+IFuCiWjYik1tkYGoQgh4ZsFo8lmztzxBCjOpVHi8VmVD4pqRZa3rFXJofCtONyce7E+IyRCXQ==
X-Received: by 2002:a05:6402:4609:b0:5de:525c:53cb with SMTP id 4fb4d7f45d1cf-5e036043d74mr14749201a12.6.1739907047405;
        Tue, 18 Feb 2025 11:30:47 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:cbaf:af0:839d:fb4a])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c3ce5sm9338985a12.17.2025.02.18.11.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 11:30:46 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 18 Feb 2025 20:29:50 +0100
Subject: [PATCH v4 5/8] clk: eyeq: use the auxiliary device creation helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250218-aux-device-create-helper-v4-5-c3d7dfdea2e6@baylibre.com>
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
In-Reply-To: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Douglas Anderson <dianders@chromium.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3080; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=911xKOJApKviZC+11zfPOxyXIb2TukqSX6c3EVx5nkQ=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBntN/TCjdli34EttLxXtExpNQaPhDVC9bRlZCzA
 Z9Pj+ToqrKJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ7Tf0wAKCRDm/A8cN/La
 halfD/4t/Q1MfjlL6VZuSiHTSQPRAa2QAwtLrhbOZWIEknOslrn3QFObs5s6ZPqryvP12HbeHpB
 ZqtOFjUqe/ieQB3ITOsZJaewTPwytAAIwK3CgywZ6JOUxa+9g7HGTKvG3uOOJmkRIffzZmr3L8R
 NZ5pFyDvvdDjI5pECZrNMk4VPJkwSAIgH5iZfiqrRun1haUOJoglpQY8Y8EADKhayv8tRAynR4l
 qDsiwIJrdtBE25fKHWyOZDOE8tpQxMsEt2TrH5ebbZtAEtr/gH6YfiiTUbuz37DxeauQ6mj6ehD
 XTEhxGJYCgV8aSKkCalZcuRKharsqxXA2evtvPHKpQvKOyIZ8EgbBeEOQ7dOeXKjzhWOM5XtsqE
 aMUycH4kRdaTgn4jHRICD4dLzYS3dXyYx3r7rGFlO7duZ/8KxdlzdluJ5loozQhR7O5ANEzTyHJ
 oRWP1Otit21XBW620IoAkxL8DF+P4i2UVjNzAOmtxgzut6dBQb1gzAm06Dpb4EJtFyAnO8mdI/H
 TIGsc8Ti47aBOluK+kO9s5wUA2fZ3WFLXDsN2BGvN4+teT6is420M3bHdw3I0/vCDlh1nH3plyg
 XifkLcQIVqvbW2dYXxE/b7rFiZ7Tza9okUXIhyKDFxmZAvQJKCF+0Z0Tgq8zioD1LftOLwSybaY
 ndwZJujpyaFfb8g==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_113048_862038_F3FEE8ED 
X-CRM114-Status: GOOD (  16.41  )
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


