Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C7AC43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 09:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NiHgJ8uDhV+0/EqZ/cuRtogSIPYJ12/MDcRYNoF+F9I=; b=dqhlMTM9ElZjvLIbrEWRWzR70z
	lk5mdloHmCRnD0FZyINK/nRCtOV49qyBJTC1dgltB7g6F23jRqRz/yAP3SJYjuCx4AV65hwtJ+sD9
	WY+wiTrz0HBcZkDZa1nAHfHL/7u679VaEuxkYQKCGohcwSMoJ2uM22Nh2WkaOMX5CIR2AyKXRfPqg
	O9nli+HmVZuTxGWKO6LSjEOg158HIWrygM0H5a/BRnfaTvkCYr7dPK5240jS3zxmOU8L9yiez2fJW
	3EmGT2rhGxboBophtpSpcVNtx5xIQkDQ64ad8lYAOlvhHwSGBfZobhQFFPOql/zWnPwhvPSfBAoc7
	3vVaaB9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUtt-0000000GSPo-2Efz;
	Tue, 30 Jun 2026 09:37:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUtq-0000000GSOL-2RGO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 09:37:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1782812223; x=1814348223;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=b2HE2/l9IrpGvkPLNtqbKq6IrgROI2wKPVDiGDKGxTU=;
  b=07X5LiZSEDl4U/t0ZxepwYLyXpj1FV2ORiEm0Mq1cBM43RbkYvWb3feV
   IW6uDKZhObwBlW7xoAxE79EG3rw+pkn0JxDhsmkvNp1NHQ83x2WporDNn
   qFZXm/9qdoVXV8rYS+5WTgWvgk4wkVKUNnBm1a4hRsq9RnPDhaMKZ5UQD
   gfm6+qUEKAnQ208sgcaS7k4wB5I5Xe/Qm1n+dnhK5/Ts++JOBaHy1cE2v
   qK+gpls379rtUsGUJWWVe6tU/a9WQ5uNzCaznRaC0/IQ+V9QfgB5YQh5A
   2ybez0TV3Gg/9teyL5csPLnN9iSJMdzrlTzMFC+j+GN4pWnqf9qo6Ndpv
   Q==;
X-CSE-ConnectionGUID: ke3uW/xuQkuIIzeAFFBFjw==
X-CSE-MsgGUID: qDgVRIxdS7WTrMiyOUgiuQ==
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="291266929"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Jun 2026 02:37:02 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 30 Jun 2026 02:37:01 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 30 Jun 2026 02:36:52 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <ehristev@kernel.org>, <jic23@kernel.org>, <dlechner@baylibre.com>,
	<nuno.sa@analog.com>, <andy@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<srini@kernel.org>, <marcelo.schmitt@analog.com>, <jorge.marques@analog.com>,
	<mazziesaccount@gmail.com>, <Jonathan.Santos@analog.com>,
	<jishnu.prakash@oss.qualcomm.com>, <antoniu.miclaus@analog.com>,
	<duje@dujemihanovic.xyz>, <varshini.rajendran@microchip.com>,
	<linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 02/13] iio: adc: at91-sama5d2_adc: use cleanup.h for NVMEM buffer
Date: Tue, 30 Jun 2026 15:05:52 +0530
Message-ID: <20260630093603.38663-3-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630093603.38663-1-varshini.rajendran@microchip.com>
References: <20260630093603.38663-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_023702_629211_797B2CCD 
X-CRM114-Status: GOOD (  14.22  )
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

Use __free(kfree) cleanup helper for the NVMEM data buffer in
at91_adc_temp_sensor_init() to simplify error handling paths.

Since __free(kfree) requires a valid kfree-able pointer (not an
ERR_PTR), store nvmem_cell_read() result in a temporary void pointer
first, check for errors, then assign to the managed buffer.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 drivers/iio/adc/at91-sama5d2_adc.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
index 255970b2e747..5015c234289e 100644
--- a/drivers/iio/adc/at91-sama5d2_adc.c
+++ b/drivers/iio/adc/at91-sama5d2_adc.c
@@ -2251,9 +2251,10 @@ static int at91_adc_temp_sensor_init(struct at91_adc_state *st,
 {
 	struct at91_adc_temp_sensor_clb *clb = &st->soc_info.temp_sensor_clb;
 	struct nvmem_cell *temp_calib;
-	u32 *buf;
+	u32 *buf __free(kfree) = NULL;
+	void *cell_data;
 	size_t len;
-	int ret = 0;
+	int ret;
 
 	if (!st->soc_info.platform->temp_sensor)
 		return 0;
@@ -2267,16 +2268,18 @@ static int at91_adc_temp_sensor_init(struct at91_adc_state *st,
 		return ret;
 	}
 
-	buf = nvmem_cell_read(temp_calib, &len);
+	cell_data = nvmem_cell_read(temp_calib, &len);
 	nvmem_cell_put(temp_calib);
-	if (IS_ERR(buf)) {
+	if (IS_ERR(cell_data)) {
 		dev_err(dev, "Failed to read calibration data!\n");
-		return PTR_ERR(buf);
+		return PTR_ERR(cell_data);
 	}
+
+	buf = cell_data;
+
 	if (len < AT91_ADC_TS_CLB_IDX_MAX * 4) {
 		dev_err(dev, "Invalid calibration data!\n");
-		ret = -EINVAL;
-		goto free_buf;
+		return -EINVAL;
 	}
 
 	/* Store calibration data for later use. */
@@ -2289,9 +2292,7 @@ static int at91_adc_temp_sensor_init(struct at91_adc_state *st,
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


