Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14314C2A075
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Jan 2026 12:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jOcOqesuAR1iEqO861Hz9Coczbh82WeriqgyEjsikD4=; b=fM5xBp9A96crD2KyzzQskYfIqT
	A0rJe6Mif3opka072HAPrqkCLCnQ3jhQJ6x5EONO9oVZMktBm24jPX35ncg/W1zi9KZeYPae4dA3+
	BxLDuvpIHpw9wBdutbYE4y5NuXBie/hJN+xxo4W8ImHcMeu7wnrIwziDl/VgN9eI7bHkrTdhlMvK3
	R4WKUgjo6zClDctwou4MzsfNrT+IOuP/QZLxWV1J98gQyMl4/fIMgUi749v57xJJyPgd37mrPVR6H
	MguJR00LqrVHttHTi4XZNoV56itS4vEZ/CuFG3KyOwhVr/Z9JWI02KbfvpLrKqotMTrJS9fadRuyh
	suoUDUDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcMtB-0000000ADhY-1ZpY;
	Sun, 04 Jan 2026 12:07:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcMt8-0000000ADhI-3jSE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Jan 2026 12:07:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 35CF06013A
	for <linux-arm-kernel@lists.infradead.org>; Sun,  4 Jan 2026 12:07:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA307C2BCAF
	for <linux-arm-kernel@lists.infradead.org>; Sun,  4 Jan 2026 12:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767528433;
	bh=NNvyyWX4s6zQYzEi25YKiL7e8RXhkosrjifCZD5E5vw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=F99sMSqNtKTS1XOYzCZAbP2BarfQXFGKiyZIqMFQ3MBN7uUtVsClTC7njmSl1zKI9
	 I8uzTVclg7H7khUTrO2CXFXpMMTJObChinfcQ2uZDU1fPFquEJNeR1VvV6EirdIRCL
	 /Hv9WvKdWVErg68rrbxuIvYUp4xen4Ivl3ulfo2Rb9hvdtf13Mw22h+UWmQLCwQbil
	 yqIhjWYuD3zZW7hpBJbfRThNhXXBJ1jI0KVqlTymYySj6ZMPzrw5O/lEa37p9BL/Au
	 8rEb0hdAP6+vR7yz2LvpI6pG2grngZjsOOgK1uPMLMfQKrITXfTlz3np8YP3Eb4B1Z
	 XLsXNB4WIx4BA==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-78fc4425b6bso81427197b3.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Jan 2026 04:07:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWxmX7ZANF9IRcC2EOevEoPZFm1cuPETYVGhWcW4C5ous1ixffzy8kzn1fKUe4o5QjtRHUprMF/AjA69oPU1eaM@lists.infradead.org
X-Gm-Message-State: AOJu0YyzRtnHIRSDoQgbUaB3t1J1kavwCrCFyJu6qjAKxW2DByQr+JyH
	xb2TELA6ZCIKKSa38T5ziREw617TvvaBjcoGQWIjHOhqvpiPXHxls15yNeK97p3hoO0Y013KboT
	rXomQTWtciRDXQDmtSMq/zvxKlFtUUfY=
X-Google-Smtp-Source: AGHT+IEmQp6cbGwTzqXge1KwHKoG+z5w5e3WneR+07MNzdrKCIkhm3jWBiwRI4b1zlZsBGsG3/Wbao0TEUuNqyOu0lo=
X-Received: by 2002:a53:eb84:0:b0:640:cc09:b7c8 with SMTP id
 956f58d0204a3-6466a842a27mr27876038d50.23.1767528433144; Sun, 04 Jan 2026
 04:07:13 -0800 (PST)
MIME-Version: 1.0
References: <20251227114957.3287944-1-ye.zhang@rock-chips.com>
 <20251227114957.3287944-8-ye.zhang@rock-chips.com> <ebb720f6-4756-437f-a71a-d94f45d732e8@kernel.org>
 <0de0f505-5858-4ea6-85a7-4c386ac205e9@rock-chips.com>
In-Reply-To: <0de0f505-5858-4ea6-85a7-4c386ac205e9@rock-chips.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 4 Jan 2026 13:07:02 +0100
X-Gmail-Original-Message-ID: <CAD++jL=Dv9Ad3EN_+WsD=tKVZORTbW5xcPaJUx3Zi7DNyvzruA@mail.gmail.com>
X-Gm-Features: AQt7F2rYKwRUFgA0GUo1cru6R2kIwdvHzJq_1rhGARF7vZUzJm-EZk1Pe49KE1M
Message-ID: <CAD++jL=Dv9Ad3EN_+WsD=tKVZORTbW5xcPaJUx3Zi7DNyvzruA@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] ARM: dts: rockchip: rk3506: Add pinctrl and rmio
 dtsi for rk3506
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tao.huang@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Dec 31, 2025 at 9:18=E2=80=AFAM Ye Zhang <ye.zhang@rock-chips.com> =
wrote:

> This file is auto-generated to provide a complete set of RMIO
> configurations.   Our intention is to offer a generic library for all
> future board developers, so they can simply pick the needed nodes by
> phandle without manually looking up register values in the datasheet
> every time.   This improves usability and standardization.

That makes it even more important to use the standard pinmux =3D <>;
property in pinmux-node.yaml for this instead of custom properties.

If you establish a standard, then use a standard.

We have two ways of doing pin control in DT:

1. Use strings for groups and functions.

    function =3D "uart";
    groups =3D "uart-tx-rx", "uart-cts-rts";

Since a lot of people really, really like to shoehorn a lot of information
into the device tree instead,

2. Use pinmux =3D <....>;

This is an opaque property that contains magic numbers. By using the
pinmux properties, developers and maintainers know that this is some
magic numbers that sets up the mux.

No custom invented properties please.

Historically old properties like rockchip,pins exist for the same purpose
of pinmux =3D <>; but this needs to stop and migrate to the standard
bindings, not proliferate.

Yours,
Linus Walleij

