Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8AD0CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 14:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TuYGBer9JF3CpxBE7lkRwytVDZxUS4o8rVZ18yi57hM=; b=pfvdoYyYH8h2haWNWqU9BbgBLE
	18iOUUx1y3d5kOGUF6l5zxkPHFiMGABDANFaVsgn6ABCobXSbGk325QPjwbY83iyqgpHFKokfCooS
	/wVECzPTfxQktoHUAYMeCdgaliqlfc9Ljf7Kt2TBuq9bJLfMO02wxB34KZCtsz5U/N5fEC3OccIEK
	Wfv/goOhxyyjwvNo0DG+4PzmX9Nw//JCVXHmZWxzpgCFTLOg4B1x5IplktksEOYVwS3GAoy2oSdRE
	UMCs9ikwGNokCl0bkFkC/bAiSD1qmd768m6f6jqvJhY6GL6qXWwt3mZbGgu5vTJfjv0kiJ1y2XJLr
	kCLi+WYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOd0Y-0000000GmXx-1Aw9;
	Thu, 27 Nov 2025 14:30:06 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOd0V-0000000GmXH-11m0;
	Thu, 27 Nov 2025 14:30:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764253803; x=1795789803;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=wV3E8BYGDfNKefQX/rsj0hZUZjUWd8J11Hu9YUDDBXM=;
  b=RaBbs55bbMKY0QLUducebivkE8m4iKkQuZhwcw6xwxO7LqFJBanVS+x2
   xi23WRKT0H0WyI/3PRlLbxZ8R4j9da3qZK4zfzDNKWKVDp/yZ6P1P28Qf
   0yBzkO0LzxPj+QnEfyQL0DIU12dxo/rBTi1HuIe+sH8BpBh32ZCcE7AK9
   oVKvctngCaEvEcBTGtBxnwFeuqITEamqW6MKiKJOEV1ZpqcmkqJwQ8Bju
   yb/OKQvuMRE3k1ZFBe6QlYq0wk/ELszEhJriIaPNPquG26m07U7r7U8iI
   alKeGYiTSkeVLz8VQazHmXHJmNLcTkzfhhWheb3/jOvE980EFo8a/aXwn
   Q==;
X-CSE-ConnectionGUID: a4GkvJYSSpCkZBmdrauPzw==
X-CSE-MsgGUID: H0cUCTwVR4eVQnAcIXngVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="77662593"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="77662593"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 06:30:01 -0800
X-CSE-ConnectionGUID: A4KmkT6hSRCb9jEmqznsow==
X-CSE-MsgGUID: K4CHSgcNSc+gBla+AVuQ4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="198188135"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.225])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 06:29:56 -0800
Date: Thu, 27 Nov 2025 16:29:54 +0200
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
Message-ID: <aShgYukPRfDkq_Z0@smile.fi.intel.com>
References: <20251125023639.2416546-1-lei.xue@mediatek.com>
 <20251125023639.2416546-3-lei.xue@mediatek.com>
 <CAD++jL=h4ZEgrjgGOfgFyAXBM7EL91ZD-La82UQ7GPOXv8h9WQ@mail.gmail.com>
 <aScwaxBG53dnZ4a4@lpieralisi>
 <aSdBu-B9mwU2-1_S@smile.fi.intel.com>
 <aSgipbe75hrwhTD7@lpieralisi>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aSgipbe75hrwhTD7@lpieralisi>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_063003_327157_5B8D89CF 
X-CRM114-Status: GOOD (  33.00  )
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

On Thu, Nov 27, 2025 at 11:06:29AM +0100, Lorenzo Pieralisi wrote:
> On Wed, Nov 26, 2025 at 08:06:51PM +0200, Andy Shevchenko wrote:

[...]

> > > I also assume/hope that we don't want to add a "reg-names" _DSD property either
> > > in ACPI to deal with this seamlessly in DT/ACPI (that was done for
> > > "interrupt-names"):
> > > 
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/firmware-guide/acpi/enumeration.rst?h=v6.18-rc7#n188
> > 
> > Hmm... Why not?
> 
> What's the policy there ?

> Half of the ACPI bindings for an interrupt
> descriptor are defined in the ACPI specs (ie _CRS) and the other half
> (ie "interrupt-names") is documented in the Linux kernel (or are we
> documenting this elsewhere ?) ?

Yeah, nobody pursued ACPI specification updates / addendum to make it fully
official. _De facto_ we have established practice for GPIOs enumeration
(as most used resources in the OSes), Linux official for PWM, I²C muxes,
multi-functional HW (such as Diolan DLN-2, LJCA), Microsoft defined for
so called "USB hardwired" devices, Linux defined for LEDs and GPIO keys,
sensor mount matrix as per "most used" cases + DT analogue works just
because we have agnostic APIs in IIO to retrieve that. There are maybe
more, but don't remember

So, I think the practical "policies" are that:
- if it's defined in ACPI spec, we use the spec
- if there is Microsoft addendum, we rely on what Windows does
- WMI, EFI, and other "windoze"-like vendor defined cases
- if it makes sense, we establish practice from Linux perspective
- the rest, every vendor does what it does

That said, for the first two we expect OEMs to follow, for the third one
depends, but there are established WMI calls and other more or less "standard"
interfaces, so like the first two.

For the fourth one (Linux) we do, but living in the expectation that some or
more vendors fall to the fifth category and we might need to support that if
we want their HW work in Linux.

> Or we are saying that "interrupt-names" properties are added by kernel
> code _only_ (through software nodes, to make parsing seamless between DT
> and ACPI) based on hardcoded name values in drivers ?

No, the idea behind software nodes is to "fix" the FW nodes in case the FW
description can not be modified (and that might well happen to even DT in some
cases AFAIH). So, if some driver hard codes "interrupt-names" we expect that
new versions of the FW that support the HW that needs the property will be
amended accordingly.

"interrupt-names" has been established for ACPI to support a separate SMB alert
interrupt. However, I haven't heard any development of that IRL (for real
devices in ACPI environment).

> I don't think I can grok any example of the latter in the mainline.
> 
> I am asking because I'd need to add something similar shortly to make parsing
> of platform devices created out of ACPI static tables easier (I guess we
> can postpone discussion till I post the code but I thought I'd ask).

Oh, I can go ahead and tell you, try to avoid that. Why?! Whatever,
indeed, please Cc me to that, I will be glad to study the case and
try to be helpful.

(Have you considered DT overlays instead? There is a big pending support for
 that for _ACPI_ platforms.)

> Are we going to do the same for "reg-names" ?

If it makes sense and we expect some vendor to follow that _in ACPI_,
why not?

> Most importantly, what is DT maintainers stance on the matter ?

AFAIK They don't care as long as there is a schema provided, accepted and
used in DT, if it's ACPI-only thing, then it most likely should be done
in ACPI-like way (see above the first two / three items: spec, MS, WMI/EFI).

> > > I am sorry I have got more questions than answers here - it would be good
> > > to understand where the line is drawn when it comes to OF/ACPI and fwnode
> > > heuristics compatibility.

-- 
With Best Regards,
Andy Shevchenko



