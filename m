Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05334C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 04:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2coInV2uMlLIpeqglM0vcfoc2SKHKrxAU98gxOM5VA4=; b=LC/9I+0siNx7BU26bFMqRdBAQs
	KxHEP+uPDwMWoCoCKj4Jp8BgZHkankv7HhNONcWr//A40GKjezRbbnxtpegynn4w8eHKE7rrRNoq5
	lCAkh4kvVtcVvivWkogttoeTjwYAg4ecwFmkgoR2FFLiM9tyI1dKo+3xzRXsyXQI89QtcFcZHGzv3
	5T0633YprKjVYJ7a12eIywyhSu74ogmZIGsyXFV/M613TgQcpl6C3iNZPX/IRi3jucivcPYpvGC8G
	xr2m+i4yxtELwvKIPs7eqqd+A1b2Ajm7Z7MWgOiml47iKfc/f3KS2LjvzVyT2d+0KFBJGw0SpF1zX
	lhFb/2CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whglO-000000010kk-0Sek;
	Thu, 09 Jul 2026 04:53:30 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whglI-000000010dq-00pt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 04:53:25 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-c9c26a5fb98so341716a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 21:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783572803; x=1784177603; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2coInV2uMlLIpeqglM0vcfoc2SKHKrxAU98gxOM5VA4=;
        b=haPWLWE7uUp0zegx0Ntn8n6bx/EUl5VMJ3j19ncAVmF/7ipkf+t1RxCpSK93XPjMqc
         UKTbCwubGZ4snBl1NxkZc2UgJgLohhdjGMQn5BjJUWJXW4JnhzmMKCYn/0t4/Yx/Y+w1
         gXXlpIdBoRbMA/YnqCci0XvVWwqVi7zZ/SEdloDi1GZS7CnfgJkrhgTPEiiK1x9gGRjQ
         bTEHgaEANkpsFge1zgNG+DZl7JwneCAxNeAOUTW8ED3LfeBB1UiEywBOKAYXQW3UIlYN
         lO86bskTAaxjKM9KNfbBWMb3lkW6V8cSMfz8h3tPNmMmg3FnqrRP3Q4GHpah7bjsg2jY
         NwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783572803; x=1784177603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2coInV2uMlLIpeqglM0vcfoc2SKHKrxAU98gxOM5VA4=;
        b=oV06Y3aWhCGyFzyhvs5IjtbuHOlz630gfI4gySC5f8doTGi7bv3v9yQKa8XAMyoK6l
         BmqtTvbwE18vdh9gfzJayIJwysjbIfqd4UYnGHyeEbaelX1W/P9Qne1DnsY445XF4wkD
         BV7ARcoqWMvEqvNZ64l2/htIzC6+wudcFoCutlWDz4814vtSMoXCO6BH5zRRzAHyk43w
         lJb1EOkVD4onoBtBTyXkjtg6qOsuhCnTs49q8M1SWhlSgX651GaLMAuspfxjMCtPtRAU
         wn+SxHiFm1mCql+kCHl9b4Ni5QwyF5z4ZqXJoguZNPORKhVxoDgPN+S0qXEHfn8JTcNh
         r6vg==
X-Forwarded-Encrypted: i=1; AHgh+RpJ2L6s/ZwN5gPFpHyuJNg9eyJiDuAnmnA8LO7mAbeBquBmJ3A/w7VSpskraSPnJ6l52NoDd1zCm8uAI4AMimem@lists.infradead.org
X-Gm-Message-State: AOJu0Yxxm1kMEUynoLK3r0U6fZqYpnw87MWzk3J2fonv7CcKHh+4C7El
	9E9G9aUlp9jNJA6feenD1kK5iLgesAykNjkME39ixz4dcLEEyHXYmKDC
X-Gm-Gg: AfdE7cmDsT9smHgRfo1G8BXwMuIAcIi8H8ScBnMADI4ADEc9SDHUOyBCn4V7YyBUFlC
	nVNT75qTLzC3qdWEitdhwSKRnIbe+f9jZQ73VKKg4fJRkUcFuhqVHG+z0hUXEJiJ9Lg2CJo47Vd
	WldEMKuRzZTV8kvUO0K7FnngXOXC9N/Epi5JRgBJs1vm5+L+4p4sVgN5ut2VQjyRCoowJgCqFBt
	rWZgR0qlEOUx0TjIfNVg0Hk9OqsdzKHgCSVpQyoE+ZOfgdec8pthI/JvRRBxXZvJKN1enBqN2mD
	vaM3LzfSOAAvewRhD06THDXTRKbLWfNPvn6d4SJ8VhzSnn3NLzlEACDcztifKgNET1exzYqUeDj
	GLomC9XAlML1eLJt9CniaMsPBpEfCbs5O7JvarJ7LL8JRdUAAcCWgp22jDo8BAVtrkhZXsiXvBG
	+Vv4ezwlOYzQ1OLKNLzlunDMrAouNSQ7R8p70ghwhHeKni0rH0zvvu6+P0lifK4xeoKLRnbAhHU
	WYd
