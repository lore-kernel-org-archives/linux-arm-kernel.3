Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FF2CAC5AD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 06:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HMp6cqsu59t8PToCUbyQtsreHZbwaZi5QAyb9viAGjk=; b=DMo4NPw+VCifKHrE14nQNjher3
	rZS1g06l/1fe+fcemC2NAZhQXybgF4O3U6X+TL3ENZyqXONzkUyzMx2bdIsvC87wBDoI0w1IA4KeY
	jhSBNSUchm/yezCnguG4Eq5dM/GkwOBjY77jdSncrCo788lqshKRJj35LX1/wMbhGwmoXpYW5zUHR
	1Cz1VlY7vnLg3Lo1OTxtLLWIy+yxbs4nrklZY20wHbSeKwVkDxOdUbfR/d8+xGVjJ4cL4QngFIYez
	NCPz9U17ZYJ+NrWgmpDHJxoc2bARUAAPgu9jORQ8nPRodjqP9Yh132N00AKFX6mjBO+IjWTP6bftr
	RJWq7Pxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Zw3-00000008wzP-3wLe;
	Mon, 22 Sep 2025 06:22:03 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Zvp-00000008wnO-43LL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 06:21:51 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-3682ac7f33fso12881571fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Sep 2025 23:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758522108; x=1759126908; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HMp6cqsu59t8PToCUbyQtsreHZbwaZi5QAyb9viAGjk=;
        b=XA1Xv3DqP8PoC/DkGo1ELnSvf4XCyZSUBUhez2nM29u/+irrjspFumCibD5WpqO+/x
         S9ppkKUbBMYqFHHrN2oLSGAsLADGZZ6VgjK8/JSob6VjZfldBxRK2TQdAqU6NiNX8YpA
         OyQ1ONbTkz7V8DmAerGIZpQIAH0qNm8GV3rp3jINHAFUBfWoEfSSC3HvXwD3VeZLeW3H
         iJDG9VIXdnx7FG44+CxmYkomrFSzWGkY0PtzHEh5rnrBwxGNdTdzN6dExiV/197Q8DhR
         iVAkR71NGff0+qalBpNSzrTWkIBIOMwLjC2tCvBwPJAl/yo5V7IEfwMx5mKsAgzYXB7L
         aO4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758522108; x=1759126908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HMp6cqsu59t8PToCUbyQtsreHZbwaZi5QAyb9viAGjk=;
        b=rICk57KheiLBcGxrNWRWY6vyXcL1kZNIJMhFR15mXTCLLMI0qKINd7+7Tm/+VepPuZ
         P5fprhzYipzCfWxLG36zXaZOejBFUYznwhY1CzPoorv5NHHecDdE275v56dSt6bLYzCY
         617dweZ3XiNdA/k7s9rCjALJuoerhVHQE2WZq2iY32+6weykM6xNrSXZj0zQI4EgGQlU
         PNMMDI3J6yHTQI6ITQJMdPSwrV86nKy95GdhwQc9YS75VfF5h1+kRYZrH15WlYvpoUvN
         872mHy1wfxCoF5JQSUQsrNjXXMLhbJtNRRMKqzuUTb5R103CNsSv+Ro5nM0SI2lu/JMP
         m94w==
X-Forwarded-Encrypted: i=1; AJvYcCVwUQbG8Cg4rEHdQ1BShkEdn8kBlbjs492mCY7CrEs3f5GMFBk5xu6OzxN/0byldC/zTFfawEA9z0IRNeZspiFq@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9YPpcKTar7pahz8Gg6jNdJAuQ2pVDhvTDjAz8VR690bqbC9ZW
	2SmX6Qi+iNcndV5QEVO9iBvx7AZfTLrHueVSrSncHg2/glIM/+l10+tl
X-Gm-Gg: ASbGncuJ20myAXFV7eFP0jEzjtRuo1DHF2Xoo8tnZH5HLSvQN0tg2x16aS5LJNj5FEv
	Jh6r3vow+SL7Qd9XDXCN1g5ELRVbXsN/Oprhj55tj/DtfcklAqlwQXFExhbi+QlQqH4ZiUxos/V
	eyVMKWk/I/LCT55zX3RNh+PPAdRIznBROQfY7dofgyDbmrmNdM6NkHvf9X4Pxe1wmFjWsNFhz1k
	lYMXw0SX/Bh3MEX66dNMLD8S6I3H2SQA1iRPNvqOCxEFWrQVdUM/zqBUYAdQGyg0vfYBg/vhyUg
	Q7qEV9ZEhtwgtR0nHnn9e6TrpB9qs1rFzeKJmx4e3rpqLrYZzqbrCNZKx/3VhBeGVTetSSICYRH
	vcBJ3ivD/ANOOKGx0+0b2crqDjSLoPS4l9JGRzgoRXYqWVErVQ7fvT28eqsY+uvKpxJI=
X-Google-Smtp-Source: AGHT+IF0vsidL+U2+O4cbI2W93e2V78iTNBrbec39/ev2fwTbSY9pJ2C+RDb5OzOvmi4WTyIjP7dAA==
X-Received: by 2002:a05:651c:4014:b0:336:cf86:d405 with SMTP id 38308e7fff4ca-3640b95714fmr22173211fa.18.1758522107716;
        Sun, 21 Sep 2025 23:21:47 -0700 (PDT)
