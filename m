Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F15C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 17:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=51jkDGqcYSlWtUq0/oF4m7PdKEgEv1ezQg2syRvYV9I=; b=RB2G+E8jiL6BMwn/uaWq6Jfb+C
	M7Bjo1sE0XDguoPZWAwkM3wZA1nxulI2zI3uZTQ54lkiZBd75iPjR6wMitwVqowVbp/1YUdSgAWFE
	5+99K8W89VlkucRJ1WJAnymKInYA7GN8Gew9XrlociR6UhMuVaAIXQmZo04LFFMs4HsbJVCkYy5v4
	ppsZWredSxlhiJPB31yuRgrrCUOTqsFP9clw6fKCoO9OD4m/sB+L2CIDsUl1xrAoV0Hc/6PNMYWVT
	bMJA3tMvxWD2Va1Vi8fGdbwb6sh7Ova+mnJ7WRoO6tLmTh0RBtf1QTRJLaKn1kxeC/Zrzhlgp/5/j
	Wjs4yMpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKUR-0000000A7UE-24xz;
	Mon, 13 Jul 2026 17:30:47 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKUP-0000000A7TK-2qrP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 17:30:47 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5aec201b582so3124453e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 10:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783963843; x=1784568643; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=51jkDGqcYSlWtUq0/oF4m7PdKEgEv1ezQg2syRvYV9I=;
        b=Ko+lqeR8yUMC5JwhnmYmr43tRp17YQ66BjWQ098xrFDyYZBcW93I6axolIEJv404ni
         tpdjq5ER5YQpZ++KOSstt7T1mJ7ncbUXTl/cY2U2gpp4onjSnRks+GD50T1gtpI/P7IB
         rJvNFJITalPjn32ZZO3pvPot4pcKURZdVXkHOCaFibJK283UPNDGUuLsxWWIN+qZjHEN
         6kv1OwgvfT8i2YTIg3O5yBg6IM+x0Yibjvn8WMWOtmzrasUq83ukbzf4zKye8WdsbsLV
         ILWuxeandog6h5ZGBo9P62dTXZtypwk2ik6q3bRdKTw0rHq3Aav4tQC9DXTUGgdeHjSE
         8YLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783963843; x=1784568643;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=51jkDGqcYSlWtUq0/oF4m7PdKEgEv1ezQg2syRvYV9I=;
        b=Cdlz1ELMB1E6SQfolLWW06oNLYgW2QETe9BgQjs3z8IH50Hp29KvDbt78f6PPd+Zk0
         8sjkyHgtcZNcR+1eepLE1zR3SKpgm0ZA7VpcPZtFUVoekKtPm6oV0hPXrREfcz+0ybKJ
         TojP9d4vpWAZr36B4AJG14+3X7Sc54EiRp7nDU3T/hDkQ84qghRmELFayjuKQuOYFtUX
         lciffXzqcJ2sJwX8HWfelrhaKnJmasgk6sX0WG2wP3iOuQzzZhc5SDhsvQSd71BN8+mh
         V2yfnZ3AT23FzOZVmpFE77u2JvLJll02lpf7Dov0GEcI6C/ZM36VQP93BR1P15dVTRbH
         8ZzA==
X-Forwarded-Encrypted: i=1; AHgh+RrXFIxvbUaypbIWhb/pHpjvdJyI7egB/fWQmd/+Vq3p3gCFpENehD5/Ok1E2stFpketIcHGdHVDa4Hs3N8NuzEj@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2mA5j2WarMtwOhEN6XnRLD52qXL9oBhPHVCTSRyzmy8JR5pJC
	DmMCiuH32d9wyq+0sMJEBr4HQdcGgwU2JKb4zDp76Zs+yY9XBe+5JOb0
X-Gm-Gg: AfdE7cnUpaUBUQ744zzZjEcFSsB0g3TgIH/VpR0nudDic5qDLFDwiiZ5gXw8jerGZXW
	SCDQB70HlYOAZyYlAp+7LI1sP887aRkBRad+ERkyk8M4mBk/EFyNWbZC2i1e/lpv+InJ15//swa
	zIDxMHm3+3eU4LTjvb+6F4eXRkNlxvJV1KhKnBp9QSaRVGtCwk2QCcYOCuSIrFwMlmBsEfYr1Pf
	sLHkiw6u9Q+yeRSl33jCrYD3nq1b+V3d9BhRIuV3K1/sAc8mPUtZRN/7cqjQZEkOwFT0oKti4Dr
	efXa78l6kEuSQnWXIljNZ4+MJ4i3r41SM1Hp8X4XLGwsc1zW4jgu8dIbNYsYEfB6ecFVM0EYTuS
	vTRwsYp8smsz+DN7iNLf7r4L0xLsIIoc69sAF6I4Zy9DOqAaptHtSZiLrsxbreT8Y
X-Received: by 2002:a05:6512:3353:b0:5b0:ceb2:1974 with SMTP id 2adb3069b0e04-5b0ceb21b1dmr2073653e87.14.1783963843127;
        Mon, 13 Jul 2026 10:30:43 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca5559csm2984970e87.36.2026.07.13.10.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 10:30:42 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Mon, 13 Jul 2026 19:30:40 +0200
To: Dev Jain <dev.jain@arm.com>
Cc: Wen Jiang <jiangwenxiaomi@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>, catalin.marinas@arm.com,
	linux-mm@kvack.org, urezki@gmail.com, will@kernel.org,
	Xueyuan.chen21@gmail.com, ajd@linux.ibm.com,
	anshuman.khandual@arm.com, david@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	rppt@kernel.org, ryan.roberts@arm.com,
	Wen Jiang <jiangwen6@xiaomi.com>
