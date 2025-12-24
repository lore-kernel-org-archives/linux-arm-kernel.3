Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A025E7491B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 06:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QhWuML+xfN/FbEBKC+hfJSr+oGnXRh1tbjNh8rpQndc=; b=n3vczoG+iGY1sTbFa1xVMv1WKJ
	3FnBfMpS7O+1uQFwhnTHF/TCQ86DHsaZ2cliTOHgAKlldzRJIuY20erCVzxITKT90QGNJN6PTXLpk
	vz+VDOD9uk0dZ1+uXBYACe6ifwykKl1vC7bVujmNtjpYdEfiDILW+HIlwFY1WDNEATI2FsdfKwzV0
	PHvRggAngUxikqdOZ1yUQ8+my0lu7DIgn8wqn9XCcPS+e88u0A2FkyN4gyaObgU6M6Q8yteJtQeaO
	LtF1x8BR1QPwcahfg7UuxaVuoJRbd6qWVqv88P2hP4NmsiZzU9UrKsPv2QOHl99wOrxPSFzPC4cag
	n86dtyOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYIYI-0000000GV9o-3srL;
	Wed, 24 Dec 2025 06:40:54 +0000
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYIYG-0000000GV9N-1OhO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 06:40:53 +0000
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-55b26332196so1481880e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 22:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766558451; x=1767163251; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QhWuML+xfN/FbEBKC+hfJSr+oGnXRh1tbjNh8rpQndc=;
        b=cxEQxWxjKgT6MZLagPLJK9uCDc3oBGKc7C0ZQyRF+csFi35mTfoCiazorcEkQUIUzA
         iGlbbeyNWhQtqDK2Ny3NR3kvtpbn238QSZu31dd3sikNCGVBSPFn2zWTaixmAFe34O7F
         De9zmf5tejfE8kaScgqcH30Ku+WC3sYB57sKErPgyoOGdhUFdjFq5S0NnhrM8qswrHY7
         HXDsLjF6RgfoOwbrgvfx3GRB8EJ09PamcR3RUw/rrnJvCIc/linBX/+4adRizvmUQoXd
         fHv5tO475nbeQobVM5ND36m+qAODGVaU75vAhrIDG6lVYPuDDmzAxB15UFnSM5ID6ZCa
         FLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766558451; x=1767163251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QhWuML+xfN/FbEBKC+hfJSr+oGnXRh1tbjNh8rpQndc=;
        b=xJr5hautkeQIA7BaFNbg5996n39+P3bhjkoRhoTEui2vK/l1M9n7hQX/1kIQo0YpW+
         aOfDfLDUG7qlLEMPNvP36P5u+XNT8FOKIDjefYM9QoKXPu4hu8G7Jz8Ad+JOOclzWLTk
         iyZghmpHoFqd+1DyeT4BW4310PfTacpjNIRps7MHGLGL6wwqmueXh20zYSa3Tx97D5fj
         49AUn3FP9sUdOJxX4y5XNdc9pYZ9kooSkXVysjctKybA/gmS2q7rCjq/i3kS00gEFCj0
         +oTtNCW3ixsifU9apKEIQ0svdu/XC7eXVQsigCyMZUzCygBC1BcX51jIz748gvqB/NV1
         aFRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVt7kQksFkIqaulZddEu4lizXZ8LP/hK9SQBKyBXbWCVCjeLM20QQyU2J82oHsYHfnHlHP7zm0ZXZaWsgJcl4vH@lists.infradead.org
X-Gm-Message-State: AOJu0YwrNSCOsOS2cEA06Se+OK0sPlih7e8ePN0hV56unG1Tapg2Gl0Z
	+HZ3vFjC2L5BlOnNQHS47r+6enRuUPA+haD8mp2LQfT3Rzlak4Glg055YRHHUufs9abTRPDlWW4
	u8ml4C+14FnDpbnFiutT9fqUzkQl/EpI=
