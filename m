Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E313E92FE3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 01:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K3uupG6wwKA+D3WjE6NNFWCJoJkQpCysPioJbVD9zeI=; b=cnlD8k5tDWzu3yIcbWwIFkPUfO
	v8tiEAm1VxatRvICcumORNDTSemJ1gFtQc5CFXIAarslwkPc5pc97UsKa+mD0/k2db0rdk1Vp3QmC
	zU7Z9/oTZe4OJOQMExtI5LkIfo1b3N5rsOQAR47vRzS52gJwVLHWVoXrxOm8DW58MjyTyQ+xQURvC
	5W9Bg4GBTI/aOU3dZtPhkb3SpPCYQqAwImLO3c5iN6D+vngtNRXPcAzXYIIMcEgINS5WyU0440+HK
	lNa7himWd+VY0fXyoPnrxd3bJZp2a7LlF2S/I1+8H0sPtYw1Z+E2rMxuogGumaLruQzklkQgFZxNf
	DFM3Ka7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaO7x-00000004EIj-2nng;
	Tue, 30 Dec 2025 01:02:21 +0000
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaO7v-00000004EHr-1YId
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 01:02:20 +0000
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-56021f047d6so2639116e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 17:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767056537; x=1767661337; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3uupG6wwKA+D3WjE6NNFWCJoJkQpCysPioJbVD9zeI=;
        b=RxQCtAI4s0zYpYQNGQdz9GUtP2Jo9qPvvm72hiVrcutU165s+FNqGtZTYboBmizxnt
         OpIpgxUSRyJB3mBigGWfly1MefmrOsHViwJo0/9KpPF16UkN3QDIBqPvbs+jsnoYPUS0
         0D3VyE1hRs4sSpo7/88QR3cFmqDxQV16mSrnP7s5AuQKPDzd6NadpE75Zyk9oFgO4j6b
         6WK9jAEnlcsScnF5JdsSlEN/ogYEMc6t4GTmskZjTHmQzye7lBf/GiYTH+nERd1yyJ6s
         DI45enCsDzSRusV+NIZTtsF50V8L12YtCiREVXyWVDLnyeiEnooyv1Yr+xsRMB5j1q5r
         Piug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767056537; x=1767661337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K3uupG6wwKA+D3WjE6NNFWCJoJkQpCysPioJbVD9zeI=;
        b=M76hqza2dT4nQ4uAr6t9NKFPNkJW+j3cYSSID/6V2/BUhldYsvJSxOrH7QHnFa9bSG
         FUFHI/IdgR1a84MDzxD7YKCnHBWcbyZD6np+E0YpVpqNuk92yfuynrDQmjRHdv6XQepW
         R4+Ya6JtTB8Bq/grAXSy9gLISJW7LE3zs6/UmY29BXLpjWNKZrGov7Gq5uMTVCmfMeZy
         wRF/H1tJGxILJ3VtmEilmo5i42/B0CjYvMha2e9YV+9V1nBC8bZu+8mYFp9jU/HEpKtW
         WhRojllcMRr1GQUSUTADMOJGUEF+sVJWC6cNO3rfpCduH7O44X6SmHZH0aXIu+poi9K9
         CVyA==
X-Forwarded-Encrypted: i=1; AJvYcCW1ApHL12biQpezZyvD2zPpOmhQHfxV5HPPdKaZMsrwphpqkPGZJEicBRi2UxqBhNKsx4h9ZeTUxWXVCr4BAMJV@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd4SZz3paneceES6VF2tq3lUEciOEwXNNbM9zb/8YImETG3IOT
	ie6o5P6Kt3UFnlYGR3nititVjLjq9f57muFVXzi8QTf/sO2TpZ/Aw12Q1p3UmditQ0Q9mb4JD0O
	PNr+O9bsipFhcZ/NTSoy/rVqr+F3vWv0=
X-Gm-Gg: AY/fxX705dL5EcaxPNAeLUjpyfyksYiaSBy43D4eRejInY3/RA/PidFF68e73S7+AjZ
	K8kK2ALIPeCdOdOd5qqUsQReal5TDcu0Qmc98pn6Ez08g2xl0b/YAFkWgqHz1CsXAGuCQ2xPXZK
	YIxn9kBqwQiVH1AfZyYBbpqiTo56kczcYlIp6dF0ShAW6ei1QF+cv1ZNniZ2VhWXXD+I80BZwyf
	kkKCcuHbba24fxUIeLwImwbl1iA9nyqw9h0YswhT/qM3kBvhvJo9SB2fnKqj5Nd1tZf1PuO
