Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5298AFDEE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 17:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eWtbr5dqWZd3m3MctHshuBfTOIExMLaOJtKGOKoZ2hk=; b=EOX+0SgZ3HWftWtu18UJG2ZJVZ
	cbTdhh8PZblwM8jYogpzDm9syOEqiDlnd5YwRqkq2yz52HBtlLPfC9H1T4pB91IIiEzG2CmHqN+3H
	8+fExvRoX8d7hhbuD/NIUZoxONYbf+PQSAVODMBlDprKtASgJ0MuteBI6/ji3M311+O3EeKnPjCLR
	B5bk1ofhd5y4tAM2fI61BR/5ZV06nimGEXrdOMTq0xwmicPQvsHftcpg9V2PsOOrsZoFRMf4bASsd
	lujLwRdjRs0yB0KAFPPQd34I4KlT7sIY2RuHg4R8ZDwD3GWjmX9nmywmYJZnZy3cYQgMAkIMNwtAe
	+y0y4NOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFy2e-0000000C48Q-3DPU;
	Thu, 23 Apr 2026 17:40:44 +0000
Received: from fhigh-a1-smtp.messagingengine.com ([103.168.172.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFy2c-0000000C46t-42Th
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 17:40:44 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4762C1400050;
	Thu, 23 Apr 2026 13:40:42 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 23 Apr 2026 13:40:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kevinmehall.net;
	 h=cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1776966042; x=
	1777052442; bh=eWtbr5dqWZd3m3MctHshuBfTOIExMLaOJtKGOKoZ2hk=; b=C
	8o916SjzcFtReqmIs0JsHbuG2F8fuvpMUe39aAdWDgV1Grx/HUiZmoQe6Sn55ko2
	Cvx4vO/jsRdcYsjdgBLUce3Bp/3qS0RW83FjgvYdJhcGYueZ3i4tIBkLB8uyMsYu
	Bj/CabzxSio9LwVVYnhDx2x7a66zC4br7xdu24qtR5UXgV1fAZI6bXf7yFMwDEkm
	oIiQVGYcXiWVdQL1wq/ZJqvuWhfX8OjtDUKv4ABo23ByatTuEPY3eH5uEInD8IpH
	t/o+PtgCs764EbOMqIrxPZ0BADXBq1NEJrX2BREz2uj4axYJLmApOcTja2yX0bRX
	Vpdh8yg3XS/Df1xfEwTjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:date:feedback-id:feedback-id:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1776966042; x=1777052442; bh=eWtbr5dqWZd3m3MctHshuBfTOIEx
	MLaOJtKGOKoZ2hk=; b=rXQ4sGqtKVq11G3IbWkYip96992ZT3SccFbUIG9anLU5
	lmDgCZp1UKVeWik5SbMCROY750HZKh0heXJsDhKq9fwDFjZJHQ32VlYiHohvY6QW
	rSV4kEi37g+n23zQBXrGx1C/bJ76EXW24XkZ+h+0nGzwfwgWbBjkXpR1PYtLrHTD
	zmskTHgFpfyM1YmnhJGI14fBFnqQZTa9dFbiH/GKlXKVRG/B9Kfd2YJ/iblWhqNZ
	6HkBS9cQEJbVCwqRh5CTIzn+TMHgka4SMMKO2Q158SjJZvkIKMQl48JLprxPQFnA
	cpZGdxGFYiCtWphd4IJnH/hEHoPCjqqfvKyIdcCO+g==
X-ME-Sender: <xms:mlnqaTJRxDOja3sAq3jWjkjk4l0Lntrm1dekaT3zNQMBAztECpgw9Q>
    <xme:mlnqafWOE2QSNX97uhz-ZEwBQVmsEoRDNbeJabrhPCUTL1coEmfXygytj0U63Pm7I
    y6ZLcjZX99NnD1oXYQaGA-uKccUe5G02fuNCnH0vkRHrmjVq13q>
X-ME-Received: <xmr:mlnqaXS-Gvj7DU2qU16CxwXEwabNIG6norZRCchsR-ZNysikHL8LUQH5SwZQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeijeejjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfgvvhhinhcuofgv
    hhgrlhhluceokhhmsehkvghvihhnmhgvhhgrlhhlrdhnvghtqeenucggtffrrghtthgvrh
    hnpedttdefjeevjedvteekuedthefgueejuedujeehkeduudduieffteekjeektdegheen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkmheskh
    gvvhhinhhmvghhrghllhdrnhgvthdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopeifvghnsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgvrhhnvghjrdhs
    khhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholh
    hlrghnugdrohhrghdprhgtphhtthhopehmihhrkhhoqdguvghvkihlihhnuhigsehnrghn
    lhdruggvpdhrtghpthhtoheprhhstgesrhhunhhtuhigrdgtohhmpdhrtghpthhtoheplh
    hinhhugidqshhpihesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
    uhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprh
    gtphhtthhopehlihhnuhigqdhsuhhngihisehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:mlnqaXDV5zf-Y9irZJnQD8yJNwiSccJvsaKeNJehbA9Abr8RcNWjIw>
    <xmx:mlnqaWLEBvJbFwURlDKj9gbYNK3R0trPT90hn-dE6pCq6nzv_wPYyQ>
    <xmx:mlnqaaB8jh7R0aZCpKK8_SxfefZVkbpsWafoftgvfhe_cL98SsxidQ>
    <xmx:mlnqaTvr7XlLp0N66CfIe2ZbgXKKw9SaZBoGwO2EePm-hTWHrBxCmA>
    <xmx:mlnqaWdtXr6oGAapU5t3diqAHemfVmC1mKlfIGLANHwehQyoRwinVXnD>
Feedback-ID: i421842c8:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Apr 2026 13:40:41 -0400 (EDT)
From: Kevin Mehall <km@kevinmehall.net>
To: Mark Brown <broonie@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Mirko Vogt <mirko-dev|linux@nanl.de>,
	Ralf Schlatterbeck <rsc@runtux.com>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] spi: sun6i: Set SPI mode in prepare_message
Date: Thu, 23 Apr 2026 11:40:01 -0600
Message-ID: <20260423174001.2797797-3-km@kevinmehall.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260423174001.2797797-1-km@kevinmehall.net>
References: <20260423174001.2797797-1-km@kevinmehall.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_104043_067341_4327931E 
X-CRM114-Status: GOOD (  16.47  )
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

With a GPIO chip select, CS is asserted before entering transfer_one.
The spi-sun6i driver previously configured the SPI mode (including clock
polarity) and enabled the bus in transfer_one, which can cause an
extraneous SCK transition with CS asserted, corrupting the transferred
data.

This patch moves the SPI mode configuration and bus enable to the
spi_prepare_message callback, ensuring that SCK is driven to the correct
level prior to asserting CS.

A previous fix for a related issue (0d7993b234c9f) was incomplete in
that it only delayed enabling the SCK output drive to prevent it from
being driven at the wrong level when resuming from autosuspend, but
didn't help if switching CPOL modes between chip selects while active,
or if SCK floats to the opposite level when suspended.

Fixes: 0d7993b234c9 ("spi: spi-sun6i: Fix chipselect/clock bug")
Signed-off-by: Kevin Mehall <km@kevinmehall.net>
---
 drivers/spi/spi-sun6i.c | 67 +++++++++++++++++++++++++----------------
 1 file changed, 41 insertions(+), 26 deletions(-)

diff --git a/drivers/spi/spi-sun6i.c b/drivers/spi/spi-sun6i.c
index fc228574ed38..983e791e3396 100644
--- a/drivers/spi/spi-sun6i.c
+++ b/drivers/spi/spi-sun6i.c
@@ -205,6 +205,44 @@ static size_t sun6i_spi_max_transfer_size(struct spi_device *spi)
 	return SUN6I_MAX_XFER_SIZE - 1;
 }
 
