Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FE5D7831C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 17:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CgvuKCN7J6YpKVI1K2eRbzWN5UKOCpkxDwdsMytbnaM=; b=btwJFMlk6lTYVBl3yiUBIrWUM2
	QjV+X3elnPVw4m9Bvi4l+GFTLB2B1gC0X6SIWjrnDdjtBdy4yyxDsP3dqhcFLqYKvt8lwLnY05mBk
	U/qnENhnmMgffxMQTPKSZWFlDoyWkdoVH8XkDJzsPpBIkUwshromiBhO7wCINdoETAXH8/7XnnsnJ
	fDX1s6O7QUosQrpUs7XEW8IxAS3iv4nzVicqyE33OgWFl8W5kXCc4kqcEg0LqOmhCz288e4y+1Scz
	8JdIDyN19z9PQOp+gKQkzd8Aq0nXy6iOYKO4aI33DiNujaad9qUevGJusy0yKsGsYrTwE93Zb5yis
	pRHTwwdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAKK-0000000726L-2mKG;
	Mon, 02 Dec 2024 17:35:16 +0000
Received: from mail-lj1-f170.google.com ([209.85.208.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAEl-0000000716K-2BYc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 17:29:33 +0000
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so43904751fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 09:29:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733160569; x=1733765369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CgvuKCN7J6YpKVI1K2eRbzWN5UKOCpkxDwdsMytbnaM=;
        b=YjQ3fes4pkiaAWXVfIVXr4q0ZLPSAdSBpphDnGNfmVCC3Xki8P3ZIiucYe+yCMS1V2
         mpnLuut0grqVrMvGui05V88m9qqvq0927KVmmQTD6r4y3r7MJvGEhQbNzfEfTRVCjNzQ
         BbOz+sIhtRm9yUYQ9QT9W5CHDHyvhY5ir6VdLUWFHdSKJi1/iXI6otVugHdxkXTU8Q5p
         Y7FY4C224Gl72pgobS1aOKpa7S40VsFZNWoKhuXYemN8+o7SdIIylJyJ2AvQJDwm/8K4
         eh43U3T3sj6mp3LPUI50/lFQ14T9rD2hSXs48IUfivsafJgi3c6x27OlGgDussX4qEsu
         wrdg==
X-Forwarded-Encrypted: i=1; AJvYcCX1ccM0JCrffCNv0wewWXCYL5JYt4UsbfZteyb0Zshtyql/pDm9Toh5oX/CNtpvqg+QZh8TZBF5p32jZzurMKQm@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5uYNi5R/3J1ZuYzWJHKbKEhbjHgnuiPgtMELjh6KU8upQLhLy
	rJymPv27xtTWLmJ8/GEFR2iK66dFWHbPb97COfBDopgTokHbSkNmuYRUAS4P
X-Gm-Gg: ASbGncv9CmiTmSJtJYGd78Z0G8iHEQfiXH2z1oN+f0Uu2KmVGBDZ1RJDnpDB6Ldegoz
	GCG24qfqLmlw+x2M4VgrCBpxgWzS4qj6JT47IOcKXfi8H649Waydy/Xm6pTLQ3wxACRi13Z9cXU
	7t8VGxg7RP4VZiigNgU2CdweGG881nSxHZuoie7m15Ip33eD7fXwFJN41iAjVAPGO++ud1szpDs
	Y6NLjCsE61Cc8Sc8F55+onjS2lAeo7+KmbQXMtezmlywux/PaVLEQGMkqjBwN7fmo3vQMkN7Xoz
	Z88O
X-Google-Smtp-Source: AGHT+IGXZOZsIIKFe9Pu0RBQikB/DrXGuHcUDvFHEhScNy61TZm9/A0xMjcH/c7fikVKdizh5oNAPA==
X-Received: by 2002:a2e:884a:0:b0:2ff:d7e8:b71a with SMTP id 38308e7fff4ca-2ffd7e8b7d8mr87988211fa.12.1733160568368;
        Mon, 02 Dec 2024 09:29:28 -0800 (PST)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5997d4101sm526557666b.73.2024.12.02.09.29.27
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 09:29:27 -0800 (PST)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aa53a971480so695328266b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 09:29:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVI4ja95bu4X8ak9LhIybDTvoZndRqeHUo9jotWr7mPAdbM4e4Q6/4JN/k9kP4/tN0pqYbSWAtVYHzEYOh6CU4A@lists.infradead.org
X-Received: by 2002:a17:906:c383:b0:aa5:451c:ce25 with SMTP id
 a640c23a62f3a-aa58105895amr1847466266b.43.1733160567637; Mon, 02 Dec 2024
 09:29:27 -0800 (PST)
MIME-Version: 1.0
References: <20241127-asahi-spi-dt-v1-0-907c9447f623@jannau.net>
In-Reply-To: <20241127-asahi-spi-dt-v1-0-907c9447f623@jannau.net>
From: Neal Gompa <neal@gompa.dev>
Date: Mon, 2 Dec 2024 12:28:50 -0500
X-Gmail-Original-Message-ID: <CAEg-Je-3w3koiqnAOMQO4RZ2DB+fRiSbZJSba-Z=L8OCF2B0Pg@mail.gmail.com>
Message-ID: <CAEg-Je-3w3koiqnAOMQO4RZ2DB+fRiSbZJSba-Z=L8OCF2B0Pg@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/5] Add Apple SPI controller and spi-nor dt nodes
To: j@jannau.net
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_092931_555757_077B4BAB 
X-CRM114-Status: GOOD (  20.29  )
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

On Wed, Nov 27, 2024 at 4:52=E2=80=AFAM Janne Grunau via B4 Relay
<devnull+j.jannau.net@kernel.org> wrote:
>
> This series adds SPI controller and SPI NOR flash device nodes to the
> man Apple silicon SoC dts files. Only the subset of used SPI controllers
> is added. Five SPI controllers exists according to pmgr ADT data but the
> commits only add controllers found in use on any of the devices. The
> parameters for the missing nodes are guessable but there's no point in
> adding them since no further M1 or M2 devices are expected.
> Together with controller nodes the first SPI device is added. All Apple
> silicon devices connect a SPI NOR flash to spi1. This holds Apple's 1st
> stage bootloader, firmwares, platform and machine specific config data
> and a writeable key-value store (nvram). Expose only the nvram as mtd
> partition since it has use beyond exploring the content. Tools from
> asahi-nvram [1] can modify the (default) boot configuration
> (asahi-bless), read Bluetooth sync keys (asahi-btsync) and read and
> write arbitrary keys (asahi-nvram).
>
> Devicetree bindings are included in the driver series. Last version at
> https://lore.kernel.org/linux-devicetree/20241101-asahi-spi-v3-0-3b411c5f=
b8e5@jannau.net/
>
> This series passes `make CHECK_DTBS=3D1 dtbs` with the spi bindings excep=
t
> for "local-mac-address" for the Bluetooth device (I need get back to
> this).
>
> [1] https://github.com/WhatAmISupposedToPutHere/asahi-nvram/
>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Hector Martin (1):
>       arm64: dts: apple: t8103: Fix spi4 power domain sort order
>
> Janne Grunau (4):
>       arm64: dts: apple: t8103: Add spi controller nodes
>       arm64: dts: apple: t8112: Add spi controller nodes
>       arm64: dts: apple: t600x: Add spi controller nodes
>       arm64: dts: apple: Add SPI NOR nvram partition to all devices
>
>  arch/arm64/boot/dts/apple/spi1-nvram.dtsi      | 39 +++++++++++++++
>  arch/arm64/boot/dts/apple/t600x-common.dtsi    |  7 +++
>  arch/arm64/boot/dts/apple/t600x-die0.dtsi      | 28 +++++++++++
>  arch/arm64/boot/dts/apple/t600x-gpio-pins.dtsi | 14 ++++++
>  arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi |  2 +
>  arch/arm64/boot/dts/apple/t600x-j375.dtsi      |  2 +
>  arch/arm64/boot/dts/apple/t8103-jxxx.dtsi      |  2 +
>  arch/arm64/boot/dts/apple/t8103-pmgr.dtsi      | 18 +++----
>  arch/arm64/boot/dts/apple/t8103.dtsi           | 68 ++++++++++++++++++++=
++++++
>  arch/arm64/boot/dts/apple/t8112-jxxx.dtsi      |  2 +
>  arch/arm64/boot/dts/apple/t8112.dtsi           | 44 ++++++++++++++++-
>  11 files changed, 216 insertions(+), 10 deletions(-)
> ---
> base-commit: 98f7e32f20d28ec452afb208f9cffc08448a2652
> change-id: 20241101-asahi-spi-dt-58245bb1da3e
>
> Best regards,
> --
> Janne Grunau <j@jannau.net>
>

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

