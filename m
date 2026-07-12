Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF45AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 03:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IeKrQCOQwCtSB3eQzRia+4BzTdZbJgllKrvOfao2+VE=; b=iCvZ6HIFEN56w9/02/m6D5PfSJ
	FgbBq4yfB2Tl516zYDyNDdlc9zS1Ix59bhqGjMWuC9wHA4ZAtuO54BzsSZ2FaZb9mnEvsMmhEHYQy
	85A92NSmUZw1PwP2hATNq55egZYxyt8pRlOailOssuhqtfCFge4wMo6A4Dy77YEixhi2YQfIGIrtH
	U1Pa0GMSLxZPKMouBteRgEFDamW+Bq9LLkj26TbeGXihYHkVX+5VeTEUl8STo2S0/YYcnaH9IV+Yk
	Dt7JJksC7uCLnu+N1ufNVRlVR+shHL7J8LMomzppkyWusbfLEAqjxNT4mwc5D0TM+N9OZeQIEXpfT
	EVq/Y26g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wijh0-000000070Az-32wR;
	Sun, 12 Jul 2026 02:13:18 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wijgy-0000000708p-1c8q
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 02:13:17 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso2470913a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 19:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783822395; x=1784427195; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IeKrQCOQwCtSB3eQzRia+4BzTdZbJgllKrvOfao2+VE=;
        b=MrOtHaoquKnhtA4VJtgHwQiUvx4ImgqjPIEexUwQmUWc2KtTqmFrFyJAiGMO6vwbuy
         N8Vgu1+URyIBGriPAxmz/JNUiOWBmKj+Lf0CNaMv3IrbQtoJ1N5Yrc1hlCDYqv0r1xe5
         h8h2I0nzCwUJ7lteWiSqZL/FDe5BAhMLBHTzGeQ1jMnTGjv3/AGEN9ISL6Oo1nFUL2SQ
         Cg/vhSb5+t357DPpsilEwSx9OFd4YEZqLlXtYckdI84/wg7xpyMLKAFfSmQuXgi7Cujx
         IWecThBrwGKxUgN5b7EYj+RLobL8y86P598iiHaYKi+A75jA3IT16S+3NPu98Uvjs6Fz
         uSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783822395; x=1784427195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IeKrQCOQwCtSB3eQzRia+4BzTdZbJgllKrvOfao2+VE=;
        b=qtSfyu6/HwcHiSkoJBsWWr+Vyqk8fc/tSeBBJVNzMVwEKNWSvBPum4XCIIoSj8NYjl
         GpzVFzae2Ay1FUON5dgi2Y8rSZh0wsUoSAdqp3yj/AMDWjQk0We6V1Kdf7YyL91syy0I
         ImjvESGv9Vi/E+tAcd1S9gO93ZfIDLz8wovR9BdwVofcQyPyS2EORFmP+S6zK0QSFrlV
         c4tBZwr0cdG7QyGQGXUgjrsKYwGhJmQEpE6vBNG4w8UWklY0N5Cml8lvBZoTu/ib/gji
         qYAVuv6myAGQ/bEZ+1YcdcdObK5+cQtgdPvJch04tC0Vp7RF45WPA/UgLU9Bkuttq7cL
         uqZw==
X-Forwarded-Encrypted: i=1; AHgh+Rr5mgC0CbcHwoQ8kRGApqCM3Z5XCSBb72s12wO/7bomkSWLtpixIaZq96loN7UGQagtJ3EBPLbtxmhQ7QGoSfQ1@lists.infradead.org
X-Gm-Message-State: AOJu0YzjQBYAxBkb7zfKfZZNAJ8Yf8cbftKQVivrHy40PG6qrkqE2UFT
	qsAPK9GjKFQ7MnMm2jB5gIsSciAvQ38o0x6dOYsS6kSxrilRbjIwWbwPT3zJrQ==
X-Gm-Gg: AfdE7clPo6OmxAMk3P1AN2WS7QeuEeYDc3tbCPWyJV4ZUDnBLdWuxFVQ/2D+2RWHr2S
	WxfOqwySu3lza9+EGhEOIg1Uh1Psvvf1sNDggT0GvFJ5jjATvK5tZnIjjQfJKMZraXqV+EzpCnI
	7843kpqKyedL8vT9RRQPLpcPd0BrjQEa6kp3qBi/9zT19zKa0m5F2Netnufsy5yQKu7/Kemg+zH
	U2+w5Z9A3il8/cMCCwTlqX/ShJdQi8WkFeuhLVOp8JMqoY5eL+8Kbm5HTzfygs9bHY2zDOgxM34
	wEm3TpEd2I+uN74I9Qsj0zcix3N3NaemKkbEZILPvoosbj/I3Fn+1q5dT4XQl0mMZGqFsVOeqYQ
	P51YN6zVgZUdWBNR//0ctX8QEwo68UYWlLLt7CTO15GC6w8W5NJO921u+CVtJQTkEMKlivU/LXK
	owedMUiHIUtDu7Xpt3zz+7wy8luDMd43LclPYsw0p+s1yv7vwJsffWrajoqdHTZFRK2i1eLYZT5
	Vw=
