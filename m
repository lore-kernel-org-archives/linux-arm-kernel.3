Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF18C5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 11:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Neo+1K8ghUMGN3G9vUjB7A1LbHA9OhMwHPbvzVv5Wg=; b=thRZC9FDStt0sA0fqP/fQUHtmf
	zUYlsnd8qgsJV7xKknqlFcI3dM+d/62j8QbVKY7tbbLulG+0x5RiqPi7DELHeI88gu11sd/6ZB9Jj
	ggr7L8uI8Yl0fjgeSJYgzF/iskxj4PYLvV5FEGoeZUm0Rwg984WuK8Qaj7aMe7Zi5bcAdlx0pYPpv
	uCpwDXlJlMKMwZP5aVLCoVEbzX4jNQ2dgmQR642RXviNAffcEUe2SQjF5YOYgJGPwQn+RvkOIe04c
	oQqF1f4vTd7At88P9p1/7So9GynUmrkp9bcREX5NjSZjKmuE/FEuofh2q8K2+2yLequP82C+st4Ga
	NHWn04fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wweml-00000009hTR-2fke;
	Wed, 19 Aug 2026 11:48:47 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwemi-00000009hSI-2rbE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 11:48:46 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5aeb98460c6so1113212e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 04:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787140122; x=1787744922; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1Neo+1K8ghUMGN3G9vUjB7A1LbHA9OhMwHPbvzVv5Wg=;
        b=BcuTV2ftVvA0w4aoZcT9x148ee9FFPB6YgGPPpuQRyGeuXvj24GkWqSeQrgvgkUY70
         owhrz1H8kgdPeGEbplTV5Eph9WQpLKBzriwKQtFo0B0PlP1H0viWdtyTc0TAdfA5Hala
         /a564pp01xEUb4Sous/vFQ4XMH3sDA/MKL+KYf01ABxwlHjIA7a+FWtCnKTPsTAQ0Mfw
         JOVnp9VPV6nWAtH30PIrefj0/OdgxDtjkXzjNfHnduNBzVDIASHsLG0bAzDLR07E1KlU
         CcxwlcM7vYv4TC+hqHlbtAh/jplUAM/nrDr5UoD58O1f77SHdzqehfYzLUHGMBrLz/Iu
         bpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787140122; x=1787744922;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Neo+1K8ghUMGN3G9vUjB7A1LbHA9OhMwHPbvzVv5Wg=;
        b=P6emy+gug19iHBW1s5i15lcx0Ed9OnycyGRuVD4yPsvqDmxYpQmGMumJ40A+i0kbaN
         thRPWJbwgXAyFhlJ+8nOYBryIJtey5mqfTU8OGs7MW5sgej4/iShnncxU9b+ec48gYKm
         IhTERhrPvomEf5nguvTc0bLu3qj/lw4CwB2Iad4hZYMRlYcJxWJ98LWsG/pbOp6xML/s
         45xzLsJPrH672mAS5eahEVkwSThFwbpaigWZrzvBHKHE+gfhE5zaDnHvp/tKg41Sqb3S
         lbaIg+9suQjVxSlbTEgWWB2pmXu9iO21qeJmECjC15/qdfof1SU4GFyiyMXIxiqmtlss
         TTDA==
X-Forwarded-Encrypted: i=1; AHgh+Rrh373qwgBqYL+C+T173XAGxFv6A5zQrKZJsOcIf0zwhG0T0uRaNgM7gTjBvMOniHv5OFgmUBB52rWBWU8fGG4P@lists.infradead.org
X-Gm-Message-State: AOJu0YwAf9wmrCeA2wHEGP0nYA4UFMX4RLKB0mSlEo7nTAYsulyDuHYh
	Vgj7RYVIQ8VP7VUOPZt64QBBCZlblrM5AHII2jYYgkokExxVFKT32Aq9
X-Gm-Gg: AR+sD11mkx0HjcX/kyqo/0Ih+j0qoBXozQrjWJIYswFJRKBY7g9EAROnwPrx0MmzdFU
	yK8BSX8qoyxO6kzghGuZCrrUrZ0sZc/3EmcdrIaUpd6kQIrNiuGZURn1wyHIUFx3qj0akg/fxm5
	NPXZxqTcK3FSFXx9EZrqp2Hos99BpX0YY8a4JfnB2xjF/ja0rzY2igrka8/pc24d6qnmnWk3OgY
	aDLnnFH7nd7aVJfpdGXhFLt9IB5m63FbdZi05jExPMA2b1hMJjfCTuYYJ65Cb2I6ApSza45/seS
	ci6cWgqV+Mynk1Rhh++ENWDOYMctAqDR/tYerzQM3nKBuxDa5kMQSl57IHqOeihs0niBuUf35Ot
	AkUqvbOgj4UOC5kiWNj3uh2nlmCk+jgimrNZ6kiMhNCrvXRK8iBCzEZ//lRp1VwBG16Kn4QMyBf
	Amn7y4YdKXSTvp2EMB7OsHR9lgtBO52mjvvLhRSK2vafDDZBHSYd5dr7dOmjjXszT80WvS6mV3N
	RGW8yH6siXcgEzfb6h0KcnxwUcg3Q==
