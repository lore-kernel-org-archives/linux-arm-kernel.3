Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFE4CA9EC8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 13:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=beY1WFS40yvbsQcUt+5SMeOgj/o0k85KRXnrr700oe8=; b=Kalm+7hu4XmoAb0fvidFp/M/ON
	MJGDt6kquR+KBMHhCFn4P3eOY6HgQuLW+DdMnrxzf9CEa1t0MVKG/cWNVS1lGxQhok3gJczS6HZU8
	yzwDwbvIV3vszStZF3A9/rw5sJABK06T5He1i5cEaJ/I5i+i2YEtQctHSjDZZbFzAyE4Vg1Iu7AOT
	1x6ljLAsv44K03E1MkkbMoaCmWU+3hxYg+CJDJE8pLwSF4UaN7iI1xZkA9ZRgn6empn1rd7GyyXo+
	c/jkiQhfX8AWK1Y1JW9FKqrC6eOMQd9K5XYS3kOeO4kKaDBwD8JzkiMPDb9Po21WDS7gv1u8D2zMn
	5VbOgf7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWhe-0000000845g-0E1r;
	Sat, 10 Oct 2026 13:01:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWh2-000000083Pj-32dh
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 10 Oct 2026 13:00:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=beY1WFS40yvbsQcUt+5SMeOgj/o0k85KRXnrr700oe8=; b=VdZyq3fMsiSXSeC/3CA9InOrKy
	r4fMnlIqYqpcygsA1NfIc5B3lbJNRA3ye8ljB4/7I+3suHqF2k2bfXpRwITUyrPMINIndDxhIx1mG
	K8HJesr++krSVcDQ/Yxv4rJg50CoT4YkSj87AcQWuGoL6zEJjOOWeJbIn/c6EnjC542VW1jisdefN
	Ux9H75A3fjPVdanS0b9RBu0Gm2H+sZpkuHtdfCFWjgkpJQ2+UMRxkxsgEqzlq195TvoRpLHVDtpNr
	JjOpT7ELx1blfafXJWvLUNTM6SBYHaRC+DJ5X5LwF4VIRwJQAAzg9U6xM8PYmY3xZ9leRSgvfU8xw
	JKlVqDKg==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xFWgz-0000000C6pm-3BeR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 13:00:51 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-49d05d51553so3263495e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 06:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637248; x=1792242048; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=beY1WFS40yvbsQcUt+5SMeOgj/o0k85KRXnrr700oe8=;
        b=Fm+b5upaZngO7AHAt3oPeCZMb6DmLalVR++xnSGAtkEJiarBPQJGhmIYJ1yc6Zb2rF
         32sW7quhfsRA27IrVTguv5zHRgti7KOf2fMVAp4Fe/77ucszXeYzRsluDuPLRlqztjWS
         EpHe4iXenVyCG6DYya4Id/GqVgkbU3qFWZyMJ2RdAAjdhCUs3o7LQkgjl7ApcjAt6SxG
         DAFfs72Cdtg0qKMtRHWBGZT/HtilfCnloAE8NcqqtkIGeG74oz3MaCsB807mE5dKfASq
         0OHJnobrb4OSY41WvrjjdQDH9GW0hM3IR/Rq9aBR8o1/oNhW+6xuxedXdZ6bXXTShaWa
         HvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637248; x=1792242048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=beY1WFS40yvbsQcUt+5SMeOgj/o0k85KRXnrr700oe8=;
        b=OoHieg8Jtelj/W5WNLW3udp06l2/jtJXr6rbn5uy5sURdMSFL1xhWWxwT+mE5d5FHN
         3UrNt2ag2cq0UUKAVJpVIq/KgtjexXgBkI2QbY8TVDHt4E91VCN1081mDANGdCLa84Ue
         5PTynDGndgjygeExJv18h609jqI8DCXU50shToHhJRi18W/oyYpZy2dL+8hrobHl9fUu
         5knQTTEr0F6wgsHhX09of5VqSqql/CXQig3pSP8nW9JgCYbNsWMlcCwPl863HVK08kWK
         O3zqhK6OIIIW/GlVxP2RRHeiwF3ICCCdJ16Pa6hlIbsytgSoRJ7qYGfEWPBJ2UroHWph
         Fqeg==
