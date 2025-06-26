Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A7C2C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 12:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W9Q6vWQMAD+pyX5yU0mYRqo1CgBOlEkw6ZKpgSd/AcU=; b=wHSjs+Z8OvoxLR4vLbVlU4ukHA
	q/VhOW+d2SvlTPWPIoPpcP8WTxCFXm0Psq93NgWD+eqafrZy0jLHl6VjMsffz/EaDMAIyiyJoE8s7
	aIlWDxa1a+oqhsUwsaJw15DHfa9oaE9yBQAYD7QV2cYbywiJs0B/ynXteUinoYbaKZSyeQ80Rc9ep
	p4i5y3ltBBMe5JBgmeP70dYODe94COsH/TbyFTRXJ7wICxRABUwGyaPwPYqjp7uNG63wy/pSdLWLs
	b0cGWYNCaAd6IqMoI6z0hsgMRrf04a0Yx4AGhR167PjLCXQEOTueHXGJhD2uKR8TgOceNAgjvSeqe
	96QGlJ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUm3z-0000000BaMX-2zCU;
	Thu, 26 Jun 2025 12:50:47 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUlyI-0000000BZT5-18yj;
	Thu, 26 Jun 2025 12:44:55 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-453643020bdso8184805e9.1;
        Thu, 26 Jun 2025 05:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750941893; x=1751546693; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9Q6vWQMAD+pyX5yU0mYRqo1CgBOlEkw6ZKpgSd/AcU=;
        b=CYrHo1xaH6jyaPUqtbEtfeonKV5YWamqOF8fep3waRbDL0xP6l8//2GU2Q83C6d1UF
         d6mZxPOMrbkA6UH+Y2P/oFCqwu4DO/xRPMuSNfXNp+736n+T3uR4xevqHFfV7aRXasrG
         9XvUWaTv0++HNV/PWvAJqwnbPiby7ZiX0db3J7rmyS7Qu9bUZxpCkbsStQTnOBNOE9Y1
         x45ZO0HWLmc1600/XwhngCcWxWGNIWPlH8tRAV3jwPjO3ZR5NmM7OJG3P4rk9yyAh0y/
         pss50eKyz4hdUKclKViAkQj6ya/scxpLvuMnOym5oudX3BTrlGeS53Wtx3JvpMHau/z2
         8Qpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750941893; x=1751546693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9Q6vWQMAD+pyX5yU0mYRqo1CgBOlEkw6ZKpgSd/AcU=;
        b=vtCCKK06lAOeLwf060Bk355wDdzwqB5c3u1pz+FsEQJm6CQSoNDCHNBNAenwvczvse
         ArSCFdRi1qu6LQRvLBQGs1fB7bX+v6o1kSIkQnAJoi4hPcjmAAlbdjAGzsUyGXsODIIl
         oEHsBSgu5ay+oEolb/kFWLMwJBLX5fu3kyFhempoalXBfNGeblXgnxHzMcGjPjkolcaT
         fo2JTMTH9t+gb2fA2UtjkL7fDNYV2GzT2Cd0S4ZfuKC3Qk0v5HcR6LHBTVnxtNeeFCzl
         NTq7a0G7VfIYKES1mlixkHUWoGG3sZ8zxevXtG/ptPoabj06yLMeDNdyM7Z9zNupIOFB
         ttaw==
X-Forwarded-Encrypted: i=1; AJvYcCV1YPcTVMgmtapwa9zLzKeVHkPjaPRGuOYcP0ADsfhu/E8V3vXZBjhB9J01A/JmSD5tsQK8CheZUW/cdhsL7PYf@lists.infradead.org, AJvYcCXOG8++n3DnxuROYHHaZ6ig2L51sEGwM28XxKMasW2SoFiw2ZsrkRnSMh69van0BBb4H5yev5wgEl2X9ac=@lists.infradead.org
X-Gm-Message-State: AOJu0YxrfmEF7VurjsVS7De+UURMq/1JWbwLqOGBojH09Y5MXmSqwGvX
	NY4F7A410Qm0tZjbO80mMBLvh/TvL4FCUZsdcKcmS0ncAZUB9HTsJonw
