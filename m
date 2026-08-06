Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E7BC55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 08:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z2MS7R1XquFI5ZgUyt7volv7TIDP5Jo6QUDiJmnMvlE=; b=h9G2DUvQ/d/M6GI/NyUzmuKwcn
	V304UIqGNdCek8+cVSTh9+rQICHoqo7Smigz0RkXyw1WB5pz//tEpCK9+T8PW0Pim8bW8NOgYeQHJ
	QFs+zPthT8L1eD1wG0plkssph+Scu3Yqqg11n16JWWjTdHx8Zu4Uj2Q1gzK0KU3lIpCx6IBjkNNEA
	bcDza6THA9wK/+3tmPV9WYcdPSTYiFkZcv3hQV6PviYEwr2IbWIWZxfjs8YzV9j5fJzgcKuEUsG4D
	Y6kIoFFZgQdwta/ZouTXfgSDwEOCKLHYCvSOD45BRoEs3zLUMw1EAr41YZGkEeB5TFsw2Bh/zRGlG
	9RJI5xxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtlK-00000005Hdf-3QUN;
	Thu, 06 Aug 2026 08:47:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtlH-00000005Hc8-2ipN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 08:47:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1786006055; x=1817542055;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=HAGc0aQvGQ6xckPzuGtbesPxW4BhT95FbIaJJrF46dg=;
  b=gFbV6f2yvWROJ7xP6j/LRVmRVF6o078Jn+/y9YqK1PN0uQYkt+HfHVke
   ISKccoiJ0zJpMT5KqbkHR5Aa00RYv3AlhLmty+xzcviJa+HW+NO8HPg4z
   NgB7nuTMvC68HhrPUoqQQWaBnk8WqsQH17+5lj64OWvd7/NK1tmsGOmXj
   LIPuNkqlOKmuq/ZCgs3bFT/rP7y/otgwP+TE5kYj8NbaLEguvyC1/eKiE
   Lyq8AhGpQO33ciMz0858pUXUUgRPizszdq6pMpqAJvr+v+Vl8ar/u43ol
   I/igfyuktgGOLxZavRWVWjrifXIC2S17q5DzeRvr1W78zAPVGny3T7iiX
   g==;
X-CSE-ConnectionGUID: wnHrijeJRjKZik9IHqX1Ig==
X-CSE-MsgGUID: Hy9L2xaLT8mnDkh/AMrrlQ==
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="228880366"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 01:47:34 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Thu, 6 Aug 2026 01:47:34 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 6 Aug 2026 01:47:25 -0700
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
Subject: [PATCH v6 05/17] iio: adc: at91-sama5d2_adc: add condition to validate calibration data
Date: Thu, 6 Aug 2026 13:10:12 +0530
Message-ID: <20260806074024.531259-6-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806074024.531259-1-varshini.rajendran@microchip.com>
References: <20260806074024.531259-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_014735_739725_98D58058 
X-CRM114-Status: GOOD (  10.49  )
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

Add additional condition to validate the calibration data read from the
NVMEM cell using the TAG of the packet.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 drivers/iio/adc/at91-sama5d2_adc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
index 82db8f2f4db0..5b21367cf6b4 100644
--- a/drivers/iio/adc/at91-sama5d2_adc.c
+++ b/drivers/iio/adc/at91-sama5d2_adc.c
@@ -2297,7 +2297,8 @@ static int at91_adc_temp_sensor_init(struct at91_adc_state *st,
 		return dev_err_probe(dev, PTR_ERR(buf),
 				     "Failed to read calibration data!\n");
 
-	if (len < layout->min_len * sizeof(*buf)) {
+	if (len < layout->min_len * sizeof(*buf) ||
+	    buf[layout->tag_idx] != AT91_TEMP_CALIB_TAG_ACST) {
 		dev_err(dev, "Invalid calibration data!\n");
 		return -EINVAL;
 	}
-- 
2.34.1


