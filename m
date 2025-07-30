Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6714C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 05:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=25n2H/W0zHzBfG72uoois/3Cd4v1GoEtSniUUwyLEZA=; b=a8jUf0vhDOtoks4iNzuqdCRnKk
	qhW1Uh/N3sgcGVUhgsviNRaJGaLEkzbZ4umHyaKApSyhYZxQmdMaX1+i1wVYepkqgMkZTGpDnZtvi
	HeAbqZ6BbnlElGRTLH7Xi48lusYXP3U26MUbE/hL4aYlNPtr6Gy+uuPyQ8X8kztA0NFbsNGx9x1Gv
	x7GDLETxmUeHmS0mmoSsxVfvZdVqxePUVTWSV/7TsjLwIY9+kuK27ZxSOSJHyBbYhwg6WIGz2BVhk
	xl/8bBDmT62AmVproe6rEL8pxKW4yJRgWIBZl1eJ4i5oLiLKL6cDBo/FaXmTfbQYXlcA6eyWtbj23
	t0uWC64A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugzX9-00000000jMm-0aqA;
	Wed, 30 Jul 2025 05:39:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugzUc-00000000j93-1Py3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 05:36:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1753853806; x=1785389806;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=N1w1SjMrVlxfirhilq++adg4shvXqJr7FQPDQ+oinmA=;
  b=QpO1WpxjVNNo8n0Cq42izezXzRQEahLmb/N7ySAUmIM3EA5tNQolk6y5
   OMH4BwDZXexNbflI0bOqN2uODUbFaPOJwQZhCPLCG9Lf3v7FlgtCOPHhe
   yqOYzX8SKldHPlvvSreENuK4CqG6USqSk8GzxvkUuZPDzimEXIWgpj5B+
   fTOMUGaLsjJwg0wQb06U2TvxBuowsnqeJgw0f2LQbsEIm+extwr4hAUg3
   1dsINbkzi9FwOKFEgUZPFRECt63xpJT0zTUYIFMp7iefum6joVcSsLCmK
   9YHqh10GEcc/SMNhZHdyKIakYb9M4I6/t/3/+5bFj+S35AVgk4uMvA0Nc
   w==;
X-CSE-ConnectionGUID: KXdcS/E5QFaLzQr7m9yLTA==
X-CSE-MsgGUID: 95Lgc1qwR3ylPu6C6MQ5Pw==
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="275977859"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 29 Jul 2025 22:36:44 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 29 Jul 2025 22:36:16 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 29 Jul 2025 22:36:13 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <ryan.wanner@microchip.com>, <broonie@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <linux-spi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: [PATCH 1/3] spi: atmel: simplify MR register update in cs_activate()
Date: Wed, 30 Jul 2025 11:05:59 +0530
Message-ID: <20250730053559.261866-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_223646_554504_1E8BA4BF 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message.
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

simplified the MR register configuration by updating only the PCS field
using SPI_BFINS() instead of rewriting the entire register.
Avoids code duplication.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/spi/spi-atmel.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/spi/spi-atmel.c b/drivers/spi/spi-atmel.c
index 89a6b46cd319..409f544d8983 100644
--- a/drivers/spi/spi-atmel.c
+++ b/drivers/spi/spi-atmel.c
@@ -397,20 +397,10 @@ static void cs_activate(struct atmel_spi *as, struct spi_device *spi)
 		 * on CS1,2,3 needs SPI_CSR0.BITS config as SPI_CSR1,2,3.BITS
 		 */
 		spi_writel(as, CSR0, asd->csr);
-		if (as->caps.has_wdrbt) {
-			spi_writel(as, MR,
-					SPI_BF(PCS, ~(0x01 << chip_select))
-					| SPI_BIT(WDRBT)
-					| SPI_BIT(MODFDIS)
-					| SPI_BIT(MSTR));
-		} else {
-			spi_writel(as, MR,
-					SPI_BF(PCS, ~(0x01 << chip_select))
-					| SPI_BIT(MODFDIS)
-					| SPI_BIT(MSTR));
-		}
 
 		mr = spi_readl(as, MR);
+		mr = SPI_BFINS(PCS, ~(0x01 << chip_select), mr);
+		spi_writel(as, MR, mr);
 
 		/*
 		 * Ensures the clock polarity is valid before we actually

base-commit: 4b290aae788e06561754b28c6842e4080957d3f7
-- 
2.25.1


