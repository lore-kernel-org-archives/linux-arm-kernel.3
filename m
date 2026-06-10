Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15062CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 16:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DeYS8psnLhx+0nTbu07Q/N5cf93jt28LjVA9fcxz2cA=; b=ZkOlWsuwpCsCsMD7EXJfo0CLNY
	JKbdzu7V2RjijAPKH3cOQccFZXJwN8fAd/sdIFzihwp2EzS7L1Jfp9bYvssptwg3zch0SgfmyPcY9
	DgjFjkSjjUZSoFbqGB/4NMAoaEuauZO115ZiG5eNZHV2QjI3V0Y4VbtWl6IVJ7kPTtrQN+V4gzVmb
	bN1xzJd0XmdpyDq/xTJU3o8yAgfMrJNSDi7JzPF5kZrEMleFjn6AdkJ3NEbGBkzzxUhc+tXjCb1vp
	DY+JZY6s1z/96kDJX+yLOfjsJ9cl/sqFJ0KEPj1j4sEzw/HuWMvTG3k9v4TXxhIxQBvxdCN+qcq+L
	Ezmy+mAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXM07-000000088Z9-0Elu;
	Wed, 10 Jun 2026 16:41:59 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXM04-000000088YT-2miG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 16:41:58 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-9157f7c1c0eso688984885a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 09:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1781109715; x=1781714515; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DeYS8psnLhx+0nTbu07Q/N5cf93jt28LjVA9fcxz2cA=;
        b=DM2nbxCiZVs3/M5MIVtQoON+FP48CjwEHDVI+W2KceOcYTjghpw1xe1x1Y61B5MUyy
         fLh1n8GMPEs+DT9vFc8ATffZ2PCQrCNGolTiA9mH0qsFzvwU/yxsRMhhH+wTVvZEfnK5
         wh7uKBxDbfC8XPF0JfA68QdS7cMj/9WY9jmLkOdZvJ4WbJhXrQ/2TO+qzU5mMC5/hFMH
         k1/LlBN4DFOdzZhSzCSk9uD0sF7/jC15gddX7GHIYDWZT1Ja21Ztac493XLengZGAJRT
         g3GhpISWTQjzVmRsUE+ZAy+Z6uP6AXpnd1jqsea5ri0CcxTgOlYtp0NBEAZ2V5jM5b1v
         A+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781109715; x=1781714515;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DeYS8psnLhx+0nTbu07Q/N5cf93jt28LjVA9fcxz2cA=;
        b=r44gU9/uso7LSKQZOx2Hqjm1KUvP02trPYmhpmYzulfhXjjpj/SQtEG69dhjLS7/yx
         B7hxKXfTRqqDUlVlpHrx2OTCsfAocNOreEXJH+AAtzy/p8/EeL4b04qOduPD49EnMMYq
         aYEj3zDtg3mvTTflAVH6ats7o0FA+obDs++QSUJUt0OyY8BhegZOiLBkqxkDzly5iJ1+
         yMS6KFCc4SVr8hlj+CBd2fprbb5Akol7+kpefp/wXz9Tkauq+nYkiArdYMk0dIHsA0wE
         DItjKCnWILgQfKG9PjnW3g+ouJQpTBNHXi6ZjW3YSdNRYeVUFO1XJlhnjmoJf9IPJjCK
         g0pg==
X-Forwarded-Encrypted: i=1; AFNElJ9zOhGgvtLrpalMtckxSwzMUze51VqUSxXbkUTkJN7o6npwsHbwCO6e8bTCY5KLDvEGB5wRSbn+YVcsMFtqlKr5@lists.infradead.org
X-Gm-Message-State: AOJu0YxBib4yso/25X+DquOzCteTb9fwahJJCGYTxdLNQoqoifq5mrC9
	VJPi6fYTkf5txI9HaF+hiqlbdvVNDNPRTx5zLwkC+iCmmq6bVuByCUeCQbdFc34mK5g=