X-Received: by 2002:a05:6512:224d:b0:5b2:f453:1073 with SMTP id 2adb3069b0e04-5b478b9070dmr1376566e87.2.1787140121681;
        Wed, 19 Aug 2026 04:48:41 -0700 (PDT)
Received: from pc636 (host-95-193-137-165.mobileonline.telia.com. [95.193.137.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b478853971sm482752e87.10.2026.08.19.04.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 04:48:41 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 19 Aug 2026 13:48:36 +0200
To: Mike Rapoport <rppt@kernel.org>
Cc: Uladzislau Rezki <urezki@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Andy Lutomirski <luto@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Len Brown <lenb@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Vasily Gorbik <gor@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>,
	Will Deacon <will@kernel.org>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH 2/6] mm/vmalloc: set area's page_order after allocation
 succeeds
Message-ID: <aoWYFH_FJXlMK8fw@pc636>
References: <20260816-execmem-set-vm-perms-v0-2-v1-0-90944a3ad43f@kernel.org>
 <20260816-execmem-set-vm-perms-v0-2-v1-2-90944a3ad43f@kernel.org>
 <aoNFZU_QzghDBgbZ@milan>
 <aoVUF2pgl8JYNyIU@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoVUF2pgl8JYNyIU@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_044844_800830_6E18BC5A 
X-CRM114-Status: GOOD (  31.78  )
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

On Wed, Aug 19, 2026 at 09:58:31AM +0300, Mike Rapoport wrote:
> On Mon, Aug 17, 2026 at 07:31:17PM +0200, Uladzislau Rezki wrote:
> > On Sun, Aug 16, 2026 at 01:59:25PM +0300, Mike Rapoport (Microsoft) wrote:
> > > __vmalloc_area_node() calls set_vm_area_page_order() to set area's
> > > page_order before actually allocating pages to populate the area.
> > > 
> > > If allocation of large pages in HUGE_VMAP case fails midway, this leaves
> > > the area with elevated page_order throughout the cleanup path.
> > > 
> > > There is no actual issue with this because the only place that currently
> > > relies on area->page_order on the cleanup path is the loop calculating
> > > the direct map alias range in vm_reset_perms() and it anyway skips
> > > unpopulated pages.
> > > 
> > > But having set_vm_area_page_order() in the middle of __vmalloc_area_node()
> > > makes things very obscure, hard to reason about and error prone against
> > > future changes of the cleanup path.
> > > 
> > > Move the call to set_vm_area_page_order() after __vmalloc_area_node()
> > > succeeded where page order is guaranteed.
> > > 
> > > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > > ---
> > >  mm/vmalloc.c | 11 +++++++++--
> > >  1 file changed, 9 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > > index 22566e0b6e38..6822f0fe9583 100644
> > > --- a/mm/vmalloc.c
> > > +++ b/mm/vmalloc.c
> > > @@ -3901,8 +3901,7 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
> > >  		goto fail;
> > >  	}
> > >  
> > > -	set_vm_area_page_order(area, page_shift - PAGE_SHIFT);
> > > -	page_order = vm_area_page_order(area);
> > > +	page_order = page_shift - PAGE_SHIFT;
> > >  
> > >  	/*
> > >  	 * High-order nofail allocations are really expensive and
> > > @@ -4106,6 +4105,14 @@ void *__vmalloc_node_range_noprof(unsigned long size, unsigned long align,
> > >  	if (!ret)
> > >  		goto fail;
> > >  
> > > +	/*
> > > +	 * Set area->page_order once it's known exactly that the order of the
> > > +	 * pages the area contains.
> > > +	 * Even if we succeeded to partially populate the area with large pages,
> > > +	 * still treat the area as populated with order-0 pages.
> > > +	 */
> > > +	set_vm_area_page_order(area, shift - PAGE_SHIFT);
> > > +
> > >  	/*
> > >  	 * Mark the pages as accessible, now that they are mapped.
> > >  	 * The condition for setting KASAN_VMALLOC_INIT should complement the
> > > 
> > > -- 
> > > 2.53.0
> > > 
> > OK, can we just set it right after the:
> > 
> > 	area->nr_pages = vm_area_alloc_pages(
> > 			vmalloc_gfp_adjust(gfp_mask, page_order), node,
> > 			page_order, nr_small_pages, area->pages);
> > 
> > 
> > succeeds?
> 
> Here it's still not clear if vm_area_page_order() succeeded :)
> 
> I can move it just before
> 
>  	return area->addr;
> 
Even better :) For next version:

Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki

