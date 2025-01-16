Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58556C02188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 22:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=0d9uQ98G3HPnvgNch1C9/gMR5EzR33uCZpQrl5b2xO0=; b=Ie4U63D3pcqtAdoTGHHoOhaThz
	NNtpf43rdNL8Fy5624EClpa4u71yejMdSEhzegfRCOxjTxYSIpLLrXw5neId5EfKBe6JKu1j4t7ww
	xaFWOnc7gExik2+DmWN/+X1/S+vf2L87HEoZlvxpNzqD6mlJRa2RbWw856ra+sOgsYlQV8HMFRjIN
	5uiYXf/SaRgSuWMrdWP9JcGzHUUzZqsHpEHFTgsVUvFpDq3Pd5kTRk/lGey55PE2hciYEEA/vwToi
	FLbCrVDA2BqE08slkz1qHyh9LACCADCPnW/AEjaFOcY4e/qE1QUn8ayA/Ii11pXrxOWW/1qyn8c10
	Odi7tNPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYYis-0000000GFZh-1b2H;
	Thu, 16 Jan 2025 22:52:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYYfh-0000000GF2T-01xi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 22:49:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BF19A5C5E76;
	Thu, 16 Jan 2025 22:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CD02C4CED6;
	Thu, 16 Jan 2025 22:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737067744;
	bh=5aThHilBPblCgfz/BgJ0mgjfS1hGQLJWECyx+bt7Wt0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=szH71zQEi99amVjmugt5JvwXVGZ+pHOC18l1Q3auVKFW/ZAPJDY42oap4KZ82aiY+
	 gjkfq/RF3lhECK8PSywzROXubYGQyzvw2tUXdzMc3GyHx18tWlc6MoSyxouoCuqslY
	 F6wK7L7kbao7cwJg09R+JlwmmSVBswp8QDIL8JZRybxm62s5l+ZC1Iw5hll5y86Gtm
	 HWoIoBjPagiX5tawGzfr3aQzJbXl94B6fySIbLUIIVcez2xiSB0ktxVQ5Pg2yqbpbx
	 wXT/lV/5PjfbUkAIYeSiogqzX03X6RU14RyyGGA9soRDPKqUTTTi711X6fAtnCf0Zt
	 c9FqqjDAf48AA==
Date: Thu, 16 Jan 2025 16:49:02 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH v8 3/7] PCI: dwc: ep: Add bus_addr_base for outbound
 window
Message-ID: <20250116224902.GA614046@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z4ll5Ktyh5kmTzsd@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_144905_136379_61C367B0 
X-CRM114-Status: GOOD (  29.35  )
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

On Thu, Jan 16, 2025 at 03:02:44PM -0500, Frank Li wrote:
> On Thu, Jan 16, 2025 at 01:45:58PM -0600, Bjorn Helgaas wrote:
> > On Thu, Jan 16, 2025 at 01:04:16PM -0500, Frank Li wrote:
> > > On Thu, Jan 16, 2025 at 09:32:39AM -0600, Bjorn Helgaas wrote:
> > > > On Tue, Nov 19, 2024 at 02:44:21PM -0500, Frank Li wrote:
> > > > >                    Endpoint
> > > > >   ┌───────────────────────────────────────────────┐
> > > > >   │                             pcie-ep@5f010000  │
> > > > >   │                             ┌────────────────┐│
> > > > >   │                             │   Endpoint     ││
> > > > >   │                             │   PCIe         ││
> > > > >   │                             │   Controller   ││
> > > > >   │           bus@5f000000      │                ││
> > > > >   │           ┌──────────┐      │                ││
> > > > >   │           │          │ Outbound Transfer     ││
> > > > >   │┌─────┐    │  Bus     ┼─────►│ ATU  ──────────┬┬─────►
> > > > >   ││     │    │  Fabric  │Bus   │                ││PCI Addr
> > > > >   ││ CPU ├───►│          │Addr  │                ││0xA000_0000
> > > > >   ││     │CPU │          │0x8000_0000            ││
> > > > >   │└─────┘Addr└──────────┘      │                ││
> > > > >   │       0x7000_0000           └────────────────┘│
> > > > >   └───────────────────────────────────────────────┘
> > > > >
> > > > > Use 'ranges' property in DT to configure the iATU outbound window address.
> > > > > The bus fabric generally passes the same address to the PCIe EP controller,
> > > > > but some bus fabrics map the address before sending it to the PCIe EP
> > > > > controller.
> > > > >
> > > > > Above diagram, CPU write data to outbound windows address 0x7000_0000, Bus
> > > > > fabric map it to 0x8000_0000. ATU should use bus address 0x8000_0000 as
> > > > > input address and map to PCI address 0xA000_0000.
> > > > >
> > > > > Previously, 'cpu_addr_fixup()' was used to handle address conversion. Now,
> > > > > the device tree provides this information, preferring a common method.
> > > > >
> > > > > bus@5f000000 {
> > > > > 	compatible = "simple-bus";
> > > > > 	ranges = <0x80000000 0x0 0x70000000 0x10000000>;
> > > > >
> > > > > 	pcie-ep@5f010000 {
> > > > > 		reg = <0x80000000 0x10000000>;
> > > > > 		reg-names ="addr_space";
> > > > > 		...
> > > > > 	};
> > > > > 	...
> > > > > };
> > > > >
> > > > > 'ranges' in bus@5f000000 descript how address map from CPU address to bus
> > > > > address.
> > > >
> > > > Shouldn't there also be a pcie-ep@5f010000 'ranges' property to
> > > > describe the translation for the window from bus addr 0x8000_0000 to
> > > > PCI addr 0xA000_0000?
> > >
> > > Needn't 'ranges' under pcie-ep@5f010000 because history reason. DWC use
> > > reg-names "addr_space" descript outbound windows space.
> >
> > If reg-name "addr_space" is used instead of 'ranges' for some
> > historical reason, we should mention that in the commit log so people
> > don't assume that this difference is the way it's *supposed* to be
> > done.
> 
> How about add comments after
> 
> reg-names ="addr_space"; // Indicate EP outbound windows space instead use
> ranges by histortical reason.

OK, that seems reasonable.

Where does the 0xA000_0000 PCI address come from?  I assume that's in
DT somewhere too?

Is there a binding in the tree that would take advantage of this patch
that I can look at?  arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi 
has bus@5f000000 that does this translation, but I don't see any
endpoint mode that uses it.

> > > All regs need call of_property_read_reg() to get untranslated address.
> > > ranges:  use "parent_bus_addr" in [1].
> >
> > I think we should at least use the same name ("parent_bus_addr", not
> > "bus_addr_base") and probably also figure out a wrapper or similar way
> > to use 'ranges' for future endpoint drivers and fall back to
> > "addr_space" for DWC.
> 
> Okay for name parent_bus_addr.
> Do you need me to respin it? Or you change it by yourself?

I can do that.

Bjorn

> > > > [1] https://lore.kernel.org/r/20241119-pci_fixup_addr-v8-1-c4bfa5193288@nxp.com

