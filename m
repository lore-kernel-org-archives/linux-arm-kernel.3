Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0BFC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 08:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GV/VIz9Dal9GidNfi3rZQigxcHcKa0Red1OY/otJy2Q=; b=XQ5XwQFDEHJzMFFXbWT/W163jj
	twdZE7UKBXaaLuwBZlOoJp9BgvDB3At7/9ZVCEL9AmQDWfCws1G9m6El4jE3QMNJiYAWkeh7Glo+j
	uyb1+dmurrqGLkSie4UsXxB/L37r39uSaksQiEuJq8Fkyci/2aagOTUU0iy59IyHwWsevrMFR04gS
	CpoSQp6BCY0JVMEGHIovSAh7BovB3NibFQD3Eb0I6FvohQ/Yid604lMEL76fFjH/sjpHWrHGDbR69
	yb5ciqWcrwb3+QUZpRQ6YsdMwlqd1Eu3SFv3/F781TnIw80F2NjvNMZXOrJ2JeYXrXCe051CjL+/E
	1m8fMAjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Qqh-00000006add-0sfG;
	Wed, 09 Apr 2025 08:31:55 +0000
Received: from mail-ua1-f45.google.com ([209.85.222.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2QmQ-00000006Zjm-2YJT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 08:27:31 +0000
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-86b9d9b02cbso2741988241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 01:27:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744187249; x=1744792049;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GV/VIz9Dal9GidNfi3rZQigxcHcKa0Red1OY/otJy2Q=;
        b=Nqro2vAzQxKIZYP2jth8tk4+ISzflSHFo/0e6rIDMJVdUr2c3w6kQ4HDtnyvtxoNlC
         4eAuJHjh9zfbyLVeiJmA4n++8onbEb2mx171i8tbQRC8yiiu29yLTSfiCfHfh2KDh2hC
         sPUmwa2nNjBNc8J9PhRGZBFK7Orb59A3IZ9EuqE6GoDfeBk7+9R2wfRe03wmZE3B2WEx
         TYooe3WjNz9vO6tiXOEbJzebNaxpGTXPcoZWQMBWX9pAhPY1caYzIou3EY2GZ8Ys99FI
         RpBOZxjPST7idIkPG/6EUC+bFbmSbmbI6X0kdkpl1RVt+VmlVRbeKyyZ+DjQ/KYwXmZs
         rlxg==
X-Forwarded-Encrypted: i=1; AJvYcCUjqYNR0xguZUGLW6jmyogdPXfyNirvRwjVAR1J5hj+VQ+nWKoU5bB9XfsOknPr9rYuzR7s2y0HQ8mVHCT4jGDV@lists.infradead.org
X-Gm-Message-State: AOJu0Ywyhs5g3Bon5goFeCnDPHsS6OY7NWME1ANPCFf/u82pX612uU+V
	1AcqB5y6Sq9Z7S0HgNJvcTfI1HYNo5+gEusQXYI5ZAUsP/VspQinZ9atteK7uDw=
X-Gm-Gg: ASbGncuSJVkevXxswgOAliIbMNjUWKfcEiGD5qJzUjX7rdaYwm5rgiV07LMU7c7mS8d
	fFj71HPbExZMs5NzWibDBAg4NxsSwvS4i8ZMWRX/0g4XSx4Rp+yU88BprUeo692xNgvHfYi7OIo
	Glk0Op5/NhN5gwjJWv1M6Z4BLTeknLXmsMeUz44DyvaIkeiSzSEJE5hsOAqhnOsQG9bWpwAW9+f
	N7O3Ilop0BGer79GBjBebqxSaLkVjPUWpxkuMNrpr0iy4hRVqof0QBjALBAzw/Fct1I7s9JVzQg
	JLvgHq9ylhoFzAx9SYgpEko19yekdMKf1lWO/jOwt4xRZ+IbwYCPHU4s2MSn9Np0OEOYtQ05vUz
	6JYTzX4U=
X-Google-Smtp-Source: AGHT+IHq5StiljLWEUv3NVn+f6suaA5QuCRfj772lDNDCFiMKcN2BqjyZDlwL2RUFoF4tomXWQy+6A==
X-Received: by 2002:a05:6102:3e28:b0:4c4:e3c7:cc8e with SMTP id ada2fe7eead31-4c9c6b85c1dmr741937137.24.1744187248884;
        Wed, 09 Apr 2025 01:27:28 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-875572b6989sm143155241.32.2025.04.09.01.27.18
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 01:27:22 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-52413efd0d3so2815548e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 01:27:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUg5zWueQKv8k8cBQLuES/JWyPivUs8asz1PVE74AHE2l6JHWAL2HwvGJHdCOjfuVc2LQm+h8XGr7OlbzXAHqJY@lists.infradead.org
X-Received: by 2002:a05:6102:801b:b0:4bb:e8c5:b149 with SMTP id
 ada2fe7eead31-4c9c6a728e2mr725401137.7.1744187236860; Wed, 09 Apr 2025
 01:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-16-herve.codina@bootlin.com> <19f1a382-1b6b-42bd-a548-a1a5644c9a1b@lunn.ch>
 <20250408162603.02d6c3a1@bootlin.com> <D91CSNC07NYM.3KC467K0OZ4GG@bootlin.com>
 <c14dd5c6-2dae-4398-89a9-342e7a25bb30@lunn.ch> <D91XV1I4CY37.20T12FMZ5QLQ5@bootlin.com>
In-Reply-To: <D91XV1I4CY37.20T12FMZ5QLQ5@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Apr 2025 10:27:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVtrmh207usW45c0v5EmxgM+JgfQ=m55tXXNT0m4o5aGg@mail.gmail.com>
X-Gm-Features: ATxdqUFWOu-H2GpmZpjc1_rOXM2aP80PMBbJa2DlVS33R9lalUc2jSOHZ1dg-j8
Message-ID: <CAMuHMdVtrmh207usW45c0v5EmxgM+JgfQ=m55tXXNT0m4o5aGg@mail.gmail.com>
Subject: Re: [PATCH 15/16] misc: lan966x_pci: Add dtso nodes in order to
 support SFPs
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Herve Codina <herve.codina@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-acpi@vger.kernel.org, Allan Nielsen <allan.nielsen@microchip.com>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_012730_666951_C641E735 
X-CRM114-Status: GOOD (  29.38  )
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

On Wed, 9 Apr 2025 at 09:44, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> On Tue Apr 8, 2025 at 5:38 PM CEST, Andrew Lunn wrote:
> > "HW blocks inside an SoC." That would be the SoC .dtsi file. Anything
> > outside of the SoC is in the .dts file. OEM vendors take the SoC,
> > build a board around it, and name there .dts file after the board,
> > describing how the board components are connected to the SoC.
> >
> > So..
> >
> > So by PCI endpoint, you mean the PCIe chip? So it sounds like there
> > should be a .dtsi file describing the chip.
> >
> > Everything outside of the chip, like the SFP cages, are up to the
> > vendor building the board. I would say that should be described in a
> > .dtso file, which describes how the board components are connected to
> > the PCIe chip? And that .dtso file should be named after the board,
> > since there are going to many of them, from different OEM vendors.
>
> Indeed, that makes sense. So if I get correctly your suggestion,
> instead of having a .dtso that describes everything, it should be
> split between:
>
>  - A .dtsi that describes what's inside the LAN996x when used in PCI
>    endpoint mode
>
>  - A .dtso that includes the above .dtsi, and that describes what on
>    the PCI board around the LAN966x.
>
> Correct?

Sounds good to me!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

