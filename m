Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B31C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 15:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XbTE8+5G08NWFNYqz8CaOCflUxeN2she3yImRY9urvo=; b=Wv0KE8WpqV/zcv
	26WXQe5DrdGw/1GjhX9gagq0WsghIYOJy3JdUpfJhEO9owCWWmc8dpveGQmGOuUBPEmvCOWDFADhh
	UOxQVRyrSXEU69WRI9sadAfCl3434CV1CmOlViyhCSIGhObTaqz/6Fs8UQx2zK1+gHTPDdiKJCDCH
	I6nfwV9u2Guyezc/5u4MA/54wzdXJmK3R7auU5SpcPz3EpSy5QiUIhK1fjI7iuXoRh9+tUJYbeBli
	YJuCxcBrUq9fHgYTkVmuNr1T631Xp2owzpEyQZn6hnE1tcqhTUztkxnLxMOZTY7CFnF/IbAx+3wDy
	Ygx2D+dzBUmlTCtVFyQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1n0P-0000000F6Wl-0AF4;
	Wed, 02 Sep 2026 15:36:05 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1n0L-0000000F6UY-31SE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 15:36:03 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id E88AD200F45;
	Wed, 02 Sep 2026 17:35:53 +0200 (CEST)
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <jre@pengutronix.de>)
	id 1x1n0D-004bxm-2n;
	Wed, 02 Sep 2026 17:35:53 +0200
From: Jonas Rebmann <jre@pengutronix.de>
Subject: [PATCH 0/5] spi: spi-sun4i: assorted fixes
Date: Wed, 02 Sep 2026 17:35:42 +0200
Message-Id: <20260902-spi-sun4i-fixes-v1-0-19985ef75673@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE9CmGoC/x3LSwqAMAwA0atI1gbS4qd6FXFRa9RsqjQognh3i
 8vHMA8oJ2GFvngg8SUqe8wwZQFh83FllDkbLNmGOrKoh6CesRJc5GZF42ti52gO7QT5OhL/IU/
 D+L4f3zMtSmEAAAA=
X-Change-ID: 20260902-spi-sun4i-fixes-1a50e880dc7b
To: Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Alexandru Gagniuc <mr.nuke.me@gmail.com>, 
 Olliver Schinagl <o.schinagl@ultimaker.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@linaro.org>, kernel@pengutronix.de, 
 Marc Kleine-Budde <mkl@pengutronix.de>, Jonas Rebmann <jre@pengutronix.de>, 
 Tobias Schramm <t.schramm@manjaro.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1045; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=au5eMP/naxrcGstXPZpXtyykJRGjSGrWTPNZekscycM=;
 b=owGbwMvMwCV2ZcYT3onnbjcwnlZLYsia4RRmtklk5lf3xCsGe9gk46aaO2uZcecVfToiWRZ02
 8H/mnBYRykLgxgXg6yYIkusmpyCkLH/dbNKu1iYOaxMIEMYuDgFYCKzpzP8d6xV28Gyy9f0kvXi
 K4u48qYwrHnZvm3JtgqT1BYWt5YN/Az/sxrKNWv6NeoPr1mhkRHh/aVC6F93rZR4UcycxNK7uvN
 YAQ==
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_083601_920840_1030283F 
X-CRM114-Status: UNSURE (   8.16  )
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

This is a series of patches for the spi-sun4i driver, some of which have
been sitting around for a while.

1-4 are fixes and 5 is a small patch that introduces reporting of the
effective SPI speed.

Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
Marc Kleine-Budde (5):
      spi: spi-sun4i: sun4i_spi_transfer_one(): fix transfers for SUN4I_FIFO_DEPTH
      spi: spi-sun4i: sun4i_spi_fill_fifo(): always apply A10 FIFO fill level workaround
      spi: spi-sun4i: sun4i_spi_transfer_one(): fix setting of clock rate
      spi: spi-sun4i: sun4i_spi_handler(): fix race condition between transfer completion and RX FIFO interrupt
      spi: spi-sun4i: sun4i_spi_transfer_one(): report effectively used speed_hz of transfer

 drivers/spi/spi-sun4i.c | 51 ++++++++++++++++++++++++++-----------------------
 1 file changed, 27 insertions(+), 24 deletions(-)
---
base-commit: 89a312991dc6e638a36adc43ccb91dbc25504c04
change-id: 20260902-spi-sun4i-fixes-1a50e880dc7b

Best regards,
--  
Jonas Rebmann <jre@pengutronix.de>


