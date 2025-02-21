Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1292C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 18:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=hspZqKnDsW+0SMjzjTTSl903U3dGoPMdHv6ZvoqxDJI=; b=k3ygvmcsGp9ONho0DPgo94CowQ
	PxRgNejl0PS8/94O9KINcnPy2FCJYCgyHI8lHaLcev2+5BHK2/TI3fPb+kZ4TFJq/2uk4ny3JhTVX
	1/P6CM8C+QTroOt6zmhm5mMdt9xZTI/E9ULTFQMmcbzBzaswNBv3MT9Q7htyCX6R1frbHSAOOGi/t
	6L3dvMUaLAYVhL6UnOC5qbsSSC5bpoP9KBjoaBs0AY+qpZ6F49iIth93mp5CXeprZnMfygGTmUDVm
	inU6J47vdJjHw0sHCOSAdIJfolcraond0Lc9CGgPMjfWE3gkFFh9gZ9vbi1X1A5AnGYkakBc7Qj2I
	+VSSwkHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlXqj-00000006XyZ-08hW;
	Fri, 21 Feb 2025 18:34:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlXoF-00000006XV6-3N9V;
	Fri, 21 Feb 2025 18:31:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B19216160F;
	Fri, 21 Feb 2025 18:31:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F4CC4CED6;
	Fri, 21 Feb 2025 18:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740162694;
	bh=w9dzlHwE4zOZSXrrOMFXhcyCGCwY0q2gs3vSEVl5ROo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=TSsUI0O/LPq4tUi+VtJdBejS0VyBbnZ9CEQNTq6bY3jWmDeMZfurbKC+P/JikOtij
	 VvFnMYIIAlWnK42mwCiGL8Fr36g/om3oZRKfQ+X8Ze0QKjeykT31YPfp+XgAFjmzmL
	 PYcjuUSFIt8oVFLrci4VItDo0qKSxr5YDZJ5zw11zKtY4muX2F8VxrChohhPPqm5rX
	 +7hRYvXXSbUUEfo+cY07eMcnrMPTK1+vVgZy3jNk4z8HeRoMKkanA9k6ge3pj+YIpD
	 Ba6EU1qw4JLJ9EXASUOk5rpXPSWnRm+wCZfc//WkJnFrHSZvWQkc1O3/lOMr1/5Z0K
	 GHTSL2mAKWmKQ==
Date: Fri, 21 Feb 2025 12:31:31 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Hui Ma =?utf-8?B?KOmprOaFpyk=?= <Hui.Ma@airoha.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <Ryder.Lee@mediatek.com>,
	Jianjun Wang =?utf-8?B?KOeOi+W7uuWGmyk=?= <Jianjun.Wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Frank Li <Frank.li@nxp.com>, upstream <upstream@airoha.com>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjIgMi8y?= =?utf-8?Q?=5D_PCI?=
 =?utf-8?Q?=3A?= mediatek-gen3: Configure PBUS_CSR registers for EN7581 SoC
Message-ID: <20250221183131.GA353053@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SG2PR03MB6341ACD4DADDB280A8ACAA29FFC72@SG2PR03MB6341.apcprd03.prod.outlook.com>
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

