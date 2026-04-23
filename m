Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6310F99355
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 09:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x0ZBE4dg5MTSDcUZ11xcU79ovb1gqZ+Yi/Qx0+lbeYA=; b=XJS5z6ttC63L5DkQDXD8Khdlqs
	QCwIqJ3Lmffg1g2FrONMFkH8gh4nc3o7em5ry44AQCcTJ97ksMB6nl2xOlgrG2fw/I6MetU7PVG3z
	NZfUhGF6FCy1jj7ChvdoKobMsYaeX9/NWzUIAlD6+sKFk3A7sPhW5Y2SJ8SgHVpe3fCelBR+Z/zlI
	Q7Vj70lEopsdHleSk8b78oxbd8jOo2oG2tDLThdXe1lbCg1xIy9738LJyDonoil0T+XwfQGtTzH/8
	hTMVeefCwMXQJXa2hfo6g/kkVmYmFYTEXw4fw4wl1m568B/dH2nVtPmEfij0bYRfY9wqCAvEhhJIv
	SfoxPd2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFq3N-0000000BJJX-2pIl;
	Thu, 23 Apr 2026 09:08:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFq3I-0000000BJHx-0M1T;
	Thu, 23 Apr 2026 09:08:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F54743B05;
	Thu, 23 Apr 2026 09:08:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68B21C2BCB2;
	Thu, 23 Apr 2026 09:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776935331;
	bh=AajPNYE6TFj2rP8H0CMm3qNBnbsYRpDyKEMrNNFlxC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=buIvE1hsbJLLTrrhVVInDJ2ppacZAzbWKDKaPq3D5fxir4QDSzXw5/bUi94QI/gB/
	 agTq+n3xUnZk53cML3ywFrnM4fs/MthZL2HqxNpPgf85zeFi/iJLjj7q5S2odwMwOD
	 EHbLwoBU/D+5yj/MiVV8baAq1sbM8fTmy/B6d775kLk9BMH3DOCVLcEJ1yVgprGcoO
	 EmGFxkXuI2NxafoVx9x47wz9AqD5m3wp/lGtspAYLxgo2vjB3ZcuBX03TSj9JmtVBs
	 +97FFXhfu8t2J2SiFzeUB8Fw600HWOK1cC8YFZQmraCTuwFXriNPrTY8g8U69VIaSB
	 eMQ9nIQPKTOMw==
Date: Thu, 23 Apr 2026 11:08:43 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linusw@kernel.org>, Lei Xue <lei.xue@mediatek.com>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	yong.mao@mediatek.com, qingliang.li@mediatek.com,
	Fred-WY.Chen@mediatek.com, ot_cathy.xu@mediatek.com,
	ot_shunxi.zhang@mediatek.com, ot_yaoy.wang@mediatek.com,
	ot_ye.wang@mediatek.com, linux-acpi@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH 2/3] pinctrl: mediatek: Add acpi support
Message-ID: <aenhm/YOAMwjiBzh@lpieralisi>
References: <20251125023639.2416546-1-lei.xue@mediatek.com>
 <20251125023639.2416546-3-lei.xue@mediatek.com>
 <CAD++jL=h4ZEgrjgGOfgFyAXBM7EL91ZD-La82UQ7GPOXv8h9WQ@mail.gmail.com>
 <aScwaxBG53dnZ4a4@lpieralisi>
 <aSdBu-B9mwU2-1_S@smile.fi.intel.com>
 <aSgipbe75hrwhTD7@lpieralisi>
 <aShgYukPRfDkq_Z0@smile.fi.intel.com>
 <aSh0EyGm9ZHAc3dN@lpieralisi>
 <aeHSl9MYGq0bRXsu@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aeHSl9MYGq0bRXsu@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_020852_175305_4BE332FB 
X-CRM114-Status: GOOD (  63.97  )
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

