Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F319C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 15:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NSkHAqmd/2cEfFNtZqg1b81GQhRgfhZFQl6U0Q3/OKY=; b=1BHAlYBOW5Ut3tG/XAJmaiseIP
	rn+w+nGTGxeDXMYwtwBpsBRGJa5bfylAkHJEE6DzbAXgz+xgXHcgW9mwUo8WZDoIcjM1l1R1yg2Zk
	yv1rpVeqTTo38Vp3Fgbjm9btKtWa02YGYbXm6r8FwyoAEzenpkdCTEUuaOKvC9b85plh+WcbsmGE0
	+ed2YU2nI4fmcAmZ08T7iCYiMXTqh7Y4rm311AMfY8+l7MAE6ay3DELg3huCsGvX/r1m7xfsPneAa
	16uw9BO+ixC5rTTATY8VhvapzS3zwspU+Hv9D9ThT3NS3GwVnJuAepSH/Sp7epzz92nhKx05w3inR
	dCDBx16w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68jL-00000004BII-1Yqi;
	Mon, 14 Sep 2026 15:36:27 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68j9-00000004BB3-2SLE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 15:36:17 +0000
X-PTX-Original-Recipient: mkl@pengutronix.de
X-PTX-Original-Recipient: jre@pengutronix.de
X-PTX-Original-Recipient: kernel@pengutronix.de
X-PTX-Original-Recipient: o.schinagl@ultimaker.com
X-PTX-Original-Recipient: wens@kernel.org
X-PTX-Original-Recipient: broonie@kernel.org
X-PTX-Original-Recipient: mripard@kernel.org
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org
X-PTX-Original-Recipient: linux-spi@vger.kernel.org
X-PTX-Original-Recipient: linux-sunxi@lists.linux.dev
X-PTX-Original-Recipient: jernej.skrabec@gmail.com
X-PTX-Original-Recipient: mr.nuke.me@gmail.com
X-PTX-Original-Recipient: samuel@sholland.org
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 598C8202892;
	Mon, 14 Sep 2026 17:36:08 +0200 (CEST)
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <jre@pengutronix.de>)
	id 1x68j2-000vXD-0u;
	Mon, 14 Sep 2026 17:36:08 +0200
From: Jonas Rebmann <jre@pengutronix.de>
Date: Mon, 14 Sep 2026 17:35:59 +0200
Subject: [PATCH v3 5/6] spi: spi-sun4i: sun4i_spi_transfer_one(): add error
 handling at clock setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-spi-sun4i-fixes-v3-5-9fe919d5cecf@pengutronix.de>
References: <20260914-spi-sun4i-fixes-v3-0-9fe919d5cecf@pengutronix.de>
In-Reply-To: <20260914-spi-sun4i-fixes-v3-0-9fe919d5cecf@pengutronix.de>
To: Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Alexandru Gagniuc <mr.nuke.me@gmail.com>, 
 Olliver Schinagl <o.schinagl@ultimaker.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Marc Kleine-Budde <mkl@pengutronix.de>, 
 Jonas Rebmann <jre@pengutronix.de>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1118; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=wu/+2GSkV2Qc9GppxtVd4a+jeqa89kwJcDEkkOr63nw=;
 b=owGbwMvMwCV2ZcYT3onnbjcwnlZLYshaIZI+8cQtzhkJtoIukyOaX323P3D3x6zK98Hxb1ZmL
 ztl/fHU9I5SFgYxLgZZMUWWWDU5BSFj/+tmlXaxMHNYmUCGMHBxCsBEZvkxMlwTOi6nbTB/1W93
 3SZ7xltBR2dGXsyw27v20PQDci08od2MDHt/GF6/eO/7/amrrqmtnJSofja98uHhF6/LHCJOPOS
 5MpcdAA==
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_083615_818500_98D14D59 
X-CRM114-Status: GOOD (  11.37  )
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

Bail out if clk_get_rate() or clk_set_rate() fail during
sun4i_spi_transfer_one(). This might happen if the clock isn't known yet
or fails to set the requested rate.

This also ensures that mclk_rate is nonzero and can be safely divided by
in a future commit.

Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
 drivers/spi/spi-sun4i.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-sun4i.c b/drivers/spi/spi-sun4i.c
index ea8be0170fbf..94e1c7bbd632 100644
--- a/drivers/spi/spi-sun4i.c
+++ b/drivers/spi/spi-sun4i.c
@@ -279,9 +279,17 @@ static int sun4i_spi_transfer_one(struct spi_controller *host,
 
 	/* Ensure that we have a parent clock fast enough */
 	mclk_rate = clk_get_rate(sspi->mclk);
+	if (!mclk_rate)
+		return -EINVAL;
+
 	if (mclk_rate < (2 * tfr->speed_hz)) {
-		clk_set_rate(sspi->mclk, 2 * tfr->speed_hz);
+		ret = clk_set_rate(sspi->mclk, 2 * tfr->speed_hz);
+		if (ret)
+			return ret;
+
 		mclk_rate = clk_get_rate(sspi->mclk);
+		if (!mclk_rate)
+			return -EINVAL;
 	}
 
 	/*

-- 
2.55.0.806.gb8242b093d