X-Gm-Message-State: AFq9FYJ+3QHWGFpqWY0T5JY46/TPZjsQpClYGhwKbgfioNNHWU1PByKo
	kmk3YRqRiLBLyekZbZJvJ7OZXKNcm1Ls+d2obHSC+7euu8yeCV5omnI0kqvCF8aFod8uBQ==
X-Gm-Gg: AYBFou02ejoLpiHByY1BpYScaWgZe+2oW+kBSMu4cG1cOQOlHuZlrtczjCtj0M2PAoW
	5NZUcaAGO2WJAaKprDUUwRewl7EC1RvLyJIrKcmyQ7YNv0Z09zSqWcVqyUi257RN1NWtFuFFs93
	2UOPVwXsKWqogTNLA/8mE0cvs6B7UXzOnkXQlB1/XDdMbd67nWpuFx4Ci5g9mo7BNCOL/RKYd8n
	9I8Noyjo4TybaadsyLFNUAFIZpaJPIQpcE5T5kFVgXoVZ7um4ilKBmVjWu4C+b1t3ii4RoqNP5x
	fdJDCPOu2Pv039ukK7PhvZkHeKKpJKhORtNLPgHWjlPE8WXmZpdTHNwhJHNq2dITtC8jx3KKBvV
	K1XBHqmX9IHKuzuLwySR9Ze0uHxBFzqq5Y+3KmPw5wCXWlg8elOvGS25Y2xu5qTTVxzEF/CTcbf
	iToWAx5q9ojiL5g8AqQmQNXopYbhhMTbSEz2sKkjD4pMAUrJKa0Kg60ZmnEfqF5dIe6D2xC2gAn
	HmkuVbju4U7NaycVj/DrIrSjwr+qcipzhTg9G2DzSnU07yHhNeuMVK5gDCJv2llCvPWXMMWpdWF
	aiT0Suis/DjgPezD99RjmY7NRVACJERkZySI26YPf+O7YwNnUkKwD3+u1TXkJg==
X-Received: by 2002:a05:600c:4e02:b0:4a1:7428:8195 with SMTP id 5b1f17b1804b1-4a18e4aa2c2mr95937505e9.29.1791637248037;
        Sat, 10 Oct 2026 06:00:48 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:47 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 20/24] spi: Add ZTE ZX279128S SPI flash controller
Date: Sat, 10 Oct 2026 13:59:58 +0100
Message-ID: <20261010130024.177503-21-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_140050_028621_B70BC9EF 
X-CRM114-Status: GOOD (  34.52  )
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

Execute bounded SPI-memory operations through the controller FIFO. Honor
device and operation clock limits through the CRPM divider and cap the
validated maximum at 50 MHz.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 drivers/spi/Kconfig               |  13 ++
 drivers/spi/Makefile              |   1 +
 drivers/spi/spi-zx279128s-spifc.c | 353 ++++++++++++++++++++++++++++++
 3 files changed, 367 insertions(+)
 create mode 100644 drivers/spi/spi-zx279128s-spifc.c

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index a0f37e2df7..f40fbbb181 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -1320,6 +1320,19 @@ config SPI_XTENSA_XTFPGA
 	  16 bit words in SPI mode 0, automatically asserting CS on transfer
 	  start and deasserting on end.
 