On Fri, Feb 21, 2025 at 09:30:40AM +0000, Hui Ma (马慧) wrote:
> > On Thu, Feb 20, 2025 at 08:54:06PM +0100, Lorenzo Bianconi wrote:
> > > On Feb 20, Bjorn Helgaas wrote:
> > > > On Sun, Feb 02, 2025 at 08:34:24PM +0100, Lorenzo Bianconi wrote:
> > > > > Configure PBus base address and address mask to allow the hw to 
> > > > > detect if a given address is on PCIE0, PCIE1 or PCIE2.
> > 
> > > > > +#define PCIE_EN7581_PBUS_ADDR(_n)	(0x00 + ((_n) << 3))
> > > > > +#define PCIE_EN7581_PBUS_ADDR_MASK(_n)	(0x04 + ((_n) << 3))
> > > > > +#define PCIE_EN7581_PBUS_BASE_ADDR(_n)	\
> > > > > +	((_n) == 2 ? 0x28000000 :	\
> > > > > +	 (_n) == 1 ? 0x24000000 : 0x20000000)
> > > > 
> > > > Are these addresses something that should be expressed in devicetree?
> > > 
> > > Do you have any example/pointer for it?
> > > 
> > > > It seems unusual to encode addresses directly in a driver.
> > > 
> > > AFAIK they are fixed for EN7581 SoC.
> > 
> > So this is used to detect if a given address is on PCIE0, PCIE1 or
> > PCIE2.  What does that mean?  There are no other mentions of PCIE0
> > etc in the driver, but maybe they match up to "pcie0/1/2" in
> > arch/arm64/boot/dts/mediatek/mt7988a.dtsi?
> > 
> > It looks like you use PCIE_EN7581_PBUS_ADDR(slot), where "slot"
> > came from of_get_pci_domain_nr(), which suggests that these might
> > be three separate Root Ports?
> 
> >I was using pci_domain to detect the specific PCIe controller
> >(something similar to what is done here [0]) but I agree with
> >Frank, it does not seem completely correct.
> 
> > [0] https://github.com/torvalds/linux/blob/master/drivers/pci/controller/pcie-mediatek.c#L1048
> 
> > Are we talking about an MMIO address that an endpoint driver uses
> > for readw() etc, and this code configures the hardware apertures
> > through the host bridge?  Seems like that would be related to the
> > "ranges" properties in DT.
> 
> >I guess so, but I do not have any documentation about pbus-csr
> >(adding Hui in the loop).
> 
> >As pointed out by Frank, do you agree to add these info in the dts?
> >Something like:
> 
> >pcie0: pcie@1fc00000 {
> >	....
> >	mediatek,pbus-csr = <&pbus_csr 0x0 0x20000000 0x4 0xfc000000>;
> >	....
> >};
> >
> >pcie1: pcie@1fc20000 {
> >	....
> >	mediatek,pbus-csr = <&pbus_csr 0x8 0x24000000 0xc 0xfc000000>;
> >	....
> >};
> 
> >@Hui: can you please provide a better explanation about pbus-csr usage?
>
> 	Pbus-csr (base and mask) is used to determine the address
> 	range can be access by PCIe bus.
> 
> 1FBE3400 PCIE0_MEM_BASE 32 PCIE0 base address
> 1FBE3404 PCIE0_MEM_MASK 32 PCIE0 base address mask
> 1FBE3408 PCIE1_MEM_BASE 32 PCIE1 base address
> 1FBE340C PCIE1_MEM_MASK 32 PCIE1 base address mask
> 1FBE3410 PCIE2_MEM_BASE 32 PCIE2 base address
> 1FBE3414 PCIE2_MEM_MASK 32 PCIE2 base address mask

"Can be accessed by PCIe bus" sounds like DMA.  Is that what you mean?

I doubt it, because if you have multiple host bridges, I assume they
would all be able to handle DMA to all of system memory.

It would make more sense if this is some sort of description of host
bridge apertures, e.g., something like this to allow CPU MMIO accesses
to reach the first 2GB of PCI memory space below any of the pcie0,
pcie1, pcie2 host bridges:

  pcie0 0000:00: root bus resource [mem 0x84000000000-0x8407fffffff] (bus address [0x00000000-0x7fffffff])
  pcie1 0001:00: root bus resource [mem 0x84100000000-0x8417fffffff] (bus address [0x00000000-0x7fffffff])
  pcie2 0002:00: root bus resource [mem 0x84200000000-0x8427fffffff] (bus address [0x00000000-0x7fffffff])

But I think this would be described via 'ranges' properties.  And I
think it would make sense if the driver had to learn this address map
from devicetree and program it into the hardware, so maybe that's
what Pbus-csr is for?  Total speculation on my part.

Bjorn

