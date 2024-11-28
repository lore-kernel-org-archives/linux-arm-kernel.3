Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23E5D70DE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 17:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yMPzl6OEOT2YN50gMMwQ9RSw8TVPbrPdddWUfTQewAc=; b=wSjKzbp/svGLUE
	LeioQzU459wE/PHP4uiKAwXADhNZ9HvIUwH6rWO+ppENTDmO7qzVNT2Rw9YC8yh8e73wiP0SAjtRf
	BLLRTSgh7ZoJyPdJHKMUO7SbAicpWps6nA4IJrvb4C/1yiFvsovipDOQoEMWf7ufTZeyhZ23r0FKA
	vhgnfsFaUS9n8pN6rH5sjSVes5/1KNNtIh/XU0GGzKqvibwSIuAUTXMaXt4+K5+FrjZHxy4L/dCE6
	eRPUhGWB1hxnZWgNQiO2k6gL7rWMBybAolJe/SPKagH2eyxenA8MP6obClF4ud4+Y/xgBPIDtyvmX
	jsB1RS3h3UedWEHdkG1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGiZ9-0000000G6SQ-4Amd;
	Thu, 28 Nov 2024 17:44:36 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGiY9-0000000G6G5-1Uhu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 17:43:35 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 2C95DA0827;
	Thu, 28 Nov 2024 18:43:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=yMPzl6OEOT2YN50gMMwQ
	9RSw8TVPbrPdddWUfTQewAc=; b=TanY1HZulbqKDY8YTLHRvMo1HdbsX8ABQ8uf
	AHBGN6uzw5+HkQFs3oxAsIC0evZUaEJqui2gtJdnryXRpmPWIVZ4Cef/O5lC4qjI
	oZN7BJy07pBUUzy6Bd1TCj3GiPG/Tt884B11AHMGDNh3RgMruciyLd+lFMCwcmqe
	oznFtsw64k4waEOqt124bF7e7FIaw+QOzZG4YC74q+XE/tCLLfd8ST+aoboYK+bf
	wmcr+yPZr1hBDesxV/cj0PD9ltmQVyTIadxpf7sVn4d1g0preyXluRF6MKDLZ2JN
	hq8FE7Ntgovn3AWax212o/HG7WGydAzvYc/RsQnpV5dkMXFqnhxDN1I3EXoJKvoA
	WJXJzH+yEGtCuzsvqRv5/zrkWC+WikrvLTmZguZlOtgZGZYeKzqv0dGviuYpd+Hf
	GH1j1QFv93OmD24TPsdAtVYsxtQ0E1fMH8uX++Bwrvfh4KQPwaB9flKUS7j86H+w
	l2+ksjz0HRSfNSdmJutH+awkynq6s1qtB87jfyI4IJPYkkKjGqBKZJY3uKBGQLEy
	3qyMLDUs8fQWB1BVlE5OCSH1wje2o9JQD0NZQ/YICkGoF89UO6UdyNGbxGZpzDFj
	RrMM1iR+8rCSA623UZkQGTW9FpfGVBcgRmEhnlNcYFwUQDiKCGN/PFIUt4MYiPLQ
	2QFjO4g=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/2] spi: atmel-quadspi: Create `atmel_qspi_ops` to support newer SoC families
