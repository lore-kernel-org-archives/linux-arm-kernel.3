Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9C9C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 14:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kz6APK9dsF4j4P9pg66c0MDK7d+JPOfYEid0r31fCbs=; b=3ci98Rr4c4/w9W2vv1XJUrPUTh
	n9+ltb5yc+7QQmJQ7atoQUdapHRQdQVzd7LSVRtzM2R16QYrw5TCY5YLDfp8WePFH5AwPyBv26ESf
	hZlNHiLxy9WsLoGd6GwbiUp3NuBWli46I/w2v+UJuyFpXm+2fYwyWc9oAE2AaCZ4xak0WHrHQ4+LT
	GWrTshw4Idz4OnUzauz1lmcmkOy1JB+hqA/l3+KNnn2QPn+c8z6eD+w/vVRMSFkghXA80JgJmsVOa
	TUu74Ix4Z0HyD/ra94mdeakEcgo+68MLd+O0QDnpseuxkYpwIVJZye6bTA4mGhXhEu6NCsPkE/AcS
	7z8yeh8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUR7R-00000008yD8-0VSE;
	Wed, 25 Jun 2025 14:28:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNsl-00000008PAQ-1km7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 11:01:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750849294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Kz6APK9dsF4j4P9pg66c0MDK7d+JPOfYEid0r31fCbs=;
	b=T8NMi8K8V48XEiohwY/MvBqbejqJTo30qm37WEowl2AEPgtryRYWdpgbl6bnsnDK7T1x/V
	U5spjR/UhG3P0bZq4fyqtH4bVD3AryqAnreRY1YHhRwYZifNtMsBYr+VQpel8Lsl8izJ1S
	Nn7CNuLkNrVRHRNGswFody+X3nFdy0A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204-nBfo7MO5PvCvPSXksn2y8Q-1; Wed, 25 Jun 2025 07:01:33 -0400
X-MC-Unique: nBfo7MO5PvCvPSXksn2y8Q-1
X-Mimecast-MFC-AGG-ID: nBfo7MO5PvCvPSXksn2y8Q_1750849292
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450de98b28eso3908755e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 04:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750849292; x=1751454092;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Kz6APK9dsF4j4P9pg66c0MDK7d+JPOfYEid0r31fCbs=;
        b=hGMsFMK6QhIJWzuH93I2Qm21+CjRa2nk/vcM4nLJN6NfsisufR2O8sPSzda3F2AF4r
         dERlKv/oxQyO1l5d70S22dDiO/aOULr0Z08aCUstpJLZRYWTjybfQyOpim4YpezzwUCc
         UuxaDeeu00TVLD5Vc6dbMoBkFttNNtU/QUHwZQ5Jhkh/PPVbauZg7OGGgdmrJbpFozIP
         QRWJ+xLPg+wV5y2qf+F+VWLdU9AnoX7dlwedy3VjSff7jrYv9kUDOrBFQMyNHkuW5Nx8
         G43kRRv28ztA9QsEKYK/BuDotm86qo0wcYGulERt89Gg85R3gtlfRPQh/8kTrCahxc5Q
         5r8g==
X-Forwarded-Encrypted: i=1; AJvYcCW8EoS8tMRoQw5O86+sfQ68LUuhO8rNMgHkVIfbJyfLyUlUEnhJFIiOEfu2MT0FEtFryv/dbwRLTpt1tbrgA4Hb@lists.infradead.org
X-Gm-Message-State: AOJu0YwDOXePd3PSvKMSKngjho5Fc/sAvVGkZ+Vb6j6ux2OIJZ6PjXvc
	P0d1LKjG0v+9Kba936ptKJp4+HGRJrPvbgQs/OD6vUPfBL4FRV0uEp22+Xe4F1mjAgNFcyo5emo
	BRZSWU3ea9CqXD/cYBtYypiz3KsPxGYLprsSgqNIWUCxuOfdDedsQURDWpOYBp83S+IiTbjrDYu
	cP
X-Gm-Gg: ASbGnct5ISoqg3VoJ1bZwYHGQysb+IJraMAbvDj9YQj+tndD/pfbWJ7wTf4339TwMFe
	xOr+FSmGfjC+hQryR+yZ3lBwu6SgAeU3V7REwdzkUieFpI4+8hi2uQv5WjOs8PswVXXnxRoFvfy
	L7hae1ZjEJ9E12KhAWNcH0+CnTeZQCWDMrxMWRqWRs1SqmNawnMKFGo+U7jGP1FAhMOUFUEn77L
	VmiJEWsrwu4w1URH3U4GI841UA0Q5lOrVc+XQAmUoKAOMZK2Q54/RwWVouRGx0Xhvv0kf7L4QQv
	aA/tj3lryHkV5WhGLAiG5la28fKj2EJq7d437btDCWcLO75Miiw6iu0hGrgzb4GoAxVEnXE05v4
	7tPwnBjfd9ffg2r25ap3GgAcUkuYlZq575ic2jUMK5hsj
X-Received: by 2002:a5d:64e6:0:b0:3a4:f722:a46b with SMTP id ffacd0b85a97d-3a6e71ff6aamr6361382f8f.15.1750849291855;
        Wed, 25 Jun 2025 04:01:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPZFLBLmsDHtXRB4H5l5o76XKJEC5l5yx1gYpH977UiB1XroTTTWDmy2sKvb5kr0xD7UuyEA==
