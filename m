Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7149EEA8557
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 05:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PNeD+GDRfvfC163fk97XXvGbw+Jo2OUnbtzurN4RsaA=; b=EVhws0ShELdQ93xie70BPyPv2A
	40ww9R2JlB5Vxxjv8IWNBrIuuLI9JPRgm35KNHvmB6kbfmmHytcTUbHBUDm8e3J3Kw+P3agmo/8OC
	S1Hkuijeh1fTPX1rV5tDuXmrxtl5MvjO9EM8a9swtnLTE2n1ArEMvyMvYFuzYH2nEj074UX4nJGFE
	T7Rgg4ajTqKaDecagTsx/Hgscbc8qie9OJg0WsbYaHp+L6yzZJyhLteBrj8FQYXsMyHNyjyHB5mdG
	ECRqsQn9rx5psjNLPId9+dgTmLx5rE7ZQo3ZpTbVh5pR+KRKlpgHqQN6QJDfIYcKJJJpu73CArfZU
	fLqMh9gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzTCK-00000006gkm-0Q1p;
	Mon, 09 Mar 2026 05:30:32 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzTC6-00000006gjg-3ZqX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 05:30:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PNeD+GDRfvfC163fk97XXvGbw+Jo2OUnbtzurN4RsaA=; b=f0eOdXQyFKMkguvkn34E3Xua0g
	Bb1HoHUvOp6/i0mokX4C1D2tti8SZSeNi/F8NVTGZtj9uQBnydmZ2mVd4TbKXdCnZTCbngSj3tBAX
	DhnRXbNsdmi1RzlCSshHcHo3OhkrcddJLsyxmP+WUKGB7n6o4zIukG9CaUT+tRCeC6OQYh2lursuZ
	gqcXU43yidC6ZrXTQ/dXtXtJS2bdoWNKqEZyTLOUCpvlC5tUBIPcPcPk5JuJkIedMrs6zUm++tlB0
	hYfPxgsDLaQiY+QOIF5w8UZFuHrK8qgE6iVezAUE9LlBbFdmPLc78lAUq0Hk5IitGGu66gVdY1wY0
	EM8EpBrA==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1vzTC4-00000009tKp-24g7;
	Mon, 09 Mar 2026 06:30:16 +0100
Date: Mon, 9 Mar 2026 06:29:38 +0100
From: Michal Piekos <michal.piekos@mmpsystems.pl>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andrey Skvortsov <andrej.skvortzov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v2] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure
 when pinmux is unknown
Message-ID: <jbxovdxkqgg7jnbryzvtrk2df4cgtzee3f6deqxu47nruotaau@254vefkw2gxk>
References: <20260308-rc2-boot-hang-v2-1-516fdb820953@mmpsystems.pl>
 <CAGb2v67FO1bt3yee2SXn1LTt7O10z1EHHw7F0xQ0bKbpUqch4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v67FO1bt3yee2SXn1LTt7O10z1EHHw7F0xQ0bKbpUqch4w@mail.gmail.com>
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_223024_753385_E57A9125 
X-CRM114-Status: GOOD (  36.12  )
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

On Sun, Mar 08, 2026 at 10:06:42PM +0800, Chen-Yu Tsai wrote:
> On Sun, Mar 8, 2026 at 9:42 PM Michal Piekos
> <michal.piekos@mmpsystems.pl> wrote:
> >
> > Fixes kernel hang during boot due to inability to set up IRQ on AXP313a.
> >
> > The issue is caused by gpiochip::get_direction() which was returning
> > -ENODEV when gpio is in unitialized state.
> >
> > Instead of failing when the current muxval is at default value, report
> > the line as input.
> 
> I don't really like this "fix". It's really lying.
> 
> Also, this problem only occurs if the interrupt is taken directly using
> the DT "interrupts" property, as that mostly bypasses the GPIO subsystem,
> especially the gpio request part.
> 
> If the consumer does gpiod_request() followed by gpiod_to_irq(), then
> the pin is already muxed to either one of the GPIO functions and this
> won't error out.
> 
> I also found that if the interrupt is taken directly through the device
> tree, the pin itself is not locked out (like for GPIOs, on sunxi we also
> don't do pinctrl settings for pins used for interrupts).
> 
> I think the proper fix would be to somehow be able to request the pin
> as GPIO if it hasn't been requested already. And then either
> sunxi_pinctrl_irq_request_resources() can use that to request the pin
> and mux the pin before calling gpiochip_lock_as_irq().
> 
> Hope Linus and Bartosz have some suggestions.
> 
> 
> Thanks
> ChenYu
> 

I will prepare new version with your suggestion.

Michal

> 
> > Tested on Orange Pi Zero 3.
> >
> > Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> > Suggested-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
> > ---
> > This fixes a kernel hang during boot on the Orange Pi Zero 3 caused by
> > inability to set up interrupt for the AXP313A PMIC.
> >
> > The issue is caused by gpiochip::get_direction() which was returning
> > -ENODEV when gpio is in unitialized state and its muxval is at default
> > value.
> >
> > Instead of failing, report the line as input.
> >
> > To: Rob Herring <robh@kernel.org>
> > To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > To: Conor Dooley <conor+dt@kernel.org>
> > To: Chen-Yu Tsai <wens@kernel.org>
> > To: Jernej Skrabec <jernej.skrabec@gmail.com>
> > To: Samuel Holland <samuel@sholland.org>
> > To: Andre Przywara <andre.przywara@arm.com>
> > To: Linus Walleij <linusw@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-sunxi@lists.linux.dev
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-gpio@vger.kernel.org
> >
> > Changes in v2:
> > - Dropped the previous faulty solution which was forcing the axp313 to
> >   use r_pio as interrupt controller as pointed out by Jernej Škrabec.
> > - Implemented suggestion from Andrey Skvortsov to return default
> >   direction as input
> > - Link to v1: https://lore.kernel.org/r/20260308-rc2-boot-hang-v1-0-d792d1a78dfd@mmpsystems.pl
> > ---
> >  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > index c990b6118172..e438cf35ff28 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > @@ -971,7 +971,7 @@ static int sunxi_pinctrl_gpio_get_direction(struct gpio_chip *chip,
> >
> >         func = sunxi_pinctrl_desc_find_function_by_pin_and_mux(pctl, pin, muxval);
> >         if (!func)
> > -               return -ENODEV;
> > +               return GPIO_LINE_DIRECTION_IN;
> >
> >         if (!strcmp(func->name, "gpio_out"))
> >                 return GPIO_LINE_DIRECTION_OUT;
> >
> > ---
> > base-commit: 4ae12d8bd9a830799db335ee661d6cbc6597f838
> > change-id: 20260308-rc2-boot-hang-269e8546635b
> >
> > Best regards,
> > --
> > Michal Piekos <michal.piekos@mmpsystems.pl>
> >
> >

