Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 488E6CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 08:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2H0+Y+0nbHCT1nPmHP2N1suTimvZ79Q7MXGtF4XoMw0=; b=FZQLjzHWEi/cS/jQLFDseF6gBe
	U4Jw2EXu7+XoPDnhi9qF9VbzKPe6cvi+gm5vFfXPaQP8YKiOMmZ9Me2lwR9thzY6lbYVpIY8DaLDS
	t2agPouzoeQ0YVLf8d/sdQqL8wZfUvKMgjIfWS1YOOKmf8tm/2Cn/bozldDzN/PTL3ukv2wIYbR0f
	RRljc4OR8EdIrYVE8PW9tctsskNHwo7ct209Nm2kK8IweuytXI2AfR5vi7wo7O3DyH/i1oyHxv8ZT
	v4VC8DGAly7UUqrL77eoK7SQ+sjlYt60LKzlqX0CZOGE/Tu9OMsaz2ndkRFgMV/mb6WXALXedfqrw
	tA4NrePg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCnH-00000008c6d-1lZn;
	Fri, 24 Oct 2025 08:05:03 +0000
Received: from mail-qk1-f174.google.com ([209.85.222.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCnE-00000008c4l-0LK9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 08:05:01 +0000
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-88ed6837e2eso266269485a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 01:04:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761293099; x=1761897899;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2H0+Y+0nbHCT1nPmHP2N1suTimvZ79Q7MXGtF4XoMw0=;
        b=YlhfUt80pBKmCbeV0Ss9T78/JKa2lS19Btl5WYVjXurgNRTli+0LiSzC/UZLCwqmQP
         LNh04A5iWe/0cc4Tp0D7x95o65qIQ8NbChwFkU1R0A7oFdOAv9sFmYbCVNbhHTWYpu+R
         FXzaYGankPzyMl0rhK1Y5pbWVgYEQiZzlIlFjOWd2JE2ezfzUFH2hhfwA+yMUq5wHQRD
         Mago2WX8KWdRHXxEmiQQcZO0JKNi4o2xqsAM2yegAde2zB1iC0tcibhw2mARN8kIoOts
         cp7yLRmMeoHRViMV0U+yth7n73CwAvadcAtSAi7f1jTEf/DRWnEewtAFN5CAhWaJasDH
         +OWA==
X-Forwarded-Encrypted: i=1; AJvYcCUFpS3aI7ff74ptSGQKYMsdJeSJ3Zh05nH9fA/4bjVdLvR3KLUeTXgs7aPhpkajz8tOR560eDcbYM8e7/3sIr9O@lists.infradead.org
X-Gm-Message-State: AOJu0YzgX9CW+id56Bq7ERIZlyFHXMELTFyRZS52AzuogkV3cxH6bsAw
	y4SqGlkteWOPi2ltNph+xzIhnmPApiNelSUaIPXgDN4UuWpa6MlyW/dLvfNW4KGT
X-Gm-Gg: ASbGnctopFuFjPEzVYqRu8zaYiwCdVWRQe2cDssffOSHD8REHjT1R8b91yjDIWIgqaw
	Pffyn2GV8DKIbc5s27L/btDMKVzK17St8fgGwScGMzHwSe+p9+6dOx6W72CU/aifx6nlecIIiIP
	BUWLY1Se0E9gKsOFNkPBu+ohvabmFpKDxF5fgk/t/Ro3gK6R8v0scNM5/duhBYbV04qqg5LY+6X
	dLMftt6aM145phsX3kkBbnW9N6+MMRYO75PRdt+rejCcyimotZGCXH43fQ5xKkwlBlHcqVpwZtX
	xgupJvA2KyHr0SABSzMSjwcVgASVrceTL2hAdPIYHL+9JrIyYrj1im1+mwL9nE0957XPqMlku0j
	JTbrPnquNvuk7o5px56CoMP3jmNmKGRiyQiNPM2/m2cNeL4BmHGsPHC+RwfFKpNeVG9Cyewdadd
	1N4PMx595Vs9pIpl1EjbEeMqBVreLvun4APzCUi/6NrA==
X-Google-Smtp-Source: AGHT+IGcsta4wYNP9SK8dXPlhaXywbUCc14MLJcXdacSy4PRSS/bBbC7eIrs23h6MlhKO2zk6YUVkA==
X-Received: by 2002:a05:620a:319f:b0:891:c248:a513 with SMTP id af79cd13be357-891c248a792mr2634644885a.66.1761293098154;
        Fri, 24 Oct 2025 01:04:58 -0700 (PDT)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com. [209.85.160.170])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89c0e97efa6sm331034685a.24.2025.10.24.01.04.57
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 01:04:58 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4e89f35f943so22801861cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 01:04:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXhJrkh9dPUybt3Axc6uCtrbSfi+DKDNTSAGZaLdosVUiBfbb2u8HFnVaY9Htlfl+bDqqYtPswwvk/WHHZJRbz+@lists.infradead.org
X-Received: by 2002:a05:6102:50a3:b0:5db:2f62:c15 with SMTP id
 ada2fe7eead31-5db2f621029mr1782604137.41.1761292628800; Fri, 24 Oct 2025
 00:57:08 -0700 (PDT)
MIME-Version: 1.0
References: <20251022070543.1169173-1-ryan_chen@aspeedtech.com>
 <20251022070543.1169173-5-ryan_chen@aspeedtech.com> <b5441728-06a7-44ea-8876-3a9fc3cf55be@app.fastmail.com>
 <TY2PPF5CB9A1BE626A2F0F6307461D8F64BF2F0A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <6a97fbb4-19c2-4ffa-9c73-26aea02c27e4@app.fastmail.com>
In-Reply-To: <6a97fbb4-19c2-4ffa-9c73-26aea02c27e4@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Oct 2025 09:56:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXTZZK-Tk0gerpARfr+jUNGPhEfRqGOtTvTTJp=SZ2ayg@mail.gmail.com>
X-Gm-Features: AWmQ_bnSAouTBsQ6YdE-Y1_3m37NwmxEYp_NrgytrqguGhvssb4gZifd3I_f9eg
Message-ID: <CAMuHMdXTZZK-Tk0gerpARfr+jUNGPhEfRqGOtTvTTJp=SZ2ayg@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] arm64: dts: aspeed: Add initial AST2700 SoC device tree
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, BMC-SW <BMC-SW@aspeedtech.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Jeremy Kerr <jk@codeconstruct.com.au>, Lee Jones <lee@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Nishanth Menon <nm@ti.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Taniya Das <quic_tdas@quicinc.com>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Eric Biggers <ebiggers@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_010500_145589_7FDA58AC 
X-CRM114-Status: GOOD (  35.32  )
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

