Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F126D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 10:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dZke3kGkQTZYkMSsgLVRtmh9XfHGjHdJ9IQZpF7CUm4=; b=NwWZDQW8zC+qCqNZX9ANglZACo
	wut/AsgEenlPnrKn5ZXltqjWHnipIDqWuzWYGgP9/7ZSHBytyPIKPjYi3wqBSfpXZBKRJYPgjllgG
	SiGAjjWzlqd4QoLfb8W/8oM01sUlBVa6RscXo/jLVXFiekQU68Yrkt2P+lCLthmNq6b96JZCIj/wa
	yVGpj6uoLbTFFE/LFJuvLOoGfTQl4JyuCx6Iv8/gODosyAsk9qwmQISD4i6UsAbl8KXOHB6rTOUQ2
	okKq0Nl+cCoLo1otYIeJdozfCiu4rh1TojGYmVDc57ZlxesXjgBnfM6FsbwKtNJpu6KqmDJz9Ed95
	4qi1JDOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYtd-0000000GLLN-3ObA;
	Thu, 27 Nov 2025 10:06:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYtc-0000000GLLA-0R6G;
	Thu, 27 Nov 2025 10:06:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 88F506013F;
	Thu, 27 Nov 2025 10:06:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67AB4C4CEF8;
	Thu, 27 Nov 2025 10:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764237999;
	bh=qyB6IHXo0lkqDWnnBdQrPg7IJ3IfbM8Oc4yUhLX0Ab4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HjFWFM0TvahrAGCiGYFsG3hXKmygUZkBeXVRRQKnNMymfJ14kg45MbPvglwQOTy6m
	 oh6e7g2SRP/+9aV+5tz5WXbdzBT0zHBs2yJ3jB28pVUeLy7AHHdV/yTh0QOJ7VQ98U
	 4X2oEbQSzzrPZbkinJ26irCm3HRZtta2RsURL6Y8C9kMrMIROE8a/7DQfVbEekGcY1
	 CDvZmsIYGYY5tU8q9I+aCO15M9NaWXpdaUuI6d3CRFZncWxCpzPO6vM6yBu7yuxwT1
	 4bYyrNwLWAXE5LQsEBeDNCGYyJobuYfGAArzGUgUr+977XW7wbefeIsx7sUeBlmjOv
	 LpSvqAFpqWisQ==
Date: Thu, 27 Nov 2025 11:06:29 +0100
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
Message-ID: <aSgipbe75hrwhTD7@lpieralisi>
References: <20251125023639.2416546-1-lei.xue@mediatek.com>
 <20251125023639.2416546-3-lei.xue@mediatek.com>
 <CAD++jL=h4ZEgrjgGOfgFyAXBM7EL91ZD-La82UQ7GPOXv8h9WQ@mail.gmail.com>
 <aScwaxBG53dnZ4a4@lpieralisi>
 <aSdBu-B9mwU2-1_S@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSdBu-B9mwU2-1_S@smile.fi.intel.com>
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

On Wed, Nov 26, 2025 at 08:06:51PM +0200, Andy Shevchenko wrote:

[...]

> > I also assume/hope that we don't want to add a "reg-names" _DSD property either
> > in ACPI to deal with this seamlessly in DT/ACPI (that was done for
> > "interrupt-names"):
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/firmware-guide/acpi/enumeration.rst?h=v6.18-rc7#n188
> 
> Hmm... Why not?

What's the policy there ? Half of the ACPI bindings for an interrupt
descriptor are defined in the ACPI specs (ie _CRS) and the other half
(ie "interrupt-names") is documented in the Linux kernel (or are we
documenting this elsewhere ?) ?

Or we are saying that "interrupt-names" properties are added by kernel
code _only_ (through software nodes, to make parsing seamless between DT
and ACPI) based on hardcoded name values in drivers ?

I don't think I can grok any example of the latter in the mainline.

I am asking because I'd need to add something similar shortly to make parsing
of platform devices created out of ACPI static tables easier (I guess we
can postpone discussion till I post the code but I thought I'd ask).

Are we going to do the same for "reg-names" ?

Most importantly, what is DT maintainers stance on the matter ?

Thanks,
Lorenzo

> > I am sorry I have got more questions than answers here - it would be good
> > to understand where the line is drawn when it comes to OF/ACPI and fwnode
> > heuristics compatibility.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

