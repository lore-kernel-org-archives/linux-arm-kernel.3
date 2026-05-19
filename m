Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21019CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 02:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQP6saiiXAQJTpPARLrRFM0Ns2dwyXRFEWBvIe0BZcE=; b=T4tJBbVThKTXhLuUKlGWk57rYK
	lY1bA71u5NB9Ma8SJr4fgft3yQzMS6kaHpX5Difd6MjtOqkSCEYgyDjIgq60irzkNJkq5VH8RwDCh
	j2KpxIjUotdUAv9IGA6lbQdl6VxUmeatb2C6NgncrsFULv0SQvNuk7tAkz2+MikNNy8XDrB6kD1aY
	KIY3ZlrHivHlW02fOaNWMtM1N6RMaSMKbqzMEWalpBsv7ff5PIsw6voJpuBkuMU4VtVBwEb/7AkDd
	SQWbmu6TwjKjuByaNBeQvCfOEcJht8YxfWti0uYfy1dt+/RykC7C72W4QBm/Y+J+I4J+VZUpdI36o
	Tr06XV7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPAUI-0000000HVen-3VVE;
	Tue, 19 May 2026 02:47:18 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPAUG-0000000HVe8-1YJQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 02:47:17 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-38e7d983f91so32654781fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 19:47:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779158834; cv=none;
        d=google.com; s=arc-20240605;
        b=es3Z8np1xUkBr45EWXYWpaWdCkehoZRKHBgQG0Rx98po3S6tA8+/C2x6C//y7bKJIe
         /bKDksMrXs53cIo8UWcai4CnujbJfJt+bawJ+7JePkAypADYhujt76l0kUNH31wWYblW
         uRTTRHpM1xVSQJOR3FXKb5RH7P+IZYp3It4UDfjOcM83xjmw36zUh9sDmI8RV+vu1NqG
         VMjgK6pMD2NL6OZE3r6yqE7jPlpIGu5pSL48g4wK5FaSXNmkpseIvRnexhB99LvMGhed
         sMEGW6XcSq84kzrf5jigQiKZCF8NP5AXgBqzlQMvqZcR36KCW7T809/aYH1EYsPGPxyW
         GRog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RQP6saiiXAQJTpPARLrRFM0Ns2dwyXRFEWBvIe0BZcE=;
        fh=5dnz1XebJU8e14eXQFQWgzgwOHacz1ddUxA/mPCXxTQ=;
        b=gUNeYZVZbv2E4YeAuBMtUYM7VPhG7ZKtFIJhi+dxfO4vDvI7kTklxzZDfys9Odpgbh
         G54lktHJ/mdL8029S2HahENoFqXBY3o03wMaGh0fSftyvwPUFa71uwTLc6i8mLc44LWI
         HVSfvQrAasrwKv9HGh99sWS7lkH1skZSO+uq31BKLITOAYKs3c96wFoG6k2N2fQz4Aiu
         qb9wU4fOcnnfqtnIA5NvvAbEXvBq5/yfRfin/ppyo3vOLDc679ypI7yWnht/fw4gXkrG
         LQVbaWa7N3Y359lcCbyATQF/bvNjAJeyJY+oK0Qoers4BM6OMulgM0vCwoEowZ6HtQXn
         eHCw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779158834; x=1779763634; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQP6saiiXAQJTpPARLrRFM0Ns2dwyXRFEWBvIe0BZcE=;
        b=OIGZ6gvz0sYAINy114zyJelEI+4Ili1rh0KJvyiUfdiQurfhpGcFqVeRISS/ewueZs
         I2b861YDd73sOIRYWysbKxNSU05el/k3VKZMZ6GiONmFszaf7REw6doVq3X+TEZqrWtD
         K0gnZnwAD/nfyJmb4Hwa61v7To3DV6eJWMgcJYv4lJ4B2tr5cM0ExXlM/dCxe7OWabij
         awLyquuItJMHnk2vaAAffDIaWuTdEEmVZSKeKNNJBbBuwUKdyjQExEBLJivOOVxy+Ji3
         2FAH8kzc/6SyIiOyH3ljj0J+eN9G07xQFw9EfQZmnR3v1TGB7Bi+OTS4JD9wmFqDZjfH
         NwSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779158834; x=1779763634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RQP6saiiXAQJTpPARLrRFM0Ns2dwyXRFEWBvIe0BZcE=;
        b=RUKFsv5aWEzqUBojYvC+C9D3FEjpUcRgTSl/s9N773FLiFAL5OV9khsfOr7SX4TGaF
         If+lW9oONMPqGOakqtbzpNRGHmdAmfaSsN0eKh/8Nj3jZykCYGQsryTKETBpl6XLIauA
         KhLm43orJVyHmIXDzUJYIG87uOOLq1HBCh0j/rk1WzKhyeXzpzTxggX5oCW6vck1dTgo
         V5OI6os3zozQSYDqJEy9DN6Evsv5oOxbyP5JrcfPJ++UPT1QJJviWtY0ldY1yluw5KNw
         dcqtHz/einaGuHda8j1yUdkjHDF3RAcM3ugidNgNzlLeeTubQ2yan//SPShuvYY+8GyL
         Y47A==