X-Received: by 2002:a5d:64e6:0:b0:3a4:f722:a46b with SMTP id ffacd0b85a97d-3a6e71ff6aamr6361311f8f.15.1750849291308;
        Wed, 25 Jun 2025 04:01:31 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f12:1b00:5d6b:db26:e2b7:12? (p200300d82f121b005d6bdb26e2b70012.dip0.t-ipconnect.de. [2003:d8:2f12:1b00:5d6b:db26:e2b7:12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538235600csm16446145e9.20.2025.06.25.04.01.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 04:01:30 -0700 (PDT)
Message-ID: <5ba95609-302b-456a-a863-2bd5df51baf2@redhat.com>
Date: Wed, 25 Jun 2025 13:01:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: Barry Song <21cnbao@gmail.com>, Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, baolin.wang@linux.alibaba.com,
 chrisl@kernel.org, kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com,
 ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org,
 ying.huang@intel.com, zhengtangquan@oppo.com,
 Lance Yang <ioworker0@gmail.com>
References: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com>
 <20250624162503.78957-1-ioworker0@gmail.com>
 <27d174e0-c209-4851-825a-0baeb56df86f@redhat.com>
 <938c4726-b93e-46df-bceb-65c7574714a6@linux.dev>
 <CAGsJ_4y1GObH-C7R=FQL=UWe3kF6qhKoRqPxNPYx0k7uwocc+g@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CAGsJ_4y1GObH-C7R=FQL=UWe3kF6qhKoRqPxNPYx0k7uwocc+g@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ghuzT7f_CQ_Oa7LAeiDSn6Ee6xBp0Pxxyb2UkCiw7lg_1750849292
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_040135_535237_3A5E3454 
X-CRM114-Status: GOOD (  17.78  )
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

On 25.06.25 12:57, Barry Song wrote:
>>>
>>> Note that I don't quite understand why we have to batch the whole thing
>>> or fallback to
>>> individual pages. Why can't we perform other batches that span only some
>>> PTEs? What's special
>>> about 1 PTE vs. 2 PTEs vs. all PTEs?
>>
>> That's a good point about the "all-or-nothing" batching logic ;)
>>
>> It seems the "all-or-nothing" approach is specific to the lazyfree use
>> case, which needs to unmap the entire folio for reclamation. If that's
>> not possible, it falls back to the single-page slow path.
> 
> Other cases advance the PTE themselves, while try_to_unmap_one() relies
> on page_vma_mapped_walk() to advance the PTE. Unless we want to manually
> modify pvmw.pte and pvmw.address outside of page_vma_mapped_walk(), which
> to me seems like a violation of layers. :-)

Please explain to me why the following is not clearer and better:

diff --git a/mm/rmap.c b/mm/rmap.c
index 8200d705fe4ac..09e2c2f28aa58 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1845,23 +1845,31 @@ void folio_remove_rmap_pud(struct folio *folio, struct page *page,
  #endif
  }
  
-/* We support batch unmapping of PTEs for lazyfree large folios */
-static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
-                       struct folio *folio, pte_t *ptep)
+static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
+               struct page_vma_mapped_walk *pvmw, enum ttu_flags flags,
+               pte_t pte)
  {
         const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
-       int max_nr = folio_nr_pages(folio);
-       pte_t pte = ptep_get(ptep);
+       struct vm_area_struct *vma = pvmw->vma;
+       unsigned long end_addr, addr = pvmw->address;
+       unsigned int max_nr;
+
+       if (flags & TTU_HWPOISON)
+               return 1;
+       if (!folio_test_large(folio))
+               return 1;
+
+       /* We may only batch within a single VMA and a single page table. */
+       end_addr = min_t(unsigned long, ALIGN(addr + 1, PMD_SIZE), vma->vm_end);
+       max_nr = (end_addr - addr) >> PAGE_SHIFT;
  
+       /* We only support lazyfree batching for now ... */
         if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
-               return false;
+               return 1;
         if (pte_unused(pte))
-               return false;
-       if (pte_pfn(pte) != folio_pfn(folio))
-               return false;
-
-       return folio_pte_batch(folio, addr, ptep, pte, max_nr, fpb_flags, NULL,
-                              NULL, NULL) == max_nr;
+               return 1;
+       return folio_pte_batch(folio, addr, pvmw->pte, pte, max_nr, fpb_flags,
+                              NULL, NULL, NULL);
  }
  
  /*
@@ -2024,9 +2032,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
                         if (pte_dirty(pteval))
                                 folio_mark_dirty(folio);
                 } else if (likely(pte_present(pteval))) {
-                       if (folio_test_large(folio) && !(flags & TTU_HWPOISON) &&
-                           can_batch_unmap_folio_ptes(address, folio, pvmw.pte))
-                               nr_pages = folio_nr_pages(folio);
+                       nr_pages = folio_unmap_pte_batch(folio, &pvmw, flags, pteval);
                         end_addr = address + nr_pages * PAGE_SIZE;
                         flush_cache_range(vma, address, end_addr);


-- 
Cheers,

David / dhildenb