+static int sun6i_spi_prepare_message(struct spi_controller *ctlr,
+				     struct spi_message *msg)
+{
+	struct sun6i_spi *sspi = spi_controller_get_devdata(ctlr);
+	struct spi_device *spi = msg->spi;
+	u32 reg;
+
+	/* Set the mode bits in the transfer control register */
+	reg = sun6i_spi_read(sspi, SUN6I_TFR_CTL_REG);
+
+	if (spi->mode & SPI_CPOL)
+		reg |= SUN6I_TFR_CTL_CPOL;
+	else
+		reg &= ~SUN6I_TFR_CTL_CPOL;
+
+	if (spi->mode & SPI_CPHA)
+		reg |= SUN6I_TFR_CTL_CPHA;
+	else
+		reg &= ~SUN6I_TFR_CTL_CPHA;
+
+	if (spi->mode & SPI_LSB_FIRST)
+		reg |= SUN6I_TFR_CTL_FBS;
+	else
+		reg &= ~SUN6I_TFR_CTL_FBS;
+
+	sun6i_spi_write(sspi, SUN6I_TFR_CTL_REG, reg);
+
+	/*
+	 * Now that the clock polarity is configured, enable the bus if the
+	 * controller was previously suspended.
+	 */
+	reg = sun6i_spi_read(sspi, SUN6I_GBL_CTL_REG);
+	reg |= SUN6I_GBL_CTL_BUS_ENABLE;
+	sun6i_spi_write(sspi, SUN6I_GBL_CTL_REG, reg);
+
+	return 0;
+}
+
 static void sun6i_spi_dma_rx_cb(void *param)
 {
 	struct sun6i_spi *sspi = param;
@@ -336,31 +374,12 @@ static int sun6i_spi_transfer_one(struct spi_controller *host,
 
 	sun6i_spi_write(sspi, SUN6I_FIFO_CTL_REG, reg);
 
-	/*
-	 * Setup the transfer control register: Chip Select,
-	 * polarities, etc.
-	 */
-	reg = sun6i_spi_read(sspi, SUN6I_TFR_CTL_REG);
-
-	if (spi->mode & SPI_CPOL)
-		reg |= SUN6I_TFR_CTL_CPOL;
-	else
-		reg &= ~SUN6I_TFR_CTL_CPOL;
-
-	if (spi->mode & SPI_CPHA)
-		reg |= SUN6I_TFR_CTL_CPHA;
-	else
-		reg &= ~SUN6I_TFR_CTL_CPHA;
-
-	if (spi->mode & SPI_LSB_FIRST)
-		reg |= SUN6I_TFR_CTL_FBS;
-	else
-		reg &= ~SUN6I_TFR_CTL_FBS;
-
 	/*
 	 * If it's a TX only transfer, we don't want to fill the RX
 	 * FIFO with bogus data
 	 */
+	reg = sun6i_spi_read(sspi, SUN6I_TFR_CTL_REG);
+
 	if (sspi->rx_buf) {
 		reg &= ~SUN6I_TFR_CTL_DHB;
 		rx_len = tfr->len;
@@ -429,11 +448,6 @@ static int sun6i_spi_transfer_one(struct spi_controller *host,
 		sun6i_spi_write(sspi, SUN6I_TFR_CTL_REG, reg);
 	}
 
-	/* Finally enable the bus - doing so before might raise SCK to HIGH */
-	reg = sun6i_spi_read(sspi, SUN6I_GBL_CTL_REG);
-	reg |= SUN6I_GBL_CTL_BUS_ENABLE;
-	sun6i_spi_write(sspi, SUN6I_GBL_CTL_REG, reg);
-
 	/* Setup the transfer now... */
 	if (sspi->tx_buf) {
 		tx_len = tfr->len;
@@ -668,6 +682,7 @@ static int sun6i_spi_probe(struct platform_device *pdev)
 	host->max_speed_hz = 100 * 1000 * 1000;
 	host->min_speed_hz = 3 * 1000;
 	host->use_gpio_descriptors = true;
+	host->prepare_message = sun6i_spi_prepare_message;
 	host->set_cs = sun6i_spi_set_cs;
 	host->transfer_one = sun6i_spi_transfer_one;
 	host->num_chipselect = 4;
-- 
2.53.0


