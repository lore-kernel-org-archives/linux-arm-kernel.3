Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56886CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 08:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YJBmBePAR5zxYZavdDNae1lt8A1fnyv8gTHT/WQkGDg=; b=fMVB455cAqUb0HGQtNCdCJ2hHN
	xpJ07q4nVdYb7kqcEDVBRfjeSMkmC/PItJN9XeMlEENYWOGoUwrgxVUro0sb7gRSjz6+OxQKxo+8j
	ZVe3ocUvPJ44jBU0D4Qw4zx9PETefjDJc2QMdRQLvcZphVIP0ltESe4T+kzHZy8MwhuflZXEy79w5
	6nGX1U/Lqf0Cr0zw895XiTX7i57PoAVS7EaA85tuZHuqIorlwFAtj6Wsprhz1nLxGl/p1YfTJLW5O
	ptwV1peHqy+C77JVtZqNbvepHnmK88Guy00EVmM+C9ZStpfggB7WsMs1KEVyyC98WTHfvdYyBhGyW
	FwLc7uCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPykx-000000078xp-079V;
	Thu, 21 May 2026 08:27:51 +0000
Received: from mail-vk1-f181.google.com ([209.85.221.181])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPykt-000000078uT-3FWD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 08:27:50 +0000
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-575eaa32c7cso1943537e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 01:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352066; x=1779956866;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJBmBePAR5zxYZavdDNae1lt8A1fnyv8gTHT/WQkGDg=;
        b=PkwTmDrx8UBEY2NaeALJHaXzs3egq6GNOpLmkLvyihGUGmeZhwOKn60t0tS7JyHnEt
         8cvEL+S/SFyifTMnzpBnARS6GhsSuYB0mYgTBx0QyQxRAL1+DC7nsGJTn9TM2rhBOzP2
         rjQvxwOKcJI1eGCY6Mo3DO1y6cPa/rUL9e4ldUlc5kqaQpSAvB1qUBZu1VUgd3pr58HU
         qiccoW3lhpQjzRiKkPiewVz9XrEqfNBK88P+HEhE9k14tfcCqpoSwn1n2CFy6/OuDriL
         v9TLgd+SluscrdGvx8ymfEZaMRmp1lmCOyGPh23GS2y+PrcQwyNCPdUVF4s2aky8F31M
         vMBQ==
X-Forwarded-Encrypted: i=1; AFNElJ+J+3AADwNixzhC88EA1heV6v46WgYaz4pg5u+EeChaVg0RB8LznMrWLqh5/2psh/iDDu6tO7mAASeEGDY5cUa8@lists.infradead.org
X-Gm-Message-State: AOJu0YwTfF6yXD52ZkdloFoVmJ+KdwpEAA4R/irYtnjvIOf7MiPEK/5R
	n062CEjDuZDiE26ipjZ3vlWmGUsQv9s6NUHCutTi+9Jh8Mr/Ndg5VgxBG+r9RO3zSp4=
X-Gm-Gg: Acq92OHFJZmhXzzlBm91XqhOCB6zgUEEsfO1zNMBGNn19HwPEWpjYva6SO6VzIqPLpM
	Yp06ajZjPc1QjGbS5xisA5JTKco6YVpCJ+8rTgPAOCXj48Oi+8hKZbl5U1i6G5+3PyX06oNlVdT
	EWEoeWO7+UdQxgVUvVAizDRp/J/FGb9nY+oNF+PMeXTgKRFqwKsw645cPmwRezGc9/RW768BvUg
	9DtwNO9FHXgGbNIJC6xki0vVlUdNyYF0o9zdcoh0WVytfuzdOTyvTGf1CS+xt2rYobfsnPsMSoz
	3QBS0K4VwD7kNBNhz2O6zuh4eLh+xw2XMVYWWA3q9/J2eUqt8BnVFWk0yHrsi3w7vnN/WLE9J2j
	OsCHFtISQ5pKXdzC6h375UvjPuFs1RSH1JMZiiHmAOgOZD2u8z0geNAtkuaF7P2swH4YSal70u2
	KRO9a0QNdLEfmKjAVAvV3Lguq4W9EjqKZoozx3XPdSQGwTnLmvo64EzvCBcf25Tqa2
