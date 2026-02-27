Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65BEFD530F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 08:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w6O5P+/WZGj/+UJkAR8wKgzn2155NTIp0uzmc4rKIko=; b=OM4rMJI9ILs8EruS9Yz/15b5Wq
	Cwt622yuh+aVq7KBPXWhum3VKVmwpU8kWsEF9NtL3xci2wRdOo9oa5e083pf6uzw5CvjD+XwqC8u3
	4Gtm6HdvK9XFJVN3R7LqeY7QBTy0OWEzLLatviDwnS8b2HhHOup/e/Ph9SwibRyJ4cFRiwUPZB/xE
	aZJxU11g8sFzGKg9PA1Xpu1m7FUQGZ38vtNfqs3yzsaT2UA3ievss5ULxiO8w5njZs85JbhEwmgvi
	24Kp88BF4QWeAf8g62ozEHXy/XGGY2IfqoMu5bB6UW8QozJRLcrp3ZcjS/GWrh11zWnsxObfYxjWV
	7PjXUhgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvtQn-000000081La-3kiD;
	Fri, 27 Feb 2026 08:42:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvtQl-000000081LB-41E7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 08:42:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 845E544213
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 08:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64124C19421
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 08:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772181759;
	bh=YS8vRNrNUDZeuSyEYs/l5jTta2fO/m83BrqrTrPFlbM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IX7yyJNplmb90D+OhPrVMRRrukovlrwO3aUoOeSSSoy4v2RuYXwu0XVqkxuOi614A
	 MJ0lrkIUA6vC4Zwsc5AHJTZb0ghnmO88ajBga3jJoXMDPLQIqkN3v4kWq5XntlFUtb
	 3l/ZnSqkT9bPeWDEGYSMBbzmXHxgDOCIgknp7PBWXZHgAH9XOLEx8M53QxaGp99GAl
	 qE3kOtXTaJ/L+axefLwtRHWhCrWXJHO1KKchn8lCYmdZxWbqTjmisHDT74dDBoY7Ed
	 ru5LPmG+BkJY6lKYvzIRNSY0hmY4DvqmXFsI7+uRScDCdT6H6o8fT4IbXJcHwQjbW4
	 f1V35HeJaNaaw==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-389ee8efedeso17941681fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 00:42:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWHMkuvTkzNmctC3gZcXWWEBwDkdluBgJTEnUaeTpvtM7u8dJe3gxQtquZNc13Xoo/jmE58DoKqh3nzs8ymT0ve@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt1wTYJMI3gxLZk5HUVtRLZz/oApe9elwHfGNhO8B9TleyfZQb
	5woSnLuISXJ73WsYa26QSZvfnfOIxpOt10VHW7CIOU7ALVzNZRbHttlzBth4dKkHb9IQ8WpCdwh
	v7CEK8PhNmz9rxTEP90kdWP3xPlF7sMDGoJA6Bgt5ZQ==
X-Received: by 2002:a05:651c:b0f:b0:386:e8fe:8997 with SMTP id
 38308e7fff4ca-389ff363982mr12562701fa.36.1772181758009; Fri, 27 Feb 2026
 00:42:38 -0800 (PST)
MIME-Version: 1.0
References: <20260226143615.65788-1-bartosz.golaszewski@oss.qualcomm.com> <84da053d-97d5-4d07-8e76-b162a5b23d2a@kernel.org>
In-Reply-To: <84da053d-97d5-4d07-8e76-b162a5b23d2a@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 27 Feb 2026 09:42:26 +0100
X-Gmail-Original-Message-ID: <CAMRc=MehMLoBL573cWjQNN2eCiTCyqCv1xwVKqfkZ5isBhBUaA@mail.gmail.com>
X-Gm-Features: AaiRm53VRMnn23FTqqQfiZ2r_DNjjL3bvfUfiRQffEPNZqs6xrcDtGkcRmLi1qE
Message-ID: <CAMRc=MehMLoBL573cWjQNN2eCiTCyqCv1xwVKqfkZ5isBhBUaA@mail.gmail.com>
Subject: Re: [PATCH] arm64: Kconfig: provide a top-level switch for Microchip platforms
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Conor Dooley <conor@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_004240_043460_CB44CDC2 
X-CRM114-Status: GOOD (  23.67  )
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

On Thu, Feb 26, 2026 at 3:49=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 26/02/2026 15:36, Bartosz Golaszewski wrote:
> > Microchip is the only platform that doesn't have a top-level switch for
> > disabling all SoC families. Align it with other platforms and update th=
e
> > arm64 defconfig to keep the default config the same.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> > ---
> >  arch/arm64/Kconfig.platforms | 10 ++++------
> >  arch/arm64/configs/defconfig |  1 +
> >  2 files changed, 5 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platform=
s
> > index 54eb1d7fd419b..72c812e76b0b1 100644
> > --- a/arch/arm64/Kconfig.platforms
> > +++ b/arch/arm64/Kconfig.platforms
> > @@ -188,16 +188,15 @@ config ARCH_MESON
> >         This enables support for the arm64 based Amlogic SoCs
> >         such as the s905, S905X/D, S912, A113X/D or S905X/D2
> >
> > -menu "Microchip SoC support"
> > +menuconfig ARCH_MICROCHIP
> > +     bool "Microchip SoC support"
> >
> > -config ARCH_MICROCHIP
> > -     bool
> > +if ARCH_MICROCHIP
>
> This will surprise all out-of-tree non-defconfig users, because their
> boards will stop working (drivers depend on ARCH_LAN969X|ARCH_SPARX5
> which will be now disabled), but I like the consistency.
>

I'm not following, ARCH_SPARX5 remains enabled in defconfig and
ARCH_LAN969X was already disabled by default.

> I guess this will go via Microchip arm64 soc tree.
>

I think this should be picked up directly into the ARM SoC tree to
avoid conflicts later into the cycle.

Bartosz

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> Best regards,
> Krzysztof

