Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428D7C83013
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 12:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rPV93Zxqd5A5yWh1+OQ3kXQBktcCdNYnO7HGfnoF97w=; b=2hhn/xHrEy4F1d8WIN9Kpt8pYf
	AlrqdUw3MHepAgy8Ii8BXh48IQHkDqPmGoHoYBr0MqjGs7FeU7GlPCgp0VyomaoBZQ4A3kZYUc2Od
	NhOTi+Y+Qzi2+XCVQPr5pqYsQhrI8M7KaKezvitDb+dY7fZ1/N5L6Np4q3BvdJjx7fd6UsATqimXG
	bsWamR99yLUzQced5OA9wutFxfQZudFXdzjGjqvkmhXS0gRQnpzmKAskUL7L2G/JeA9MEWP+51Jkz
	CRWIn54OV4So9N9wl48bKfCWL27hZVNIRYSfHvf+hVc5x6+h2OCtRyYhb6Qj1eNHCHSmYGS9BhEpp
	Ggs52cxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwHC-00000008Fx0-0ASQ;
	Wed, 02 Jul 2025 12:09:22 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWvJR-000000084xo-0VDd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 11:07:38 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-607cc1a2bd8so7231982a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 04:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1751454455; x=1752059255; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPV93Zxqd5A5yWh1+OQ3kXQBktcCdNYnO7HGfnoF97w=;
        b=Rxeyp/mvyxtXbO1kIIeDKRrrZrOCBKp0WSqfk1voT/knjTZYeQfxMOx2tZ9AroRUqf
         wDX1Z3IwL+RQ76JT7YyWBis7L183s9QUy54igAxj6MSy352s6FMl14mOSGOQbr5RhzJ6
         MKrYtO/A1S7ySsMgZ6x3yJAZy4EInr0HlgeA+PONhDy7S2QPICqoJqfZ0a2/lCijFwOV
         kyvLzAUIRJQAoosrLEhzOCEjYwmYYy6fqZVzlEHlIdUcSVUdzCiGM8ZLYYTasUXPpsnx
         JjOBTt0tLUnY9YjzmVJOOfkHH7dCuUrV3ITGZnc+0Va4CeQTJU5HkIbEGhNfXPWUNoe7
         t8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751454455; x=1752059255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rPV93Zxqd5A5yWh1+OQ3kXQBktcCdNYnO7HGfnoF97w=;
        b=E1XgxWzzQjipW8HdX9eh0GbZT9leugpxTrebq/rt8lO/pCa/hNk1iOppRgRgFus7b9
         g/tXVIG7UJZuVOAE/BqtCwM5HTaA5p5jkz5jgki3A6tT7sAYW5J80Ws0c21rdn0Z6dnL
         JrQNguaJirQG2Fb3iMZxCB5Tm4roE5hTX5bd1r3q8osQ7bB/MbLTZ+Gcg6lBJx3xRlqk
         KmeP/reyVg6znUaOaju2+o9l2d5xfcnWnsAlrIdu+HjCPSLgnfI3PZHqUhalL1xG8doB
         /b3WJ5JFxhDFuJPnqf/I9/c1EvD76H+xkmo9kOQT6Oqa52SGqU8jNsuBgKg15PpUmAQ8
         vA6A==
X-Forwarded-Encrypted: i=1; AJvYcCUxM0LueJ91/L27BST0XP5J9DW6eGVTk09d/D9j1QgPc2S30vDjea87IcmtWfQvK2BFhGjLY1rcgIsCOYLMh5c9@lists.infradead.org
X-Gm-Message-State: AOJu0YwekKNLaN81V5mdh+meQZ466bJi0+grul3+hB6r98CbQMapaz4R
	qYCxSi9qAnuezhjvoyBr9d3pxFhywKq/ZPcbxWxZblomHuhv4vEXRrsI3NsqQuSzZHtUkvF4gnf
	CfA7eCAdjL4y76Ogab438jiHA5br8BR6mGAS+Un2OlQ==
X-Gm-Gg: ASbGnctFdXgP073vmrOo35m4qyKXMg3yZhoRTWuI2YRKZ1LK7BNr3Idw2Meu0tWvwoZ
	+ejk+HZe+vOpwI8yubzsPMVLoUI/raqzjQfFCrLeVqWsmARTfKDQoKowVgdvnuOrlgvaio2e10L
	QsV8C/qg+aMHhzYv2iOmfReXTAjpJZQgsyIcxdwJglsBBb
