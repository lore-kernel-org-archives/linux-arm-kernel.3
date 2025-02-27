Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFECC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 13:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TgTF9fnQCtZ/1JPDuErDL3hK2IiKktv+/F9Qx31sPmI=; b=exfKk6Lzclfzo5Re+uQsKejCbN
	TBJ8eczNH2Jst3s+Fb1f6POWs4UE1Fr+jpb8UzUrmz/zwX8xble6u/lhwmlF4+JkgTvF9seg+wvp2
	PH9ZCcgWqfr6EsGVDVW48sbFA8t+nyvWj6WLgli9ZRuM3nFXhJfDa4yD8O2R/x0oA9g9ll/1YpoEq
	NflhJmWRF1FcFvCFOMs4zbBYH9M0CVqwJ2vMbmM+PpPB/9wdiNwgMGBRAOqySV49WFvwA1ObmalRv
	CIAJyIM7RbRqw1nbgQwxa/U3BRZ47gpOVPSTBxM2W20OylUIWWayyhMMIeX9erET4AldiP16H10CC
	p2RFHVYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tne0n-00000007Y03-0CNe;
	Thu, 27 Feb 2025 13:33:13 +0000
Received: from mail-ua1-f44.google.com ([209.85.222.44])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tndtg-00000007WgS-3GEk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 13:25:53 +0000
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-86911fd168dso369000241.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 05:25:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740662750; x=1741267550;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TgTF9fnQCtZ/1JPDuErDL3hK2IiKktv+/F9Qx31sPmI=;
        b=TNOEmCp8YVj/PPAZdeWro1YhM641wQDU5fNpz39GBFR9SyyJRCXU1743SD8COv74gB
         +Eg+KJLBiHiVueElKr/da3E8OhELXvlub4yIxfmazpRkmzSpiajBUVfjyL5q6zb/m4ol
         yrpq4LPVs+a0ZO2sOUauaQUH14zXVCSU3VxhWkI0r+9zVu5SR9Bf9FF6eZxnxE373LA/
         U/cjRyInNp/Ypo1KOEBGj4k7BQdEInv32us6ZNh376bm6GitIdtVEUogtK84plB46avh
         P9mwgmklgek9ovH7MSJwoAXiNBsr6bKB4J/yaeqFgiMldpIaQ7MPbzGOQy9CVjZZHOE8
         AnHg==
X-Forwarded-Encrypted: i=1; AJvYcCUXid/Sw45cEzp37Z60THu+cHrYrnIum+OhVXbho6+v/BLR0KniTGop9ivCol05PBlKQJUAcxpRzu4q+Zhxr3ui@lists.infradead.org
X-Gm-Message-State: AOJu0YyrOMZBcb+f3TJMtKGGwTfnGCnV9r2/xNhXeG5UqlhHaxVWXFoc
	JOFcl/0eldGWtmbRbcSgWHrVo6tjdySYcsM6Wqugc/QLUFq1QvHPD9sZrxvD
X-Gm-Gg: ASbGncvqxEreHuWZzTCLCIG/PaYalegwL78RdqiDB0cOf6TlLyuiOAQqDo7r9fx6lsc
	KToYTVXMKd2DE3iMksMh83av5rIYnC/XXJ4If9+UFArfY1nbkxJo7NulnEduslvJhGN9Tnqd92R
	4jo62GL1P8laMa1rUf0WMbnbMdA3M+2oPV9Vaw3lXWdtaRjn/ER2TCGeKONk++jCgOz4y6a5KoU
	XVhXsRhmEJzxOHrfaP2qBPKTvRv8nCqf4tqcpyiaz2z7HhshD9dfpSKaJ9Ktm3T1skpGrkDoUYs
	68yEhLDzStdlOKsQX+iY+rUDcVY3YuO3PcgAWlgBUKEDf/uHUF82JWVPabU6LVZX