On Thu, 23 Oct 2025 at 22:11, Arnd Bergmann <arnd@arndb.de> wrote:
> On Thu, Oct 23, 2025, at 09:37, Ryan Chen wrote:
> >> > +  aliases {
> >> > +          serial0 = &uart0;
> >> > +          serial1 = &uart1;
> >> > +          serial2 = &uart2;
> >> > +          serial3 = &uart3;
> >> > +          serial4 = &uart4;
> >> > +          serial5 = &uart5;
> >> > +          serial6 = &uart6;
> >> > +          serial7 = &uart7;
> >> > +          serial8 = &uart8;
> >> > +          serial9 = &uart9;
> >> > +          serial10 = &uart10;
> >> > +          serial11 = &uart11;
> >> > +          serial12 = &uart12;
> >> > +          serial13 = &uart13;
> >> > +          serial14 = &uart14;
> >> > +  };
> >>
> >> This looks like you just list all the uarts that are present on the chip, which is
> >> not how the aliases are meant to be used. Move this block into the board
> >> specific file and only list the ones that are actually enabled on that particular
> >> board.
> >>
> >> In particular, the alias names are meant to be local to the board and don't
> >> usually correspond to the numbering inside of the chip. In the defconfig, we
> >> currently set CONFIG_SERIAL_8250_NR_UARTS=8, which is enough for any
> >> board we support so far, but that means only the first
> >> 8 aliases in the list will actually work.
> >
> > Understood. I'll move the aliases block from the SoC dtsi into the
> > EVB board dts. For the EVB, UART12 is used as the default console,
> > and the board labels match the SoC numbering, so I plan to keep:
> >
> > Does that look acceptable?
> > ast2700-evb.dts
> >       aliases {
> >               serial0 = &uart0;
> >               serial1 = &uart1;
> >               serial2 = &uart2;
> >               serial3 = &uart3;
> >               serial4 = &uart4;
> >               serial5 = &uart5;
> >               serial6 = &uart6;
> >               serial7 = &uart7;
> >               serial8 = &uart8;
> >               serial9 = &uart9;
> >               serial10 = &uart10;
> >               serial11 = &uart11;
> >               serial12 = &uart12;
> >               serial13 = &uart13;
> >               serial14 = &uart14;
> > }
>
> I think this would be broken for the defconfig if the consol is
> on serial12. I would recommend using serial0 as the console, like
>
> aliases {
>        serial0 = &uart12;
> }
>
> in this case. If additional uarts are enabled, add those as
> further aliases.

Indeed. Are all these serial ports exposed on the board?
Aliases is mean to list only the ones that are exposed, and the alias
number should match the label on the board/port ("serialN", "debugN",
...), ideally.

Typically only a few ports are exposed, so you may end up with something like:

arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi:           serial0 = &scif1;
arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi:           serial1 = &scif3;
arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi:           serial3 = &scif0;

I deliberately picked this example, as it shows how the serialN
numbering does not need to match the scifM (or uartM) numbering.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

