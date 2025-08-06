Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86EEC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 10:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qh2edeS0ZaNzvwBPknu4B1s/vixn92FnvJSgkjVQa5Q=; b=GOnlEMUPCNdKasJdSyQ4pN1+9v
	d40w7qJ0rYYEyUFYLXdkrkjNrweaPtRhyAZMUZBA0D5fRvD4X3uELl/oS6974AZH4tPTfKK5jzzub
	yF/5HKuzJpkifXKOf62yXNSDiwJxCHbwsBZ2eY8wcES/hZc6i/i7Onhk1ENL76a26mZSL+7+DSdv6
	h6tzaQrX7+U6JhbCW1hzvlDQgva5C6fJkCcODbmQx5OBeG5KZ/P1iaILeqlWy0i1f0iURl5mSyW0e
	1eAexNsgPvMrkFz3NPpb8assYQrNovB5+QeLzh9ZoxM9ctlNZtX6c7o8h6ecmoCJxSN0Nk4a3foAB
	zT/LyPmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujbA0-0000000Ermh-2cm2;
	Wed, 06 Aug 2025 10:14:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujb7V-0000000ErX7-1RRX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 10:11:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754475099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qh2edeS0ZaNzvwBPknu4B1s/vixn92FnvJSgkjVQa5Q=;
	b=ctjYqBdlsY4Suv9th8QI8wRibkVHahxyio8I8cICxD9ThXqBBossLkStKS5P4+e7bCyojR
	lRp670cba5gXfTBhpFkIo58YWKOJOQKtNFkDKJXjBqyhgBsH4F2SZAv0V5ZC710brfs77G
	7FTjZu8ZYo5Wv3spWN6XVCq+Rw8YVcA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-IszuwhjAP1-3VkJtiS4prA-1; Wed, 06 Aug 2025 06:11:38 -0400
X-MC-Unique: IszuwhjAP1-3VkJtiS4prA-1
X-Mimecast-MFC-AGG-ID: IszuwhjAP1-3VkJtiS4prA_1754475097
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-459de8f00cfso10318155e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 03:11:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754475097; x=1755079897;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qh2edeS0ZaNzvwBPknu4B1s/vixn92FnvJSgkjVQa5Q=;
        b=NtilIXnQBROYWxgyDOisPebLf2jLuXVSRcytoFtqAGzH9v7TISD8Wgu58FwS4tvTiH
         Kd9MKFALrKVtN9FRXtXJyndGeCR6QHljlaDzK2VLMQOVRayvBJ8aTzTh9jfMOF4zqprr
         ZIQwRdHdqQlCnlicXLO3lbolg46X1ApcGJ1LzyHCr/wvpW9qHbeVWIbrBaX6LTGlXZF8
         m+le036Gk9JJSbgPo2FgGEfuCQl5mI2+EmSmsM9cn6OjgKTZcq8eGG9E0JM5QUnsURKK
         Rh5IGU1UTxCPhonl4aMzR9kT7O/Ost57+ZcKwe2WdRkB/I0dGNs9a3QqJcayFKd22n4J
         tfoA==
X-Forwarded-Encrypted: i=1; AJvYcCVlGD8/tXXByuLAMHohjpdeKkV2g5FvuQlmosO/syoZ4wCfmQKGeLe1eP7Mg2F8zvzeMG2szE5+7UqaUEJXbP8C@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/8qJP1P+EzXNEcO83d8d8fNxXqdaIf5c/h4Is3XvwOfsK486S
	KkVbBll8nxHRYKW9cgb0XzmxV0kCAdI7Ib4gCXy/sahNiE9vTK6YzMThUDacxbo+iX8FRR//xbP
	cESknN7iDWPA74e4WDSpTnjL0R5Gi3Z2WE9hPoIdPgtQdKwfQUEz52p1F6xFa5gES7lZ5gB8Q5L
	oo
X-Gm-Gg: ASbGncv9IlCeTuCwTiScm6naFd1cX/NalXxkTi0hMV6EAEH9HH1oB/fie67mroCalo+
	q0RMpCNTd3lmCpI+2/cEpuNZ438xQ4RiXSH4qUnGedpQVLxXKyRoHt4RjEgeoBqK6a0g3LopJk0
	lGY3Mn00Y2dvfdhDDAkGO340ieLvw3VXqQJFUb7uYebUMHw3mxZ9s+zkbwtuaWOTzc7aCYwWP8U
	lRu/X+tg67MgkICFh5gLbHiJlEnm/eNzTqJzoZx39zuNqL0bYzZT04kAipSbM3UGQR6P3iTlfQZ
	83XI9osx8SZ4ZR7DLlkjoiSWg3NHXlV1V3k0oHAbV1rZfPeCQRcIkfvinL/8aOFobtyCrX3hltn
	zL5VU1f6MD8mtiwbuvn/gszLXDsGi8vk9FqhnSxwmRtXw3DQ9G58uZt0ieA1JBOrBUqI=