X-Received: by 2002:a17:90b:3c4d:b0:37f:d70a:9605 with SMTP id 98e67ed59e1d1-38dc73bccedmr4361831a91.9.1783822395623;
        Sat, 11 Jul 2026 19:13:15 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:c63e:9756:a95c:c75])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117d847e17sm54796692eec.18.2026.07.11.19.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 19:13:14 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 11 Jul 2026 19:12:49 -0700
Subject: [PATCH v3 08/10] ARM: s3c: crag6410: convert PMIC DVS GPIO to
 software properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-samsung-kp-v3-8-b2fcaba77aff@gmail.com>
References: <20260711-samsung-kp-v3-0-b2fcaba77aff@gmail.com>
In-Reply-To: <20260711-samsung-kp-v3-0-b2fcaba77aff@gmail.com>
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
X-CRM114-CacheID: sfid-20260711_191316_435044_F04D59EB 
X-CRM114-Status: GOOD (  20.36  )
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

Convert the PMIC DVS GPIO configuration from a legacy lookup table to
software properties. We use the new 'dcdc_swnodes' field in 'struct
wm831x_pdata' to pass the software node to the regulator driver.
We keep the DVS configuration parameters (control source, startup
state) in the platform data.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-s3c/mach-crag6410.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/arch/arm/mach-s3c/mach-crag6410.c b/arch/arm/mach-s3c/mach-crag6410.c
index 757c0f383ff1..1abf08fdb543 100644
--- a/arch/arm/mach-s3c/mach-crag6410.c
+++ b/arch/arm/mach-s3c/mach-crag6410.c
@@ -456,6 +456,17 @@ static struct pca953x_platform_data crag6410_pca_data = {
 	.irq_base	= -1,
 };
 
+static const struct property_entry crag_dcdc1_properties[] = {
+	PROPERTY_ENTRY_GPIO("dvs-gpios",
+			    SAMSUNG_GPIO_NODE('K'), 0, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct software_node crag_dcdc1_swnode = {
+	.name = "wm831x-buckv-dcdc1",
+	.properties = crag_dcdc1_properties,
+};
+
 /* VDDARM is controlled by DVS1 connected to GPK(0) */
 static struct wm831x_buckv_pdata vddarm_pdata = {
 	.dvs_control_src = 1,
@@ -633,6 +644,9 @@ static struct wm831x_pdata crag_pmic_pdata = {
 		&vddint,  /* DCDC2 */
 		&vddmem,  /* DCDC3 */
 	},
+	.dcdc_swnodes = {
+		&crag_dcdc1_swnode,
+	},
 
 	.ldo = {
 		&vddsys,   /* LDO1 */
@@ -656,24 +670,6 @@ static struct wm831x_pdata crag_pmic_pdata = {
 	.touch = &touch_pdata,
 };
 
-/*
- * VDDARM is eventually ending up as a regulator hanging on the MFD cell device
- * "wm831x-buckv.1" spawn from drivers/mfd/wm831x-core.c.
- *
- * From the note on the platform data we can see that this is clearly DVS1
- * and assigned as dcdc1 resource to the MFD core which sets .id of the cell
- * spawning the DVS1 platform device to 1, then the cell platform device
- * name is calculated from 10*instance + id resulting in the device name
- * "wm831x-buckv.11"
- */
-static struct gpiod_lookup_table crag_pmic_gpiod_table = {
-	.dev_id = "wm831x-buckv.11",
-	.table = {
-		GPIO_LOOKUP("GPIOK", 0, "dvs", GPIO_ACTIVE_HIGH),
-		{ },
-	},
-};
-
 static struct i2c_board_info i2c_devs0[] = {
 	{ I2C_BOARD_INFO("24c08", 0x50), },
 	{ I2C_BOARD_INFO("tca6408", 0x20),
@@ -931,7 +927,7 @@ static void __init crag6410_machine_init(void)
 	s3c_fb_set_platdata(&crag6410_lcd_pdata);
 	dwc2_hsotg_set_platdata(&crag6410_hsotg_pdata);
 
-	gpiod_add_lookup_table(&crag_pmic_gpiod_table);
+	software_node_register(&crag_dcdc1_swnode);
 	i2c_register_board_info(0, i2c_devs0, ARRAY_SIZE(i2c_devs0));
 	gpiod_add_lookup_table(&crag_wm1250_ev1_gpiod_table);
 	i2c_register_board_info(1, i2c_devs1, ARRAY_SIZE(i2c_devs1));

-- 
2.55.0.795.g602f6c329a-goog


