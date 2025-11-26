Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0365D1118E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 18:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RWRFhW+2AWgAkGE4FSHqi72wtvN5NJ4Ws31AXnF6MzU=; b=h8KjwERYxLRAn/dqj7g5dd8EoN
	1IbKbxpUM8Kou06O2NsjkHqMQ1wRTkTpLkvnnFDApxX9kH6MZgaMUafYhptPuocv2BvCGls6WBzVf
	DmA6wFjW7EZcRf0uNQmTxRU+IdS3knmCdExbg8o/4gq+5zDZ0j7CA2ZgS8auDe/SmjwkEqml6hmhu
	1XuQZggRsHVrDgQsj9etDD1VkzM8b73PkvEIbFr4+2YLMwnqnmtfipwSrF6OonLxYQL0+BEypE8vG
	ovwVibAZJE1D7RtYbv/TgQ9yWRTV/elaNHLK2NcC89yZZO+IlogOFRHYdYY1WwxAgwAoDUipi5Bjf
	0w7dRd0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJuy-0000000FTE9-09B7;
	Wed, 26 Nov 2025 18:07:04 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJuu-0000000FTBE-1oih;
	Wed, 26 Nov 2025 18:07:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764180420; x=1795716420;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=fpreomXscmd29Nf7GvLFFoVBmW/YcChjeyGOtyWFESE=;
  b=SRxok7sA3GDc2mhXAScxBwjv4ZgVOiIeSt95dhcq+KXddR2UqxJIMqWT
   jY8vNFIuXM316t8iUq2UgNDet0IpRDJ25ah7+i8Xxq+Viv540K/KjkO0L
   zBYC+3p5Hdr61DrgYgetqhPbP2EOp9fCgbeUztK1kGk91bXe3DHhbyJdD
   D1cPouDY7ri3XX5AIHcVjdqZoSR3L+reQ10Qj9pT5e65qC85axjp89wz8
   01ZJwQK1fk3q7VPXV6JFdqVvAOKoumIBk9Pw323X6gPwytWsH5r4DbgOR
   QomYRAduvXJYB7QwUpRbk6foUx03q6Zm4l66d0f4PVZ+R4cqj6BpDWAtZ
   A==;
X-CSE-ConnectionGUID: 4pVJPhwiQuGI/A3f5cnucw==
X-CSE-MsgGUID: c7nluQSgR863EvhV3x+lWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76854527"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="76854527"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 10:06:59 -0800
X-CSE-ConnectionGUID: QQtrAVAUQd6HIc4PNcExKQ==
X-CSE-MsgGUID: uD08JMkDQquY5+IBIGflSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="198116036"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.89])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 10:06:54 -0800
Date: Wed, 26 Nov 2025 20:06:51 +0200
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
Message-ID: <aSdBu-B9mwU2-1_S@smile.fi.intel.com>
References: <20251125023639.2416546-1-lei.xue@mediatek.com>
 <20251125023639.2416546-3-lei.xue@mediatek.com>
 <CAD++jL=h4ZEgrjgGOfgFyAXBM7EL91ZD-La82UQ7GPOXv8h9WQ@mail.gmail.com>
 <aScwaxBG53dnZ4a4@lpieralisi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aScwaxBG53dnZ4a4@lpieralisi>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_100700_494365_E688C292 
X-CRM114-Status: GOOD (  25.44  )
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

On Wed, Nov 26, 2025 at 05:52:59PM +0100, Lorenzo Pieralisi wrote:
> On Wed, Nov 26, 2025 at 10:10:15AM +0100, Linus Walleij wrote:
> > On Tue, Nov 25, 2025 at 3:36 AM Lei Xue <lei.xue@mediatek.com> wrote:
> > 
> > > Add acpi support in the common part of pinctrl driver. Parsing

ACPI

> > > hardware base addresses and irq number to initialize eint

IRQ

> > > accroding to the acpi table data.

ACPI

> > > Signed-off-by: Lei Xue <lei.xue@mediatek.com>
> > 
> > I'd ideally like Andy and the ARM64 ACPI maintainers look on
> > this. (Added to To:) and CC linux-acpi@vger.kernel.org.
> > 
> > I'm not aware of the best way to deal with ACPI in combined drivers
> > but things like this:
> > 
> > > -               hw->base[i] = devm_platform_ioremap_resource_byname(pdev,
> > > -                                       hw->soc->base_names[i]);
> > > +               hw->base[i] = is_of_node(fwnode)
> > > +                       ? devm_platform_ioremap_resource_byname(pdev, hw->soc->base_names[i])
> > > +                       : devm_platform_get_and_ioremap_resource(pdev, i, NULL);
> > 
> > Just look really quirky, I think there are better ways to go about
> > this and sometimes the ACPI maintainers give some good
> > pushback about the firmware as well.

Agree. It looks fragile.
I believe the best approach is to have fwnode_iomap_byname() and if required
add a quirk to have a software node with names.

> How are pdev->resource initialized ? For OF I suppose the names come from
> "reg-names" (that don't exist in ACPI, yet), for ACPI I assume they come
> from a _CRS (and you can't tag them by name for the reason above) ?

We always can hardcode the names if required in quirks via software nodes.
GPIO has even special data types for that (struct acpi_gpio_mapping).

> I assume that in ACPI the _CRS resource order is foolproof against the
> variaty of SOCs this code has to deal with.

Yeah, that's what we have with GPIOs in a few drivers, the hardcoded quirks.

> I also assume/hope that we don't want to add a "reg-names" _DSD property either
> in ACPI to deal with this seamlessly in DT/ACPI (that was done for
> "interrupt-names"):
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/firmware-guide/acpi/enumeration.rst?h=v6.18-rc7#n188

Hmm... Why not?

> I am sorry I have got more questions than answers here - it would be good
> to understand where the line is drawn when it comes to OF/ACPI and fwnode
> heuristics compatibility.

-- 
With Best Regards,
Andy Shevchenko