X-Gm-Gg: Acq92OEdmxknfFqWBbxEf7ooSdpLLZYiVg709SN+6+7jEfo1jd4Ac5molbAqlYqVRBy
	5jXNxLzF/JgIFMblFhyxrd3MLdw8v2CX1ql5JYnGZRWWK5PVvNhGK0d1wlApjVaV/Hmg0dyIl1y
	lkvEBRYLjFZA1wJUAxCV+ikCYtllw/Eg6k7t+GbdkIvHoVsYxNC8kIBI1xtaNqQs8MBaLBgYiRH
	/uEjRflCDsJtzAiYCM2wWgcfMX862MgZl+qXBraQJUlsHlscQBA7p0ScqBxfW3nvYrR9jef8wGU
	5GKzerKr7qDc1LfsNnwjDdEpsqSTwFO8Ol5Hn6Wdl4tgYhG5lMthI/a+8o2ERmyecDi+UABb9Wu
	Efn7KnLczsPC6n/zRb5RPnHaS2K0m/N9HTiWuZ+2uqXNOAizuVZvgYo7y4Gho6a0NsyCtPP0Yu0
	Qvr0MYn40kWWpIe5jf214ShlG+Hjb8fiXFib64IIIZvRNujJFOzxmD02mnIOAOmJly0HreJNKPX
	lOiD1BSXLTsv+/N
X-Received: by 2002:a05:620a:a414:20b0:914:afc1:c66d with SMTP id af79cd13be357-915a9c75c96mr3039706285a.11.1781109715064;
        Wed, 10 Jun 2026 09:41:55 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a22dbbesm2438570085a.13.2026.06.10.09.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 09:41:54 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wXM01-000000048i4-3DtT;
	Wed, 10 Jun 2026 13:41:53 -0300
Date: Wed, 10 Jun 2026 13:41:53 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org,
	Jiri Pirko <jiri@nvidia.com>, Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v6 04/20] dma-pool: track decrypted atomic pools and
 select them via attrs
Message-ID: <20260610164153.GQ2764304@ziepe.ca>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
 <20260604083959.1265923-5-aneesh.kumar@kernel.org>
 <20260609143242.GK2764304@ziepe.ca>
 <yq5afr2uzum9.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5afr2uzum9.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_094156_714906_81922925 
X-CRM114-Status: GOOD (  27.47  )
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

On Wed, Jun 10, 2026 at 01:37:26PM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@ziepe.ca> writes:
> 
> > On Thu, Jun 04, 2026 at 02:09:43PM +0530, Aneesh Kumar K.V (Arm) wrote:
> >>  struct page *dma_alloc_from_pool(struct device *dev, size_t size,
> >> -		void **cpu_addr, gfp_t gfp,
> >> +		void **cpu_addr, gfp_t gfp, unsigned long attrs,
> >>  		bool (*phys_addr_ok)(struct device *, phys_addr_t, size_t))
> >>  {
> >> -	struct gen_pool *pool = NULL;
> >> +	struct dma_gen_pool *dma_pool = NULL;
> >>  	struct page *page;
> >>  	bool pool_found = false;
> >>  
> >> -	while ((pool = dma_guess_pool(pool, gfp))) {
> >> +	while ((dma_pool = dma_guess_pool(dma_pool, gfp))) {
> >> +
> >> +		if (dma_pool->unencrypted != !!(attrs & DMA_ATTR_CC_SHARED))
> >> +			continue;
> >
> > I don't think you should be overloading DMA_ATTR_CC_SHARED like this.
> >
> > 	/*
> > 	 * DMA_ATTR_CC_SHARED is not a caller-visible dma_alloc_*()
> > 	 * attribute. The direct allocator uses it internally after it has
> > 	 * decided that the backing pages must be shared/decrypted, so the
> > 	 * rest of the allocation path can consistently select DMA addresses,
> > 	 * choose compatible pools and restore encryption on free.
> > 	 */
> > 	if (attrs & DMA_ATTR_CC_SHARED)
> > 		return NULL;
> >
> > 	if (force_dma_unencrypted(dev)) {
> > 		attrs |= DMA_ATTR_CC_SHARED;
> > 		mark_mem_decrypt = true;
> > 	}
> >
> > It is fine to have a bit inside the attrs that is only used by the
> > internal logic, but it needs to have a clearer name
> > __DMA_ATTR_REQUIRE_CC_SHARED perhaps.
> >
> 
> Are you suggesting adding another attribute in addition to
> DMA_ATTR_CC_SHARED?
> 
> Is the idea that __DMA_ATTR_REQUIRE_CC_SHARED would be used in the
> allocation path to request a CC_SHARED allocation, while
> DMA_ATTR_CC_SHARED would be used in the mapping path to describe the
> attribute of the address?

Yeah, it is a thought at least

Maybe a comment is good enough.

I just find it hard to follow when we have this dual usage. Like the
code above for dma_pool->unencrypted is completely wrong if it is an
"attribute of an address". Easy to cut & paste that into the wrong
context.

Especially if you move things up higher.. having the alloc set both
CC_SHARED and REQUIRE_CC_SHARED or maybe ALLOC_CC_SHARED would make it
clearer that the alloc code lives under that callchain

Jason

