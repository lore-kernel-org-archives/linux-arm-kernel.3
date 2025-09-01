Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E08CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 13:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=89QceRiDVJR9qzpuoMtjZ42nHjE3zxx93/plzyge73k=; b=JpoH4fpKnthXbHMzGcMDM8pbxz
	w/W4qB5nSAUokI4YH6YlSqUN/LPiLqIDqewiJ/65uHh5UOVmguxQholVM/2Qg76t1C2uFM3BYjl2u
	5g/DAJgH73tRp4+FpQ9tHMyE5SAuHQMzGUBauJ0EqXL7sCKmSthPXhP+p0b8x/UqV8iQG//cVTZ05
	EfrVWJHFMWC7zs0MfC9iZXvptl1OOJgl6aCZfAVklH6+W90JAJBnY6pHudL1nmIztWD7a8tF+GYQJ
	Q3dxBKL+JZME5AxlF5nLSW+zKNcipyNpjYrXMkpu926tXYVbJISOkm2TLU6mK4eqY2r5SjzbVTo0P
	OFe/aReg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut4uY-0000000CkET-0Diz;
	Mon, 01 Sep 2025 13:49:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut2oa-0000000C4VV-33oX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 11:35:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756726511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=89QceRiDVJR9qzpuoMtjZ42nHjE3zxx93/plzyge73k=;
	b=Oi4kPtKW6msMclc99VeFrwikaUAGGqFo1qJnSWm3pfX32GugEguMEBTt/RA9KGrQE3tb4j
	YtiYW6OJ1Nf+URcS2bvEOvL21+u3d0ZwUU+NiPfSgFJGlqRVG2YtLvYkpcs3/KyhMvLVUd
	76BrqD6X7mJLnFX2+Ua8oSR8rNiVpn4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-H_YLyBi2NU6KPOxH-6YP1Q-1; Mon, 01 Sep 2025 07:35:10 -0400
X-MC-Unique: H_YLyBi2NU6KPOxH-6YP1Q-1
X-Mimecast-MFC-AGG-ID: H_YLyBi2NU6KPOxH-6YP1Q_1756726509
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3d48b45fad0so881944f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 04:35:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756726509; x=1757331309;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=89QceRiDVJR9qzpuoMtjZ42nHjE3zxx93/plzyge73k=;
        b=mh8ID6dR3XEVtIF8iOdcb+h+a0mjOISW4KNlMHdfqeDsAorJK4cQwMiy1a6KWQEWpb
         rvCOG5etVXGI/8NMDVojJ9qbFTgRBxJKHEO/owYafMIQxGY19aj/JNDZgAMAhc5huyMg
         MLiFEAbcXz5pkYTbUvhlk57f8hGhHEIX2Nbh6opmd0UloSSzNjofNkVUsCV7QRbMiEJ0
         l09Nu5C77W1XwvDN2eGGORUUh6Ggw1Fu2+7dfOPO4PhAM7T2XhFFpKGgHvGrxmZvzqRA
         VSiMPiKOGpw/CGvLh9pnZ2VhCM7ZbmUuHkqb1crGVCN8N3js6UKBnJ6JVPLPbPUWObkK
         3VIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8Hdggj7qdP5o0RsxmdW2Vm1lT8knSS95i8mj+XhJYhc13IK/Ha1LVtD+rAa8Tfv/UKd6PrK4bJlT3xSIAHYif@lists.infradead.org
X-Gm-Message-State: AOJu0YzZZmGTRQysq0AG+TmpOHxessQ94lhqEqKvW1X3ED+wpV6BjxGT
	OVd9x9DqDvEQZVr0LZ1PgkuaHnIZs/ETVeV9IdIC4hmMQ/j+qn75iZDVCozq9F5fJzeSIaS++WV
	Vljk9CDCbBacyKHPsUqvBsCRXxza6/2xGCZ5sv7wqP9fKAaUzQPYm7LDzzQYuyrxXCxCy8s9DH0
	sA
X-Gm-Gg: ASbGnctXT7kp3sTkP8TYahNxjD7RaRi12cf1UpmXqoE5tS1mKeh0zA63QE77OrQfB46
	f/d301+pw+VZZRZ1tH+yF1Jzt2OEXRpcO2A8zCV3z05zKcX92mjsMW8PRApHHVTbvFrOkejPPPO
	NTYn3wWHAPRrOy7oCFWcEYuqNu2Jyr/FsMTRbIVBnYpg3Bj9ILvpr2ufmFpU0pk5QV+yVRxtMbs
	daf+va7SxNjArnDlUINxtNqpVxPOCdU2shWGAGIAcLCoPEYHG41ydkLOfuKzi4PlNvgnDbnUDRy
	PSXZkCqFlFf9xfi2btCCaFJaQf18mRLuSj4L+j/6vWQZSx+rFFfYfohhPuGSu9GS+fRc0Hd91A3
	f2yBXwxGMthh6yvO5Lu3t8DKLBiVZe98k3xxyKRzOa6qplQDZwz1grRFxZnwk/BABXJA=
