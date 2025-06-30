Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDCAC8302D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 13:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2I8CsrHjtRtD5BaYjtdOSFNgRck9IxhroTpwRBGBREc=; b=RZhci1zQ3ye7ctONo9AF7o4kiq
	9W1wzP1lAg0zqLSNaFVeXbiVVlYlWKbqDzBA/kybrgFX6HU5dx1SqwSX1FMli8m9pPPWVJAk7wO43
	B1XIiP69XewNIkyXspo/G4BT1bStKco+zohXjIhJGu7WtSoR7Nvc4gwCgLQ8AUxWuvJtljvy0ROBm
	xI7/sf60aMERdmBi6l3r14DTfDmitb7dII0Qr9YDNj8+OADXY1wewlfp0SJQfHU+6KvsHsKfMQZka
	bD3wgb5LvG4Tp8I9GXQO5kdrAowtYkrDRVgidNAWHCp2D+Ui2ZENNb0u/9eYvOlmwp/U2FDprvScA
	Y0cUQ8Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWEZ7-00000002NOS-1AS8;
	Mon, 30 Jun 2025 13:28:57 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWERw-00000002MD3-3aD8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 13:21:33 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6070293103cso3559064a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Jun 2025 06:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1751289691; x=1751894491; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2I8CsrHjtRtD5BaYjtdOSFNgRck9IxhroTpwRBGBREc=;
        b=Ix6EBxsjcDPgj7jw+pRVe0TkMecLkKL4m2T77UU8UZDj+1accR8CqIdaM/aQzyMx0H
         tYumDT2Hd33t6xgXjxhLBUXuthahSNyUvJgOBvLl5rkVbGFU5jBXgd5uL96NSVA8x0wZ
         jgzPnCbB01bBAbX5NTRWjQUgdMiG5c/8c3e8BJUKLsl8TerFFOIu8gGxQG8eUAsF5FrQ
         Wd85xUVCqkXnNGJV/JnpjoMPfzkF+TlyfV0tdt7LECxQGThxpbT/N7qlcFpJcXdm20AJ
         2B/jejTKN6nSGVSOkj5d5zxXUpSe8qqC/u1zIhFpBbJqpLf92YZ/mJEDCw8q/47A3IWw
         MyDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751289691; x=1751894491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2I8CsrHjtRtD5BaYjtdOSFNgRck9IxhroTpwRBGBREc=;
        b=hrdI5VE0KnbG2CFZUtiCrkyfrc5NKKD7xDw5Ggacs2WmrmZXMruzUEQFmk+Tpz5wu6
         jr+1ZhEiQC7XZX5p7WbiUjVWm825llvTPozSxduBjfx6f7ccJM2E6HB2CleoAHW8prp+
         ftUbqLknBfMz/1lkxKfdjbFWrs/7/FMZ2dphStTxILkLmahgnDqRZ2BjjklD6E36rXCQ
         uoR56ncWqtv3qVbGZ3ASEmPbBidSPXWeNC87bLYMSlTCuP+xtoDfga8L0BTROaUds3u0
         xT0vLX9U+E+G2YWBYLWLm5Xl0m8sTK6N2vuHidav8vx9Yo4NrTuWWOSC79nQkCZKGo4/
         GpBw==
X-Forwarded-Encrypted: i=1; AJvYcCWbA1boM5hzTRZyE1lWBWQHDVtuUh5nkInnY1KllmQGmwbV8eyg3hq9dYeEiAtE/6CjkF8eLTsRLK48N00sZTMQ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywmd91sLMqRj7bz3W+byffv47dptyFEEX+FVOOJQBtmwk0fQ1C7
	B1M2kgqPa0g95e6d3Mai8nVFD5qHsOQ5jC4sLfS+xJIH0n5ppcWkoeYnq9DyBxe+zaIYI+lBHdS
	6pnaqqnB+gMbeY9mCnBYGbh9i6c2W4mPBCjRmhL6BMg==
X-Gm-Gg: ASbGncsSpmMNW71NI94TFM6zjiU1JzZ3nI8fS1MZkT/0PSlhtzcpWptn3//v1fypgw8
	MUbinqbfYt+UKSB5Sv43t/Tckui3s5l4tyDx1OKEQqms98V9pNzuxNbBEhNHo8YNlPUMGNZWdRc
	yogqD8DbFBi2dIQ/g///Hqlu+kv8YEStdv4q59CZFz+s6QFiCaYMLW
X-Google-Smtp-Source: AGHT+IExvta/iWzBmIlIztBuCgl2cUU6u80HBaLHyHvJJXhxVNxMY8nK4KaXwhnRKNkDAhQ4ZeG0igRs73XqWwJLjCE=
X-Received: by 2002:a17:906:df08:b0:ae0:a88e:6f20 with SMTP id
 a640c23a62f3a-ae34fd88f8cmr778815366b.15.1751289691157; Mon, 30 Jun 2025
 06:21:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250613114148.1943267-1-robert.marko@sartura.hr> <3ba837f8-70bb-4b9e-a9f9-0e71b9e073c4@app.fastmail.com>
In-Reply-To: <3ba837f8-70bb-4b9e-a9f9-0e71b9e073c4@app.fastmail.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Mon, 30 Jun 2025 15:21:19 +0200
X-Gm-Features: Ac12FXxhA2Gp9rwQDhKKgV4ARb8lKQ6I8YMqCzExRny5q7pcafJNPwE_zl3e6I4
Message-ID: <CA+HBbNFd5hCKqUZY25Sws-o-0QALLue-JROyze_9biyuZZv4mg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250630_062132_893738_21AD2CD8 
X-CRM114-Status: GOOD (  19.79  )
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

On Mon, Jun 16, 2025 at 8:34=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Fri, Jun 13, 2025, at 13:39, Robert Marko wrote:
> > This patch series adds basic support for Microchip LAN969x SoC.
> >
> > It introduces the SoC ARCH symbol itself and allows basic peripheral
> > drivers that are currently marked only for AT91 to be also selected for
> > LAN969x.
> >
> > DTS and further driver will be added in follow-up series.
> >
> > Robert Marko (6):
> >   arm64: lan969x: Add support for Microchip LAN969x SoC
> >   spi: atmel: make it selectable for ARCH_LAN969X
> >   i2c: at91: make it selectable for ARCH_LAN969X
> >   dma: xdmac: make it selectable for ARCH_LAN969X
> >   char: hw_random: atmel: make it selectable for ARCH_LAN969X
> >   crypto: atmel-aes: make it selectable for ARCH_LAN969X
>
> If the drivers on ARCH_LAN969X are largely shared with those on
> ARCH_AT91, should they perhaps depend on a common symbol?
>
> That could be either the existing ARCH_AT91 as we do with LAN966,
> or perhaps ARCH_MICROCHIP, which is already used for riscv/polarfire.

Hi Arnd, I thought about this, but I am not sure whether its worth it
since we need
LAN969x arch anyway for other drivers that currently depend on LAN966x
or SparX-5
but will be extended for LAN969x (I have this already queued locally
but need this to
land first).

I hope this makes sense

Regards,
Robert
>
>     Arnd



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

