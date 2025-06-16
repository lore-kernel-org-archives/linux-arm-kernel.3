Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319E0C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 10:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GwJR4L4C5BNi8BSL4VDf9yl7ztEEHcvn8VOyGlQkwDc=; b=Ox1CuWlg8nAyhhne6ICjGAZsor
	OoiV+JctoMH8o7jQGuP21Wmw0BhMR72rnT2awx0Ryr25eyPlg/KuaCs4/6cilmO8gVJIoNvx6Tr5w
	i6xdqnjRIlMIG3hwvh5SoH83L7VeMYjr4gz/senCFw2/U0nb1Y/prsHZB1x49z7Oj1sJ4UleGUw/I
	Y5ILHTppvZXN/rtsLJmnYgA2mGyoaFMNsULsSbGAXq2QKwDnhmSg3UtPKurJrQaDBd+MO5PUBVprC
	vK0z+dluAj3aXVDFWQ+xAT/nTC+DlN6cmK5/fLWV2UenhECEoTIYb9OoJTnF2kgso9Zo4M7IoY8cN
	sgzvIioA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR6r7-000000042m6-2l2d;
	Mon, 16 Jun 2025 10:14:21 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR64I-00000003uVt-32xz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 09:23:56 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8tIwf030344;
	Mon, 16 Jun 2025 11:23:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	GwJR4L4C5BNi8BSL4VDf9yl7ztEEHcvn8VOyGlQkwDc=; b=bSznlfWzf8JS1yut
	xodDKNY6JZ0mK216iHwfRMnfrTXP+RL6V9Qsn6T2dY1wQEIrptU2ngmaUFoEpzkW
	xs12kvgu3T9d64fmqoOWbzluYzFb3IM7p44C3ZniALjxhLOHThYlVo1JBBa1w4RJ
	L+8XQbTIiwEghZ6GyRfe6G2dRTWwXmz9V9HW0uRtMkxPjUOOGJS6IghQj/BARp7x
	zVTTwN1xjZa608Jtmhyq5Wsxmg+CGwdEQCheSXt87mwl4mgbN//g0bPF+6sXGMwn
	cdaDRMx5PXgmSMS+Sm1aMcmHo0y64JFVFzF9thJtFcv/Vw3/uNMRfwvSugZZMd2I
	ffX3uA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4790e1ywha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 11:23:42 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0DB8440047;
	Mon, 16 Jun 2025 11:22:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 83E60A7D80E;
	Mon, 16 Jun 2025 11:21:07 +0200 (CEST)
Received: from localhost (10.252.14.42) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 11:21:07 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 16 Jun 2025 11:21:02 +0200
Subject: [PATCH 1/6] spi: stm32: Add SPI_READY mode to spi controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250616-spi-upstream-v1-1-7e8593f3f75d@foss.st.com>
References: <20250616-spi-upstream-v1-0-7e8593f3f75d@foss.st.com>
In-Reply-To: <20250616-spi-upstream-v1-0-7e8593f3f75d@foss.st.com>
To: Alain Volmat <alain.volmat@foss.st.com>, Mark Brown <broonie@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Valentin Caron <valentin.caron@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Erwan Leray <erwan.leray@foss.st.com>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Sumit Semwal
	<sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?=
	<christian.koenig@amd.com>
CC: <linux-spi@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-c25d1
X-Originating-IP: [10.252.14.42]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_04,2025-06-13_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_022355_056600_60F04986 
X-CRM114-Status: GOOD (  15.59  )
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

The spi ready functionality is supported by our peripheral in host and
target modes on STM32MP2x SoCs.
Update our spi controller driver to allow devices to use this
functionality.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 drivers/spi/spi-stm32.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index da3517d7102d..2bcd4a43676d 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -154,6 +154,9 @@
 /* STM32H7_SPI_I2SCFGR bit fields */
 #define STM32H7_SPI_I2SCFGR_I2SMOD	BIT(0)
 
+/* STM32MP25_SPICFG2 bit fields */
+#define STM32MP25_SPI_CFG2_RDIOM	BIT(13)
+
 /* STM32MP25 SPI registers bit fields */
 #define STM32MP25_SPI_HWCFGR1			0x3F0
 
