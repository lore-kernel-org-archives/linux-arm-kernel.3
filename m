Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCCDC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 17:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/gMVsSx3VDJCjM0/V6JS1Ju4gdqnvsZW/tG6WKrnPP0=; b=klgiKYJ5cgsCrezUrSEsNPDjfz
	O/4UXm2xEdAbQfbNKi5GoudK0/xifNUf2tU48lpUp4kSSupHupMNdXLfpRaByhrF9Ev7hTQ2dMoyp
	xWVtWkSkKXGdSQyLKJ8zl6PdaRwXyA4BrTRZnYGEgtCA9582lnj/NmkXRzzftkvSP2Cj88bNQgNEj
	V5HdGTK3oLhaLjqcfs9lzROzEwXkX5BFFbLM1n6ztUmeu27ZI4NdtYzPxjEHM5VbJTeHti5U0DSwC
	iA3rU8xW1GbCisgfUT885KqusAnN5xYOzvjSaJ1F+UE7enZqmjyOK30pV/V6i0YLvnqIRdp4O92Ce
	peZvxb8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXkNm-0000000F7En-0iCd;
	Fri, 04 Jul 2025 17:39:30 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXkKh-0000000F6VG-3o7a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 17:36:21 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ae3ec622d2fso195171966b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Jul 2025 10:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1751650578; x=1752255378; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/gMVsSx3VDJCjM0/V6JS1Ju4gdqnvsZW/tG6WKrnPP0=;
        b=rm4DQThnFOwajYKj6uQtawYdwibou+jmzEFmmk56KU/dOqW10WKIqFQtKtm1ebeR4u
         VhVLS/eBwH59vn+3oiyXfItPg0UKeOld0bzygEDBT4LRxg6n0a3yLp+XuYp+X+1jojaP
         tAk6VCyuTjr+wjLxBN5rG3Mj4ev1du/kmM4CSicvB5WC+gTRvIkMdn9IY/skviUTuthG
         jEBxhhWuUUHLm/1XrCY2QoXX6n7bNN1pCLhno4EpMUn7yXKGABzdb5siVzJmKsydftpP
         4q2gOXYnRIz0qaj1pSGFcNZf/B/sptK2EHLv7cS+P/s3SI0Wfxecn3ZAP/sSyVNMuqIp
         p12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751650578; x=1752255378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/gMVsSx3VDJCjM0/V6JS1Ju4gdqnvsZW/tG6WKrnPP0=;
        b=ZQ3mtsCYXwmQ7BWrQqLw0+hZR7VVrtNQNOxN6+VJdcXTvhRZ2zy582AQNdH2Fthqlz
         3k2bRL5NJLLiwEBbuo/y7nK8SJaa73gs/i6ytvb5pXMf8Er7x6sfqTWELt5QKQ1F+meY
         E39BZw29Qo6i0jLYXRsJ31DqpSH6f7tbE3rpq52TXgTDo9REruUSAQPhXb4PdkzNmFam
         Wm91+NWe3O3fh0rkkwi28fWIreHvLdGEdJG0Fsa7c6r20H4Fe8t129bAS80QXvQCvoOc
         TSol+2YBIRib+/X7KPaVGwYGp4dlL1JLdhDI/O7GWX5auO4TGmk21q0Fa/Qb2jgT+rLk
         lXew==
X-Forwarded-Encrypted: i=1; AJvYcCVDjPzCWRVGQDgUN/MdYlqMdhnJ5bYMsNMoGSynLdminxplFs1Y0qIqrFgHEbgf/2CPSqBpFjdXjBzrzqS/m8q4@lists.infradead.org
X-Gm-Message-State: AOJu0YxjKmdjnzVzhSFmJ6pJjANuhdDmBoB4yOKZMMPWPsU3+WM0OlhU
	Yglr14fd00AxnOCrXUktmlnfR2/CPhMaenVTstvzcRo6snYQZbbAd7nDXpFhqUWI+TgVyXqy6e9
	kbUOJumQDpK8PJ3ixWlHfIHZzcIcx6QTuHsEonLq6eA==
X-Gm-Gg: ASbGncvQZt/5ObMaqJ1Onz6LAMiZAtjrZP9BVcpog+TF3Rc7rCjjhLvCLqUfN07K7vr
	ctGeQ951pPe0EfAlJtSJc8hXnelmIoanuw8KwMOCoYQivc7sx8OaXeMO8YPOE1x2brx+G/4Y5Ag
	vrV3gmt7JzIqmt3JkWQR7cKg7cwIXeSyjz03KQpQ1I9dN9
X-Google-Smtp-Source: AGHT+IHeJ1Z6kLI9F18nPlTXJDs+kXmK3fscjH5F6AOkcbqCoHLdbo6tfPeiaHhkgOp4rTxkpu1/up/L9rb3ERUcPTE=
X-Received: by 2002:a17:907:9629:b0:ae0:628a:5093 with SMTP id
 a640c23a62f3a-ae3fe4581b0mr339627066b.3.1751650577806; Fri, 04 Jul 2025
 10:36:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250702183856.1727275-1-robert.marko@sartura.hr>
 <20250702183856.1727275-2-robert.marko@sartura.hr> <ea353170-6e03-4231-afc2-3dc45253931d@app.fastmail.com>
 <CA+HBbNHxiU5+xVJTyPQFuCJLyEs5_MpybSBEgxi25bzaGfiVHA@mail.gmail.com> <421d61db-27eb-4ad2-bd98-eb187fd14b1e@microchip.com>