X-Gm-Gg: AY/fxX58QsXdo7AilYdpKL5MRex8qEcEp6hi9R1pLs4oGOl51r8RXSLaI9ityFejICn
	Cgm/DmjdNji6ytirEQHF7QxthyMFnG/K1zE9H9ha1qCT55feSsqzonKBshOnEK6vR3lNNc1/hxF
	KV4KSnhDTzfXd60EW4HkFAwezktNkv03tl6b24+xZkMAQ4/z3e+JGMBzJgDCvZPUnqc96SUr/0d
	dOtuJWKluHQDg2k4HOZYzQvJeZeLzXR2eHBfcZOhyBypm/bzpG5hwCqIjqb7C0vbayUXKFj
X-Google-Smtp-Source: AGHT+IGqNey6TG8yqdYhTpzWZIqLA35E9fAegGhLCjqG575xM7vw/bkoGiuMiUd1DxNeOqzRaI7119YN5vercXgA8zY=
X-Received: by 2002:a05:6122:240c:b0:55b:9c1c:acd4 with SMTP id
 71dfb90a1353d-5615be9091emr4344447e0c.15.1766558450878; Tue, 23 Dec 2025
 22:40:50 -0800 (PST)
MIME-Version: 1.0
References: <20251222-ventura2_initial_dts-v1-0-1f06166c78a3@gmail.com>
 <20251222-ventura2_initial_dts-v1-2-1f06166c78a3@gmail.com>
 <c069b452-df22-4afa-bf6a-c48949f40ebc@lunn.ch> <CAF7HswN_jEXOU_9K4LpLnbhvd+RD0qqELAHxMBbp=hGtMjS4kQ@mail.gmail.com>
 <35f3eba9-5ec4-4cba-8a64-fb521dc65b79@lunn.ch> <CAF7HswN0hhJQ-gmE59cKTuPyzrs1A3rM8Xw+Z8i3_AsHRiNcug@mail.gmail.com>
 <1e21f828-1b06-492d-bfcd-ab5721621e8a@lunn.ch>
In-Reply-To: <1e21f828-1b06-492d-bfcd-ab5721621e8a@lunn.ch>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Wed, 24 Dec 2025 14:40:39 +0800
X-Gm-Features: AQt7F2pZDHak7nDZcL8jCA1XWJnW12d9SgVdpUOLF37-2YvXQexfXsCcudZZ8p8
Message-ID: <CAF7HswP7Oejs42K=jG8bkNiBoDhXR2LbeHoppk0nnNon6_afwA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_224052_382020_2AFD8F42 
X-CRM114-Status: GOOD (  18.82  )
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

On Tue, Dec 23, 2025 at 6:35=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > What make/model of switch is it? Is it unmanaged, or does it use SPI
> > > or I2C for management?
>
> > The switch is connected via RMII to the MAC and is managed over MDIO.
>
> O.K. What make/model?
>
The device is a Marvell 88E6393X switch. In our design, the BMC connects
to the device via RMII with fixed link parameters to retrieve ethernet.
> > On our board, MDIO is not wired directly to the processor; instead, we
> > use a USB-to-MPSSE bridge (FT2232) to toggle the MDIO signals for
> > switch management.
>
> I have to push back on you using a closed source user space driver,
> given that i help maintain the Ethernet switch drivers...
>
> I know there have been attempts to get GPIO support added for FT2232,
> but i don't think any got as far as mainline. That is probably the
> only part you are missing. You can describe USB devices in DT. So you
> should be able to describe such a GPIO controller. You can then
> instantiate an virtual,mdio-gpio driver to give you an MDIO bus. And
> then add nodes for the switch using DSA.
>
Apologies for the confusion in my previous reply.
The BMC connects to the peer via an RMII fixed-link.
The link parameters are fixed at design time and there is no runtime
MDIO-managed PHY or switch control from the BMC.
>      Andrew

