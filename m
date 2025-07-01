Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D75C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 13:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K18eD4fwuNNbiShs9650A8odEfXbIRgpXnl+v+odKRg=; b=eBDN+LgGAPKTNr0bOzOMwIeGFm
	ufGFRwvmpE1BPvonp/dbOBLoTEPkkxm0CHCI7L6z2L8gbvFXwblcnVTDveS7YqZ7Zq07cebi4qCDV
	mtkXXymWpFeJAnfyPrWgzu1uAqvAH9LNLyzN9BbMexHWWnRSBDIis9zw4tWGFUMdRb6+CW/1ChdIT
	6esjzv9B6MOGq65NL2hKxiClUCzDtqT+y4Y0QXyQ18gDETtAF4m63ug+l3MaUpJ7CemeQBE59HlXp
	Ti7oCekjgGm2f1Hc/FQr42zHfyLkhxTTEOgccSsynvaZh+Nt7XeOn/QxtUZhRUo9/1dqomtq9tk7f
	E7qTeo8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWahG-00000005S1r-2JyF;
	Tue, 01 Jul 2025 13:06:50 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZUp-00000004vLM-1Fc3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 11:49:56 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so38882695e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 04:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751370594; x=1751975394; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K18eD4fwuNNbiShs9650A8odEfXbIRgpXnl+v+odKRg=;
        b=VzH7YEPhgo+5xFKMdjP0JIccitP7FJxyNmTfvuOX9MyqyC3NAgfCJmL//c+sZnar/W
         IGXTR5tHVp1dz+WFaMxuS5/A2K9EDwFXztgiAWJaRqkvJ2v72SGyxjkd8OqMIBIpdR/Y
         UbwKys3dpEbROrsF2AXnYhdII2IKMHl1qZtBxjoN3k8l9y1l9/mFRdrxH1u0mLJe85u+
         oWosYGuipUxmLK8XqZg1RFh/noFlFWDk0wyMGNnQAqr7t9MTsCL64zyIXqMfuEEE/LSp
         kLcTBNrQWlC0FSS0FVf3yikybvAOxxAZkI3519fItiajRuZE/iyTSJVRxFycdAX2LBYn
         SNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370594; x=1751975394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K18eD4fwuNNbiShs9650A8odEfXbIRgpXnl+v+odKRg=;
        b=aRkbDlJPWDOetdXBcjRZb6C71RtHSg8Z2pts5zwV3WXb8ErI45KNSABC0lEJT0ZMR6
         Pj4Ybhn7iSumF8rlTdWs2HijhOlBuQ8N+X+K95aGqd4JSvHeyQsIcJM3jljtwmDLMG13
         Om1nAH5jTTnukJuAoSY7QkHUcQMFYCa/4UtpQ6knK+mJvfK/fxTACMhDf25ex2v/9acZ
         b5b5+S3v4FNNIknDw67TgrqPoQWgfqwKbovepyq82yBBoXKwKkBn6iOMhpvDDUW/EcAw
         cEgYoP3Uh3A08oVNqu66MJyejeGPVVgokRiQtlVoFbfJPrBsNc1CTt9UvtfXca0opOub
         U8+A==
X-Forwarded-Encrypted: i=1; AJvYcCWeRwOvZG2VeGY6bbw7S87BrZvIqITB9FDn6hP0MYgmMi94ENZj1DFa8wEsSU1d3JbaJOJRy3bmTu2Lut2drtFN@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/zEBSbNXwHIAjDKUWx860j2MMwWQtElt2WG2aHUSQ/QJxhgDG
	fRALOtJmL7gTsZtOf6ZFw7lasP//WFW2h38ujVcs1ATKpF++82F+lEtx+/vTAyyzkK0=
