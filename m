Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35BA2C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 09:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vkgu8toociZzIJhvAE7ca3qg7cytH4ujCtgPL1CR/5A=; b=X20ct6ZaC1rr2KztwiDgoljpfI
	EidEbFkJGVAye2CZsash7iSqw9cTkjakoF47bWRoM2OsBna4SVEc/6T9I882iDkzaZCnWihhViAmi
	gczjWmtQmZOtn4lvD+fEt+FI36/F4TAHdzmFGuwN42XefI+XeSYYz4JQubIEJem628D0UEeq0eTQL
	V/GIvMyNANqB1m4l09wciMQskb9L7qoKazbRRvMZlsSS589NFMN7E68bpkIhs1wbXdmN5QRvtMSCo
	uWUpqP292HgR8ltPFg/POlLq4iaUsAbjCeEe5rss7lfLHEKyHgX/adIDDLCqPKiKexwonQxn7CILL
	ycQusxvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Vza-00000006OW3-0YnS;
	Mon, 07 Sep 2026 09:50:22 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3VzX-00000006OVY-2LJt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 09:50:20 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-482e067e908so2765454f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 02:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788774617; x=1789379417; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vkgu8toociZzIJhvAE7ca3qg7cytH4ujCtgPL1CR/5A=;
        b=f8Xc4GqEP5HaXeBfMuG4pkA35i+OI0xTiKFWXN1y9lZglssrUnD5nnJwxTyfbdT3yb
         7dAiWjQL4QVrF9WCqUfpU7OZoUxFJNqrRTEwEzSIpc+icfkEdZT80sOhH8ykuEBGhQUd
         TJGW7FePMLlmG2gQ2ZACDvjLtI4EEIH/ZTo+Pjn+/p+kVu6WnbDdOCARYv3i3McIHslI
         iT7zzMa++XbBkJ6SyiSqqnHdWKklF3Oa+wHhIFs66iPkdROHgmf7uDZAZGFT6tXX18aY
         o5Drm324JvHsXB22B2SjCU2U5NC1MYFyiFDvXgqXJOtwnglhjgguqEsG0/a2XKT8uLeX
         eIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774617; x=1789379417;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vkgu8toociZzIJhvAE7ca3qg7cytH4ujCtgPL1CR/5A=;
        b=WvQP2DDFG6n2l9nakMzFPr3OXhOFrzJoo1u9rdjbgizvTspNbgB+ZKt6zfpSaPUKdY
         5tvr5pMkPCH2lGcOJwwQdNYlB3+DFuN3dFTtz0LbLaVTEx7Ije4/iPtOkZ57zvLjBIaB
         Alf5UuPSArRy1+S+n0HYQ0bNRcal/hI56p0mMn52N8bESUyTG5hKILyjIi04ouTFrLs3
         cwxmxrNvQNH44NfzeBEGohf/u4xeiWtNAbovcOUO9Wy8WC2c2MWRnDl7Vo/gRgFNbEF9
         OtDh5oSHf7mjTo367yWEZWCb7LCpxnoPF0x9m/sJeaw5g8LANQv4a3RFSURYnsGxbCsm
         8yYg==
X-Forwarded-Encrypted: i=1; AKwUvByioCWlq+xUytmC5Lt3uf2HHRoT5QFgPvRvP6lUv5ko5Rg4NN5CMgz3hRs+ETvOuqzy4zYkCMQht+uh1vbofNkl@lists.infradead.org
X-Gm-Message-State: AFuF++nhNrQfTz4HLhIzYmUsiFqUFqnIbY6PchUsrSKebSQFlaLZKCal
	NRDPYoI4wWCIN/xaMFfdPAfoUxKe1UgWY2bq+5mOqfkZvoihbWqFtj5gHnYa58XsKg==
X-Gm-Gg: AYBFou3YJHtvus9NeaX/tYP+E9msYCORttK7LcBcIDEPS/xw8v+kjehZkJXRyOryOq2
	7yjSrEYpzal5ezRMcpK7059ZV5E86IkbtBiZ0T8OokLHd3Ga+RHFVYuQqLzyF1jqogfHb28Xu+w
	4servgw6H/pxCxNX80F/xOlK7UaYxbLjSzkDQHndpwuczRX72Y8L6xEcgQtCdUtO6ZZI7J59m8b
	81tFEPEizwfJs57DnHVG10O+1uaweTjg/NEweCDxQhWbRmsMXTYFtZBMz72ahNbxD6s8pl7/bY5
	H2s8m08LjaeAzqCEeTRZiXaVAW4TtVq0rMKXVdxpB0ZsUTutf+sYgaALB3avewiGe6chFJ7zprn
	enmyN3lnn3nRxG3S3Rt5Sd1GDSsDhWy5OVAOCfDN6hW++dIzMOFIoW8AsJ0EV5z1XBlFK0wQn44
	5fq2yGaJXQUm4E4W0LAzxkJdb6d5GFLu8buR6Tz2n0W1frWmZRzPfnTIO4w5qWR8AR10gQaMZPL
	QQQZz/lxyXV4k2DToHWHCyalY+QwzIs
