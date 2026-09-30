Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A099ECA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 16:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QVdJoTZrf5oVRzxuzEqtk4rKJA30YOVUw7GNyyn3X8o=; b=U9yzGcf/scgAQ5JrQxcXwLi+oa
	z4x/rD6Csfgjz7/X48oNqWjSh1p547I0P6Rp7JtpYw+s7i3QfwAvo13Lx4bs1BeOPzcCbqi/QpAOG
	UpUMQQl9S9Cus8vxRAGOLz+veEGTic4fIxW5DkLXCxA12QpfBbM7fDPuVAf4O+4Zehr7ZmZhL5XsZ
	jrin+mT+/rS0UvDD5B2nB8DGok3vW0zDB3N+xX1MbRPtvnX77aKe2pFl1RlMuUcjhRXhK+pXAcVih
	MAtMap9PcLUr/rlKZxn3IajVEprw61Zb+wT2aKaCsaN1/B3v8ArchDn6cEa95P2aFIDGcr/+hwHCI
	gHqkIa4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwq7-00000006dYP-2OUc;
	Wed, 30 Sep 2026 16:07:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwpp-00000006dQD-0ilN
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 16:07:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QVdJoTZrf5oVRzxuzEqtk4rKJA30YOVUw7GNyyn3X8o=; b=n3ybod2h6P5Gu/ljz2hEaFcSfb
	2WhcARSMh7zAxxp3FwH7TIZDfcMRdf57pIjJzYi68zpFjKt6FsnWJ48sYTf/jtpu/nGXqJfdEhKIU
	i5wQqwmsdc5SLBSKl6BW9vcuDkKaJMBSmqdihDiso7STQeUtpABRsju7yreX7CuzVSxoKjbLtieFV
	q/lBf7hzoA5v1CvAFRXTV44qdKVmR8Yu6Z3oz4Tlp38oqEApgtNqM+bJWzlGcjXsj0SnPbrkrsKzo
	F4CfmJRCgvpRJKbh0zN1grznZPYcIOG0R1Jld/qdaQHBad7XXbVclAO/uVBdlvadOXRA/FuhJh4d1
	hYWXL5XA==;
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBwpl-0000000434u-3gxP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 16:07:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=QVdJoTZrf5oVRzxuzEqtk4rKJA30YOVUw7GNyyn3X8o=; b=ICn4PPhgtTJvtdEKkmvnxcurZ6
	UXWsLiIdxjmkfaapz4YtRL7tLYHhbd8rW/XVsn46y4Xi/qJ76QTMLOLoQpYIHgISZYQM+yqNTcct3
	RLYq07+Z7CQ7gdjisfzECdVnpfewcrkM7qTuYWm5M/X3yWRQp2CuENOffvU4W28+xE0BfZ6Iy2xld
	QXG/ZgvS28dzawzAziMIssKmDSBGyeIaOcrhTalW/lA45iU+4aitlj1HzPFEmc6JfgDLSADLcOmUu
	+ajzMK1AI9eCeRnvWeu1ezxWS70mPeZlozpN9TkMy9EdG8ddnsBEn6oE+4OzL4PCLk7ZaEJdzvmZs
	MoclClPA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <fourdollars@debian.org>)
	id 1xBwpa-009IoV-0U;
	Wed, 30 Sep 2026 16:06:54 +0000
From: Shih-Yuan Lee <fourdollars@debian.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Shih-Yuan Lee <fourdollars@debian.org>
Subject: [PATCH v17 2/6] spi: pxa2xx: introduce clock enable and disable helper functions
Date: Thu,  1 Oct 2026 00:06:25 +0800
Message-Id: <20260930160629.1822-3-fourdollars@debian.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260930160629.1822-1-fourdollars@debian.org>
References: <20260930160629.1822-1-fourdollars@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Debian-User: fourdollars
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_170705_996121_291EEF0E 
X-CRM114-Status: GOOD (  20.93  )
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

The driver enables and disables the SOC clock during probe, teardown,
and power management callbacks. Directly calling clk_disable_unprepare()
when the clock is already disabled—such as when removing a device that
is runtime-suspended—causes an unbalanced clock disable warning from the
Common Clock Framework.

Introduce pxa2xx_spi_clk_enable() and pxa2xx_spi_clk_disable() helper
functions that track the clock state with a 'clk_enabled' boolean flag
protected by a 'clk_lock' mutex in struct driver_data. These helpers
make clock toggling idempotent: repeated enable or disable invocations
are safe no-ops serialized by clk_lock.

Convert probe, remove, suspend, resume, and runtime PM callbacks to use
these helpers instead of direct clk_prepare_enable() and
clk_disable_unprepare() calls.

Pack 'clk_enabled' immediately after 'n_bytes' into the existing
padding hole in struct driver_data, avoiding additional alignment
padding.

Assisted-by: Antigravity:gemini-3.8-flash sparse
Signed-off-by: Shih-Yuan Lee <fourdollars@debian.org>
---
 drivers/spi/spi-pxa2xx.c | 41 ++++++++++++++++++++++++++++++++--------
 drivers/spi/spi-pxa2xx.h |  2 ++
 2 files changed, 35 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