X-Gm-Gg: ASbGncvYh7FgycePbHFPe9qCGk5ShV1PBMP2Rq1Rfs9sJyZoNMX69YBHyRw0RACF5z8
	zH3jNrKClY+nB5UlnSIL7NXqhQPDJIQ6lhwocxAcl1B6FbfMHr0T4VjP1LbzeO5q+64WrIPTCkV
	NKXbsNl53LEayRePD3h1t7Us11Jqw8pPITyVehLcYNRzTgciu9/E/IZrIy4VT5dk4XVM4EQqfYb
	tEqw2wMqzGsfY+Vc5kB5hbYhgy2o/0OvMpw6TGu2CKmF+WajFCtK9cUU+Mh4wmibwuTEZPws6MF
	wj7RTSv4RmnPhXEnhjxUqD1BEuDot1m4urZ357R4L0BnkUcvFvOLhg==
X-Google-Smtp-Source: AGHT+IF1V2h4z8e2b+q/5QYbiJ/3eFoAFYUWiFfRtaEit+V7F7YE8tn3jrKaiEhuVsy1QNVoKx5zRw==
X-Received: by 2002:a05:600c:a11c:b0:450:c9e3:91fe with SMTP id 5b1f17b1804b1-4541b6db66dmr14175005e9.0.1751370593607;
        Tue, 01 Jul 2025 04:49:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a387:7a32:8457:f9b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c05csm193988925e9.5.2025.07.01.04.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:49:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 01 Jul 2025 13:49:40 +0200
Subject: [PATCH RFT v2 6/6] gpio: mmio: remove struct bgpio_pdata
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-gpio-mmio-pdata-v2-6-ebf34d273497@linaro.org>
References: <20250701-gpio-mmio-pdata-v2-0-ebf34d273497@linaro.org>
In-Reply-To: <20250701-gpio-mmio-pdata-v2-0-ebf34d273497@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3955;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=WO0jeIzGeDRWwlltYN6KLDzN1nDqq0wG0YjMIyZ69bE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoY8tYQedunR7lNaIA7I2BJg5XNf3SaooHlaS6n
 viTggRWov2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGPLWAAKCRARpy6gFHHX
 cl8zD/9sO5Jq5Wzq/bFjPjz0TkCxAfA5RvMtEcX04+91lEim8zAy2tLuujFKQ1EZ/j+kEzp/ga8
 CLi60fQsJF9gk8a9ecsDKXJrdDGTTemE0ws2iSqALUPjbzY4By3p7V2k0SOO83KHs0ctsOoD+9N
 j/yo2H5t5ysxHnYdeigLWyqXvu1K99c4tqkDsLtqK5lCwnh6E24Du9S0/AvwBUdG7C4cyqvQvty
 yrpq7ffBrIkIOQLuaygE/7AsMojI+8/2L/W/Kx8h/9rooyCSTLOloACnjKYQRehYvJ4CiIbit6H
 OWQWN8RKj4eWlATCcwyl93QshTZQvWA+YWiMnN8qcIcmPEaT+24/tsrUArlctzTBON0qdg97Jqg
 8OJ3bhql9HaNoy29uJ58PsUuzo3+x6sOObqKhld8IvZ62gVzsZlV1CHja4VodJFPHAo1Olz4dJI
 kXEIuPj1pr0ybdNuFDKc2x7IjrwIIO/FQmlWDSFSApeeQaT/8BCnOXU4Pt6RV3FkYiBrGKWl65/
 v+k/Hh67+XZqW85RmvNdrYOp1MhRcMxhG8casJMj7bEiqbPOGhhzqyGlr0CmKFeIwbTBgS3u1lI
 S23NYaez7ty+9cARY3vV9jFOmbzvIBOvMqwwetL+ELUsC4uieXEgDQbHX1rDAIlSFzqmBJR90ZA
 IVgRnicRfV5w2IA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_044955_350214_41547BAF 
