Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73716C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 14:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2R9K/s8hikEWkG9ffFJdeORUUckoMZXY6IlqHFkEGrY=; b=jxi/4K2ocC23VIY+qXDMJcsslb
	YUJCoR3bfs3+q5j4RasobzrHH/Ju4xmCIVbz6OoK8EN+ff/E2R/xVWhenVS/1ttlX3SY7VO4P1Jqi
	uowZRj20MSF5PFrkiYVmaACvWHEbukLiRIwplWSPfnt9L8b40wyPxhptn3odApfpswzsEg2rPe+aE
	Fp1/U4H8EgQj6nA2tg0QGdIwStZj2I9/MMwjKQEhF+WFaD/eyykHLfLTyVdmhkQJUGO9HxQ5Am/xW
	7yMOX3MSLRraBPZx/QFndEF55UErnDBtQcQmtg4VXj8l++h13iH+vaZMSHGnJ73r6g3K7koy2M403
	kXZpX//w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmBmr-00000009hNS-1633;
	Tue, 21 Jul 2026 14:49:37 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmBmo-00000009hMp-0gOe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 14:49:35 +0000
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-497deab2d66so3847554b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 07:49:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784645373; x=1785250173;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2R9K/s8hikEWkG9ffFJdeORUUckoMZXY6IlqHFkEGrY=;
        b=NUoEaoxgNipDNJs5EkJ59UL3+FEwG77qyv1Fj3UNfO4zbgiUU7SRiSiXYgRegOu+XZ
         TlEcMzEFAQ/hWUSgVeLCvySx2E88uHSdflW1QsTdtyzjswb36SlbcoupHJQgTwQx5Ngr
         Pjso+3jTCFF4wiuX2nQwWb0AHKGLoJ0zc5OqRI1dsQqpOmvI7ywj1jKVHC7mG/sLw3I/
         8d73M6xr57IT9IVNBF/6VFH8TvQ5maLl5ehpUHoDmoW33GZPW1XHvRuRF1uAXIUBXbTv
         l6wYuT8mZ5RaRf/HovKPnuPzSZ37iURnRgbvh+Q+PZoSSEQ0Janx9dkd1aNUgWJjMRwD
         S3yQ==
X-Forwarded-Encrypted: i=1; AHgh+RqzTobJ8VXfk659zzS3UiUpB3KVrWwPGqhRhQlpKH4/PFTjcV/aF545nPh/wKhYgfk8eB6igvciZDeKbMTc0Whv@lists.infradead.org
X-Gm-Message-State: AOJu0Yyiieo25nNffy8nawyDe1OT1L7Jzm/dEBRZQZdCO4NGJPR/mLZo
	aqN79dQc/EjuBYeuc2ZsQ8wIQm5a6IEh0k7hk5Fbfpn8vbyJMSIta8mmWyc1n+UBPA==
X-Gm-Gg: AfdE7ck/LMPeEAyEECS5sxBnFp+GKm2zwpviy5FqvPjKIG4sdJWeCqG4lQLe1QWLqZo
	ZcSMzQH20dYQFOjpf8rOnGvQlZykOgzJKLmdwuXMDMr+eMZ9ySLTD+QqLRjCkxU+qDOEWqVqysg
	X6eqBtnlSUCc6XJz0xEymaqUd9akupqVmrfo52O1CZnETf0fv1rmwiz9GiyneuWzHIbmgaC1Bpo
	FCX95xOWhxRV2b8fgdr5Wj+DFfP2VNmeDPWm9dMAyJjOyGa7nwH2rnrsiX4oGFYWnVF7Fwxjdjf
	zgkdg0vCg/7pvQVXg6CB7+oM5hhLE6zOJ5elYlHSsrau+iJRO+AJ5rhO14Gv8j+qtWZaAW+xoEj
	HN43zMAa7IqRq2rUL7MjSv64tEQTI6PGUdAlaktVxpbSxut7m+TVDb/vJy1gZMh2dyyQYTF22o7
	XqGZv2k2hXUAtl29qQlUy+qWGSS6y77IGbJxOVxHdTO/y8dShMkDitAFXd+eJtakHsxbhiNCQK
X-Received: by 2002:a05:6808:1717:b0:496:976:acad with SMTP id 5614622812f47-4a4cef00846mr7898824b6e.1.1784645372728;
        Tue, 21 Jul 2026 07:49:32 -0700 (PDT)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com. [209.85.161.43])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a4d3cb035csm10116232b6e.11.2026.07.21.07.49.32
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 07:49:32 -0700 (PDT)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6a3ea601aa1so4012181eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 07:49:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpD3Yp96TFS4tGcnrOni6l9xrMm0qAzeJ1xI0PBjZ1B9GOHOwaDpeQReKcqGenylLhlRmuZhBtpB3h+NjeSwJxP@lists.infradead.org
X-Received: by 2002:a4a:ee0a:0:b0:694:85da:3f92 with SMTP id
 006d021491bc7-6a3ecd43928mr11855381eaf.17.1784645370351; Tue, 21 Jul 2026
 07:49:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260720162117.32304-1-fourdollars@debian.org>
 <20260720162117.32304-6-fourdollars@debian.org> <al52kpB1hklx5guG@ashevche-desk.local>
