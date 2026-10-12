Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060E8CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 11:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dOcvEm9msY+cl7KKbAZfMaogQnVH3/RbIaSfojxkTRo=; b=lkuKEiFaKUxBliw5tZOUQgnnBC
	9ohih757jfqUo7pg7WFObrdSAlurvAPQ0n8kmuKOlxGwkx6/raFJaL/9ZqfJss3Nkkpu6DXFYynL7
	AZmBFjijeI3l1DLsLzX7nsd/OPfdJn6S06uBOZHGXNmauerrK9labzYsaOEIj8r9esJMUVxq+H1r+
	EdwVglT74sIbCA/O6+HHO9CSs7LRRbQ6OSqVf5R5f4P7jKbR/Ie2O4ojVBIjV6R42jPSy0JXw77QU
	v5agQvy8ahEmQm9RoRDuIq+vu9K8jNglv8kQZbM4NXdT1Qi/CtZTAn5Z4NAYh6SWDbid3+qw/MFmu
	MAwHEHhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGE05-0000000AKRf-0NSS;
	Mon, 12 Oct 2026 11:15:25 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGE00-0000000AKQl-2d1l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 11:15:21 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-486e70f2457so740083f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 04:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791803718; x=1792408518; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dOcvEm9msY+cl7KKbAZfMaogQnVH3/RbIaSfojxkTRo=;
        b=ZXkIfO0fQOTTXBdXlFXyj5wcCcxJLHmbf+oBHtZQB06I+RYWbB/HVl8bPBRDzkzs8d
         bF1ftHACenCDRt5Tf+eHIRpNQ5oYx3drI4wzjIcbkOvFX7KZcWYhI4rCrzvYZjTgrKIf
         p4FTdLdOjii6X7cWH0m27YgdNrV6AiGKUrTXFbhLeq8KEfSWY1Wg9e6QetVn2svYgPwb
         bX7gtJpMBvAboUQq7f+KHHevA4wkfCWQ9nUmfqibrLGIrA+0xdIZa9jpDnI0ZCPXaLp5
         xIkm1KQg9zDMuDNnmZPiUVDo5TSs1ONTD3tLA5MUc0Wl/NRSFJM9nt1EtBy49nZch/4q
         2jIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791803718; x=1792408518;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dOcvEm9msY+cl7KKbAZfMaogQnVH3/RbIaSfojxkTRo=;
        b=RfWby3sVeGrsSalN9DGHGv2CQxevOE6wp1QGpkFlUdGCzrzxTQlVBlPJvk3xejq9bG
         YImkQrKEhKz2hJkuL/bJ6+E6X7dJXlj4i1r4Ghz7EJZGo0f6i3RobBeFFmUxk2fcyR4I
         gJ6SI0PgzgiwHoB0GjWmDin9jex+4RKn1biSLMmTFVKnsujtLJLjSbCjlpsJZhmVbi+T
         Na8Fzl4miwXI5DysIraRe+AVn/Vn4BRHkWpzEjdWpBcWp7zPK9jD9aXiuiCubhm+kyBm
         4gneCv71FcorZdX/UVlB066z0zedZxtJMzty8voHPHxkX79kwcVTD5CUHGD/PdcMqBKv
         b5qA==
X-Forwarded-Encrypted: i=1; AKwUvByo3bV085qc7rmfGxJNOGmPUtHTTjSVeAHz8zdjHAg+CPIFqU/hJLh8KB5Yxyxx3MKMxlQJQ0jN/txn8mV4lB3o@lists.infradead.org
X-Gm-Message-State: AFq9FYI1D8xeqIEnHLMxagQ1WWeWy2wGsI6ndIYD1s0Kx2WRzC2Wf8Au
	G66KCsBk+eQsocglDEvEk+f82LzDh6uWllJzNrnMah0mEqdOLQP3hcMn
X-Gm-Gg: AYBFou2TMV/O1ACbK/DV/x7WxrfYWuEAnafOP80aKE1WcHCwYuDoRyBviLqneSJ3EGV
	bsao3GZAeGZN+jt9mwDMrtwirZHj0Ey4k0QL0EL2byXPdnT9eQKxOqLVCgw0QqXrjLg3bDcNCF9
	wFrVTQA3ok8bjRoc6VMxFHzN/lQRBKBUg1OxOiAuktGwXmDyuJZEmtvh+ptwgjmRwYDwTunrly1
	eTgynopzy8D+1qEd5lxlizdNnjrVD5DrDkV1PHj3n/sgjtuMwYDoCYstXXMqB+lm+s3SDAdirDu
	z1Lz5CY1dp57M2U5thElekbdsuCqe+wsjs3KgjE4pHUOw1JrSszve3lTZ2bOtHAe1Gf+KE/V4Lc
	jDjFu/geuHRAVrCdON/BMIV/s7yybVn9gxq/MjSRZyO9ef6NSgT+pYrjwgJc884teK8mMpNnGem
	FUUO8igP8KruGp2ndSpTjIJVglWgtW6F/SpNC+Zyoe/huIjDUXutqYKsrx5RBoL7BKRvcLcg==