index b11e30589074..a9d19d9a5343 100644
--- a/drivers/spi/spi-pxa2xx.c
+++ b/drivers/spi/spi-pxa2xx.c
@@ -713,6 +713,31 @@ static void handle_bad_msg(struct driver_data *drv_data)
 	dev_err(drv_data->ssp->dev, "bad message state in interrupt handler\n");
 }
 
+static int pxa2xx_spi_clk_enable(struct driver_data *drv_data)
+{
+	int ret = 0;
+
+	mutex_lock(&drv_data->clk_lock);
+	if (!drv_data->clk_enabled) {
+		ret = clk_prepare_enable(drv_data->ssp->clk);
+		if (!ret)
+			drv_data->clk_enabled = true;
+	}
+	mutex_unlock(&drv_data->clk_lock);
+
+	return ret;
+}
+
+static void pxa2xx_spi_clk_disable(struct driver_data *drv_data)
+{
+	mutex_lock(&drv_data->clk_lock);
+	if (drv_data->clk_enabled) {
+		drv_data->clk_enabled = false;
+		clk_disable_unprepare(drv_data->ssp->clk);
+	}
+	mutex_unlock(&drv_data->clk_lock);
+}
+
 static irqreturn_t ssp_int(int irq, void *dev_id)
 {
 	struct driver_data *drv_data = dev_id;
@@ -1288,6 +1313,7 @@ int pxa2xx_spi_probe(struct device *dev, struct ssp_device *ssp,
 	drv_data->controller = controller;
 	drv_data->controller_info = platform_info;
 	drv_data->ssp = ssp;
+	mutex_init(&drv_data->clk_lock);
 
 	/* The spi->mode bits understood by this driver: */
 	controller->mode_bits = SPI_CPOL | SPI_CPHA | SPI_CS_HIGH | SPI_LOOP;
@@ -1352,7 +1378,7 @@ int pxa2xx_spi_probe(struct device *dev, struct ssp_device *ssp,
 	}
 
 	/* Enable SOC clock */
-	ret = clk_prepare_enable(ssp->clk);
+	ret = pxa2xx_spi_clk_enable(drv_data);
 	if (ret)
 		goto out_error_dma_irq_alloc;
 
@@ -1449,7 +1475,7 @@ int pxa2xx_spi_probe(struct device *dev, struct ssp_device *ssp,
 	return ret;
 
 out_error_clock_enabled:
-	clk_disable_unprepare(ssp->clk);
+	pxa2xx_spi_clk_disable(drv_data);
 
 out_error_dma_irq_alloc:
 	pxa2xx_spi_dma_release(drv_data);
@@ -1468,7 +1494,7 @@ void pxa2xx_spi_remove(struct device *dev)
 
 	/* Disable the SSP at the peripheral and SOC level */
 	pxa_ssp_disable(ssp);
-	clk_disable_unprepare(ssp->clk);
+	pxa2xx_spi_clk_disable(drv_data);
 
 	/* Release DMA */
 	if (drv_data->controller_info->enable_dma)
@@ -1492,7 +1518,7 @@ static int pxa2xx_spi_suspend(struct device *dev)
 	pxa_ssp_disable(ssp);
 
 	if (!pm_runtime_suspended(dev))
-		clk_disable_unprepare(ssp->clk);
+		pxa2xx_spi_clk_disable(drv_data);
 
 	return 0;
 }
@@ -1500,12 +1526,11 @@ static int pxa2xx_spi_suspend(struct device *dev)
 static int pxa2xx_spi_resume(struct device *dev)
 {
 	struct driver_data *drv_data = dev_get_drvdata(dev);
-	struct ssp_device *ssp = drv_data->ssp;
 	int ret;
 
 	/* Enable the SSP clock */
 	if (!pm_runtime_suspended(dev)) {
-		ret = clk_prepare_enable(ssp->clk);
+		ret = pxa2xx_spi_clk_enable(drv_data);
 		if (ret)
 			return ret;
 	}
@@ -1518,7 +1543,7 @@ static int pxa2xx_spi_runtime_suspend(struct device *dev)
 {
 	struct driver_data *drv_data = dev_get_drvdata(dev);
 
-	clk_disable_unprepare(drv_data->ssp->clk);
+	pxa2xx_spi_clk_disable(drv_data);
 	return 0;
 }
 
@@ -1526,7 +1551,7 @@ static int pxa2xx_spi_runtime_resume(struct device *dev)
 {
 	struct driver_data *drv_data = dev_get_drvdata(dev);
 
-	return clk_prepare_enable(drv_data->ssp->clk);
+	return pxa2xx_spi_clk_enable(drv_data);
 }
 
 EXPORT_NS_GPL_DEV_PM_OPS(pxa2xx_spi_pm_ops, SPI_PXA2xx) = {
diff --git a/drivers/spi/spi-pxa2xx.h b/drivers/spi/spi-pxa2xx.h
index 447be0369384..3352239f74a0 100644
--- a/drivers/spi/spi-pxa2xx.h
+++ b/drivers/spi/spi-pxa2xx.h
@@ -66,6 +66,8 @@ struct driver_data {
 	void *rx;
 	void *rx_end;
 	u8 n_bytes;
+	bool clk_enabled;
+	struct mutex clk_lock;
 	int (*write)(struct driver_data *drv_data);
 	int (*read)(struct driver_data *drv_data);
 	irqreturn_t (*transfer_handler)(struct driver_data *drv_data);
-- 
2.39.5


