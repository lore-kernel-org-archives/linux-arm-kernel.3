Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15BCCA5FBA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 11:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wM8W3udRuQDxIq2R1VNl0FNo7Tqwd3aCD0aaYmlp5nI=; b=5EvpEUFFpNzqBjxjsVfBUvTG07
	TZRjZi9GAv7qTrA3nZ6uhQv/Ce5MJs3QrFdg/xgMVckiyHLClWyBFtfk9Jl1sOK2GttDNc/lh6E90
	0srN31eObeq5vh6mVzBWscMkpY7cLnfrpfay/uU3pLa2pCDT7GhlIW+P4Q0vboGnLSRNPJet8XelP
	vhp4xbR4tnyUqPmnlhA7ol3n8s8DGviYFLG1CBBAfamXetc/miKPW3Xf5KHgn3SBkesoID0h/sXcv
	zw1AXU+jp0S8OZATNub63EQGpL5K79QzjGdiYtpBNgSeCc75fPgiiL717DHgyQutTewB4aKdGglAg
	5yjp6WSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBs52-00000005ofD-2Mvv;
	Wed, 30 Sep 2026 11:02:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBs4X-00000005oYr-0wOe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 11:02:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DF55143DF0
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 11:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C79E71F0089D
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 11:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790766120;
	bh=wM8W3udRuQDxIq2R1VNl0FNo7Tqwd3aCD0aaYmlp5nI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SxsQmaiE8bMHn80+76krI/+rDRJyVNbtXQvfjM8bKzgFUZzlX8uZWyJUc1HGVHcpk
	 NKXNYqek4ZfoD2ATyhnwJgnqBmBObWZtv0DX7FenDkiKI+zGfYChfikKOgZf4RowE6
	 PIopWY/km4MUSmATa4fC4Yvmz4EacBI8bFo0fyQPB82w15Ow6VD8uJmD+pv9GQYHvF
	 JkEMu916tk7toLxZtX1LKi+5/BZI9rClR6aFohbRoSshTQ10gZO1/0SCJ2GQiQgRkE
	 TrDtuYSmlfo6TSiac620irkQYyOxLCm0erLfuqEdDXz41VhDH3SuuJCpkRjawnRWug
	 Cs0P5wmKM7Xrg==
Received: by mail-lr2-f13.google.com with SMTP id 38308e7fff4ca-3a302c06eceso45757611fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 04:02:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx++ctL3VbhJsGjvtKdRqMpolDnkV18qsYPQ06YByPsJrR3zhfUlLRa1eDO1cutEpGsUrWpdwtzsRAMhrQvFU7B@lists.infradead.org
X-Gm-Message-State: AFq9FYL93sutLFKOcyx+3ZBaAdexVcNi/HMio81SUp2Hx5m0pZktPQYd
	gZ4it+J7ZYBuPS5R9mt+J/0TJttG2wTjtza0YGo/gvtn2F5MJL9qmz3Q56xUmX7aA4aUIrhhfcK
	OR5xCqcXLqTTgFO24H/Dcdty2ENs1BFc=
X-Received: by 2002:a2e:be86:0:b0:3a6:772c:2763 with SMTP id
 38308e7fff4ca-3a777d41008mr3400901fa.0.1790766119222; Wed, 30 Sep 2026
 04:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <20260930-b4-cs75xx-v1-4-4617c4463529@gmail.com> <65c87e07-1722-44c2-9a08-ed9e18902058@kernel.org>
 <179076583795.3054628.14443934429806440798@gmail.com>
In-Reply-To: <179076583795.3054628.14443934429806440798@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 13:01:46 +0200
X-Gmail-Original-Message-ID: <CAD++jLnZBpoF3H3-sqzmrtwzxLGombFMdSYMVo59jiGFYcyCFA@mail.gmail.com>
X-Gm-Features: AclHuK_ChPvqXpZcBtgi1ur23GoXeg-9LEYM9g162V4LxDv3fyrrqjh1iIDXE7U
Message-ID: <CAD++jLnZBpoF3H3-sqzmrtwzxLGombFMdSYMVo59jiGFYcyCFA@mail.gmail.com>
Subject: Re: [PATCH RFC 04/10] ARM: cortina: Add support for the CS75xx SoC family
To: Fil Dunsky <filipp.dunsky@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
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

On Wed, Sep 30, 2026 at 12:57=E2=80=AFPM Fil Dunsky <filipp.dunsky@gmail.co=
m> wrote:
> On 30/09/2026 12:20, Krzysztof Kozlowski wrote:

> > How is it different from Cortina Gemini?
>
> Apart from the vendor, they have little in common. Gemini (SL3516/
> CS3516) is a single ARMv4 FA526 with Faraday peripherals (FTINTC010,
> FTTMR010, FTGPIO010, a 16550 UART) and builds for ARCH_MULTI_V4. The
> CS75xx ("Goldengate G2") is an ARMv7 dual Cortex-A9 MPCore with GIC,
> SCU, TWD/global timer and a PL310, and its UART, GPIO, interrupt
> controller and NAND controller are different blocks from the Gemini
> ones. So it cannot share mach-gemini or its drivers.
>
> >> +machine-$(CONFIG_ARCH_CORTINA_CS75XX)       +=3D cortina
> >
> > Arch should be rather per entire family, not one SoC.
>
> CS75xx is meant as the family (the vendor kernel covers the CS7522 and
> CS7542 with one ARCH_GOLDENGATE), but I see the name reads like a
> single part. Following Linus' suggestion of mach-goldengate, v2 will
> use ARCH_GOLDENGATE and arch/arm/mach-goldengate for the whole family.

Put the rationale into the commit message, that's exactly what we want to
see in there.

Thanks!
Linus Walleij

