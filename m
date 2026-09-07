Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1ABC79FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 15:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0TbsDMKwCa09Pa7WkEnrcED1SOakXMhi9pJGH54m1kM=; b=2IwqkKwqc02QegFrFDaJCYM3wM
	eqzSgfuyykRBFXHX8SrycJryxYGW6KALRMzam9z5hz08jxJG0t9PZOxu/5AxcQCs4amtupO6PNuCj
	nX1odQZFqMxjyhKcjUJyiYWklzyWQkq5yPg6ayEib4XWByzUp9aPPg4HmQC2TeCvsRSYgWWJ8NqjZ
	A5o3ERBDODc30/4GjTPi0ovR4IXwzxLLNQPrwKG3nHaWQikrGXJm/ERc91/rCKnF4aGUBr/welWUN
	sAY1L3uPCBDjCqQRNWpHi3Uc5pJJieg7p0o7c7L12IS7fsC8BlaC0uXc21bq4whL/H+zqyBH/W28b
	Z60u7R9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bKZ-00000007AKv-24oz;
	Mon, 07 Sep 2026 15:32:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bKQ-00000007AHU-1SwP
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Sep 2026 15:32:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0TbsDMKwCa09Pa7WkEnrcED1SOakXMhi9pJGH54m1kM=; b=UMIiUBb2rjX7sScoHdjZyWRPiW
	dKoK5nhEnM0N0nKdmp9JOUTxcVBxGtZwZzXXx8J4nFiRJKZbGa/pLiNJCFIIE2HnoW89ozHMXlmxv
	F56GBeY/Ry6e/9NyynL2SSqfz/hswVuPnkx4qBBMdzvx1lHZwo/Kw6yp6zQz1Yd+48kQqPQNoSCIu
	oskhbkgMqRjuvb+CO3ABUOh6CqYr/x3MhD+3ndPEQqL6j93OfaZae+qHkrPKNCQmjURvz47f9ZWQR
	57V/FkxFl4A9mpig3ppGBHNqez/y2wk1YS62Igu/4QN+2yHEBJcKhlEt0CL2hf1pac6V3DW90ZxkT
	VsEVm3kg==;
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3bKN-0000000GNUj-0RMn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 15:32:13 +0000
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
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 4738E201CD1;
	Mon, 07 Sep 2026 17:32:04 +0200 (CEST)
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <jre@pengutronix.de>)
	id 1x3bKG-000Ym1-0b;
	Mon, 07 Sep 2026 17:32:04 +0200
From: Jonas Rebmann <jre@pengutronix.de>
Date: Mon, 07 Sep 2026 17:31:42 +0200
Subject: [PATCH v2 3/6] spi: spi-sun4i: sun4i_spi_transfer_one(): fix
 setting of clock rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-spi-sun4i-fixes-v2-3-7e805662b9bd@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2341; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=pSbHNGpfbi6ot6AXey1gYf0jWgNZ6badXvRmVMsMld4=;
 b=owGbwMvMwCV2ZcYT3onnbjcwnlZLYsiad+OTx/prk2vF5qltXybckXXhyeFgXT5bowvJJx9pX
 JGXXSm7pKOUhUGMi0FWTJElVk1OQcjY/7pZpV0szBxWJpAhDFycAjCR2bsZGZZ9dd+zfPnUM+Fh
 T78ECnVt+Lzr7pxJxa0pfC1G3cw9rvGMDKc3i5z8f/bJ/rKjGSbmv7IX90umGztNc3A5Jv1axff
 EPl4A
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_163211_502554_C196E030 
X-CRM114-Status: GOOD (  15.16  )
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

A SPI transfer defines the _maximum_ speed of the SPI transfer. However
the driver doesn't take into account that the clock divider is always
rounded down (due to integer arithmetic). This results in a too high
clock rate for the SPI transfer.

E.g.: with an mclk_rate of 24 MHz and an SPI transfer speed of 10 MHz,
the original code calculates a reg of "0", which results in an effective
divider of "2" and a 12 MHz clock for the SPI transfer.

Use DIV_ROUND_UP() instead of a plain integer division to fix the
problem.

While there simplify the divider calculation for the CDR1 case, use
order_base_2() instead of two ilog2() calculations.

Fixes: b5f6517948cc ("spi: sunxi: Add Allwinner A10 SPI controller driver")
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
 drivers/spi/spi-sun4i.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/spi/spi-sun4i.c b/drivers/spi/spi-sun4i.c
index 3649bcabcc9a..8a9dcd3b6b8f 100644
--- a/drivers/spi/spi-sun4i.c
+++ b/drivers/spi/spi-sun4i.c
@@ -212,7 +212,7 @@ static int sun4i_spi_transfer_one(struct spi_controller *host,
 				  struct spi_transfer *tfr)
 {
 	struct sun4i_spi *sspi = spi_controller_get_devdata(host);
-	unsigned int mclk_rate, div;
+	unsigned int mclk_rate, div, div_cdr1, div_cdr2;
 	unsigned long time_left;
 	unsigned int start, end, tx_time;
 	unsigned int tx_len = 0;
@@ -296,15 +296,13 @@ static int sun4i_spi_transfer_one(struct spi_controller *host,
 	 * First try CDR2, and if we can't reach the expected
 	 * frequency, fall back to CDR1.
 	 */
-	div = mclk_rate / (2 * tfr->speed_hz);
-	if (div <= (SUN4I_CLK_CTL_CDR2_MASK + 1)) {
-		if (div > 0)
-			div--;
-
-		reg = SUN4I_CLK_CTL_CDR2(div) | SUN4I_CLK_CTL_DRS;
+	div_cdr1 = DIV_ROUND_UP(mclk_rate, tfr->speed_hz);
+	div_cdr2 = DIV_ROUND_UP(div_cdr1, 2);
+	if (div_cdr2 <= (SUN4I_CLK_CTL_CDR2_MASK + 1)) {
+		reg = SUN4I_CLK_CTL_CDR2(div_cdr2 - 1) | SUN4I_CLK_CTL_DRS;
 	} else {
-		div = ilog2(mclk_rate) - ilog2(tfr->speed_hz);
-		reg = SUN4I_CLK_CTL_CDR1(div);
+		div = min(SUN4I_CLK_CTL_CDR1_MASK + 1, order_base_2(div_cdr1));
+		reg = SUN4I_CLK_CTL_CDR1(div - 1);
 	}
 
 	sun4i_spi_write(sspi, SUN4I_CLK_CTL_REG, reg);

-- 
2.55.0.123.gf60db8d575


