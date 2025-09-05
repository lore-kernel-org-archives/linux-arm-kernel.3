Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADA0CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 07:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oF3HN1Q6ZNxZN3c5DymWi4LgFv8yUurotu5FuTflls4=; b=C8/3HB7MhbKtnKRqrN9s9PsTOx
	vibo1pidWMgEcQoUvJqoTCWBoqIcv6njfQspNitwl34p3SEJQJk2miIr5xmnYdKUX4TF3F3IY5mDT
	5vM92GDWlHYlF2zXUrH6kwrUwfsRl16Q+MSlDIckTdc/wQ5I0NUaBZmGZzE0OFqrTcIVKkew4AWai
	E2wdOZTbhzq+P0TEBmvBsiaqBCUss+jUCgBuVEkUxCN5nEjpI6HdB5qOtnYabvm7+9mKIiagen/9e
	BQyAdkKB1KNjot9J20FWapjEL+9pPVSwkn+sa4FMIO5669vNhU6p+q9L6OTjHFzb+9C4syeCz6afI
	bq1wsvQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuR4Z-000000005hJ-3GUp;
	Fri, 05 Sep 2025 07:41:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuQ8f-0000000HLOV-0pWu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 06:41:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757054496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=oF3HN1Q6ZNxZN3c5DymWi4LgFv8yUurotu5FuTflls4=;
	b=RKU0inl4iB4g0BhinyVyPZktj8kfEeVPyfAD1eJYBD/MI6KXbcdqCsEo9FONnL7DEX+Jt4
	3Y5so9caQdxVe59b3lARj1EATbSuvaWJCmdHUks78M5fY8xmXsm2FLetWQ77slvFZCxIu0
	pL2CD7X/y16ef/i68cNdCk3/CKLxH2A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-438-QCfHuXGeML29Ip4xiHR21Q-1; Fri, 05 Sep 2025 02:41:29 -0400
X-MC-Unique: QCfHuXGeML29Ip4xiHR21Q-1
X-Mimecast-MFC-AGG-ID: QCfHuXGeML29Ip4xiHR21Q_1757054488
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45dd9a66cfbso1788845e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 23:41:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757054488; x=1757659288;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oF3HN1Q6ZNxZN3c5DymWi4LgFv8yUurotu5FuTflls4=;
        b=EuMjhUZwx6dCyrqjkrB2h0WC73N8tZMBuq4GrzSHJ8oqKqx9CTSRcVLPFzBC5w67GI
         J5RKKI0BDkrhoT2Z7Ha6Q8aeqh7rRZbj6RrCPW/Onj7oo1S65uWLmVXn+9+/UH2gp3eL
         ZFjgWP+PotNnmTENN8vQ1Vx+sr8noClS9nKbfWNEaiJDF15q5lRHu2bJOjqRh3oVfjGD
         z8lnUOHWu9Kfhth1VrP/bOKYgTi24DSVJoNKwUdiR726Tlq8JOAtLdCtiZ2OAHyPVBIG
         vz9QpjB5CVy9tJ4URsrpt+Xe/q9VE47WI2DLqQcn9NaopC8K7s5qv0aCWUURQJXRSvlv
         EwVw==
X-Forwarded-Encrypted: i=1; AJvYcCXKHD0E2egHXbW3lQiHA7YC9e/DqAgPyfsHvDMHDYjDyNorYDWIWou7OoxviCUt7ySV1Mgz1ukd/w7gbhcXvlUq@lists.infradead.org
X-Gm-Message-State: AOJu0YxnnCDatxr3mscoYKJxAM/hBgj6gvMUp2EdS9wrWz7hKpuyhvt1
	mKXJywl8B64u2tqOVuOYVxier0puvmZyrJ6axSmd1191S8Ko7cOwoaopS7Z/bK/kd8hHi7vss0W
	ALdbThvP+VyJlOiZSphxC3vHKDyFIQSLexBuar54FXfGG6ZIWVzQ0cmAdGpIVKhbAYwcGBkRwKE
	ze
X-Gm-Gg: ASbGncsrGD6/KLEWoh1ey4QB0im3bHVNSB6YpubeuO0oiJRFZmk1sYIIAIuMbZ5bq0Z
	ZuJDPra3Fc/Z0PQZ982M7Lyn7Nva1jZ4JN6OWeKl7dPOOztOeyLzm+mlFassEmNLl4wRW5iq9ie
	HbqXXra+zrtwL+ZBlFkQP2pSvgKBqhb6wzFRMN685O3RBAryv6ndYvlcdRt8loqhlgktzEstpFv
	DFJLBW2wqK9kLypndC/WsZr0uxpJ95ZRtZCMC4wNcAgZhjwhN60A51/J9kAuEDQadxn7OaXW+Sy
	vLP6J7Aw9R3nlezrX3skp0hrA5XiucpD8pLE0nRnNHA/o04rsHsDXRTOlU/yv/E2QUK3S6yhupF
	WG+mzjjZVOD5mmagIHwOlSsnoYUiRd8TmC6wgwLeArfBTY0z0e9tFefLO
X-Received: by 2002:a05:600c:4ec9:b0:45b:7ffa:1bf8 with SMTP id 5b1f17b1804b1-45b934f6a56mr114233105e9.23.1757054487766;
        Thu, 04 Sep 2025 23:41:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEj1Q4ueRZg61r58J+1sq7/RpmSeqvAcWabr/Sq37OcVKAf1elh8/EonCz3Jhepl0SBZP4Cg==
