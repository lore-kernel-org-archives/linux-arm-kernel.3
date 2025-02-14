Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE2CC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 14:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iYt5jWh3A66zM5dq1kV+b/5Oxgu4UuJfWgS+KQpBlR4=; b=mLN/5Ocj1+pBtBtsMinlN4BEWa
	eSY49kaot3ej+ra0aO1HAvnnHMb5474KC6/8BG7dJA2Qx/r0V2mSDsLGVwTvBisPEGeugkEoxXH7O
	ByeaDteKyCUQI+8ACvfqjR+YrHv72ccjUN6no0QrDHVK1zJe0VUhq1UnoPJAQqac8APZvY2bn85Gi
	0G1Tyt9vwO4ybFI7SLZXKkmjIDjAeUokk1UVph6boINFcBWolKocmkdG5hB84KmiOGs8TAzGKqvit
	t9w/1cLRKFqpZxqsxmHSd3f/frFm6XIfxaX8Trt/VdEjH94Vr8KTF05HGxn6oa8AgkYA7Hd0+oEvG
	tbqCB1Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiwHR-0000000F5dG-1CMi;
	Fri, 14 Feb 2025 14:02:57 +0000
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiwBB-0000000F4Sv-0blh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 13:56:31 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:6395:73cc:7fc4:4cab])
	by michel.telenet-ops.be with cmsmtp
	id DRvu2E00M1MuxXz06RvuMZ; Fri, 14 Feb 2025 14:56:25 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tiwAL-00000006p2a-0rh2;
	Fri, 14 Feb 2025 14:55:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tiwAc-00000000qEe-1aws;
	Fri, 14 Feb 2025 14:55:54 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	David Miller <davem@davemloft.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Crt Mori <cmo@melexis.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Alex Elder <elder@ieee.org>,
	David Laight <david.laight.linux@gmail.com>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	qat-linux@intel.com,
	linux-gpio@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-iio@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 0/4] Non-const bitfield helpers
Date: Fri, 14 Feb 2025 14:55:49 +0100
Message-ID: <cover.1739540679.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_055629_354794_30CCC839 
X-CRM114-Status: GOOD (  25.23  )
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

This is an updated subset of a patch series I sent more than 3 years
ago[2].

<linux/bitfield.h> contains various helpers for accessing bitfields, as
typically used in hardware registers for memory-mapped I/O blocks.
These helpers ensure type safety, and deduce automatically shift values
from mask values, avoiding mistakes due to inconsistent shifts and
masks, and leading to a reduction in source code size.

The existing FIELD_{GET,PREP}() macros are limited to compile-time
constants.  However, it is very common to prepare or extract bitfield
elements where the bitfield mask is not a compile-time constant.
To avoid this limitation, the AT91 clock driver introduced its own
field_{prep,get}() macros.  Hence my v1 series aimed to make them
available for general use, and convert several drivers to the existing
FIELD_{GET,PREP}() and the new field_{get,prep}() helpers.

Due to some pushback (mostly centered around using the typed
{u*,be*,le*,...}_get_bits() macros instead, which of course would
require making them work with non-constant masks first, too), this
series was never applied, and became buried deep in my TODO haystack...
However, several people still liked the idea: since v1, multiple copies
of the field_{prep,get}() macros appeared upstream, and one more is
queued for v6.15.

Hence I think it's time to revive and consolidate...

Changes compared to v2[1]:
  - New patch "[PATCH v3 1/4] bitfield: Drop underscores from macro
    parameters",
  - Add Acked-by,
  - Drop underscores from macro parameters,
  - Use __auto_type where possible,
  - Correctly cast reg to the mask type,
  - Introduces __val and __reg intermediates to simplify the actual
    operation,
  - Drop unneeded parentheses,
  - Clarify having both FIELD_{GET,PREP}() and field_{get,prep}(),

Changes compared to v1[2]:
  - Cast val resp. reg to the mask type,
  - Fix 64-bit use on 32-bit architectures,
  - Convert new upstream users:
      - drivers/crypto/intel/qat/qat_common/adf_gen4_pm_debugfs.c
      - drivers/gpio/gpio-aspeed.c
      - drivers/iio/temperature/mlx90614.c
      - drivers/pinctrl/nuvoton/pinctrl-ma35.c
      - sound/usb/mixer_quirks.c
  - Convert new user queued in renesas-devel for v6.15:
      - drivers/soc/renesas/rz-sysc.c
  - Drop the last 14 RFC patches.
    They can be updated/resubmitted/applied later.

I can take all four patches through the Renesas tree, and provide an
immutable branch with the first two patches for the interested parties.

Thanks for your comments!

[1] "[PATCH v2 0/3] Non-const bitfield helpers"
    https://lore.kernel.org/all/cover.1738329458.git.geert+renesas@glider.be
[2] "[PATCH 00/17] Non-const bitfield helper conversions"
    https://lore.kernel.org/all/cover.1637592133.git.geert+renesas@glider.be

Geert Uytterhoeven (4):
  bitfield: Drop underscores from macro parameters
  bitfield: Add non-constant field_{prep,get}() helpers
  clk: renesas: Use bitfield helpers
  soc: renesas: Use bitfield helpers

 drivers/clk/at91/clk-peripheral.c             |   1 +
 drivers/clk/at91/pmc.h                        |   3 -
 drivers/clk/renesas/clk-div6.c                |   6 +-
 drivers/clk/renesas/rcar-gen3-cpg.c           |  15 +--
 drivers/clk/renesas/rcar-gen4-cpg.c           |   9 +-
 .../qat/qat_common/adf_gen4_pm_debugfs.c      |   8 +-
 drivers/gpio/gpio-aspeed.c                    |   5 +-
 drivers/iio/temperature/mlx90614.c            |   5 +-
 drivers/pinctrl/nuvoton/pinctrl-ma35.c        |   4 -
 drivers/soc/renesas/renesas-soc.c             |   4 +-
 drivers/soc/renesas/rz-sysc.c                 |   3 +-
 include/linux/bitfield.h                      | 122 ++++++++++++------
 sound/usb/mixer_quirks.c                      |   4 -
 13 files changed, 97 insertions(+), 92 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

