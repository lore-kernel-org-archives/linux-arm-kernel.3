Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC6FC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 04:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GrfkfcUdvCW3rBx7LBcGMDMGZ2FYcqBrKqnDysmumDI=; b=OwTpoft6jto+rCjhzuqKPH2o92
	8qYA/WXkPdx2xE5aD+SKPGMhKzLe2OkkaRPcQSjuIApBxK+X0/FWpgvzq/EczNRNRuI68D1DpYZkG
	48k5vwK21SeX/ymoPjQ01Am73gn8EsFGk0VQ+0cBe9VSzn41itbeBNzMNuxJJP8Grnm8JZEeJ2Ssy
	akdAGi4FwvvqQXggWUTSU3bniS6Yq63nALxZKASNkY1a4xhSJgXXjrJK/Gil2FivycB1JiaJf0QjI
	jfDod3q0F7F8kTpu8+r9pQA+XsogowhiRqLORFUm8DNIFPFHmiuD7aBsstjqvjul/raqqUQWQmqku
	MwWmvIJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whglO-000000010kR-015C;
	Thu, 09 Jul 2026 04:53:30 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whglF-000000010ca-3vAj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 04:53:23 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c966b9ee9cbso798374a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 21:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783572801; x=1784177601; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GrfkfcUdvCW3rBx7LBcGMDMGZ2FYcqBrKqnDysmumDI=;
        b=e7cm8k58eqo8T8fez2onuPc8FEQDytm2QmqrfEWnfuXaMYmZOjdHvffnGwx70WyQwX
         GxiY0yCwG2zh0Q6yexRHoAGEwtEeJ8UEO7mvm2iTiFAVOF3c/KZZmEPiveihAZ7YAsbI
         2FoWMwy2u4VKrnNm3OZQk28lXIWlmy+ZTyYZ2xcr7XvGDJ7Q6gySLvRkvVcFUZD9JoD5
         TGooy1p7rQCnm7UOigWCdNXb+1iZErUlTyi7ujCsPgTI2jylhdG7PwwWExDQLkRGu6o8
         UV3jpvajj7pacNvzwodZOwtLplvFDqtj+xxS+0LBk7VdDfuh0ZTmUZiyjRYMH1tuSB7f
         iIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783572801; x=1784177601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GrfkfcUdvCW3rBx7LBcGMDMGZ2FYcqBrKqnDysmumDI=;
        b=eX/mqv91ut4VkrZ9gaxo3E7jIamZoSbi7q2rbPx9yHipogiCY659e0gghuuobgL8pv
         7uPtxDLzGiKYNWm7PXbRzK4Qe0tPTgq+cTvKNTjXC2m/Q4W2gdMDXwRuPgzmtqTmvz3Y
         bi64P8n56c1AZCZxrRNlv7StY7MdbXuUpVT7ILcGSGK60J3Ov3QcNtVxmLhKjU8cBEdx
         RA5FL0oZ1n3ZY6uhy4g8aOL7QI8a5SUJ33FIjiOFGjS1IoNKzdnlJ+JRJoqIb8R84ZzU
         QSRXqjLkwpPjZP9r5gk+9GEVMVN5b/8VCaKw3smU2NwEihyAbv8Nir3oPw5ud+YnYzmg
         mNBA==
X-Forwarded-Encrypted: i=1; AHgh+RqDPwsDVMtZMj+6z27luQ4g5Oas8OGpSqenNMMXjNU/49enHbrNRgwA6b1+8cZLEM50xbnV+GbpjzICgAOnhsi7@lists.infradead.org
X-Gm-Message-State: AOJu0YxeZ5ZotxNbms+Swp47jcLbX4OctE5Xag5W9jD6DENlRgpuMPIT
	iAN1hSlZwQf+js4ctQk/C+fCp1Hwx9Ejrwd1iRrcYvWgzKPXslCHX5xO