Received: from [192.168.1.166] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a99e99e6sm26982661fa.56.2025.09.21.23.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 23:21:47 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 22 Sep 2025 08:21:00 +0200
Subject: [PATCH RFC 5/7] i2c: davinci: calculate bus freq from Hz instead
 of kHz
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-i2c-mux-v1-5-28c94a610930@gmail.com>
References: <20250922-i2c-mux-v1-0-28c94a610930@gmail.com>
In-Reply-To: <20250922-i2c-mux-v1-0-28c94a610930@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2503;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=MjUg8WhC2ePO7Wob4lthvdC2KmnV9Son3CvTOIR4tgM=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo0OricZTm/oAQ1+OD0EJGMjU7LFDFZX9qnJlff
 VHGUBLiknSJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaNDq4gAKCRCIgE5vWV1S
 MqW5EACBIOGR2Psx5ihNOOXVUpFaHO0xoSUdfph8wVOTYoK4bHA6EJ+dajDjeB81BQiKnzqdROJ
 q5KO8MrXyBQOclZ6ZLUo9ShVbfDBLkmEsMMmgQ1OwCAItwKVGIbWEoMaL2JkaqE1MN3aM9JJMwF
 XiocyRzYo7MfQYcQ9fF2MFW9/s3JjQWxNcOxFtRTQL/uiAvShs7xo1qSd9o1MwuYADaOCf5nxtG
 ok8vGe3ppH1WqTEH2BXlo65q16WaJWibq0cYf2lBoS6pdaXk8AMRZR/S8HqU8riZXZI9Cl6MC3u
 DaAX4ErhFEgocKTATdFujAYb0uEC8yB1C+Flti/MUX1Hq+qCESRlvj3/FxcFZvsHer7BpT8gZ/N
 6ajT1mb+IGjja3U+5vI38z7m+dwvub5O9998V9YxIelT80lQIMQJ84zVAHsJMAm92OBioY/vjyJ
 glvT0P2t+4BzSMhVVYqYfjFA6dMxqO6vJxLOdX5Z/EMO7HvfYMx8YbZCIkC+iH0PBNhXRPBJtng
 RqSEu2UMfmAtM33aYuTmM5iDA3QXxOTzF/YFaS2kiMQQGD1+22KcXDYTAJ8105ixvvyuGiUtWfI
 HyovMLr+YwvPkRfBuTpaCCqEdDM94RAoOo+2BPLHvYOt6Tl3i8r+9UaNtVGyYD2K48gOi4XORrO
 NT1P0BrqB2o4r6Q==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_232150_055790_FAC4ACFF 
X-CRM114-Status: GOOD (  18.44  )
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

The bus frequency is unnecessarily converted between Hz and kHz in
several places.
This is probably an old legacy from the old times (pre-devicetrees)
when the davinci_i2c_platform_data took the bus_freq in kHz.

Stick to Hz.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/busses/i2c-davinci.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index 6a3d4e9e07f45ecc228943e877cde1fd9d72e8cb..6b18938457d0c5cabc323c364d9330c2890df107 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -117,8 +117,6 @@
 /* timeout for pm runtime autosuspend */
 #define DAVINCI_I2C_PM_TIMEOUT	1000	/* ms */
 
-#define DAVINCI_I2C_DEFAULT_BUS_FREQ	100
-
 struct davinci_i2c_dev {
 	struct device           *dev;
 	void __iomem		*base;
@@ -209,16 +207,16 @@ static void i2c_davinci_calc_clk_dividers(struct davinci_i2c_dev *dev)
 	if (device_is_compatible(dev->dev, "ti,keystone-i2c"))
 		d = 6;
 
-	clk = ((input_clock / (psc + 1)) / (dev->bus_freq * 1000));
+	clk = ((input_clock / (psc + 1)) / (dev->bus_freq));
 	/* Avoid driving the bus too fast because of rounding errors above */
-	if (input_clock / (psc + 1) / clk > dev->bus_freq * 1000)
+	if (input_clock / (psc + 1) / clk > dev->bus_freq)
 		clk++;
 	/*
 	 * According to I2C-BUS Spec 2.1, in FAST-MODE LOW period should be at
 	 * least 1.3uS, which is not the case with 50% duty cycle. Driving HIGH
 	 * to LOW ratio as 1 to 2 is more safe.
 	 */
-	if (dev->bus_freq > 100)
+	if (dev->bus_freq > 100000)
 		clkl = (clk << 1) / 3;
 	else
 		clkl = (clk >> 1);
@@ -269,7 +267,7 @@ static int i2c_davinci_init(struct davinci_i2c_dev *dev)
 		davinci_i2c_read_reg(dev, DAVINCI_I2C_CLKL_REG));
 	dev_dbg(dev->dev, "CLKH = %d\n",
 		davinci_i2c_read_reg(dev, DAVINCI_I2C_CLKH_REG));
-	dev_dbg(dev->dev, "bus_freq = %dkHz\n", dev->bus_freq);
+	dev_dbg(dev->dev, "bus_freq = %dHz\n", dev->bus_freq);
 
 
 	/* Take the I2C module out of reset: */
@@ -761,9 +759,9 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 
 	r = device_property_read_u32(&pdev->dev, "clock-frequency", &prop);
 	if (r)
-		prop = DAVINCI_I2C_DEFAULT_BUS_FREQ;
+		prop = I2C_MAX_STANDARD_MODE_FREQ;
 
-	dev->bus_freq = prop / 1000;
+	dev->bus_freq = prop;
 
 	dev->has_pfunc = device_property_present(&pdev->dev, "ti,has-pfunc");
 

-- 
2.50.1


