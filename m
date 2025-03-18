Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175E2C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 10:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+Q9jlO5xuM+dGNN5vOy/zKLThOd0aux5Q2kg9METOQ=; b=Bmdi+eJba+xJA+dfAK1lYGSQ7l
	Jmu8IXEDiSz6I7J0BoA0FPGN8DndfcKFIqhrpfGhaQ6rxOmhOXmMp0T5+GpMrRXiatYTfefSElPfl
	nvaDRMkazcEvbzTvwysNO7dhzmVxI/sUBAiIk9Oy4wTVBV8DIdo9PRS/qL0bXs02c5x0RJZnLYur3
	lDjaoP4MgRoTHBAYJt/27Y9iBI/8m1+832DXY7OtHCLCk1qM6ZQbtsRn5yRhjtb+FwIW27tgIYdzI
	M3AhgM54qInI6NeJ6/qNPdrOKdWY7B/UjsS6Ooj2MT4tullvMStUblIFu+n82D1+LmU9yiurHtogJ
	pFWu/dMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUUV-00000005ayF-40XU;
	Tue, 18 Mar 2025 10:48:11 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUSo-00000005afn-2RhB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 10:46:27 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43cf3192d8bso32935e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 03:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742294784; x=1742899584; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/+Q9jlO5xuM+dGNN5vOy/zKLThOd0aux5Q2kg9METOQ=;
        b=h63DCl6CvrryGG5zjP56K0D+yOK//+KV6h8hTjVaIs3V9ZQxRrly30A1u4JEeOESzf
         vfYLNrc42VW+HEydq3YkBte5ZPNQsihQUtEG9kEEmUtBN6fwNN+5nKYDqLn964sY1fTA
         CSmCegkia5oOgIsV1nEJI8UEkXFpcxGhVYqkbKP+hOxD1aBA9wGSisk4e1TjHu44pTvr
         cFpTjK8vdMsqXOgwEpdWl58XqZG1Kh2JKD0UEPquYzd1mKu4ohct2n5yrPSIkg+4p658
         50iWG66zxmWxwQ0bKSWx1XvP1w1fG5uzFddbf8mijWVyHrzZ9LGDL4p7olPZXP+Vk292
         Lqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742294784; x=1742899584;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/+Q9jlO5xuM+dGNN5vOy/zKLThOd0aux5Q2kg9METOQ=;
        b=XWxO4Abm9mMMcLQp2jknkgNGkBgLS9q+pnij8rp/U447SOoZAcz23TLULLLooo06ju
         ghs9g21hB0msWqUPMYrX9nXN+QS45FrZvxfBcBaPTx9vPykpYsY74+MpY/MJRXU0xjZM
         o0pMPcilL0VNsMDACsSldo2dwoF/kqQV0ORtLcr8BOhMkvM/UO5Dhcbqy+DWKfGBhQy+
         kYH2oqdgAihYWSW7BosucT5G53rZXdMWFffcgo/RzEKc7yv+H/R6EPAf2akY/Fn95WB1
         BAfNJrf0ghIJQrTQ9Hdg1iCeymlONNfALHgu50DoZPHyvTijiMFd/lzPsKjQgqi4+1WN
         uJsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBzmv60oQzp9EaMdHLwvJIN4autCu2XXSSvuhS3p1aL9PCrdbdNDrFlpXlUqGR8J1nzKLam6BALP1jTJA4cTl7@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1O2TNX5mUjYipXHkKJzHHQZgdh6cXYMh0H3jhHy45BL7a3IU9
	jDUiBOhfYYUVos267s10wh9cvPMlrj17IluR1Pby8A0vz4FV3fNpAn3Ze+0PAg==