X-Received: by 2002:a05:6a21:6daa:b0:3c0:9acb:3fb with SMTP id adf61e73a8af0-3c0d6a8ab01mr1403688637.32.1783572802842;
        Wed, 08 Jul 2026 21:53:22 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:e229:88c8:fd09:9a39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b658a99afsm26559252c88.0.2026.07.08.21.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:53:22 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 08 Jul 2026 21:53:07 -0700
Subject: [PATCH v2 09/11] regulator: wm831x: remove legacy DVS platform
 data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-samsung-kp-v2-9-3c6ed4c9b3b6@gmail.com>
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
X-CRM114-CacheID: sfid-20260708_215324_069816_E885F292 
X-CRM114-Status: GOOD (  17.30  )
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

Now that the only board file in mainline using wm831x buckv DVS has been
converted to use software properties, we can remove the unused legacy
DVS fields from 'struct wm831x_buckv_pdata'. Also remove the fallback
logic from the regulator driver, making DVS support purely
property-based when software nodes are used.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/regulator/wm831x-dcdc.c  | 22 ++++++++++------------
 include/linux/mfd/wm831x/pdata.h |  3 ---
 2 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/regulator/wm831x-dcdc.c b/drivers/regulator/wm831x-dcdc.c
index ce43c51c0170..05f49b2f5bad 100644
--- a/drivers/regulator/wm831x-dcdc.c
+++ b/drivers/regulator/wm831x-dcdc.c
@@ -336,15 +336,10 @@ static void wm831x_buckv_dvs_init(struct platform_device *pdev,
 	int dvs_control_src;
 	u32 val;
 
-	if (!pdata)
+	if (!pdata || !pdata->swnode)
 		return;
 
-	if (pdata->swnode) {
-		struct fwnode_handle *fwnode = software_node_fwnode(pdata->swnode);
-
-		if (fwnode)
-			device_set_node(&pdev->dev, fwnode);
-	}
+	device_set_node(&pdev->dev, software_node_fwnode(pdata->swnode));
 
 	/* gpiolib won't let us read the GPIO status so pick the higher
 	 * of the two existing voltages so we take it as platform data.
@@ -352,7 +347,7 @@ static void wm831x_buckv_dvs_init(struct platform_device *pdev,
 	if (device_property_read_u32(&pdev->dev, "wlf,dvs-init-state", &val) == 0)
 		dcdc->dvs_gpio_state = val;
 	else
-		dcdc->dvs_gpio_state = pdata->dvs_init_state;
+		dcdc->dvs_gpio_state = 0;
 
 	dcdc->dvs_gpiod = devm_gpiod_get(&pdev->dev, "dvs",
 			dcdc->dvs_gpio_state ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW);
@@ -362,10 +357,13 @@ static void wm831x_buckv_dvs_init(struct platform_device *pdev,
 		return;
 	}
 
-	if (device_property_read_u32(&pdev->dev, "wlf,dvs-control-src", &val) == 0)
-		dvs_control_src = val;
-	else
-		dvs_control_src = pdata->dvs_control_src;
+	ret = device_property_read_u32(&pdev->dev, "wlf,dvs-control-src", &val);
+	if (ret) {
+		dev_err(wm831x->dev, "Failed to read DVS control source for %s: %d\n",
+			dcdc->name, ret);
+		return;
+	}
+	dvs_control_src = val;
 
 	switch (dvs_control_src) {
 	case 1:
diff --git a/include/linux/mfd/wm831x/pdata.h b/include/linux/mfd/wm831x/pdata.h
index d73a04c82ca1..c48333552f5a 100644
--- a/include/linux/mfd/wm831x/pdata.h
+++ b/include/linux/mfd/wm831x/pdata.h
@@ -48,9 +48,6 @@ struct wm831x_battery_pdata {
  * I2C or SPI buses.
  */
 struct wm831x_buckv_pdata {
-	int dvs_control_src; /** Hardware DVS source to use (1 or 2) */
-	int dvs_init_state;  /** DVS state to expect on startup */
-	int dvs_state_gpio;  /** CPU GPIO to use for monitoring status */
 	const struct software_node *swnode; /** Software node for properties */
 };
 

-- 
2.55.0.795.g602f6c329a-goog