X-Received: by 2002:a05:600c:4ec9:b0:45b:7ffa:1bf8 with SMTP id 5b1f17b1804b1-45b934f6a56mr114232615e9.23.1757054487185;
        Thu, 04 Sep 2025 23:41:27 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4d:e00:298:59cc:2514:52? (p200300d82f4d0e00029859cc25140052.dip0.t-ipconnect.de. [2003:d8:2f4d:e00:298:59cc:2514:52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e8879cesm316420125e9.12.2025.09.04.23.41.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 23:41:26 -0700 (PDT)
Message-ID: <5090355d-546a-4d06-99e1-064354d156b5@redhat.com>
Date: Fri, 5 Sep 2025 08:41:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/37] mm/gup: remove record_subpages()
To: linux-kernel@vger.kernel.org
Cc: Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, kvm@vger.kernel.org,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Marco Elver <elver@google.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Tejun Heo <tj@kernel.org>, virtualization@lists.linux.dev,
 Vlastimil Babka <vbabka@suse.cz>, wireguard@lists.zx2c4.com, x86@kernel.org,
 Zi Yan <ziy@nvidia.com>, Jens Axboe <axboe@kernel.dk>
References: <20250901150359.867252-1-david@redhat.com>
 <20250901150359.867252-20-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250901150359.867252-20-david@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SN5CI2jDdOUHjsQgRgs1RN3NgY515ONIpHQhjmtTYsw_1757054488
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_234137_306548_29F46B8D 
X-CRM114-Status: GOOD (  24.40  )
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

On 01.09.25 17:03, David Hildenbrand wrote:
> We can just cleanup the code by calculating the #refs earlier,
> so we can just inline what remains of record_subpages().
> 
> Calculate the number of references/pages ahead of times, and record them
> only once all our tests passed.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   mm/gup.c | 25 ++++++++-----------------
>   1 file changed, 8 insertions(+), 17 deletions(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index c10cd969c1a3b..f0f4d1a68e094 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -484,19 +484,6 @@ static inline void mm_set_has_pinned_flag(struct mm_struct *mm)
>   #ifdef CONFIG_MMU
>   
>   #ifdef CONFIG_HAVE_GUP_FAST
> -static int record_subpages(struct page *page, unsigned long sz,
> -			   unsigned long addr, unsigned long end,
> -			   struct page **pages)
> -{
> -	int nr;
> -
> -	page += (addr & (sz - 1)) >> PAGE_SHIFT;
> -	for (nr = 0; addr != end; nr++, addr += PAGE_SIZE)
> -		pages[nr] = page++;
> -
> -	return nr;
> -}
> -
>   /**
>    * try_grab_folio_fast() - Attempt to get or pin a folio in fast path.
>    * @page:  pointer to page to be grabbed
> @@ -2967,8 +2954,8 @@ static int gup_fast_pmd_leaf(pmd_t orig, pmd_t *pmdp, unsigned long addr,
>   	if (pmd_special(orig))
>   		return 0;
>   
> -	page = pmd_page(orig);
> -	refs = record_subpages(page, PMD_SIZE, addr, end, pages + *nr);
> +	refs = (end - addr) >> PAGE_SHIFT;
> +	page = pmd_page(orig) + ((addr & ~PMD_MASK) >> PAGE_SHIFT);
>   
>   	folio = try_grab_folio_fast(page, refs, flags);
>   	if (!folio)
> @@ -2989,6 +2976,8 @@ static int gup_fast_pmd_leaf(pmd_t orig, pmd_t *pmdp, unsigned long addr,
>   	}
>   
>   	*nr += refs;
> +	for (; refs; refs--)
> +		*(pages++) = page++;
>   	folio_set_referenced(folio);
>   	return 1;
>   }
> @@ -3007,8 +2996,8 @@ static int gup_fast_pud_leaf(pud_t orig, pud_t *pudp, unsigned long addr,
>   	if (pud_special(orig))
>   		return 0;
>   
> -	page = pud_page(orig);
> -	refs = record_subpages(page, PUD_SIZE, addr, end, pages + *nr);
> +	refs = (end - addr) >> PAGE_SHIFT;
> +	page = pud_page(orig) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
>   
>   	folio = try_grab_folio_fast(page, refs, flags);
>   	if (!folio)
> @@ -3030,6 +3019,8 @@ static int gup_fast_pud_leaf(pud_t orig, pud_t *pudp, unsigned long addr,
>   	}
>   
>   	*nr += refs;
> +	for (; refs; refs--)
> +		*(pages++) = page++;
>   	folio_set_referenced(folio);
>   	return 1;
>   }

Okay, this code is nasty. We should rework this code to just return the nr and receive a the proper
pages pointer, getting rid of the "*nr" parameter.

For the time being, the following should do the trick:

commit bfd07c995814354f6b66c5b6a72e96a7aa9fb73b (HEAD -> nth_page)
Author: David Hildenbrand <david@redhat.com>
Date:   Fri Sep 5 08:38:43 2025 +0200

     fixup: mm/gup: remove record_subpages()
     
     pages is not adjusted by the caller, but idnexed by existing *nr.
     
     Signed-off-by: David Hildenbrand <david@redhat.com>

diff --git a/mm/gup.c b/mm/gup.c
index 010fe56f6e132..22420f2069ee1 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2981,6 +2981,7 @@ static int gup_fast_pmd_leaf(pmd_t orig, pmd_t *pmdp, unsigned long addr,
                 return 0;
         }
  
+       pages += *nr;
         *nr += refs;
         for (; refs; refs--)
                 *(pages++) = page++;
@@ -3024,6 +3025,7 @@ static int gup_fast_pud_leaf(pud_t orig, pud_t *pudp, unsigned long addr,
                 return 0;
         }
  
+       pages += *nr;
         *nr += refs;
         for (; refs; refs--)
                 *(pages++) = page++;


-- 

Cheers

David / dhildenb


