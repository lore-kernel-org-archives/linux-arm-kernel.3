Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCCDACD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 13:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FAAn/mWJuuN5gL4FlLtNSl6vPNBasbbg1AXB8rDwhzk=; b=s87qp8zb98ymujlCEVOAG7B5gV
	ye22YYDkVaFgj1/wPZH2Ugk01nOw0R1Em8MIGQRPa8oCSGOdOda0slghD0NDCUMClqXAc8x9/R5+S
	FJxKhpetcFKnVKin1Uu4XOZ1a+WOg5h5DaM63ohDWEwidxrHsPWQhT1+1Bm7htZjY1klfY/qgRq9e
	E0NW14Hqn5CCwuiPXMZ7ZjYIcRHSgX4JjPGr42L2SqKBJIVPsrDZ+0OjNmc4C38jceJYWtlPSuky+
	2hqEdPsGyXXQYGYSnyRMhgTgSrdy2yPI2Q5pwlWqGGan+EmHKCgb+Yk0Gr3bRAstBA6TIPqAKlAxK
	vjARAtGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCaw-00000001LDb-1GDM;
	Thu, 18 Jun 2026 13:15:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCau-00000001LCv-2VUL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 13:15:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E77043C46
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 13:15:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 162701F00ADF
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 13:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781788544;
	bh=FAAn/mWJuuN5gL4FlLtNSl6vPNBasbbg1AXB8rDwhzk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RvDj8lXapXNOvDW2rf9wVnNlwHPrTLK4sqXVu5/UvcJCFMrFeluBRbB7SYTQM7zqe
	 5j3fADVyCzPW/FMNcXuGyIJkNXAG2eY10J+sPgFludxHZhQliRr+xytCmBOmIqI6rM
	 iP9qCUbW3Ss9yE+rTytVTiMA+bZXsdkNCjy5RuuotGpr2ErLHf6ktGcAr8fWt7G2hv
	 lC6t4g9zYopVfoicscD/Sjs4NJmrkTL0RJF7ejLsBWhgOc6va+W3+fwcZyVeUFoMYY
	 prrIDR80FHzeKc4CM6LUoP7IozLBBYb8Ap5PSDKu2EPiQhuFVVPS/ZL1YEL7Z3LhUC
	 i1SfWrn9Y2F8Q==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39677c80386so9330931fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 06:15:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+qgLKTjZfzIwtP3ZGJEeez1qqjoftg1QTxAiRk6Km+U4QRdEPizm2Fgp3L+wDZHpQ/Y/rBrZFeeeQqSSWqOW+k@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+nXDPudnJ5Fh/0Jd+OH1n1mitUaf7AMm2EEe4OuMmP6KnuLwh
	ff7w+53ZhtaIgNhRwJlCkuMYtTJO65LAwWF9IwISAaumf4qA0G4+mMPAiQloVIdxvlJa8URDL4n
	ndqXem/N7hCypzo5mZOM+dGtvFFm6ZX8=
X-Received: by 2002:ac2:4f0f:0:b0:5ad:51ac:21d8 with SMTP id
 2adb3069b0e04-5ad51ac22a4mr687097e87.14.1781788542680; Thu, 18 Jun 2026
 06:15:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260618053650.4053352-1-runyu.xiao@seu.edu.cn>
In-Reply-To: <20260618053650.4053352-1-runyu.xiao@seu.edu.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 18 Jun 2026 15:15:30 +0200
X-Gmail-Original-Message-ID: <CAD++jLmW3vgTFryRAL24x2TbgbR1tbhjw-nFFH3askoZfSibaQ@mail.gmail.com>
X-Gm-Features: AVVi8Cd4ajb_jyilwrzYqFD2Tx2XDqLDSoVk9kbdtiibfu6CS572v2FjQevMhk4
Message-ID: <CAD++jLmW3vgTFryRAL24x2TbgbR1tbhjw-nFFH3askoZfSibaQ@mail.gmail.com>
Subject: Re: Question: pinctrl-backed GPIO set_config and gpio_chip::can_sleep
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Antonio Borneo <antonio.borneo@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn
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

Hi Runyu,

thanks for your analysis!

On Thu, Jun 18, 2026 at 7:42=E2=80=AFAM Runyu Xiao <runyu.xiao@seu.edu.cn> =
wrote:

> The path we are concerned about is:
>
>   gpiod_set_config()
>     -> gpio_do_set_config()
>        -> gpiochip_generic_config()
>        -> pinctrl_gpio_set_config()
>        -> pinctrl_get_device_gpio_range()
>        -> mutex_lock(&pctldev->mutex)

That would be mutex_lock(&pinctrldev_list_mutex); would it not?

> If gpiod_cansleep() returns false, a GPIO forwarder or another consumer
> can choose an atomic carrier and call gpiod_set_config() while holding a
> spinlock.

I see the problem.

> The local draft I am considering marks only these controllers as
> sleeping:
>
>   pinctrl: at91-pio4: mark the GPIO controller as sleeping
>   pinctrl: stm32: mark the GPIO controller as sleeping
>   pinctrl: sunxi: mark the GPIO controller as sleeping
>
> The reason is that all three expose gpiochip_generic_config() and can
> therefore reach the pinctrl mutex from the GPIO set_config path, while
> their current gpio_chip registration does not set can_sleep.

But that's not the right solution is it? These controllers can probably
just write a register and be done with it, they all look like they are
memory-mapped? That means we introduce sleep where not needed.

Can we simply replace pinctrldev_list_mutex with a spinlock?
The list isn't gonna be huge and all in-memory anyway.
If it takes too much time we need to think about putting the
ranges in a better data structure such as the maple tree.

mutex_lock(&pinctrldev_list_mutex); could then be turned
into spinlock_irqsave() or even better
guard(spinlock_irqsave)(&pinctrldev_list_lock) in
pinctrl_get_device_gpio_range().

This would mean we just take two different spinlocks in seqence
and save state in each so it should work just fine.

Yours,
Linus Walleij