In-Reply-To: <421d61db-27eb-4ad2-bd98-eb187fd14b1e@microchip.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Fri, 4 Jul 2025 19:36:06 +0200
X-Gm-Features: Ac12FXwPCk_M7U49drkBOHMtvL2YaDYQKpMa88sHXtdMqEAGjR9SQcLiyG85r7Q
Message-ID: <CA+HBbNEiKWS71jtF_jqV9bdX9HVroaZSGMaeD-xFM8sm0kLtCw@mail.gmail.com>
Subject: Re: [PATCH v8 01/10] arm64: Add config for Microchip SoC platforms
To: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Russell King <linux@armlinux.org.uk>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S . Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-serial@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>, 
	Daniel Machon <daniel.machon@microchip.com>, luka.perkov@sartura.hr, 
	Conor Dooley <Conor.Dooley@microchip.com>, 
	Lars Povlsen - M31675 <Lars.Povlsen@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_103619_953720_13EC4E10 
X-CRM114-Status: GOOD (  32.62  )
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

On Thu, Jul 3, 2025 at 3:56=E2=80=AFPM Nicolas Ferre
<nicolas.ferre@microchip.com> wrote:
>
> Robert, Arnd,
>
> On 03/07/2025 at 14:25, Robert Marko wrote:
> > On Wed, Jul 2, 2025 at 9:57=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> =
wrote:
> >>
> >> On Wed, Jul 2, 2025, at 20:35, Robert Marko wrote:
> >>> Currently, Microchip SparX-5 SoC is supported and it has its own symb=
ol.
> >>>
> >>> However, this means that new Microchip platforms that share drivers n=
eed
> >>> to constantly keep updating depends on various drivers.
> >>>
> >>> So, to try and reduce this lets add ARCH_MICROCHIP symbol that driver=
s
> >>> could instead depend on.
> >>
> >> Thanks for updating the series to my suggestion!
> >>
> >>> @@ -174,6 +160,27 @@ config ARCH_MESON
> >>>          This enables support for the arm64 based Amlogic SoCs
> >>>          such as the s905, S905X/D, S912, A113X/D or S905X/D2
> >>>
> >>> +menuconfig ARCH_MICROCHIP
> >>> +     bool "Microchip SoC support"
> >>> +
> >>> +if ARCH_MICROCHIP
> >>> +
> >>> +config ARCH_SPARX5
> >>> +     bool "Microchip Sparx5 SoC family"
> >>
> >> This part is the one bit I'm not sure about: The user-visible
> >> arm64 CONFIG_ARCH_* symbols are usually a little higher-level,
> >> so I don't think we want both ARCH_MICROCHIP /and/ ARCH_SPARX5
> >> here, or more generally speaking any of the nested ARCH_*
> >> symbols.
>
> Well, having a look at arch/arm64/Kconfig.platforms, I like how NXP is
> organized.
>
> SPARX5, LAN969x or other MPU platforms, even if they share some common
> IPs, are fairly different in terms of internal architecture or feature se=
t.
> So, to me, different ARCH_SPARX5, ARCH_LAN969X (as Robert proposed) or
> future ones make a lot sense.
> It will help in selecting not only different device drivers but
> different PM architectures, cores or TrustZone implementation...
>
> >> This version of your patch is going to be slightly annoying
> >> to existing sparx5 users because updating an old .config
> >> breaks when ARCH_MICROCHIP is not enabled.
>
> Oh, yeah, indeed. Even if I find Robert's proposal ideal.
>
> Alexandre, Lars, can you evaluate this level of annoyance?
>
> >> The two options that I would prefer here are
> >>
> >> a) make ARCH_SPARX5 a hidden symbol in order to keep the
> >>     series bisectable, remove it entirely once all references
> >>     are moved over to ARCH_MICROCHIP
> >>
> >> b) Make ARCH_MICROCHIP a hidden symbol that is selected by
> >>     ARCH_SPARX5 but keep the menu unchanged.
> >
> > Hi Arnd,
> > Ok, I see the issue, and I would prefer to go with option b and do
> > what I did for
> > AT91 with the hidden ARCH_MICROCHIP symbol to avoid breaking current co=
nfigs.
>
> Yep, but at the cost of multiple entries for Microchip arm64 SoCs at the
> "Platform selection" menu level. Nuvoton or Cavium have this already, so
> it's probably fine.

Yes, this is why I went with a menu instead, to me it is much cleaner.

So, how would you guys want me to proceed?

a) Keep the menu-based config symbol
or
b) Like for AT91, add a hidden symbol and keep the individual SoC-s in
the top level
platform menu?

Regards,
Robert

>
> >> Let's see what the sparx5 and at91 maintainers think about
> >> these options.
> >
> > Sounds good, let's give them some time before I respin this series.
>
> Thanks to both of you. Best regards,
>    Nicolas



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