Subject: Re: [PATCH v6 0/6] mm/vmalloc: Speed up ioremap, vmalloc and vmap
 with contiguous memory
Message-ID: <alUgwPT9uh_EWItt@milan>
References: <20260709073823.6643-1-jiangwen6@xiaomi.com>
 <20260709160805.26e63bae89dd03cf2951104e@linux-foundation.org>
 <CAHKocdH5kp5kTtZht+v5j-4-Thh40TGvif3=kRMgErRXr+Q+RQ@mail.gmail.com>
 <54434a84-51b3-4e3f-988b-6bcbac5a2f42@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54434a84-51b3-4e3f-988b-6bcbac5a2f42@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_103045_754847_52CE9EDB 
X-CRM114-Status: GOOD (  34.12  )
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

On Mon, Jul 13, 2026 at 08:43:14PM +0530, Dev Jain wrote:
> 
> 
> On 10/07/26 2:24 pm, Wen Jiang wrote:
> > On Fri, 10 Jul 2026 at 07:08, Andrew Morton <akpm@linux-foundation.org> wrote:
> >>
> >> On Thu,  9 Jul 2026 15:38:17 +0800 Wen Jiang <jiangwenxiaomi@gmail.com> wrote:
> >>
> >>> This patchset accelerates ioremap, vmalloc, and vmap when the memory
> >>> is physically fully or partially contiguous.
> >>
> >> Thanks, I added this to mm.git's mm-new branch for wider testing.
> >>
> >> AI review asked some questions, and some of them are new since the v5
> >> series:
> >>         https://sashiko.dev/#/patchset/20260709073823.6643-1-jiangwen6@xiaomi.com
> > 
> > Hi Andrew,
> > 
> > I've gone through the Sashiko findings:
> > 
> > - Patch 1 (find_num_contig): Over-interpretation. No new hugetlbfs hstate
> >   is added. The extra sizes are only used by init_mm kernel mappings via.
> > 
> > - Patch 5/6 (NULL page): Invalid input. vmap() expects a fully populated
> >     array of valid struct page pointers.
> 
> Correct, but vmap_pages_pte_range has !page and !pfn_valid checks.
> 
> I really hate those checks - if those checks have any remote possibility of
> firing, then we already have a bug at
> 
> vm_map_ram -> vmap_pages_range -> vmap_pages_range_noflush -> kmsan_vmap_pages_range_noflush
> 
> because the last function dereferences the struct page pointers.
> 
> It is painful to do the page array sanity check deep into vmap - it implies
> we simply cannot play with the page array before that.
> 
> But since vmap is an exported function, doing a sanity check for the page array
> in the vmap code makes sense.
> 
> So how about the following:
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index afaa14ebf17bb..0c44bb7a45b5d 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -566,14 +566,6 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>  			err = -EBUSY;
>  			break;
>  		}
> -		if (WARN_ON(!page)) {
> -			err = -ENOMEM;
> -			break;
> -		}
> -		if (WARN_ON(!pfn_valid(page_to_pfn(page)))) {
> -			err = -EINVAL;
> -			break;
> -		}
> 
>  		pfn = page_to_pfn(page);
>  		size = vmap_set_ptes(pte, addr, end, pfn, prot, shift);
> @@ -603,11 +595,6 @@ static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
>  			struct page *page = pages[*nr];
>  			phys_addr_t phys_addr;
> 
> -			if (WARN_ON(!page))
> -				return -ENOMEM;
> -			if (WARN_ON(!pfn_valid(page_to_pfn(page))))
> -				return -EINVAL;
> -
>  			phys_addr = page_to_phys(page);
> 
>  			if (vmap_try_huge_pmd(pmd, addr, next, phys_addr, prot,
> @@ -3663,6 +3650,19 @@ static struct vm_struct *vmap_get_aligned_vm_area(unsigned long size,
>  	return __get_vm_area_node_aligned_caller(size, PAGE_SIZE, flags, caller);
>  }
> 
> +static inline bool vmap_page_sanity_checks(struct page **pages, unsigned int count)
> +{
> +	for (int i = 0; i < count; ++i) {
> +		if (WARN_ON(!pages[i]))
> +			return true;
> +
> +		if (WARN_ON(!pfn_valid(page_to_pfn(pages[i]))))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>  /**
>   * vmap - map an array of pages into virtually contiguous space
>   * @pages: array of page pointers
> @@ -3706,6 +3706,9 @@ void *vmap(struct page **pages, unsigned int count,
>  	if (!area)
>  		return NULL;
> 
> +	if (unlikely(vmap_page_sanity_checks(pages, count)))
> +		return NULL;
> +
>  	addr = (unsigned long)area->addr;
>  	if (vmap_pages_range_batched(addr, addr + size, pgprot_nx(prot),
>  				pages) < 0) {
> 
> 
> 
> Reasoning for calling vmap_page_sanity_checks() before vmap_pages_range_batched,
> and not at the start of vmap: I am worried that since vmap() is already very
> fast, we may cause a regression:
> 
> vmap() -> scan page array with linear map pointers -> vmap_get_aligned_vm_area (does
> memory allocation, throwing out the linear map VAs from cache and TLB) -> walk
> the pgtables and again access cold page array.
> 
> Perhaps I am being very pedantic here. What do you think?
> 
Sanity check adds extra CPU cycles and it adds overhead. The concern about cache
to be cold on second iteration looks valid. You can get some perf figures to see
the cost.

I would just keep the original approach. But no strong opinion here.

--
Uladzislau Rezki