On Fri, Apr 17, 2026 at 09:26:31AM +0300, Andy Shevchenko wrote:
> On Thu, Nov 27, 2025 at 04:53:55PM +0100, Lorenzo Pieralisi wrote:
> > On Thu, Nov 27, 2025 at 04:29:54PM +0200, Andy Shevchenko wrote:
> > > On Thu, Nov 27, 2025 at 11:06:29AM +0100, Lorenzo Pieralisi wrote:
> > > > On Wed, Nov 26, 2025 at 08:06:51PM +0200, Andy Shevchenko wrote:
> 
> [...]
> 
> > > > > > I also assume/hope that we don't want to add a "reg-names" _DSD property either
> > > > > > in ACPI to deal with this seamlessly in DT/ACPI (that was done for
> > > > > > "interrupt-names"):
> > > > > > 
> > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/firmware-guide/acpi/enumeration.rst?h=v6.18-rc7#n188
> > > > > 
> > > > > Hmm... Why not?
> > > > 
> > > > What's the policy there ?
> > > 
> > > > Half of the ACPI bindings for an interrupt
> > > > descriptor are defined in the ACPI specs (ie _CRS) and the other half
> > > > (ie "interrupt-names") is documented in the Linux kernel (or are we
> > > > documenting this elsewhere ?) ?
> > > 
> > > Yeah, nobody pursued ACPI specification updates / addendum to make it fully
> > > official. _De facto_ we have established practice for GPIOs enumeration
> > > (as most used resources in the OSes), Linux official for PWM, I²C muxes,
> > > multi-functional HW (such as Diolan DLN-2, LJCA), Microsoft defined for
> > > so called "USB hardwired" devices, Linux defined for LEDs and GPIO keys,
> > > sensor mount matrix as per "most used" cases + DT analogue works just
> > > because we have agnostic APIs in IIO to retrieve that. There are maybe
> > > more, but don't remember
> > > 
> > > So, I think the practical "policies" are that:
> > > - if it's defined in ACPI spec, we use the spec
> > > - if there is Microsoft addendum, we rely on what Windows does
> > > - WMI, EFI, and other "windoze"-like vendor defined cases
> > > - if it makes sense, we establish practice from Linux perspective
> > > - the rest, every vendor does what it does
> > > 
> > > That said, for the first two we expect OEMs to follow, for the third one
> > > depends, but there are established WMI calls and other more or less "standard"
> > > interfaces, so like the first two.
> > > 
> > > For the fourth one (Linux) we do, but living in the expectation that some or
> > > more vendors fall to the fifth category and we might need to support that if
> > > we want their HW work in Linux.
> > > 
> > > > Or we are saying that "interrupt-names" properties are added by kernel
> > > > code _only_ (through software nodes, to make parsing seamless between DT
> > > > and ACPI) based on hardcoded name values in drivers ?
> > > 
> > > No, the idea behind software nodes is to "fix" the FW nodes in case the FW
> > > description can not be modified (and that might well happen to even DT in some
> > > cases AFAIH). So, if some driver hard codes "interrupt-names" we expect that
> > > new versions of the FW that support the HW that needs the property will be
> > > amended accordingly.
> > > 
> > > "interrupt-names" has been established for ACPI to support a separate SMB alert
> > > interrupt. However, I haven't heard any development of that IRL (for real
> > > devices in ACPI environment).
> > > 
> > > > I don't think I can grok any example of the latter in the mainline.
> > > > 
> > > > I am asking because I'd need to add something similar shortly to make parsing
> > > > of platform devices created out of ACPI static tables easier (I guess we
> > > > can postpone discussion till I post the code but I thought I'd ask).
> > > 
> > > Oh, I can go ahead and tell you, try to avoid that. Why?! Whatever,
> > > indeed, please Cc me to that, I will be glad to study the case and
> > > try to be helpful.
> > > 
> > > (Have you considered DT overlays instead? There is a big pending support for
> > >  that for _ACPI_ platforms.)
> > 
> > Long story short: we do need to create platform devices out of static
> > table (eg ARM64 IORT) entries. Current code parses the table entries and
> > try to map the devices IRQs (ie acpi_register_gsi()) when the platform
> > device is created. Now, the interrupt controller that device IRQ's is
> > routed to might not have probed yet. We have to defer probing and later,
> > when the platform driver probes, map the IRQ.
> > 
> > Issue is: for OF nodes and ACPI devices, behind the platform device
> > firmware node there is a standard firmware object, so implementing
> > fwnode_irq_get() is trivial. For the devices I am talking about,
> > the data providing GSI info (hwirq, trigger/polarity) is static
> > table specific, so the idea was to stash that data and embed it in
> > fwnode_static along with a irq_get() fwnode_operations function
> > specific to that piece of data so that device drivers can actually do:
> > 
> > fwnode_irq_get()
> > 
> > on the fwnode _seamlessly_ (if you still do wonder: those platform
> > devices created out of static table entries in ACPI in OF are
> > of_node(s)).
> > 
> > There is a less convoluted solution (that is what some platform
> > drivers in ACPI do today), that is, we pass the static table
> > data in pdev->dev.platform_data and each platform_driver parses it differently.
> > 
> > That works but that also means the in the respective device drivers
> > OF and ACPI IRQ (and MMIO) parsing differ (which is not necessarily
> > a problem I just have to rewrite them all).
> 
> Hmm... The parsing inside drivers is quite a custom case. I would avoid doing
> it if it's not device specific (I mean if it's not related to the very unique
> device or family of the devices which most likely won't appear again in the
> future). In other words, I prefer agnostic solutions over custom ones.
> 
> > Now - when it comes to "interrupt-names". Some of the device drivers
> > I mention do:
> > 
> > eg platform_get_irq_byname_optional()
> > 
> > that expects the IRQ to be mapped and stored in a named platform device resource.
> > 
> > That's easy in DT - for two reasons:
> > 
> > (1) "interrupt-names"
> > (2) standard properties behind the of_node
> > 
> > how to do that for fwnodes that aren't backed by either OF nodes or ACPI
> > devices (that do use "interrupt-names" _DSD property) is a question.
> > 
> > Mind, the "interrupt-names" thing is a detail in the whole mechanism.
> > 
> > DT overlays to represent in ACPI those static table entries ?
> > 
> > I vividly remember the days ACPI for ARM64 was being merged - that's what
> > our crystal ball predicted :)
> 
> So, the idea is to translate ACPI static table entries (which comes from IORT)
> to the IRQ fwnodes at initialisation (parsing) time?

They don't come from IORT only but that does not matter much. The point is,
we have got to have a standard way for device drivers to retrieve a HW
IRQ number for devices created out of static tables (and only code that
knows what a static table represents can initialize such fwnodes because
the interrupt fields are different in different static tables).

Lorenzo

> > This delayed IRQ mapping notwithstanding, I read what you wrote and took
> > note. The worry is, this fwnode_*() (on ACPI nodes) interface trickling
> > into subsystems where it should not (ie PCI, clocks, regulators) - hopefully
> > the respective maintainers are keeping an eye on it.
> > 
> > > > Are we going to do the same for "reg-names" ?
> > > 
> > > If it makes sense and we expect some vendor to follow that _in ACPI_,
> > > why not?
> > > 
> > > > Most importantly, what is DT maintainers stance on the matter ?
> > > 
> > > AFAIK They don't care as long as there is a schema provided, accepted and
> > > used in DT, if it's ACPI-only thing, then it most likely should be done
> > > in ACPI-like way (see above the first two / three items: spec, MS, WMI/EFI).
> > > 
> > > > > > I am sorry I have got more questions than answers here - it would be good
> > > > > > to understand where the line is drawn when it comes to OF/ACPI and fwnode
> > > > > > heuristics compatibility.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

