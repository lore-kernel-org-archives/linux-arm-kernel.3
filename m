Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3CFF013DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 09:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Kj6KaTiG6K7MY+1dcRvFaqJzmKJxA3AYqomqQxKYJc=; b=AuWBq4UkDjNm+Ltybyz0vtFFDl
	rcF9XP7pHFZ5dV7tiSjytyhOvW3GdInSLjB7RM4V4QWbbHzm4BPHhNLlTMqlIpZaYuXOOr6dCkRl6
	12QBX1fAscpRWfzoqjh/5sWjqqZ5ic/wF+fM1lCTKV6wFtY5MkrPWidu6KOJ0Qn7aXtRSVY86WODi
	d4IS828KkltB0Mg+VIWU7YXeyQ23bWBtU/TphM/yP2lDZ1u52vqfOP13yLSX4LWsRJW4j5oIMP7u0
	zNDJFk3y7MVmWv33DJJDqo8iHkKAh4n8IGFWddhZ6jTqtIfszK6+b7X932ICgBQSXQckMuvgIe/FE
	M/DsYb2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23nq-00000003am8-32o7;
	Mon, 16 Mar 2026 08:59:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23no-00000003alc-0jwg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 08:59:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B46143958
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 08:59:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFDFDC2BCAF
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 08:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773651595;
	bh=XGYPbAKoOAYk8j1GmSPwvsVkBF2sd4JzgK3hjvlcvfk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=efO9pO3PeLZEhQR9rAR3KX3SRHP7OX0NFJ/X/MXNHkySNRMCSFveqGYbvNqENsNiD
	 JtsXZeoDkeQFdYmWd046yi+dFzC8qi7JoJxfLU9aPNfyCUepBGfod1q5TE5IkLNH+h
	 9wBKZIkf8F+IqoYPrm06eQmorNWU25+2fnxUVNiq74U+Mi+RhR4ytMfN/rilSsmGv1
	 1I+2qANbjEhcPkTkzxHqwUJnVTVmnBrV2auqoG9HlrJVQCPVy/zsPtCEquWKqe7uRC
	 A/lW0HGJC5ngmr7XfMHo3N0FpFJGwQ2Vx6780S4AtTrLiKWTLEVgY/coVohvSBrW8S
	 ChpjwYz+ellqg==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7927261a3acso33778787b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 01:59:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVFggiyClL8ah++RdzpH2pOjtCjs3wr+0dDhscfcfZ5tmFUcl6OH1IqZ1fKUABYMbifk3VYeuiQ+vkgQ4eX5gIl@lists.infradead.org
X-Gm-Message-State: AOJu0YwRXjH01HeBTRlHqJ1SLSOgFAMsTKr30/Zpu0qJ45riCkS3PP1d
	wqYKTjJ2sCTuadk42T0vZjqq4Gb7BCoc8RFPp+G4HAyDzHMWPGX86WsjH9iJ/r9JMWnREpjHCFP
	RmumAgSWic44Fxoiu1WAHgDfqwZy/Wxg=
X-Received: by 2002:a05:690c:c50d:b0:79a:56bc:245e with SMTP id
 00721157ae682-79a56bc2985mr8612647b3.47.1773651594351; Mon, 16 Mar 2026
 01:59:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260313000652.11470-1-andre.przywara@arm.com>
In-Reply-To: <20260313000652.11470-1-andre.przywara@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Mar 2026 09:59:43 +0100
X-Gmail-Original-Message-ID: <CAD++jLn4ajnpayksmACb4FnVk3w0wWjAM9v1-38t=u7CO_635g@mail.gmail.com>
X-Gm-Features: AaiRm53PU0xHt5zB-ZEU9Kf0xC08hXJHn1dpSbPL24Ikh8j0snhsU4LhqVRGjAY
Message-ID: <CAD++jLn4ajnpayksmACb4FnVk3w0wWjAM9v1-38t=u7CO_635g@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: sunxi: convert to GPIO_GENERIC
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_015956_255033_38F5D576 
X-CRM114-Status: GOOD (  24.21  )
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

On Fri, Mar 13, 2026 at 1:08=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:

> Allwinner SoCs combine pinmuxing and GPIO control in one device/MMIO
> register frame. So far we were instantiating one GPIO chip per pinctrl
> device, which covers multiple banks of up to 32 GPIO pins per bank. The
> GPIO numbers were set to match the absolute pin numbers, even across the
> typically two instances of the pinctrl device.
>
> Convert the GPIO part of the sunxi pinctrl over to use the gpio_generic
> framework. This alone allows to remove some sunxi specific code, which
> is replaced with the existing generic code. This will become even more
> useful with the upcoming A733 support, which adds set and clear
> registers for the output.
> As a side effect this also changes the GPIO device and number
> allocation: Each bank is now represented by its own gpio_chip, with only
> as many pins as there are actually implemented. The numbering is left up
> to the kernel (.base =3D -1).
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

You could add that this makes the driver benefit of the
.get/set_multiple() accelerated implementations of the generic
GPIO MMIO driver as well.

> +static int sunxi_gpio_add_bank(struct sunxi_pinctrl *pctl, int index)
> +{
> +       char bank_name =3D 'A' + index + pctl->desc->pin_base / PINS_PER_=
BANK;
> +       struct sunxi_gpio_bank *bank =3D &pctl->banks[index];
> +       struct gpio_generic_chip_config config;
> +       struct gpio_chip *gc =3D &bank->chip.gc;
> +       int ngpio, ret;
> +
> +       ngpio =3D sunxi_num_pins_of_bank(pctl, index);
> +       bank->pctl =3D pctl;
> +       bank->base =3D pctl->membase + index * pctl->bank_mem_size;
> +       if (!ngpio) {
> +               gc->owner =3D THIS_MODULE;
> +               gc->ngpio =3D 0;
> +               gc->base =3D -1;
> +               gc->of_gpio_n_cells =3D 3;
> +
> +               return 0;
> +       }

Add some comment about what is going on here, I suspect you
are flagging the gpio_chip as unused, you could just not assign
anything I think?

> +       config =3D (struct gpio_generic_chip_config) {
> +               .dev =3D pctl->dev,
> +               .sz =3D 4,
> +               .dat =3D bank->base + DATA_REGS_OFFSET,
> +               .set =3D bank->base + DATA_REGS_OFFSET,
> +               .clr =3D NULL,
> +               .flags =3D GPIO_GENERIC_READ_OUTPUT_REG_SET |
> +                        GPIO_GENERIC_PINCTRL_BACKEND,
> +       };
> +
> +       ret =3D gpio_generic_chip_init(&bank->chip, &config);
> +       if (ret)
> +               return dev_err_probe(pctl->dev, ret,
> +                                    "failed to init generic gpio chip\n"=
);
> +
> +       gc->owner               =3D THIS_MODULE;
> +       gc->label               =3D devm_kasprintf(pctl->dev, GFP_KERNEL,
> +                                                "%s-P%c", gc->label,
> +                                                bank_name);
> +       gc->ngpio               =3D ngpio;
> +       gc->base                =3D -1;
> +       gc->of_gpio_n_cells     =3D 3;

Nice use of the three-cell GPIO OF parser!

Overall this is a nice change and makes the kernel a
better place. I would apply a non-RFC version as soon
as we can agree on the path forward.

Yours,
Linus Walleij

