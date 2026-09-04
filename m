Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FF7C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 11:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=14NhbWVwArhRPWoqbEkyydWg2Xn0PWXC+Lz7VEuzIKQ=; b=FyuH/n5QX2Aels19yZRefsFyao
	IhLlstNg15amBivZJ7wbJoVap5ZybnYFrnaeO+k/4i39DgMY/39U+5fUrpjAex2JWc32QrAf9tVGa
	hXuyKCvJ2+iDRAIjrxEGnDSs6I7AAoebQQkZ+C0A6JPtemnJcemZf7VCijjQRIWJcfe1v127DVyby
	Ls/CAoPAVQ3w3ca0jP9SPfB+JMifOEO62njIAXRdpE9vCvztQDYBqCFZ+NyvFJEVVy3eaoJZoP+ym
	i/+PzkeyegCFBcmlRCBm6e9qW07QQBTid9cHzGI3isItaQ9ggXfg7QA0Xyf2n6vh2BuB2D9OXsAfy
	B1CFaEIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Ril-00000001leB-0klD;
	Fri, 04 Sep 2026 11:04:35 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Rii-00000001ldc-44MS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 11:04:34 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-6b1b1cb72d0so423420eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 04:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519872; x=1789124672; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=14NhbWVwArhRPWoqbEkyydWg2Xn0PWXC+Lz7VEuzIKQ=;
        b=D6/e4BbFGWGNSIJJCcYtfVERilIgfxxuOcrXyLOsKH12g8N3SSyBB/xXQUutwQh3Pt
         TQFIdomdTIhd327yPH8rhkktAxkbV74IzFK0nlznUdNeSwb9lJoOse2Ms3OdS/a62/ag
         HCJeYkqPv8SZ2Zy4ukkHw+PQouHAYGkDRBB6ycuLp5qvfO65lNRuO6FfOa9mjtt0/LZX
         pmXbqpVlkBjTZz+OuwTAF0v33cg7hTo83kVccsVKKZY05Na4KuoiSxQzipDdqIHoStJF
         rVTxxhG8Ow3y4YVmog/yDY+2swne2wWSmNBBf5zrKKN8CLyaKVKafJHVUtQMblasHK6C
         3R7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519872; x=1789124672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=14NhbWVwArhRPWoqbEkyydWg2Xn0PWXC+Lz7VEuzIKQ=;
        b=ktsWzD0n9Zs6Iwzekfk0GM46CqMH99+fNl9mQDtr5keNvMBMKfEGQaP5Oeb49PelGe
         XhBaIapc2PIHyZjyps8mm4J797GKp3LtI2Cy9uvkq9mXTlqcKeDbdRz9cbpvJbyISyPK
         LfM7SLhCZcx23F12aBN9yx03WL3eXgt73hGTYHa3swkqYY1ZEcKc/KOqH5Wwb7CSvzXM
         jVVmVkAkX0PkNGxn7yVki6jngP7vKGOtv9hUMPVju4e3rjdH6WHomQiOF2G3Fl0O/LTB
         lm/OyBdnXV3ltEvtaObin27IcjStIEqSYpVDGf73ZYjD7IWr+Q+qqdy6Wfe83f6QvAsx
         /Kvw==
X-Forwarded-Encrypted: i=1; AKwUvBybfW8yt2ygn+95aRmPznIFF9/1n85rykUbAEHZqSW3iErP6sKYyoQ22olrA7lIc22p+X5Q3Vyar4o4ZMJT6J6o@lists.infradead.org
X-Gm-Message-State: AFuF++l7N+/W55cOE8WWPkb4QkbwLb1NNavwMOlaTZL+r8UP7ya9TDC3
	sElZVidgL3p4d/hmquTYX2T0fbsUWuPzOaJoGobQ1vePzLgeW6u5hlIv
