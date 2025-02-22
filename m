Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5132C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 00:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=oy+bmHB35J/IIj4g9aPgq7O/UDdajrtDQwmvj9WLMec=; b=DkHIeIy6YH1zRp
	Get0UxhBklkd5b2Ggy4eZxk/U00IBney5qtsB51GSaPbMiMszN85rsEIw0+6v2cDCbBeOMM6N3RdR
	D9PXfizhvm77dljnpkapabV6wyvVjjT62prxEl/cxIqTneO+DX6NCyw5louafdf42Mb3Li6rUTi3v
	O8ZQnuQeRGMv68jrdUm7zhPX5KADJ7L5pKveYZ+aXxhAI5DMJsk7cm4k1vKYaSi9nHJJ/K2XC2qZO
	ywlce3bx3X8eshDZWxpE8xO6+wpSqLlNO0oBaCY0TDPNKXUQlhFmhgqC9Zd51GZ3eBEvUccHp9bYf
	4lN5YWkyuH3ApZUHPuyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tld4u-00000007Bh6-2b1c;
	Sat, 22 Feb 2025 00:09:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tld3R-00000007Bb4-2SO2;
	Sat, 22 Feb 2025 00:07:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C6B7B5C582B;
	Sat, 22 Feb 2025 00:06:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F75AC4CED6;
	Sat, 22 Feb 2025 00:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740182856;
	bh=AWj4ITZuRanuJ+M84ptjWCJk4l50otylm68xoUwxSgs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=b2fs5jSvzjiXNBjYZMclGhfJIA7V+BQx9LiQB8PGf5kbHASKga5yF4WsFKCbBpt8M
	 dlyRA7mDkiuF4ZGwRP1NbkGuVTYM6naci/SCiqugfhxKJCQd/i1q/9Q54QbdibkdEn
	 dqgVLT3UMG4L8e1ZFFpHsLeJTxwtDh5EG/V/HDaIerZBaD/TO8IgbleYjuvzxanGqg
	 bEF3zrzxSwhYJ5h4C3zHgzMaLR+TFo7KefxHmRbcAtDu0d63+HsfgqqUqNdgc3krqP
	 wD7/HM+Fwu46kKbLlhxGP9iQWdiDFxa3a65sdM/lSya7bwWZ/QicToi6rc91engsnS
	 LJ7R4Vr+nq9Iw==
Date: Fri, 21 Feb 2025 18:07:35 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Hui Ma =?utf-8?B?KOmprOaFpyk=?= <Hui.Ma@airoha.com>,
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
Message-ID: <20250222000735.GA373804@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7kJ3Ejd4Mi_Lj0b@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_160737_734509_6DD6A442 
X-CRM114-Status: GOOD (  27.32  )
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

On Sat, Feb 22, 2025 at 12:18:52AM +0100, Lorenzo Bianconi wrote:
> [...]
> 
> > >
> > > 	Pbus-csr (base and mask) is used to determine the address
> > > 	range can be access by PCIe bus.
> > > 
> > > 1FBE3400 PCIE0_MEM_BASE 32 PCIE0 base address
> > > 1FBE3404 PCIE0_MEM_MASK 32 PCIE0 base address mask
> > > 1FBE3408 PCIE1_MEM_BASE 32 PCIE1 base address
> > > 1FBE340C PCIE1_MEM_MASK 32 PCIE1 base address mask
> > > 1FBE3410 PCIE2_MEM_BASE 32 PCIE2 base address
> > > 1FBE3414 PCIE2_MEM_MASK 32 PCIE2 base address mask
> > 
> > "Can be accessed by PCIe bus" sounds like DMA.  Is that what you mean?
> > 
> > I doubt it, because if you have multiple host bridges, I assume they
> > would all be able to handle DMA to all of system memory.
> > 
> > It would make more sense if this is some sort of description of host
> > bridge apertures, e.g., something like this to allow CPU MMIO accesses
> > to reach the first 2GB of PCI memory space below any of the pcie0,
> > pcie1, pcie2 host bridges:
> > 
> >   pcie0 0000:00: root bus resource [mem 0x84000000000-0x8407fffffff] (bus address [0x00000000-0x7fffffff])
> >   pcie1 0001:00: root bus resource [mem 0x84100000000-0x8417fffffff] (bus address [0x00000000-0x7fffffff])
> >   pcie2 0002:00: root bus resource [mem 0x84200000000-0x8427fffffff] (bus address [0x00000000-0x7fffffff])
> > 
> > But I think this would be described via 'ranges' properties.  And I
> > think it would make sense if the driver had to learn this address map
> > from devicetree and program it into the hardware, so maybe that's
> > what Pbus-csr is for?  Total speculation on my part.
> 
> I agree we should provide these info to the driver via the dts.
> 
> Do you agree to pass the register offsets, base address and base mask values
> in the 'mediatek,pbus-csr' phandle array? Something like:
> 
> pcie0: pcie@1fc00000 {
> 	...
> 	mediatek,pbus-csr = <&pbus_csr 0x0 0x20000000 0x4 0xfc000000>;
> 	...
> }
> 
> where:
> - reg offset for base address:	0x0
> - base address value:		0x20000000
> - reg offset for base mask:	0x4
> - base mask value:		0xfc000000
> 
> Or do you prefer to just pass register offsets in mediatek,pbus-csr phandle
> array and get base address values reading ranges property? Something like:
> 
> pcie0: pcie@1fc00000 {
> 	...
> 	ranges = <0x02000000 0 0x20000000 0x0 0x20000000 0 0x4000000>;
> 	...
> 	mediatek,pbus-csr = <&pbus_csr 0x0 0x4>;
> 	...
> }
> 
> Considering the latter, even if it is not a real problem for EN7581 since we
> have just a single range, what if we have multiple ranges?

I'm really hesitant about giving DT advice because I don't understand
it well, but I do think it's important to specify host bridge aperture
addresses in 'ranges' because there's lots of generic code that
expects them there.

If you have to program the aperture addresses into the hardware, those
register addresses should be described separately elsewhere.  I assume
the aperture size is configurable since you have to write a mask
value, so the driver would have to compute the mask value based on the
aperture size.

Bjorn