+config SPI_ZX279128S_SPIFC
+	tristate "ZTE zx279128s SPI flash controller"
+	depends on ARCH_ZTE || COMPILE_TEST
+	depends on OF && HAS_IOMEM
+	depends on SPI_MEM
+	help
+	  This enables support for the SPI flash controller of the ZTE
+	  zx279128s SoC, through which it reaches its boot flash (a SPI
+	  NAND on the ZTE ZXHN H3600).
+
+	  This driver does not support generic SPI. It only implements the
+	  spi-mem interface.
+
 config SPI_ZYNQ_QSPI
 	tristate "Xilinx Zynq QSPI controller"
 	depends on ARCH_ZYNQ || COMPILE_TEST
diff --git a/drivers/spi/Makefile b/drivers/spi/Makefile
index a18814fbde..fc93fcc991 100644
--- a/drivers/spi/Makefile
+++ b/drivers/spi/Makefile
@@ -170,6 +170,7 @@ obj-$(CONFIG_SPI_XCOMM)		+= spi-xcomm.o
 obj-$(CONFIG_SPI_XILINX)		+= spi-xilinx.o
 obj-$(CONFIG_SPI_XLP)			+= spi-xlp.o
 obj-$(CONFIG_SPI_XTENSA_XTFPGA)		+= spi-xtensa-xtfpga.o
+obj-$(CONFIG_SPI_ZX279128S_SPIFC)	+= spi-zx279128s-spifc.o
 obj-$(CONFIG_SPI_ZYNQ_QSPI)		+= spi-zynq-qspi.o
 obj-$(CONFIG_SPI_ZYNQMP_GQSPI)		+= spi-zynqmp-gqspi.o
 obj-$(CONFIG_SPI_AMD)			+= spi-amd.o spi-amd-pci.o