X-Received: by 2002:a05:6122:4fa6:b0:56e:ded3:98eb with SMTP id 71dfb90a1353d-5842424f056mr675667e0c.6.1779352065988;
        Thu, 21 May 2026 01:27:45 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96163844d7bsm152708241.11.2026.05.21.01.27.44
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 01:27:45 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-575eaa32c7cso1943526e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 01:27:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ850ZN5dlWuarNVJd44fuVQDpie4FlQX89balmO7wESUoqwarUc4VRuOBBXM8YpyRvXBgITouIM4ll5tzNAcG3w@lists.infradead.org
X-Received: by 2002:a05:6122:1c10:b0:56e:f071:d4ef with SMTP id
 71dfb90a1353d-584257c283dmr596427e0c.8.1779352064209; Thu, 21 May 2026
 01:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
 <aekXUvIPb8nkhdKu@pluto> <CAMuHMdWJvMH+a1RqozbaCxxH_8M569JcruTFa8PW+87FysnjHw@mail.gmail.com>
 <ae6Zp54NhKlVes8J@pluto> <CAMuHMdWK3Noh5ZQVWT9C0EKyXZePMaJ97C0A_syK+xCb_=abeQ@mail.gmail.com>
 <agooKghZJw3iElvp@pluto> <CAMuHMdU8VRCOZtLrM2EoHFmhd5XFs8cwXc2A1tPTTr01KvUx0g@mail.gmail.com>
In-Reply-To: <CAMuHMdU8VRCOZtLrM2EoHFmhd5XFs8cwXc2A1tPTTr01KvUx0g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 May 2026 10:27:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUo9=J0hpNfVDfiFGoAqfC73QQxvMCYyahBTTbKT8_6VA@mail.gmail.com>
X-Gm-Features: AVHnY4IdjfB7BITVFZv-z-ao_K498dR56La7qQvqwgCb0qZYOOtkE_cpqTj8o-w
Message-ID: <CAMuHMdUo9=J0hpNfVDfiFGoAqfC73QQxvMCYyahBTTbKT8_6VA@mail.gmail.com>
Subject: Re: [PATCH/RFC 05/14] firmware: arm_scmi: Add scmi_get_base_info()
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_012748_907905_DC62CCAE 
X-CRM114-Status: GOOD (  61.01  )
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

