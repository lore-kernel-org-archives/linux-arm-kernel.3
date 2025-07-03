Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DA1C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 20:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qTtCCKdSkgMTplzEICqTViHzDjQLzZrHGfmUBwRIypA=; b=yCOcsOcNZca+8ySXLNnp02rVSR
	Egc8BYC6OaiZapEotGh4B21Kh5CnoVPJfig7zVREvLzZLur1mkS+00zw8BOJLxFgF3A4CjRtNWprC
	I2xOEceY9uqeHDV0M0Fi/f0dNVjzN4tZ9vVdAQtV/p0gbtZIP/GPnumClyhqiOx0FjYh/oQXhsQ31
	hYpD9vbyLD6qZA1OAbJE6Y2dJMj7v/bVnbg2AEv2koLtoJnQ7WmROSEKihd8HKVF5FiTZhz9im8lr
	Z/qxeD0zB2ArygTiY1+z4EOvGsnxq6fTf6xcQr6Z0DAsfAh8+SltpTk+dmGcLRH4pDPkBr39lWYDS
	a67aPV5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXQza-0000000CTIa-1ExG;
	Thu, 03 Jul 2025 20:57:14 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXLd8-0000000BmPv-2kwK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 15:13:43 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-553b6a349ccso52942e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 08:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751555621; x=1752160421; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qTtCCKdSkgMTplzEICqTViHzDjQLzZrHGfmUBwRIypA=;
        b=mq7lNC9WlYmQ0xFhjCicmAkXSRkpe3mUZYCl2nDwQV+gIcVc0m2tSNwJvnOF5U88h6
         lfLFw0VsjRIfEtFI8P6AGKzScSgq5FpQ864jBIHj27AmdZ+7Wa8aAIZKXs6ubKUaYU/2
         aW5hUNgLifqFaKS1FKlbmb8fuGr3ppwXdJPuFQRWntfaQqd1iwBVMB+h/Rhv8u9GpSc7
         LAvBxGL3fWi9sqMjW/KTOe32SiZnuhGS+aaW40VU/uw31IkzyfPzF3TQstBldv7smE1X
         YasqWrSoxtQDclPgbz569/I1NVYpnKwGlhyb6Dsd9yfJRQ0AF+aYv78Kl1tMV5WwJ8pb
         u1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751555621; x=1752160421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTtCCKdSkgMTplzEICqTViHzDjQLzZrHGfmUBwRIypA=;
        b=msMzm9YD7o+aItXPbUn0y+ozfRDzdGJ23f9twd/tSNxuu1waykwIFzFCrKAO9gRa9G
         OktUQqSnORw87vPOK5hcszQHZr6cpmdYpoylrX+sS2DZzTC3iheBRefjE0dcOTGnpDSf
         9BjMeLT8WUSsm5ettGZEExu679ZIES72S5yVmzN9XjLoZfsvWiF+rgoZNWKbNoFAWhdT
         +2JOz1RFLlPPGCx7JmYXX8qZEbDxNFu6Lr+veLB/Sp3ewCB0Fa4smuDYbLF8rqcPZ/NO
         0JSm6Hr5dJFI/gU6VLf9CRwIe9h3VOQ8op8qROvKcygiScdU6EpiUxUnhPDGoh+z5f9J
         8X6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUOARrHFls0rh5Pq3llXS7GJqJEJQBHgwtaLs85AYNg83uBJHtLczm2FuArTurqHbYH1LEMMiOgcQDtYIG5HJXS@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp+fhM4lyb5a+309WRwpd0YDKt2OFYN0h9toXLJ+lnamfixJGL
	ChAUvqLxDjLsJP9cN283nxWhAgtplfPU6OWudbaCdnLfFspHLoDuOBXe
X-Gm-Gg: ASbGncuEkrKu3/oJtbZOQmgPRXUsY4PJs8Ol7vVl0+tQvFkGgKxHSxwfHRu30Tym1O2
	dC6uFDwyTwV7jtp3mkttJvyPx78xIhwqUGedhnzFxpQqSqtnhZOjvUmMjlC96xVHTHy0OWdNjOU
	1zIq/r82OyL9rkzUENVKCsCKZuY4ybWFGCxTPXb755GO7UfQsYBE6oLWb4cbreNeZ65Tbv1jqbZ
	LrN8Cy7b2foja1ch3arkL193N938oH/9FkpnBPF7t7+hB+/brGc21QYawKLGiHB2MMt2gPFRwJk
	uGm18Jfkkne9o9RiEMwTqa4FCUhggWoiG5M3PL5v53/olXS1Ckn2PlHW+mvGZBsrpkGQitQ=
