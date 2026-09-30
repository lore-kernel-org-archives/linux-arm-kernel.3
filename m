Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9ED4CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 10:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MljuINYsDSt6Mx+ws1xsI7mhRVCt9e9IkBdqLRkBIaA=; b=mEjJe8kEe0dD7qSfaM7kXVLJPZ
	iTnm4753ZqG7BZBqdPCH18hRo9bv21Dz+YdeNLUk6/22P6Vr5fTWW9XnXuiU2uGOrQhMX+jZ1t5ut
	mUS23ikKMxaGahQLaf07skgthQ6R4amkp+O6N10ve3jMmVRUy0zamUW1TSehwCAsD50Wk2AaWAsdy
	84DWAgK8Q+E3vbHlplCjqgzYk8ttd4e6U7hsIg/UAjOoTmlndizep0F5tac5crcJd6CHU8At7mq5n
	8W8bcyVbtiNfvhOcUaKB6Kzq0tIJ+IL+1T7QFGunbn3Biq4kzkhN7LQPb5CVzIs7pjsSfa12Tk15w
	PbXOFrZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrir-00000005mIx-2XNb;
	Wed, 30 Sep 2026 10:39:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBriq-00000005mIm-3uAp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 10:39:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F294F602A8
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 10:39:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D5971F008A5
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 10:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790764775;
	bh=MljuINYsDSt6Mx+ws1xsI7mhRVCt9e9IkBdqLRkBIaA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kdgVkpsLTN9PPbjs/FjH2VDONRjypKtQS7nnwPHqxETnWJr/EIYoC0vWaOAom+X6Q
	 q/zx7TavDdPeNeYWqJKLZFklyCeqbRF/FaACp9HQsP5uUz1EaSukQVe8Ykmph+J6r9
	 INE4KIbUL8xxS+HpCOYkNXcFiQWa8xv2aIitnFk0E1Sh36ZsFaTh9O7kLuFogi2Uhw
	 +Slc9ozKNkyEVuolDNZgpSbjVB0MpVVp0yYGAprl4+cohLWTbMr94e7A7QeWLhBdpa
	 nKnMDMc0yjuINPA9O33kKCcKB8r6l6lo5mKCQiY5K7qf46sUWG9IpMqj52KRAepNww
	 x6QzfqAMVZ38A==
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a652e2149aso44750181fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 03:39:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzk1kx5QQLyAd3ut7GTJRH4JMtSpVrDNASVV8mkpRff36WQmCB7FSsnrSufQKt8xobRkMcybZn4tV7GphrG37ts@lists.infradead.org
X-Gm-Message-State: AFq9FYI/0q2ZuGaLjP7IXOuBXjiLzdNh4hQUe9V+WUvb0yZ9JMrNelyB
	cUwcyLEoEsjwvsWYbRxQtml50zJRSszeQcsqYCcWpgMlPOmfL3f/SZLnlcZwVfuGNlobqhPZraT
	zvUOsSYsfOPC19vwUfkZlF4osBwF8pX8=
X-Received: by 2002:a05:651c:418d:b0:3a5:afec:9cf9 with SMTP id
 38308e7fff4ca-3a7791923f5mr3833601fa.7.1790764774294; Wed, 30 Sep 2026
 03:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
In-Reply-To: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 12:39:22 +0200
X-Gmail-Original-Message-ID: <CAD++jL=0Zc939o7UaFgtx+04gLRmgmPVHTAeuW6OS9nPP5Xt8Q@mail.gmail.com>
X-Gm-Features: AclHuK8pjnujBafapCpTqZDZIjiOhJbKtLdqSmgcu4GAW7cTFljMh260Y9sM-wQ
Message-ID: <CAD++jL=0Zc939o7UaFgtx+04gLRmgmPVHTAeuW6OS9nPP5Xt8Q@mail.gmail.com>
Subject: Re: [PATCH RFC 00/10] ARM: Add support for Cortina Systems CS75xx and
 Securifi Almond+
To: filipp.dunsky@gmail.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
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

Hi Filipp,

On Wed, Sep 30, 2026 at 9:00=E2=80=AFAM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:

> There is no public documentation for the SoC. The register information
> comes from the GPL vendor kernels (Linux 2.6.36 for the Almond+, Linux
> 4.9 for the Verizon FiOS G1100 which uses the same SoC) and from
> disassembly of the stock U-Boot 2009.11. A full out-of-tree port
> (clock, irqchip, GPIO, I2C, RTC, NAND, PCIe, MDIO and the packet engine)
> runs on Linux 6.18 in OpenWrt

Is this OpenWrt fork public?

Actually what I'm most curious about is the packet engine, which may or
may not be related to drivers/net/ethernet/cortina/*

On the Gemini that was the only part of the SoC that was actually made
by StorLink (later acquired by Cortina) while the rest of Gemini was
Faraday IP blocks.

Yours,
Linus Walleij

