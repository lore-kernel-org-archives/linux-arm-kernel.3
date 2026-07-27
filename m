Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5C3C5321C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 12:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EO6L5KCRkydJVetYuJ5FDKL1C2phTnK+SsKJhBgfo5c=; b=L0rE2NCVoqqR4wtYbPmosukyfV
	sQwV53O/4Rx9wnzXclES57XdGQPflW8Vj3Fu2EcrTdtutDnM/2JBx7H3Vu4oHRULBszsZKl4Bogdg
	gkH6MAS0ouo/eGcZqKrrFAT7GvTxYnJD+oKg723hH1odG63c7/dMuJ2kZcLztFr1Yqa16wPGI3Pwq
	qwxe9bReyt+RMh2rh5L8qzq8/Bop7iQjVww1fX/LE8M/M1RBerbzTPSxTTvPv29vIYEzLcZR2O9ar
	l754Dr79+lfxwn7IhsSm7fNvAMhKGhNwaLiz8Kt9FfQnjTtZ84rok2qviUCzMLcUN1Kp97KXng56C
	WfTTlTJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKQV-00000002g0t-0lpa;
	Mon, 27 Jul 2026 12:27:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKQN-00000002fvK-2K0O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 12:27:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1785155235; x=1816691235;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u15qrM0OxZ0RvZIq7htTa72mSwEegJY4xHMEJ2Ga+Kw=;
  b=L7yiyn7hfuNfZfDmjKwIFMyM3BISIlFlgOHnAeEcX/af2eeE+X4rgnMj
   3w7txsx19XQmaAeDySoYlIpzW/EQL9ZAOn8TPu9y6vGQEWcgpcsHGAdfm
   OXdESwXo+tijn9ywrF0w+SPzDV0W0wb8QFGRpEQq3If2I2qBt4fuY4yUJ
   PDvrvHiOgH6omzaajP4mJSfxzrqwpZtCAIHi2WF0XdNW8uvywtiUDKfq4
   43OSmhZJWtuuytsDosl+zRyvsbrGFI1SLzkzdeCh7x38e57ZcEsxpV0s6
   5mHuRJOVOcpf8LGQk8SZUPWHdJtfpDoRuHhkthLDFO1uEANDt17djp6On
   A==;
X-CSE-ConnectionGUID: opGnupBsQuiohLycbo45AQ==
X-CSE-MsgGUID: yQdRrD+DRR+iH4IQXKiaQA==
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="70709542"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 05:27:09 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.43; Mon, 27 Jul 2026 05:27:08 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 27 Jul 2026 05:26:58 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <ehristev@kernel.org>, <jic23@kernel.org>, <dlechner@baylibre.com>,
	<nuno.sa@analog.com>, <andy@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<srini@kernel.org>, <marcelo.schmitt@analog.com>, <radu.sabau@analog.com>,
	<Jonathan.Santos@analog.com>, <jorge.marques@analog.com>,
	<joshua.crofts1@gmail.com>, <jishnu.prakash@oss.qualcomm.com>,
	<antoniu.miclaus@analog.com>, <varshini.rajendran@microchip.com>,
	<mazziesaccount@gmail.com>, <linux-iio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v4 02/16] iio: adc: at91-sama5d2_adc: use cleanup.h for NVMEM buffer
Date: Mon, 27 Jul 2026 17:56:19 +0530
Message-ID: <20260727122633.117435-3-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260727122633.117435-1-varshini.rajendran@microchip.com>
References: <20260727122633.117435-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_052715_628928_F84A8763 
X-CRM114-Status: GOOD (  14.73  )
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

Use __free(kfree) and __free(nvmem_cell_put) cleanup helpers in
at91_adc_temp_sensor_init() to simplify error handling paths.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 drivers/iio/adc/at91-sama5d2_adc.c | 33 +++++++++++++-----------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
index e8a5285bb6d4..4a4a25f3c715 100644
--- a/drivers/iio/adc/at91-sama5d2_adc.c
+++ b/drivers/iio/adc/at91-sama5d2_adc.c
@@ -35,6 +35,8 @@
 
 #include <dt-bindings/iio/adc/at91-sama5d2_adc.h>
 
+DEFINE_FREE(nvmem_cell_put, struct nvmem_cell *, if (_T) nvmem_cell_put(_T))
+
 struct at91_adc_reg_layout {
 /* Control Register */
 	u16				CR;
@@ -2249,33 +2251,28 @@ static int at91_adc_temp_sensor_init(struct at91_adc_state *st,
 				     struct device *dev)
 {
 	struct at91_adc_temp_sensor_clb *clb = &st->soc_info.temp_sensor_clb;
-	struct nvmem_cell *temp_calib;
-	u32 *buf;
 	size_t len;
-	int ret = 0;
 
 	if (!st->soc_info.platform->temp_sensor)
 		return 0;
 
 	/* Get the calibration data from NVMEM. */
-	temp_calib = nvmem_cell_get(dev, "temperature_calib");
+	struct nvmem_cell *temp_calib __free(nvmem_cell_put) =
+		nvmem_cell_get(dev, "temperature_calib");
 	if (IS_ERR(temp_calib)) {
-		ret = PTR_ERR(temp_calib);
-		if (ret != -ENOENT)
+		if (PTR_ERR(temp_calib) != -ENOENT)
 			dev_err(dev, "Failed to get temperature_calib cell!\n");
-		return ret;
+		return PTR_ERR(temp_calib);
 	}
 
-	buf = nvmem_cell_read(temp_calib, &len);
-	nvmem_cell_put(temp_calib);
-	if (IS_ERR(buf)) {
-		dev_err(dev, "Failed to read calibration data!\n");
-		return PTR_ERR(buf);
-	}
-	if (len < AT91_ADC_TS_CLB_IDX_MAX * 4) {
+	u32 *buf __free(kfree) = nvmem_cell_read(temp_calib, &len);
+	if (IS_ERR(buf))
+		return dev_err_probe(dev, PTR_ERR(buf),
+				     "Failed to read calibration data!\n");
+
+	if (len < AT91_ADC_TS_CLB_IDX_MAX * sizeof(*buf)) {
 		dev_err(dev, "Invalid calibration data!\n");
-		ret = -EINVAL;
-		goto free_buf;
+		return -EINVAL;
 	}
 
 	/* Store calibration data for later use. */
@@ -2288,9 +2285,7 @@ static int at91_adc_temp_sensor_init(struct at91_adc_state *st,
 	 */
 	clb->p1 = clb->p1 * 1000;
 
-free_buf:
-	kfree(buf);
-	return ret;
+	return 0;
 }
 
 static int at91_adc_probe(struct platform_device *pdev)
-- 
2.34.1


