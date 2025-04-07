Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB43C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 16:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NWZ2QEzQSsax0RMmNVi5/QIUkpjXCdv9f5sixO2omPw=; b=HvRGONVPrpD13v+h0lV0YjkuDH
	WtxRm5QFy8fmKT3j8I8SEuvpzZGnIB8mbMPQ+MnzAcLFg2kIu+dBQvtdZbQoA95GV+e4b+1Xk8kYV
	6ZqAJDPVSdG16g+2FanxHBeL++vTDZ7QzcNy79ubWUubzBbNgqz9gENNfsXylmTcajY/H3z9fuRby
	w1szFHjfy1T16wQIOAa3UWlA+HauAfufgkqUn0d6+iCr5rvowuiJVQKRhkfuiuAFreYDVUFKSvPGh
	gN3ANa6ZHAtyTWaEeY02v9hvFXscnntaJWLZmxxmv9ZaRFH+aQORsZUyAUFSRms7tSCfRUejRHKOv
	xguHuUSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pK0-00000001Af0-0WSE;
	Mon, 07 Apr 2025 16:27:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ltW-00000000LjX-1XLi
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Apr 2025 12:48:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:Content-Type:
	Date:Sender:Reply-To:Content-ID:Content-Description;
	bh=NWZ2QEzQSsax0RMmNVi5/QIUkpjXCdv9f5sixO2omPw=; b=OOQcbKqAF2f9DCFtGH+YZDzGJS
	oSlDAa4lJvVeOeUvI/8Lm0+67UJXbTZ9g1WmdQU1e6iwOypW7qq2e7sUZAndgV5DohuLomdSxYS0D
	UibqFR9kuEJWnB9JxML0KdWqye97IXH72KBVvsfzUfPGaWNAOAQD5cA1csqnblZvLs3puV8VCVlVU
	CPyo141my4qU1VwKvdlBKM6oxMhUCrNaVongdIPqy43yiI/jlNwpAuGv5SHz08OqUGu+GErRlI/Gq
	JwWPO836Tk/1KgiCF5FumUVtKZC+mixgZSfKqgYFW5FNSX8KBwZTGv6Xbvbg1l7zxyBJh02OQtqmq
	rl5QI9UA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ltS-00000007wzq-3xEg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 12:48:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E02649F2A;
	Mon,  7 Apr 2025 12:47:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD1D1C4CEE7;
	Mon,  7 Apr 2025 12:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744030079;
	bh=KEDPVE33uQKjxzGqy3bcfJL5Q/mx4ddBU49uxTRs+Rk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=C/HzPV+0IWPNdEnGyAEliW8SgzV6uzSCnQfPsNEC8XhWhr6AbCwbTOHoKNvjmg5Jn
	 DeW1wI71Wh+5+RXPBO55pRCv9rlQtHmOotWufjr55PgBLHBMBNsNa8ljvA7Msx4Gf+
	 W1U2OWnBGMW0VueP3gxHMp8EK1tSXWQKoYLZhzL4ueHEIzSIvwse+mSenjPsNLQCk8
	 JAzWjSnQepfYSgSIg6Krn23ke9vQNuOIzG5Z9pyQT6h7DreRup/CE4E3VzzkTnC7DV
	 gD+9N2tbebyd83SvarpzjbDtIbLngWbXR4ArcdVAm41zGc5ECGAeLlrd/tjwNMSZ7u
	 HQPFoFOi5h5kg==
Date: Mon, 07 Apr 2025 07:47:57 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-crypto@vger.kernel.org, Olivia Mackall <olivia@selenic.com>, 
 William Zhang <william.zhang@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, Ray Jui <rjui@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>
To: Linus Walleij <linus.walleij@linaro.org>
In-Reply-To: <20250406-bcmbca-peripherals-arm-v2-0-22130836c2ed@linaro.org>
References: <20250406-bcmbca-peripherals-arm-v2-0-22130836c2ed@linaro.org>
Message-Id: <174402971847.1782936.5442564444780183051.robh@kernel.org>
Subject: Re: [PATCH v2 00/12] ARM: bcm: Add some BCMBCA peripherals
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_134803_392407_3C10FBBD 
X-CRM114-Status: GOOD (  31.85  )
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


