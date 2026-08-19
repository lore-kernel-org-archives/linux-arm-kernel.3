Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B92C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 19:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WHhv5xJJD7yiAIqir0gSM17i7zMoCdu452Z6//1pxus=; b=txPdrqpKorOUd2h9dCL2/cZ4Qc
	EmVkDOwTJfnoqOAZaDKqeuqURdr6NkSjodiZknTAId9/1bINE4xh/HMsK9FVHXbutRN/NfXXLdEJW
	ajHJQ3Arsq5YYhso6kgfFmQuC+Sr3TjMCXBMLC4VIH1rFEOddgg/LwHtRBB6147HpkVs1qfeK7Ld8
	VI1fqKWtaim1gfzqKVHICl7pWNaDYyAEhvLouYxxYZ1EcG+jD5DTs0cN1STsYGdbmDjgcPC7TGzMZ
	TxhHVB90TUn9QvtFVtCLL5bPw6PFFjGO3Qo/yoCGyQOHe+6FBGnyw5hJBvlDq21TXoN6GXahjLVo3
	mxTbIUDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwlbh-0000000APpw-1PCq;
	Wed, 19 Aug 2026 19:05:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwlbg-0000000APph-0IfC;
	Wed, 19 Aug 2026 19:05:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 265C660AAA;
	Wed, 19 Aug 2026 19:05:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 576961F000E9;
	Wed, 19 Aug 2026 19:05:41 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Tero Kristo <kristo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Nuno Sa <nuno.sa@analog.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sunny Luo <sunny.luo@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Mark Brown <broonie@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH treewide 0/5] clk: Make sure clk_init_data is fully initialized (part 1)
Date: Wed, 19 Aug 2026 21:05:14 +0200
Message-ID: <cover.1787165329.git.geert+renesas@glider.be>
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

The clk_init_data structure contains three mutually-exclusive members
for different methods to specify the possible parents of a clock,
prompting drivers to initialize only the members they need.  When commit
fc0c209c147f35ed ("clk: Allow parents to be specified without string
names") added the last two methods, this was done in a
backwards-compatible way, using a priority-based scheme:
  - .name, .ops, .num_parents, and .flags must always be initialized,
  - if .num_parents is non-zero, .parent_names must be initialized,
      - if .parent_names is NULL, .parent_data must be initialized,
	  - if .parent_data is NULL, .parent_hws must be initialized
	    and valid.

However, not initializing all members may cause subtle issues, which are
only exposed when CONFIG_INIT_STACK_ALL_PATTERN or
CONFIG_INIT_STACK_NONE is enabled.

Hence this series makes sure all members are fully initialized, to fix
such bugs, and to avoid future breakage when converting drivers to a
different method for specifying the parents.

This (small) series is part 1, and fixes all cases that I identified to
be real bugs:
  - The first patch fixes a crash I saw on BeagleBone Black,
  - The other patches are only compile-tested.
All patches in this series can be applied independently.

Part 2 will be much larger (touching 185 files), and will fix the
remaining cases that are currently harmless.

Thanks for your comments!

Geert Uytterhoeven (5):
  clk: ti: Make sure clk_init_data is fully initialized
  clk: visconti: Make sure clk_init_data is fully initialized
  hwmon: (ltc4282) Make sure clk_init_data is fully initialized
  iio: frequency: adf4377: Make sure clk_init_data is fully initialized
  spi: amlogic-spisg: Make sure clk_init_data is fully initialized

 drivers/clk/ti/adpll.c          | 4 ++--
 drivers/clk/ti/divider.c        | 2 +-
 drivers/clk/ti/mux.c            | 2 +-
 drivers/clk/visconti/clkc.c     | 2 +-
 drivers/hwmon/ltc4282.c         | 2 +-
 drivers/iio/frequency/adf4377.c | 2 +-
 drivers/spi/spi-amlogic-spisg.c | 2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

