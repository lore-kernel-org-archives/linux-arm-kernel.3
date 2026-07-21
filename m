Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDDBC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 09:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RR5FCwNxjoPJGnHWZgDvk/8q8sjW5dLGxnRh7VR12B4=; b=IJKl9Efy5zTiJy0co24xaCS+Yj
	cCS0InUqnvoQpVBwLsl2Ll4PNiw+bOaX02ee1vLH4aKJtjQDNlLjprCNzmo42z5FBiTte9RJVWnkD
	kmxtcnXLPtuvhHcgQjs3X2fatp87ozmqWWhFPbtBBKwbRm+lmEn89kuK6/Eg2Yx/VCgG0pv8JskhG
	JgLEOgEp9lXOAVGgEMGs8H1HFQMsS2rEKRpR/Gk4Yz7bf0BeXB4GPA+PHCAw8l8zP58sZ9nC7Yrrn
	h0csml2NpBRQ6qHff6tabMTZzelFEMzQtJbCOa8s5XPxrOlR8mgUcOZGFniJXB+N38KHf5It18TDE
	PK+ukI3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6kl-00000008yhi-20TI;
	Tue, 21 Jul 2026 09:27:07 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6ki-00000008yhC-3s4C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 09:27:06 +0000
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7e9ecb1e13cso8381457a34.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 02:27:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784626023; x=1785230823;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RR5FCwNxjoPJGnHWZgDvk/8q8sjW5dLGxnRh7VR12B4=;
        b=esHZa8C4ppElHUgkqtWqgimN+pk5/okah4UutNoSOh3rApAbn0YR3qz8rSAnRLSJ3n
         tRZI2FNrQfHFIABH7arZGYbVt5TcHXajn4ge0/NGopg3lbiZw56PA1xib/3xog8NLjC7
         w7yxGQB0u2SfCM1fpuvqx+6u+rqAtXv6N0XulES7muux/r5JnO9aSLsliALHprL7RU1W
         JqVeEXe0WYt42EtUPCR0F/m2ATDs47EekOD3YhMpj33FZiF2WMqe78OyRdNeGen6UQfi
         q8hbeokjLJGRfLYxqzKK+sMNCwEgxOsJ+iaVlCwsPQkUPpZxGn1yQnwMI1227wbvYpqp
         dOYw==
X-Forwarded-Encrypted: i=1; AHgh+RrUHsURYRiTs10o7iiN1sw5NomL6fOZVtXCqHLpuGzmUtvuP15IsOMcWsm0XESEiktJH0YaEiuph9O61Q9ePFO3@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6MIyi+4FJtTtORPrbtJNEIAtVKW0BEL0hOh6GA10znfeQveQ/
	jteTYtWTi+0+ytaL6GrQWe5Um/Ssm5icmmoIh68IazmuZB4LB3Haf7dByJFjuw+i1Q==
X-Gm-Gg: AfdE7cmOdb+Bp6eom47KR0QSabnCa8omRKkH/ehqEdZpuk2HZe88qoBc7dACHPR2fDn
	YNqiKDzkZHXf4UFEqVMdh7mVMIIqv82YAUE4mS5Ut28dDAIUCns7ir2MW+7L2Hjp3HxmIM64bcU
	mHPOOT0hCZrgDKGhzbtbmASyFNSXrKiOCtWhAS37h8pCju97SVSlIy1WOQMTZ7qeJTWALMfP2tt
	xlVvZanHbN7Oyu2mEMbuM6d8QbzXsNHOaBPcSeVvQ5nlsqKZWa7NnuLTuIKxVQiUJ2T+NGaoYBa
	KaRFDnnDPtzjuEMznOR+hX6sA5WCH6TWL2fOBzWhJcT39kASZ9NNDmrRzEz5jSgpsDLRoYuPZMY
	0w2sldudIID4Nni1kuJkdYFzqny5HGLdl8jztJiKanzex2dI6hsj+Jd5Z0Mlh2yP38i0ThGk34e
	QBVq/lh94ezFm99ng1TfzCsAhWBBRUPf27NxxrL3+MAcRq0gTuDTHKAK0Y0TLrBOR3Xv3Xnkeq
X-Received: by 2002:a05:6830:44a2:b0:7e6:f7fb:967f with SMTP id 46e09a7af769-7ed9aa44bb7mr10407109a34.2.1784626023628;
        Tue, 21 Jul 2026 02:27:03 -0700 (PDT)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com. [209.85.161.47])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7edad959cccsm10414796a34.10.2026.07.21.02.27.01
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 02:27:01 -0700 (PDT)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6a397db52c1so6351984eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 02:27:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro3rLBeroWR0WA+NIdmx0tU4SWAE+QBWk70mpika6ZJvS3aLK0uFUqa1Rbhg5yVh4I9fmP9Lu2LgXybMuY2gNcb@lists.infradead.org
X-Received: by 2002:a05:6820:2d03:b0:69d:f864:d35b with SMTP id
 006d021491bc7-6a5366c9239mr9033615eaf.23.1784626020645; Tue, 21 Jul 2026
 02:27:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260720162117.32304-1-fourdollars@debian.org>
 <20260720162117.32304-6-fourdollars@debian.org> <al81PmK1UMr2g8p-@wunner.de>
In-Reply-To: <al81PmK1UMr2g8p-@wunner.de>
From: "Shih-Yuan Lee (FourDollars)" <fourdollars@debian.org>
Date: Tue, 21 Jul 2026 17:26:49 +0800
X-Gmail-Original-Message-ID: <CAAT15mPuO71WbbS2ZpWjceCVj3FUTqHLi3wbbeV7B33JHbPRsQ@mail.gmail.com>
X-Gm-Features: AUfX_mzuuwPmHgyXw6Iyg2W8TacSMSalEGr-6q-lNvhwWPNzfRxZgwfUu10AhGs
Message-ID: <CAAT15mPuO71WbbS2ZpWjceCVj3FUTqHLi3wbbeV7B33JHbPRsQ@mail.gmail.com>
Subject: Re: [PATCH v16 5/7] spi: pxa2xx: disable DMA for Apple MacBook8,1
To: Lukas Wunner <lukas@wunner.de>
Cc: Mark Brown <broonie@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_022704_960741_ED4698AE 
X-CRM114-Status: GOOD (  15.84  )
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

On Tue, Jul 21, 2026 at 5:18=E2=80=AFPM Lukas Wunner <lukas@wunner.de> wrot=
e:
>
> On Tue, Jul 21, 2026 at 12:21:14AM +0800, Shih-Yuan Lee wrote:
> > On MacBook8,1 (early 2015 12" MacBook), the LPSS SPI controller at
> > 00:15.4 suffers from hardware DMA handshake failures and interrupt
> > routing bugs, causing keyboard/touchpad transactions to fail when
> > DMA is enabled.
> [...]
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D108331
>
> In the bugzilla comments, Leif Liddy writes:
>
>    "I needed to modify drivers/dma/dw/pci.c to assign the DMA controller
>     irq value to 21 (which is what is listed in the ACPI table) for it
>     to work. The DMA controller was being assigned an irq value of 20
>     for some reason."
>
> It would seem better to fix up the incorrect interrupt number in a quirk,
> rather than disabling DMA wholesale.

This is a very good catch!

I appreciate the comment. Based on the Bugzilla feedback regarding the
incorrect interrupt assignment, it seems fixing the IRQ value via a
quirk is indeed a better approach than disabling DMA wholesale. While
I am not certain this will resolve the issue entirely, it looks very
promising. I will investigate the IRQ mis-assignment problem further.

Shih-Yuan

