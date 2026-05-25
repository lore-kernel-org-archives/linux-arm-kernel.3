Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70CD7CD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 21:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bNNN4D5MpHVo8O8P96Spg5PfU1PqKnQWGcRJSIW2Ppk=; b=jv21u+GVJG7pt4NBBHJrFJ7eGB
	fzRo+KuKxisGxAak5V28F5BbeaUGKR81MjnhP2gObUaCd5w2jac9bihamdFJ7+tAUltwizee9vnWl
	e4C4mYxahPUf5ZhANbqc98QMA13q6EOqueWRWL6/5++7C6BJWjMaLDubij2/q6BZ8EhMbN84EeDvb
	iN+9d+VJLwN0L/7W2Zt94N9jB8WJbVTcUctENteAhIXUY+KnVy5xTvPTqrbOyr2ZZMAxGolG8t37M
	QUiCT+ULYGbuACcTYMiUEZSIPftwB3YnlFuNlOqnw3Y82+DiwyqGyPV5s3SSws+sQ8G2jE10ETxGR
	MRRwhMwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRcf6-00000000U6Z-0Ndk;
	Mon, 25 May 2026 21:16:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRcf3-00000000U5U-0aWs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 21:16:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FB001758;
	Mon, 25 May 2026 14:16:21 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F29713F632;
	Mon, 25 May 2026 14:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779743786; bh=Q3KznSmPGXShIXkpUxQ+T6UiVEFFgAzT1PTN8IZQDcA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DceHwUnsr+h9yMlBWX/oFjrCB/CAS+EBlWKkxrF7rijrwncPuyE1VOcEfF6eFEnUV
	 ERbPoaErMvi9f6rVI+fnr6fCMje0FFMj1FD+ANSgdfBohsCTdD5ydudgxRAk+BDj2Q
	 56tLHKt09r4Vai3S95SsZnNzDvx/rH9y9TwVIxEw=
Date: Mon, 25 May 2026 23:15:26 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Richard Genoud <richard.genoud@bootlin.com>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Paul Kocialkowski <paulk@sys-base.io>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, John Stultz
 <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>,
 bigunclemax@gmail.com, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/4] Introduce Allwinner H616 PWM controller
Message-ID: <20260525231526.0c5d9a10@ryzen.lan>
In-Reply-To: <20260416134037.3160537-1-richard.genoud@bootlin.com>
References: <20260416134037.3160537-1-richard.genoud@bootlin.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_141633_475839_1D517BDC 
X-CRM114-Status: GOOD (  47.77  )
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

On Thu, 16 Apr 2026 15:40:33 +0200
Richard Genoud <richard.genoud@bootlin.com> wrote:

Hi Richard,