X-Forwarded-Encrypted: i=1; AFNElJ8ZWi3htvDpwUfM7ZuD6ksGnk22lFLlmFsuvsGc5mwaYE7J8AlfzECM2t32zCDg3GQPRQx4fRTNrlKUu8P4gjBQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwqHLpg5HVZXdhzHYL+HGB5Dv4AcbxxGrvR1m/o5Y+d7c/IEOy8
	LDXzfZG12qbFTszT2KoYRIpuqSm9IHt+P8noWRLwc73IDVacN3SF8DFW+rJ6iPsXgsdQsUNzcIn
	sUsSp/LRTztyF/YbH6vnb0KcQAd3nmUI=
X-Gm-Gg: Acq92OHp/LRePLIE4urMfLelrXTojsLH5mjWR5EX62kotNHTEXSBk2il1E6vtYdexLj
	rBD6CysHfz+i0jO7j42hRdMYK/KCRwqoUy0p8a3RBs23uwpCXYsPjPXoEDAH1dPSwYDOicXSE1p
	1Ob4Sjof2ByWvbmnYPYuGPN0qZW0XE+72qO0GoXWmvJAdoclNjrmCGEwr1r+hok7UR/teRQ9a2p
	F38gXbqzuXrVUGLvzaDrG2ZZTYgGWI5e7KMtON7wq56uwFkhrbNkbQg+H3MyVSfntks/7ws92+t
	ckB7DfIUUIKysMKGoVY=
X-Received: by 2002:a2e:bc20:0:b0:38a:45d6:c246 with SMTP id
 38308e7fff4ca-39561c36019mr54660351fa.8.1779158833823; Mon, 18 May 2026
 19:47:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260424-ventura2_initial_dts-v4-0-806b00ea4314@gmail.com>
 <20260424-ventura2_initial_dts-v4-2-806b00ea4314@gmail.com>
 <39b9a80fe4f49d72cefb8d3f8f1bb3776b9c4226.camel@codeconstruct.com.au> <CAF7HswPn65kvTAyYDj_o=nSn3YhQhKqBaak7nt11x-8bZ7M6vg@mail.gmail.com>
In-Reply-To: <CAF7HswPn65kvTAyYDj_o=nSn3YhQhKqBaak7nt11x-8bZ7M6vg@mail.gmail.com>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Tue, 19 May 2026 10:48:19 +0800
X-Gm-Features: AVHnY4KpR8_SQLN5ycWULCDf5UkEJu74K_EZDZzPg05Smr9riqQITU4BSYjRqBM
Message-ID: <CAF7HswNLqxZA2-2Mh49zk+mV=oTbyw4UrmJTVe3HESZqCL9rGg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_194716_630535_C475BEC9 
X-CRM114-Status: GOOD (  35.14  )
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

Hi Andrew,

On Tue, May 19, 2026 at 10:38=E2=80=AFAM Kyle Hsieh <kylehsieh1995@gmail.co=
m> wrote:
>
> On Mon, May 18, 2026 at 3:18=E2=80=AFPM Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
> >
> > Hi Kyle,
> >
> > Firstly, are you trying to represent multiple revisions of the hardware
> > design in this devicetree? I'm curious due to the 'legacy' labels
> > below.
> >
> In the previous Ventura hardware generation, these pins were
>  implemented as a set of direct, native physical GPIO signals. In the V2
>  design, we introduced alternative interfaces and routed these paths
> through the CPLD to convert them into GPIOs before reaching the
> BMC.
>
> We chose to retain the 'legacy' prefix to maintain backward
> compatibility with our existing userspace software stack and scripts
> that transitioned from the previous Ventura platform. Altering these
> labels now would break compatibility with applications that rely on
> these specific naming conventions. I will add comments in the DTS to
> clarify this context.
Please allow me to add a crucial hardware detail to my previous
 explanation regarding the 'legacy' prefix.
I missed mentioning the most important point: on this specific ventura2
board, we actually have two distinct sets of IO expanders physically
present at the same time to support both new and older tray interfaces.

The new design utilizes the PCA9698 at gpio@40, which is already
labeled as prsnt_io_expander0. However, to maintain hardware
backward compatibility with older trays, the board also physically
retains the previous PCA9555 expanders at gpio@11.

Therefore, since the prsnt_io_expander0 label is already occupied, the
legacy_ prefix is strictly necessary to avoid
devicetree label collisions and to explicitly differentiate the two
physical hardware paths.

I will make sure this hardware context is clearly documented in the
DTS comments in the v5 patch.