On Thu, 21 May 2026 at 09:53, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Sun, 17 May 2026 at 22:42, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > On Fri, May 08, 2026 at 12:26:19PM +0200, Geert Uytterhoeven wrote:
> > > On Mon, 27 Apr 2026 at 01:03, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > > On Fri, Apr 24, 2026 at 02:08:55PM +0200, Geert Uytterhoeven wrote:
> > > > > On Wed, 22 Apr 2026 at 20:45, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > > > > Also because this should be one of the selling point of the SCMI stack
> > > > > > in a virtualized environment: you can ship the same kernel drivers with
> > > > > > the same DT and you know that ID=<N> will always identify the specific
> > > > > > resource that is needed by your driver without worrying about the fact
> > > > > > that in reality in the backstage the effectively managed physical resource
> > > > > > could be different across different platforms, because that does not matter
> > > > >
> > > > > This sounds strange to me, do I understand it correctly?
> > > > > So the ID should (1) be tied to the use-case, and not to the underlying
> > > > > hardware, and (2) be the same for different platforms?
> > > > >
> > > > > For (1): Then we must not put these IDs in DT at all, as DT is supposed
> > > > >     to describe the hardware (and firmware IDs in DT were IMHO already
> > > > >     a stretch before).
> > > > > For (2): How can there be a contiguous list of IDs, as not all platforms
> > > > >     may have the same underlying hardware?
> > > >
> > > > I would NOT say that an SCMI FW must behave like this regarding IDs, but it
> > > > is a possible SCMI deployed setup that can be useful in virtualized setups
> > > >
> > > > I mean, the DT describes the hardware of course BUT when you refer to
> > > > some of this hardware DT bits from some other subsystem by referencing a
> > > > phandle, even in the non-SCMI world, you are in fact selecting a specific
> > > > resource that fit you use case, right ? Can we say this ?
> > > > I mean you needed that specific clock or regulator that you described
> > > > previously so as to be able to enable some other piece of HW...
> > > >
> > > > Now, the SCMI provides an abstraction on top of this, since you really
> > > > discover domain IDs of a specific class (clocks/regulators etc) you are
> > > > in fact describing an HW abstraction that you then refer with the usual
> > > > phandle...also because there is NOT so much SCMI hardware to describe,
> > > > given that the HW is handled transparently (opaquely really :P) by the
> > > > driver on the FW side...
> > > >
> > > > ...you basically obtain such domain ID, usable as phandles through dynamic
> > > > SCMI enumeration so that you can use it all over your DT to make use of such
> > > > resources...
> > > >
> > > > ...on top of this, consider that the SCMI server CAN provide to its agents
> > > > a per-agent-view of the world, IOW it can (and should) expose to a specific
> > > > agent ONLY the resources needed by that agent, i.e. it can expose the set
> > > > of resources 1-N to two distinct agents and that does NOT mean that the
> > > > underlying physical resource mapped by ID=3 in both agents has to be
> > > > effectively the same piece of hardware: it could be the case, and this
> > > > would be useful to exposed and managed properly a shared resource, or
> > > > it could also be that the same ID=3 could refer to completely distinct
> > > > pieces of the same class of hardware...(same protocol same class of
> > > > resource...)
> > >
> > > Exposing only the clocks/reset/power domains the agent can use,
> > > in a contiguous list of IDS, means that the number space changes,
> > > depending on which resources are exposed.
> >
> > Yes, potentially, it depedns on how the HW/FW stack was designed I
> > suppose...
> >
> > > Suppose you have a system where you want to assign a specific hardware
> > > block in the SoC to the realtime CPU core instead of the application
> > > CPU core running Linux.
> >
> > Ok, so this is definitely a considerable change.
> >
> > > That means all resources used by that block must no longer be exposed
> > > to the Linux agent, and the corresponding IDs must be removed from
> > > the ID space exposed to Linux.  As the ID space must be sequential
> > > and contiguous, the IDs must be renumbered, impacting resources that
> > > are exposed to Linux.  As these IDs are used in the SoC .dtsi, they
> > > must be changed there, too, However, these IDs have become part of
> > > the stable DT ABI, and thus cannot be changed.
> >
> > Well, you have to ship a final DTB blob that is crafted to describe the
> > actual HW at the end, right ?
> >
> > I mean, in your example, it seems to me that you have changed considerably
> > the HW surface by moving a clock (and its related resources) away from the
> > reach of Linux as a whole, so should not be expected to have an updated
> > DTB shipped ?
>
> It is not necessary to ship an updated DTB.
> The bootloader stack can just change the "status" properties of devices
> nodes that are be taken away from Linux from "okay" to "reserved":
>
> Devicetree Specification, Release v0.4, Table 2.4: Values for statu
> property states:
>
>     Value: "reserved"
>     Description:
>         Indicates that the device is operational, but should not be
>         used. Typically this is used for devices that are controlled
>         by another software component, such as platform firmware.
>
> When all SCMI IDs change, too, much more work needs to be done.

It's a pity we cannot use strings in e.g. clock specifiers.
Then we could look them up by name (which would hopefully be more
stable) instead of by ID...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

