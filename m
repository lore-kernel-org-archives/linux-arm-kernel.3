Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A0DEC02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 16:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BJogINDFibpXEJA8rBj+M9JC0KxpBDSMMCzAHdOb2SE=; b=TjwKlC5TxxhLsejyBX0jya0Igc
	+nEBgYAwCl8oam2c9UCssilEjB8IEbj5mYGToigS3swKATJe4gb5z9lR9QwUeSLWCcyyK5t9fYJxr
	SRnJhNHtfdCfWy7C1icvMUxm8dNWj5TcRgWUd1Z7yBKSDMvU1EY2YD+clINPe+pNvm1vbEtHWowRs
	IWHKZk+QmnoyaD/XxFY5a3Ts83681GSCmzfg0/zI+YkRBOMxDX9m3nZSNaBJbE52bKv0D17iBFCjM
	wH62NhcY3EZKJt85UPfQ4E+R9Nwzfrd8oHfDPle5VfjAT0oU5QuySTYXFNePa5wCKDxLHf48KfYcq
	2JlZvoyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjhwl-00000002BV4-19C5;
	Sun, 16 Feb 2025 16:56:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjhuO-00000002B79-2arS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 16:54:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 583FC5C5732;
	Sun, 16 Feb 2025 16:53:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BF13C4CEE4;
	Sun, 16 Feb 2025 16:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739724859;
	bh=b1gMtTVrS9kG/tz3DJSz0avx21//+/wqhBYvF9zq1fo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iD8s2exVQnZGw+vub1rvN5H80vPireFTswP2cXX3QzK3lDkD0aS1cAbqGDepxPnIw
	 eQzm45oLLgWvyuG2ub6l7rQCWLdxjzFdMcMELW25dffiDF9bAOAd15klpgspzi3qmi
	 5RD/YJb9gbyOvhR7GKYGruF6fxVfd6bFNVtejgF4PVKjylyZw289x/7I8o8c1NPOes
	 NnTe+kGH1bcCRs6lmwG38kV56mvtespmUHQDkgFX8Ng5tl4rBg+p/Q7Msoutw727Zh
	 bhshPwDxHWL/+9VuFs/Bly8bho7QTMETty3M2UYv0Yz2B/LrwuZRcS8fkLBPyBSSkT
	 SBmJZDaglNYbQ==
Received: by pali.im (Postfix)
	id E3B6C7FD; Sun, 16 Feb 2025 17:54:06 +0100 (CET)
Date: Sun, 16 Feb 2025 17:54:06 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: mvebu: Use for_each_of_range() iterator for parsing
 "ranges"
Message-ID: <20250216165406.jp2dzfwdfucklt5b@pali>
References: <20241107153255.2740610-1-robh@kernel.org>
 <20241115073104.gsgf3xfbv4gg67ut@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241115073104.gsgf3xfbv4gg67ut@thinkpad>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_085420_740858_CEE25D47 
X-CRM114-Status: GOOD (  24.84  )
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

On Friday 15 November 2024 13:01:04 Manivannan Sadhasivam wrote:
> On Thu, Nov 07, 2024 at 09:32:55AM -0600, Rob Herring (Arm) wrote:
> > The mvebu "ranges" is a bit unusual with its own encoding of addresses,
> > but it's still just normal "ranges" as far as parsing is concerned.
> > Convert mvebu_get_tgt_attr() to use the for_each_of_range() iterator
> > instead of open coding the parsing.
> > 
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> 
> LGTM!
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Could someone please verify it on mvebu machine?
> 
> - Mani

That is mostly impossible as pci-mvebu is broken. Bjorn and Krzysztof in
past already refused to take patches which would fix the driver or
extend it for other platforms.

So I do not understand why you are rewriting something which worked,
instead of fixing something which is broken. The only point can be to
make driver even more broken...

> > ---
> > Compile tested only.
> > ---
> >  drivers/pci/controller/pci-mvebu.c | 26 +++++++++-----------------
> >  1 file changed, 9 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/pci-mvebu.c b/drivers/pci/controller/pci-mvebu.c
> > index 29fe09c99e7d..d4e3f1e76f84 100644
> > --- a/drivers/pci/controller/pci-mvebu.c
> > +++ b/drivers/pci/controller/pci-mvebu.c
> > @@ -1179,37 +1179,29 @@ static int mvebu_get_tgt_attr(struct device_node *np, int devfn,
> >  			      unsigned int *tgt,
> >  			      unsigned int *attr)
> >  {
> > -	const int na = 3, ns = 2;
> > -	const __be32 *range;
> > -	int rlen, nranges, rangesz, pna, i;
> > +	struct of_range range;
> > +	struct of_range_parser parser;
> >  
> >  	*tgt = -1;
> >  	*attr = -1;
> >  
> > -	range = of_get_property(np, "ranges", &rlen);
> > -	if (!range)
> > +	if (of_pci_range_parser_init(&parser, np))
> >  		return -EINVAL;
> >  
> > -	pna = of_n_addr_cells(np);
> > -	rangesz = pna + na + ns;
> > -	nranges = rlen / sizeof(__be32) / rangesz;
> > -
> > -	for (i = 0; i < nranges; i++, range += rangesz) {
> > -		u32 flags = of_read_number(range, 1);
> > -		u32 slot = of_read_number(range + 1, 1);
> > -		u64 cpuaddr = of_read_number(range + na, pna);
> > +	for_each_of_range(&parser, &range) {
> >  		unsigned long rtype;
> > +		u32 slot = upper_32_bits(range.bus_addr);
> >  
> > -		if (DT_FLAGS_TO_TYPE(flags) == DT_TYPE_IO)
> > +		if (DT_FLAGS_TO_TYPE(range.flags) == DT_TYPE_IO)
> >  			rtype = IORESOURCE_IO;
> > -		else if (DT_FLAGS_TO_TYPE(flags) == DT_TYPE_MEM32)
> > +		else if (DT_FLAGS_TO_TYPE(range.flags) == DT_TYPE_MEM32)
> >  			rtype = IORESOURCE_MEM;
> >  		else
> >  			continue;
> >  
> >  		if (slot == PCI_SLOT(devfn) && type == rtype) {
> > -			*tgt = DT_CPUADDR_TO_TARGET(cpuaddr);
> > -			*attr = DT_CPUADDR_TO_ATTR(cpuaddr);
> > +			*tgt = DT_CPUADDR_TO_TARGET(range.cpu_addr);
> > +			*attr = DT_CPUADDR_TO_ATTR(range.cpu_addr);
> >  			return 0;
> >  		}
> >  	}
> > -- 
> > 2.45.2
> > 
> 
> -- 
> மணிவண்ணன் சதாசிவம்