X-Gm-Gg: ASbGncvYm+F/Y+GfIrTHbsTOZahnr0vLXnDKsSdP7dUJrwkEN999mxUZLYwXtOLvxP2
	UnH2awe2JgzVer3hRmXxkZuTG6TLsCTc4XX3YTcU+c6csR74PSlZXRn8KB2NJeUo8p1OFbyRCq/
	yJHG1CKXfU0IeQ+5fxJhtzdLmiFYefON7tAyHjZa0KlD+89QWdY4DoV5Ur49WBxchSOhT2p7bEW
	JPaP8NbVdJixrHoRuXnjjoEDQcpasoTrMnoupYnZQa5kR7Fx4WwY05+BQp67r083w4dmjFUalzk
	zZki7PCl5xgJcOEEWLAlRFs+AKLQFz7XuhIKivTa+i3Uh48=
X-Google-Smtp-Source: AGHT+IHK9z/BBG/9EKAw7EpO3uOD6zjU0SI80m4T9S7pG+NIa80Str49cvuzTLt7WfihJvvYhpI4ug==
X-Received: by 2002:a5d:5847:0:b0:3a3:7593:818b with SMTP id ffacd0b85a97d-3a6ed62eb62mr6202221f8f.21.1750941892202;
        Thu, 26 Jun 2025 05:44:52 -0700 (PDT)
Received: from EBJ9932692.tcent.cn ([2a09:0:1:2::3086])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a831051c49sm161455f8f.30.2025.06.26.05.44.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Jun 2025 05:44:51 -0700 (PDT)
From: Lance Yang <ioworker0@gmail.com>
To: ioworker0@gmail.com
Cc: 21cnbao@gmail.com,
	akpm@linux-foundation.org,
	baolin.wang@linux.alibaba.com,
	chrisl@kernel.org,
	david@redhat.com,
	kasong@tencent.com,
	lance.yang@linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	lorenzo.stoakes@oracle.com,
	ryan.roberts@arm.com,
	v-songbaohua@oppo.com,
	x86@kernel.org,
	ying.huang@intel.com,
	zhengtangquan@oppo.com
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large folios during reclamation
Date: Thu, 26 Jun 2025 20:44:45 +0800
Message-ID: <20250626124445.77865-1-ioworker0@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250626092905.31305-1-ioworker0@gmail.com>
References: <20250626092905.31305-1-ioworker0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_054454_309320_7B32D20B 
X-CRM114-Status: GOOD (  24.91  )
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