X-CRM114-Status: GOOD (  19.37  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With no more users, we can now remove struct bgpio_pdata. Move the
relevant bits from bgpio_parse_fw() into bgpio_pdev_probe() while
maintaining the logical ordering (get flags before calling
bgpio_init()).

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mmio.c    | 73 ++++++++++++---------------------------------
 include/linux/gpio/driver.h |  6 ----
 2 files changed, 19 insertions(+), 60 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index f66137caa245b14e6e8dbd043243224bc47c9609..cf878c2ea6bf1bb6dfbd1040d64787687335132a 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -734,43 +734,6 @@ static const struct of_device_id bgpio_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, bgpio_of_match);
 
-static struct bgpio_pdata *bgpio_parse_fw(struct device *dev, unsigned long *flags)
-{
-	struct bgpio_pdata *pdata;
-	const char *label;
-	unsigned int base;
-	int ret;
-
-	if (!dev_fwnode(dev))
-		return NULL;
-
-	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata)
-		return ERR_PTR(-ENOMEM);
-
-	pdata->base = -1;
-
-	if (device_is_big_endian(dev))
-		*flags |= BGPIOF_BIG_ENDIAN_BYTE_ORDER;
-
-	if (device_property_read_bool(dev, "no-output"))
-		*flags |= BGPIOF_NO_OUTPUT;
-
-	ret = device_property_read_string(dev, "label", &label);
-	if (!ret)
-		pdata->label = label;
-
-	/*
-	 * This property *must not* be used in device-tree sources, it's only
-	 * meant to be passed to the driver from board files and MFD core.
-	 */
-	ret = device_property_read_u32(dev, "gpio-mmio,base", &base);
-	if (!ret && base <= INT_MAX)
-		pdata->base = base;
-
-	return pdata;
-}
-
 static int bgpio_pdev_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -782,18 +745,10 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 	void __iomem *dirin;
 	unsigned long sz;
 	unsigned long flags = 0;
+	unsigned int base;
 	int err;
 	struct gpio_chip *gc;
-	struct bgpio_pdata *pdata;
-
-	pdata = bgpio_parse_fw(dev, &flags);
-	if (IS_ERR(pdata))
-		return PTR_ERR(pdata);
-
-	if (!pdata) {
-		pdata = dev_get_platdata(dev);
-		flags = pdev->id_entry->driver_data;
-	}
+	const char *label;
 
 	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dat");
 	if (!r)
@@ -825,17 +780,27 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 	if (!gc)
 		return -ENOMEM;
 
+	if (device_is_big_endian(dev))
+		flags |= BGPIOF_BIG_ENDIAN_BYTE_ORDER;
+
+	if (device_property_read_bool(dev, "no-output"))
+		flags |= BGPIOF_NO_OUTPUT;
+
 	err = bgpio_init(gc, dev, sz, dat, set, clr, dirout, dirin, flags);
 	if (err)
 		return err;
 
-	if (pdata) {
-		if (pdata->label)
-			gc->label = pdata->label;
-		gc->base = pdata->base;
-		if (pdata->ngpio > 0)
-			gc->ngpio = pdata->ngpio;
-	}
+	err = device_property_read_string(dev, "label", &label);
+	if (!err)
+		gc->label = label;
+
+	/*
+	 * This property *must not* be used in device-tree sources, it's only
+	 * meant to be passed to the driver from board files and MFD core.
+	 */
+	err = device_property_read_u32(dev, "gpio-mmio,base", &base);
+	if (!err && base <= INT_MAX)
+		gc->base = base;
 
 	platform_set_drvdata(pdev, gc);
 
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 97cc75623261917e9b3624e1e636d2432c0db205..4b984e8f8fcdbba5c008fc67ff0557bda11df40b 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -718,12 +718,6 @@ const unsigned long *gpiochip_query_valid_mask(const struct gpio_chip *gc);
 /* get driver data */
 void *gpiochip_get_data(struct gpio_chip *gc);
 
-struct bgpio_pdata {
-	const char *label;
-	int base;
-	int ngpio;
-};
-
 #ifdef CONFIG_IRQ_DOMAIN_HIERARCHY
 
 int gpiochip_populate_parent_fwspec_twocell(struct gpio_chip *gc,

-- 
2.48.1


