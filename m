Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F4AC3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 21:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bik8tiy9zD4tncn3V/spfXhSHei4QkySdXosKgPMaGo=; b=3JoYHzl7jWZpARde02l/KBrfZG
	eOrzoq0kDlACdyDh9zk9RMXcFNsrYKDDYLb5MZwP4qvaumeEV6xWIhWyvLFUPrlaJMut568ntxuru
	zu06w04aWAPfl/q8v5LfOcVONnD8CU1EYmVaylSkvlHqPNM0gg9LctFW/xc7MyGypMVxNauDVbjnX
	SkhTBaIQlSXR0Fcu08R8VhBoNT7Neje7s2KM7cRHu4CDZoglzPiidxZVP8U6jAnSDtLk2LRYaOcFu
	JAMPxrD6lhh9ZvTaptlMrQC89qiRKlEY3P2nqD29EDNpAGidEX+lc6axoqke4nLjJS2Yfu1SxE7o9
	JQ4u9R1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKO8h-0000000E84V-1Ani;
	Wed, 28 May 2025 21:16:43 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKO6X-0000000E7qQ-0jCe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 21:14:30 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-4e45ebe7ac1so62249137.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 14:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748466868; x=1749071668; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bik8tiy9zD4tncn3V/spfXhSHei4QkySdXosKgPMaGo=;
        b=cSrkLzQH3hMNYtka+QDV0Turm20WjG0kzMToxFg8X/deGdTNlw3MKy0woP/v49HtPk
         kQj/9FleO+/gdODsbco9R0ttiTK7E+wtx9X+bn2asy02BDVE46BGk+2yjTwgVJ2Tz2Eg
         ZDidumPpiiHXl0e4601VDD4clSJ+qJsON+zgDnT3duuJu9AIbMDx/QL2KeCXU/lQjv+L
         pyiAMm8c7sD0+49nxIiR47IOF8ogVBCtToD7fj2Ud4heUlIZ2drHGGqaZxN6t6ZNiYx/
         C49ZrENOMvHE8J7S6LhmbEpolWzS/lsFukWiJK7Ub38PASLnZYI0NftjcQDjHGGt9tLn
         Pw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748466868; x=1749071668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bik8tiy9zD4tncn3V/spfXhSHei4QkySdXosKgPMaGo=;
        b=mllUgVqrnLOmyQabng3nRryzqN+Gc2vqAfh9xfsDxD9YktxYFU5kznF+e3QkJaKRt2
         lQKve3Qz96jCpuImfZ30AIDzul5XIfgdD44LY1PyVvoOgl9apz/haxC2mb77dAUlWy58
         ygrdOi+7ayHLJQc/nA0Tkj9JiVaXizQtVAXItp7ZYG8/vlCMINWAjphUupRJFwsX1IBl
         f2JYnCYqgsdMo3fG1L4g2wYmcckYb5CC1zA+WglXvf88d0XRk/7Bryx8YQzb2gDLAmTN
         mxyNn98d81mnw1OansUGHAtfrlxwnznY2miXIr0Xoe8Zo6pOnUblpTKmWXauGohYAX3d
         Sg2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUO4bmKQ4Ewx7htXPQmW9nz7rURNzfZY6gPXCT+C+SeKQK4e+mJw/0/R/j+hD3KnmN34TG4PReSDlbVbCFNMfeE@lists.infradead.org
X-Gm-Message-State: AOJu0YxNUTdI47ht4JnsL6PgEwFI1uYSwhWgUoSnv084Hb64vgS6I6Xg
	ywKY/6LXOwwSyrHWZQb6+nV7MYkK8izCc0rFe8TqFZyWCXpELEw7PrFxvGMAr0+8afhdxFgHIrI
	lpX5avJYaTQCu8zMGYmZSLcNI8S59R2o=
X-Gm-Gg: ASbGnctPPGVGVmJhWKMkOOwlWsaSw+UlHI+zMGhYcCF2Y4OFqNenLprdyVaLCRU6cmq
	6CR5gatoc5YaiJBNiWU2F8bypnkGr03RtIh+75tmM+DIMdUBxbF89lnR+5BnQC+kdchwRtwiobb
	PS0qoi0XbLYUFkpW8pJ0x9yh5KlT0tTrm2+g==