On Sun, 06 Apr 2025 17:32:40 +0200, Linus Walleij wrote:
> This adds a bunch peripherals to the Broadcom BRCMBCA
> SoC:s that I happened to find documentation for in some
> vendor header files.
> 
> It started when I added a bunch of peripherals for the
> BCM6846, and this included really helpful peripherals
> such as the PL081 DMA, for which I think the most common
> usecase is to be used as a memcpy engine to offload
> transfer of blocks from NAND flash to/from the NAND
> flash controller (at least this is how the STMicro
> FSMC controller was using it).
> 
> So I took a sweep and added all the stuff that has
> bindings to:
> 
> ARM:
> - BCM6846
> - BCM6855
> - BCM6878
> - BCM63138
> - BCM63148
> - BCM63178
> 
> ARM64:
> - BCM4908
> - BCM6856
> - BCM6858
> - BCM63158
> 
> There are several "holes" in this SoC list, I simply
> just fixed those that I happened to run into documentation
> for.
> 
> Unfortunately while very similar, some IP blocks vary
> slightly in version, the GPIO block is differently
> integrated on different systems, and the interrupt assignments
> are completely different, so it's safest to add these to each
> DTSI individually.
> 
> I add the interrupt binding for the RNG block in the
> process as this exists even if Linux isn't using the
> IRQ, and I put the RNG and DMA engines as default-enabled
> because they are not routed to the outside and should
> "just work" so why not.
> 
> I did a rogue patch adding some stuff to BCM6756 based
> on guessed but eventually dropped it. If someone has
> docs for this SoC I can add it.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Changes in v2:
> - Pick up Krzysztof's ACK
> - Push the BCM6858 DMA block into its own simple bus.
> - Fix GPIO node names and registers on BCM63138.
> - Fix GPIO node names and registers on BCM63148.
> - Link to v1: https://lore.kernel.org/r/20250328-bcmbca-peripherals-arm-v1-0-e4e515dc9b8c@linaro.org
> 
> ---
> Linus Walleij (12):
>       ARM: dts: bcm6878: Correct UART0 IRQ number
>       dt-bindings: rng: r200: Add interrupt property
>       ARM: dts: bcm6846: Add interrupt to RNG
>       ARM: dts: bcm6855: Add BCMBCA peripherals
>       ARM: dts: bcm6878: Add BCMBCA peripherals
>       ARM: dts: bcm63138: Add BCMBCA peripherals
>       ARM: dts: bcm63148: Add BCMBCA peripherals
>       ARM: dts: bcm63178: Add BCMBCA peripherals
>       ARM64: dts: bcm4908: Add BCMBCA peripherals
>       ARM64: dts: bcm6856: Add BCMBCA peripherals
>       ARM64: dts: bcm6858: Add BCMBCA peripherals
>       ARM64: dts: bcm63158: Add BCMBCA peripherals
> 
>  .../devicetree/bindings/rng/brcm,iproc-rng200.yaml |   6 +
>  arch/arm/boot/dts/broadcom/bcm63138.dtsi           |  79 ++++++++++-
>  arch/arm/boot/dts/broadcom/bcm63148.dtsi           |  64 +++++++++
>  arch/arm/boot/dts/broadcom/bcm63178.dtsi           | 112 +++++++++++++++
>  arch/arm/boot/dts/broadcom/bcm6846.dtsi            |   1 +
>  arch/arm/boot/dts/broadcom/bcm6855.dtsi            | 127 +++++++++++++++++
>  arch/arm/boot/dts/broadcom/bcm6878.dtsi            | 120 ++++++++++++++++-
>  arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi   | 122 ++++++++++++++++-
>  arch/arm64/boot/dts/broadcom/bcmbca/bcm63158.dtsi  | 150 ++++++++++++++++++++-
>  arch/arm64/boot/dts/broadcom/bcmbca/bcm6856.dtsi   | 138 ++++++++++++++++++-
>  arch/arm64/boot/dts/broadcom/bcmbca/bcm6858.dtsi   | 127 ++++++++++++++++-
>  11 files changed, 1037 insertions(+), 9 deletions(-)
> ---
> base-commit: 8359b1e7edc722d4b1be26aa515041a79e4224a3
> change-id: 20250327-bcmbca-peripherals-arm-dfb312052363
> 
> Best regards,
> --
> Linus Walleij <linus.walleij@linaro.org>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: base-commit 8359b1e7edc722d4b1be26aa515041a79e4224a3 not known, ignoring
 Base: attempting to guess base-commit...
 Base: tags/v6.14-rc6-274-gf4e35e5f940c (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/broadcom/' for 20250406-bcmbca-peripherals-arm-v2-0-22130836c2ed@linaro.org:

arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dtb: pcie@12000: 'device_type' is a required property
	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#






