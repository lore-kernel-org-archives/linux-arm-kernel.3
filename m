Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D070FF8E4A7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 06:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VXKMuBMiPnSrPl3AcCC2YAflbSMSsjt+VQi3VukI1fM=; b=vvvD58T0CJroJnCtPLTrYCZ8lE
	prqVLZV92kN2qn5UBdjLtFyO+4WqCZQQw72ouPm4eiFO8G17KX0Isaowt5BYV8u857aNXaKi0CbCA
	rbco6W1oj25jmivZzyvQjmruGLRx9hEetZW/bIsNxmO5X/gPGdUKxppxC5XUfgxFeL77JO2AeTbAt
	T5YQS5ZnXAOylMzzp2tUKNIg/0hFi9yjvCv6EG8hXxk07vl1pyLiQMMZ9QX9oCAPuEKfL+xaFVmLd
	/JnrRXVOOJF2zytRi9svFDE59uqUTj6Q/Daf1ZmH1gbQY+vaqkugjCq4Y4Upk4jQqd7w3wXXxP9+H
	YrA6D4zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDcf7-00000003X5R-20V9;
	Fri, 17 Apr 2026 06:26:45 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDcf4-00000003X4e-1uae;
	Fri, 17 Apr 2026 06:26:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776407202; x=1807943202;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=PKweS3U2RTTvyWsl1xeYbGNWADoTLnyJR9SFOYbNaf8=;
  b=Go4UzUrmj1p6/xTFQcEF1T5I97ZRtrv9NBXsK8pey0zbIybY42WYvfBO
   JgDth49zhyv81vMTUc5PWNEAFqPp8K738+9qt6q5OGyq8VUhenL9hUzkz
   tqGeqUE+SwOohPGuXGpiCpJ7REiyhbiIkuCpjCVbXkpgJokBqFxNdVXD4
   +odURkUY/Qwef4oXwtkqesw6Bd9CIaN+efo76k0EOZn4Nr+Qh24p8/it0
   VxY8jsEagf7MuA19V5T76Wh7F/hxZE0D8hwRZsIjSBQ/jD8DKf3pyzMr3
   k5aGuuTMG7HgQr+RvwG3x519N/iVQdUiPwL6oNWR5HXjiL06jXqIKC7Gk
   w==;
X-CSE-ConnectionGUID: bxj+GODtRrmK42QaDcKgdA==
X-CSE-MsgGUID: 8cZpEqQhSz63pWXzyrl8cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="94987224"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="94987224"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 23:26:39 -0700
X-CSE-ConnectionGUID: XWc4OD7/SAWNe64I+rIg3Q==
X-CSE-MsgGUID: NHsNtzFpQWm5N9y/2kynHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="235328939"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.78])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 23:26:34 -0700
Date: Fri, 17 Apr 2026 09:26:31 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
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
Message-ID: <aeHSl9MYGq0bRXsu@ashevche-desk.local>
References: <20251125023639.2416546-1-lei.xue@mediatek.com>
 <20251125023639.2416546-3-lei.xue@mediatek.com>
 <CAD++jL=h4ZEgrjgGOfgFyAXBM7EL91ZD-La82UQ7GPOXv8h9WQ@mail.gmail.com>
 <aScwaxBG53dnZ4a4@lpieralisi>
 <aSdBu-B9mwU2-1_S@smile.fi.intel.com>
 <aSgipbe75hrwhTD7@lpieralisi>
 <aShgYukPRfDkq_Z0@smile.fi.intel.com>
 <aSh0EyGm9ZHAc3dN@lpieralisi>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aSh0EyGm9ZHAc3dN@lpieralisi>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_232642_560735_E880715A 
X-CRM114-Status: GOOD (  59.81  )
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

On Thu, Nov 27, 2025 at 04:53:55PM +0100, Lorenzo Pieralisi wrote:
> On Thu, Nov 27, 2025 at 04:29:54PM +0200, Andy Shevchenko wrote:
> > On Thu, Nov 27, 2025 at 11:06:29AM +0100, Lorenzo Pieralisi wrote:
> > > On Wed, Nov 26, 2025 at 08:06:51PM +0200, Andy Shevchenko wrote:

[...]

