Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8568CCD3423
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 05:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BR+GQkq+OHGSaM1M1XSEfGoOR2adYsGXzd7KgnjDEDM=; b=Y2hIJFPWOli4d1om3SedKpacSR
	Xid2AUWrmM3fthH4x+bM5U4ESn8M80XQ9uUXd9V8MxugGXiWvH2nhgQVZbhT5x6K02Pdjd0j+TjUR
	bVGzjxuQv2DzaZVFa1CTjCGyE4M6YMtrGCfY34rUakqZ1M6IAHEvKK7AuBgKKqTrTNR1oAMCtNqG6
	tpz/+dnr0cbZGMm8kgpir//No8kLMltrFca7hq6QY13ozD2nurheUvpYlwXv2/+GWzw5ZkXrahVPU
	S1kFIJfWXNvm9IT74qsjB8QvYmRSwT1aQy1x83qLVS0RHUdnu1MxF0naN/YITAHRCqeoxgt/aEiJ2
	XleKhM1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJlTJ-0000000CNU4-31GR;
	Mon, 04 May 2026 05:03:57 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJlTH-0000000CNTF-25qd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 05:03:56 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-35691a231a7so2444250a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 May 2026 22:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777871034; x=1778475834; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BR+GQkq+OHGSaM1M1XSEfGoOR2adYsGXzd7KgnjDEDM=;
        b=rmCqzAlK7le8cSyHq0MANXWhHwg9iPxl/8Lads/wXPXYt76ySs7dnZxufw3kTL5mkk
         1Q8GUjKJz5v5aqEjfUkpTEIq/uKrHnIAA+/UkNxuRJAOaDK/irXpcG6KTXp0BsJSUjfr
         bhtJRJ0kVsZ5BlAHmFtW1lq+kaAJLEFej2ppqDl5POowJqPrpQ4OKy5MAP0JAn/4bmI1
         FUlkVj3keq3sI05KjE3+7ECs+kDydwImAYQU5dyY3Gzo/CXvRt9Q9JzfzaB7gg/qvp1V
         KmzkWaLoUpn+RfIFqQLGFH80QPLasTJpc0beFRUuyXkmZDU1u1p0bTa5bG55cXnISgPK
         j6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777871034; x=1778475834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BR+GQkq+OHGSaM1M1XSEfGoOR2adYsGXzd7KgnjDEDM=;
        b=nTLatrmumfml7K3POjjHA/JW2GZqQH3EsoAvjmoyJaPMOxDb0ibEIiVrZdvMDy6+Op
         87PQMs2NasG2I6d2UKldbF8kAqjGEb5ahHrd88QAnMs881T91xwOELaHJY3r58ssLl+s
         +4WPaECCztikoFsF5/mQiqylScUEaEfbPr4/sRVKhXBuLy2JdGTy87i3zazIDFL7Ybep
         x0GNEFizBEuzXK2IdcC88lGeX8jspRi2A/haQsJ64HHr0G4xZjaPCBw9d7dIlREU1Bzk
         7w6dpFXb63ZixtyEVssDLXoW+pVhrGQTreMV1vo7HqhR15GZUgQvq6rKDfYB0wdo0n5+
         sEPw==
X-Forwarded-Encrypted: i=1; AFNElJ8LLBuPSX60n/kfJkHiy/voQnV8K6aj7b4rv15mAITGKT9CiRFBY7Fqei9yxHxyM65pVMrmfYqYbQS/9x+6DKdl@lists.infradead.org
X-Gm-Message-State: AOJu0Yx48j+q3pUTUr9XVn+dUlpXoGxlG9OS6LzIu3Zizs+vyUFwrFa6
	LL8UBn08U1T1mlZNyDeEOMqESHHxhaOXaQs4s9Av/ctnHmbDhadokC1v
X-Gm-Gg: AeBDietupdqwlHm8PF0Tktcm6QzP3Ti6dfDhZ5A8n1md7nqWyivvlmrfTCS9mtIeEqh
	3eD1JE8j2ayXDIE3G/7YFymBiIR8Lx02cWNwRjHeEbMK9KzxHz6nMxO7WI8f4EZZzKe2BOMr9kG
	14SsLTbvc0Aw7evdqYjKd2+o6O4SoEZ2TALF/dshg9TIxdlGUi8gbrg9dhyaIKgRxTjxU6mxTMZ
	QghXW6Vd+kieDsAnVNYDEwrqcJhTU8Umbw7jd5CX3zGCPJM7MSPPraAW6BQ2cmcUltllG1OeK6R
	2HFQG5Ss+hCGGSxwBY+E1gRpv8YjXANdn0FjAc39sCMGgKaym+nA+JP2KkTFpQzavjhQkWsRZyB
	ot60sWUxAeBejhNf/f3cmxPKmfI5qqAB3ICaP7LrB67GXgj27/sLqrdx12IjntPGPF6uYgnOvwL
	e7aA==
X-Received: by 2002:a17:90b:17d0:b0:35a:24f3:2c8e with SMTP id 98e67ed59e1d1-3650cd95ddemr8487132a91.9.1777871034512;
        Sun, 03 May 2026 22:03:54 -0700 (PDT)
Received: from archlinux ([2605:e440:15::152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365437b50b0sm2662908a91.0.2026.05.03.22.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 22:03:54 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/5] thermal/drivers/sun8i: get calibration data from two nvmem cells
Date: Mon,  4 May 2026 13:02:43 +0800
Message-ID: <20260504050245.646078-4-iuncuim@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504050245.646078-1-iuncuim@gmail.com>
References: <20260504050245.646078-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_220355_543064_A147B1D1 
X-CRM114-Status: GOOD (  22.31  )
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

The A523 processor has calibration data in two nvmem cell. To be able to
add support, the ability to add data from two cells into one array must be
added.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 drivers/thermal/sun8i_thermal.c | 77 ++++++++++++++++++++++-----------
 1 file changed, 52 insertions(+), 25 deletions(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index df0c26970..c4aaff8f7 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -301,43 +301,70 @@ static int sun50i_h6_ths_calibrate(struct ths_device *tmdev,
 
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
+		calcell = of_nvmem_cell_get(np, cellname);
+		if (IS_ERR(calcell)) {
+			if (PTR_ERR(calcell) == -EPROBE_DEFER)
+				return -EPROBE_DEFER;
+			/*
+			 * Even if the external calibration data stored in sid is
+			 * not accessible, the THS hardware can still work, although
+			 * the data won't be so accurate.
+			 *
+			 * The default value of calibration register is 0x800 for
+			 * every sensor, and the calibration value is usually 0x7xx
+			 * or 0x8xx, so they won't be away from the default value
+			 * for a lot.
+			 *
+			 * So here we do not return error if the calibration data is
+			 * not available, except the probe needs deferring.
+			 */
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
2.54.0