X-Received: by 2002:adf:e18d:0:b0:485:8a46:7060 with SMTP id ffacd0b85a97d-4858a46720amr19581670f8f.50.1788774615795;
        Mon, 07 Sep 2026 02:50:15 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d312ca0sm27142034f8f.4.2026.09.07.02.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:50:15 -0700 (PDT)
Date: Mon, 7 Sep 2026 10:50:12 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
	sudeep.holla@kernel.org, jenswi@kernel.org, robh@kernel.org,
	mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org,
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 01/10] memblock: Introduce MEMBLOCK_LLMAP
Message-ID: <ap6I1FN_2ylRzFXH@google.com>
References: <20260902104712.2399797-1-vdonnefort@google.com>
 <20260902104712.2399797-2-vdonnefort@google.com>
 <ap2_926WXr7uAYVX@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap2_926WXr7uAYVX@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_025019_638712_6EE014C4 
X-CRM114-Status: GOOD (  36.40  )
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

On Sun, Sep 06, 2026 at 10:33:11PM +0300, Mike Rapoport wrote:
> On Wed, Sep 02, 2026 at 11:47:03AM +0100, Vincent Donnefort wrote:
> > Keeping last-level mappings is interesting on some architectures as it
> > allows mapping/unmapping pages from the kernel direct map without the
> > risk of splitting blocks which, under the break-before-make rule, may
> > trigger page-faults the kernel can't handle.
> > 
> > However, mapping the entire direct map at PTE-level is costly. So
> > instead, create a new memblock flag MEMBLOCK_LLMAP to enable the system
> 
> I believe MEMBLOCK_PTE_MAP sounds more descriptive.

The idea was to have something close from NOMAP, to emphasis it is one or the
other. But PTE_MAP sounds good too.