On 2025/6/26 17:29, Lance Yang wrote:
> Before I send out the real patch, I'd like to get some quick feedback to
> ensure I've understood the discussion correctly ;)
> 
> Does this look like the right direction?
> 
> diff --git a/mm/rmap.c b/mm/rmap.c
> index fb63d9256f09..5ebffe2137e4 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1845,23 +1845,37 @@ void folio_remove_rmap_pud(struct folio *folio, struct page *page,
>   #endif
>   }
>   
> -/* We support batch unmapping of PTEs for lazyfree large folios */
> -static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
> -			struct folio *folio, pte_t *ptep)
> +static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
> +			struct page_vma_mapped_walk *pvmw,
> +			enum ttu_flags flags, pte_t pte)
>   {
>   	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> -	int max_nr = folio_nr_pages(folio);
> -	pte_t pte = ptep_get(ptep);
> +	unsigned long end_addr, addr = pvmw->address;
> +	struct vm_area_struct *vma = pvmw->vma;
> +	unsigned int max_nr;
> +
> +	if (flags & TTU_HWPOISON)
> +		return 1;
> +	if (!folio_test_large(folio))
> +		return 1;
>   
> +	/* We may only batch within a single VMA and a single page table. */
> +	end_addr = pmd_addr_end(addr, vma->vm_end);
> +	max_nr = (end_addr - addr) >> PAGE_SHIFT;
> +
> +	/* We only support lazyfree batching for now ... */
>   	if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
> -		return false;
> +		return 1;
>   	if (pte_unused(pte))
> -		return false;
> -	if (pte_pfn(pte) != folio_pfn(folio))
> -		return false;
> +		return 1;
> +
> +	/* ... where we must be able to batch the whole folio. */
> +	if (pte_pfn(pte) != folio_pfn(folio) || max_nr != folio_nr_pages(folio))
> +		return 1;
> +	max_nr = folio_pte_batch(folio, addr, pvmw->pte, pte, max_nr, fpb_flags,
> +				 NULL, NULL, NULL);
>   
> -	return folio_pte_batch(folio, addr, ptep, pte, max_nr, fpb_flags, NULL,
> -			       NULL, NULL) == max_nr;
> +	return (max_nr != folio_nr_pages(folio)) ? 1 : max_nr;
>   }
>   
>   /*
> @@ -2024,9 +2038,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>   			if (pte_dirty(pteval))
>   				folio_mark_dirty(folio);
>   		} else if (likely(pte_present(pteval))) {
> -			if (folio_test_large(folio) && !(flags & TTU_HWPOISON) &&
> -			    can_batch_unmap_folio_ptes(address, folio, pvmw.pte))
> -				nr_pages = folio_nr_pages(folio);
> +			nr_pages = folio_unmap_pte_batch(folio, &pvmw, flags, pteval);
>   			end_addr = address + nr_pages * PAGE_SIZE;
>   			flush_cache_range(vma, address, end_addr);
>   
> @@ -2206,13 +2218,16 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>   			hugetlb_remove_rmap(folio);
>   		} else {
>   			folio_remove_rmap_ptes(folio, subpage, nr_pages, vma);
> -			folio_ref_sub(folio, nr_pages - 1);
>   		}
>   		if (vma->vm_flags & VM_LOCKED)
>   			mlock_drain_local();
> -		folio_put(folio);
> -		/* We have already batched the entire folio */
> -		if (nr_pages > 1)
> +		folio_put_refs(folio, nr_pages);
> +
> +		/*
> +		 * If we are sure that we batched the entire folio and cleared
> +		 * all PTEs, we can just optimize and stop right here.
> +		 */
> +		if (nr_pages == folio_nr_pages(folio))
>   			goto walk_done;
>   		continue;
>   walk_abort:
> --

Oops ... Through testing on my machine, I found that the logic doesn't
behave as expected because I messed up the meaning of max_nr (the available
scan room in the page table) with folio_nr_pages(folio) :(

With the following change:

diff --git a/mm/rmap.c b/mm/rmap.c
index 5ebffe2137e4..b1407348e14e 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1850,9 +1850,9 @@ static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
 			enum ttu_flags flags, pte_t pte)
 {
 	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
+	unsigned int max_nr, nr_pages = folio_nr_pages(folio);
 	unsigned long end_addr, addr = pvmw->address;
 	struct vm_area_struct *vma = pvmw->vma;
-	unsigned int max_nr;
 
 	if (flags & TTU_HWPOISON)
 		return 1;
@@ -1870,12 +1870,13 @@ static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
 		return 1;
 
 	/* ... where we must be able to batch the whole folio. */
-	if (pte_pfn(pte) != folio_pfn(folio) || max_nr != folio_nr_pages(folio))
+	if (pte_pfn(pte) != folio_pfn(folio) || max_nr < nr_pages)
 		return 1;
-	max_nr = folio_pte_batch(folio, addr, pvmw->pte, pte, max_nr, fpb_flags,
-				 NULL, NULL, NULL);
 
-	return (max_nr != folio_nr_pages(folio)) ? 1 : max_nr;
+	max_nr = folio_pte_batch(folio, addr, pvmw->pte, pte, nr_pages,
+				 fpb_flags, NULL, NULL, NULL);
+
+	return (max_nr != nr_pages) ? 1 : max_nr;
 }
 
 /*
--

... then things work as expected for the lazyfree case, without any
splitting.