X-Google-Smtp-Source: AGHT+IHEoQ3VBnGpUAKadTkkygNlVfx/f5KZwlHVuHvFboG/MKYSU/fiu0UHxdI8WmXTbNEBc9ufgw==
X-Received: by 2002:a05:6512:b12:b0:553:50f6:ebcd with SMTP id 2adb3069b0e04-5562ee80659mr1189950e87.10.1751555620488;
        Thu, 03 Jul 2025 08:13:40 -0700 (PDT)
Received: from localhost.localdomain ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384ae15esm725e87.178.2025.07.03.08.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:13:40 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 5/8] thermal/drivers/sun8i: get calibration data from two nvmem cells
Date: Thu,  3 Jul 2025 23:11:29 +0800
Message-ID: <20250703151132.2642378-6-iuncuim@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703151132.2642378-1-iuncuim@gmail.com>
References: <20250703151132.2642378-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_081342_701294_1C078F52 
X-CRM114-Status: GOOD (  22.98  )
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

From: Mikhail Kalashnikov <iuncuim@gmail.com>

The A523 processor has calibration data in two nvmem cell. To be able to add
support, the ability to add data from two cells into one array must be added.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 drivers/thermal/sun8i_thermal.c | 77 ++++++++++++++++++++++-----------
 1 file changed, 52 insertions(+), 25 deletions(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index bdd15ee45..3f57f1a6b 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -303,43 +303,70 @@ static int sun50i_h6_ths_calibrate(struct ths_device *tmdev,
 
 static int sun8i_ths_calibrate(struct ths_device *tmdev)
 {
-	struct nvmem_cell *calcell;
+	struct nvmem_cell *calcell = NULL;
 	struct device *dev = tmdev->dev;
-	u16 *caldata;
-	size_t callen;
+	struct device_node *np = dev_of_node(dev);
+	struct property *prop;
+	const char *cellname;
+	u8 *caldata = NULL;
+	size_t callen = 0;
 	int ret = 0;
 
-	calcell = nvmem_cell_get(dev, "calibration");
-	if (IS_ERR(calcell)) {
-		if (PTR_ERR(calcell) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-		/*
-		 * Even if the external calibration data stored in sid is
-		 * not accessible, the THS hardware can still work, although
-		 * the data won't be so accurate.
-		 *
-		 * The default value of calibration register is 0x800 for
-		 * every sensor, and the calibration value is usually 0x7xx
-		 * or 0x8xx, so they won't be away from the default value
-		 * for a lot.
-		 *
-		 * So here we do not return error if the calibration data is
-		 * not available, except the probe needs deferring.
-		 */
-		goto out;
+	of_property_for_each_string(np, "nvmem-cell-names", prop, cellname) {
+		size_t len;
+		u8 *caldatapart;
+
+  		calcell = of_nvmem_cell_get(np, cellname);
+  		if (IS_ERR(calcell)) {
+			if (PTR_ERR(calcell) == -EPROBE_DEFER)
+				return -EPROBE_DEFER;
+			/*
+			* Even if the external calibration data stored in sid is
+			* not accessible, the THS hardware can still work, although
+			* the data won't be so accurate.
+			*
+			* The default value of calibration register is 0x800 for
+			* every sensor, and the calibration value is usually 0x7xx
+			* or 0x8xx, so they won't be away from the default value
+			* for a lot.
+			*
+			* So here we do not return error if the calibration data is
+			* not available, except the probe needs deferring.
+			*/
+			goto out;
+		}
+
+		caldatapart = nvmem_cell_read(calcell, &len);
+		nvmem_cell_put(calcell);
+		calcell = NULL;
+		if (IS_ERR(caldatapart)) {
+			ret = PTR_ERR(caldatapart);
+			goto out;
+		}
+
+		caldata = devm_krealloc(dev, caldata, callen + len, GFP_KERNEL);
+		if (!caldata) {
+			kfree(caldatapart);
+			ret = -ENOMEM;
+			goto out;
+		}
+
+		memcpy(caldata + callen, caldatapart, len);
+		callen += len;
+		kfree(caldatapart);
 	}
 
-	caldata = nvmem_cell_read(calcell, &callen);
 	if (IS_ERR(caldata)) {
 		ret = PTR_ERR(caldata);
 		goto out;
 	}
 
-	tmdev->chip->calibrate(tmdev, caldata, callen);
+	tmdev->chip->calibrate(tmdev, (u16 *)caldata, callen);
 
-	kfree(caldata);
+	devm_kfree(dev, caldata);
+	caldata = NULL;
 out:
-	if (!IS_ERR(calcell))
+	if (calcell && !IS_ERR(calcell))
 		nvmem_cell_put(calcell);
 	return ret;
 }
-- 
2.49.0


