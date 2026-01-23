Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87384D72361
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 09:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bcTSIzzObYHGP+bOM+AF+A6/sK8M6EvG+S57bVAeGEY=; b=SCP49iQ0vp13mFD3W+HrUXPs7E
	GqC94c7RXsCuiAmRGyiq3ijnIqIdK+Anu4yAp8qH0jJgraB46+Expes9p7l5lMWDsVKpkxgdsy3MY
	g/u1J5wyRwmG8JUhX4kF1pg+hMV0BDg1NkOEpp2nkph22v9wIw1pFUpUpVCkZZFzURy0l1GdAg5tQ
	UQu82wFV+inLuqa/ZOocfjxK9Dnp+/9Bz9Cr0GJUoBp34CpZyTLewKSydu7U7GAPR787bo9t75FVL
	Lr5DkhQMmIyZQaz/GNPbbZDkpPe0Ze4fCf/FTcG4W3upPNoBn2WKRV6QvHMDFV5cqLhAFn9BBvyzG
	3FO+lfVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDY8-00000008ava-25Qn;
	Fri, 23 Jan 2026 09:33:52 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDY5-00000008aui-20VL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 09:33:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D19B5C21AB9;
	Fri, 23 Jan 2026 09:33:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A2C4C6070A;
	Fri, 23 Jan 2026 09:33:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 57F01119A879C;
	Fri, 23 Jan 2026 10:33:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769160823; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=bcTSIzzObYHGP+bOM+AF+A6/sK8M6EvG+S57bVAeGEY=;
	b=YzdpXDufAdR1RpKSzpOR81fXvRGbimJiIwt47r6/FHFleuR5ZonWB9JJE/nnlXj5WN/Kic
	2djjgtKm0Uu18xpaVQsLKow+DGP9zwCzQA8x+7BBAz9O/HFLa/wgVMgsgKvRjR6RdNaAiW
	FHLX2LpWcUbR13ekdUEux+fYJCFiqcGNilw1ssrtEsqKMQxImUyYO9FbqSVlER5+r2SnFz
	lDvqhAxHMzvTseVj6IH1hfRk1b7fB+bbWoH62BZ1vBmnkWxxT2AW8KkhXgz/wKY4Bw7e0G
	BorrsVpaXR/OF5h8xdSiumfzN7GSx/gYCC6OuAomNd5nrUUsiN6XWTUH0YR8yg==
From: Richard Genoud <richard.genoud@bootlin.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Paul Kocialkowski <paulk@sys-base.io>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v3 0/4] Introduce Allwinner H616 PWM controller
Date: Fri, 23 Jan 2026 10:33:18 +0100
Message-ID: <20260123093322.1327389-1-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_013349_657997_C6A40673 
X-CRM114-Status: GOOD (  23.12  )
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

Allwinner H616 PWM controller is quite different from the A10 one.

It can drive 6 PWM channels, and like for the A10, each channel has a
bypass that permits to output a clock, bypassing the PWM logic, when
enabled.

But, the channels are paired 2 by 2, sharing a first set of
MUX/prescaler/gate.
Then, for each channel, there's another prescaler (that will be bypassed
if the bypass is enabled for this channel).

It looks like that:
            _____      ______      ________
OSC24M --->|     |    |      |    |        |
APB1 ----->| Mux |--->| Gate |--->| /div_m |-----> PWM_clock_src_xy
           |_____|    |______|    |________|
                          ________
                         |        |
                      +->| /div_k |---> PWM_clock_x
                      |  |________|
                      |    ______
                      |   |      |
                      +-->| Gate |----> PWM_bypass_clock_x
                      |   |______|
PWM_clock_src_xy -----+   ________
                      |  |        |
                      +->| /div_k |---> PWM_clock_y
                      |  |________|
                      |    ______
                      |   |      |
                      +-->| Gate |----> PWM_bypass_clock_y
                          |______|

Where xy can be 0/1, 2/3, 4/5

PWM_clock_x/y serve for the PWM purpose.
PWM_bypass_clock_x/y serve for the clock-provider purpose.
The common clock framework has been used to manage those clocks.

This PWM driver serves as a clock-provider for PWM_bypass_clocks.
This is needed for example by the embedded AC300 PHY which clock comes
from PMW5 pin (PB12).

Usually, to get a clock from a PWM driver, we use the pwm-clock driver
so that the PWM driver doesn't need to be a clk-provider itself.
While this works in most cases, here it just doesn't.
That's because the pwm-clock request a period from the PWM driver,
without any clue that it actually wants a clock at a specific frequency,
and not a PWM signal with duty cycle capability.
So, the PWM driver doesn't know if it can use the bypass or not, it
doesn't even have the real accurate frequency information (23809524 Hz
instead of 24MHz) because PWM drivers only deal with periods.

With pwm-clock, we loose a precious information along the way (that we
actually want a clock and not a PWM signal).
That's ok with simple PWM drivers that don't have multiple input clocks,
but in this case, without this information, we can't know for sure which
clock to use.
And here, for instance, if we ask for a 24MHz clock, pwm-clock will
requests 42ns (assigned-clocks doesn't help for that matter). The logic
is to select the highest clock (100MHz) with no prescaler and a duty
cycle value of 2/4 => we have 25MHz instead of 24MHz.
And that's a perfectly fine choice for a PMW, because we still can
change the duty cycle in the range [0-4]/4.
But obviously for a clock, we don't care about the duty cycle, but more
about the clock accuracy.

And actually, this PWM is really a PWM AND a real clock when the bypass
is set.

This series is based onto v6.19-rc4

NB: checkpatch is not happy with patch 2, but it's a false positive.
It doesn't detect that PWM_XY_SRC_MUX/GATE/DIV are structures, but as
it's more readable like that, I prefer keeping it that way.

NB2: for geopolitical reasons, I didn't re-use the old series that Paul
was referring to.

Changes since v2:

- use U32_MAX instead of defining UINT32_MAX
- add a comment on U32_MAX usage in clk_round_rate()
- change clk_table_div_m (use macros)
- fix formatting (double space, superfluous comma, extra line feed)
- fix the parent clock order
- simplify code by using scoped_guard()
- add missing const in to_h616_pwm_chip() and rename to
h616_pwm_from_chip()
- add/remove missing/superflous error messages
- rename cnt->period_ticks, duty_cnt->duty_ticks
- fix PWM_PERIOD_MAX
- add .remove() callback
- fix DIV_ROUND_CLOSEST_ULL->DIV_ROUND_UP_ULL
- add H616_ prefix
- protect _reg in macros
- switch to waveforms instead of apply/get_state
- shrink struct h616_pwm_channel
- rebase on v6.19-rc4

Changes since v1:
- rebase onto v6.19-rc1
- add missing headers
- remove MODULE_ALIAS (suggested by Krzysztof)
- use sun4i-pwm binding instead of creating a new one (suggested by Krzysztof)
- retrieve the parent clocks from the devicetree
- switch num_parents to unsigned int


Richard Genoud (4):
  dt-bindings: pwm: allwinner: add h616 pwm compatible
  pwm: sun50i: Add H616 PWM support
  arm64: dts: allwinner: h616: add PWM controller
  MAINTAINERS: Add entry on Allwinner H616 PWM driver

 .../bindings/pwm/allwinner,sun4i-a10-pwm.yaml |  19 +-
 MAINTAINERS                                   |   5 +
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi |  47 +
 drivers/pwm/Kconfig                           |  12 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-sun50i-h616.c                 | 959 ++++++++++++++++++
 6 files changed, 1042 insertions(+), 1 deletion(-)
 create mode 100644 drivers/pwm/pwm-sun50i-h616.c


base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
-- 
2.47.3