@@ -222,6 +225,7 @@ struct stm32_spi_reg {
  * @rx: SPI RX data register
  * @tx: SPI TX data register
  * @fullcfg: SPI full or limited feature set register
+ * @rdy_en: SPI ready feature register
  */
 struct stm32_spi_regspec {
 	const struct stm32_spi_reg en;
@@ -235,6 +239,7 @@ struct stm32_spi_regspec {
 	const struct stm32_spi_reg rx;
 	const struct stm32_spi_reg tx;
 	const struct stm32_spi_reg fullcfg;
+	const struct stm32_spi_reg rdy_en;
 };
 
 struct stm32_spi;
@@ -415,6 +420,8 @@ static const struct stm32_spi_regspec stm32mp25_spi_regspec = {
 	.tx = { STM32H7_SPI_TXDR },
 
 	.fullcfg = { STM32MP25_SPI_HWCFGR1, STM32MP25_SPI_HWCFGR1_FULLCFG },
+
+	.rdy_en = { STM32H7_SPI_CFG2, STM32MP25_SPI_CFG2_RDIOM },
 };
 
 static inline void stm32_spi_set_bits(struct stm32_spi *spi,
@@ -1172,15 +1179,21 @@ static int stm32_spi_prepare_msg(struct spi_controller *ctrl,
 	else
 		clrb |= spi->cfg->regs->cs_high.mask;
 
-	dev_dbg(spi->dev, "cpol=%d cpha=%d lsb_first=%d cs_high=%d\n",
+	if (spi_dev->mode & SPI_READY)
+		setb |= spi->cfg->regs->rdy_en.mask;
+	else
+		clrb |= spi->cfg->regs->rdy_en.mask;
+
+	dev_dbg(spi->dev, "cpol=%d cpha=%d lsb_first=%d cs_high=%d rdy=%d\n",
 		!!(spi_dev->mode & SPI_CPOL),
 		!!(spi_dev->mode & SPI_CPHA),
 		!!(spi_dev->mode & SPI_LSB_FIRST),
-		!!(spi_dev->mode & SPI_CS_HIGH));
+		!!(spi_dev->mode & SPI_CS_HIGH),
+		!!(spi_dev->mode & SPI_READY));
 
 	spin_lock_irqsave(&spi->lock, flags);
 
-	/* CPOL, CPHA and LSB FIRST bits have common register */
+	/* CPOL, CPHA, LSB FIRST, CS_HIGH and RDY_EN bits have common register */
 	if (clrb || setb)
 		writel_relaxed(
 			(readl_relaxed(spi->base + spi->cfg->regs->cpol.reg) &
@@ -1768,6 +1781,13 @@ static int stm32_spi_transfer_one_setup(struct stm32_spi *spi,
 	spi->cur_bpw = transfer->bits_per_word;
 	spi->cfg->set_bpw(spi);
 
+	if (spi_dev->mode & SPI_READY && spi->cur_bpw < 8) {
+		writel_relaxed(readl_relaxed(spi->base + spi->cfg->regs->rdy_en.reg) &
+				~spi->cfg->regs->rdy_en.mask,
+					spi->base + spi->cfg->regs->rdy_en.reg);
+		dev_dbg(spi->dev, "RDY logic disabled as bits per word < 8\n");
+	}
+
 	/* Update spi->cur_speed with real clock speed */
 	if (STM32_SPI_HOST_MODE(spi)) {
 		mbr = stm32_spi_prepare_mbr(spi, transfer->speed_hz,
@@ -2179,7 +2199,7 @@ static int stm32_spi_probe(struct platform_device *pdev)
 	ctrl->auto_runtime_pm = true;
 	ctrl->bus_num = pdev->id;
 	ctrl->mode_bits = SPI_CPHA | SPI_CPOL | SPI_CS_HIGH | SPI_LSB_FIRST |
-			  SPI_3WIRE;
+			  SPI_3WIRE | SPI_READY;
 	ctrl->bits_per_word_mask = spi->cfg->get_bpw_mask(spi);
 	ctrl->max_speed_hz = spi->clk_rate / spi->cfg->baud_rate_div_min;
 	ctrl->min_speed_hz = spi->clk_rate / spi->cfg->baud_rate_div_max;

-- 
2.43.0