X-Received: by 2002:a05:600c:4ecd:b0:458:a850:f857 with SMTP id 5b1f17b1804b1-459e711e5f5mr22019465e9.31.1754475096637;
        Wed, 06 Aug 2025 03:11:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECB8a+B/TWDtQecrYAbY89V39jfBkap9mCeJXvk++JnuEAN8c3eY64Hf3618Dec9c0Z5BLKw==
X-Received: by 2002:a05:600c:4ecd:b0:458:a850:f857 with SMTP id 5b1f17b1804b1-459e711e5f5mr22018795e9.31.1754475096051;
        Wed, 06 Aug 2025 03:11:36 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f35:8a00:42f7:2657:34cc:a51f? (p200300d82f358a0042f7265734cca51f.dip0.t-ipconnect.de. [2003:d8:2f35:8a00:42f7:2657:34cc:a51f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c4a2187sm23345507f8f.70.2025.08.06.03.11.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 03:11:35 -0700 (PDT)
Message-ID: <e3d13396-8408-49c0-9ec9-1b02790959aa@redhat.com>
Date: Wed, 6 Aug 2025 12:11:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] mm: Optimize mprotect() by PTE batching
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, willy@infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
 anshuman.khandual@arm.com, peterx@redhat.com, joey.gouly@arm.com,
 ioworker0@gmail.com, baohua@kernel.org, kevin.brodsky@arm.com,
 quic_zhenhuah@quicinc.com, christophe.leroy@csgroup.eu,
 yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
 hughd@google.com, yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250718090244.21092-1-dev.jain@arm.com>
 <20250718090244.21092-7-dev.jain@arm.com>
 <7567c594-7588-49e0-8b09-2a591181b24d@redhat.com>
 <9552ddff-d778-4934-9349-37c7237cbb78@lucifer.local>
 <54ee1971-d91a-4fe6-90b8-16212c8568d1@redhat.com>
 <0d52d680-f3d3-454f-8c12-602f650469ab@arm.com>
 <9cbe9c6a-0013-4239-9347-bf5d43021fe3@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <9cbe9c6a-0013-4239-9347-bf5d43021fe3@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: e-1QS4tMnv2Sy8oyJFP8VfsBA_XvCtgfJ0IC3mRIZG4_1754475097
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_031141_450289_06F8B715 
X-CRM114-Status: GOOD (  22.34  )
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

On 06.08.25 11:50, Lorenzo Stoakes wrote:
> On Wed, Aug 06, 2025 at 03:07:49PM +0530, Dev Jain wrote:
>>>>
>>>> You mean in _this_ PTE of the batch right? As we're invoking these
>>>> on each part
>>>> of the PTE table.
>>>>
>>>> I mean I guess we can simply do:
>>>>
>>>>      struct page *first_page = pte_page(ptent);
>>>>
>>>> Right?
>>>
>>> Yes, but we should forward the result from vm_normal_page(), which does
>>> exactly that for you, and increment the page accordingly as required,
>>> just like with the pte we are processing.
>>
>> Makes sense, so I guess I will have to change the signature of
>> prot_numa_skip()
>>
>> to pass a double ptr to a page instead of folio and derive the folio in the
>> caller,
>>
>> and pass down both the folio and the page to
>> set_write_prot_commit_flush_ptes.
> 
> I already don't love how we psas the folio back from there for very dubious
> benefit. I really hate the idea of having a struct **page parameter...
> 
> I wonder if we should just have a quick fixup for hotfix, and refine this more
> later?

This is not an issue in any released kernel, so we can do this properly.

We should just remove that nested vm_normal_folio().

Untested, but should give an idea what we can do.


diff --git a/mm/mprotect.c b/mm/mprotect.c
index 78bded7acf795..4e0a22f7db495 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -120,7 +120,7 @@ static int mprotect_folio_pte_batch(struct folio *folio, pte_t *ptep,
  
  static bool prot_numa_skip(struct vm_area_struct *vma, unsigned long addr,
  			   pte_t oldpte, pte_t *pte, int target_node,
-			   struct folio **foliop)
+			   struct folio *folio)
  {
  	struct folio *folio = NULL;
  	bool ret = true;
@@ -131,7 +131,6 @@ static bool prot_numa_skip(struct vm_area_struct *vma, unsigned long addr,
  	if (pte_protnone(oldpte))
  		goto skip;
  
-	folio = vm_normal_folio(vma, addr, oldpte);
  	if (!folio)
  		goto skip;
  
@@ -172,8 +171,6 @@ static bool prot_numa_skip(struct vm_area_struct *vma, unsigned long addr,
  	if (folio_use_access_time(folio))
  		folio_xchg_access_time(folio, jiffies_to_msecs(jiffies));
  
-skip:
-	*foliop = folio;
  	return ret;
  }
  
@@ -231,10 +228,9 @@ static int page_anon_exclusive_sub_batch(int start_idx, int max_len,
   * retrieve sub-batches.
   */
  static void commit_anon_folio_batch(struct vm_area_struct *vma,
-		struct folio *folio, unsigned long addr, pte_t *ptep,
+		struct folio *folio, struct page *first_page, unsigned long addr, pte_t *ptep,
  		pte_t oldpte, pte_t ptent, int nr_ptes, struct mmu_gather *tlb)
  {
-	struct page *first_page = folio_page(folio, 0);
  	bool expected_anon_exclusive;
  	int sub_batch_idx = 0;
  	int len;
@@ -243,7 +239,7 @@ static void commit_anon_folio_batch(struct vm_area_struct *vma,
  		expected_anon_exclusive = PageAnonExclusive(first_page + sub_batch_idx);
  		len = page_anon_exclusive_sub_batch(sub_batch_idx, nr_ptes,
  					first_page, expected_anon_exclusive);
-		prot_commit_flush_ptes(vma, addr, ptep, oldpte, ptent, len,
+		prot_commit_flush_ptes(vma, addr, ptep, page, oldpte, ptent, len,
  				       sub_batch_idx, expected_anon_exclusive, tlb);
  		sub_batch_idx += len;
  		nr_ptes -= len;
@@ -251,7 +247,7 @@ static void commit_anon_folio_batch(struct vm_area_struct *vma,
  }
  
  static void set_write_prot_commit_flush_ptes(struct vm_area_struct *vma,
-		struct folio *folio, unsigned long addr, pte_t *ptep,
+		struct folio *folio, struct page *page, unsigned long addr, pte_t *ptep,
  		pte_t oldpte, pte_t ptent, int nr_ptes, struct mmu_gather *tlb)
  {
  	bool set_write;
@@ -270,7 +266,7 @@ static void set_write_prot_commit_flush_ptes(struct vm_area_struct *vma,
  				       /* idx = */ 0, set_write, tlb);
  		return;
  	}
-	commit_anon_folio_batch(vma, folio, addr, ptep, oldpte, ptent, nr_ptes, tlb);
+	commit_anon_folio_batch(vma, folio, page, addr, ptep, oldpte, ptent, nr_ptes, tlb);
  }
  
  static long change_pte_range(struct mmu_gather *tlb,
@@ -305,15 +301,20 @@ static long change_pte_range(struct mmu_gather *tlb,
  			const fpb_t flags = FPB_RESPECT_SOFT_DIRTY | FPB_RESPECT_WRITE;
  			int max_nr_ptes = (end - addr) >> PAGE_SHIFT;
  			struct folio *folio = NULL;
+			struct page *page;
  			pte_t ptent;
  
+			page = vm_normal_folio(vma, addr, oldpte);
+			if (page)
+				folio = page_folio(page);
+
  			/*
  			 * Avoid trapping faults against the zero or KSM
  			 * pages. See similar comment in change_huge_pmd.
  			 */
  			if (prot_numa) {
  				int ret = prot_numa_skip(vma, addr, oldpte, pte,
-							 target_node, &folio);
+							 target_node, folio);
  				if (ret) {
  
  					/* determine batch to skip */
@@ -323,9 +324,6 @@ static long change_pte_range(struct mmu_gather *tlb,
  				}
  			}
  
-			if (!folio)
-				folio = vm_normal_folio(vma, addr, oldpte);
-
  			nr_ptes = mprotect_folio_pte_batch(folio, pte, oldpte, max_nr_ptes, flags);
  
  			oldpte = modify_prot_start_ptes(vma, addr, pte, nr_ptes);
@@ -351,7 +349,7 @@ static long change_pte_range(struct mmu_gather *tlb,
  			 */
  			if ((cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
  			     !pte_write(ptent))
-				set_write_prot_commit_flush_ptes(vma, folio,
+				set_write_prot_commit_flush_ptes(vma, folio, page,
  				addr, pte, oldpte, ptent, nr_ptes, tlb);
  			else
  				prot_commit_flush_ptes(vma, addr, pte, oldpte, ptent,
-- 
2.50.1


-- 
Cheers,

David / dhildenb


