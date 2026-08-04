Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCA2C55838
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 11:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DdL7E3dS1MlVpaxZYBsVQ8hRRYownBBew9zBUvmQ7Jw=; b=iQ7/kqTaKneU7rd4x77wCy6T97
	q8i6fq4i2fhuxLWfY0O8AKgkfFAzVx/QfwHCS9JVhaE87GNtGFHj4Z+XeAm+myaegGfS44eWkpFfU
	3fa5hPceCxcxLGinHCaZwG8BeZYvS6eOAew49n7RLlGCNGsHGHppA1T8nyfIIpmpAA7mfNg83vHTr
	zkA+pMQPtaTmzJzXnvTg3xUQFqquPssZxAPDGLPo5z1EwNvSy3wAAHhfG/sXyGqwliLKM56ACf+cn
	nHHqQPi2G3yHAL1/2Ni/0yJ9oWcsDx7r+by43r18LUg67M9a+QOA3pr6vS2k1nSuz9I0OyVsW6Kka
	MhBSP1AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDPg-00000001hoo-3EdL;
	Tue, 04 Aug 2026 11:34:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDPe-00000001hnl-2KMZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 11:34:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1785843267; x=1817379267;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5L04fm8dXyW6Qb/yl6MetSQ5Bfk/JYbRIvYAJ4AiOu0=;
  b=Fr4QsMTiyfxD0K+a/WkQXmPegtu8XP92RUlbvbNijTiVkQEwMFS+hC2Q
   DErObWKgqwQS9v+IvYxS3rkO2chln4P6VsfELqK+idJZV2kW4B/NnmUZM
   M3Garxyt0yrmA/qFc6AMuQ1NDuTIFO92nTUvKZ3EWNX5sjpWT9tSa1fze
   OMuZaSfJkE7d2UnMSESkcrye46coTeS+jamqLodm4E6Ztsa66QoNWoB4t
   bS/YRjRYH+SmfSsY9sCeiVfCRPC4SDgTbKLBJbQJItW7cIR1oPfHKUH5O
   2WeVj97JGSUYnXK+zEPuxJuJGm2RXnGNy5zPWEjVPCiqA78iNWzNthJ0u
   Q==;
X-CSE-ConnectionGUID: 2vRVZvYFRtmUiH54Y33gOQ==
X-CSE-MsgGUID: AKdlQkVOT82TWuXk02rDsA==
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="61629506"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 04:34:26 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Tue, 4 Aug 2026 04:34:25 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 4 Aug 2026 04:34:14 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <ehristev@kernel.org>, <jic23@kernel.org>, <dlechner@baylibre.com>,
	<nuno.sa@analog.com>, <andy@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<srini@kernel.org>, <marcelo.schmitt@analog.com>, <radu.sabau@analog.com>,
	<joshua.crofts1@gmail.com>, <jorge.marques@analog.com>,
	<Jonathan.Santos@analog.com>, <jishnu.prakash@oss.qualcomm.com>,
	<antoniu.miclaus@analog.com>, <duje@dujemihanovic.xyz>,
	<mazziesaccount@gmail.com>, <varshini.rajendran@microchip.com>,
	<linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v5 03/17] iio: adc: at91-sama5d2_adc: use cleanup.h for NVMEM buffer
Date: Tue, 4 Aug 2026 17:03:24 +0530
Message-ID: <20260804113338.261782-4-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260804113338.261782-1-varshini.rajendran@microchip.com>
References: <20260804113338.261782-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_043426_600303_17C6B0EC 
X-CRM114-Status: GOOD (  13.94  )
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
 drivers/iio/adc/at91-sama5d2_adc.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
index e8a5285bb6d4..09390f082fc4 100644
--- a/drivers/iio/adc/at91-sama5d2_adc.c
+++ b/drivers/iio/adc/at91-sama5d2_adc.c
@@ -2249,8 +2249,6 @@ static int at91_adc_temp_sensor_init(struct at91_adc_state *st,
 				     struct device *dev)
 {
 	struct at91_adc_temp_sensor_clb *clb = &st->soc_info.temp_sensor_clb;
-	struct nvmem_cell *temp_calib;
-	u32 *buf;
 	size_t len;
 	int ret = 0;
 
@@ -2258,7 +2256,8 @@ static int at91_adc_temp_sensor_init(struct at91_adc_state *st,
 		return 0;
 
 	/* Get the calibration data from NVMEM. */
-	temp_calib = nvmem_cell_get(dev, "temperature_calib");
+	struct nvmem_cell *temp_calib __free(nvmem_cell_put) =
+		nvmem_cell_get(dev, "temperature_calib");
 	if (IS_ERR(temp_calib)) {
 		ret = PTR_ERR(temp_calib);
 		if (ret != -ENOENT)
@@ -2266,16 +2265,14 @@ static int at91_adc_temp_sensor_init(struct at91_adc_state *st,
 		return ret;
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


