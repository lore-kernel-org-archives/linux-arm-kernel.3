Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CE5D5D681
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 18:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GVZzLjPcFIyDzIrZISNZ6hq+xXjjusIEj7ZoMUmG6PI=; b=CU0I+CiBVBf2q8u4ifGm67JJ4f
	urQExzDf0BGR/tjJyfZHuUqLi/R06IdgzSYOVW6xGb9fEp7+veoI39gStnJD+1+I9HA0k55B4uN6Z
	/TvzgApmhKF41dSpFk7LLOoBu9QomDzVNAsT0uJVwcDTsHb7WJmIxF7U+rjBL9CqzI/MjsH126J8p
	UBsY0t1r9c3P75AEPJbOjaCQAZmY2nN40lbk2oJ27diDmSAY1Vyes3C3Do6iw2bp/9qIbmvlNT0Qh
	0HK8K5f6pqxoJAoeowlJZQDqbpxwYtYuNApAGpjK/iuVkCi9YwheBqJJNBwdOofelT7n6sxqxDbR0
	sRzOqhhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t973h-00000007v2c-1rxE;
	Thu, 07 Nov 2024 18:16:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t95rf-00000007jwY-2HOr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 17:00:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EC1FD5C31CB;
	Thu,  7 Nov 2024 16:59:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2273DC4CECC;
	Thu,  7 Nov 2024 17:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730998810;
	bh=LxlQsyn16YGpTarQqk1LdGdxRMkwoMFrL36XAWtSuzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qh23v4IK6diLbyoPZVVoeajvDEI3N5TNXcreMxWkyj7+VOSBaLFTZeGnIlWmGpLrD
	 IwG/iN4uj3Bq2/KFE0j+1GWYLuQoivwBqbSIKsoGzSytFsmJm4fWklCMZiBrKjCMe+
	 sh9IL5btYLTqPIenPELF/NeoboymXm2Hnwfu7udISwEwDaOWkEupCufJr8WHUm8m+z
	 z4uBMGLe4/o6RCwXIgTEilQpgsFiBVriAP6kE3Q6stX+QcOHeXUS2UZg3gono0TFIQ
	 9f8ZJ3H4VxD4UTUlCSSJsZNEXncOSpCIivbDK+Qxowq/FUa/uuJqPfIfgnUxdFj+GL
	 8aw9tDwz5QxHw==
Received: by pali.im (Postfix)
	id 4757AB94; Thu,  7 Nov 2024 18:00:02 +0100 (CET)
Date: Thu, 7 Nov 2024 18:00:02 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: mvebu: Use for_each_of_range() iterator for parsing
 "ranges"
Message-ID: <20241107170002.wz7wkqmtyqiiaswl@pali>
References: <20241107153255.2740610-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107153255.2740610-1-robh@kernel.org>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_090011_700658_D76FD413 
X-CRM114-Status: GOOD (  22.77  )
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

On Thursday 07 November 2024 09:32:55 Rob Herring (Arm) wrote:
> The mvebu "ranges" is a bit unusual with its own encoding of addresses,
> but it's still just normal "ranges" as far as parsing is concerned.
> Convert mvebu_get_tgt_attr() to use the for_each_of_range() iterator
> instead of open coding the parsing.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Compile tested only.

I see no reason for such change, which was even non tested at all and
does not fix any issue. There are more important issues in the driver,
it was decided that bug fixes are not going to be included (yet).

> ---
>  drivers/pci/controller/pci-mvebu.c | 26 +++++++++-----------------
>  1 file changed, 9 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/pci/controller/pci-mvebu.c b/drivers/pci/controller/pci-mvebu.c
> index 29fe09c99e7d..d4e3f1e76f84 100644
> --- a/drivers/pci/controller/pci-mvebu.c
> +++ b/drivers/pci/controller/pci-mvebu.c
> @@ -1179,37 +1179,29 @@ static int mvebu_get_tgt_attr(struct device_node *np, int devfn,
>  			      unsigned int *tgt,
>  			      unsigned int *attr)
>  {
> -	const int na = 3, ns = 2;
> -	const __be32 *range;
> -	int rlen, nranges, rangesz, pna, i;
> +	struct of_range range;
> +	struct of_range_parser parser;
>  
>  	*tgt = -1;
>  	*attr = -1;
>  
> -	range = of_get_property(np, "ranges", &rlen);
> -	if (!range)
> +	if (of_pci_range_parser_init(&parser, np))
>  		return -EINVAL;
>  
> -	pna = of_n_addr_cells(np);
> -	rangesz = pna + na + ns;
> -	nranges = rlen / sizeof(__be32) / rangesz;
> -
> -	for (i = 0; i < nranges; i++, range += rangesz) {
> -		u32 flags = of_read_number(range, 1);
> -		u32 slot = of_read_number(range + 1, 1);
> -		u64 cpuaddr = of_read_number(range + na, pna);
> +	for_each_of_range(&parser, &range) {
>  		unsigned long rtype;
> +		u32 slot = upper_32_bits(range.bus_addr);
>  
> -		if (DT_FLAGS_TO_TYPE(flags) == DT_TYPE_IO)
> +		if (DT_FLAGS_TO_TYPE(range.flags) == DT_TYPE_IO)
>  			rtype = IORESOURCE_IO;
> -		else if (DT_FLAGS_TO_TYPE(flags) == DT_TYPE_MEM32)
> +		else if (DT_FLAGS_TO_TYPE(range.flags) == DT_TYPE_MEM32)
>  			rtype = IORESOURCE_MEM;
>  		else
>  			continue;
>  
>  		if (slot == PCI_SLOT(devfn) && type == rtype) {
> -			*tgt = DT_CPUADDR_TO_TARGET(cpuaddr);
> -			*attr = DT_CPUADDR_TO_ATTR(cpuaddr);
> +			*tgt = DT_CPUADDR_TO_TARGET(range.cpu_addr);
> +			*attr = DT_CPUADDR_TO_ATTR(range.cpu_addr);
>  			return 0;
>  		}
>  	}
> -- 
> 2.45.2
> 

