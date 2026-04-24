Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF1FFE5219
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 12:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DlPOzsbSlIKF8HuNfduxYXPi56LqB7rH+tGNemLx+GY=; b=VeyMghKQbdQMpWY3xcmyYKJBZa
	/Md8FgLwxZYQ5UtIexbwgt5BiCbk9Sr0KG43ErleRctlfkrrcpAoME+k75Ir8Icze7+7Tf5biCtic
	86ziCb6RKIborOcLCvEGIoTqFLX5gH8WW1Gc7mgCMK0BBDyb4L0/76uOyU50cTp2QFoDdVLNjJexh
	Wf09WLnut0RLa3nzJT+vqigc8lImyYbmvxbOE2Ao7RxgeIioE9ya6pLqgsHmrVIY8t1HhedJGZfk8
	e/ykzpS3Ofmi9xhGMJz0fncpj7BemMi4dChyfkuBS9HhZ9nZEtwlIDknX8+Vo/tEoPw/a0ubz4eqt
	x89GUJSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGFRV-0000000DAOQ-3yXz;
	Fri, 24 Apr 2026 12:15:33 +0000
Received: from mail-ed1-f49.google.com ([209.85.208.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGFRT-0000000DANd-14cT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 12:15:32 +0000
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-671ab90fc1fso15142708a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 05:15:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777032927; x=1777637727;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DlPOzsbSlIKF8HuNfduxYXPi56LqB7rH+tGNemLx+GY=;
        b=JSO1OxtienIbfOYJzU4KQoNI4y+8ARrAZOA7Y+L8h1m2N3nTrR6HDMDOBWKPrkJmuc
         haI6FtsXn+1j/UivgrG/AV5i69qp2XxFeb3pEkT8CHtKeejo/oUZZIYwNx/MOzZ6kTR8
         fsRgpo9zG8gDWeGAUpDgKmcxQSq/YJ5R+fpBxNfSzsbfYq/4qrWJAyDSDVfemXS+hwi3
         iCoeBOHZKrF1mG7BrcB/6j41UNSBRDql3Fj7ZplreWmhwSjG2QhAIF1yLmgiwgGwekP3
         VHP959Z3LBBBp7mXIaa5qGfHd5p8dVScp3F5IRyw7r9fTEP0RzKHd4Bld77EH558rie+
         MWXQ==
X-Forwarded-Encrypted: i=1; AFNElJ8FVWti+uq3wdP0iFfuNzOxUSqc3ARIe9BNP2xY9O8l4+yaeJxa8rrLWLuO1ko5j0FEyPGREt23UF6Zd/LUJsjX@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg2LMl2uaDMZj1bSII6aYPYcDNcjZ0/6tSRf5sen+Q9BhlJis0
	TljJ0bBFnN5pIJUprwK67WoC0VNkOSKi45Zh48VyRzkcTcbUAaz0Qn+VDtvkjC+mGLo=
X-Gm-Gg: AeBDievXUzwObu/88ctuULgPbQx7tvXMz4zBtukBlXU7DoGW3ZzQP73tF0KE4re22OV
	Zm4nzAt4DQ0a0USamtYsCCU9WpbFA+bT7pDe8Oo/ASyoQkFnRXUqyXOpdRzTDCv43h23EP1sv9S
	tH3DB3IEKUBN1JFtGMvENiKxZ1ZAfwe+31kEuUUGWIW1X70QBVqrbhntAVgW2zI+cd3tybbZciU
	2KADstb6RpIf4hNXAHKhJzE0sIj0J5Ckip/5c8DoouHOjgOAjNwyhRkCuEpsoYBsc4fCZE3nmsM
	2DRlfcmes7mG05FeXsm4IS2nKHoFUOu+spYHnAFy2Em7P4KXIHpYigd/Mmg/k1TwlgQy5trD4GQ
	ZAo94VhkPX5YDHphhgoSMv6rbsumhoSEc7PjVYNMo8qN0hv+QFUWdsMk6NUCRcqUloY7MDhx2Ej
	XFceyBwzOoSqQTYh6vf1InVwGemCSl8XWx+8Wj5jtmGAqzPVaQCMTnw7BG4e26ZkhVzFI1Pl2pH
	76/wTKg8A==
X-Received: by 2002:a05:6402:239c:b0:674:25d1:7258 with SMTP id 4fb4d7f45d1cf-67425d174famr8406303a12.28.1777032926591;
        Fri, 24 Apr 2026 05:15:26 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6744dcdf29fsm4391069a12.30.2026.04.24.05.15.26
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 05:15:26 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bad54961385so198567566b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 05:15:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+Qyr3MQuiChHefn3+ORvBo40iC0/IMb6p2jSbZMernPB5c24JR21+6qPaE7c+VYQGsmaO6jcdpg5Qdz/TSyYGF@lists.infradead.org
X-Received: by 2002:a17:907:3da4:b0:bac:1263:2562 with SMTP id
 a640c23a62f3a-bac12632637mr434030666b.24.1777032550820; Fri, 24 Apr 2026
 05:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
 <aekXUvIPb8nkhdKu@pluto>
In-Reply-To: <aekXUvIPb8nkhdKu@pluto>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 14:08:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJvMH+a1RqozbaCxxH_8M569JcruTFa8PW+87FysnjHw@mail.gmail.com>
X-Gm-Features: AQROBzCeAVXP6DoeEYDD8I1FaXSTP-ZpY0v2OnIf6zjZFA9mNfY85ZLl0E87BuA
Message-ID: <CAMuHMdWJvMH+a1RqozbaCxxH_8M569JcruTFa8PW+87FysnjHw@mail.gmail.com>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_051531_331039_82B4C6F5 
X-CRM114-Status: GOOD (  44.23  )
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

Hi Cristian,

On Wed, 22 Apr 2026 at 20:45, Cristian Marussi <cristian.marussi@arm.com> wrote:
> On Tue, Apr 21, 2026 at 08:11:38PM +0200, Geert Uytterhoeven wrote:
> > Currently non-SCMI drivers cannot find out what the specific versions of
> > each SCMI provider implementation on the running system are.
>
> Thanks for your patches....this is not a proper full review of the series,
> BUT this patch catched my eye..
>
> Indeed, yes, it is deliberate that the SCMI version information is NOT
> exposed out of the SCMI world, since being the SCMI an attempt to
> standardize a common FW interface (as in [1] of course), you should not
> know what runs inside the black-box, it should be irrelevant...
>
> ...indeed the versioning is used inside the SCMI stack to deal properly
> with different protocol versions implemented by the server OR to apply
> proper quirks when needed, but all the rest should be standard....
>
> ...you should NOT really behave differently based on the underneath
> protocol or firmare implementation version...it is the SCMI stack that
> should behave properly, transparently...

Oh well...

> Having said that...I understand that at least it could be useful to be able
> to query the SCMI stack to know, even from non-SCMI drivers, WHICH quirks
> have been applied/activated at run time...but anything more than that it

I see no need for that, but we can discover which quirks have been
applied from the kernel log ;-)

> seems to me dangerous and prone to a number of abuses of the SCMI stack
> itself...
>
> (Also...exposing the versions itself means also tracking that bit of info
> in more than one place: the quirk framework and your drivers.)

I'll see if I can get everything handled as quirks instead...

> > However, different versions may use different ABIs (e.g. different clock
> > IDs), or behave different, requiring remapping or workarounds in other
> > drivers.
>
> ...abuse like this indeed :P ... the SCMI server is supposed to be that
> one entity remapping the IDs in the background if the same IDs happen to
> be representing different physical resources across a number of distinct
> platforms all supported by the same firmware blob...so as to present
> a consistent set of contiguos IDs...

In our case it is just a single platform, with different ID number
spaces for different firmware versions.

> Also because this should be one of the selling point of the SCMI stack
> in a virtualized environment: you can ship the same kernel drivers with
> the same DT and you know that ID=<N> will always identify the specific
> resource that is needed by your driver without worrying about the fact
> that in reality in the backstage the effectively managed physical resource
> could be different across different platforms, because that does not matter

This sounds strange to me, do I understand it correctly?
So the ID should (1) be tied to the use-case, and not to the underlying
hardware, and (2) be the same for different platforms?

For (1): Then we must not put these IDs in DT at all, as DT is supposed
    to describe the hardware (and firmware IDs in DT were IMHO already
    a stretch before).
For (2): How can there be a contiguous list of IDs, as not all platforms
    may have the same underlying hardware?

> if the SCMI platform server had properly remapped (at build time/run-time ?)
> the resources to your expected ID...alternatively of course you can ship
> with different DTs to describe different hardware...BUT remmapping stuff

That is a different issue: as SCMI covers the full platform, not just
the SoC, the IDs can be board-specific, and thus should be specified
in the board .dts, not in the SoC .dtsi?
Then the SoC .dtsi should describe the hardware, and we end up with
things like arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts?

> in the drivers themselves guessing on the vendor/subvendor/impl_vers
> seems a dangerous abuse...

There is no guessing.

> I watched a bit of the LPC discussions around this (from Marek I think)
> but sincerely most of those problems had one (not necessarily simple)
> solution: fix your firmwares AND/OR apply quirks in the meantime...

Unfortunately (at this point) we have to work with the firmware that exists.

From that LPC discussion, we learned that we are actually the lucky
guys: some other vendors tend to change the IDs and/or behavior without
bumping the version, so Linux cannot even act upon that...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

