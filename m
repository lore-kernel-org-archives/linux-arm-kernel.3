Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663B3C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 22:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=i1zJX2EY1qjHmK7uncq6ApGkaGV0L3csaXUWzoaHMvE=; b=Wpwwxu78CigWpq
	j/g+WyHHWmMRQ1L/EkUk51GSbAurtXhQp4JeqKc+5T4krYexHX122NHC+OQIMwvWlwv3hNRed/LLY
	Jn6rdLIa0961pkuF+VtvYZ78I9uZfj2+efgAiAMtsDCWzJ+BJt4HFeW1zxEnK8fPAhk0f9BPBB8S2
	xDEh3ifcYf+tViAAWEULCw9+SLLmSYntOoqkM20/VkuxQJVfsRtEMC+n2zXj6H1LLsq7aXl/eBFUJ
	IFWdtK+qqKU+JuxcH8ZYLYyBkQgFp58EKhJL/T0t01SXLONjNsYS4Zmue/Lt7wujt72+9LidMwMQW
	RNslX+lENIodAfBrKgVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUZ59-0000000A8pH-1mQT;
	Wed, 25 Jun 2025 22:59:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUYQK-0000000A383-2DhE;
	Wed, 25 Jun 2025 22:16:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A20CB615F0;
	Wed, 25 Jun 2025 22:16:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2720CC4CEEA;
	Wed, 25 Jun 2025 22:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750889815;
	bh=JPCUTE7k+d+bV0g/ym3IuJKj3lnwuQfByYVszEgGuWY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=FRgvI8Ki3o+8iAvZxOIOLv4YJj2pE/da5dKHPk4INdG0jov6rqfxyEemaXfjw7Gch
	 7/EpZGNRiorCi7p4OgarRC8qCQ/dx0UQ9I2J3SoVMztSbhHzrqfQSuT5BuAZWrnCwa
	 0Gf4FPtA2UdyAGdoY7lWk0pnZG+LvElbmEFkd4erB8Ioo259Q2nrKXZ55Hh9EC0oXK
	 /Q4N+vlPGYoJ5/LWKa3MzpD9yjxG6/yfB+QoaWFgwrx9j4i7mUTYPOOdtxwcB+6NlK
	 o14doDX3YsC5c5DLWuPCeGWr/HKA5g9BOUlP184kbOtrpIE2lKxBg1GnhPxjAbEP3Y
	 Vwjm1PXyLnUZg==
Date: Wed, 25 Jun 2025 17:16:53 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: "bhelgaas@google.com" <bhelgaas@google.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"vkoul@kernel.org" <vkoul@kernel.org>,
	"kishon@kernel.org" <kishon@kernel.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"elbadrym@google.com" <elbadrym@google.com>,
	"romlem@google.com" <romlem@google.com>,
	"anhphan@google.com" <anhphan@google.com>,
	"wak@google.com" <wak@google.com>,
	"yuxiaozhang@google.com" <yuxiaozhang@google.com>,
	BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: =?utf-8?B?5Zue6KaGOiDlm57opoY=?= =?utf-8?Q?=3A?= [PATCH 5/7]
 ARM: dts: aspeed-g6: Add PCIe RC node
Message-ID: <20250625221653.GA1590146@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR06MB51346BC9292066243CB845699D7BA@SEYPR06MB5134.apcprd06.prod.outlook.com>
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

On Wed, Jun 25, 2025 at 08:27:26AM +0000, Jacky Chou wrote:
> > > > > +				resets = <&syscon ASPEED_RESET_H2X>,
> > > > > +					 <&syscon ASPEED_RESET_PCIE_RC_O>;
> > > > > +				reset-names = "h2x", "perst";
> > > >
> > > > PERST# is clearly a per-Root Port item since it's a signal on the
> > > > PCIe connector.  Can you separate this and any other per-Root Port
> > > > things into a Root Port stanza to leave open the possibility of
> > > > future hardware that supports multiple Root Ports in the RC?
> > >
> > > The PCIe RC that designed by us is only one root port.
> > 
> > Yes.  But this driver may be used in the future for other RCs that include more
> > than one Root Port, and it would be good if that didn't require structural
> > changes to the DT.  Also, there are RCs from other vendors that include more
> > than one Root Port, and I'd like all the DTs and drivers to have similar
> > structure.
> 
> Thanks.
> Is the "pciec" node in arch/arm/boot/dts/marvell/armada-385.dtsi
> what you said?  Or could you provide some examples for us to modify
> our pcie rc node?

Here are some examples of DT bindings and corresponding driver code:

* drivers/pci/controller/dwc/pcie-kirin.c
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/pci/hisilicon,kirin-pcie.yaml?id=v6.16-rc1#n108

    kirin_pcie_parse_port():
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/controller/dwc/pcie-kirin.c?id=v6.16-rc1#n399

* drivers/pci/controller/pci-mvebu.c
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/pci/marvell,kirkwood-pcie.yaml?id=v6.16-rc1#n125

    mvebu_pcie_parse_port():
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/controller/pci-mvebu.c?id=v6.16-rc1#n1252

* drivers/pci/controller/pcie-mt7621.c
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml?id=v6.16-rc1#n111

    mt7621_pcie_parse_port():
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/controller/pcie-mt7621.c.c?id=v6.16-rc1#n198

* drivers/pci/controller/pcie-mediatek.c
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/pci/mediatek-pcie.txt?id=v6.16-rc1#n85

    mtk_pcie_parse_port():
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/controller/pcie-mediatek.c.c?id=v6.16-rc1#n909