Date: Thu, 28 Nov 2024 18:43:14 +0100
Message-ID: <20241128174316.3209354-2-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128174316.3209354-1-csokas.bence@prolan.hu>
References: <20241128174316.3209354-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1732815802;VERSION=7982;MC=1870551413;ID=123205;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD94855637665
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_094333_856291_AB8317F8 
X-CRM114-Status: GOOD (  22.11  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, Mark Brown <broonie@kernel.org>, Varshini Rajendran <varshini.rajendran@microchip.com>, =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Refactor the code to introduce an ops struct, to prepare for merging
support for later SoCs, such as SAMA7G5. This code was based on the
vendor's kernel (linux4microchip). Cc'ing original contributors.

Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Varshini Rajendran <varshini.rajendran@microchip.com>

Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
---
 drivers/spi/atmel-quadspi.c | 111 +++++++++++++++++++++++++-----------
 1 file changed, 77 insertions(+), 34 deletions(-)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index 91108ddfaef2..c84aefa03ae8 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -138,11 +138,15 @@
 #define QSPI_WPSR_WPVSRC_MASK           GENMASK(15, 8)
 #define QSPI_WPSR_WPVSRC(src)           (((src) << 8) & QSPI_WPSR_WPVSRC)
 
+#define ATMEL_QSPI_TIMEOUT		1000	/* ms */
+
 struct atmel_qspi_caps {
 	bool has_qspick;
 	bool has_ricr;
 };
 
+struct atmel_qspi_ops;
+
 struct atmel_qspi {
 	void __iomem		*regs;
 	void __iomem		*mem;
@@ -150,13 +154,22 @@ struct atmel_qspi {
 	struct clk		*qspick;
 	struct platform_device	*pdev;
 	const struct atmel_qspi_caps *caps;
+	const struct atmel_qspi_ops *ops;
 	resource_size_t		mmap_size;
 	u32			pending;
+	u32			irq_mask;
 	u32			mr;
 	u32			scr;
 	struct completion	cmd_completion;
 };
 
+struct atmel_qspi_ops {
+	int (*set_cfg)(struct atmel_qspi *aq, const struct spi_mem_op *op,
+		       u32 *offset);
+	int (*transfer)(struct spi_mem *mem, const struct spi_mem_op *op,
+			u32 offset);
+};
+
 struct atmel_qspi_mode {
 	u8 cmd_buswidth;
 	u8 addr_buswidth;
@@ -404,10 +417,60 @@ static int atmel_qspi_set_cfg(struct atmel_qspi *aq,
 	return 0;
 }
 
+static int atmel_qspi_wait_for_completion(struct atmel_qspi *aq, u32 irq_mask)
+{
+	int err = 0;
+	u32 sr;
+
+	/* Poll INSTRuction End status */
+	sr = atmel_qspi_read(aq, QSPI_SR);
+	if ((sr & irq_mask) == irq_mask)
+		return 0;
+
+	/* Wait for INSTRuction End interrupt */
+	reinit_completion(&aq->cmd_completion);
+	aq->pending = sr & irq_mask;
+	aq->irq_mask = irq_mask;
+	atmel_qspi_write(irq_mask, aq, QSPI_IER);
+	if (!wait_for_completion_timeout(&aq->cmd_completion,
+					 msecs_to_jiffies(ATMEL_QSPI_TIMEOUT)))
+		err = -ETIMEDOUT;
+	atmel_qspi_write(irq_mask, aq, QSPI_IDR);
+
+	return err;
+}
+
+static int atmel_qspi_transfer(struct spi_mem *mem,
+			       const struct spi_mem_op *op, u32 offset)
+{
+	struct atmel_qspi *aq = spi_controller_get_devdata(mem->spi->controller);
+
+	/* Skip to the final steps if there is no data */
+	if (!op->data.nbytes)
+		return atmel_qspi_wait_for_completion(aq,
+						      QSPI_SR_CMD_COMPLETED);
+
+	/* Dummy read of QSPI_IFR to synchronize APB and AHB accesses */
+	(void)atmel_qspi_read(aq, QSPI_IFR);
+
+	/* Send/Receive data */
+	if (op->data.dir == SPI_MEM_DATA_IN)
+		memcpy_fromio(op->data.buf.in, aq->mem + offset,
+			      op->data.nbytes);
+	else
+		memcpy_toio(aq->mem + offset, op->data.buf.out,
+			    op->data.nbytes);
+
+	/* Release the chip-select */
+	atmel_qspi_write(QSPI_CR_LASTXFER, aq, QSPI_CR);
+
+	return atmel_qspi_wait_for_completion(aq, QSPI_SR_CMD_COMPLETED);
+}
+
 static int atmel_qspi_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 {
 	struct atmel_qspi *aq = spi_controller_get_devdata(mem->spi->controller);
-	u32 sr, offset;
+	u32 offset;
 	int err;
 
 	/*
@@ -416,46 +479,20 @@ static int atmel_qspi_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 	 * when the flash memories overrun the controller's memory space.
 	 */
 	if (op->addr.val + op->data.nbytes > aq->mmap_size)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
+
+	if (op->addr.nbytes > 4)
+		return -EOPNOTSUPP;
 
 	err = pm_runtime_resume_and_get(&aq->pdev->dev);
 	if (err < 0)
 		return err;
 
-	err = atmel_qspi_set_cfg(aq, op, &offset);
+	err = aq->ops->set_cfg(aq, op, &offset);
 	if (err)
 		goto pm_runtime_put;
 
-	/* Skip to the final steps if there is no data */
-	if (op->data.nbytes) {
-		/* Dummy read of QSPI_IFR to synchronize APB and AHB accesses */
-		(void)atmel_qspi_read(aq, QSPI_IFR);
-
-		/* Send/Receive data */
-		if (op->data.dir == SPI_MEM_DATA_IN)
-			memcpy_fromio(op->data.buf.in, aq->mem + offset,
-				      op->data.nbytes);
-		else
-			memcpy_toio(aq->mem + offset, op->data.buf.out,
-				    op->data.nbytes);
-
-		/* Release the chip-select */
-		atmel_qspi_write(QSPI_CR_LASTXFER, aq, QSPI_CR);
-	}
-
-	/* Poll INSTRuction End status */
-	sr = atmel_qspi_read(aq, QSPI_SR);
-	if ((sr & QSPI_SR_CMD_COMPLETED) == QSPI_SR_CMD_COMPLETED)
-		goto pm_runtime_put;
-
-	/* Wait for INSTRuction End interrupt */
-	reinit_completion(&aq->cmd_completion);
-	aq->pending = sr & QSPI_SR_CMD_COMPLETED;
-	atmel_qspi_write(QSPI_SR_CMD_COMPLETED, aq, QSPI_IER);
-	if (!wait_for_completion_timeout(&aq->cmd_completion,
-					 msecs_to_jiffies(1000)))
-		err = -ETIMEDOUT;
-	atmel_qspi_write(QSPI_SR_CMD_COMPLETED, aq, QSPI_IDR);
+	err = aq->ops->transfer(mem, op, offset);
 
 pm_runtime_put:
 	pm_runtime_mark_last_busy(&aq->pdev->dev);
@@ -599,12 +636,17 @@ static irqreturn_t atmel_qspi_interrupt(int irq, void *dev_id)
 		return IRQ_NONE;
 
 	aq->pending |= pending;
-	if ((aq->pending & QSPI_SR_CMD_COMPLETED) == QSPI_SR_CMD_COMPLETED)
+	if ((aq->pending & aq->irq_mask) == aq->irq_mask)
 		complete(&aq->cmd_completion);
 
 	return IRQ_HANDLED;
 }
 
+static const struct atmel_qspi_ops atmel_qspi_ops = {
+	.set_cfg = atmel_qspi_set_cfg,
+	.transfer = atmel_qspi_transfer,
+};
+
 static int atmel_qspi_probe(struct platform_device *pdev)
 {
 	struct spi_controller *ctrl;
@@ -629,6 +671,7 @@ static int atmel_qspi_probe(struct platform_device *pdev)
 
 	init_completion(&aq->cmd_completion);
 	aq->pdev = pdev;
+	aq->ops = &atmel_qspi_ops;
 
 	/* Map the registers */
 	aq->regs = devm_platform_ioremap_resource_byname(pdev, "qspi_base");
-- 
2.34.1