> 
> > to decide which region must be covered by mappings up to the last-level.
> > 
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > 
> > diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> > index d62db9e776cf..d40a5ded188d 100644
> > --- a/include/linux/memblock.h
> > +++ b/include/linux/memblock.h
> > @@ -52,6 +52,7 @@ extern unsigned long long max_possible_pfn;
> >   * kernel that we know is good to use. It is the only memory that
> >   * allocations may happen from in this phase.
> >   * @MEMBLOCK_RSRV_HUGETLB: memory is reserved for hugetlb pages
> > + * @MEMBLOCK_LLMAP: memory region to be mapped using last-level mapping
> >   */
> >  enum memblock_flags {
> >  	MEMBLOCK_NONE		= 0x0,	/* No special request */
> > @@ -63,6 +64,7 @@ enum memblock_flags {
> >  	MEMBLOCK_RSRV_KERN	= 0x20,	/* memory reserved for kernel use */
> >  	MEMBLOCK_KHO_SCRATCH	= 0x40,	/* scratch memory for kexec handover */
> >  	MEMBLOCK_RSRV_HUGETLB	= 0x80, /* memory reserved for hugetlb pages */
> > +	MEMBLOCK_LLMAP		= 0x100,/* last-level mapping */
> >  };
> >  
> >  /**
> > @@ -160,6 +162,8 @@ int memblock_reserved_mark_noinit(phys_addr_t base, phys_addr_t size);
> >  int memblock_reserved_mark_kern(phys_addr_t base, phys_addr_t size);
> >  int memblock_mark_kho_scratch(phys_addr_t base, phys_addr_t size);
> >  int memblock_clear_kho_scratch(phys_addr_t base, phys_addr_t size);
> > +int memblock_mark_llmap(phys_addr_t base, phys_addr_t size);
> > +int memblock_clear_llmap(phys_addr_t base, phys_addr_t size);
> >  
> >  void memblock_free(void *ptr, size_t size);
> >  void reset_all_zones_managed_pages(void);
> > @@ -306,6 +310,11 @@ static inline bool memblock_is_kho_scratch(struct memblock_region *m)
> >  	return m->flags & MEMBLOCK_KHO_SCRATCH;
> >  }
> >  
> > +static inline bool memblock_is_llmap(struct memblock_region *m)
> > +{
> > +	return m->flags & MEMBLOCK_LLMAP;
> > +}
> > +
> >  int memblock_search_pfn_nid(unsigned long pfn, unsigned long *start_pfn,
> >  			    unsigned long  *end_pfn);
> >  void __next_mem_pfn_range(int *idx, int nid, unsigned long *out_start_pfn,
> > diff --git a/mm/memblock.c b/mm/memblock.c
> > index 9ce86349a29f..1591b50503ed 100644
> > --- a/mm/memblock.c
> > +++ b/mm/memblock.c
> > @@ -1119,6 +1119,16 @@ int __init_memblock memblock_mark_mirror(phys_addr_t base, phys_addr_t size)
> >   */
> >  int __init_memblock memblock_mark_nomap(phys_addr_t base, phys_addr_t size)
> >  {
> > +	struct memblock_region *r;
> > +
> > +	memblock_cap_size(base, &size);
> > +
> > +	for_each_mem_region(r) {
> > +		if (memblock_is_llmap(r) &&
> > +		    memblock_addrs_overlap(base, size, r->base, r->size))
> > +			return -EINVAL;
> > +	}
> 
> I'm not very fond of implicit skips here. memblock has no idea what's the
> caller intention, maybe it actually wants to change the memory from nomap
> to pte-mapped.
> 
> I'd rather warn in memblock_is_nomap() and memblock_is_llmap() if they both
> are set and let the caller deal with making sure they are not.

ack.

> 
> > +
> >  	return memblock_setclr_flag(&memblock.memory, base, size, 1, MEMBLOCK_NOMAP);
> >  }
> >  
> > @@ -1204,6 +1214,45 @@ __init int memblock_clear_kho_scratch(phys_addr_t base, phys_addr_t size)
> >  				    MEMBLOCK_KHO_SCRATCH);
> >  }
> >  
> > +/**
> > + * memblock_mark_llmap - Mark a memory region with flag MEMBLOCK_LLMAP.
> > + * @base: the base phys addr of the region
> > + * @size: the size of the region
> > + *
> > + * If supported by the architecture, such region is mapped at the last-level in
> > + * the kernel direct map.
> > + *
> > + * Return: 0 on success, -errno on failure.
> > + */
> > +int __init_memblock memblock_mark_llmap(phys_addr_t base, phys_addr_t size)
> > +{
> > +	struct memblock_region *r;
> > +
> > +	memblock_cap_size(base, &size);
> > +
> > +	for_each_mem_region(r) {
> > +		if (memblock_is_nomap(r) &&
> > +		    memblock_addrs_overlap(base, size, r->base, r->size))
> > +			return -EINVAL;
> > +	}
> 
> same here

ack

> 
> > +
> > +	return memblock_setclr_flag(&memblock.memory, base, size, 1,
> > +				    MEMBLOCK_LLMAP);
> > +}
> > +
> > +/**
> > + * memblock_clear_llmap - Clear flag MEMBLOCK_LLMAP for a specified region.
> > + * @base: the base phys addr of the region
> > + * @size: the size of the region
> > + *
> > + * Return: 0 on success, -errno on failure.
> > + */
> > +int __init_memblock memblock_clear_llmap(phys_addr_t base, phys_addr_t size)
> > +{
> > +	return memblock_setclr_flag(&memblock.memory, base, size, 0,
> > +				    MEMBLOCK_LLMAP);
> > +}
> > +
> >  static bool should_skip_region(struct memblock_type *type,
> >  			       struct memblock_region *m,
> >  			       int nid, int flags)
> > @@ -2886,6 +2935,7 @@ static const char * const flagname[] = {
> >  	[ilog2(MEMBLOCK_RSRV_NOINIT)] = "RSV_NIT",
> >  	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
> >  	[ilog2(MEMBLOCK_KHO_SCRATCH)] = "KHO_SCRATCH",
> > +	[ilog2(MEMBLOCK_LLMAP)] = "LLMAP",
> >  };
> >  
> >  static int memblock_debug_show(struct seq_file *m, void *private)
> > -- 
> > 2.55.0.970.g62bdec98f9-goog
> > 
> 
> -- 
> Sincerely yours,
> Mike.

-- 
Vincent

