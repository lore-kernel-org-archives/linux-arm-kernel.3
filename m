Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 024C9D6DDDB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 07:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HZktoj+DIyt/M5en/E9U1CXLfcta4k31BJ3MRv9v+lA=; b=jLBGANLjTBOW4AwVAzIIKCkg41
	HGFrxeSD9ClR6s91LJ+YXOxYlrMQTcttftgXUD5SyZaSn2vAfxnTe+Zzdg37jOCFJZhDzlVcZhVRB
	pmtAA+ksOCPyul76899vdE6A3vGQpzN+gnS8r0XQq6Nx/tD0yD/OEs74Tulpen8HIUMLKSmQB1D2Q
	FWAW2IVl22Shkrrz73FI/rCSmDvRLeKRV605MygU6mXMb/EyS81uunwUa+cvnZ0h0pX/n7K0ZLHOu
	Ko94fvUhJB0szNWegxVp/HTMmgezHT+KipAgQmWmViMuB6Zh1Ug0FcF7AoPInv+rn2b1oTxjESPhE
	0cXbX2pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBqoQ-00000001vkx-2rEW;
	Fri, 15 Nov 2024 07:32:14 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBqnV-00000001vdN-14vq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 07:31:18 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-20cbca51687so15954525ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 23:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731655876; x=1732260676; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HZktoj+DIyt/M5en/E9U1CXLfcta4k31BJ3MRv9v+lA=;
        b=KGiJw5KsknMWQNvcv1KbekEFa6EPhFPhKQmJuRF1G9WBjVsBQrLJNuGWEHUaDH7BQE
         1Zy21vG9t8fCwbqzWnI9vaEkXYj+xnwJfif04XHdwwygMl5/LjDxbeM0cpPicPSpKYUf
         dbra3yeN5RXM03FlVEnlhRW4PiTJ/+PGboZtWfjUMWSm6LIsB2wMx4ltgNFjjksHvBoy
         8UDO5T1uDqBsJSv+4yFKHte9UN7CjTFKWBoV0fk3IJDEzf3ocR3CjIW4nnTA4F3aEOg0
         p3Ywdu8t44S08EksOVDOdSH6dX8jSgHe6r+GIu2oOUuPSVCGbMWv0OqlbL/Tw1EeHGXS
         SwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731655876; x=1732260676;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HZktoj+DIyt/M5en/E9U1CXLfcta4k31BJ3MRv9v+lA=;
        b=Hpitphu07O3ba/fd0WAYCGGGyqqth++pUwxb1KSC7l2wvEOXIOgItaSqBtW+TXAA6U
         kdXWowCnaW/+9bDI2pNUTFAn7ez7NnE7NEW461UYmJlgOMfNEjmkHNAP+KmCx/14ZYh/
         8/4FY5k0hSnfhp7YVWw6+dzeYdyXa9hwx1GSnlD0mZW/70qBcuSqXpF5ZunmzfCqMuly
         dmR/tnmZU+yC22I+uAKvI+sIhVMNW5TGSIpWdho/iATxNYOmL8wmAEItLqLQpMU+gvAW
         R1PRsXFE8w/t00FofmLimxa4NMCl7kLG+T3DiNHNp7LZDAjJL3yoLygX/HVW/pGSuvsq
         CY+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXaijfzA0N0fZIEWH553RbiAtofk0krwmRRO5wtNUmqF3N+nq3hL6ptN1VPtllKTVmgUwuyHMBIt7gkNGRUzTRz@lists.infradead.org
X-Gm-Message-State: AOJu0YyamHWyE0lc7mcKSqXJELcU3qNkA00L7+KuXzFWKKC34s7hAN3S
	zN68uRvkHfRE4mKoXNaI+Dy+LoOjzYzGjC2QlILiF6IfSdOmZXnIRbbRAEr1cTWJm6vPmua9cZU
	=
X-Google-Smtp-Source: AGHT+IGqasFmOrneoq4IblHicWacSTw8Y/GAFQYAAdde1mcCZ45w9edIxU/G+UXSRE3e1ost0zYZXQ==
X-Received: by 2002:a17:903:22c4:b0:20b:861a:25c7 with SMTP id d9443c01a7336-211d0f1183dmr24007255ad.54.1731655876340;
        Thu, 14 Nov 2024 23:31:16 -0800 (PST)
Received: from thinkpad ([117.193.208.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0dc3281sm6839075ad.30.2024.11.14.23.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 23:31:15 -0800 (PST)
Date: Fri, 15 Nov 2024 13:01:04 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: mvebu: Use for_each_of_range() iterator for parsing
 "ranges"
Message-ID: <20241115073104.gsgf3xfbv4gg67ut@thinkpad>
References: <20241107153255.2740610-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241107153255.2740610-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_233117_324204_A565C174 
X-CRM114-Status: GOOD (  22.15  )
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

On Thu, Nov 07, 2024 at 09:32:55AM -0600, Rob Herring (Arm) wrote:
> The mvebu "ranges" is a bit unusual with its own encoding of addresses,
> but it's still just normal "ranges" as far as parsing is concerned.
> Convert mvebu_get_tgt_attr() to use the for_each_of_range() iterator
> instead of open coding the parsing.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

LGTM!

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Could someone please verify it on mvebu machine?

- Mani

> ---
> Compile tested only.
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

-- 
மணிவண்ணன் சதாசிவம்

