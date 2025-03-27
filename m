Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941D0C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 08:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wK9lKk51F8Ig4IUd/YTVgiulwDpAR89rwMrTX7A/kVQ=; b=Z3VQDcYO1EzVtla4JhUhpJMKMG
	kv/m8GVjWhtKltqpBr4rHI2JQVDtBEnA67S2CVabv+tPEePy6rzQa1/pZkQNgQCt1LpDCLSEdRkYR
	pguCPX4SZgjGgeEjfrGq3MbSAob2/Of5FSnEls1+7nK9VeBNpZe23YaNzIXpbVNQBxlmx+yFyFsQ7
	aDwUa5ry/BDWHoBUk4VRML8Y1luSF+ykHxua0IX1JV33isJiwLpg9WPYBQ3QVtjaNTJTDu+J/OFz8
	EBDZOcyvoTHbOqa+h+Su0h5ANb72KLJj03cBqhz+TAOrVlGlSNcNEIUMFXQrTUBzObDKmigE923MR
	elFWapkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txj3D-0000000AVQ4-2Nbl;
	Thu, 27 Mar 2025 08:57:23 +0000
Received: from mail-ua1-f51.google.com ([209.85.222.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txj1T-0000000AVC9-34rG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 08:55:36 +0000
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-86715793b1fso330777241.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 01:55:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743065732; x=1743670532;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wK9lKk51F8Ig4IUd/YTVgiulwDpAR89rwMrTX7A/kVQ=;
        b=A1RtxsSPmzmJkhHxDwuOZrajccFASA//RaJg7tKJIYEBZy5iE6uP6YxtX1byTlQKxf
         hKpSB0/EInOO3aMqAeHuCvtr9REDlgoib1/7kpPJ1jwcX7nA7euqwFPGTsAHjB4SWpTX
         oFJrDGqohAnePh08VtqFGxuEQAIIe557qk4pV8o1TLJoHR8VXKa92US4VyBrGmq+c5NR
         jQGw+OCuQ6IrI/Rs9JVRe8dr/P2DbcD+u+JucLxaK2eopTMs0OE52szP1yTp74ZOp3xu
         NsthE5fDqzzSsVUcukEj36e8d57U8uVDBrHYqUUgoW2++wTIgAcSbBvoiuduMoluzsLu
         zdew==
X-Forwarded-Encrypted: i=1; AJvYcCVK/In+bRrKEx65zpbWGnUFTi3M0MojHpmSYtNN8qsDUpGczwA6WAiCIbIHdJEkP6brrBa6gS7ZkLaa+wEqU1EA@lists.infradead.org
X-Gm-Message-State: AOJu0YzcuSzLvO5LiE2Cba22/0Q/fRRBA0WgvnIa9j/WVb/buZ3t3qVc
	EbP7JtcPYuaV2hjDGs/2ut/0u9f91q0qcFoarHaTqBATifD95u66WLLz4igVw0s=
X-Gm-Gg: ASbGnctO1q5TeItZmisFZ5DL2VgO7wtobx1PrnYoRnAHY68Jrm1wj7ktuf3OAdEFdoU
	epuLRV2awbM3Gm1RoxcA+S49qE7PwIvUPu8J3bjWs+xMLbikFX9g3s6MNrxVs+8GQnIWWaPHTZQ
	f1TFPkZ3VOfbwc0B7WsE1Cx7h1OXROY1NmHBXxpwrNXcPcSG5MPG/loAVfNzn0/J0pSaztb6zvf
	IjFvB95aPFB1TH+xD+KdcOuqzFe71pd4pcD4CEv+bHLMYrp2Qtfm4P9lBlJplKOqTBs8DEvUHHp
	15+AhCksA64q+WTMhaWjVl4iDqmv7p7FCvzMyMIsqzWGzxyZ+ECfX/PobACgfP261TVNYTn0tY5
	AbrLu2rY=
X-Google-Smtp-Source: AGHT+IE0VsZgbTE/wLieMKfS5pgVUrfyS2/SZyNZd5g+LiMetoHPf8AHbBQ1gJUOPlkpdxPZz0GHng==
X-Received: by 2002:a05:6102:800e:b0:4bb:e8c5:b172 with SMTP id ada2fe7eead31-4c586f7ac54mr2538189137.8.1743065732395;
        Thu, 27 Mar 2025 01:55:32 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c50bdbe1ebsm2740409137.29.2025.03.27.01.55.29
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 01:55:29 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-86feb84877aso307306241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 01:55:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVoBVuefmbh2bEfNclhrc2bkkrtNP9HWGMxRsgaUC/KjfPuKNO80Q+mpsbP/sp10eFxbkingOgB60CIrvOfQrru@lists.infradead.org
X-Received: by 2002:a05:6102:50a5:b0:4ba:971a:41fd with SMTP id
 ada2fe7eead31-4c587074bf4mr2444666137.19.1743065729369; Thu, 27 Mar 2025
 01:55:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250326143945.82142-16-prabhakar.mahadev-lad.rj@bp.renesas.com> <41c6f512-47a5-4723-bbdc-64ed85ae8391@kernel.org>
In-Reply-To: <41c6f512-47a5-4723-bbdc-64ed85ae8391@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Mar 2025 09:55:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVKfL-FRhDaFfOACV8R=ziqXdhmeW7Xd4WYXqHnSbR0ZA@mail.gmail.com>
X-Gm-Features: AQ5f1Jp1SYp8iWPpWJ6Tj5rp6ScglN-F4PfZy1-_zatQI8UsxeHgk8YvFPlKy5w
Message-ID: <CAMuHMdVKfL-FRhDaFfOACV8R=ziqXdhmeW7Xd4WYXqHnSbR0ZA@mail.gmail.com>
Subject: Re: [PATCH 15/15] arm64: defconfig: Enable Renesas RZ/V2N SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Prabhakar <prabhakar.csengg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_015535_772096_C1391DB1 
X-CRM114-Status: GOOD (  28.30  )
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

On Thu, 27 Mar 2025 at 08:43, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 26/03/2025 15:39, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Enable support for the Renesas RZ/V2N (R9A09G056) SoC in the ARM64
> > defconfig.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  arch/arm64/configs/defconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index 11e7d0ad8656..c7b41f86c128 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -1483,6 +1483,7 @@ CONFIG_ARCH_R9A07G054=y
> >  CONFIG_ARCH_R9A08G045=y
> >  CONFIG_ARCH_R9A09G011=y
> >  CONFIG_ARCH_R9A09G047=y
> > +CONFIG_ARCH_R9A09G056=y
>
> So the pattern will keep growing and none of you will ever bother to fix
> it, because you have your patchset to throw over the wall.

Yes, the pattern will keep on growing.
Just like the minimum kernel size will keep on growing, especially if
you can no longer compile a kernel without support for SoCs you do not
intend to run the kernel on.  Not everyone has GiBs of RAM to spare...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

