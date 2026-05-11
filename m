Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E92CD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 19:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AkyUvnDjUVwu0ehRW6YmoRYu0TitM06XZpADJOqlSXU=; b=1m0oeqKuty3wE/X0e0dPJG/K14
	k9paRXOu9lN80Yvw1AhyNU/PBLmUdFFty6WcsNygN3VvbD2gm4yBYDcfkxHvYNCyUYC5LO5lw7BfS
	MpYmPkmhHylvx1zideojRnR+hzfmQeLVfEyB1Zl4ceFwqrh2UFcJ+ZluVTi7qexwRC2c0chlT8yIy
	EEpTK/1fOnUpJSj1s0iON8lnNkeKJWSIUPko3II1f1Bj41glpPwYzedV/GCj+cuYec68StZH6V8aZ
	xioAqJx6HiKGDhwqakId5webNB5loN57Q0lXPTOg+v35APgOA+BIG75secY76+06x1Qq8eUE0S58u
	z371LTqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMWhE-0000000Ee5p-2iFR;
	Mon, 11 May 2026 19:53:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMWhD-0000000Ee5g-0esx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 19:53:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4BAD4600CB
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 19:53:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 035F4C2BCF5
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 19:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778529222;
	bh=AkyUvnDjUVwu0ehRW6YmoRYu0TitM06XZpADJOqlSXU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ebK0SbdoeyfR8i+AKZ1orwOpeeUa/0ktlqwZuyn0JIKckqxY3tHcBPUayt7y/ERgj
	 Os/+OeUctXXEinBjq8JU5XI/1+lXlERdSWl1yY6mFVXLWosajJlxrCbpq8/MUQkxc1
	 hcb1hAWy4EsD1FvpGHKGhL4LfxCYbRGAGpqdCIUTXbfpq2BFYbuAD8u/RH1e9NzUqs
	 bzzmbQgy68ogiQHQ5HthzAtvYIxXyH7gkEKLTW+AKQ5uo1qmjKfs0RG/JHzn5Uvety
	 lF7+aQ+77naX4458yYO1vrHSi61QKgqV0Tv+qhgNekXRBpGuQLMZkLlRdtF8Kx9BcE
	 g33mbGgyBQUmw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-393da8f389bso47347591fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 12:53:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+P6KLr141msHrIFzpvUsUydHL/rGlGcsrtiy4mnun8/8P7UKkobqNECXvG7U+PqZwDorvZ4kA6niYs9RBS1l0Q@lists.infradead.org
X-Gm-Message-State: AOJu0YzpeelIR2Ggew0GQ8EwqmKBoG+GhHR1VKRJAT2pMZZJ5gmoOtBL
	wT17gYVo7cXcpZb8Xu4MpvhmMXzsAH776Ssj3JDzfyglYZv1Y45G/zZE2JjxnHa53aFtKUKlKR8
	b+uWJTbdnW/56rEvIZtmZM3zDFYkd9Vo=
X-Received: by 2002:a05:6512:3b0a:b0:5a8:7426:d2da with SMTP id
 2adb3069b0e04-5a8b6c9d811mr2796256e87.7.1778529220732; Mon, 11 May 2026
 12:53:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260430-pxa-gpio-swnodes-v3-0-5142e95f0eca@oss.qualcomm.com> <CAMRc=Md7EdfvNV+6NRZK0UkNXcYp3uR4N4buKH6NeKKg_rnt-w@mail.gmail.com>
In-Reply-To: <CAMRc=Md7EdfvNV+6NRZK0UkNXcYp3uR4N4buKH6NeKKg_rnt-w@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 21:53:28 +0200
X-Gmail-Original-Message-ID: <CAD++jLm7isu5+u_8cmqT1=5SMgvsKkRBfAdZ+hFs8Pdm2WPEiw@mail.gmail.com>
X-Gm-Features: AVHnY4LW8hc_unMh3VlBSde9ZhxvMHSUjSnWnKej4EvTdQ41plIOD2OZGQsN3tA
Message-ID: <CAD++jLm7isu5+u_8cmqT1=5SMgvsKkRBfAdZ+hFs8Pdm2WPEiw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] ARM: pxa: attach software nodes to the GPIO controllers
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Russell King <linux@armlinux.org.uk>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Mon, May 11, 2026 at 3:35=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
> On Thu, Apr 30, 2026 at 2:57=E2=80=AFPM Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
> >
> > Convert GPIO controllers and their consumers on the PXA platform to usi=
ng
> > "attached" software nodes. Since everything happens in a bord-file, it'=
s
> > quite straightforward. We technically now have a way of passing an
> > unregistered software node to platform_device_register_full() but that
> > requires using struct platform_device_info and since the existing
> > platform devices are either referenced from other places or defined in =
a
> > different compilation unit, I wanted to reduce the impact of the change=
s
> > I can't test and went with the older method.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> > ---
>
> If there are no other comments, can this be queued for v7.2?

Are you planning to queue it in the GPIO tree? (I would.)

Otherwise just send a pull request to the SoC tree, I would not
expect the PXA maintainers to be very active and stacking patches
and sending pull requests. But they might surprise me!

Yours,
Linus Walleij

