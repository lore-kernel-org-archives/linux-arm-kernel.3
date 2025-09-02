Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56841CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 06:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A1dk4Q8U8NMIFy46irubdULRLvIMBFClKeVQTMoR49Q=; b=SRix/3kGUwVVnWXlmn0jHKYJjJ
	v8On1p0wflTLjjYExXNCeM++YeFhNn/Oqbvnm4jFciiL3JI8jxEAxef2fEtWnp0FadThjcJZCsIXN
	DbaLpibI9qvUSkaAuQ2Y0h+/2fkVHq55/YyKtq/Wq4XSAjNWXsqh9y+HDGIk+RobAcrVBuzGNLvxb
	xLM3kEKZAguOia8NZdiJfj6QIZX5QxKC6RylTfhjL77qD4v37V1d2JpjdR3EMmL1kxZ/40rN9PixI
	Lp1CUUFT9NZTg+O3Kf9FjygFBVIEj9nThYiU/tsdYpVC1yHaiUwszt2zHTZjUrZUWtyWy5uFRX3wr
	EJpGep1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utK7W-0000000FQnu-2M6p;
	Tue, 02 Sep 2025 06:03:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utJx1-0000000FOVy-1Dff
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 05:53:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1756792383; x=1788328383;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=vx2kNy0+HhAu9oJXF7h1H6iRH7NO2rPLGfr4zC9bQyA=;
  b=2Q5yusXCuR3C3iFZe0VnH4s8yPhj4TDRNJFfJzEFvFM0aFfCb4fHzXCq
   bUHji32jpJ78Xfjb1+IJvePdG6G9aD0a5lYaRLqDzDZ35qYYbeBU+k44E
   NGCttOJaTjXKSYZrdjDXcoYvqXASGCD0VKyiu6TnJu1c1hg+B3R2EdJDy
   oDbAcLqXXdy8wWPncYehuCoZonnoAizxbzkCzMJsoR0q5Az8ippE+aFKg
   8aiTzNGPywO7rGp1TS8555irvG7mXpMjQMJE7UcZVdHuTCbTx3LICvUo+
   3+YdzCDc4qTsV8tAzJjt+AItFypOQAoHL5RdZZ7B02deJKPQESIAh0U0B
   g==;
X-CSE-ConnectionGUID: Yz3ewosWRva47VEyLax1Mw==
X-CSE-MsgGUID: zPPrgAImQ6WqKihVnphDpw==
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="213332113"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Sep 2025 22:53:01 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 1 Sep 2025 22:52:56 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 1 Sep 2025 22:52:51 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Tue, 2 Sep 2025 11:22:22 +0530
Subject: [PATCH 5/5] spi: atmel-quadspi: Add support for sama7d65 QSPI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250902-microchip-qspi-v1-5-37af59a0406a@microchip.com>
References: <20250902-microchip-qspi-v1-0-37af59a0406a@microchip.com>
In-Reply-To: <20250902-microchip-qspi-v1-0-37af59a0406a@microchip.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756792344; l=1545;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=f0BEjRg0ecgW3mbWEOamZAvt1r/7v97MsNFu6rAL6n8=;
 b=KmbhvXvmgW8U/7xZW5mTNMEm/DMGTIOv8a+kUdEn+t0dzTGnHnQetDBdEepFTJaa0BW9OCgtp
 JKeFRkYi6icCnPqSnrWzbpG+No0okW9MP4ad9W2lz7+H1j32OfD7HCl
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_225303_396606_9167FCCE 
X-CRM114-Status: GOOD (  10.73  )
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


