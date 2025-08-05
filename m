Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32C6C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 10:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q7R0Dh51t0EjoIPTPSkCzsk8RiGas/OWpdx/BEEu0Hc=; b=1V3rEQANa8eS4wURr1um09pStp
	siuVCo96KXnNhLD0iZweSPJ1M8BW3ikpmpllQRo7fSkmO3caFd698715ebBBTSE7aGo1Sc5W1m+j6
	oF/kEBjXr0yTix+Stmk92KHwIKb95/1f9I7XOGNOL8nQaZpwQIJgriJBRwQ4loHOshxuMRUqKq2W1
	Gl92JDA9+7Aw06e3SL9p2fFo8BZF4Ks0fdYmGis+f6ydor9SgK+Es/zdPoCMBmLN77rQegRhGhM4o
	PJgFq2+A16sSwnV+Zoqh9EnH60uKDofrXFEzETDjUi9XpSFOY+LhgQV15DfKKqVD2xh++ZUyc9qo5
	m7DuDJHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujFCO-0000000CWkS-0WkU;
	Tue, 05 Aug 2025 10:47:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujEsV-0000000CUMa-0sPC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 10:26:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1754389602; x=1785925602;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UGKP9T8n9F1kTUfGEGO7Etj36JCUlKzaZSO38heUsps=;
  b=zd7ekgRmqeaCVE2wDsmtPpGaVG6QIXlE9cBG8eaSZIOP6Vc6L/nFb3+5
   cq3NWkpemK8DGfsA8Txlcxwp3+AHT5y1UoeTDL1lyQuSlKTLrOkexxsYE
   IBpZV7x8zvh7D34aFiqNpw5OQv9H0EAj9M4fuB3BvzmhWfRpFTEZGLflb
   C+UtjtlVrwxhMZ7AtitJs1dINcn7QuZ3kdBblvhJ6YiWFewLiCx5DlkIs
   yBsEWJ9Q8qEGMdJ9EqeTbkX8jle8/Nijtde68c4W3qBBmBgNolbVrI4ya
   YD56qRYd3Y1KlNk/1so/7P6w4MVsXlktBQYanIC6T+Y8iNyM5Kk2OUump
   Q==;
X-CSE-ConnectionGUID: 5giYSL7rQRGsqPqo2rqYFw==
X-CSE-MsgGUID: BGUNfPdXQXCQ7IAYcw0lJw==
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="212248017"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Aug 2025 03:26:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 5 Aug 2025 03:26:13 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 5 Aug 2025 03:26:07 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<ryan.wanner@microchip.com>, <tudor.ambarus@linaro.org>,
	<linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v3 1/3] spi: atmel: simplify MR register update in cs_activate()
Date: Tue, 5 Aug 2025 15:55:08 +0530
Message-ID: <20250805102510.36507-2-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250805102510.36507-1-manikandan.m@microchip.com>
References: <20250805102510.36507-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_032643_307877_649DB2F2 
X-CRM114-Status: UNSURE (   9.97  )
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
-- 
2.25.1


