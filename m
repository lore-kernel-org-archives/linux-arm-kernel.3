Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E016C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 23:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fStIbrCOb/5ColUxilUsQxP712qLdfKYYHDEiYij27w=; b=LKQ2joCTtuQbeg23XRAGEiY+VO
	EGHOC6iwak87dLNQjTp9SzdO0Y3d2qtrKnmd4oarRZyoygp56XeLuCFnrfS17jgVIJU9hWm6RSuG8
	sjqIoIsdd/EoE0nTsSRiLM4jXq2icMiZ8Rz3PXJgaFViam4yGM9VAeHsIHE9puabEaOvPAA3Ehg9o
	BBvpbFQg2PsnMaKvM3tdkscqatI8hg4gULKLMu6N6Jo9yR9Y+GZTx51LZycbl9mAKW6J16mnngLLq
	fltt29jXJA4p8ij5lMWsbSwSbOwKr58CXmMiscXm91DeByr29/be+8EfOF1EHnaA6Lk59+LtPZryM
	CC5eZeAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZG5-0000000GRBY-2hWu;
	Thu, 16 Jan 2025 23:26:41 +0000
Received: from out-185.mta1.migadu.com ([95.215.58.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZBC-0000000GP00-0ULW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 23:21:39 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737069696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fStIbrCOb/5ColUxilUsQxP712qLdfKYYHDEiYij27w=;
	b=ThjwuswfDNPcj2UE4dP0vdjjWbWAYcdXs2jMVU1jT+42ZK8CguBj+r51yWDkZtt6SNPocY
	uq6JTjleQaOmNDEM6GilRXNXu+lpqzziHkkZ0CRwOPmgLqGihk+FvJxlzmrBqqURYVM9n5
	9TXbQ2KWJ39SCpmjBnJ0f7UclKrYQso=
From: Sean Anderson <sean.anderson@linux.dev>
To: Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-spi@vger.kernel.org
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 4/7] spi: zynqmp-gqspi: Refactor out controller initialization
Date: Thu, 16 Jan 2025 18:21:14 -0500
Message-Id: <20250116232118.2694169-5-sean.anderson@linux.dev>
In-Reply-To: <20250116232118.2694169-1-sean.anderson@linux.dev>
References: <20250116232118.2694169-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_152138_303011_D886757B 
X-CRM114-Status: GOOD (  12.45  )
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

In preparation for having multiple SPI busses, refactor out the
controller initialization into a separate function. No functional change
intended.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/spi/spi-zynqmp-gqspi.c | 42 +++++++++++++++++++++-------------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
index a1233897dc88..d78e114e17e0 100644
--- a/drivers/spi/spi-zynqmp-gqspi.c
+++ b/drivers/spi/spi-zynqmp-gqspi.c
@@ -1253,6 +1253,29 @@ static const struct spi_controller_mem_ops zynqmp_qspi_mem_ops = {
 	.exec_op = zynqmp_qspi_exec_op,
 };
 
+static int zynqmp_qspi_register_ctlr(struct zynqmp_qspi *xqspi,
+				     struct spi_controller *ctlr)
+{
+	int ret;
+
+	if (!ctlr)
+		return 0;
+
+	ctlr->mode_bits = SPI_CPOL | SPI_CPHA | SPI_RX_DUAL | SPI_RX_QUAD |
+		SPI_TX_DUAL | SPI_TX_QUAD;
+	ctlr->max_speed_hz = xqspi->speed_hz;
+	ctlr->bits_per_word_mask = SPI_BPW_MASK(8);
+	ctlr->mem_ops = &zynqmp_qspi_mem_ops;
+	ctlr->setup = zynqmp_qspi_setup_op;
+	ctlr->auto_runtime_pm = true;
+
+	ret = devm_spi_register_controller(xqspi->dev, ctlr);
+	if (ret)
+		dev_err_probe(xqspi->dev, ret, "could not register %pOF\n",
+			      ctlr->dev.of_node);
+	return ret;
+}
+
 /**
  * zynqmp_qspi_probe - Probe method for the QSPI driver
  * @pdev:	Pointer to the platform_device structure
@@ -1329,12 +1352,8 @@ static int zynqmp_qspi_probe(struct platform_device *pdev)
 		goto clk_dis_all;
 	}
 
-	ctlr->mode_bits = SPI_CPOL | SPI_CPHA | SPI_RX_DUAL | SPI_RX_QUAD |
-		SPI_TX_DUAL | SPI_TX_QUAD;
-	ctlr->max_speed_hz = clk_get_rate(xqspi->refclk) / 2;
-	xqspi->speed_hz = ctlr->max_speed_hz;
-
 	/* QSPI controller initializations */
+	xqspi->speed_hz = clk_get_rate(xqspi->refclk) / 2;
 	ret = zynqmp_qspi_init_hw(xqspi);
 	if (ret)
 		goto clk_dis_all;
@@ -1368,18 +1387,9 @@ static int zynqmp_qspi_probe(struct platform_device *pdev)
 		ctlr->num_chipselect = num_cs;
 	}
 
-	ctlr->bits_per_word_mask = SPI_BPW_MASK(8);
-	ctlr->mem_ops = &zynqmp_qspi_mem_ops;
-	ctlr->setup = zynqmp_qspi_setup_op;
-	ctlr->bits_per_word_mask = SPI_BPW_MASK(8);
-	ctlr->dev.of_node = np;
-	ctlr->auto_runtime_pm = true;
-
-	ret = devm_spi_register_controller(&pdev->dev, ctlr);
-	if (ret) {
-		dev_err(&pdev->dev, "spi_register_controller failed\n");
+	ret = zynqmp_qspi_register_ctlr(xqspi, ctlr);
+	if (ret)
 		goto clk_dis_all;
-	}
 
 	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
-- 
2.35.1.1320.gc452695387.dirty


