Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B952C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 19:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=zhPiFD8lHrA9LIQgH1CDhwE2S8BqcwaksiGkQM55J+M=; b=mAbjwn5eN1uBp5BOl5jfsQfhQH
	GlcD9KqGhZczA4uPVNG/EGp7/zqeNWeGs4a8zuYEcPKZFN/HqNFyPbtekodhQydkxWJCdnrQJOPMw
	YrfALRknn4/ATNcIpuOSf9rbVKrMf66QByMNLe/sDRiKjpLNyClbtxcfkcKOz4vD9KstRLV9eFh4k
	ICONNmL5trup9NJXtdHPSVd6DZ3RUXtLTma25hL/O7/yswauittNIj0qjMFja5f4ax+VbpMSMCSoU
	O20bbOxvm7F6QTAyYLlmYtclHMtKv5DVtiit6VP/tiOZCjJBRncoSihbgu3yDjUFd2fLX2+hhqn47
	8MckAgUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYVsN-0000000FwRp-1zOa;
	Thu, 16 Jan 2025 19:49:59 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYVoW-0000000FvpC-3MK6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 19:46:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 18130A42773;
	Thu, 16 Jan 2025 19:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E612C4CED6;
	Thu, 16 Jan 2025 19:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737056759;
	bh=Z4fTIg6gNmMApeJJjsSAkuq+axk4BmTLC+837MYkmZA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=uoV7mDUaO8Z9fQ26Wjz7CGcfFE60n7XzpxVLPVL80QvFwQD2MVJRuo+jNp9GXmPRE
	 eBNuhB05yUxnq9M7Iguyr+CJtIknO1LFb2yeBbrbMj5lap/A4TgzQTBc7EjggHsQVe
	 O8OF7wyRjUDtN9rB3qqwsnl/mD+SEs69u8fW+kP+TcQy1Ivl5LOq23YjBPZf+DXZ+G
	 UU4JaZ1OsNhluhNQcU8mOBCbPVP2l0BFUevxymztwp4JPpFrDbdZe6AecmwhojKYeo
	 Cy94X450HJrsI78uEBOsYIL8c2wJ5izJRHuvs1REjUNdBsOWF5qmWhgnvhTYPp3CA2
	 Jl3xWRqrOeTbQ==
Date: Thu, 16 Jan 2025 13:45:58 -0600
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
Message-ID: <20250116194558.GA595994@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z4lKIJ8nDst7rqCs@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_114600_963193_A39A29A7 
X-CRM114-Status: GOOD (  28.10  )
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

On Thu, Jan 16, 2025 at 01:04:16PM -0500, Frank Li wrote:
> On Thu, Jan 16, 2025 at 09:32:39AM -0600, Bjorn Helgaas wrote:
> > On Tue, Nov 19, 2024 at 02:44:21PM -0500, Frank Li wrote:
> > >                    Endpoint
> > >   ┌───────────────────────────────────────────────┐
> > >   │                             pcie-ep@5f010000  │
> > >   │                             ┌────────────────┐│
> > >   │                             │   Endpoint     ││
> > >   │                             │   PCIe         ││
> > >   │                             │   Controller   ││
> > >   │           bus@5f000000      │                ││
> > >   │           ┌──────────┐      │                ││
> > >   │           │          │ Outbound Transfer     ││
> > >   │┌─────┐    │  Bus     ┼─────►│ ATU  ──────────┬┬─────►
> > >   ││     │    │  Fabric  │Bus   │                ││PCI Addr
> > >   ││ CPU ├───►│          │Addr  │                ││0xA000_0000
> > >   ││     │CPU │          │0x8000_0000            ││
> > >   │└─────┘Addr└──────────┘      │                ││
> > >   │       0x7000_0000           └────────────────┘│
> > >   └───────────────────────────────────────────────┘
> > >
> > > Use 'ranges' property in DT to configure the iATU outbound window address.
> > > The bus fabric generally passes the same address to the PCIe EP controller,
> > > but some bus fabrics map the address before sending it to the PCIe EP
> > > controller.
> > >
> > > Above diagram, CPU write data to outbound windows address 0x7000_0000, Bus
> > > fabric map it to 0x8000_0000. ATU should use bus address 0x8000_0000 as
> > > input address and map to PCI address 0xA000_0000.
> > >
> > > Previously, 'cpu_addr_fixup()' was used to handle address conversion. Now,
> > > the device tree provides this information, preferring a common method.
> > >
> > > bus@5f000000 {
> > > 	compatible = "simple-bus";
> > > 	ranges = <0x80000000 0x0 0x70000000 0x10000000>;
> > >
> > > 	pcie-ep@5f010000 {
> > > 		reg = <0x80000000 0x10000000>;
> > > 		reg-names ="addr_space";
> > > 		...
> > > 	};
> > > 	...
> > > };
> > >
> > > 'ranges' in bus@5f000000 descript how address map from CPU address to bus
> > > address.
> >
> > Shouldn't there also be a pcie-ep@5f010000 'ranges' property to
> > describe the translation for the window from bus addr 0x8000_0000 to
> > PCI addr 0xA000_0000?
> 
> Needn't 'ranges' under pcie-ep@5f010000 because history reason. DWC use
> reg-names "addr_space" descript outbound windows space.

If reg-name "addr_space" is used instead of 'ranges' for some
historical reason, we should mention that in the commit log so people
don't assume that this difference is the way it's *supposed* to be
done.

I only see "addr_space" mentioned in
Documentation/devicetree/bindings/pci/*-ep.yaml, so I assume
this "addr_space" usage only applies to endpoints?  

> > > Use `of_property_read_reg()` to obtain the bus address and set it to the
> > > ATU correctly, eliminating the need for vendor-specific cpu_addr_fixup().
> >
> > Why is this different from [1], where parent_bus_addr comes from the
> > 'ranges' property?  Isn't this the same exact kind of address
> > translation for both RC and EP mode?
> 
> The method is the same, but space means is difference.
> 
> RC side:
>    regs, 1: controller register, 2: config space, (although it should be
> in ranges)
>    ranges, (IO range and Memory range).
> 
> EP side:
>    regs, 1: controller register, 2: outbound windows space.("addr_space")
> 
> All regs need call of_property_read_reg() to get untranslated address.
> ranges:  use "parent_bus_addr" in [1].

I think we should at least use the same name ("parent_bus_addr", not
"bus_addr_base") and probably also figure out a wrapper or similar way
to use 'ranges' for future endpoint drivers and fall back to
"addr_space" for DWC.

> > [1] https://lore.kernel.org/r/20241119-pci_fixup_addr-v8-1-c4bfa5193288@nxp.com

> > > +++ b/drivers/pci/controller/dwc/pcie-designware.h
> > > @@ -410,6 +410,7 @@ struct dw_pcie_ep {
> > >  	struct list_head	func_list;
> > >  	const struct dw_pcie_ep_ops *ops;
> > >  	phys_addr_t		phys_base;
> > > +	u64			bus_addr_base;
> > >  	size_t			addr_size;
> > >  	size_t			page_size;
> > >  	u8			bar_to_atu[PCI_STD_NUM_BARS];

