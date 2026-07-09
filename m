Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C1BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 04:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O1LTw3WK/9p+ZPz0q4JfjCRwvq1FGfxGeOWFBZeZJ2E=; b=PAVCM1IkkcHcwDUUW72XEI7ATW
	yZtWI1pz8RPkYuiwwz7DGHJWRy9Mq5iTIpO8lhMDXQe7C/GHdCfswvZLO6EMpPXwChbj9hEdVJWMZ
	FZ9lC0KMg5bywYXVDxEGyOasZv3HpaLmr/kx817LGBMG0viEVaGGX5HUgF/rwddr6dOM3+wC5nyQJ
	5kDwG8cIpce4Na/J2vw7tEWaLImlxeRRJLt/PF8zJdvwYOSLHNqCoscnktPTAmSmlYAPfwz6w7fKz
	iNDeZburvNqHT1J+sYG4nvlzhK9ikEiqj4XsCkYr9sKaNEPF01dVi226vDFsw1CEMXNtbHAvNWPbf
	q5SgBO3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whglH-000000010em-3j0T;
	Thu, 09 Jul 2026 04:53:23 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whglD-000000010bP-47QR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 04:53:22 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-37e0a189b0bso1159923a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 21:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783572799; x=1784177599; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O1LTw3WK/9p+ZPz0q4JfjCRwvq1FGfxGeOWFBZeZJ2E=;
        b=laA4VGx++AsE8uBNeBVLNh+U6hpHHzdhvzXx9aPTvAIkXNwkdWPArkXmSuEL+AIoBP
         Kt/I6VGEV8Q+hQ85AGn1e7FEcwlsSEuxQAS6zHOKEPu/ILT0E2LNOplVRZfkI1Ik5lFs
         7d/YpK2IsG40m72/UWhMd9s8etUOxV08N0Ee5tRSyh3VGvYpUuOumqJKgU7MXtVTEUNx
         SGacDMlk2lESPW130otiWdnWpKrtyFBahppeVYNUkbxNBC8eA5xl5MyiZnVWZ5T1NUuM
         SUqcpe9RDqFetePabUW6aeEwMi26r09w+OhQVEzpW8FSJoiUE2nsrtWFJwpjeUERsZW5
         BMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783572799; x=1784177599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O1LTw3WK/9p+ZPz0q4JfjCRwvq1FGfxGeOWFBZeZJ2E=;
        b=XoCMv3Tz4/G9lyck8n67FKoeeGTPYi4sMBWxfsgQqPZ5BaDrSXK65hqquGJZy8+os3
         R0yB4XWL8iyTXnJAG85ppdUXku0WTq0yRNlw+NCU/enJW16RfePljVHP+0HgrGybj4UG
         Ewp6vlXVLbLvVVedxr8cdNNUWmlobsokXG28hsyx0qD1rARU7DXb2dnEZXikJeHKuxWR
         4UDqfOUpvEiZXHD0pZrFoeJJdU+eDneuMm47oa/DBxzzJbjz0rboVeqXQaHpcMofEk3V
         IrA/GTDGtz8CjsbwIqDakbCobfQcMWzQMwEFPDbfN69by09qSwKOjGscuIh4l88KrWQl
         kx9Q==
X-Forwarded-Encrypted: i=1; AHgh+RrP2fTNlRhpl4IZcdQDDJWO8X0TdIT1mdp75NznCYN/lqB+FUWhC2K+KFJVRewDu55Ncbi7XEGOaM1Us5ZveXye@lists.infradead.org
X-Gm-Message-State: AOJu0YzSF0gZKRHnz9BqWTFgoFLiYIiR08rmWIQtJSug2LjoHQi6cBwN
	MJW97Hpy2OZRHQJJ3SWifYPXy0yqk3c6kiNlEBM0/pjf3nup9ROe2hn+
X-Gm-Gg: AfdE7cnfDHmnESBc+BVe3dkaXZdXhQkiQm9+3y/d//hm3bRvqzzf5kJNL3ZdGWFkaD4
	WNkvXNBzq2INobcIH/+j4eqSBbOda40aN5EugXU0Z8MCO8bpzynCmhqw8uFsh6UlX6Ricmit99t
	g4/7ugr3A43y0TR2YURhl8IjKxDPxU0TcgbHbhJXjmm40Xc2i96bP/nz3YNsR++123N2yf3fb4m
	HY6IUNqTVJ+PM6BZ8YuSpesBMX9Bbry/iPba9dXQg8x6nojR/8A+AGvVoSEP3/3q4fk7e2J2xuW
	Ge1UclhcwL+fG2NzA+43yKRtHiEyNxpGciPsvbBRW1Wq3wikKQ33DrtLd9gdROVkTzyA8y9PZl2
	KaiHhix4aa2ABvTc91q8G6s7sQzhqFbszKVx/Pw7bIcYr0x4ZzuQAURI41j3TzybHMCY9bBJK8n
	qjYFjY4pQ81Z4fuTmRYGzWgNu13hKtG/yn25E8KrbiNclePUlT/tBnEFtXL4jeT9Irwj9XwiB01
	3X/