X-Gm-Gg: AYBFou1lJWau0DTkpxvf9ep1PcTuat9G+VFg6xx5P7+0igdx2YeCEoTP0yCpUBnAmss
	D/1kuqb8EUIbxsqeHa8OZeqV6DR0tGCrLQqbSVtU+7MnihGpOUb1zpZGNrAWZ+jwVA5DItrkfU9
	j69UrGx8HYgv3RLFm3YrCZ2UEDudzQpukMXR6LBb4QdE658G48v52hosznBzfSrohrb/jrB7Mp2
	8EjBiyg8qVAHDWXHNe6WofE31VOHS6445v9ue7da5M2aI3q18ryqdepYCufRT7dv2f0kftjMsj3
	TuJepdErJalKh4H3WafGkcc1Nr/U9r0YEliw8xsO67qb1uUW3xUC3bbO4D45AKwDXqu9giBtw6R
	reOFizUCIWPwKSP0l/gMA8XGksNbbSIsMGIs3P9YYIyuZZOBH1uAIJt4rkGTBH8eQuUIp4tMyl0
	MdwY8evUufW2wtBDjhentZXxYxCZYjDKHJkZbuH/MPtzuqQJl42Hs5GS2n732KohzfZW/EeLInJ
	gIWThqrk9ALVQE=
X-Received: by 2002:a05:6820:81e:b0:6b1:afca:5c78 with SMTP id 006d021491bc7-6b6fddba8bbmr3334490eaf.32.1788519871772;
        Fri, 04 Sep 2026 04:04:31 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885d29esm6640159eec.2.2026.09.04.04.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:04:30 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Jonas Gorski <jonas.gorski@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] spi: fix typos in comments
Date: Fri,  4 Sep 2026 16:34:16 +0530
Message-ID: <20260904110420.13707-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_040433_023347_9EA301D0 
X-CRM114-Status: GOOD (  22.61  )
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

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/spi/spi-bcm63xx.c     | 2 +-
 drivers/spi/spi-imx.c         | 2 +-
 drivers/spi/spi-omap2-mcspi.c | 2 +-
 drivers/spi/spi-pic32.c       | 2 +-
 drivers/spi/spi-s3c64xx.c     | 2 +-
 drivers/spi/spi-stm32.c       | 2 +-
 drivers/spi/spi-sun6i.c       | 2 +-
 drivers/spi/spi-xilinx.c      | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-bcm63xx.c b/drivers/spi/spi-bcm63xx.c
index 1d8e257bad30..3f349c1db581 100644
--- a/drivers/spi/spi-bcm63xx.c
+++ b/drivers/spi/spi-bcm63xx.c
@@ -413,7 +413,7 @@ static irqreturn_t bcm63xx_spi_interrupt(int irq, void *dev_id)
 	struct bcm63xx_spi *bs = spi_controller_get_devdata(host);
 	u8 intr;
 
-	/* Read interupts and clear them immediately */
+	/* Read interrupts and clear them immediately */
 	intr = bcm_spi_readb(bs, SPI_INT_STATUS);
 	bcm_spi_writeb(bs, SPI_INTR_CLEAR_ALL, SPI_INT_STATUS);
 	bcm_spi_writeb(bs, 0, SPI_INT_MASK);
diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
index 79a6c1a60b0a..6f9686df0486 100644
--- a/drivers/spi/spi-imx.c
+++ b/drivers/spi/spi-imx.c
@@ -673,7 +673,7 @@ static int mx51_ecspi_prepare_message(struct spi_imx_data *spi_imx,
 	 * propagate into the hardware. It takes exactly one tick of the
 	 * SCLK clock, but we will wait two SCLK clock just to be sure. The
 	 * effect of the delay it takes for the hardware to apply changes
-	 * is noticable if the SCLK clock run very slow. In such a case, if
+	 * is noticeable if the SCLK clock run very slow. In such a case, if
 	 * the polarity of SCLK should be inverted, the GPIO ChipSelect might
 	 * be asserted before the SCLK polarity changes, which would disrupt
 	 * the SPI communication as the device on the other end would consider
diff --git a/drivers/spi/spi-omap2-mcspi.c b/drivers/spi/spi-omap2-mcspi.c
index a3355147f5de..90f3990e0060 100644
--- a/drivers/spi/spi-omap2-mcspi.c
+++ b/drivers/spi/spi-omap2-mcspi.c
@@ -1244,7 +1244,7 @@ static int omap2_mcspi_transfer_one(struct spi_controller *ctlr,
 		omap2_mcspi_set_fifo(spi, t, 0);
 
 out:
-	/* Restore defaults if they were overriden */
+	/* Restore defaults if they were overridden */
 	if (par_override) {
 		par_override = 0;
 		status = omap2_mcspi_setup_transfer(spi, NULL);
diff --git a/drivers/spi/spi-pic32.c b/drivers/spi/spi-pic32.c
index 972128271e4b..8363bc873b03 100644
--- a/drivers/spi/spi-pic32.c
+++ b/drivers/spi/spi-pic32.c
@@ -53,7 +53,7 @@ struct pic32_spi_regs {
 #define  TX_FIFO_ALL_EMPTY	0 /* completely empty */
 #define  TX_FIFO_EMPTY		1 /* empty */
 #define  TX_FIFO_HALF_EMPTY	2 /* empty by half or more */
-#define  TX_FIFO_NOT_FULL	3 /* atleast one empty */
+#define  TX_FIFO_NOT_FULL	3 /* at least one empty */
 
 #define CTRL_MSTEN	BIT(5) /* enable master mode */
 #define CTRL_CKP	BIT(6) /* active low */
diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 8d4120cf9df1..3546414dfc70 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -661,7 +661,7 @@ static int s3c64xx_wait_for_pio(struct s3c64xx_spi_driver_data *sdd,
 	 * loops = length / max fifo size (calculated by using the
 	 * fifo mask).
 	 * For any size less than the fifo size the below code is
-	 * executed atleast once.
+	 * executed at least once.
 	 */
 	loops = xfer->len / sdd->fifo_depth;
 	buf = xfer->rx_buf;
diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index be88e62075af..5f5c43ae5096 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -515,7 +515,7 @@ static int stm32h7_spi_get_bpw_mask(struct stm32_spi *spi)
 
 	/*
 	 * The most significant bit at DSIZE bit field is reserved when the
-	 * maximum data size of periperal instances is limited to 16-bit
+	 * maximum data size of peripheral instances is limited to 16-bit
 	 */
 	stm32_spi_set_bits(spi, STM32H7_SPI_CFG1, STM32H7_SPI_CFG1_DSIZE);
 
diff --git a/drivers/spi/spi-sun6i.c b/drivers/spi/spi-sun6i.c
index 4631e9c7ca1d..6b7a05dd0de8 100644
--- a/drivers/spi/spi-sun6i.c
+++ b/drivers/spi/spi-sun6i.c
@@ -386,7 +386,7 @@ static int sun6i_spi_transfer_one(struct spi_controller *host,
 		 * SPI_CLK = MOD_CLK / (2 ^ cdr)
 		 * Or we can use CDR2, which is calculated with the formula:
 		 * SPI_CLK = MOD_CLK / (2 * (cdr + 1))
-		 * Wether we use the former or the latter is set through the
+		 * Whether we use the former or the latter is set through the
 		 * DRS bit.
 		 *
 		 * First try CDR2, and if we can't reach the expected
diff --git a/drivers/spi/spi-xilinx.c b/drivers/spi/spi-xilinx.c
index dc1e968659e1..df4ea99a5427 100644
--- a/drivers/spi/spi-xilinx.c
+++ b/drivers/spi/spi-xilinx.c
@@ -460,7 +460,7 @@ static int xilinx_spi_probe(struct platform_device *pdev)
 	host->num_chipselect = num_cs;
 
 	/*
-	 * Detect endianess on the IP via loop bit in CR. Detection
+	 * Detect endianness on the IP via loop bit in CR. Detection
 	 * must be done before reset is sent because incorrect reset
 	 * value generates error interrupt.
 	 * Setup little endian helper functions first and try to use them
-- 
2.48.1


