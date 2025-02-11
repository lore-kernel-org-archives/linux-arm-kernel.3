Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060A3C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 09:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vr9sqfyFIOUURX1EuDQ0UB7aKZBVOm3DmIxM7ELCYpI=; b=SuQ3sph4f1jR/y
	5utBEgpfeTjFt7pB391U4FgSYhasC7qkVKp9plMzGtRLzhx3jPVwZSrYDjT/FmZvAbWo9PLqhH5V3
	JGY2D+wnGBBsSQzn3GdwK027NpNnKY/ux8mJvUbCU0kNWw9i8bpWobPs5RfFwCfzgJi+5lCim8HfM
	crvLFFGjut5xlSbAdki2HsXWvev/UifIAyv9OYNcBG39dL/Zj0bU5TjaP1NryPByo8jr9EUhoaO2K
	gZIIAGNzReWhdqRXrOb/UzB47jrfjWBa74FJY/np5nzU0PW1pTyMi5o/nXc5v+ZIV3NCTJ0G7KjcN
	b7e0RsoeNcIIaI7sdqyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thmoz-00000003EW7-0fi1;
	Tue, 11 Feb 2025 09:44:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thmna-00000003EHn-03yr
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 11 Feb 2025 09:43:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Vr9sqfyFIOUURX1EuDQ0UB7aKZBVOm3DmIxM7ELCYpI=; b=oV/CLDLt5ww5wFgNttZ3i/FMYy
	GmXDNipZwRqCzsk9/nwCCabQ2B65Yqxtf6+HGaRQleeJXFNnwgntxEAiWlYnRl3VGetr/pltGt8cJ
	A/2a86imZsbaoA3ZJv9tg+AGAM/uWZ6xRnkO7TxywgxF+kK2Z/qNG1Yk5/4a8XuCa2m9vo21iPOH6
	oLgm0nytQO8JTK/+OhHp7zZ87l9p0dAX410P0WLwXM0MeImmRLeud7/MnNJxx5irLtcyRU7WYH8Qy
	Xh/Ft1g9M2bUgykFAGGyLvyXRws440RyzBGiAorl9YGzWfJGUA9Essb+AFPs/H5c2fhYwzZwmcZAC
	1Thk+jVw==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thmnW-00000000Y1T-3MVp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 09:43:20 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21f7f03d856so44719345ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 01:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739266995; x=1739871795; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vr9sqfyFIOUURX1EuDQ0UB7aKZBVOm3DmIxM7ELCYpI=;
        b=ite1Y0JCNKjYwIjrU+OWMMpTbtMfQdCzIE5XKInRiIgHCnTvKGzqISvT7jT3PznFEm
         GCDoJTBGbu3kFwCSzGMKQRzkdaErOlJSExBfiMApG6pwBTYySgIDxsLMw7d8E2hNINXH
         xHsD/Z6cZ1E1HpthIibJUE/o9vG6+nhAgLU7qe2bGsGgkMImi34T28Z0kES9irFVsghy
         neUzBpJ9q4hTYkzkLm7ZZLuIWS9xAdN0e7YV6xDqP6HHKh7NELgLdaDqMuU9Az7uSh8X
         F8UKcb1kE/noMf56yiHvC91MQVmjNCC1hq+QRukXeFQSaOAxUpqmJYAa6utihXzXBiMz
         kKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739266995; x=1739871795;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vr9sqfyFIOUURX1EuDQ0UB7aKZBVOm3DmIxM7ELCYpI=;
        b=DccWgQyXXe6uQ3MteSvU2AvSOn9IJJ5nOlWaqWUJZ9XIF1Nv1SUgdm8/OeeqB2sdsC
         T2Y86FGFmAN4/gfhzeuakyEXO29tsqRypTYgiZ59mGVEp0gHKU9PLXGjURMekyfNMl+d
         2khna5ggqGtH3jqf0wtwkbhKi9oBx3qkim4vB5SoDrW5RMk9IJo19YVxj859cefXGIf1
         14i7EykxltwUaHEEzRqLVUDINM+4tNSEkDuUwZYsj0UbMic1y0D9IA1JW422y3JH7VMU
         iHlkVC7rDKePDpFSkF1fm8MP5AewTY6/NFVlv0AafcV4D1zwb9IDYEGGA33dxRIUSti3
         i+6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMpQut9jHD2NHgjhbHLzRonQmSh0mthZ7Ia6JqnOy8opZRaSSvCgpXxLac0OeWkkP/qQ2JoF8sLCTNIPS+lJFD@lists.infradead.org
