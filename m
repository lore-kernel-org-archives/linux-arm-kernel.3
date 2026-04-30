Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C24FF8873
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 15:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhXA4cqqHPFlshtdy+6Myvdjud+BTw8nlhOl5t9b4BU=; b=mywMvGlP4R+VacJKvRmqzxSRii
	spAHVPcHTdBUwWPVjHr/WOr2oPh4WHk2s1c/DtPxvs333Fl5vKSh6PzjbswqkE7UTv8jZX2Zan6IB
	bVWXmf5q1ad0dsquBJnF76v4w95/nowaoGrEyC1oCtNo6iI2Som8Su0HJW5MOKvRFC+SJMRO3SvAo
	y+CXa0apVtSOgtbm9Avfx5kch/FERFKzosKWKXRmRHewuoQ5N+hcwYO1Tua1978OZHven2Dl0P6LI
	PstOW3gndqx2RNWLD8kVcx9Co90gL1ca7itEvUW8W+bl/craXquRQFmcqnWJDvm3LKo73JilhwN21
	th5ZNO7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITk4-00000005gD7-0dmj;
	Thu, 30 Apr 2026 15:55:56 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITk0-00000005g9u-0xNE;
	Thu, 30 Apr 2026 15:55:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=mh
	XA4cqqHPFlshtdy+6Myvdjud+BTw8nlhOl5t9b4BU=; b=o8vXHoUBewuSn3444E
	d8AGVQhH/Uvg/8sMdhEzhu360oYztp0mtqMMuoTG8nvLVEeaRJDqUTIvg+4GUkLl
	qFgRs8sZm04XByzz184XL4yVyPPtX7doIThwpaGos9mdcE0qoijGqmMTRWFHtASL
	K8E5FT8tFOrnU9MKW/AWc9H9U=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wAXyu5Se_NpHedTCg--.49548S7;
	Thu, 30 Apr 2026 23:55:05 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: broonie@kernel.org,
	sunny.luo@amlogic.com,
	xianwei.zhao@amlogic.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	han.xu@nxp.com,
	haibo.chen@nxp.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	lhjeff911@gmail.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 05/10] spi: nxp-xspi: Use FIELD_MODIFY()
Date: Thu, 30 Apr 2026 23:54:51 +0800
Message-Id: <20260430155456.36998-6-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260430155456.36998-1-18255117159@163.com>
References: <20260430155456.36998-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAXyu5Se_NpHedTCg--.49548S7
X-Coremail-Antispam: 1Uf129KBjvJXoW7urW7uF4ftw4UKF43Gr48WFg_yoW8Zry5pr
	18Aa47GFW8tay0y3ZxZF4ayF1YqFs5X3W7A3Wkt39I93Z2vF1kZFWvkF1rJw1UJFy8KFya
	g392kFyUCw4Yv3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piBMKNUUUUU=
X-Originating-IP: [240e:b8f:927e:5900:c497:d540:b00d:97f4]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxBlM72nze1lkagAA3I
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_085552_610275_42A34CF6 
X-CRM114-Status: UNSURE (   9.20  )
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

Use FIELD_MODIFY() to remove open-coded bit manipulation.
No functional change intended.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/spi/spi-nxp-xspi.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-nxp-xspi.c b/drivers/spi/spi-nxp-xspi.c
index 385302a6e62f..037eac24e6fd 100644
--- a/drivers/spi/spi-nxp-xspi.c
+++ b/drivers/spi/spi-nxp-xspi.c
@@ -493,9 +493,8 @@ static void nxp_xspi_disable_ddr(struct nxp_xspi *xspi)
 	writel(reg, base + XSPI_MCR);
 
 	reg &= ~XSPI_MCR_DDR_EN;
-	reg &= ~XSPI_MCR_DQS_FA_SEL_MASK;
 	/* Use dummy pad loopback mode to sample data */
-	reg |= FIELD_PREP(XSPI_MCR_DQS_FA_SEL_MASK, 0x01);
+	FIELD_MODIFY(XSPI_MCR_DQS_FA_SEL_MASK, &reg, 0x01);
 	writel(reg, base + XSPI_MCR);
 	xspi->support_max_rate = 133000000;
 
@@ -524,15 +523,13 @@ static void nxp_xspi_enable_ddr(struct nxp_xspi *xspi)
 	writel(reg, base + XSPI_MCR);
 
 	reg |= XSPI_MCR_DDR_EN;
-	reg &= ~XSPI_MCR_DQS_FA_SEL_MASK;
 	/* Use external dqs to sample data */
-	reg |= FIELD_PREP(XSPI_MCR_DQS_FA_SEL_MASK, 0x03);
+	FIELD_MODIFY(XSPI_MCR_DQS_FA_SEL_MASK, &reg, 0x03);
 	writel(reg, base + XSPI_MCR);
 	xspi->support_max_rate = 200000000;
 
 	reg = readl(base + XSPI_FLSHCR);
-	reg &= ~XSPI_FLSHCR_TDH_MASK;
-	reg |= FIELD_PREP(XSPI_FLSHCR_TDH_MASK, 0x01);
+	FIELD_MODIFY(XSPI_FLSHCR_TDH_MASK, &reg, 0x01);
 	writel(reg, base + XSPI_FLSHCR);
 
 	reg = FIELD_PREP(XSPI_SMPR_DLLFSMPFA_MASK, 0x04);
@@ -1096,8 +1093,7 @@ static int nxp_xspi_default_setup(struct nxp_xspi *xspi)
 
 	/* Give read/write access right to EENV0 */
 	reg = readl(base + XSPI_FRAD0_WORD2);
-	reg &= ~XSPI_FRAD0_WORD2_MD0ACP_MASK;
-	reg |= FIELD_PREP(XSPI_FRAD0_WORD2_MD0ACP_MASK, 0x03);
+	FIELD_MODIFY(XSPI_FRAD0_WORD2_MD0ACP_MASK, &reg, 0x03);
 	writel(reg, base + XSPI_FRAD0_WORD2);
 
 	/* Enable the FRAD check for EENV0 */
-- 
2.34.1