X-Google-Smtp-Source: AGHT+IHeGpjjGYCSscOTPbZ6xb8rb5MXGznl/2SBz7yoEFM7auQsCbFTVHuUlPyoGrfnlhoMTudLPILywpv+/3CBf3c=
X-Received: by 2002:a17:906:c358:b0:ade:470b:d5ac with SMTP id
 a640c23a62f3a-ae3c2c7d588mr194441366b.56.1751454454694; Wed, 02 Jul 2025
 04:07:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250613114148.1943267-1-robert.marko@sartura.hr>
 <3ba837f8-70bb-4b9e-a9f9-0e71b9e073c4@app.fastmail.com> <CA+HBbNFd5hCKqUZY25Sws-o-0QALLue-JROyze_9biyuZZv4mg@mail.gmail.com>
 <3e522dcc-3b68-4137-bd3a-dcc2c889dbd3@app.fastmail.com>
In-Reply-To: <3e522dcc-3b68-4137-bd3a-dcc2c889dbd3@app.fastmail.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Wed, 2 Jul 2025 13:07:23 +0200
X-Gm-Features: Ac12FXxa3OU2rP7QnwGpqKyk1qKa-0zp1Qh_CY94xN7qIB9S3-V2AaGGog_Qezo
Message-ID: <CA+HBbNF6zfy=D=+34HXBPdzsfHo6aDbhcJa7Tf7YitYedK1a6A@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] arm64: lan969x: Add support for Microchip LAN969x SoC
To: Arnd Bergmann <arnd@arndb.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S . Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Mark Brown <broonie@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, ore@pengutronix.de, luka.perkov@sartura.hr, 
	Daniel Machon <daniel.machon@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_040737_175256_FDCB394A 
X-CRM114-Status: GOOD (  29.68  )
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

On Mon, Jun 30, 2025 at 3:54=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Mon, Jun 30, 2025, at 15:21, Robert Marko wrote:
> > On Mon, Jun 16, 2025 at 8:34=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> w=
rote:
> >> On Fri, Jun 13, 2025, at 13:39, Robert Marko wrote:
> >>
> >> If the drivers on ARCH_LAN969X are largely shared with those on
> >> ARCH_AT91, should they perhaps depend on a common symbol?
> >>
> >> That could be either the existing ARCH_AT91 as we do with LAN966,
> >> or perhaps ARCH_MICROCHIP, which is already used for riscv/polarfire.
> >
> > Hi Arnd, I thought about this, but I am not sure whether its worth it
> > since we need LAN969x arch anyway for other drivers that currently
> > depend on LAN966x or SparX-5 but will be extended for LAN969x (I have
> > this already queued locally but need this to land first).
>
> I think in that case we would want one symbol for all of the above.
> We have a couple of cases where there multiple SoC product families
> get handled by a shared config symbol to make life easier for the
> kernel:
>
> - ARCH_IMX contains multiple chip families that are now owned
>   by NXP but that have a complex history with acquisitions and
>   product families that mix-and-match IP blocks, similar to
>   Microchip
>
> - ARCH_EXYNOS contains chips from Samsung, Google, Tesla and Axis
>   that all share a lot of components because they are all based on
>   Samsung designs
>
> - ARCH_BCM contains several chip families that all started out
>   in Broadcom but actually share very few common components.
>
> On the other hand, we have TI with its davinci, omap, omap2
> keystone2 and k3 platforms, or Marvell with orion, mvebu,
> pxa, mmp, octeon, octeontx, thunderx and thunderx2 platforms
> that overlap to varying degrees but use separate Kconfig symbols.
>
> Since you already have an ARCH_MICROCHIP used by one of the
> microchip platforms, the simplest approach seems to me to
> include at91, lan969x, lan966x and sparx-5 under that as well.
> You could just select that symbol from each of the four
> and then change any driver that is used by more than one of
> these families to use 'depends on ARCH_MICROCHIP' instead of
> listing them individually.

Ok, I get the idea, I will rework the series to pivot to ARCH_MICROCHIP.

Regards,
Robert

>
> I assume the mips based PIC32 and VCOREIII (ocelot/jaguar)
> are distant enough that they wouldn't share any drivers with
> the other families any more, but they could be put into that
> as well if that helps.
>
>      Arnd



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