X-Received: by 2002:a5d:5f8c:0:b0:3cf:5f17:f350 with SMTP id ffacd0b85a97d-3d1b16f0165mr6056404f8f.18.1756726508822;
        Mon, 01 Sep 2025 04:35:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0RKJ8MgbrMGxtF+aataA+fh1iSiigcyDX0AK/3/6NRoLPIE0BwSmxJshAaTyrpOEmePBJCw==
X-Received: by 2002:a5d:5f8c:0:b0:3cf:5f17:f350 with SMTP id ffacd0b85a97d-3d1b16f0165mr6056350f8f.18.1756726508320;
        Mon, 01 Sep 2025 04:35:08 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f37:2b00:948c:dd9f:29c8:73f4? (p200300d82f372b00948cdd9f29c873f4.dip0.t-ipconnect.de. [2003:d8:2f37:2b00:948c:dd9f:29c8:73f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6fe5sm233831875e9.5.2025.09.01.04.35.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 04:35:07 -0700 (PDT)
Message-ID: <44072455-fc68-430d-ad38-0b9ce6a10b8d@redhat.com>
Date: Mon, 1 Sep 2025 13:35:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 18/36] mm/gup: drop nth_page() usage within folio when
 recording subpages
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>,
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
 linux-scsi@vger.kernel.org, Marco Elver <elver@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>,
 Peter Xu <peterx@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
References: <20250827220141.262669-1-david@redhat.com>
 <20250827220141.262669-19-david@redhat.com>
 <c0dadc4f-6415-4818-a319-e3e15ff47a24@lucifer.local>
 <632fea32-28aa-4993-9eff-99fc291c64f2@redhat.com>
 <8a26ae97-9a78-4db5-be98-9c1f6e4fb403@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <8a26ae97-9a78-4db5-be98-9c1f6e4fb403@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NrcVa61zOPHwz1ljMzy8hIfpYogRmF1mVcLyp7VziN4_1756726509
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_043512_851632_1ADABCBD 
X-CRM114-Status: GOOD (  17.36  )
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

>>
>>
>> The nice thing is that we only record pages in the array if they actually passed our tests.
> 
> Yeah that's nice actually.
> 
> This is fine (not the meme :P)

:D

> 
> So yes let's do this!

That leaves us with the following on top of this patch:

 From 4533c6e3590cab0c53e81045624d5949e0ad9015 Mon Sep 17 00:00:00 2001
From: David Hildenbrand <david@redhat.com>
Date: Fri, 29 Aug 2025 15:41:45 +0200
Subject: [PATCH] mm/gup: remove record_subpages()

We can just cleanup the code by calculating the #refs earlier,
so we can just inline what remains of record_subpages().

Calculate the number of references/pages ahead of times, and record them
only once all our tests passed.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
  mm/gup.c | 25 ++++++++-----------------
  1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 89ca0813791ab..5a72a135ec70b 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -484,19 +484,6 @@ static inline void mm_set_has_pinned_flag(struct mm_struct *mm)
  #ifdef CONFIG_MMU
  
  #ifdef CONFIG_HAVE_GUP_FAST
-static int record_subpages(struct page *page, unsigned long sz,
-			   unsigned long addr, unsigned long end,
-			   struct page **pages)
-{
-	int nr;
-
-	page += (addr & (sz - 1)) >> PAGE_SHIFT;
-	for (nr = 0; addr != end; nr++, addr += PAGE_SIZE)
-		pages[nr] = page++;
-
-	return nr;
-}
-
  /**
   * try_grab_folio_fast() - Attempt to get or pin a folio in fast path.
   * @page:  pointer to page to be grabbed
@@ -2963,8 +2950,8 @@ static int gup_fast_pmd_leaf(pmd_t orig, pmd_t *pmdp, unsigned long addr,
  	if (pmd_special(orig))
  		return 0;
  
-	page = pmd_page(orig);
-	refs = record_subpages(page, PMD_SIZE, addr, end, pages + *nr);
+	refs = (end - addr) >> PAGE_SHIFT;
+	page = pmd_page(orig) + ((addr & ~PMD_MASK) >> PAGE_SHIFT);
  
  	folio = try_grab_folio_fast(page, refs, flags);
  	if (!folio)
@@ -2985,6 +2972,8 @@ static int gup_fast_pmd_leaf(pmd_t orig, pmd_t *pmdp, unsigned long addr,
  	}
  
  	*nr += refs;
+	for (; refs; refs--)
+		*(pages++) = page++;
  	folio_set_referenced(folio);
  	return 1;
  }
@@ -3003,8 +2992,8 @@ static int gup_fast_pud_leaf(pud_t orig, pud_t *pudp, unsigned long addr,
  	if (pud_special(orig))
  		return 0;
  
-	page = pud_page(orig);
-	refs = record_subpages(page, PUD_SIZE, addr, end, pages + *nr);
+	refs = (end - addr) >> PAGE_SHIFT;
+	page = pud_page(orig) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
  
  	folio = try_grab_folio_fast(page, refs, flags);
  	if (!folio)
@@ -3026,6 +3015,8 @@ static int gup_fast_pud_leaf(pud_t orig, pud_t *pudp, unsigned long addr,
  	}
  
  	*nr += refs;
+	for (; refs; refs--)
+		*(pages++) = page++;
  	folio_set_referenced(folio);
  	return 1;
  }
-- 
2.50.1


-- 
Cheers

David / dhildenb