> > > > > I also assume/hope that we don't want to add a "reg-names" _DSD property either
> > > > > in ACPI to deal with this seamlessly in DT/ACPI (that was done for
> > > > > "interrupt-names"):
> > > > > 
> > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/firmware-guide/acpi/enumeration.rst?h=v6.18-rc7#n188
> > > > 
> > > > Hmm... Why not?
> > > 
> > > What's the policy there ?
> > 
> > > Half of the ACPI bindings for an interrupt
> > > descriptor are defined in the ACPI specs (ie _CRS) and the other half
> > > (ie "interrupt-names") is documented in the Linux kernel (or are we
> > > documenting this elsewhere ?) ?
> > 
> > Yeah, nobody pursued ACPI specification updates / addendum to make it fully
> > official. _De facto_ we have established practice for GPIOs enumeration
> > (as most used resources in the OSes), Linux official for PWM, I²C muxes,
> > multi-functional HW (such as Diolan DLN-2, LJCA), Microsoft defined for
> > so called "USB hardwired" devices, Linux defined for LEDs and GPIO keys,
> > sensor mount matrix as per "most used" cases + DT analogue works just
> > because we have agnostic APIs in IIO to retrieve that. There are maybe
> > more, but don't remember
> > 
> > So, I think the practical "policies" are that:
> > - if it's defined in ACPI spec, we use the spec
> > - if there is Microsoft addendum, we rely on what Windows does
> > - WMI, EFI, and other "windoze"-like vendor defined cases
> > - if it makes sense, we establish practice from Linux perspective
> > - the rest, every vendor does what it does
> > 
> > That said, for the first two we expect OEMs to follow, for the third one
> > depends, but there are established WMI calls and other more or less "standard"
> > interfaces, so like the first two.
> > 
> > For the fourth one (Linux) we do, but living in the expectation that some or
> > more vendors fall to the fifth category and we might need to support that if
> > we want their HW work in Linux.
> > 
> > > Or we are saying that "interrupt-names" properties are added by kernel
> > > code _only_ (through software nodes, to make parsing seamless between DT
> > > and ACPI) based on hardcoded name values in drivers ?
> > 
> > No, the idea behind software nodes is to "fix" the FW nodes in case the FW
> > description can not be modified (and that might well happen to even DT in some
> > cases AFAIH). So, if some driver hard codes "interrupt-names" we expect that
> > new versions of the FW that support the HW that needs the property will be
> > amended accordingly.
> > 
> > "interrupt-names" has been established for ACPI to support a separate SMB alert
> > interrupt. However, I haven't heard any development of that IRL (for real
> > devices in ACPI environment).
> > 
> > > I don't think I can grok any example of the latter in the mainline.
> > > 
> > > I am asking because I'd need to add something similar shortly to make parsing
> > > of platform devices created out of ACPI static tables easier (I guess we
> > > can postpone discussion till I post the code but I thought I'd ask).
> > 
> > Oh, I can go ahead and tell you, try to avoid that. Why?! Whatever,
> > indeed, please Cc me to that, I will be glad to study the case and
> > try to be helpful.
> > 
> > (Have you considered DT overlays instead? There is a big pending support for
> >  that for _ACPI_ platforms.)
> 
> Long story short: we do need to create platform devices out of static
> table (eg ARM64 IORT) entries. Current code parses the table entries and
> try to map the devices IRQs (ie acpi_register_gsi()) when the platform
> device is created. Now, the interrupt controller that device IRQ's is
> routed to might not have probed yet. We have to defer probing and later,
> when the platform driver probes, map the IRQ.
> 
> Issue is: for OF nodes and ACPI devices, behind the platform device
> firmware node there is a standard firmware object, so implementing
> fwnode_irq_get() is trivial. For the devices I am talking about,
> the data providing GSI info (hwirq, trigger/polarity) is static
> table specific, so the idea was to stash that data and embed it in
> fwnode_static along with a irq_get() fwnode_operations function
> specific to that piece of data so that device drivers can actually do:
> 
> fwnode_irq_get()
> 
> on the fwnode _seamlessly_ (if you still do wonder: those platform
> devices created out of static table entries in ACPI in OF are
> of_node(s)).
> 
> There is a less convoluted solution (that is what some platform
> drivers in ACPI do today), that is, we pass the static table
> data in pdev->dev.platform_data and each platform_driver parses it differently.
> 
> That works but that also means the in the respective device drivers
> OF and ACPI IRQ (and MMIO) parsing differ (which is not necessarily
> a problem I just have to rewrite them all).

Hmm... The parsing inside drivers is quite a custom case. I would avoid doing
it if it's not device specific (I mean if it's not related to the very unique
device or family of the devices which most likely won't appear again in the
future). In other words, I prefer agnostic solutions over custom ones.

> Now - when it comes to "interrupt-names". Some of the device drivers
> I mention do:
> 
> eg platform_get_irq_byname_optional()
> 
> that expects the IRQ to be mapped and stored in a named platform device resource.
> 
> That's easy in DT - for two reasons:
> 
> (1) "interrupt-names"
> (2) standard properties behind the of_node
> 
> how to do that for fwnodes that aren't backed by either OF nodes or ACPI
> devices (that do use "interrupt-names" _DSD property) is a question.
> 
> Mind, the "interrupt-names" thing is a detail in the whole mechanism.
> 
> DT overlays to represent in ACPI those static table entries ?
> 
> I vividly remember the days ACPI for ARM64 was being merged - that's what
> our crystal ball predicted :)

So, the idea is to translate ACPI static table entries (which comes from IORT)
to the IRQ fwnodes at initialisation (parsing) time?

> This delayed IRQ mapping notwithstanding, I read what you wrote and took
> note. The worry is, this fwnode_*() (on ACPI nodes) interface trickling
> into subsystems where it should not (ie PCI, clocks, regulators) - hopefully
> the respective maintainers are keeping an eye on it.
> 
> > > Are we going to do the same for "reg-names" ?
> > 
> > If it makes sense and we expect some vendor to follow that _in ACPI_,
> > why not?
> > 
> > > Most importantly, what is DT maintainers stance on the matter ?
> > 
> > AFAIK They don't care as long as there is a schema provided, accepted and
> > used in DT, if it's ACPI-only thing, then it most likely should be done
> > in ACPI-like way (see above the first two / three items: spec, MS, WMI/EFI).
> > 
> > > > > I am sorry I have got more questions than answers here - it would be good
> > > > > to understand where the line is drawn when it comes to OF/ACPI and fwnode
> > > > > heuristics compatibility.

-- 
With Best Regards,
Andy Shevchenko



