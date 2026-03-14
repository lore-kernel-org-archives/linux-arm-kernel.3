Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CA2105F79E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 08:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zs5ayvvkI5PTSLsGJL88a7+jQEKfQg3DX6WpRBk/6/0=; b=o8d1TDFRJqiwuw
	WUb15i3outiOUnMd5yhvVe8woXbisSLZCgrQsbKyYR2yI4YniaqwdN/uF5if9MhQJDp/9SKWvsENq
	Oy7HaHqY/t8oEGzHo3HunNt5qhO2wx9qHFvsqW9Uc3JHvsgOMoThE2ri9engYazYACKPgNocnhIeS
	66Tmfv6Wws7Q+4/9le+JLqmtYNzuiDQZzkUSheFpK5dPoSAaWxL3Ac/VZj6Xk+b53mu8+NvKGA47y
	MZH688RHtogbI2UfvVuH8Bx5S2Yq7jtGtUDkoSm1LyGJmvvgIhZuNdAEQF8aBVCFY1sKyjrMpeyru
	/Rg9D1T3OUgDWuiAkTVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1KWP-00000001dmu-3qvH;
	Sat, 14 Mar 2026 08:38:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1KWO-00000001dmO-2PvF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 08:38:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A69B16132E
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 08:38:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48FE0C2BCAF
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 08:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773477505;
	bh=zs5ayvvkI5PTSLsGJL88a7+jQEKfQg3DX6WpRBk/6/0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=UgnxNAc7tAQWYiHcp5jJ2xvCpg1e0jf5AX9GdeHFfrS7HciaU9D4E4aZHr5jxtImp
	 5nS0/gaBUxA61/0Rl8F1mT0OQnn39+zfnp62f4dBkEnF1KVtc7LRUpe9sF7VsMwXFc
	 7yPwYlfZF5EZFI9g9Ph8LAIzAeSqLQtnyXTpHdhzz8cpe+aEFsUU1ZGftbixTRW/LC
	 oj7xHRdpJe3v6Q94STrUW37Ms4HnajEPRwu++rcUCfMXufhoEbp4+pMR4B3jLeNUpI
	 3pBoOJcYjuL4//elETUStMUlUsWKl47BLIwu0uoc694FneDtPf/UAFIpGn9f9/56Hk
	 yAaefljBFFKsQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a159c1e65aso2912167e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 01:38:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWthbIVmQRji3LQDBm6+0EWaoif4yfYVZZK1sC/9h9iBs89mw4WUCNN6oyfHVbNqfnMoUs+1x8/DXadVUOZ/64o@lists.infradead.org
X-Gm-Message-State: AOJu0YzFOCRd7xyNKfYoVG0tOs5lX7pAP7TiLTHVDWB2vKWtJPRDXd6w
	C5THbcwHJZPvsgNA90mhA4Er/Z25Wpb3Nijuc9sqPBdQpcCex/3AA5QCEVjxo4jiUgSO+dnuLwD
	CQZG6oNjKEt2D6S+unXKJkJKgF52ZkZw=
X-Received: by 2002:ac2:54af:0:b0:5a1:27a8:be28 with SMTP id
 2adb3069b0e04-5a162af644cmr1432283e87.11.1773477503501; Sat, 14 Mar 2026
 01:38:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260313000652.11470-1-andre.przywara@arm.com> <a4cfb10e4701da0649ef648136496a962be5870d.camel@icenowy.me>
In-Reply-To: <a4cfb10e4701da0649ef648136496a962be5870d.camel@icenowy.me>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 14 Mar 2026 16:38:11 +0800
X-Gmail-Original-Message-ID: <CAGb2v65RD3ksSnEC0RjYYQ1J-NoP9gGfeTR1UCfLgKCJEFBSTQ@mail.gmail.com>
X-Gm-Features: AaiRm51E4965eeb0L_fn-2SZNoUKwdxVpJdCBkpbsBdc_UAFU6x4kPtBXXnJXuo
Message-ID: <CAGb2v65RD3ksSnEC0RjYYQ1J-NoP9gGfeTR1UCfLgKCJEFBSTQ@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: sunxi: convert to GPIO_GENERIC
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Andre Przywara <andre.przywara@arm.com>, Linus Walleij <linusw@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, Mar 14, 2026 at 1:14=E2=80=AFPM Icenowy Zheng <uwu@icenowy.me> wrot=
e:
>
> =E5=9C=A8 2026-03-13=E4=BA=94=E7=9A=84 01:06 +0100=EF=BC=8CAndre Przywara=
=E5=86=99=E9=81=93=EF=BC=9A
> > Allwinner SoCs combine pinmuxing and GPIO control in one device/MMIO
> > register frame. So far we were instantiating one GPIO chip per
> > pinctrl
> > device, which covers multiple banks of up to 32 GPIO pins per bank.
> > The
> > GPIO numbers were set to match the absolute pin numbers, even across
> > the
> > typically two instances of the pinctrl device.
> >
> > Convert the GPIO part of the sunxi pinctrl over to use the
> > gpio_generic
> > framework. This alone allows to remove some sunxi specific code,
> > which
> > is replaced with the existing generic code. This will become even
> > more
> > useful with the upcoming A733 support, which adds set and clear
> > registers for the output.
> > As a side effect this also changes the GPIO device and number
> > allocation: Each bank is now represented by its own gpio_chip, with
> > only
> > as many pins as there are actually implemented. The numbering is left
> > up
>
> Ah, is this a userspace API break?

Unfortunately, yes. This means the easily computable numbers that one can
use with the (deprecated) sysfs interface is gone, and also the pins are
now split amongst multiple gpiochip instances.

However if someone wanted the old "one gpiochip for one PIO instance with
evenly spaced banks" scheme, I suppose we could put together something
with the GPIO aggregator driver? It won't have same base pin number though.


ChenYu