> > On Fri, 2026-04-24 at 17:30 +0800, Kyle Hsieh wrote:
> > > Add linux device tree entry related to the Meta(Facebook) rmc-node.
> > > The system use an AT2600 BMC.
> > > This node is named "ventura2".
> > >
> > > Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
> > > ---
> > >  arch/arm/boot/dts/aspeed/Makefile                  |    1 +
> > >  .../dts/aspeed/aspeed-bmc-facebook-ventura2.dts    | 2925 ++++++++++=
++++++++++
> > >  2 files changed, 2926 insertions(+)
> > >
> > > diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/as=
peed/Makefile
> > > index 9adf9278dc94..6b96997629d4 100644
> > > --- a/arch/arm/boot/dts/aspeed/Makefile
> > > +++ b/arch/arm/boot/dts/aspeed/Makefile
> > > @@ -32,6 +32,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> > >       aspeed-bmc-facebook-minipack.dtb \
> > >       aspeed-bmc-facebook-santabarbara.dtb \
> > >       aspeed-bmc-facebook-tiogapass.dtb \
> > > +     aspeed-bmc-facebook-ventura2.dtb \
> > >       aspeed-bmc-facebook-wedge40.dtb \
> > >       aspeed-bmc-facebook-wedge100.dtb \
> > >       aspeed-bmc-facebook-wedge400-data64.dtb \
> > > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dt=
s b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
> > > new file mode 100644
> > > index 000000000000..8d4ddb473862
> > > --- /dev/null
> > > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
> > > @@ -0,0 +1,2925 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +// Copyright (c) 2023 Facebook Inc.
> > > +/dts-v1/;
> > > +
> > > +#include "aspeed-g6.dtsi"
> > > +#include <dt-bindings/i2c/i2c.h>
> > > +#include <dt-bindings/gpio/aspeed-gpio.h>
> > > +
> > > +/ {
> > > +     model =3D "Facebook Ventura2 RMC";
> > > +     compatible =3D "facebook,ventura2-rmc", "aspeed,ast2600";
> > > +     aliases {
> > > +             serial2 =3D &uart3;
> > > +             serial4 =3D &uart5;
> > > +
> > > +             /*
> > > +              * i2c switch 0-0077, pca9548, 8 child channels assigne=
d
> > > +              * with bus number 16-23.
> > > +              */
> > > +             i2c16 =3D &i2c0mux0ch0;
> > > +             i2c17 =3D &i2c0mux0ch1;
> > > +             i2c18 =3D &i2c0mux0ch2;
> > > +             i2c19 =3D &i2c0mux0ch3;
> > > +             i2c20 =3D &i2c0mux0ch4;
> > > +             i2c21 =3D &i2c0mux0ch5;
> > > +             i2c22 =3D &i2c0mux0ch6;
> > > +             i2c23 =3D &i2c0mux0ch7;
> > > +
> > > +             /*
> > > +              * i2c switch 1-0077, pca9548, 8 child channels assigne=
d
> > > +              * with bus number 24-31.
> > > +              */
> > > +             i2c24 =3D &i2c1mux0ch0;
> > > +             i2c25 =3D &i2c1mux0ch1;
> > > +             i2c26 =3D &i2c1mux0ch2;
> > > +             i2c27 =3D &i2c1mux0ch3;
> > > +             i2c28 =3D &i2c1mux0ch4;
> > > +             i2c29 =3D &i2c1mux0ch5;
> > > +             i2c30 =3D &i2c1mux0ch6;
> > > +             i2c31 =3D &i2c1mux0ch7;
> > > +
> > > +             /*
> > > +              * i2c switch 4-0077, pca9548, 8 child channels assigne=
d
> > > +              * with bus number 32-39.
> > > +              */
> > > +             i2c32 =3D &i2c4mux0ch0;
> > > +             i2c33 =3D &i2c4mux0ch1;
> > > +             i2c34 =3D &i2c4mux0ch2;
> > > +             i2c35 =3D &i2c4mux0ch3;
> > > +             i2c36 =3D &i2c4mux0ch4;
> > > +             i2c37 =3D &i2c4mux0ch5;
> > > +             i2c38 =3D &i2c4mux0ch6;
> > > +             i2c39 =3D &i2c4mux0ch7;
> > > +
> > > +             /*
> > > +              * i2c switch 5-0077, pca9548, 8 child channels assigne=
d
> > > +              * with bus number 40-47.
> > > +              */
> > > +             i2c40 =3D &i2c5mux0ch0;
> > > +             i2c41 =3D &i2c5mux0ch1;
> > > +             i2c42 =3D &i2c5mux0ch2;
> > > +             i2c43 =3D &i2c5mux0ch3;
> > > +             i2c44 =3D &i2c5mux0ch4;
> > > +             i2c45 =3D &i2c5mux0ch5;
> > > +             i2c46 =3D &i2c5mux0ch6;
> > > +             i2c47 =3D &i2c5mux0ch7;
> > > +
> > > +             /*
> > > +              * i2c switch 8-0077, pca9548, 8 child channels assigne=
d
> > > +              * with bus number 48-55.
> > > +              */
> > > +             i2c48 =3D &i2c8mux0ch0;
> > > +             i2c49 =3D &i2c8mux0ch1;
> > > +             i2c50 =3D &i2c8mux0ch2;
> > > +             i2c51 =3D &i2c8mux0ch3;
> > > +             i2c52 =3D &i2c8mux0ch4;
> > > +             i2c53 =3D &i2c8mux0ch5;
> > > +             i2c54 =3D &i2c8mux0ch6;
> > > +             i2c55 =3D &i2c8mux0ch7;
> > > +
> > > +             /*
> > > +              * i2c switch 11-0077, pca9548, 8 child channels assign=
ed
> > > +              * with bus number 56-63.
> > > +              */
> > > +             i2c56 =3D &i2c11mux0ch0;
> > > +             i2c57 =3D &i2c11mux0ch1;
> > > +             i2c58 =3D &i2c11mux0ch2;
> > > +             i2c59 =3D &i2c11mux0ch3;
> > > +             i2c60 =3D &i2c11mux0ch4;
> > > +             i2c61 =3D &i2c11mux0ch5;
> > > +             i2c62 =3D &i2c11mux0ch6;
> > > +             i2c63 =3D &i2c11mux0ch7;
> > > +
> > > +             /*
> > > +              * i2c switch 13-0077, pca9548, 8 child channels assign=
ed
> > > +              * with bus number 64-71.
> > > +              */
> > > +             i2c64 =3D &i2c13mux0ch0;
> > > +             i2c65 =3D &i2c13mux0ch1;
> > > +             i2c66 =3D &i2c13mux0ch2;
> > > +             i2c67 =3D &i2c13mux0ch3;
> > > +             i2c68 =3D &i2c13mux0ch4;
> > > +             i2c69 =3D &i2c13mux0ch5;
> > > +             i2c70 =3D &i2c13mux0ch6;
> > > +             i2c71 =3D &i2c13mux0ch7;
> > > +
> > > +             /*
> > > +              * i2c switch 15-0077, pca9548, 8 child channels assign=
ed
> > > +              * with bus number 72-79.
> > > +              */
> > > +             i2c72 =3D &i2c15mux0ch0;
> > > +             i2c73 =3D &i2c15mux0ch1;
> > > +             i2c74 =3D &i2c15mux0ch2;
> > > +             i2c75 =3D &i2c15mux0ch3;
> > > +             i2c76 =3D &i2c15mux0ch4;
> > > +             i2c77 =3D &i2c15mux0ch5;
> > > +             i2c78 =3D &i2c15mux0ch6;
> > > +             i2c79 =3D &i2c15mux0ch7;
> >
> > Can you please add comments justifying why all of these aliases are
> > necessary given a number of them are for busses with no devices
> > described under them?
> These I2C aliases are pre-allocated because these empty channels are
>  strictly reserved for future hardware feature expansions, which will
> interface with add-on boards. I will add clear comments in the code to
> justify their necessity in the next patch.
> >
> > > +     };
> > > +
> > > +     chosen {
> > > +             stdout-path =3D "serial4:57600n8";
> > > +     };
> > > +
> > > +     fan_leds {
> > > +             compatible =3D "gpio-leds";
> > > +
> > > +             led-0 {
> > > +                     label =3D "fcb0fan0_ledd1_blue";
> >
> > Given the labels are exposed to userspace and is something applications
> > likely consume, is the double 'd' in led intentional?
> Yes, the double 'd' in "ledd1" is intentional. It aligns with our hardwar=
e
>  schematic design naming convention, where these specific onboard
> indicators are designated as LEDD1, LEDD2, etc.
> >
> > > +                     default-state =3D "off";
> > > +                     gpios =3D <&fan_io_expander0 0 GPIO_ACTIVE_LOW>=
;
> > > +             };
> > > +
> > > +             led-1 {
> > > +                     label =3D "fcb0fan1_ledd2_blue";
> > > +                     default-state =3D "off";
> > > +                     gpios =3D <&fan_io_expander0 1 GPIO_ACTIVE_LOW>=
;
> > > +             };
> > > +
> > > +             led-2 {
> > > +                     label =3D "fcb0fan2_ledd3_blue";
> > > +                     default-state =3D "off";
> > > +                     gpios =3D <&fan_io_expander1 0 GPIO_ACTIVE_LOW>=
;
> > > +             };
> > > +
> > > +             led-3 {
> > > +                     label =3D "fcb0fan3_ledd4_blue";
> > > +                     default-state =3D "off";
> > > +                     gpios =3D <&fan_io_expander1 1 GPIO_ACTIVE_LOW>=
;
> > > +             };
> > > +
> > > +             led-4 {
> > > +                     label =3D "fcb0fan0_ledd1_amber";
> > > +                     default-state =3D "off";
> > > +                     gpios =3D <&fan_io_expander0 4 GPIO_ACTIVE_LOW>=
;
> > > +             };
> > > +
> > > +             led-5 {
> > > +                     label =3D "fcb0fan1_ledd2_amber";
> > > +                     default-state =3D "off";
> > > +                     gpios =3D <&fan_io_expander0 5 GPIO_ACTIVE_LOW>=
;
> > > +             };
> > > +
> > > +             led-6 {
> > > +                     label =3D "fcb0fan2_ledd3_amber";
> > > +                     default-state =3D "off";
> > > +                     gpios =3D <&fan_io_expander1 4 GPIO_ACTIVE_LOW>=
;
> > > +             };
> > > +
> > > +             led-7 {
> > > +                     label =3D "fcb0fan3_ledd4_amber";
> > > +                     default-state =3D "off";
> > > +                     gpios =3D <&fan_io_expander1 5 GPIO_ACTIVE_LOW>=
;
> > > +             };
> > > +     };
> > > +
> >
> > ...
> >
> > > +
> > > +&fmc {
> > > +     status =3D "okay";
> > > +     flash@0 {
> > > +             status =3D "okay";
> > > +             m25p,fast-read;
> > > +             label =3D "bmc";
> > > +             spi-max-frequency =3D <50000000>;
> > > +             #include "openbmc-flash-layout-128.dtsi"
> > > +     };
> > > +     flash@1 {
> > > +             status =3D "okay";
> > > +             m25p,fast-read;
> > > +             label =3D "alt-bmc";
> > > +             spi-max-frequency =3D <50000000>;
> >
> > Perhaps include the alternate flash layout dtsi here?
> The `flash@1` (`alt-bmc`) node is intentionally left unpartitioned
>  without the layout DTSI.
>
> In our dual-flash design, `flash@1` serves as the secondary/backup
> flash chip. Keeping it without sub-partitions allows the kernel and
> userspace tools to treat this flash as a single, contiguous raw MTD
> device. This is required by our firmware update mechanism, which
> flashes a single, full-size composite image directly to the entire
> backup flash.
>
> This structure follows the existing upstream pattern established in
> `aspeed-bmc-facebook-yosemite5.dts`.
> >
> > > +     };
> > > +};
> > > +
> > > +&peci0 {
> >
> > Can you please order the nodes alphabetically. P is not between F and
> > G.
> I will ensure all nodes are strictly sorted in alphabetical order in
> the next version.
> >
> > > +     status =3D "okay";
> > > +};
> > > +
> > >
> >
> > ...
> >
> > > +
> > > +&i2c10 {
> > > +     status =3D "okay";
> > > +
> > > +     legacy_prsnt_io_expander0: gpio@11 {
> >
> > Why 'legacy'?
> >
> > > +             compatible =3D "nxp,pca9555";
> > > +             reg =3D <0x11>;
> > > +             gpio-controller;
> > > +             #gpio-cells =3D <2>;
> > > +             interrupt-parent =3D <&sgpiom0>;
> > > +             interrupts =3D <40 IRQ_TYPE_LEVEL_LOW>;
> > > +
> > > +             gpio-line-names =3D
> > > +                     "TRAY_PRSNT1_N_BUF_R", "TRAY_PRSNT2_N_BUF_R",
> > > +                     "TRAY_PRSNT3_N_BUF_R", "TRAY_PRSNT4_N_BUF_R",
> > > +                     "TRAY_PRSNT5_N_BUF_R", "TRAY_PRSNT6_N_BUF_R",
> > > +                     "TRAY_PRSNT7_N_BUF_R", "TRAY_PRSNT8_N_BUF_R",
> > > +                     "TRAY_PRSNT9_N_BUF_R", "TRAY_PRSNT10_N_BUF_R",
> > > +                     "TRAY_PRSNT11_N_BUF_R", "TRAY_PRSNT12_N_BUF_R",
> > > +                     "TRAY_PRSNT13_N_BUF_R", "TRAY_PRSNT14_N_BUF_R",
> > > +                     "TRAY_PRSNT15_N_BUF_R", "TRAY_PRSNT16_N_BUF_R";
> > > +     };
> > > +
> > > +     legacy_prsnt_io_expander1: gpio@12 {
> > > +             compatible =3D "nxp,pca9555";
> > > +             reg =3D <0x12>;
> > > +             gpio-controller;
> > > +             #gpio-cells =3D <2>;
> > > +             interrupt-parent =3D <&sgpiom0>;
> > > +             interrupts =3D <40 IRQ_TYPE_LEVEL_LOW>;
> > > +
> > > +             gpio-line-names =3D
> > > +                     "TRAY_PRSNT17_N_BUF_R", "TRAY_PRSNT18_N_BUF_R",
> > > +                     "TRAY_PRSNT19_N_BUF_R", "TRAY_PRSNT20_N_BUF_R",
> > > +                     "TRAY_PRSNT21_N_BUF_R", "TRAY_PRSNT22_N_BUF_R",
> > > +                     "TRAY_PRSNT23_N_BUF_R", "TRAY_PRSNT24_N_BUF_R",
> > > +                     "TRAY_PRSNT25_N_BUF_R", "TRAY_PRSNT26_N_BUF_R",
> > > +                     "TRAY_PRSNT27_N_BUF_R", "TRAY_PRSNT28_N_BUF_R",
> > > +                     "TRAY_PRSNT29_N_BUF_R", "TRAY_PRSNT30_N_BUF_R",
> > > +                     "TRAY_PRSNT31_N_BUF_R", "TRAY_PRSNT32_N_BUF_R";
> > > +     };
> > > +
> > > +     legacy_prsnt_io_expander2: gpio@13 {
> > > +             compatible =3D "nxp,pca9555";
> > > +             reg =3D <0x13>;
> > > +             gpio-controller;
> > > +             #gpio-cells =3D <2>;
> > > +             interrupt-parent =3D <&sgpiom0>;
> > > +             interrupts =3D <40 IRQ_TYPE_LEVEL_LOW>;
> > > +
> > > +             gpio-line-names =3D
> > > +                     "TRAY_PRSNT33_N_BUF_R", "TRAY_PRSNT34_N_BUF_R",
> > > +                     "TRAY_PRSNT35_N_BUF_R", "TRAY_PRSNT36_N_BUF_R",
> > > +                     "TRAY_PRSNT37_N_BUF_R", "TRAY_PRSNT38_N_BUF_R",
> > > +                     "TRAY_PRSNT39_N_BUF_R", "TRAY_PRSNT40_N_BUF_R",
> > > +                     "", "",
> > > +                     "", "",
> > > +                     "", "",
> > > +                     "", "";
> > > +     };
> > > +
> > > +     power-monitor@14 {
> > > +             compatible =3D "infineon,xdp710";
> > > +             reg =3D <0x14>;
> > > +     };
> > > +
> > > +     legacy_pwrgd_io_expander1: gpio@15 {
> > > +             compatible =3D "nxp,pca9555";
> > > +             reg =3D <0x15>;
> > > +             gpio-controller;
> > > +             #gpio-cells =3D <2>;
> > > +             interrupt-parent =3D <&sgpiom0>;
> > > +             interrupts =3D <42 IRQ_TYPE_LEVEL_LOW>;
> > > +
> > > +             gpio-line-names =3D
> > > +                     "TRAY_PWRGD17_N_BUF_R", "TRAY_PWRGD18_N_BUF_R",
> > > +                     "TRAY_PWRGD19_N_BUF_R", "TRAY_PWRGD20_N_BUF_R",
> > > +                     "TRAY_PWRGD21_N_BUF_R", "TRAY_PWRGD22_N_BUF_R",
> > > +                     "TRAY_PWRGD23_N_BUF_R", "TRAY_PWRGD24_N_BUF_R",
> > > +                     "TRAY_PWRGD25_N_BUF_R", "TRAY_PWRGD26_N_BUF_R",
> > > +                     "TRAY_PWRGD27_N_BUF_R", "TRAY_PWRGD28_N_BUF_R",
> > > +                     "TRAY_PWRGD29_N_BUF_R", "TRAY_PWRGD30_N_BUF_R",
> > > +                     "TRAY_PWRGD31_N_BUF_R", "TRAY_PWRGD32_N_BUF_R";
> > > +     };
> > > +
> > > +     legacy_pwrgd_io_expander2: gpio@16 {
> > > +             compatible =3D "nxp,pca9555";
> > > +             reg =3D <0x16>;
> > > +             gpio-controller;
> > > +             #gpio-cells =3D <2>;
> > > +             interrupt-parent =3D <&sgpiom0>;
> > > +             interrupts =3D <42 IRQ_TYPE_LEVEL_LOW>;
> > > +
> > > +             gpio-line-names =3D
> > > +                     "TRAY_PWRGD33_N_BUF_R", "TRAY_PWRGD34_N_BUF_R",
> > > +                     "TRAY_PWRGD35_N_BUF_R", "TRAY_PWRGD36_N_BUF_R",
> > > +                     "TRAY_PWRGD37_N_BUF_R", "TRAY_PWRGD38_N_BUF_R",
> > > +                     "TRAY_PWRGD39_N_BUF_R", "TRAY_PWRGD40_N_BUF_R",
> > > +                     "", "",
> > > +                     "", "",
> > > +                     "", "",
> > > +                     "", "";
> > > +     };
> > > +
> > > +     legacy_leak_io_expander0: gpio@17 {
> > > +             compatible =3D "nxp,pca9555";
> > > +             reg =3D <0x17>;
> > > +             gpio-controller;
> > > +             #gpio-cells =3D <2>;
> > > +             interrupt-parent =3D <&sgpiom0>;
> > > +             interrupts =3D <46 IRQ_TYPE_LEVEL_LOW>;
> > > +
> > > +             gpio-line-names =3D
> > > +                     "TRAY_LEAK_DETECT1_N_BUF_R", "TRAY_LEAK_DETECT2=
_N_BUF_R",
> > > +                     "TRAY_LEAK_DETECT3_N_BUF_R", "TRAY_LEAK_DETECT4=
_N_BUF_R",
> > > +                     "TRAY_LEAK_DETECT5_N_BUF_R", "TRAY_LEAK_DETECT6=
_N_BUF_R",
> > > +                     "TRAY_LEAK_DETECT7_N_BUF_R", "TRAY_LEAK_DETECT8=
_N_BUF_R",
> > > +                     "TRAY_LEAK_DETECT9_N_BUF_R", "TRAY_LEAK_DETECT1=
0_N_BUF_R",
> > > +                     "TRAY_LEAK_DETECT11_N_BUF_R", "TRAY_LEAK_DETECT=
12_N_BUF_R",
> > > +                     "TRAY_LEAK_DETECT13_N_BUF_R", "TRAY_LEAK_DETECT=
14_N_BUF_R",
> > > +                     "TRAY_LEAK_DETECT15_N_BUF_R", "TRAY_LEAK_DETECT=
16_N_BUF_R";
> > > +     };
> > > +
> > > +     legacy_leak_io_expander1: gpio@18 {
> > > +             compatible =3D "nxp,pca9555";
> > > +             reg =3D <0x18>;
> > > +             gpio-controller;
> > > +             #gpio-cells =3D <2>;
> > > +             interrupt-parent =3D <&sgpiom0>;
> > > +             interrupts =3D <46 IRQ_TYPE_LEVEL_LOW>;
> > > +
> > > +             gpio-line-names =3D
> > > +                     "TRAY_LEAK_DETECT17_N_BUF_R", "TRAY_LEAK_DETECT=
18_N_BUF_R",
> > > +                     "TRAY_LEAK_DETECT19_N_BUF_R", "TRAY_LEAK_DETECT=
20_N_BUF_R",
> > > +                     "TRAY_LEAK_DETECT21_N_BUF_R", "TRAY_LEAK_DETECT=
22_N_BUF_R",
> > > +                     "TRAY_LEAK_DETECT23_N_BUF_R", "TRAY_LEAK_DETECT=
24_N_BUF_R",
> > > +                     "TRAY_LEAK_DETECT25_N_BUF_R", "TRAY_LEAK_DETECT=
26_N_BUF_R",
> > > +                     "TRAY_LEAK_DETECT27_N_BUF_R", "TRAY_LEAK_DETECT=
28_N_BUF_R",
> > > +                     "TRAY_LEAK_DETECT29_N_BUF_R", "TRAY_LEAK_DETECT=
30_N_BUF_R",
> > > +                     "TRAY_LEAK_DETECT31_N_BUF_R", "TRAY_LEAK_DETECT=
32_N_BUF_R";
> > > +     };
> > > +
> > > +     legacy_leak_io_expander2: gpio@19 {
> > > +             compatible =3D "nxp,pca9555";
> > > +             reg =3D <0x19>;
> > > +             gpio-controller;
> > > +             #gpio-cells =3D <2>;
> > > +             interrupt-parent =3D <&sgpiom0>;
> > > +             interrupts =3D <46 IRQ_TYPE_LEVEL_LOW>;
> > > +
> > > +             gpio-line-names =3D
> > > +                     "TRAY_LEAK_DETECT33_N_BUF_R", "TRAY_LEAK_DETECT=
34_N_BUF_R",
> > > +                     "TRAY_LEAK_DETECT35_N_BUF_R", "TRAY_LEAK_DETECT=
36_N_BUF_R",
> > > +                     "TRAY_LEAK_DETECT37_N_BUF_R", "TRAY_LEAK_DETECT=
38_N_BUF_R",
> > > +                     "TRAY_LEAK_DETECT39_N_BUF_R", "TRAY_LEAK_DETECT=
40_N_BUF_R",
> > > +                     "", "",
> > > +                     "", "",
> > > +                     "", "",
> > > +                     "", "";
> > > +     };
> > > +
> > > +     legacy_small_leak_io_expander0: gpio@1a {
> > > +             compatible =3D "nxp,pca9555";
> > > +             reg =3D <0x1a>;
> > > +             gpio-controller;
> > > +             #gpio-cells =3D <2>;
> > > +             interrupt-parent =3D <&sgpiom0>;
> > > +             interrupts =3D <44 IRQ_TYPE_LEVEL_LOW>;
> > > +
> > > +             gpio-line-names =3D
> > > +                     "TRAY_SMALL_LEAK1_N_BUF_R", "TRAY_SMALL_LEAK2_N=
_BUF_R",
> > > +                     "TRAY_SMALL_LEAK3_N_BUF_R", "TRAY_SMALL_LEAK4_N=
_BUF_R",
> > > +                     "TRAY_SMALL_LEAK5_N_BUF_R", "TRAY_SMALL_LEAK6_N=
_BUF_R",
> > > +                     "TRAY_SMALL_LEAK7_N_BUF_R", "TRAY_SMALL_LEAK8_N=
_BUF_R",
> > > +                     "TRAY_SMALL_LEAK9_N_BUF_R", "TRAY_SMALL_LEAK10_=
N_BUF_R",
> > > +                     "TRAY_SMALL_LEAK11_N_BUF_R", "TRAY_SMALL_LEAK12=
_N_BUF_R",
> > > +                     "TRAY_SMALL_LEAK13_N_BUF_R", "TRAY_SMALL_LEAK14=
_N_BUF_R",
> > > +                     "TRAY_SMALL_LEAK15_N_BUF_R", "TRAY_SMALL_LEAK16=
_N_BUF_R";
> > > +     };
> > > +
> > > +     legacy_small_leak_io_expander1: gpio@1b {
> > > +             compatible =3D "nxp,pca9555";
> > > +             reg =3D <0x1b>;
> > > +             gpio-controller;
> > > +             #gpio-cells =3D <2>;
> > > +             interrupt-parent =3D <&sgpiom0>;
> > > +             interrupts =3D <44 IRQ_TYPE_LEVEL_LOW>;
> > > +
> > > +             gpio-line-names =3D
> > > +                     "TRAY_SMALL_LEAK17_N_BUF_R", "TRAY_SMALL_LEAK18=
_N_BUF_R",
> > > +                     "TRAY_SMALL_LEAK19_N_BUF_R", "TRAY_SMALL_LEAK20=
_N_BUF_R",
> > > +                     "TRAY_SMALL_LEAK21_N_BUF_R", "TRAY_SMALL_LEAK22=
_N_BUF_R",
> > > +                     "TRAY_SMALL_LEAK23_N_BUF_R", "TRAY_SMALL_LEAK24=
_N_BUF_R",
> > > +                     "TRAY_SMALL_LEAK25_N_BUF_R", "TRAY_SMALL_LEAK26=
_N_BUF_R",
> > > +                     "TRAY_SMALL_LEAK27_N_BUF_R", "TRAY_SMALL_LEAK28=
_N_BUF_R",
> > > +                     "TRAY_SMALL_LEAK29_N_BUF_R", "TRAY_SMALL_LEAK30=
_N_BUF_R",
> > > +                     "TRAY_SMALL_LEAK31_N_BUF_R", "TRAY_SMALL_LEAK32=
_N_BUF_R";
> > > +     };
> > > +
> > > +     legacy_small_leak_io_expander2: gpio@1c {
> > > +             compatible =3D "nxp,pca9555";
> > > +             reg =3D <0x1c>;
> > > +             gpio-controller;
> > > +             #gpio-cells =3D <2>;
> > > +             interrupt-parent =3D <&sgpiom0>;
> > > +             interrupts =3D <44 IRQ_TYPE_LEVEL_LOW>;
> > > +
> > > +             gpio-line-names =3D
> > > +                     "TRAY_SMALL_LEAK33_N_BUF_R", "TRAY_SMALL_LEAK34=
_N_BUF_R",
> > > +                     "TRAY_SMALL_LEAK35_N_BUF_R", "TRAY_SMALL_LEAK36=
_N_BUF_R",
> > > +                     "TRAY_SMALL_LEAK37_N_BUF_R", "TRAY_SMALL_LEAK38=
_N_BUF_R",
> > > +                     "TRAY_SMALL_LEAK39_N_BUF_R", "TRAY_SMALL_LEAK40=
_N_BUF_R",
> > > +                     "", "",
> > > +                     "", "",
> > > +                     "", "",
> > > +                     "", "";
> > > +     };
> > > +
> > > +     legacy_pwrgd_io_expander0: gpio@28 {
> > > +             compatible =3D "nxp,pca9555";
> > > +             reg =3D <0x28>;
> > > +             gpio-controller;
> > > +             #gpio-cells =3D <2>;
> > > +             interrupt-parent =3D <&sgpiom0>;
> > > +             interrupts =3D <42 IRQ_TYPE_LEVEL_LOW>;
> > > +
> > > +             gpio-line-names =3D
> > > +                     "TRAY_PWRGD1_N_BUF_R", "TRAY_PWRGD2_N_BUF_R",
> > > +                     "TRAY_PWRGD3_N_BUF_R", "TRAY_PWRGD4_N_BUF_R",
> > > +                     "TRAY_PWRGD5_N_BUF_R", "TRAY_PWRGD6_N_BUF_R",
> > > +                     "TRAY_PWRGD7_N_BUF_R", "TRAY_PWRGD8_N_BUF_R",
> > > +                     "TRAY_PWRGD9_N_BUF_R", "TRAY_PWRGD10_N_BUF_R",
> > > +                     "TRAY_PWRGD11_N_BUF_R", "TRAY_PWRGD12_N_BUF_R",
> > > +                     "TRAY_PWRGD13_N_BUF_R", "TRAY_PWRGD14_N_BUF_R",
> > > +                     "TRAY_PWRGD15_N_BUF_R", "TRAY_PWRGD16_N_BUF_R";
> > > +     };
> > > +
> >
> > ...
> >
> > > +
> > > +&mdio0 {
> > > +     status =3D "okay";
> > > +};
> > > +
> > > +&peci0 {
> > > +     status =3D "okay";
> > > +};
> >
> > Ah, so the earlier peci node is redundant. Can you please remove it?
> Got it. I will remove the redundant peci0 node and ensure all nodes
>  are strictly sorted in alphabetical order in the next version.
> >
> > Andrew