X-Google-Smtp-Source: AGHT+IGGLLvtEb730nnh7rC673oR16aeQY2nH92ZW4fGCX/YiQ4QwWrxJP/i3AUVjXlzBuIQT/Ux8cWPw7wSCO4tioo=
X-Received: by 2002:a05:6102:1612:b0:4e5:958d:4962 with SMTP id
 ada2fe7eead31-4e5958d5d03mr7448988137.2.1748466867876; Wed, 28 May 2025
 14:14:27 -0700 (PDT)
MIME-Version: 1.0
References: <CADvTj4oVj-38ohw7Na9rkXLTGEEFkLv=4S40GPvHM5eZnN7KyA@mail.gmail.com>
 <aDbA5l5iXNntTN6n@shell.armlinux.org.uk> <CADvTj4qP_enKCG-xpNG44ddMOJj42c+yiuMjV_N9LPJPMJqyOg@mail.gmail.com>
 <f915a0ca-35c9-4a95-8274-8215a9a3e8f5@lunn.ch> <CAGb2v66PEA4OJxs2rHrYFAxx8bw4zab7TUXQr+DM-+ERBO-UyQ@mail.gmail.com>
 <CADvTj4qyRRCSnvvYHLvTq73P0YOjqZ=Z7kyjPMm206ezMePTpQ@mail.gmail.com>
 <aDdXRPD2NpiZMsfZ@shell.armlinux.org.uk> <CADvTj4pKsAYsm6pm0sgZgQ+AxriXH5_DLmF30g8rFd0FewGG6w@mail.gmail.com>
 <8306dac8-3a0e-4e79-938a-10e9ee38e325@lunn.ch> <CADvTj4rWvEaFyOm2HdNonASE4y1qoPoNgP_9n_ZbLCqAo1gGYw@mail.gmail.com>
 <1e6e4a44-9d2b-4af4-8635-150ccc410c22@lunn.ch>
In-Reply-To: <1e6e4a44-9d2b-4af4-8635-150ccc410c22@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 28 May 2025 15:14:16 -0600
X-Gm-Features: AX0GCFtJbKcSZrV6aI_DEhodkWvBg_0kUSxJMObTitKRlUNU-S1IGzUWOHTLoqc
Message-ID: <CADvTj4r1VvjiK4tj3tiHYVJtLDWtMSJ3GFQgYyteTnLGsQQ2Eg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] net: stmmac: allow drivers to explicitly select
 PHY device
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, wens@csie.org, netdev@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Furong Xu <0x1207@gmail.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_141429_213740_1989B7A1 
X-CRM114-Status: GOOD (  25.64  )
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

On Wed, May 28, 2025 at 3:05=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Wed, May 28, 2025 at 01:45:40PM -0600, James Hilliard wrote:
> > On Wed, May 28, 2025 at 1:27=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wr=
ote:
> > >
> > > > I think a lot of ethernet drivers use phy_find_first() for phy scan=
ning
> > > > as well so it's not limited to just stmmac AFAIU.
> > >
> > > You need to differentiate by time. It has become a lot less used in
> > > the last decade. DT describes the PHY, so there is no need to hunt
> > > around for it. The only real use case now a days is USB dongles, whic=
h
> > > don't have DT, and maybe PCIe devices without ACPI support.
> >
> > I mean, hardware probing features for this sort of use case have been
> > getting added outside the network subsystem so I'm not sure what the
> > issue with this is as those use cases don't appear to be meaningfully
> > different.
> >
> > > I suggest you give up pushing this. You have two Maintainers saying n=
o
> > > to this, so it is very unlikely you are going to succeed.
> >
> > So what should I be doing instead?
>
> Describe the one PHY which actually exists in device tree for the
> board, and point to it using phy-handle. No runtime detection, just
> correctly describe the hardware.

But the boards randomly contain SoC's with different PHY's so we
have to support both variants.

> Do you have examples of boards where the SoC variant changed during
> the boards production life?

Yes, the boards I'm working for example, but this is likely an issue for
other boards as well(vendor BSP auto detects PHY variants):
https://www.zeusbtc.com/ASIC-Miner-Repair/Parts-Tools-Details.asp?ID=3D1139

