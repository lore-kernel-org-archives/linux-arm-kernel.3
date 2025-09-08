Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74377CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 04:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A1dk4Q8U8NMIFy46irubdULRLvIMBFClKeVQTMoR49Q=; b=qpLm6kIn29naMjEVxVfVLcZQHH
	STWCFOfERl9b80+xlr2C9aNhpBrHkprGilx5ajJx2U/SnU979OLeI+/bcIp7bc8zzxofbAC6qf+oZ
	SslwCEcxvTn68JfmOsQceILRGEXo0yywqNzNuRXC0MYcXriuSeL8j7uefH1razFaKAap9y07embFP
	Q1tqdVypVjCLaliK29R6gkuoWOMsPNVUpXcuz1tDP2ob+GaPBzu6N3jVmPXpjkLtqtTTYRwJbYfsO
	mFV74bYZA0sy+u36cKgL+axn05Ck1t7vKui/NkZ71PK5jsPJ1dduPzE26ziJfwIXVN3+OrdN0FMaO
	O31CI96Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvTXv-0000000EUkL-0vtf;
	Mon, 08 Sep 2025 04:32:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvTHr-0000000EQqE-0NLS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 04:15:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757304927; x=1788840927;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=vx2kNy0+HhAu9oJXF7h1H6iRH7NO2rPLGfr4zC9bQyA=;
  b=sDinFn7aWVSSXiFbA2iG+fne536vUhAZtTy2w/JnOnS7Ul2wiScF+uHL
   PQ3b2Y/fcWeowFys/HVv0VRmMrd/8SFgUrduWhx7aIVTGq+5rr4ZHjfkw
   8lywOpxj8Codi/qvbJXf/6BPaH1IJtUaAZ1kHD4y66vtIIW+bY+7oHvii
   lL61g/eQ9qAIxgrppsvMjfzG5bgGp4pq+4Jr73h8R6EVl+gDkbtX/yRFw
   hlXmT9s1ebrt8hBPAZBpYUvEMRZkk7mDVcE9Iuo46Tus079UJColoCYJT
   6JT/s1ynhUW98TkmVcyxlwfhmdxprdtM0GOr/IAKErGiAR/iJGH+dN6oQ
   w==;
X-CSE-ConnectionGUID: q/SJvp4uQvCY0cG18DoX1w==
X-CSE-MsgGUID: ZJVDMuJtRJitEtb3JxJQeA==
X-IronPort-AV: E=Sophos;i="6.18,247,1751266800"; 
   d="scan'208";a="46742463"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Sep 2025 21:15:26 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Sun, 7 Sep 2025 21:14:58 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Sun, 7 Sep 2025 21:14:52 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Mon, 8 Sep 2025 09:44:20 +0530
Subject: [PATCH v2 5/5] spi: atmel-quadspi: Add support for sama7d65 QSPI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250908-microchip-qspi-v2-5-8f3d69fdd5c9@microchip.com>
References: <20250908-microchip-qspi-v2-0-8f3d69fdd5c9@microchip.com>
In-Reply-To: <20250908-microchip-qspi-v2-0-8f3d69fdd5c9@microchip.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Nicolas
 Ferre" <nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Dharma Balasubiramani <dharma.b@microchip.com>, Varshini Rajendran
	<varshini.rajendran@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757304860; l=1545;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=f0BEjRg0ecgW3mbWEOamZAvt1r/7v97MsNFu6rAL6n8=;
 b=00YL9K3Oot2eHMDWKTvLcLPGPfmcIclFGVvDwqZ2I+XnJFnXS2UbKtOsqxFGJmo9H+6F6i3TO
 rGVpcQg7n+0C48LlkIsVwYrLigv/DAIZ+NKDIiZnA4Itk2gfbvheFqX
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_211527_200063_9659187D 
X-CRM114-Status: GOOD (  11.14  )
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

From: Varshini Rajendran <varshini.rajendran@microchip.com>

Add support for sama7d65 QSPI controller and define its caps.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 drivers/spi/atmel-quadspi.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index 342cdd6e8d64..d7a3d85d00c2 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -1638,6 +1638,24 @@ static const struct atmel_qspi_caps atmel_sam9x7_ospi_caps = {
 	.has_dllon = false,
 };
 
+static const struct atmel_qspi_caps atmel_sama7d65_ospi_caps = {
+	.max_speed_hz = SAMA7G5_QSPI0_MAX_SPEED_HZ,
+	.has_gclk = true,
+	.octal = true,
+	.has_dma = true,
+	.has_2xgclk = true,
+	.has_padcalib = true,
+	.has_dllon = false,
+};
+
+static const struct atmel_qspi_caps atmel_sama7d65_qspi_caps = {
+	.max_speed_hz = SAMA7G5_QSPI1_SDR_MAX_SPEED_HZ,
+	.has_gclk = true,
+	.has_dma = true,
+	.has_2xgclk = true,
+	.has_dllon = false,
+};
+
 static const struct atmel_qspi_caps atmel_sama7g5_ospi_caps = {
 	.max_speed_hz = SAMA7G5_QSPI0_MAX_SPEED_HZ,
 	.has_gclk = true,
@@ -1675,6 +1693,15 @@ static const struct of_device_id atmel_qspi_dt_ids[] = {
 		.compatible = "microchip,sam9x7-ospi",
 		.data = &atmel_sam9x7_ospi_caps,
 	},
+	{
+		.compatible = "microchip,sama7d65-ospi",
+		.data = &atmel_sama7d65_ospi_caps,
+	},
+	{
+		.compatible = "microchip,sama7d65-qspi",
+		.data = &atmel_sama7d65_qspi_caps,
+	},
+
 
 	{ /* sentinel */ }
 };

-- 
2.43.0


