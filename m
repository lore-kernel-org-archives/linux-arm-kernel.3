Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9916EF013DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 08:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qDc+ENwbAbe68zpCCEGtW6OQg3kQWQQDNZqXFv5hQBU=; b=nKGMPO7qiGRUySbhdbWwEO0RzB
	7o7JK1B91plvcTAGWOOENN6ptjooGD2uDUDBxpyaoTaMigruSF55uHkdfz2bOXSAm1hLwLIJYuRbj
	zTxZhnhXVzpsYB3xa8ECUFQaIrOlz4ur+FjfbEA+rUayPJo+XGJ7yCKHfSoGF+/JrucW7MEvI+HS2
	Z4K/z4J4HxmVVt9MZ7yx18L/iAnvE026P/NvF0rFTpGXfekXZrGtl+bqmWlCOe7M2O1EHrXM3CsXI
	rhtyYhqCja3oh0vPC0xEx7ay9Sq8kBexaRSuFIV11eEOH9xtRALlPJ7NRjvNUG4xoVWXaoQCWXzTM
	u2BmYCDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23eV-00000003ZsM-2fPQ;
	Mon, 16 Mar 2026 08:50:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23eT-00000003ZsE-3ehI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 08:50:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4191F600AC
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 08:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB076C2BCB0
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 08:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773651017;
	bh=qDc+ENwbAbe68zpCCEGtW6OQg3kQWQQDNZqXFv5hQBU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pvwG5dNBkL+BXqZFzroKxvjkCKZkWm7bGKRM7T3kqfXSkW+vTGjfCxZUsRMiwmCil
	 X8F8+OHnFaQ1Yc3QUoZUo92GE4pe3Wjp4oFSImMjjhAbhmgN3eGPE0ITXS40JWlvUC
	 SVo+mgzN+ERmd23ZhDX6gCFDfHxHvWFqFxR/o8GDIOxugxVEceEL7F8xK9twCbWDgD
	 PdGHQ8MVAWjFRyedAU5O4K4N5i1NYSY6Ivb8wcelGjBFVbR5VJJihoA9g0ET/keaxU
	 Kpfw1SHUdyoTUe36uqzeayhuQyNfswyd8upP03P40BJyyvhFq1e391KcWdnvPBRlto
	 f9DvXe76k+ttw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a1282bc6aaso4645678e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 01:50:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW1ZaHiMNYDgF8F8wWgYCLDUIssvj1WoEZrQWB4Ko39GMGNsUh2KGVU6r9kb9m2fxQNxH/BnmUlaKj70OC9wU3c@lists.infradead.org
X-Gm-Message-State: AOJu0YzFxOITV1aCQj9wjTG+08FMQdoLsjhFEPRDQbCkxWXOp5Q+sw6h
	KB/sGeMARa8JgotMGjlkwtsredgAZ3/yGPSa//Yq4w5x0BNpdD2DuNGXw4MH30FQdxoYeUGh+Pt
	vVcSreLSmbIdxHXHg4mbq0OfUQucUQdpKAgGjQf58nw==
X-Received: by 2002:a05:6512:800c:10b0:59e:50e7:1260 with SMTP id
 2adb3069b0e04-5a16270ee83mr2968213e87.13.1773651015617; Mon, 16 Mar 2026
 01:50:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260212112508.73500-1-bartosz.golaszewski@oss.qualcomm.com>
 <2fb42d16-887a-4564-8e50-c9d6db564c4e@app.fastmail.com> <CAMRc=McYj-D8XL_wnmTEucMrwCy1-xr7h0XYrL68soMVHL1SRA@mail.gmail.com>
 <7h1phxpzml.fsf@baylibre.com>
In-Reply-To: <7h1phxpzml.fsf@baylibre.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 16 Mar 2026 09:50:04 +0100
X-Gmail-Original-Message-ID: <CAMRc=McosSU39SERKtjmhJdTv2cPi44PG=bYqAcfQLDX4QB0Tg@mail.gmail.com>
X-Gm-Features: AaiRm53z1DOvTtNKXCy1fIu4lbFzIVIPbz40ntl-1EmbNnUOhCRTC9Gz1o8LFWs
Message-ID: <CAMRc=McosSU39SERKtjmhJdTv2cPi44PG=bYqAcfQLDX4QB0Tg@mail.gmail.com>
Subject: Re: [RFT PATCH v3] ARM: omap1: enable real software node lookup of
 GPIOs on Nokia 770
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Arnd Bergmann <arnd@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Kevin Hilman <khilman@kernel.org>
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

On Fri, Mar 6, 2026 at 1:31=E2=80=AFAM Kevin Hilman <khilman@kernel.org> wr=
ote:
>
> Bartosz Golaszewski <brgl@kernel.org> writes:
>
> > On Thu, Feb 12, 2026 at 12:46=E2=80=AFPM Arnd Bergmann <arnd@kernel.org=
> wrote:
> >>
> >> On Thu, Feb 12, 2026, at 12:25, Bartosz Golaszewski wrote:
> >> > Currently the board file for Nokia 770 creates dummy software nodes =
not
> >> > attached in any way to the actual GPIO controller devices and uses t=
he
> >> > fact that GPIOLIB matching swnode's name to the GPIO chip's label du=
ring
> >> > software node lookup. This behavior is wrong and we want to remove i=
t.
> >> > To that end, we need to first convert all existing users to creating
> >> > actual fwnode links.
> >> >
> >> > Create real software nodes for GPIO controllers on OMAP16xx and
> >> > reference them from the software nodes in the nokia board file.
> >> >
> >> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm=
.com>
> >>
> >> Acked-by: Arnd Bergmann <arnd@arndb.de>
> >
> > Aaro, Janusz: Can you please pick it up for v7.1?
>
> I can take this via the OMAP tree once I have confirmation from
> Aaro/Janusz that they've tested.
>
> Kevin

Gentle ping.

Bart

