Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78AECC02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 16:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gNjrSd8dndcZ0lYvAGstUTEdyHmZD24YQOCp3Ef4JJA=; b=HjLAdHbm090JfhPJ9kEX6fBc+v
	oU49vGAvi8uozNeoDGz3RFNFQpjaZgzWFolCzbypAepmZvCdvkAnFAUAGDbhfjUZVe3ft4GfEuq8P
	PrmRqSwV8HvXOw2tfWfM53jH+9I2c1//HzSbhU4UOkiVrxo8azUQGB2qBrQ1ICFIHUIs882zoxiqq
	xLexA1v5xO78FxOChK+FN5fAU55xexh/zRR5L/FJNUnQXxvgNwRno9Cqh3ORsMBoZwDeRHuQxMTLE
	Y9wZI/HasrcmBX98CjgPM0lRJMOdyUuCVYMts4HxAS5maGs5TnogC4EyYO4zEbOuJvgo9caLtWheY
	vD/H1cZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY6fy-0000000CVtU-3lwQ;
	Wed, 15 Jan 2025 16:55:30 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY6ee-0000000CVig-2tPj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 16:54:11 +0000
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tY6ea-0005nU-Sx; Wed, 15 Jan 2025 17:54:04 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller fixes for v6.13
Date: Wed, 15 Jan 2025 17:54:04 +0100
Message-Id: <20250115165404.1269500-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_085408_732885_77A2C0E6 
X-CRM114-Status: UNSURE (   6.81  )
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

Dear arm-soc maintainers,

The following changes since commit 5ae1a43486fb3febd5ce78da13eb354f16d049e0:

  clk: amlogic: axg-audio: revert reset implementation (2024-12-02 17:21:03 -0800)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux.git tags/reset-fixes-for-v6.13-2

for you to fetch changes up to 055884c45d5f56e34fe56b173b43bbb8f0cd9640:

  reset: rzg2l-usbphy-ctrl: Assign proper of node to the allocated device (2025-01-15 17:47:52 +0100)

----------------------------------------------------------------
Reset controller fixes for v6.13

* Fix rzg2l-usb-vbus-regulator lookup by assigning the proper of node
  to the allocated platform device in the rzg2l-usbphy-ctrl driver.

----------------------------------------------------------------
Claudiu Beznea (1):
      reset: rzg2l-usbphy-ctrl: Assign proper of node to the allocated device

 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 1 +
 1 file changed, 1 insertion(+)

