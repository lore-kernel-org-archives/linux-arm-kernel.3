Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D573C02187
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 23:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WWociCl4bVfAjOOY4p6sldW8VifVxjxPHAFfPT85y74=; b=WtxMHIj5AxLt69nya2k+GJouKC
	1Wvbg5OTJWfd/wB/AMqw6t14KDrUnxZFkOgyp/Wmtqa+IF5qRz6nlcYYKbXMJUjcHRcvrwZKDAINS
	ZhHlxNoPdgW0VDSI+jMB+ymAQQXQd6tiGDbSL+D7aYRDfrKZqvIQx6IIbXym4IL6uPo0szr9dyQ8A
	d0GYo4PG5x1DuxbxLHkzmJ2zvOaa0PqolqJ/kf/K36KWkLVPfeISaLGTV//6G6eu+ajkN89BVFHNR
	uIGrPxIdnrp0AnpNmWhkZwMQODnLiAknLv/BAUUOPVTh4yItZU2zOxYQafiAoIHc/kQPTy1SB8Kok
	LrNyqoFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZL5-0000000GU8V-1VKU;
	Thu, 16 Jan 2025 23:31:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZBR-0000000GP8b-1glN
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 16 Jan 2025 23:21:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=WWociCl4bVfAjOOY4p6sldW8VifVxjxPHAFfPT85y74=; b=h4SCZeewJtv8dyUdKZaKPCPy+s
	lhjPtcBNQ5BvSTj7R6Ik4CETq8Le/5HK/GfzECs7/X62+mksynFyxJ8zcQ50wnWWDIiYPO4kWl2Lf
	CLaNuuoruVuJEtLoWMmUQM+19XDI6xhAwNUtofikawTcRms/EwVGbtCmnocwZPGBnteaRDxuANq83
	SYEn2RXMEP3YZF9vuQh93BDtin+wAl8ojgKECIqpxHQX7LuXi1NATef4KUO1IiL3Zm+rcmRQwwxAn
	UE8fftkDPO4hBSknitzpZ4914pikRTkrF2AQpIPcHTa3qEApqZQvaAFhx4WNw6ZFPDuT+UVj82goA
	zOtQrrfA==;
Received: from out-181.mta1.migadu.com ([95.215.58.181])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZBM-0000000BKbo-25bI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 23:21:52 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737069698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WWociCl4bVfAjOOY4p6sldW8VifVxjxPHAFfPT85y74=;
	b=tcPnw3UZ2J0b92pJLokBFDODxVsw+0vMfWPLiEUFE/LQfXGgrs6i2KG+8BMGu944i4IN+o
	mKC1M9buWhD5qpqjnHr3cpn7qWHk30w+dDUDcqt+HLBrA957RXEg52OLynMam0eA6SS8Xt
	mOz4colEOoTkvmPXElTMNtUXrAzz7t8=
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
Subject: [PATCH 5/7] spi: zynqmp-gqspi: Split the bus
Date: Thu, 16 Jan 2025 18:21:15 -0500
Message-Id: <20250116232118.2694169-6-sean.anderson@linux.dev>
In-Reply-To: <20250116232118.2694169-1-sean.anderson@linux.dev>
References: <20250116232118.2694169-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_232150_238928_BF32D317 
X-CRM114-Status: GOOD (  24.12  )
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

This device supports two separate SPI busses: "lower" (SPI0) and "upper"
(SPI1). Each SPI bus has separate clock and data lines, as well as a
hardware-controlled chip select. The busses may be driven independently,
with only one bus active at a time, or in concert, with both busses
active. If both busses are driven at once, data may either be duplicated
on each bus or striped (bitwise) across both busses.

The current driver does not model this situation. It exposes one bus,
where CS 0 uses the lower bus and the lower chip select, and CS 1 uses
the upper bus and the upper chip select. It is not possible to use the
upper chip select with the lower bus (or vice versa). GPIO chip selects
are unsupported, and there would be no way to specify which bus to use
if they were.

To conserve pins, designers may wish to place multiple devices on a
single SPI bus. Add support for this by splitting the "merged" bus into
an upper and lower bus. Each bus uses a separate devicetree node and has
a single native chipselect 0. If "lower" and "upper" nodes are absent
from the devicetree, we register the merged bus instead, which maintains
the current behavior.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/spi/spi-zynqmp-gqspi.c | 155 ++++++++++++++++++++++++++-------
 1 file changed, 125 insertions(+), 30 deletions(-)

diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
index d78e114e17e0..9823d710c4d6 100644
--- a/drivers/spi/spi-zynqmp-gqspi.c
+++ b/drivers/spi/spi-zynqmp-gqspi.c
@@ -167,6 +167,10 @@ struct qspi_platform_data {
 
 /**
  * struct zynqmp_qspi - Defines qspi driver instance
+ * @lower		Pointer to "lower" SPI bus
+ * @upper		Pointer to "upper" SPI bus
+ * @merged		Pointer to legacy SPI bus which is a combination of
+ * 			@lower and @upper
  * @ctlr:		Pointer to the spi controller information
  * @regs:		Virtual address of the QSPI controller registers
  * @refclk:		Pointer to the peripheral clock
@@ -191,7 +195,7 @@ struct qspi_platform_data {
  * @has_tapdelay:	Used for tapdelay register available in qspi
  */
 struct zynqmp_qspi {
-	struct spi_controller *ctlr;
+	struct spi_controller *lower, *upper, *merged;
 	void __iomem *regs;
 	struct clk *refclk;
 	struct clk *pclk;
@@ -467,20 +471,33 @@ static void zynqmp_qspi_copy_read_data(struct zynqmp_qspi *xqspi,
  */
 static void zynqmp_qspi_chipselect(struct spi_device *qspi, bool is_high)
 {
-	struct zynqmp_qspi *xqspi = spi_controller_get_devdata(qspi->controller);
+	struct spi_controller *ctlr = qspi->controller;
+	struct zynqmp_qspi *xqspi = spi_controller_get_devdata(ctlr);
 	ulong timeout;
 	u32 genfifoentry = 0, statusreg;
 
 	genfifoentry |= GQSPI_GENFIFO_MODE_SPI;
 
 	if (!is_high) {
-		if (!spi_get_chipselect(qspi, 0)) {
-			xqspi->genfifobus = GQSPI_GENFIFO_BUS_LOWER;
-			xqspi->genfifocs = GQSPI_GENFIFO_CS_LOWER;
+		bool upper;
+
+		if (ctlr == xqspi->lower) {
+			upper = false;
+		} else if (ctlr == xqspi->upper) {
+			upper = true;
 		} else {
+			WARN_ON_ONCE(ctlr != xqspi->merged);
+			upper = spi_get_chipselect(qspi, 0);
+		}
+
+		if (upper) {
 			xqspi->genfifobus = GQSPI_GENFIFO_BUS_UPPER;
 			xqspi->genfifocs = GQSPI_GENFIFO_CS_UPPER;
+		} else {
+			xqspi->genfifobus = GQSPI_GENFIFO_BUS_LOWER;
+			xqspi->genfifocs = GQSPI_GENFIFO_CS_LOWER;
 		}
+
 		genfifoentry |= xqspi->genfifobus;
 		genfifoentry |= xqspi->genfifocs;
 		genfifoentry |= GQSPI_GENFIFO_CS_SETUP;
@@ -962,12 +979,28 @@ static int zynqmp_qspi_read_op(struct zynqmp_qspi *xqspi, u8 rx_nbits,
 static int __maybe_unused zynqmp_qspi_suspend(struct device *dev)
 {
 	struct zynqmp_qspi *xqspi = dev_get_drvdata(dev);
-	struct spi_controller *ctlr = xqspi->ctlr;
 	int ret;
 
-	ret = spi_controller_suspend(ctlr);
-	if (ret)
-		return ret;
+	if (xqspi->merged) {
+		ret = spi_controller_suspend(xqspi->merged);
+		if (ret)
+			return ret;
+	} else {
+		if (xqspi->lower) {
+			ret = spi_controller_suspend(xqspi->lower);
+			if (ret)
+				return ret;
+		}
+
+		if (xqspi->upper) {
+			ret = spi_controller_suspend(xqspi->upper);
+			if (ret) {
+				if (xqspi->lower)
+					spi_controller_resume(xqspi->lower);
+				return ret;
+			}
+		}
+	}
 
 	zynqmp_gqspi_write(xqspi, GQSPI_EN_OFST, 0x0);
 
@@ -986,13 +1019,18 @@ static int __maybe_unused zynqmp_qspi_suspend(struct device *dev)
 static int __maybe_unused zynqmp_qspi_resume(struct device *dev)
 {
 	struct zynqmp_qspi *xqspi = dev_get_drvdata(dev);
-	struct spi_controller *ctlr = xqspi->ctlr;
+	int ret = 0;
 
 	zynqmp_gqspi_write(xqspi, GQSPI_EN_OFST, GQSPI_EN_MASK);
 
-	spi_controller_resume(ctlr);
+	if (xqspi->merged)
+		ret = spi_controller_resume(xqspi->merged);
+	if (xqspi->lower)
+		ret = spi_controller_resume(xqspi->lower) ?: ret;
+	if (xqspi->upper)
+		ret = spi_controller_resume(xqspi->upper) ?: ret;
 
-	return 0;
+	return ret;
 }
 
 /**
@@ -1253,6 +1291,41 @@ static const struct spi_controller_mem_ops zynqmp_qspi_mem_ops = {
 	.exec_op = zynqmp_qspi_exec_op,
 };
 
+static void zynqmp_qspi_release_node(void *of_node)
+{
+	of_node_put(of_node);
+}
+
+static struct spi_controller *
+zynqmp_qspi_alloc_split(struct zynqmp_qspi *xqspi, const char *name)
+{
+	struct spi_controller *ctlr;
+	struct device_node *np;
+	u32 num_cs;
+	int err;
+
+	np = of_get_child_by_name(xqspi->dev->of_node, name);
+	if (!np)
+		return NULL;
+
+	err = devm_add_action_or_reset(xqspi->dev, zynqmp_qspi_release_node,
+				       np);
+	if (err)
+		return ERR_PTR(err);
+
+	ctlr = devm_spi_alloc_host(xqspi->dev, 0);
+	if (!ctlr)
+		return ERR_PTR(-ENOMEM);
+
+	ctlr->dev.of_node = np;
+	if (of_property_read_u32(np, "num-cs", &num_cs))
+		ctlr->num_chipselect = GQSPI_DEFAULT_NUM_CS;
+	else
+		ctlr->num_chipselect = num_cs;
+
+	return ctlr;
+}
+
 static int zynqmp_qspi_register_ctlr(struct zynqmp_qspi *xqspi,
 				     struct spi_controller *ctlr)
 {
@@ -1261,6 +1334,7 @@ static int zynqmp_qspi_register_ctlr(struct zynqmp_qspi *xqspi,
 	if (!ctlr)
 		return 0;
 
+	spi_controller_set_devdata(ctlr, xqspi);
 	ctlr->mode_bits = SPI_CPOL | SPI_CPHA | SPI_RX_DUAL | SPI_RX_QUAD |
 		SPI_TX_DUAL | SPI_TX_QUAD;
 	ctlr->max_speed_hz = xqspi->speed_hz;
@@ -1287,22 +1361,47 @@ static int zynqmp_qspi_register_ctlr(struct zynqmp_qspi *xqspi,
 static int zynqmp_qspi_probe(struct platform_device *pdev)
 {
 	int ret = 0;
-	struct spi_controller *ctlr;
 	struct zynqmp_qspi *xqspi;
 	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
-	u32 num_cs;
 	const struct qspi_platform_data *p_data;
 
-	ctlr = devm_spi_alloc_host(&pdev->dev, sizeof(*xqspi));
-	if (!ctlr)
+	xqspi = devm_kzalloc(dev, sizeof(*xqspi), GFP_KERNEL);
+	if (!xqspi)
 		return -ENOMEM;
 
-	xqspi = spi_controller_get_devdata(ctlr);
 	xqspi->dev = dev;
-	xqspi->ctlr = ctlr;
 	platform_set_drvdata(pdev, xqspi);
 
+	xqspi->lower = zynqmp_qspi_alloc_split(xqspi, "spi-lower");
+	if (IS_ERR(xqspi->lower))
+		return PTR_ERR(xqspi->lower);
+
+	xqspi->upper = zynqmp_qspi_alloc_split(xqspi, "spi-upper");
+	if (IS_ERR(xqspi->upper))
+		return PTR_ERR(xqspi->upper);
+
+	if (!xqspi->lower && !xqspi->upper) {
+		struct spi_controller *ctlr = devm_spi_alloc_host(dev, 0);
+		u32 num_cs;
+
+		if (!ctlr)
+			return -ENOMEM;
+
+		ret = of_property_read_u32(dev->of_node, "num-cs", &num_cs);
+		if (ret < 0) {
+			ctlr->num_chipselect = GQSPI_DEFAULT_NUM_CS;
+		} else if (num_cs > GQSPI_MAX_NUM_CS) {
+			dev_err(dev, "only %d chip selects are available\n",
+				GQSPI_MAX_NUM_CS);
+			return -EINVAL;
+		} else {
+			ctlr->num_chipselect = num_cs;
+		}
+
+		ctlr->dev.of_node = dev->of_node;
+		xqspi->merged = ctlr;
+	}
+
 	p_data = of_device_get_match_data(&pdev->dev);
 	if (p_data && (p_data->quirks & QSPI_QUIRK_HAS_TAPDELAY))
 		xqspi->has_tapdelay = true;
@@ -1375,19 +1474,15 @@ static int zynqmp_qspi_probe(struct platform_device *pdev)
 	if (ret)
 		goto clk_dis_all;
 
-	ret = of_property_read_u32(np, "num-cs", &num_cs);
-	if (ret < 0) {
-		ctlr->num_chipselect = GQSPI_DEFAULT_NUM_CS;
-	} else if (num_cs > GQSPI_MAX_NUM_CS) {
-		ret = -EINVAL;
-		dev_err(&pdev->dev, "only %d chip selects are available\n",
-			GQSPI_MAX_NUM_CS);
+	ret = zynqmp_qspi_register_ctlr(xqspi, xqspi->lower);
+	if (ret)
 		goto clk_dis_all;
-	} else {
-		ctlr->num_chipselect = num_cs;
-	}
 
-	ret = zynqmp_qspi_register_ctlr(xqspi, ctlr);
+	ret = zynqmp_qspi_register_ctlr(xqspi, xqspi->upper);
+	if (ret)
+		goto clk_dis_all;
+
+	ret = zynqmp_qspi_register_ctlr(xqspi, xqspi->merged);
 	if (ret)
 		goto clk_dis_all;
 
-- 
2.35.1.1320.gc452695387.dirty