X-Gm-Message-State: AOJu0YzPNdAw5DQqPhtcHat1To7IbfqG0wzcyMiEiRIET1tuFF9TldjH
	8ffBxCcAUQtgSN0isUK9L++U1/t9xH6xjTR7gxhzbprWbHMM/BewVZ5vRrs4ZfI=
X-Gm-Gg: ASbGncuoCw5Mm+sEkXnc2VDzbUfxFtN52fBSwURfMu6hmKRB9O0ccYLV12llFpQK/9z
	bqW0+4Lnlnl0LQr5znvl2U7Dvi+dIEXG8OFnmPd+VsXe4qppYvGoLkUIk2wcAyXmqCh3DahZ4oX
	MKwMaeuiKfSmHlhSIkd7NY3IMATY96X2c8IPRsXK/pY/FmlqqqhFxyaxX23RO0GKa/j4XtOzejk
	xWU1HBKKAs2IY4zBc6khF9WP6wY4MsuGZuMSF2qjlAy9wgbrzVNpsPrNIsakd6HxeC59aiNw46I
	JJ7A+S92P+b+TIqUo3/JP57eRGYpxvC7PKOri6HXZw==
X-Google-Smtp-Source: AGHT+IFfrAytYWDrtqmvvt0vj9r6BCWYzM3f2Zy62k1Yw1acXBgtzij9wDi4ObcP0N5l9sE5XD+k0A==
X-Received: by 2002:a17:903:22ce:b0:21f:805c:fd98 with SMTP id d9443c01a7336-21f805cfe1fmr153489455ad.21.1739266995450;
        Tue, 11 Feb 2025 01:43:15 -0800 (PST)
Received: from [10.84.150.121] ([203.208.167.153])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f36561397sm92761155ad.89.2025.02.11.01.43.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 01:43:15 -0800 (PST)
Message-ID: <4e298f68-36ff-496a-81d2-7124f792180d@bytedance.com>
Date: Tue, 11 Feb 2025 17:43:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] NULL pointer dereference on ARM (AT91SAM9G25) during
 compaction
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>
References: <CAM1KZSmZ2T_riHvay+7cKEFxoPgeVpHkVFTzVVEQ1BO0cLkHEQ@mail.gmail.com>
 <Z6oxUdrVBPd5ZTEu@shell.armlinux.org.uk>
 <5d50d714-197f-44c0-94e0-ff70ee51e866@bytedance.com>
 <34bcf011-b4ac-479c-92ce-852623e73039@redhat.com>
 <3f7babee-b232-4e6b-a896-947150dcd1ef@bytedance.com>
 <2b0bb476-5bd6-489a-9b9e-7aa20964abfa@redhat.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <2b0bb476-5bd6-489a-9b9e-7aa20964abfa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_094319_010216_CC3DA57D 