X-Gm-Gg: ASbGncvaWlvB/2fS+QNIAEEy55s4cmNt89r+BxOF9bm4as3tAsqGjyqlrgBMHrEJsrF
	GFngSkVQv2zv8AZQL1h8icRveLHek5UZN+chIg3c66kNQvdC4pQXD3udF5aRjcfLXBTMtOFMbg+
	tv9HrFXaE3PJsYYfWw4xqkWOFSYWz+YplUe2Hkkvon54E744ZE0o79wzjMl3DVLrPb06Gl0++q1
	Kl7TtOtnUKhPDS0pqPwdu+cHYFS/OkTEBPZYmCxhC22lDQ/1EbjZV5dFMSZFuUTY1XZgvHGg5o9
	KSBI/NNB6AzTUS05DYT9p7vZ52Ai2+1m05Ux7BP1ueBQcJNhhd2DWS+tQu9csXX1BIV9qKdL9MN
	Panxe
X-Google-Smtp-Source: AGHT+IHJJJKc86lCeSfkPHpB/CtXXs0Prp3Nz9+7FXSfTlHmKZ30/6jEnzkR0iwoq3j3jwsYbn5hfA==
X-Received: by 2002:a05:600c:1d20:b0:439:4a76:c246 with SMTP id 5b1f17b1804b1-43d3e14f871mr474575e9.6.1742294783884;
        Tue, 18 Mar 2025 03:46:23 -0700 (PDT)
Received: from google.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffbcf00sm129988595e9.10.2025.03.18.03.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 03:46:23 -0700 (PDT)
Date: Tue, 18 Mar 2025 10:46:18 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
	Lu Baolu <baolu.lu@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Hector Martin <marcan@marcan.st>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
	Joerg Roedel <jroedel@suse.de>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	David Rientjes <rientjes@google.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v3 20/23] iommu: Update various drivers to pass in lg2sz
 instead of order to iommu pages
Message-ID: <Z9lO-viudk9YGakl@google.com>
References: <0-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
 <20-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
 <Z9GFFBvUFg7a9WEg@google.com>
 <20250317133500.GC9311@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317133500.GC9311@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_034626_644610_3A0DDDAA 
X-CRM114-Status: GOOD (  25.06  )
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

On Mon, Mar 17, 2025 at 10:35:00AM -0300, Jason Gunthorpe wrote:
> On Wed, Mar 12, 2025 at 12:59:00PM +0000, Mostafa Saleh wrote:
> > > --- a/drivers/iommu/io-pgtable-arm.c
> > > +++ b/drivers/iommu/io-pgtable-arm.c
> > > @@ -263,14 +263,13 @@ static void *__arm_lpae_alloc_pages(size_t size, gfp_t gfp,
> > >  				    void *cookie)
> > >  {
> > >  	struct device *dev = cfg->iommu_dev;
> > > -	int order = get_order(size);
> > >  	dma_addr_t dma;
> > >  	void *pages;
> > >  
> > >  	if (cfg->alloc)
> > >  		pages = cfg->alloc(cookie, size, gfp);
> > >  	else
> > > -		pages = iommu_alloc_pages_node(dev_to_node(dev), gfp, order);
> > > +		pages = iommu_alloc_pages_node_sz(dev_to_node(dev), gfp, size);
> > 
> > Although, the current implementation of iommu_alloc_pages_node_sz() would round
> > the size to order, but this is not correct according to the API definition
> > "The returned allocation is round_up_pow_two(size) big, and is physically aligned
> > to its size."
> 
> Yes.. The current implementation is limited to full PAGE_SIZE only,
> the documentation imagines a future where it is not. Drivers should
> ideally not assume the PAGE_SIZE limit during this conversion.
> 
> > I'd say we can align the size or use min with 64 bytes before calling the
> > function would be enough (or change the API to state that allocations
> > are rounded to order)
> 
> OK, like this:
> 
> 	if (cfg->alloc) {
> 		pages = cfg->alloc(cookie, size, gfp);
> 	} else {
> 		/*
> 		 * For very small starting-level translation tables the HW
> 		 * requires a minimum alignment of at least 64 to cover all
> 		 * cases.
> 		 */
> 		pages = iommu_alloc_pages_node_sz(dev_to_node(dev), gfp,
> 						  max(size, 64));
> 	}

Yes, that looks good.

Thanks,
Mostafa

> 
> Thanks,
> Jason