X-Gm-Gg: AfdE7cn2IVLOWOBZ0BDq7elBC2vRj5lhsVZcVuYvjIIJPh+sPmyPFYPWHBtatms08X+
	jcszxIKwgY6m4haggKhCK3le4ajoxUg73PVp71odBjkdMjIbkbV60C0xNLa+t5n7x/xrlpa1qCB
	wadTyh5V9kCa8Vwn36Hv9aamgSz4ZTMU81CgC+YD1yNGXoeJdDy/NYBA7cuJTOgbszio1RlotyV
	tBQJmWrm6h7pqnD+HzVVE/OQSzvOZqY39HhskZQlPKbxzOH6Ni8SjNKv7p5dpcvwrjlyJnPIS8a
	pxMnmYraE/kGWxlUhU9BTItXuTNs2I2OyBtWYTn3Ty1tUaCBsfgEb/IvswESPflfiO37bvCRFad
	/mtGugP2PhVCo1KIcoFLtYa2nnEsNWXgNThQ5C7zGHDOrsaY4F2frzRJxMC1A+dCCJLPPyKSEKc
	uFNvEBMY2ZhM425FBzFVxwLym6k5mB36sByslRtzbg3J8UrC6K2g4LRzIEfFUWLLVB3I46GxSOT
	BRoaez8UIIgMoY=
X-Received: by 2002:a05:6a21:697:b0:3c0:9c19:659c with SMTP id adf61e73a8af0-3c0bd206a8fmr6865916637.68.1783572801015;
        Wed, 08 Jul 2026 21:53:21 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:e229:88c8:fd09:9a39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b658a99afsm26559252c88.0.2026.07.08.21.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:53:20 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 08 Jul 2026 21:53:06 -0700
Subject: [PATCH v2 08/11] ARM: s3c: crag6410: convert PMIC to software
 properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-samsung-kp-v2-8-3c6ed4c9b3b6@gmail.com>
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
X-CRM114-CacheID: sfid-20260708_215321_981038_3D9C81C6 
X-CRM114-Status: GOOD (  19.68  )
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
software properties. We use the new 'swnode' field in 'struct
wm831x_buckv_pdata' to pass the software node to the regulator driver.
The DVS control source is also passed via software node properties.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-s3c/mach-crag6410.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/arch/arm/mach-s3c/mach-crag6410.c b/arch/arm/mach-s3c/mach-crag6410.c
index 9682ef67b866..4c9b8c1fb08e 100644
--- a/arch/arm/mach-s3c/mach-crag6410.c
+++ b/arch/arm/mach-s3c/mach-crag6410.c
@@ -456,9 +456,21 @@ static struct pca953x_platform_data crag6410_pca_data = {
 	.irq_base	= -1,
 };
 
+static const struct property_entry crag_dcdc1_properties[] = {
+	PROPERTY_ENTRY_GPIO("dvs-gpios",
+			    SAMSUNG_GPIO_NODE('K'), 0, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_U32("wlf,dvs-control-src", 1),
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
-	.dvs_control_src = 1,
+	.swnode = &crag_dcdc1_swnode,
 };
 
 static struct regulator_consumer_supply vddarm_consumers[] = {
@@ -656,23 +668,6 @@ static struct wm831x_pdata crag_pmic_pdata = {
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
 
 static struct i2c_board_info i2c_devs0[] = {
 	{ I2C_BOARD_INFO("24c08", 0x50), },
@@ -931,7 +926,7 @@ static void __init crag6410_machine_init(void)
 	s3c_fb_set_platdata(&crag6410_lcd_pdata);
 	dwc2_hsotg_set_platdata(&crag6410_hsotg_pdata);
 
-	gpiod_add_lookup_table(&crag_pmic_gpiod_table);
+	software_node_register(&crag_dcdc1_swnode);
 	i2c_register_board_info(0, i2c_devs0, ARRAY_SIZE(i2c_devs0));
 	gpiod_add_lookup_table(&crag_wm1250_ev1_gpiod_table);
 	i2c_register_board_info(1, i2c_devs1, ARRAY_SIZE(i2c_devs1));

-- 
2.55.0.795.g602f6c329a-goog


