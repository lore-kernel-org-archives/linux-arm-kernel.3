Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D829C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 09:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bsXao2r3BXF+b5muoZNjN0U+mhPp9TswNqeCZaqf3qY=; b=tHGMXw0IuhOOJ46vw53U8ckOc1
	rtMbVHgPFSBXjinroY0d2pmcvzTps3asM4xePp1EUXTxaJauYkRYKfAUenFF0whBw+PyXV8kk66P7
	z4O7iYHO4DMaXTZPhmoOuH97vYQ3c/IaHkznTce7nPbifUfEfaLhExfgH2iTZwFt2jpVT9ihB7rSK
	3d34sG7tU2WMf3GVUrKWJCbNNJecp+bdHOSusOeLii3fHLyW4SsUWylM+f/4X/nw0g3WlPrnciHe6
	H3Ks51a9nJgku5brrwjRd80bP+6/wKz8sLNw9CSu0kt7AzHq405d3UPR0eeffMaAIg67fAfaVpYU4
	xlH72Z4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnaKD-00000006sso-2QB9;
	Thu, 27 Feb 2025 09:37:01 +0000
Received: from mail-ua1-f50.google.com ([209.85.222.50])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tna82-00000006qoK-2hiy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 09:24:27 +0000
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-86714f41f5bso310719241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 01:24:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740648264; x=1741253064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bsXao2r3BXF+b5muoZNjN0U+mhPp9TswNqeCZaqf3qY=;
        b=FfIV1Qfjkm0+hDCo1Kit46BIYzRTFzEIRpOYY+aNRBSwFECwK9LlsvtWEP6s9A0sM5
         MaOA7vWpWnYbZ1UA6ZVnie5ZeZymjTsDYzFzjdS0X5lsPufpC3d8PH1w7/NEnasYhOVd
         Z5C5CS0Iq8W2PmBwJj/wYcbcEJVWWAeKK+v+A+jd5msD5h1n5EDa1mdIQ33GhsEfAG11
         DJMAiohIw5e+sk+XwaIekpSGBWyb/+WnysgOT2Gacb3Tx3LuOEao6qdKZ/LtvYw5pR4y
         3FK05qCyACIHOgNfOb/TQFdP23FuBKXA3wW9VugL4gqcFzL67QEDC6fguFyu5GFcGRhr
         i+/A==
X-Forwarded-Encrypted: i=1; AJvYcCWlm1lCZGc9++sjfzM/+MerO7NCZ9FLsWPMI2R2bTQsY0zh7if0UL3APcDFWbD3mJf23Ar1+jhkZP1NasRpkFB9@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7Y1YZ5yRtNXoNGiqQXxdekteKZOXBQRwwQfrrU03WByC9UZoQ
	n4vhhiSTdU3G2YpM4PMRhsf3yEmaNWRMLfdEX1Psk464weUsUjMkUnA3SikW
X-Gm-Gg: ASbGncthe/K+5VI+H8sqhGRb753UzXI0++uWxhPOECGINbEp8D0mf9dyGiQxc/6x3yd
	TvXzIkw5kSqnxejizimMWK1NhgZiNwJZXtlPSdbXoeTYsKNeAJ3W+zlzVIN5E8KErs0l+7Tk+WH
	U2g0c9uRadNqoUg/+PvhZ++xKbctgGCFKGmyqEn6Bg7BIWOfZ+r0DKbJLWWZqez44j6//bfTKq8
	qlUqD083DDoJsZMr+ED0M/RYsl/owXqnnJ9zMbQwwF8cQw7daZwPsuIsQA09ig8jhle0wamJzeq
	n+ftJTOnOzKcvkyTDUm57coxPq7K66LkiijkukU3oEtYmZQYgnEz2hallZpkG6+l