X-Received: by 2002:a05:6a20:7486:b0:3c0:9c1a:894c with SMTP id adf61e73a8af0-3c0bd2ea843mr7270196637.68.1783572799026;
        Wed, 08 Jul 2026 21:53:19 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:e229:88c8:fd09:9a39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b658a99afsm26559252c88.0.2026.07.08.21.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:53:18 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 08 Jul 2026 21:53:05 -0700
Subject: [PATCH v2 07/11] regulator: wm831x: support software node in
 platform data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-samsung-kp-v2-7-3c6ed4c9b3b6@gmail.com>
References: <20260708-samsung-kp-v2-0-3c6ed4c9b3b6@gmail.com>
In-Reply-To: <20260708-samsung-kp-v2-0-3c6ed4c9b3b6@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 patches@opensource.cirrus.com
X-Mailer: b4 0.16-dev-b242f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_215320_032743_A290D61D 
X-CRM114-Status: GOOD (  20.42  )
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

Allow passing a software node via platform data to the wm831x buckv
regulators. This is useful for non-DT/non-ACPI platforms that want to
associate device properties (like DVS GPIOs) with the regulator devices
using software nodes.

If the software node is present, the driver will also attempt to read
DVS configuration ("wlf,dvs-init-state" and "wlf,dvs-control-src") from
it, falling back to legacy platform data fields if properties are missing.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/regulator/wm831x-dcdc.c  | 24 +++++++++++++++++++++---
 include/linux/mfd/wm831x/pdata.h |  2 ++
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/wm831x-dcdc.c b/drivers/regulator/wm831x-dcdc.c
index 834d7c181971..ce43c51c0170 100644
--- a/drivers/regulator/wm831x-dcdc.c
+++ b/drivers/regulator/wm831x-dcdc.c
@@ -16,6 +16,7 @@
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
 #include <linux/gpio/consumer.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 
 #include <linux/mfd/wm831x/core.h>
@@ -332,14 +333,26 @@ static void wm831x_buckv_dvs_init(struct platform_device *pdev,
 	struct wm831x *wm831x = dcdc->wm831x;
 	int ret;
 	u16 ctrl;
+	int dvs_control_src;
+	u32 val;
 
 	if (!pdata)
 		return;
 
+	if (pdata->swnode) {
+		struct fwnode_handle *fwnode = software_node_fwnode(pdata->swnode);
+
+		if (fwnode)
+			device_set_node(&pdev->dev, fwnode);
+	}
+
 	/* gpiolib won't let us read the GPIO status so pick the higher
 	 * of the two existing voltages so we take it as platform data.
 	 */
-	dcdc->dvs_gpio_state = pdata->dvs_init_state;
+	if (device_property_read_u32(&pdev->dev, "wlf,dvs-init-state", &val) == 0)
+		dcdc->dvs_gpio_state = val;
+	else
+		dcdc->dvs_gpio_state = pdata->dvs_init_state;
 
 	dcdc->dvs_gpiod = devm_gpiod_get(&pdev->dev, "dvs",
 			dcdc->dvs_gpio_state ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW);
@@ -349,7 +362,12 @@ static void wm831x_buckv_dvs_init(struct platform_device *pdev,
 		return;
 	}
 
-	switch (pdata->dvs_control_src) {
+	if (device_property_read_u32(&pdev->dev, "wlf,dvs-control-src", &val) == 0)
+		dvs_control_src = val;
+	else
+		dvs_control_src = pdata->dvs_control_src;
+
+	switch (dvs_control_src) {
 	case 1:
 		ctrl = 2 << WM831X_DC1_DVS_SRC_SHIFT;
 		break;
@@ -358,7 +376,7 @@ static void wm831x_buckv_dvs_init(struct platform_device *pdev,
 		break;
 	default:
 		dev_err(wm831x->dev, "Invalid DVS control source %d for %s\n",
-			pdata->dvs_control_src, dcdc->name);
+			dvs_control_src, dcdc->name);
 		return;
 	}
 
diff --git a/include/linux/mfd/wm831x/pdata.h b/include/linux/mfd/wm831x/pdata.h
index 75aa94dadf1c..d73a04c82ca1 100644
--- a/include/linux/mfd/wm831x/pdata.h
+++ b/include/linux/mfd/wm831x/pdata.h
@@ -12,6 +12,7 @@
 
 struct wm831x;
 struct regulator_init_data;
+struct software_node;
 
 struct wm831x_backlight_pdata {
 	int isink;     /** ISINK to use, 1 or 2 */
@@ -50,6 +51,7 @@ struct wm831x_buckv_pdata {
 	int dvs_control_src; /** Hardware DVS source to use (1 or 2) */
 	int dvs_init_state;  /** DVS state to expect on startup */
 	int dvs_state_gpio;  /** CPU GPIO to use for monitoring status */
+	const struct software_node *swnode; /** Software node for properties */
 };
 
 /* Sources for status LED configuration.  Values are register values

-- 
2.55.0.795.g602f6c329a-goog