diff --git a/drivers/spi/spi-zx279128s-spifc.c b/drivers/spi/spi-zx279128s-spifc.c
new file mode 100644
index 0000000000..12aa22baf8
--- /dev/null
+++ b/drivers/spi/spi-zx279128s-spifc.c
@@ -0,0 +1,353 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ZTE zx279128s SPI flash controller (SPIFC)
+ *
+ * Copyright (C) 2026 Navid Ghahremani <ghahramani.navid@gmail.com>
+ *
+ * The controller runs one flash operation at a time: the driver writes the
+ * opcode, the address, a description of the operation's phases and the data
+ * length, and starts it. Data passes through a 32-bit FIFO. The command and
+ * address phases always use one line; the data phase can use one, two or
+ * four. The register layout comes from the vendor boot loader's table of
+ * flash operations.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/minmax.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/spi/spi.h>
+#include <linux/spi/spi-mem.h>
+#include <linux/string.h>
+
+#define SPIFC_TRIGGER		0x04
+#define  SPIFC_TRIGGER_START	BIT(0)
+#define SPIFC_ACK		0x08
+#define  SPIFC_ACK_DONE		BIT(0)	/* written while _BUSY is clear */
+#define  SPIFC_ACK_BUSY		BIT(1)
+#define SPIFC_XFER_CFG		0x0c
+#define  SPIFC_XFER_CFG_BITS	0x1c440	/* set before every operation */
+#define SPIFC_FMT0		0x10	/* the phases of the operation */
+#define  SPIFC_FMT0_DATA_OUT	BIT(0)
+#define  SPIFC_FMT0_DATA_IN	BIT(1)
+#define  SPIFC_FMT0_DUMMY	BIT(2)
+#define  SPIFC_FMT0_ADDR	BIT(4)
+#define SPIFC_FMT1		0x14	/* and their sizes */
+#define  SPIFC_FMT1_DATA_LINES	GENMASK(2, 0)
+#define   SPIFC_LINES_1		0
+#define   SPIFC_LINES_2		4
+#define   SPIFC_LINES_4		5
+#define  SPIFC_FMT1_ADDR_BYTES	GENMASK(6, 5)	/* bytes - 1 */
+#define  SPIFC_FMT1_DUMMY_BYTES	GENMASK(15, 12)
+#define SPIFC_LEN		0x18	/* data bytes - 1 */
+#define SPIFC_ADDR		0x1c
+#define SPIFC_OPCODE		0x20
+#define SPIFC_TIMING		0x24
+#define  SPIFC_TIMING_SAMPLE	GENMASK(17, 16)
+#define SPIFC_STATUS		0x2c
+#define  SPIFC_STATUS_DONE	BIT(0)
+#define SPIFC_BURST		0x30
+#define  SPIFC_BURST_VAL	0x3f
+#define SPIFC_FIFO_STATUS	0x34
+#define  SPIFC_FIFO_RX_AVAIL	GENMASK(12, 8)
+#define  SPIFC_FIFO_TX_FREE	GENMASK(20, 16)
+#define SPIFC_FIFO_DATA		0x38
+
+#define SPIFC_MAX_DATA		4096
+#define SPIFC_TIMEOUT_US	20000
+
+struct zx_spifc {
+	void __iomem *base;
+	struct clk *wclk;
+	unsigned long speed_hz;
+};
+
+static void zx_spifc_ack(struct zx_spifc *spifc)
+{
+	u32 val = readl(spifc->base + SPIFC_ACK);
+
+	if (!(val & SPIFC_ACK_BUSY))
+		writel(val | SPIFC_ACK_DONE, spifc->base + SPIFC_ACK);
+}
+
+static void zx_spifc_start(struct zx_spifc *spifc)
+{
+	writel(readl(spifc->base + SPIFC_TRIGGER) | SPIFC_TRIGGER_START,
+	       spifc->base + SPIFC_TRIGGER);
+}
+
+static int zx_spifc_wait_fifo(struct zx_spifc *spifc, u32 mask)
+{
+	u32 val;
+
+	return readl_poll_timeout_atomic(spifc->base + SPIFC_FIFO_STATUS, val,
+					 val & mask, 1, SPIFC_TIMEOUT_US);
+}
+
+static int zx_spifc_read_fifo(struct zx_spifc *spifc, u8 *buf,
+			      unsigned int len)
+{
+	unsigned int i;
+	u32 word;
+	int ret;
+
+	for (i = 0; i < len; i += 4) {
+		ret = zx_spifc_wait_fifo(spifc, SPIFC_FIFO_RX_AVAIL);
+		if (ret)
+			return ret;
+		word = readl(spifc->base + SPIFC_FIFO_DATA);
+		memcpy(buf + i, &word, min(4U, len - i));
+	}
+
+	return 0;
+}
+
+/* Preload the FIFO, start the operation, then keep the FIFO filled */
+static int zx_spifc_write_fifo(struct zx_spifc *spifc, const u8 *buf,
+			       unsigned int len)
+{
+	unsigned int i = 0;
+	bool started = false;
+	u32 word;
+	int ret;
+
+	while (i < len) {
+		if (!(readl(spifc->base + SPIFC_FIFO_STATUS) &
+		      SPIFC_FIFO_TX_FREE)) {
+			if (!started) {
+				zx_spifc_start(spifc);
+				started = true;
+			}
+			ret = zx_spifc_wait_fifo(spifc, SPIFC_FIFO_TX_FREE);
+			if (ret)
+				return ret;
+		}
+		word = 0;
+		memcpy(&word, buf + i, min(4U, len - i));
+		writel(word, spifc->base + SPIFC_FIFO_DATA);
+		i += 4;
+	}
+
+	if (!started)
+		zx_spifc_start(spifc);
+
+	return 0;
+}
+
+static u32 zx_spifc_lines(u8 buswidth)
+{
+	switch (buswidth) {
+	case 4:
+		return SPIFC_LINES_4;
+	case 2:
+		return SPIFC_LINES_2;
+	default:
+		return SPIFC_LINES_1;
+	}
+}
+
+/* The CRPM divider must never round above the flash's frequency limit. */
+static int zx_spifc_set_speed(struct zx_spifc *spifc, unsigned int max_hz)
+{
+	unsigned long rate;
+	long rounded;
+	int ret;
+
+	if (!max_hz)
+		return -EINVAL;
+	if (spifc->speed_hz == max_hz)
+		return 0;
+
+	rounded = clk_round_rate(spifc->wclk, max_hz);
+	if (rounded < 0)
+		return rounded;
+	if (!rounded || rounded > max_hz)
+		return -EINVAL;
+
+	ret = clk_set_rate(spifc->wclk, rounded);
+	if (ret)
+		return ret;
+	rate = clk_get_rate(spifc->wclk);
+	if (!rate || rate > max_hz)
+		return -EINVAL;
+	spifc->speed_hz = rate;
+
+	return 0;
+}
+
+static int zx_spifc_setup(struct spi_device *spi)
+{
+	struct zx_spifc *spifc = spi_controller_get_devdata(spi->controller);
+
+	return zx_spifc_set_speed(spifc, spi->max_speed_hz);
+}
+
+static int zx_spifc_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
+{
+	struct zx_spifc *spifc = spi_controller_get_devdata(mem->spi->controller);
+	void __iomem *base = spifc->base;
+	u32 fmt0 = 0, fmt1 = 0, val;
+	int ret;
+
+	ret = zx_spifc_set_speed(spifc, op->max_freq ?: mem->spi->max_speed_hz);
+	if (ret)
+		return ret;
+
+	if (op->addr.nbytes) {
+		fmt0 |= SPIFC_FMT0_ADDR;
+		fmt1 |= FIELD_PREP(SPIFC_FMT1_ADDR_BYTES, op->addr.nbytes - 1);
+	}
+	if (op->dummy.nbytes) {
+		fmt0 |= SPIFC_FMT0_DUMMY;
+		fmt1 |= FIELD_PREP(SPIFC_FMT1_DUMMY_BYTES, op->dummy.nbytes);
+	}
+	if (op->data.nbytes) {
+		fmt0 |= op->data.dir == SPI_MEM_DATA_IN ? SPIFC_FMT0_DATA_IN :
+							  SPIFC_FMT0_DATA_OUT;
+		fmt1 |= FIELD_PREP(SPIFC_FMT1_DATA_LINES,
+				   zx_spifc_lines(op->data.buswidth));
+	}
+
+	zx_spifc_ack(spifc);
+	writel(op->cmd.opcode, base + SPIFC_OPCODE);
+	writel(fmt0, base + SPIFC_FMT0);
+	writel(fmt1, base + SPIFC_FMT1);
+	writel(op->data.nbytes ? op->data.nbytes - 1 : 0, base + SPIFC_LEN);
+	writel(op->addr.nbytes ? op->addr.val : 0, base + SPIFC_ADDR);
+	writel(readl(base + SPIFC_XFER_CFG) | SPIFC_XFER_CFG_BITS,
+	       base + SPIFC_XFER_CFG);
+	writel(SPIFC_BURST_VAL, base + SPIFC_BURST);
+
+	if (op->data.nbytes && op->data.dir == SPI_MEM_DATA_OUT) {
+		ret = zx_spifc_write_fifo(spifc, op->data.buf.out,
+					  op->data.nbytes);
+	} else {
+		zx_spifc_start(spifc);
+		ret = 0;
+		if (op->data.nbytes)
+			ret = zx_spifc_read_fifo(spifc, op->data.buf.in,
+						 op->data.nbytes);
+	}
+
+	if (!ret)
+		ret = readl_poll_timeout_atomic(base + SPIFC_STATUS, val,
+						val & SPIFC_STATUS_DONE, 1,
+						SPIFC_TIMEOUT_US);
+	zx_spifc_ack(spifc);
+
+	return ret;
+}
+
+static bool zx_spifc_supports_op(struct spi_mem *mem,
+				 const struct spi_mem_op *op)
+{
+	if (!spi_mem_default_supports_op(mem, op))
+		return false;
+
+	/* Command and address are always on one line */
+	if (op->cmd.nbytes != 1 || op->cmd.buswidth != 1)
+		return false;
+	if (op->addr.nbytes > 3 || (op->addr.nbytes && op->addr.buswidth != 1))
+		return false;
+	if (op->dummy.nbytes > 15 ||
+	    (op->dummy.nbytes && op->dummy.buswidth != 1))
+		return false;
+
+	/* The vendor code programs on one or four lines, never two */
+	if (op->data.nbytes && op->data.dir == SPI_MEM_DATA_OUT &&
+	    op->data.buswidth == 2)
+		return false;
+
+	return true;
+}
+
+static int zx_spifc_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
+{
+	op->data.nbytes = min(op->data.nbytes, SPIFC_MAX_DATA);
+
+	return 0;
+}
+
+static const struct spi_controller_mem_caps zx_spifc_mem_caps = {
+	.per_op_freq = true,
+};
+
+static const struct spi_controller_mem_ops zx_spifc_mem_ops = {
+	.adjust_op_size = zx_spifc_adjust_op_size,
+	.supports_op = zx_spifc_supports_op,
+	.exec_op = zx_spifc_exec_op,
+};
+
+static int zx_spifc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct spi_controller *ctlr;
+	struct zx_spifc *spifc;
+	struct clk *clk;
+	long min_hz;
+	u32 val;
+
+	ctlr = devm_spi_alloc_host(dev, sizeof(*spifc));
+	if (!ctlr)
+		return -ENOMEM;
+	spifc = spi_controller_get_devdata(ctlr);
+
+	spifc->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(spifc->base))
+		return PTR_ERR(spifc->base);
+
+	clk = devm_clk_get_enabled(dev, "pclk");
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "failed to get the register clock\n");
+	spifc->wclk = devm_clk_get_enabled(dev, "wclk");
+	if (IS_ERR(spifc->wclk))
+		return dev_err_probe(dev, PTR_ERR(spifc->wclk),
+				     "failed to get the work clock\n");
+
+	min_hz = clk_round_rate(spifc->wclk, 1);
+	if (min_hz <= 0)
+		return dev_err_probe(dev, min_hz ?: -EINVAL,
+				     "invalid minimum work clock rate\n");
+
+	/* The data sampling point, as the boot loader sets it */
+	val = readl(spifc->base + SPIFC_TIMING);
+	val &= ~SPIFC_TIMING_SAMPLE;
+	val |= FIELD_PREP(SPIFC_TIMING_SAMPLE, 1);
+	writel(val, spifc->base + SPIFC_TIMING);
+
+	ctlr->mode_bits = SPI_RX_DUAL | SPI_RX_QUAD | SPI_TX_QUAD;
+	ctlr->mem_ops = &zx_spifc_mem_ops;
+	ctlr->mem_caps = &zx_spifc_mem_caps;
+	ctlr->setup = zx_spifc_setup;
+	ctlr->min_speed_hz = min_hz;
+	/* Faster rates have not been validated on this controller. */
+	ctlr->max_speed_hz = 50000000;
+	ctlr->num_chipselect = 1;
+	ctlr->dev.of_node = dev->of_node;
+
+	return devm_spi_register_controller(dev, ctlr);
+}
+
+static const struct of_device_id zx_spifc_of_match[] = {
+	{ .compatible = "zte,zx279128s-spifc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, zx_spifc_of_match);
+
+static struct platform_driver zx_spifc_driver = {
+	.probe = zx_spifc_probe,
+	.driver = {
+		.name = "zx279128s-spifc",
+		.of_match_table = zx_spifc_of_match,
+	},
+};
+module_platform_driver(zx_spifc_driver);
+
+MODULE_AUTHOR("Navid Ghahremani <ghahramani.navid@gmail.com>");
+MODULE_DESCRIPTION("ZTE zx279128s SPI flash controller driver");
+MODULE_LICENSE("GPL");
-- 
2.55.0