> Allwinner H616 PWM controller is quite different from the A10 one.
> 
> It can drive 6 PWM channels, and like for the A10, each channel has a
> bypass that permits to output a clock, bypassing the PWM logic, when
> enabled.
> 
> But, the channels are paired 2 by 2, sharing a first set of
> MUX/prescaler/gate.
> Then, for each channel, there's another prescaler (that will be bypassed
> if the bypass is enabled for this channel).
> 
> It looks like that:
>             _____      ______      ________
> OSC24M --->|     |    |      |    |        |
> APB1 ----->| Mux |--->| Gate |--->| /div_m |-----> PWM_clock_src_xy
>            |_____|    |______|    |________|
>                           ________
>                          |        |
>                       +->| /div_k |---> PWM_clock_x
>                       |  |________|
>                       |    ______
>                       |   |      |
>                       +-->| Gate |----> PWM_bypass_clock_x
>                       |   |______|
> PWM_clock_src_xy -----+   ________
>                       |  |        |
>                       +->| /div_k |---> PWM_clock_y
>                       |  |________|
>                       |    ______
>                       |   |      |
>                       +-->| Gate |----> PWM_bypass_clock_y
>                           |______|
> 
> Where xy can be 0/1, 2/3, 4/5
> 
> PWM_clock_x/y serve for the PWM purpose.
> PWM_bypass_clock_x/y serve for the clock-provider purpose.
> The common clock framework has been used to manage those clocks.
> 
> This PWM driver serves as a clock-provider for PWM_bypass_clocks.
> This is needed for example by the embedded AC300 PHY which clock comes
> from PMW5 pin (PB12).
> 
> Usually, to get a clock from a PWM driver, we use the pwm-clock driver
> so that the PWM driver doesn't need to be a clk-provider itself.
> While this works in most cases, here it just doesn't.
> That's because the pwm-clock request a period from the PWM driver,
> without any clue that it actually wants a clock at a specific frequency,
> and not a PWM signal with duty cycle capability.
> So, the PWM driver doesn't know if it can use the bypass or not, it
> doesn't even have the real accurate frequency information (23809524 Hz
> instead of 24MHz) because PWM drivers only deal with periods.
> 
> With pwm-clock, we loose a precious information along the way (that we
> actually want a clock and not a PWM signal).
> That's ok with simple PWM drivers that don't have multiple input clocks,
> but in this case, without this information, we can't know for sure which
> clock to use.
> And here, for instance, if we ask for a 24MHz clock, pwm-clock will
> requests 42ns (assigned-clocks doesn't help for that matter). The logic
> is to select the highest clock (100MHz) with no prescaler and a duty
> cycle value of 2/4 => we have 25MHz instead of 24MHz.

Didn't we discuss this choice of "highest clock" before? I dimly
remember asking whether we cannot use a least-error approach, so
considering all clocks and choosing the one which matches the target
best?

> And that's a perfectly fine choice for a PMW, because we still can
> change the duty cycle in the range [0-4]/4.
> But obviously for a clock, we don't care about the duty cycle, but more
> about the clock accuracy.

Thanks for your research into this and summarising this up! I see your
point, and always found the choice to use nanoseconds in PWM somewhat
problematic, especially when looking at the rounding errors.
And while turning the PWM into a clock provider looks like a clever
solution, this is somewhat arbitrary - why do we have this for those
SoCs and not the other (older) ones? The 24 MHz != 1/42ns problem is
the same there.
What also bugs me a bit is also that this is actually a decision
affecting the generic hardware devicetree description of the system,
but its rooted in a Linux implementation detail (ns resolution periods).

So before we consider going this route:
- Can we change the internal interface in Linux, maybe introducing
  some special interface from pwm-clock to the pwm drivers, to convey
  frequencies directly, instead of period lengths?
- Can we add an optional interface for pwm drivers in general, to use
  a frequency / duty-cycle pair to describe a PWM setup? I would naively
  think those to be some kind of natural PWM parameters.
- Can we at least add a picosecond precision interface? That doesn't
  solve the rounding issue for those number not only divisible by
  2 or 5 (like 24), but at least it seems to mitigate it:
  24 MHz => 41666 ps => 24.000384 MHz

I see that having a clock provider seems like a more sustainable and
fitting choice, but as mentioned it's something that affects the DT
description, so I don't want to change that lightly.

Cheers,
Andre

> And actually, this PWM is really a PWM AND a real clock when the bypass
> is set.
> 
> This series is based onto v7.0
> 
> NB: checkpatch is not happy with patch 2, but it's a false positive.
> It doesn't detect that PWM_XY_SRC_MUX/GATE/DIV are structures, but as
> it's more readable like that, I prefer keeping it that way.
> 
> Changes since v5:
> - remove trailing junk after commit message in patch 4
> - remove Tested-by when it doesn't make sense.
> (sorry for the noise)
> 
> Changes since v4:
> - Fix a bug on bypass for channels greater than 1
> - add colons to clarify 2 debug messages
> - switch from H616 to sun8i prefix (in code, filename, module name)
> - fix consistency issues in macro parameters
> - rename some macros with a confusing naming
> - rebase on v7.0
> 
> Changes since v3:
> - gather Acked-by/Tested-by
> - fix cast from pointer to integer of different size (kernel test robot
>   with arc platform)
> - add devm_action for clk_hw_unregister_composite as suggested by Philipp
> - remove now unused pwm_remove as suggested by Philipp
> 
> Changes since v2:
> - use U32_MAX instead of defining UINT32_MAX
> - add a comment on U32_MAX usage in clk_round_rate()
> - change clk_table_div_m (use macros)
> - fix formatting (double space, superfluous comma, extra line feed)
> - fix the parent clock order
> - simplify code by using scoped_guard()
> - add missing const in to_h616_pwm_chip() and rename to
> h616_pwm_from_chip()
> - add/remove missing/superfluous error messages
> - rename cnt->period_ticks, duty_cnt->duty_ticks
> - fix PWM_PERIOD_MAX
> - add .remove() callback
> - fix DIV_ROUND_CLOSEST_ULL->DIV_ROUND_UP_ULL
> - add H616_ prefix
> - protect _reg in macros
> - switch to waveforms instead of apply/get_state
> - shrink struct h616_pwm_channel
> - rebase on v6.19-rc4
> 
> Changes since v1:
> - rebase onto v6.19-rc1
> - add missing headers
> - remove MODULE_ALIAS (suggested by Krzysztof)
> - use sun4i-pwm binding instead of creating a new one (suggested by Krzysztof)
> - retrieve the parent clocks from the devicetree
> - switch num_parents to unsigned int
> 
> Richard Genoud (4):
>   dt-bindings: pwm: allwinner: add h616 pwm compatible
>   pwm: sun8i: Add H616 PWM support
>   arm64: dts: allwinner: h616: add PWM controller
>   MAINTAINERS: Add entry on Allwinner sun8i/H616 PWM driver
> 
>  .../bindings/pwm/allwinner,sun4i-a10-pwm.yaml |  19 +-
>  MAINTAINERS                                   |   5 +
>  .../arm64/boot/dts/allwinner/sun50i-h616.dtsi |  47 +
>  drivers/pwm/Kconfig                           |  12 +
>  drivers/pwm/Makefile                          |   1 +
>  drivers/pwm/pwm-sun8i.c                       | 938 ++++++++++++++++++
>  6 files changed, 1021 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/pwm/pwm-sun8i.c
> 
> 
> base-commit: 028ef9c96e96197026887c0f092424679298aae8
> 