X-Google-Smtp-Source: AGHT+IHWHcxnnE6ua2lnO59+DWRC+LlEqTyrTydKj3DfcxQoiFj1yeTa9TC+D4wZtLiBbwSaYWQkTAPRRUX0Kb/EYlU=
X-Received: by 2002:a05:6122:a1a:b0:559:65d6:1674 with SMTP id
 71dfb90a1353d-5615becae79mr7910503e0c.14.1767056532775; Mon, 29 Dec 2025
 17:02:12 -0800 (PST)
MIME-Version: 1.0
References: <20251222-ventura2_initial_dts-v1-0-1f06166c78a3@gmail.com>
 <20251222-ventura2_initial_dts-v1-2-1f06166c78a3@gmail.com>
 <c069b452-df22-4afa-bf6a-c48949f40ebc@lunn.ch> <CAF7HswN_jEXOU_9K4LpLnbhvd+RD0qqELAHxMBbp=hGtMjS4kQ@mail.gmail.com>
 <35f3eba9-5ec4-4cba-8a64-fb521dc65b79@lunn.ch> <CAF7HswN0hhJQ-gmE59cKTuPyzrs1A3rM8Xw+Z8i3_AsHRiNcug@mail.gmail.com>
 <1e21f828-1b06-492d-bfcd-ab5721621e8a@lunn.ch> <CAF7HswP7Oejs42K=jG8bkNiBoDhXR2LbeHoppk0nnNon6_afwA@mail.gmail.com>
 <32ff7ca8-9cb0-4889-adb0-a6dae735630b@lunn.ch>
In-Reply-To: <32ff7ca8-9cb0-4889-adb0-a6dae735630b@lunn.ch>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Tue, 30 Dec 2025 09:02:02 +0800
X-Gm-Features: AQt7F2pPUn1JLWmR3VqaFLx0jmfpldK-iH0ck9hcP5otIfqONHlFX9khVNFmN88
Message-ID: <CAF7HswMRrs9hwKo_uHCLMtx7+h46-DPEJRcEqu0-zEG4CVvvjg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251229_170219_420991_C6875BBB 
X-CRM114-Status: GOOD (  35.37  )
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

On Wed, Dec 24, 2025 at 5:20=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Wed, Dec 24, 2025 at 02:40:39PM +0800, Kyle Hsieh wrote:
> > On Tue, Dec 23, 2025 at 6:35=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wr=
ote:
> > >
> > > > > What make/model of switch is it? Is it unmanaged, or does it use =
SPI
> > > > > or I2C for management?
> > >
> > > > The switch is connected via RMII to the MAC and is managed over MDI=
O.
> > >
> > > O.K. What make/model?
> > >
> > The device is a Marvell 88E6393X switch. In our design, the BMC connect=
s
>
> Which Linux does have a driver for.
>
> > to the device via RMII with fixed link parameters to retrieve ethernet.
> > > > On our board, MDIO is not wired directly to the processor; instead,=
 we
> > > > use a USB-to-MPSSE bridge (FT2232) to toggle the MDIO signals for
> > > > switch management.
> > >
> > > I have to push back on you using a closed source user space driver,
> > > given that i help maintain the Ethernet switch drivers...
> > >
> > > I know there have been attempts to get GPIO support added for FT2232,
> > > but i don't think any got as far as mainline. That is probably the
> > > only part you are missing. You can describe USB devices in DT. So you
> > > should be able to describe such a GPIO controller. You can then
> > > instantiate an virtual,mdio-gpio driver to give you an MDIO bus. And
> > > then add nodes for the switch using DSA.
>
> > Apologies for the confusion in my previous reply.
> > The BMC connects to the peer via an RMII fixed-link.
> > The link parameters are fixed at design time and there is no runtime
> > MDIO-managed PHY or switch control from the BMC.
>
> So you use the USB-MDIO to program the EEPROM? The switch boots using
> the settings in the EEPROM? It is then an unmanaged hub? You are not
> using UMSD in userspace? That code looks terrible.
>
> So if you connect multiple of these unmanaged hubs together in a loop,
> your network disappears in a broadcast storm? Yes, you can use these
> switches in a dumb mode, but it has consequences. If you let Linux
> manage it, you gain a lot of functionality, such as STP, to break
> loops.
>
> But you seem to be opposed to this. At least add in a comment
> explaining the purpose of the fixed link. DT describes hardware, so
> there is no harm in describing the hardware, even if it is a comment
> and not real properties.
Thanks for the comments.
I understand the concern about the DTS. I will add a clear comment in the
device tree explaining why a fixed-link is used and that the switch is
initialized via hardware straps and EEPROM, with no runtime management
from Linux.
>
>         Andrew

