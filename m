Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3D4C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 22:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lKeCmjqMfNPPRNpjK82ZCg/Ku8sd60DeUcDOkrmPcJw=; b=J83HlQIAy6K8DCQIEZNRDoD2u3
	/Jxt09yV511ylJ7gV7moHBUY+njBh9uSIiM5wJMfHINxygazbuUzDMo41E0mGh2eWHLfWBMJUr5O/
	zGTFiKkjH6SJGvA3+fpID5cw68oCc1aDw1WnIBrfFYDFgNHZNwK27jPIhTTaF+Iiy5/aSvlRa8GBq
	cAcVnWN5AlYhdI0+VH2shiRfYIgY16Akre7FTjhZJFkXzGFPcBliDbjC44loaRItcFxkaSR1pbCJ0
	HLJlM8M7bDMMMoPAdC4eM5rEfBrMZghJ218H2vYxxA8DdywHr5G6nB/5R1I5oGqnCDG5WWJcYk2k7
	zwbF2dCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRI50-00000005fk0-0wFR;
	Mon, 16 Jun 2025 22:13:26 +0000
Received: from out-177.mta1.migadu.com ([2001:41d0:203:375::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRHtJ-00000005e7o-3zL6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 22:01:23 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750111279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lKeCmjqMfNPPRNpjK82ZCg/Ku8sd60DeUcDOkrmPcJw=;
	b=jrwOh4KhAkiVpQJgns719VppdBhUkBodMTpMmBIxn1pEQ5ZOseJMmS01AU9i3k9usbeX2m
	AIQPuPtqEC1V3cZQr7KCdMicMohKEb8K9jjExEpMsKQxQe4Qtrmpv9A3CJW4ifwu0iDv3H
	RX4HjQtW2x1O3p8JTtFDKs/Ju8Y8O2A=
From: Sean Anderson <sean.anderson@linux.dev>
To: Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-spi@vger.kernel.org
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Lechner <dlechner@baylibre.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v2 5/9] spi: zynqmp-gqspi: Support multiple buses
Date: Mon, 16 Jun 2025 18:00:50 -0400
Message-Id: <20250616220054.3968946-6-sean.anderson@linux.dev>
In-Reply-To: <20250616220054.3968946-1-sean.anderson@linux.dev>
References: <20250616220054.3968946-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_150122_129965_91F5AF38 
X-CRM114-Status: GOOD (  10.06  )
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

Currently, selection of the upper/lower buses is determined by the
chipselect. Decouple this by allowing explicit bus selection through the
spi-buses property.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

Changes in v2:
- New

 drivers/spi/spi-zynqmp-gqspi.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
index 595b6dc10845..add5eea12153 100644
--- a/drivers/spi/spi-zynqmp-gqspi.c
+++ b/drivers/spi/spi-zynqmp-gqspi.c
@@ -465,13 +465,13 @@ static void zynqmp_qspi_chipselect(struct spi_device *qspi, bool is_high)
 	genfifoentry |= GQSPI_GENFIFO_MODE_SPI;
 
 	if (!is_high) {
-		if (!spi_get_chipselect(qspi, 0)) {
-			xqspi->genfifobus = GQSPI_GENFIFO_BUS_LOWER;
+		xqspi->genfifobus =
+			FIELD_PREP(GQSPI_GENFIFO_BUS_MASK, qspi->buses);
+		if (!spi_get_chipselect(qspi, 0))
 			xqspi->genfifocs = GQSPI_GENFIFO_CS_LOWER;
-		} else {
-			xqspi->genfifobus = GQSPI_GENFIFO_BUS_UPPER;
+		else
 			xqspi->genfifocs = GQSPI_GENFIFO_CS_UPPER;
-		}
+
 		genfifoentry |= xqspi->genfifobus;
 		genfifoentry |= xqspi->genfifocs;
 		genfifoentry |= GQSPI_GENFIFO_CS_SETUP;
@@ -1316,6 +1316,8 @@ static int zynqmp_qspi_probe(struct platform_device *pdev)
 		ctlr->num_chipselect = num_cs;
 	}
 
+	ctlr->num_buses = 2;
+	ctlr->flags = SPI_CONTROLLER_DEFAULT_BUS_IS_CS;
 	ctlr->bits_per_word_mask = SPI_BPW_MASK(8);
 	ctlr->mem_ops = &zynqmp_qspi_mem_ops;
 	ctlr->mem_caps = &zynqmp_qspi_mem_caps;
-- 
2.35.1.1320.gc452695387.dirty