X-Received: by 2002:adf:e005:0:10b0:48d:dec7:974c with SMTP id ffacd0b85a97d-48ddec797bfmr346783f8f.7.1791803718021;
        Mon, 12 Oct 2026 04:15:18 -0700 (PDT)
Received: from gmail.com ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e33d2sm20034954f8f.9.2026.10.12.04.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 04:15:17 -0700 (PDT)
Date: Mon, 12 Oct 2026 13:15:14 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>, 
	Dave Hansen <dave.hansen@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, Muchun Song <muchun.song@linux.dev>
Subject: Re: [PATCH v2 1/4] mm: fix missing page-table destructor in
 pagetable_free()
Message-ID: <asy-b7_C3SjnmSaS@gmail.com>
References: <20261010112457.49485-1-songmuchun@bytedance.com>
 <20261010112457.49485-2-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010112457.49485-2-songmuchun@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_041520_689733_637FAFC6 
X-CRM114-Status: GOOD (  27.59  )
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

On Sat, Oct 10, 2026 at 07:24:54PM +0800, Muchun Song wrote:
> Since commit 49f599666420 ("mm: call ctor/dtor for kernel PTEs"),
> pte_alloc_one_kernel() runs the page-table constructor for kernel PTE
> tables.
> 
> HVO (HugeTLB Vmemmap Optimization) uses pte_alloc_one_kernel() when
> splitting a PMD. Restoring the vmemmap backing pages does not collapse
> the PTE table, so a later memory hot-remove eventually frees it through
> pagetable_free() on x86-64. That releases the page without running the
> matching destructor and leaves NR_PAGETABLE elevated.
> 
> Make pagetable_free() detect constructor-backed pages and run the
> destructor before releasing their memory to fix the problem.
> 
> Fixes: 49f599666420 ("mm: call ctor/dtor for kernel PTEs")
> Cc: stable@vger.kernel.org

is the x86 case covered for 6.16-6.18? as far as I can see, x86
free_pagetable() only uses pagetable_free() since bf9e4e30f353
("x86/mm: use pagetable_free()") in v6.19, so the backport wouldn't
change anything there. or am I missing something?

> Assisted-by: LLM
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
> v2:
> - Move destructor handling from x86 into pagetable_free() (suggested by
>   David Hildenbrand)
> - Trim and update the commit message (requested by Dave Hansen)
> ---
>  include/linux/mm.h | 37 ++++++++++++++++++++-----------------
>  1 file changed, 20 insertions(+), 17 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 5cca90fc1df6..771a7d60b0a5 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -3969,23 +3969,6 @@ static inline void pagetable_free_kernel(struct ptdesc *pt)
>  	__pagetable_free(pt);
>  }
>  #endif
> -/**
> - * pagetable_free - Free pagetables
> - * @pt:	The page table descriptor
> - *
> - * pagetable_free frees the memory of all page tables described by a page
> - * table descriptor and the memory for the descriptor itself.
> - */
> -static inline void pagetable_free(struct ptdesc *pt)
> -{
> -	if (ptdesc_test_kernel(pt)) {
> -		ptdesc_clear_kernel(pt);
> -		pagetable_free_kernel(pt);
> -	} else {
> -		__pagetable_free(pt);
> -	}
> -}
> -
>  #if defined(CONFIG_SPLIT_PTE_PTLOCKS)
>  #if ALLOC_SPLIT_PTLOCKS
>  void __init ptlock_cache_init(void);
> @@ -4078,6 +4061,26 @@ static inline void pagetable_dtor(struct ptdesc *ptdesc)
>  	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
>  }
>  
> +/**
> + * pagetable_free - Free pagetables
> + * @pt:	The page table descriptor
> + *
> + * pagetable_free frees the memory of all page tables described by a page
> + * table descriptor and the memory for the descriptor itself.
> + */
> +static inline void pagetable_free(struct ptdesc *pt)
> +{
> +	if (PageTable(ptdesc_page(pt)))
> +		pagetable_dtor(pt);
> +
> +	if (ptdesc_test_kernel(pt)) {
> +		ptdesc_clear_kernel(pt);
> +		pagetable_free_kernel(pt);
> +	} else {
> +		__pagetable_free(pt);
> +	}
> +}
> +
>  static inline void pagetable_dtor_free(struct ptdesc *ptdesc)
>  {
>  	pagetable_dtor(ptdesc);
> -- 
> 2.54.0
> 
> 

-- 
cheers,
jose a. p-a

