Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D98BC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 13:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Nc4BFEr66wGb844OtDVd4J6JLebUU3kF1noqOdkEW0=; b=c/Hyil6JjNF0E1b2pex28LsXQp
	SnCizhzd9NbxlUFZcEGlnylkT1ACQdYlbWnJ20LlWCObUrzgz1LYJCe9ekB3JJpJqipJBGWaxKPzE
	E9ObaKzWyaScjH1EwJOwD++OT6p6gfB+fSikBC5GxYn2gTQzBXR+PxIXCrjb93cb4lcYzdLnvKq/t
	RVPCBJ8+PyoTM4ql9RRqW5fG5XbnfTsp3z3QIoaFAO6DP0eSLqdP2mmRI7doO/i/TVA8zfP8xM+jl
	RZMvESDm3i6d4H4D1MB0dGwsgitmjZ2ec+X0nQCWGE/1sFgfUPbpaQ5a+jx8hA25iTVYS36Ovy3dH
	IzHnsGcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6pIl-00000009EVB-2p9l;
	Wed, 16 Sep 2026 13:03:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6pIj-00000009EUX-226A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 13:03:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9751B602CC
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 13:03:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F0181F00893
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 13:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789563828;
	bh=6Nc4BFEr66wGb844OtDVd4J6JLebUU3kF1noqOdkEW0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gyyl+QN9PzJF1my9LQVw8d2WfrvSWPXamHu+ZktlD+Y3R0cQaxwjZ/gXlKRvbXuF/
	 6KVjhhTYSLRLqfiN/eEeTrcklJGel6/jGNcNxYVPmJnjTvd9eGyMxECylpb+FYkYGP
	 HVcQH14+YAeItdWmnPQmVU56cq/M4BuA+UAvNa1roiiExFfImVtCdO5Ro2wSiZbGMR
	 6eVJScIfuBVs6koiHPn+WkpNZXTbTltPaAKsyidg1JxtUcKWDjVLKmbrxdQFaNQ+wA
	 CDj9k3eQgSgmzzmGqpg3YpQMPdJ6m9MAdT11mGACCDaYRmNUqVTTk3QA0fSYDa/zgT
	 rSHtrH6qunAVA==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b76ff64d78so802973e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 06:03:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxMCyV8DWrqsxPJwiRmIdTgnFuEV4rcY3+12XYdLyE2wJBHQ9U5d8lsoAPNjues+En8SGkksprvdQSWozS5u4mP@lists.infradead.org
X-Gm-Message-State: AFuF++mkumxl3ahsS+HRru1PmvZWYh2Wo7Z6kjH3Gy5vSUSc3uKTCwRz
	4RO3o9hXMjqYWgd2HXoqUlL+XLsaAz6UFUnykiCUhF5wXzd05sQbE1YOK91mwb1zEBMXAGj9Oev
	/y5zJlzMji6DSF1IhDdr4JqnRgP5y6s0=
X-Received: by 2002:a05:6512:3b9e:b0:5b6:4ae:d88 with SMTP id
 2adb3069b0e04-5b8b66216e9mr779741e87.28.1789563827041; Wed, 16 Sep 2026
 06:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260812120114.32501-1-ilya.titov@wirenboard.com> <20260903091718.44042-1-ilya.titov@wirenboard.com>
In-Reply-To: <20260903091718.44042-1-ilya.titov@wirenboard.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 15:03:34 +0200
X-Gmail-Original-Message-ID: <CAD++jLnvxYjRfdOrq4qmk1vX22csqMQ23R0_7VQYWZ2PBHx6_g@mail.gmail.com>
X-Gm-Features: AcwNN1XR9Yw-9dJs1sd5aeqfLOxRm-MFuv6MWfY9YiXG6ju_z14jNe5YgEWO-8M
Message-ID: <CAD++jLnvxYjRfdOrq4qmk1vX22csqMQ23R0_7VQYWZ2PBHx6_g@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: sunxi: keep a shadow copy of the data
 register output latches
To: Ilya Titov <ilya.titov@wirenboard.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	linux-gpio@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Sep 3, 2026 at 11:17=E2=80=AFAM Ilya Titov <ilya.titov@wirenboard.c=
om> wrote:

> On Allwinner SoCs, reading a bank's data register returns the pin level,
> not the output latch, for pins that are muxed as inputs.  Writing a GPIO
> therefore corrupts the output latches of all input-muxed pins in the
> same bank: the read-modify-write in sunxi_pinctrl_gpio_set() reads back
> their pin levels and writes those into their latches.
>
> This breaks emulated open-drain lines (e.g. a bit-banged I2C bus from
> i2c-gpio).  Such a line is released high by muxing it as input and
> letting the pull-up raise it, so any concurrent GPIO write in the same
> bank stores 1 into its latch.  Driving the line low afterwards is a
> non-atomic data-then-mux sequence in sunxi_pinctrl_gpio_direction_output(=
);
> if the poisoning write lands between the two steps, the pin actively
> drives high (push-pull) instead of low.
>
> Observed in practice as sporadic glitches on a T507 board bit-banging
> I2C on port E while other PE GPIOs are toggled.  On a scope the failure
> is unmistakable: on a clock pulse where SCL should fall to GND, the line
> instead steps *above* its idle high level for the whole low phase =E2=80=
=94 the
> pad drives a strong push-pull 3.3 V high, higher than the level the
> pull-up sustains on the loaded bus =E2=80=94 before the next transition r=
ecovers
> it.  The same can hit SDA, corrupting data instead of clocks.
>
> Steps to reproduce on any sunxi board with a bit-banged (i2c-gpio) bus:
>
>   # background: toggle any other GPIO of the same bank, e.g. line 21
>   gpioset -c <chip> --toggle 100us 21=3D0 &
>
>   # foreground: keep the bit-banged bus busy
>   while :; do i2cdetect -y <bus> 0x50 0x57; done
>
>   # watch SCL/SDA with a scope or logic analyzer: sporadic clock-low
>   # phases driven high (above the pull-up level) instead of low
>
> The bank spinlock cannot help: the racing write is a perfectly valid
> whole-register RMW that faithfully writes back what the hardware
> returned.  There are no set/clear registers on this IP to write a single
> bit atomically.
>
> Fix it the same way gpio-mmio handles hardware whose data register read
> does not return the output latch: keep a shadow copy of each bank's
> latches, base the read-modify-write on the shadow, and only write the
> register.  The shadow is seeded from the hardware at probe time so pins
> left in output mode by the bootloader keep their state.  Pins that reach
> output mode through the gpiolib paths write their value (and thereby
> their shadow bit) before the mux switch in
> sunxi_pinctrl_gpio_direction_output(); pins muxed to gpio_out directly
> through a pinmux node bypass that path, so sunxi_pmx_set() refreshes
> their shadow bit from the latch (readable once the pin is in output
> mode) to keep them driving their pre-existing level.
>
> Seeding the shadow reads the PIO registers at probe time, which requires
> the bus clock to be enabled.  The clock was only requested at the very
> end of probe, after devm_pinctrl_register() had already claimed the pin
> hogs described in the device tree - which mux pins, and thus access
> registers, with the clock still gated.  Move the request ahead of both.
> Boards whose bootloader leaves the PIO clock running are unaffected,
> which is why the pre-existing hog problem has gone unnoticed since
> commit 950707c0eb5c ("pinctrl: sunxi: add clock support").
>
> Fixes: df7b34f4c3d2 ("pinctrl: sunxi: Fix gpio_set behaviour")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ilya Titov <ilya.titov@wirenboard.com>

Patch applied for fixes.

Yours,
Linus Walleij

