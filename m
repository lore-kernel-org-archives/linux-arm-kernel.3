Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60CBFC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 22:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WUPInYN4PL/yK9hW5R5yIfO87gDLK/c9FX+2yDiavu8=; b=X45swwjXHXw8E2jmaN4aLbib99
	mFM4RWm4ngc5jMp+gmFQ8Myca00cSa/Tejr3TJhKSTFyYE3juSiD27hfUhyqWlwOnsKgCro3EO4fq
	2mBh1FbBfeCJF7AVaWKk+ztXSuGYUwGlFh5ahe+gr8jpYphs41ADrMjgQrv7LEpXLQAJE2yGBUf+e
	1sQXTlniFapBllP6hZ+u9ztgXjXBe6riSc4Hwnsnkj0LSQ0o0beF+ymZm6fjMkDLUjbWQ/71MREwT
	X5YK1rY8Pg7xkn4oexNq6Qy+olr7DNXyoc5c87Oza5xYBIBPNX0/P2QPlRKlRto9UFE4wR9x9SZ6B
	dOvr6DoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Pxs-00000000Vnh-1KZQ;
	Sun, 20 Sep 2026 22:24:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Pxr-00000000Vnb-0aEx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 22:24:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E27E7447CE
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 22:24:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C17481F008A1
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 22:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789943090;
	bh=WUPInYN4PL/yK9hW5R5yIfO87gDLK/c9FX+2yDiavu8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bZdIrP5zvfwLap8QfgPC6COgqkkxn0Rp0hb4PQKz9GA5pE0+W/gBasPcsR/EvdFSt
	 UXm6945/ajbswS+4XQ+4dx7fZeirRuIc+eZIGHIAumn/joKyaWlX0hyYa+o71uUG10
	 AIdFA1c7JncyvouIlGceLHUvQwE3Cf+5H3xPuexO1N/xCbK2b8EjoGGNqBgV16XJTs
	 MFWpLEeSjom1yw8Bz/I9F2JDOetHNwbGFCMbEnrt8GPy2HiXcaLxcva//65OIZKiBq
	 C2P5cn1+tlcTLioHtUKEGVz/r7KfY7fmx+OnX+W2CU8cI5BaUMibP55Z3XY37kQhmZ
	 ENLiItDcfxrmg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16cd1so2180634e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 15:24:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwLBNJzghznYFqLsROOvevDXH6VDAk+IEA7TDD0L6DbXVSbrfGbFHYFKrgoRsdJIoD/hubH5i3jkmci5AcM1pyw@lists.infradead.org
X-Gm-Message-State: AFuF++mSAe7Cm5wfBbjchjJMQFmftk9jyQEP6OTPJfypQ4DdxyFxE/2a
	8cxuvedj6vuTHveoYBP5zl3CAioZn4BY/z+rd961ntAYCrQRXFDMu1vwkBhN9BSb8NAmqBsJ8vd
	LR8k45AOLO1e047smDUoZ2HZFcBu+FDY=
X-Received: by 2002:a05:6512:4023:b0:5b6:1a7c:fd96 with SMTP id
 2adb3069b0e04-5b8c197532bmr2591380e87.60.1789943089466; Sun, 20 Sep 2026
 15:24:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com> <20260915-cv75-v5-v7-11-3297d3fbc9c0@ambarella.com>
In-Reply-To: <20260915-cv75-v5-v7-11-3297d3fbc9c0@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 21 Sep 2026 00:24:34 +0200
X-Gmail-Original-Message-ID: <CAD++jLmbK8AHth2qQ6O-Yh8m4_8uKL1cJdNFqBjnP1ssUe3+Pw@mail.gmail.com>
X-Gm-Features: AcwNN1WFNRVHMkwoIIIv3cjD7Ln9bstVj0LBZyLRdnKTtq0jQLXH6pVRP5eDyRQ
Message-ID: <CAD++jLmbK8AHth2qQ6O-Yh8m4_8uKL1cJdNFqBjnP1ssUe3+Pw@mail.gmail.com>
Subject: Re: [PATCH v7 11/15] gpio: pl061: add Ambarella register-layout variant
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Tue, Sep 15, 2026 at 1:15=E2=80=AFPM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> From: Long Zhao <longzhao@ambarella.com>
>
> Add a 32-bit, 32-line layout with DAT/DIR/IS/IBE/IEV/IE/MIS/IC plus
> MASK and ENABLE. Probe unmasks the bank and enables the controller.
> IRQ type changes also clear the pending bit. This derivative does not
> need write-after-direction or system suspend save/restore.
>
> Match the part with designer AMBA_VENDOR_AMBARELLA (JEP106 identity
> 0x68, bit 7 set) and part number 0x061.
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

