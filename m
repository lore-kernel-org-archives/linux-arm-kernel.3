Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCD9CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 04:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aVftTuDBC6pMpByE9KkNu2mtboVOc/CeDW26bKK+PqM=; b=p120bz1O1Ckc+3zxI47nKgLcNh
	8siloG8RHzMmPr5bNTMJ27Ac+guqQSXSLY4cpDAZbiKDNTMMiIRlNi0vjjJSfuXXbLXpddMEAGm6l
	vL1P+B8mVIbiuZW81da29e/n6MHl5zlJTZXvQIvCJk9SWZ8/A+Uvwq/6iYmrJ96PHtkVDn0A91eVe
	EflkAI8TVIPvirI2wYm9s19sqyK4DDEvatfZOCJQuHISftFFE4i4mNuc8sxW8XDpx3SPXEnPbzAR+
	4J/TMrOKSXSK0wF8ECOKkmCKyWc6HOPtulet7oFutRuhGPQSMdXnorLjO6GCOejAKe4HN9e6uzoW0
	aDT3o3zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvTV7-0000000EU5I-1nQf;
	Mon, 08 Sep 2025 04:29:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvTHp-0000000EQqE-3LCF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 04:15:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757304925; x=1788840925;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=8vcpSjNT1k5A4ehuUfwjip6OpA9XYu1lbAAriuBL9r4=;
  b=MwMnNg+8dtVI8wBnDG2+zuWp4q5ki7Pmyil8WMyewcQXp+UcD0aA8Fct
   K/vIZj1+MMf6WVu7kFA4I5CDTxSCtsazAqpoUFhP8n3UeAjdDW3TbWBRa
   jK6T0WoGRSLbapvH+Aan3Y6IHUHIr0BCkDsNamASLTYT7Hgseywpybg0V
   N4f3+PlUlU799gNvmNW8QOE99yJacgPa3Xl6gSgTsZ3bV+TYlObuddX3r
   nRmsfH3WpPY96e7ae/g1zPPeCE8lUb3qrqFsfqG7sq1h3Yr2BPrVJCwkD
   ndBCx5Ss8ZtpAU9xSHvhc6iD/5OuYqiWt0J2XaymKdmwcjlQHMJGHPU4L
   w==;
X-CSE-ConnectionGUID: q/SJvp4uQvCY0cG18DoX1w==
X-CSE-MsgGUID: cfbswviiQeitLmdrMu/BIg==
X-IronPort-AV: E=Sophos;i="6.18,247,1751266800"; 
   d="scan'208";a="46742455"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Sep 2025 21:15:24 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Sun, 7 Sep 2025 21:14:51 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Sun, 7 Sep 2025 21:14:45 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Mon, 8 Sep 2025 09:44:19 +0530
Subject: [PATCH v2 4/5] spi: atmel-quadspi: add support for SAM9X7 QSPI
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250908-microchip-qspi-v2-4-8f3d69fdd5c9@microchip.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757304860; l=1692;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=f7DOA5wDFdEWR6ikCwi4zK/5qKnnx4GBTbYYi9JaLJw=;
 b=QWZQc/2bKKOSQPBR5mGGCLwOKCSMrVZSDACQTUrUEup4zCt8TwjUc+WAgX+v4459P9KgEk+34
 MqFWLf/rikaDsUQmMqRiuUIUXRFIyjg4tHN074oxyt7swTFwJtncRwD
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_211525_919061_455B21A7 
X-CRM114-Status: GOOD (  13.52  )
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

Add support for the QuadSPI controller found on the SAM9X7 SoC.

This controller does not implement pad calibration. It supports
operation up to 100 MHz, and requires the GCK to run at twice
the data rate.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
 drivers/spi/atmel-quadspi.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index 83cea5faff78..342cdd6e8d64 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -63,6 +63,7 @@
 
 #define SAMA7G5_QSPI0_MAX_SPEED_HZ	200000000
 #define SAMA7G5_QSPI1_SDR_MAX_SPEED_HZ	133000000
+#define SAM9X7_QSPI_MAX_SPEED_HZ	100000000
 
 /* Bitfields in QSPI_CR (Control Register) */
 #define QSPI_CR_QSPIEN                  BIT(0)
@@ -1627,6 +1628,16 @@ static const struct atmel_qspi_caps atmel_sam9x60_qspi_caps = {
 	.has_ricr = true,
 };
 
+static const struct atmel_qspi_caps atmel_sam9x7_ospi_caps = {
+	.max_speed_hz = SAM9X7_QSPI_MAX_SPEED_HZ,
+	.has_gclk = true,
+	.octal = true,
+	.has_dma = true,
+	.has_2xgclk = true,
+	.has_padcalib = false,
+	.has_dllon = false,
+};
+
 static const struct atmel_qspi_caps atmel_sama7g5_ospi_caps = {
 	.max_speed_hz = SAMA7G5_QSPI0_MAX_SPEED_HZ,
 	.has_gclk = true,
@@ -1660,6 +1671,10 @@ static const struct of_device_id atmel_qspi_dt_ids[] = {
 		.compatible = "microchip,sama7g5-qspi",
 		.data = &atmel_sama7g5_qspi_caps,
 	},
+	{
+		.compatible = "microchip,sam9x7-ospi",
+		.data = &atmel_sam9x7_ospi_caps,
+	},
 
 	{ /* sentinel */ }
 };

-- 
2.43.0