X-Google-Smtp-Source: AGHT+IHXv/F7E2B6uaI5f/bc20NP6xRymm8gUwImPKkWwpdd9vpBPOLUiEth4rdO+nOtEIq+4PgodQ==
X-Received: by 2002:a05:6102:3f13:b0:4bb:f1f0:1b34 with SMTP id ada2fe7eead31-4c01e18b519mr3435048137.2.1740662750606;
        Thu, 27 Feb 2025 05:25:50 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c0343cf6bbsm266404137.0.2025.02.27.05.25.49
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 05:25:50 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-86b31db3c3bso376103241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 05:25:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWhW/D40fAFKfua7xyDASz2MGrxRc7bbGNOzdqZTAsEvWuXSNeFzrycmTeS/aRx18TP7jVx1gcYXpA343YR8W5S@lists.infradead.org
X-Received: by 2002:a05:6102:161f:b0:4bb:d45c:7f4b with SMTP id
 ada2fe7eead31-4c01e204103mr4220550137.11.1740662749508; Thu, 27 Feb 2025
 05:25:49 -0800 (PST)
MIME-Version: 1.0
References: <20250226130935.3029927-1-thierry.bultel.yh@bp.renesas.com>
 <20250226130935.3029927-14-thierry.bultel.yh@bp.renesas.com>
 <fe4ccf6d-bdf0-41eb-bffe-83d459319689@kernel.org> <TYCPR01MB1149252F0825C9BCF6A1B832F8AC22@TYCPR01MB11492.jpnprd01.prod.outlook.com>
 <f134c607-2a03-4ee2-9f7a-befa1e4feb74@kernel.org> <CAMuHMdW1k71gL_OYug+aF=SEkMDuXLy_oLpikahYVcqPMsMbHg@mail.gmail.com>
 <4f737623-6083-4ef9-b7a3-d09ebafa92de@kernel.org> <TYCPR01MB11492DBCAD461B83B3CBE75E68ACD2@TYCPR01MB11492.jpnprd01.prod.outlook.com>
 <c4a44c39-5448-47d5-aeb1-32bab6e57047@kernel.org>
In-Reply-To: <c4a44c39-5448-47d5-aeb1-32bab6e57047@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Feb 2025 14:25:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXwMoY0mhG6-u0iVg79zYxAvv0Snrt019kDP+TJoXA5FQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jo-pN5NazOUtBQZzfnaAHBmOkbTZWUZun2zxJCQJ3Pcdx3o1kvUeaCI4V4
Message-ID: <CAMuHMdXwMoY0mhG6-u0iVg79zYxAvv0Snrt019kDP+TJoXA5FQ@mail.gmail.com>
Subject: Re: [PATCH v3 13/13] arm64: defconfig: Enable Renesas RZ/T2H SoC option
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, 
	"thierry.bultel@linatsea.fr" <thierry.bultel@linatsea.fr>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Paul Barker <paul.barker.ct@bp.renesas.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_052552_819198_E8ACDA4B 
X-CRM114-Status: GOOD (  30.02  )
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

Hi Krzysztof,

On Thu, 27 Feb 2025 at 12:48, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 27/02/2025 11:48, Thierry Bultel wrote:
> >> This is fine, I am not against fine-grained SoC-enable options. However
> >> all your SoCs should be enabled by default (default y if ARCH_RENESAS or
> >> any other option which works for you) thus you won't be growing user-
> >> selectable choices.
> >>
> >> Strictly speaking this still will be choice, because you need to trim
> >> config, but all people and all distros will just ignore it  and don't see
> >> it in defconfig.
> >>
> >
> > I understand.
> >
> > All the ARCH_XXX SoC options are already under a menuconfig section, which
> > is defaulted to 'y' if ARCH_RENESAS.
>
> Indeed and it actually cannot have "if ARCH_RENESAS" due to how compile
> test is enabled there.

Sorry, I don't get what you mean here...

> > So I guess that this simple additional change would make it:
> >
> > diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> > index 91a815e0a522..231880c21aa7 100644
> > --- a/drivers/soc/renesas/Kconfig
> > +++ b/drivers/soc/renesas/Kconfig
> > @@ -358,6 +358,7 @@ config ARCH_R9A09G057
> >
> >  config ARCH_R9A09G077
> >         bool "ARM64 Platform support for RZ/T2H"
> > +       default y

Please add "if ARCH_RENESAS" iff we decide to go this route...

> >         help
> >           This enables support for the Renesas RZ/T2H SoC variants.
>
> Yes and then run savedefconfig and check if defconfig needs this symbol.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

