Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE12C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 10:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SFuUSFL1rdB7HAIe+0ORLqBQ71W9LTU79uriQQVAcQ0=; b=3ioF0I++Ca+mcftB1LVj90ab3f
	KOu9vKi6RF3WfypqybmrARKsOM+Rf/q8LMr7DwlktTykvmwcsyliYwIddc4WXPTB8SKJBAFO2MM5G
	IZ+ko3iGWKYkwjevBafj/VVQTh5AlG4Kd/Mcd7pjXbddRJTvlKDsUqRIUTEMrlaQ2yAiH06FJIBDK
	mgEvoWEfVz6FXRF3R753rYKSGyQ/t5zySJX/u/KVEqbSdjKqSYCcH62pWa6VEKp55S5OZmwNA4JDi
	W+T5QqxOi7NKKVg2XD/cgqVdveOmf+AGI1YFKUzf347URzKbXtO8rpRfW01byftv6LfM2tGXwnK0U
	uh+Jm0Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh3oF-00000001CxV-1MsU;
	Wed, 30 Jul 2025 10:13:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh3ll-00000001ChZ-3OuP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 10:10:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1753870246; x=1785406246;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CEApDR0me/9Oh3mS6/WNJv0S9khVvbMWXbrANG9jKFw=;
  b=xGvFCFnVtKt7FEIymmELFk5mcqsnsusCWqprlVtuldBuReRYg5eD0EQa
   QdWeZQvY8mEq5JS908Oa5OWYykJZuRHRIy3V85dReJnGiMtCyJOZOfPAu
   q6uob8cchkLEDE9+GjoB9fpPP1P1UCCSs23OR+rPr9V8Mw/7TYMP0Bqub
   aPOzh6s6f6BMNbymXE13/yfObvNijJf5SsANbd9sf4tq+7mLMmZZ8rGOR
   ytvXDmxpD+oUjiVXskB+Sn1iCxHbZ0WmKlt6qHBPbWHtF8mvsir58F3Qg
   CiDFFbtGq4szd+CGCO+1RRPsG1CvAaouGXzKffmfjVQyEtt7x7cind68L
   g==;
X-CSE-ConnectionGUID: vbXkopccR520ORU6weHWoA==
X-CSE-MsgGUID: plcsMLO+TOCy5vR7WLXQ6g==
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="275986690"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Jul 2025 03:10:45 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 30 Jul 2025 03:10:26 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Wed, 30 Jul 2025 03:10:21 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<ryan.wanner@microchip.com>, <tudor.ambarus@linaro.org>,
	<linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v2 1/3] spi: atmel: simplify MR register update in cs_activate()
Date: Wed, 30 Jul 2025 15:40:13 +0530
Message-ID: <20250730101015.323964-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_031045_965091_0F0F7C48 
X-CRM114-Status: GOOD (  10.50  )
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
changes in v2:
 - Fixed mail threading
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


