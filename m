Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588AEC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 14:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vD91S1DbebApVBCN527t7AaQw07MlhokwGC+vI5FhsI=; b=xlQylIHeHr4N5zfQIz/ZtkMcX/
	t5rmhQttb+B6mM72VTUK/ya+/m7VmhZ6hcLhFSoxk6STtSo/4wF2mEnYtOvh8pXyEhH3VtsRzsDr1
	BdS5lgWP0E8XRD4M0uRVt+z5R6/NaQstPPMk6hr0JW77raYhS0PwurlcN+rig1jgK+LmuaoepKXJh
	Sj/MNBPkPkwU2qfI2hZVre8eGUdRzQkmsbUnERmvLZ3eYBJekoDB7q/IJMRlkhpTyg5dPFXjn1HKh
	ZXY0HI1JMwo30VFCce2Zn7dpOOLm0hO4OyfW3YPq+Q99Qx1srK9Xdu+cJcivVNoJziITuZLfkB01A
	QLkzFKNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wndSF-00000000S2W-1ACm;
	Sat, 25 Jul 2026 14:34:19 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wndSD-00000000S25-0SWM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 14:34:18 +0000
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-73a8ac9cd52so1009122137.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jul 2026 07:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784990056; x=1785594856; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vD91S1DbebApVBCN527t7AaQw07MlhokwGC+vI5FhsI=;
        b=KIYk9nLuqHgQUiHTqHwvsqxdtkwWtomUSXdtLUJvyKEBO4xz6dlecaTNm430KnXhmR
         EZE7ChVYpfywKfCVAC0yMXW35ES5o+MQksWEyAHLWk/C27/HWnR0sO45MeBfX541tJHD
         WYNkQ7uFAYQbZVEYxfGKZ0NjSrsQJwMz4mXQy3ZMqZZ7TZCoY98mUA/dv0QVyrOSyNju
         qVgNLQBpU6GJQOBXsRQ0W4UCUjJcOy/urCaL+4EtYLE2JjnEnCVVCOOSUsAo/QgTiVoX
         ZadlxuRCjbHhSSOCraBSEnzdc2jSyfMzKEPI1TKi6+8Q8n6Vt+yGNyoc/VuEvC7wWf3C
         Y48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784990056; x=1785594856;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vD91S1DbebApVBCN527t7AaQw07MlhokwGC+vI5FhsI=;
        b=of+CbFb+/BGZEu7fqlgmdA7ov8WLSS4LeQAoxLDEtlNVgZNt7qVlZbqeANGE2jDZdM
         VRZqDDVX6hGcQFtMzm1PCZfnU0yXakZm+fcqlIpNyEyB9DiOzSVzUDwZlk2qzpUOl7Cu
         XNyNKsl2HjZGG+9F6Cw5fIC/WwaRDdLZEJr30Ecbt3NTAVuAh+r6yjaI3NQ7nHfKSRTs
         zijK/3rgUj16OHGMUP6GGL+0U2qWyM552HdJZ4khMYqcxhVVB64Wb6T50yAx/Qq1P5LL
         ihCXVJfe0wBsCqfTsFcYRqrVfOfIrY+e85gZGfYU+lQUD0G5X426ROi898NTqRviAWHh
         oqhA==
X-Forwarded-Encrypted: i=1; AHgh+Rr6aSWKgqqSjH2s7jVmBhVMOTiHWWmho4fX1lUOkWG872hLJ1xjblGLEcgnlM7UYEO2GnA9i+Tdbamo6X0xLALl@lists.infradead.org
X-Gm-Message-State: AOJu0YxEC7IZWaGBAwvyHM02v5nCSl9/43KVklFihz/3L0+h5Gd0bpSy
	7M08kGYOnP2NUFPrwBXAzRW+7BMkksXbsR8EyhKrfVyD2O370COhWPzcMTVU1U/YCxM=
X-Gm-Gg: AR+sD12J+8dA2XxUppWDIWDgcbv+XWC+RMY87nnBTHwL9zHotSXLJP8QswS5pTF+6s9
	98WyDXHDH/XCOyaTp8VHR35t6HF+cCRWi11RkrSr6TiTJEthkLUbTh6Kor+cRYHgq4HBXDdn+JS
	T1BQfVL+fTt9DBi0YPtj+KauRqhnNYOqV6mKrJg+hH3uZWvjyf55BnKLl/y6bz0fLoCBnit4roR
	Lx4lS4OKOQoER5QX2W14eOK1tQx6qca0CebfH5edW4e6eX21Q/gN94ECoAO+cx/thGPaYeHT/C3
	kFCUaaHTiUdffolXZkEP86522P+S/5Pq5zmcld6oVUHhn6w72XS0DwGvILiooX0xjSsFBDD6qv8
	SFvQfx9A5M0i9mC2QCcPaTgEcCP43r4pq2RQV+PSH6RZsghYY8FXV
X-Received: by 2002:a67:fd76:0:b0:744:d517:b0b0 with SMTP id ada2fe7eead31-74f9f02b7f2mr2159251137.10.1784990055747;
        Sat, 25 Jul 2026 07:34:15 -0700 (PDT)
Received: from ziepe.ca ([12.18.163.234])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97774f12690sm1878229241.12.2026.07.25.07.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 07:34:15 -0700 (PDT)
Received: from jgg by NV-9X0Z6D3.localdomain with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wndS7-000000000hU-1YTd;
	Sat, 25 Jul 2026 11:34:11 -0300
Date: Sat, 25 Jul 2026 11:34:11 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
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
	stable@vger.kernel.org, Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v8 01/23] dma-direct: return struct page from
 dma_direct_alloc_from_pool()
Message-ID: <amTJY_CdE-uDgoGG@ziepe.ca>
References: <20260717180442.110954-1-aneesh.kumar@kernel.org>
 <20260717180442.110954-2-aneesh.kumar@kernel.org>
 <20260721115456.GI110966@unreal>
 <yq5atsps77c5.fsf@kernel.org>
 <20260721142921.GN110966@unreal>
 <yq5ao6g0750v.fsf@kernel.org>
 <20260721153321.GO110966@unreal>
 <amEhEKQW0_HJ9cLN@ziepe.ca>
 <20260723075704.GC110966@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723075704.GC110966@unreal>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_073417_162872_E135ACB2 
X-CRM114-Status: GOOD (  19.51  )
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

On Thu, Jul 23, 2026 at 10:57:04AM +0300, Leon Romanovsky wrote:
> On Wed, Jul 22, 2026 at 04:59:12PM -0300, Jason Gunthorpe wrote:
> > On Tue, Jul 21, 2026 at 06:33:21PM +0300, Leon Romanovsky wrote:
> > 
> > > Something like, but probably void* needs to be phys_addr_t:
> > > 
> > > static inline struct page *dma_phys_to_page(void *addr)
> > > {
> > > #ifdef CONFIG_DMA_DIRECT_REMAP
> > > 	return vmalloc_to_page(addr);
> > > #else
> > > 	return virt_to_page(addr);
> > > #endif
> > > }
> > 
> > I don't like this, we don't know for sure the addr will be in a vmap
> > and this will fail if it isn't.
> 
> Of course we know. The existing "#ifdef CONFIG_DMA_DIRECT_REMAP" is
> relevant for addresses acquired from pool.

Yeah, but I still don't like it :) It is hard to follow if you make
those kinds of leaps, someone will call this new helper on something
they shouldn't

> dma_phys_to_page() is a bad name for some low-level conversion function.
> It needs to be internal to DMA logic, in the level when we convert from
> phys to page.

I think we should not convert from phys to page, that's also easy to
do wrong

Jason