X-CRM114-Status: GOOD (  27.60  )
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
Cc: linux-arm-kernel@lists.infradead.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Ryan Roberts <ryan.roberts@arm.com>, open list <linux-kernel@vger.kernel.org>, Hugh Dickins <hughd@google.com>, Muchun Song <muchun.song@linux.dev>, Ezra Buehler <ezra@easyb.ch>, "Russell King \(Oracle\)" <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, Peter Xu <peterx@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Morton <akpm@linux-foundation.org>, "Mike Rapoport \(Microsoft\)" <rppt@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 2025/2/11 17:37, David Hildenbrand wrote:
> On 11.02.25 10:29, Qi Zheng wrote:
>>
>>
>> On 2025/2/11 17:14, David Hildenbrand wrote:
>>> On 11.02.25 04:45, Qi Zheng wrote:
>>>> Hi Russell,
>>>>
>>>> On 2025/2/11 01:03, Russell King (Oracle) wrote:
>>>>> On Mon, Feb 10, 2025 at 05:49:38PM +0100, Ezra Buehler wrote:
>>>>>> When running vanilla Linux 6.13 or newer (6.14-rc2) on the
>>>>>> AT91SAM9G25-based GARDENA smart Gateway, we are seeing a NULL pointer
>>>>>> dereference resulting in a kernel panic. The culprit seems to be 
>>>>>> commit
>>>>>> fc9c45b71f43 ("arm: adjust_pte() usepte_offset_map_rw_nolock()").
>>>>>> Reverting the commit apparently fixes the issue.
>>>>>
>>>>> The blamed commit is buggy:
>>>>>
>>>>> arch/arm/include/asm/tlbflush.h:
>>>>> #define update_mmu_cache(vma, addr, ptep) \
>>>>>            update_mmu_cache_range(NULL, vma, addr, ptep, 1)
>>>>>
>>>>> So vmf can be NULL. This didn't used to matter before this commit,
>>>>> because vmf was not used by ARM's update_mmu_cache_range(). However,
>>>>> the commit introduced a dereference of it, which now causes a NULL
>>>>> point dereference.
>>>>>
>>>>> Not sure what the correct solution is, but at a guess, both:
>>>>>
>>>>>      if (ptl != vmf->ptl)
>>>>>
>>>>> need to become:
>>>>>
>>>>>      if (!vmf || ptl != vmf->ptl)
>>>>
>>>> No, we can't do that, because without using split PTE locks, we would
>>>> use shared mm->page_table_lock, which would create a deadlock.
>>>
>>> Maybe we can simply special-case on CONFIG_SPLIT_PTE_PTLOCKS ?
>>>
>>> if (IS_ENABLED(CONFIG_SPLIT_PTE_PTLOCKS)) {
>>
>> In this case, if two vmas map the same PTE page, then the same PTE lock
>> will be held repeatedly. Right?
> 
> Hmm, the comment says:
> 
>          /*
>           * This is called while another page table is mapped, so we
>           * must use the nested version.  This also means we need to
>           * open-code the spin-locking.
>           */
> 
> "another page table" implies that it cannot be the same. But maybe that 
> comment was also wrong?

I don't see make_coherent() ensuring this when traversing vma. I
therefore propose the following changes:

diff --git a/arch/arm/mm/fault-armv.c b/arch/arm/mm/fault-armv.c
index 2bec87c3327d2..dddbca9a2597e 100644
--- a/arch/arm/mm/fault-armv.c
+++ b/arch/arm/mm/fault-armv.c
@@ -61,8 +61,41 @@ static int do_adjust_pte(struct vm_area_struct *vma, 
unsigned long address,
         return ret;
  }

+#if defined(CONFIG_SPLIT_PTE_PTLOCKS)
+/*
+ * If we are using split PTE locks, then we need to take the pte
+ * lock here.  Otherwise we are using shared mm->page_table_lock
+ * which is already locked, thus cannot take it.
+ */
+static inline bool do_pte_lock(spinlock_t *ptl, pmd_t pmdval, pmd_t *pmd)
+{
+       /*
+        * Use nested version here to indicate that we are already
+        * holding one similar spinlock.
+        */
+       spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
+       if (unlikely(!pmd_same(pmdval, pmdp_get_lockless(pmd)))) {
+               spin_unlock(ptl);
+               return false;
+       }
+
+       return true;
+}
+
+static inline void do_pte_unlock(spinlock_t *ptl)
+{
+       spin_unlock(ptl);
+}
+#else /* !defined(CONFIG_SPLIT_PTE_PTLOCKS) */
+static inline bool do_pte_lock(spinlock_t *ptl)
+{
+       return true;
+}
+static inline void do_pte_unlock(spinlock_t *ptl) {}
+#endif /* defined(CONFIG_SPLIT_PTE_PTLOCKS) */
+
  static int adjust_pte(struct vm_area_struct *vma, unsigned long address,
-                     unsigned long pfn, struct vm_fault *vmf)
+                     unsigned long pfn)
  {
         spinlock_t *ptl;
         pgd_t *pgd;
@@ -99,23 +132,14 @@ static int adjust_pte(struct vm_area_struct *vma, 
unsigned long address,
         if (!pte)
                 return 0;

-       /*
-        * If we are using split PTE locks, then we need to take the page
-        * lock here.  Otherwise we are using shared mm->page_table_lock
-        * which is already locked, thus cannot take it.
-        */
-       if (ptl != vmf->ptl) {
-               spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
-               if (unlikely(!pmd_same(pmdval, pmdp_get_lockless(pmd)))) {
-                       pte_unmap_unlock(pte, ptl);
-                       goto again;
-               }
+       if (!do_pte_lock(ptl, pmdval, pmd)) {
+               pte_unmap(pte);
+               goto again;
         }

         ret = do_adjust_pte(vma, address, pfn, pte);

-       if (ptl != vmf->ptl)
-               spin_unlock(ptl);
+       do_pte_unlock(ptl);
         pte_unmap(pte);

         return ret;
@@ -123,16 +147,17 @@ static int adjust_pte(struct vm_area_struct *vma, 
unsigned long address,

  static void
  make_coherent(struct address_space *mapping, struct vm_area_struct *vma,
-             unsigned long addr, pte_t *ptep, unsigned long pfn,
-             struct vm_fault *vmf)
+             unsigned long addr, pte_t *ptep, unsigned long pfn)
  {
         struct mm_struct *mm = vma->vm_mm;
         struct vm_area_struct *mpnt;
         unsigned long offset;
+       unsigned long start;
         pgoff_t pgoff;
         int aliases = 0;

         pgoff = vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT);
+       start = ALIGN_DOWN(addr, PMD_SIZE);

         /*
          * If we have any shared mappings that are in the same mm
@@ -141,6 +166,8 @@ make_coherent(struct address_space *mapping, struct 
vm_area_struct *vma,
          */
         flush_dcache_mmap_lock(mapping);
         vma_interval_tree_foreach(mpnt, &mapping->i_mmap, pgoff, pgoff) {
+               unsigned long mpnt_addr;
+
                 /*
                  * If this VMA is not in our MM, we can ignore it.
                  * Note that we intentionally mask out the VMA
@@ -151,7 +178,14 @@ make_coherent(struct address_space *mapping, struct 
vm_area_struct *vma,
                 if (!(mpnt->vm_flags & VM_MAYSHARE))
                         continue;
                 offset = (pgoff - mpnt->vm_pgoff) << PAGE_SHIFT;
-               aliases += adjust_pte(mpnt, mpnt->vm_start + offset, 
pfn, vmf);
+               mpnt_addr = mpnt->vm_start + offset;
+               /*
+                * If mpnt_addr and addr are mapped to the same PTE page,
+                * also skip this vma.
+                */
+               if (mpnt_addr >= start && mpnt_addr - start < PMD_SIZE)
+                       continue;
+               aliases += adjust_pte(mpnt, mpnt_addr, pfn);
         }
         flush_dcache_mmap_unlock(mapping);
         if (aliases)
@@ -194,7 +228,7 @@ void update_mmu_cache_range(struct vm_fault *vmf, 
struct vm_area_struct *vma,
                 __flush_dcache_folio(mapping, folio);
         if (mapping) {
                 if (cache_is_vivt())
-                       make_coherent(mapping, vma, addr, ptep, pfn, vmf);
+                       make_coherent(mapping, vma, addr, ptep, pfn);
                 else if (vma->vm_flags & VM_EXEC)
                         __flush_icache_all();
         }

Make sense?

> 
> 