In-Reply-To: <al52kpB1hklx5guG@ashevche-desk.local>
From: "Shih-Yuan Lee (FourDollars)" <fourdollars@debian.org>
Date: Tue, 21 Jul 2026 22:49:17 +0800
X-Gmail-Original-Message-ID: <CAAT15mOxrJxb+jRf1P=yu=vXgDj9kRhrdSLkB8v4tEbhHOZ+Pw@mail.gmail.com>
X-Gm-Features: AUfX_mw226UgTY6rMnVPL8-sIg7vbBm9DW7Wdl6k0JdY8caXAiwtC13tS0iq5dM
Message-ID: <CAAT15mOxrJxb+jRf1P=yu=vXgDj9kRhrdSLkB8v4tEbhHOZ+Pw@mail.gmail.com>
Subject: Re: [PATCH v16 5/7] spi: pxa2xx: disable DMA for Apple MacBook8,1
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Mark Brown <broonie@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Lukas Wunner <lukas@wunner.de>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_074934_211360_18B5FAD6 
X-CRM114-Status: GOOD (  24.97  )
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

On Tue, Jul 21, 2026 at 3:27=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Jul 21, 2026 at 12:21:14AM +0800, Shih-Yuan Lee wrote:
> > On MacBook8,1 (early 2015 12" MacBook), the LPSS SPI controller at
> > 00:15.4 suffers from hardware DMA handshake failures and interrupt
> > routing bugs, causing keyboard/touchpad transactions to fail when
> > DMA is enabled.
>
> Why? The thing like this I noticed on some other HW which required differ=
ent
> DMA settings. Have you tried to investigate the issue more?
>
> > Move the forced PIO mode DMI quirk to spi-pxa2xx-pci.c (the LPSS host
> > controller PCI glue driver) to avoid layering violations in client
> > drivers (such as applespi).
> >
> > Add an explicit DMI match table for MacBook8,1 and a module parameter
> > spi_pxa2xx_force_pio to allow forcing PIO mode on demand.
>
> This looks like a hack. Please, if you have a hardware, try to dump the e=
rrors,
> collect the data corruption or timeouts and provide more information. DMA=
 for
> SPI on LPSS hardware never was a problem (unlike UART in some cases). I'm=
 almost
> 100% sure the problem is in DMA configuration / setting bits.
>
> ...
>
> >  #include <linux/dmaengine.h>
> >  #include <linux/platform_data/dma-dw.h>
> >   +#include <linux/dmi.h>
>
> Keep list ordered.
>
> >  #include "spi-pxa2xx.h"
>
> ...
>
> > +static bool spi_pxa2xx_force_pio;
> > +module_param_named(force_pio, spi_pxa2xx_force_pio, bool, 0444);
> > +MODULE_PARM_DESC(force_pio, "Force PIO mode (disables DMA) for SPI tra=
nsfers. ([0] =3D disabled, 1 =3D enabled)");
>
> No. There is no room for module parameters like this.
Hi Andy,

Thank you for the review and feedback.

Regarding your question about why DMA fails on this hardware, I have
just sent a detailed reply to Lukas in this thread outlining our
physical verification findings. In short, I confirmed that the
DMA controller's physical interrupt line is not functioning on this
motherboard, and macOS and Windows 10 also completely bypass the DMA
controller. Please refer to that email for the DMAR/IOMMU and
cross-OS analysis details.

Regarding your other comments:

1. Header Sorting:
I will fix the alphabetical ordering of the include headers in the
next revision.

2. The force_pio Module Parameter:
The original spi-pxa2xx driver is designed to hardcode DMA usage if
DMA channels are available. I introduced the force_pio module
parameter for two reasons:
  =E2=80=A2 It serves as a diagnostic tool for users on similar hardware to
easily test and verify if their issues are related to DMA.
  =E2=80=A2 It allows developers to easily test and debug the PIO code path=
 on
DMA-capable LPSS hardware to prevent regressions.

That being said, if module parameters of this type are strictly not
preferred, I am completely fine with removing force_pio and keeping
only the DMI-based quirk for the MacBook8,1. Please let me know your
preference.

Thanks,

Shih-Yuan

