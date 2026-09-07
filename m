Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4384EC79FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 15:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m91ilKKuAyyzrrYKwKekM260QNNWazUKyIcIGqf2N2A=; b=b7oAUDF2C/nCOg1O9SHVZ/eMZ6
	i0D2UYewBJsqBuWfvf5xckWPO5iLs8vgNFDLKo9nn1p/WX+j9YMztN+UUVoFqaMVZkhVcGrYM1Zsr
	0ygdxWZJCgKpCwzm+j20eT+TQX86s6FFPzUzvx9YnSAoKptV69TipOLZFh5P/mfxhk6YcBLMWrWex
	iqFXM7yQzJK4F+TWmVyvfzW0B1SkPv/VWzFt5C5FjRQb3m0s6qW+eItg2zRL2wPaSEMcu4Iq7OMv2
	JenCNySo/ESgcdd6ZOxNDzUzen3fDS8yfLX5B38vvt1lQM+cyOlDJBYosDlzEaNJZtR2q90g+IUPD
	qiVFbeGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bKc-00000007AOS-3zAu;
	Mon, 07 Sep 2026 15:32:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bKW-00000007AKE-1Dha
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Sep 2026 15:32:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=m91ilKKuAyyzrrYKwKekM260QNNWazUKyIcIGqf2N2A=; b=JRcQLyF5oAgcw6tjkja8IsOiNJ
	tskSvs+EvuOE9g9PRPwdgjlIe9rWOUl3k0sFOSco+eceaQ63YhHboBai8wurS9KTL4ZtxAPmzyF4F
	ZOOl4troDbns7DuAwKgtcTL2D7un559fk3x1D7VaMLOsbiUL6J6AvIY8Djl10WImY24DefYPI16ri
	uVlWKUITtXy5RPANcPMVzN79RECsce8ioHrNatACgxuQKPN8yUXXA5LsJMyR6BZ1I+XSyOnWHpwQD
	znuq8v+CfsyVwxy+UG3a9M+PsOUq4drUvCUGXllE6MZ7XJT6FUNJ7fROVE23jZgNd95+Xiyb3ng5T
	mxxutLSw==;
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3bKN-0000000GNUh-0s4z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 15:32:18 +0000
X-PTX-Original-Recipient: samuel@sholland.org
X-PTX-Original-Recipient: linux-sunxi@lists.linux.dev
X-PTX-Original-Recipient: o.schinagl@ultimaker.com
X-PTX-Original-Recipient: broonie@linaro.org
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org
X-PTX-Original-Recipient: linux-spi@vger.kernel.org
X-PTX-Original-Recipient: jernej.skrabec@gmail.com
X-PTX-Original-Recipient: mr.nuke.me@gmail.com
X-PTX-Original-Recipient: mkl@pengutronix.de
X-PTX-Original-Recipient: kernel@pengutronix.de
X-PTX-Original-Recipient: jre@pengutronix.de
X-PTX-Original-Recipient: mripard@kernel.org
X-PTX-Original-Recipient: wens@kernel.org
X-PTX-Original-Recipient: broonie@kernel.org
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 38D77201B5A;
	Mon, 07 Sep 2026 17:32:04 +0200 (CEST)
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <jre@pengutronix.de>)
	id 1x3bKG-000Ym1-0P;
	Mon, 07 Sep 2026 17:32:04 +0200
From: Jonas Rebmann <jre@pengutronix.de>
Date: Mon, 07 Sep 2026 17:31:41 +0200
Subject: [PATCH v2 2/6] spi: spi-sun4i: sun4i_spi_fill_fifo(): always apply
 A10 FIFO fill level workaround
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-spi-sun4i-fixes-v2-2-7e805662b9bd@pengutronix.de>
References: <20260907-spi-sun4i-fixes-v2-0-7e805662b9bd@pengutronix.de>
In-Reply-To: <20260907-spi-sun4i-fixes-v2-0-7e805662b9bd@pengutronix.de>
To: Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Alexandru Gagniuc <mr.nuke.me@gmail.com>, 
 Olliver Schinagl <o.schinagl@ultimaker.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@linaro.org>, kernel@pengutronix.de, 
 Marc Kleine-Budde <mkl@pengutronix.de>, Jonas Rebmann <jre@pengutronix.de>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2965; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=TyIg6fa906BvVGJmUbL2uFkFKtz0nx9DEAKb+ItgMx8=;
 b=owGbwMvMwCV2ZcYT3onnbjcwnlZLYsiad+NjfujlU9Xca7e9//dESvhjwtX8LhmWsFDdCv1m0
 fZ9rm3XOkpZGMS4GGTFFFli1eQUhIz9r5tV2sXCzGFlAhnCwMUpABMpmMbwP3yD74O1ml7hrqzJ
 CoaeJ4VXMM/l+z+HfbHnWaf1grUdCxn+l1zYM1/zl6Khw6Nva2ZM1M5Vk+EOOV9Qv9agY8/Jo1v
 1WQA=
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_163211_618152_E87CF4C3 
X-CRM114-Status: GOOD (  18.43  )
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