X-Google-Smtp-Source: AGHT+IHaKvTV0ElO71mjJ75f5G41PWg23UcvFNbOVKKcxRA/1mHolkvCLUCs5UJQAECnT4yrIKCOeg==
X-Received: by 2002:a05:6102:3a0c:b0:4bc:82f:b4e0 with SMTP id ada2fe7eead31-4c01e2f9ceemr3450203137.22.1740648264182;
        Thu, 27 Feb 2025 01:24:24 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c034641fd2sm172528137.10.2025.02.27.01.24.23
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 01:24:23 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-86714f41f5bso310713241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 01:24:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWxykYldaED+GwHhoFNYgj1VJZsZi4Da+xsCKNHQhwJhGfhg0P/8L03vGRqbmR6Sl7VpQKq19PnLp7PlIFdwJR4@lists.infradead.org
X-Received: by 2002:a05:6102:4b09:b0:4bb:e8c5:b164 with SMTP id
 ada2fe7eead31-4c01e1cd220mr3515703137.7.1740648263592; Thu, 27 Feb 2025
 01:24:23 -0800 (PST)
MIME-Version: 1.0
References: <20250226130935.3029927-1-thierry.bultel.yh@bp.renesas.com>
 <20250226130935.3029927-14-thierry.bultel.yh@bp.renesas.com>
 <fe4ccf6d-bdf0-41eb-bffe-83d459319689@kernel.org> <TYCPR01MB1149252F0825C9BCF6A1B832F8AC22@TYCPR01MB11492.jpnprd01.prod.outlook.com>
 <f134c607-2a03-4ee2-9f7a-befa1e4feb74@kernel.org>
In-Reply-To: <f134c607-2a03-4ee2-9f7a-befa1e4feb74@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Feb 2025 10:24:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW1k71gL_OYug+aF=SEkMDuXLy_oLpikahYVcqPMsMbHg@mail.gmail.com>
X-Gm-Features: AQ5f1JoVNzTVv9iRqIxLoBtW1eNPEriYX27b3fcczBzchYMkzLkI98yA_imqF9k
Message-ID: <CAMuHMdW1k71gL_OYug+aF=SEkMDuXLy_oLpikahYVcqPMsMbHg@mail.gmail.com>
Subject: Re: [PATCH v3 13/13] arm64: defconfig: Enable Renesas RZ/T2H SoC option
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, 
	"thierry.bultel@linatsea.fr" <thierry.bultel@linatsea.fr>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Paul Barker <paul.barker.ct@bp.renesas.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_012426_680559_5509B7D4 
X-CRM114-Status: GOOD (  27.69  )
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

On Wed, 26 Feb 2025 at 15:40, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 26/02/2025 15:32, Thierry Bultel wrote:
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski <krzk@kernel.org>
> >> Sent: mercredi 26 f=C3=A9vrier 2025 15:22
> >> To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>; thierry.bultel@=
linatsea.fr
> >> Cc: linux-renesas-soc@vger.kernel.org; geert@linux-m68k.org; Paul Bark=
er <paul.barker.ct@bp.renesas.com>; linux-arm->kernel@lists.infradead.org; =
linux-kernel@vger.kernel.org
> >> Subject: Re: [PATCH v3 13/13] arm64: defconfig: Enable Renesas RZ/T2H =
SoC option
> >>
> >> On 26/02/2025 14:09, Thierry Bultel wrote:
> >>> Selects support for RZ/T2H (aka r9a09g077), and SCI (serial) specific
> >>> code for it.
> >>>
> >>> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> >>> Reviewed-by: Paul Barker <paul.barker.ct@bp.renesas.com>
> >>> ---
> >>
> >> You never responded to my comments at v1. So I asked at v2. Still no a=
nswer.
> >>
> >> That's v3 and still silence from your side.
> >
> > Yes, I understand your position and have added a paragraph
> > at the end of the cover letter about this point.
>
> We do no read cover letters, unless look for dependencies, so if you
> disagree with someone you ought to respond to the email directly. Not
> silently discard.
>
> You keep adding more and more symbols, so your "out of scope of this
> patchset" is no true. Otherwise every contributor will use exactly the
> same arguments - "not my problem".
>
> So again NAK because it is something ought to be finally fixed (and is
> not even tricky to, so I don't ask for impossible).

Adding RAM to existing systems is usually quite hard ;-)

Not all Renesas SoCs are used in systems with multi-GiBs of RAM, so
IMHO it is still valuable to have fine control over which SoCs are
supported by your kernel (and e.g. which large pin control tables are
included in your kernel image).

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

