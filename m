Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76262CD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 15:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2YQUVV3SkKdFUZa5LqwgG4UQncFE3248WeAf3898B2I=; b=noL7Ir6ntn61SQYma6qH3DTOJk
	/OSucNW6JhO5f+AQxpVvdXnakAl+3nSAZu/nlY+zrKhTc7lzdJouV1icYyFZIbi4fZ/FZMd78xRdt
	7eZZc5T0k02H7K+mZYfdFhl2F7FXEn91KeswUd9z7wzmq9pRescnvLqrcs2rUjNQX5wKXuH1e18ja
	DrilEmUCvj067h1o2zEHeMOfFy7Bknn/UCpACAzw4wbuSmaWhNs3dEinLEvino78t/LeKv9NwBfR5
	xnbw3Ptf/PikH/xBXJkGDb9UuGGt7/q9AcmqD70apOzM+yFNt5XAqekX3Rqsg8yx64haLYkuZfhhm
	8qwxf+5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITOT-00000005dz4-3dzM;
	Thu, 30 Apr 2026 15:33:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITOS-00000005dyk-27bC;
	Thu, 30 Apr 2026 15:33:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 90B7B60180;
	Thu, 30 Apr 2026 15:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD608C2BCB3;
	Thu, 30 Apr 2026 15:33:31 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/7] pinctrl: Fix types in .pin_config_group_get() callbacks
Date: Thu, 30 Apr 2026 17:33:11 +0200
Message-ID: <cover.1777562725.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

	Hi all,

On 64-bit platforms, "unsigned long" is 64-bit.  However, when checking
if all "unsigned long" configuration values passed to the
.pin_config_group_get() callback are equal, several drivers use a 32-bit
temporary.  Fortunately this works, as currently all configuration
values fit in 32-bit.

This series makes the code cleaner and more future-proof by changing the
types of all temporaries to unsigned long.

I intend to queue patches 5 and 6 in renesas-pinctrl for v7.2.
Thanks for your comments!

Geert Uytterhoeven (7):
  pinctrl: airoha: Fix type in .pin_config_group_get() callback
  pinctrl: equilibrium: Fix type in .pin_config_group_get() callback
  pinctrl: ingenic: Fix type in .pin_config_group_get() callback
  pinctrl: mediatek: moore: Fix type in .pin_config_group_get() callback
  pinctrl: renesas: rzg2l: Fix type in .pin_config_group_get() callback
  pinctrl: renesas: rzv2m: Fix type in .pin_config_group_get() callback
  pinctrl: single: Fix type in .pin_config_group_get() callback

 drivers/pinctrl/mediatek/pinctrl-airoha.c | 2 +-
 drivers/pinctrl/mediatek/pinctrl-moore.c  | 3 ++-
 drivers/pinctrl/pinctrl-equilibrium.c     | 3 ++-
 drivers/pinctrl/pinctrl-ingenic.c         | 3 ++-
 drivers/pinctrl/pinctrl-single.c          | 3 ++-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c   | 3 ++-
 drivers/pinctrl/renesas/pinctrl-rzv2m.c   | 3 ++-
 7 files changed, 13 insertions(+), 7 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

