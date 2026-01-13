Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F9CCD2D0E5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 12:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pXbP6x65cQ4uLrY56hGkWG67oz5EmOJHTgHrkeUR5j8=; b=dhEPck5eV/UuHq
	AS6xYgzKqMWhS8sWZ9gNyrQWAxehlnyCVXmeyYWtmFXSbYKtzHFsaQDqpXUwLIgZZ9rGgH/4SeZzM
	QQtEA724g82StTolCZusBB3/NHfj+6WHhnnWSianjr/S47HBySrWs80GH4Q60XrFz2Dpf5spnjBlQ
	m3SOV28jlvu3MoMTOVeQjCzRX2bHGA6hoNIRktRbmeTYkUYIeAI1FLkbLWaCcIBnYrT+WXcWb4lXx
	RDTwe3s3uie0kbWIJqGIFyXREds0qdrPJypBEjpZgqtxb7aK7BlTHzPyeavnfgjdhN4zNBOd5nG9q
	B1cAcQP0Yek/+G1O6Wkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfdWN-000000074ah-3LHa;
	Tue, 13 Jan 2026 12:29:15 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfdWK-000000074Yn-0wtZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 12:29:14 +0000
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1vfdWG-000338-9Y; Tue, 13 Jan 2026 13:29:08 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 0/2] Add more PLL frequencies to i.MX FRACN GPLL
Date: Tue, 13 Jan 2026 13:29:05 +0100
Message-Id: <20260113-v6-18-topic-clk-fracn-gppll-v1-0-166e674aabf1@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJE6ZmkC/x3MwQqDMAwA0F+RnA2YRsrYr4wdJEs1WGppRQTx3
 y07vsu7oGoxrfDuLih6WLUtNVDfgSxTmhXt1wxucH4gYjw80gv3LZugxBVDmSThnHOM6APxyOJ
 4FIY25KLBzv/++d73Ax3QSVxtAAAA
X-Change-ID: 20260113-v6-18-topic-clk-fracn-gppll-6f1343c234c3
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_042912_273869_D969EC95 
X-CRM114-Status: UNSURE (   8.31  )
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

Hi,

this adds two new PLL frequencies for the i.MX FRACN GPLL.

Patch-1 was previously part of [1]. The new version of [1] will drop the
the patch which is now part of this patchset.
 
[1] https://lore.kernel.org/all/20251202-v6-18-topic-imx93-phyboard-segin-av-02-display-v1-0-9c14be6c7478@pengutronix.de/

Regard,
  Marco

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Marco Felsch (2):
      clk: imx: fracn-gppll: Add 332.60 MHz Support
      clk: imx: fracn-gppll: Add 241.90 MHz Support

 drivers/clk/imx/clk-fracn-gppll.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
---
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
change-id: 20260113-v6-18-topic-clk-fracn-gppll-6f1343c234c3

Best regards,
-- 
Marco Felsch <m.felsch@pengutronix.de>