From: Marc Kleine-Budde <mkl@pengutronix.de>

In commit 6d9fe44bd73d ("spi: sun4i: fix FIFO limit"), the TX FIFO is
filled max to SUN4I_FIFO_DEPTH - 1 (= 63) bytes to work around
timeouts observed on A10s SoCs.

Commit 196737912da5 ("spi: sun4i: Allow transfers larger than FIFO
size") added support for transfers larger than the FIFO size. This
commit did not consider the A10 workaround (limit the TX FIFO fill
size to SUN4I_FIFO_DEPTH - 1 (= 63) bytes) for refilling the TX FIFO
in the IRQ handler.

To apply the workaround independent from where sun4i_spi_fill_fifo()
is called, remove the length argument from the function and directly
take the max fill level of SUN4I_FIFO_DEPTH - 1 into account when
calculating the free space in the FIFO.

Due to the lack of HW this patch has not been tested on an A10 SoC,
but on an A20 SoC. It was not possible to reproduce the timeout on the
A20.

Fixes: 196737912da5 ("spi: sun4i: Allow transfers larger than FIFO size")
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
 drivers/spi/spi-sun4i.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/spi/spi-sun4i.c b/drivers/spi/spi-sun4i.c
index 2e2324453905..3649bcabcc9a 100644
--- a/drivers/spi/spi-sun4i.c
+++ b/drivers/spi/spi-sun4i.c
@@ -142,15 +142,21 @@ static inline void sun4i_spi_drain_fifo(struct sun4i_spi *sspi, int len)
 	}
 }
 
-static inline void sun4i_spi_fill_fifo(struct sun4i_spi *sspi, int len)
+static inline void sun4i_spi_fill_fifo(struct sun4i_spi *sspi)
 {
 	u32 cnt;
+	int len;
 	u8 byte;
 
-	/* See how much data we can fit */
-	cnt = SUN4I_FIFO_DEPTH - sun4i_spi_get_tx_fifo_count(sspi);
+	/*
+	 * See how much data we can fit
+	 *
+	 * Filling the FIFO fully causes timeout for some reason
+	 * at least on spi2 on A10s
+	 */
+	cnt = SUN4I_FIFO_DEPTH - 1 - sun4i_spi_get_tx_fifo_count(sspi);
 
-	len = min3(len, (int)cnt, sspi->len);
+	len = min_t(int, cnt, sspi->len);
 
 	while (len--) {
 		byte = sspi->tx_buf ? *sspi->tx_buf++ : 0;
@@ -311,12 +317,8 @@ static int sun4i_spi_transfer_one(struct spi_controller *host,
 	sun4i_spi_write(sspi, SUN4I_BURST_CNT_REG, SUN4I_BURST_CNT(tfr->len));
 	sun4i_spi_write(sspi, SUN4I_XMIT_CNT_REG, SUN4I_XMIT_CNT(tx_len));
 
-	/*
-	 * Fill the TX FIFO
-	 * Filling the FIFO fully causes timeout for some reason
-	 * at least on spi2 on A10s
-	 */
-	sun4i_spi_fill_fifo(sspi, SUN4I_FIFO_DEPTH - 1);
+	/* Fill the TX FIFO */
+	sun4i_spi_fill_fifo(sspi);
 
 	/* Enable the interrupts */
 	sun4i_spi_enable_interrupt(sspi, SUN4I_INT_CTL_TC |
@@ -373,7 +375,7 @@ static irqreturn_t sun4i_spi_handler(int irq, void *dev_id)
 
 	/* Transmit FIFO 3/4 empty */
 	if (status & SUN4I_INT_CTL_TF_E34) {
-		sun4i_spi_fill_fifo(sspi, SUN4I_FIFO_DEPTH);
+		sun4i_spi_fill_fifo(sspi);
 
 		if (!sspi->len)
 			/* nothing left to transmit */

-- 
2.55.0.123.gf60db8d575


