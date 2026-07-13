Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7AC1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 15:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z0qkF5e+IsQQ+xyny/lcvjpB8Rmv7gMJ/99iomJ8KKE=; b=RZqn38POFUM2MjTaWhYy5oBVdz
	mzbHyz79L8uEuixLHHME9F+L1XKzDlRtpaehea78Jp5bmLRBxrgYwHrwTS0gdkMag1SpBmPEYQVkQ
	ikXk88wFXBIfTzrYcr4URiQIAlqKZmNmr+eMBUPIDiHvxrus66Hn0PTrlZ6dQ0HAGKhaqNKzOAVoK
	iiYXbJLXtA99baWA13bk4rz1gYFYggfBF2e2Mg2oybLl6WWIIa293BfC+1xO5+PRUjKiLPAcBrqT0
	1PugvGzFPLf44s3FzU2dalvx8utm1KCGyNNJlP2zp0yNRuOaWhCWww4AUpF4QIYZ4ZgqifUAB4lz3
	OTzxh6bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjILX-00000009kzh-3DmZ;
	Mon, 13 Jul 2026 15:13:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjILW-00000009kz8-1ZRe
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jul 2026 15:13:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Z0qkF5e+IsQQ+xyny/lcvjpB8Rmv7gMJ/99iomJ8KKE=; b=rgnPlT5ochbIfBCalj+kK4pBYb
	hMokUmELVMbXAKVqZiIL91yhi682FMkYADwZszbcenAAR1y7NHJVdenBXvlIcDvWZaNdFdd1hrjxS
	5gp6cTjCvHgeTaN8oEPVrcq2tQS1FEuptF5Sjl2sFmph3pXATPDYRM3m9Y5QuLjxGLXopVAUnLeGc
	mDUO/kmmW2ywXyKG3BWCK4hQqPIKO+EMYXJ74Y2TH4no45lVofvsN1lDu1BSNMte/aoXO7TFNmlis
	B8eTGK8DLpLV7Mpkd31JyJ1q4UfLVhVC6zPMjElc5ExxTqAfnz2sGoFazWkAv7ccbul6H4fbvnZow
	yO5JP/ag==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjILS-0000000BlXI-0xe2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 15:13:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 569451576;
	Mon, 13 Jul 2026 08:13:16 -0700 (PDT)
Received: from [10.164.19.52] (unknown [10.164.19.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B8B5B3F93E;
	Mon, 13 Jul 2026 08:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783955600; bh=FxZLR9R+Tw/RTXShqH2JiucTcF7BYOfeeQ7iY565rBc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l18hC4xT/sUPl8dCaDqcr/Ljf4Uj9z5GidEBxYlDB+Za59H+9rQjYDbLJFszRBqYW
	 PxjxqhsMi5uQxLcE4Nl/DuuoVFXXxhLjquX1Os0uGlFuFAuY9NJJW5nS3LunIq6U9n
	 qnX+Oi/SN60p8p0hOGnN7SN2AjE0Cqe1N/bsuZak=
Message-ID: <54434a84-51b3-4e3f-988b-6bcbac5a2f42@arm.com>
Date: Mon, 13 Jul 2026 20:43:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/6] mm/vmalloc: Speed up ioremap, vmalloc and vmap
 with contiguous memory
To: Wen Jiang <jiangwenxiaomi@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: catalin.marinas@arm.com, linux-mm@kvack.org, urezki@gmail.com,
 will@kernel.org, Xueyuan.chen21@gmail.com, ajd@linux.ibm.com,
 anshuman.khandual@arm.com, david@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 rppt@kernel.org, ryan.roberts@arm.com, Wen Jiang <jiangwen6@xiaomi.com>
References: <20260709073823.6643-1-jiangwen6@xiaomi.com>
 <20260709160805.26e63bae89dd03cf2951104e@linux-foundation.org>
 <CAHKocdH5kp5kTtZht+v5j-4-Thh40TGvif3=kRMgErRXr+Q+RQ@mail.gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <CAHKocdH5kp5kTtZht+v5j-4-Thh40TGvif3=kRMgErRXr+Q+RQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_161322_618914_975EF345 
X-CRM114-Status: GOOD (  21.59  )
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



On 10/07/26 2:24 pm, Wen Jiang wrote:
> On Fri, 10 Jul 2026 at 07:08, Andrew Morton <akpm@linux-foundation.org> wrote:
>>
>> On Thu,  9 Jul 2026 15:38:17 +0800 Wen Jiang <jiangwenxiaomi@gmail.com> wrote:
>>
>>> This patchset accelerates ioremap, vmalloc, and vmap when the memory
>>> is physically fully or partially contiguous.
>>
>> Thanks, I added this to mm.git's mm-new branch for wider testing.
>>
>> AI review asked some questions, and some of them are new since the v5
>> series:
>>         https://sashiko.dev/#/patchset/20260709073823.6643-1-jiangwen6@xiaomi.com
> 
> Hi Andrew,
> 
> I've gone through the Sashiko findings:
> 
> - Patch 1 (find_num_contig): Over-interpretation. No new hugetlbfs hstate
>   is added. The extra sizes are only used by init_mm kernel mappings via.
> 
> - Patch 5/6 (NULL page): Invalid input. vmap() expects a fully populated
>     array of valid struct page pointers.

Correct, but vmap_pages_pte_range has !page and !pfn_valid checks.

I really hate those checks - if those checks have any remote possibility of
firing, then we already have a bug at

vm_map_ram -> vmap_pages_range -> vmap_pages_range_noflush -> kmsan_vmap_pages_range_noflush

because the last function dereferences the struct page pointers.

It is painful to do the page array sanity check deep into vmap - it implies
we simply cannot play with the page array before that.

But since vmap is an exported function, doing a sanity check for the page array
in the vmap code makes sense.

So how about the following:

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index afaa14ebf17bb..0c44bb7a45b5d 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -566,14 +566,6 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 			err = -EBUSY;
 			break;
 		}
-		if (WARN_ON(!page)) {
-			err = -ENOMEM;
-			break;
-		}
-		if (WARN_ON(!pfn_valid(page_to_pfn(page)))) {
-			err = -EINVAL;
-			break;
-		}

 		pfn = page_to_pfn(page);
 		size = vmap_set_ptes(pte, addr, end, pfn, prot, shift);
@@ -603,11 +595,6 @@ static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
 			struct page *page = pages[*nr];
 			phys_addr_t phys_addr;

-			if (WARN_ON(!page))
-				return -ENOMEM;
-			if (WARN_ON(!pfn_valid(page_to_pfn(page))))
-				return -EINVAL;
-
 			phys_addr = page_to_phys(page);

 			if (vmap_try_huge_pmd(pmd, addr, next, phys_addr, prot,
@@ -3663,6 +3650,19 @@ static struct vm_struct *vmap_get_aligned_vm_area(unsigned long size,
 	return __get_vm_area_node_aligned_caller(size, PAGE_SIZE, flags, caller);
 }

+static inline bool vmap_page_sanity_checks(struct page **pages, unsigned int count)
+{
+	for (int i = 0; i < count; ++i) {
+		if (WARN_ON(!pages[i]))
+			return true;
+
+		if (WARN_ON(!pfn_valid(page_to_pfn(pages[i]))))
+			return true;
+	}
+
+	return false;
+}
+
 /**
  * vmap - map an array of pages into virtually contiguous space
  * @pages: array of page pointers
@@ -3706,6 +3706,9 @@ void *vmap(struct page **pages, unsigned int count,
 	if (!area)
 		return NULL;

+	if (unlikely(vmap_page_sanity_checks(pages, count)))
+		return NULL;
+
 	addr = (unsigned long)area->addr;
 	if (vmap_pages_range_batched(addr, addr + size, pgprot_nx(prot),
 				pages) < 0) {



Reasoning for calling vmap_page_sanity_checks() before vmap_pages_range_batched,
and not at the start of vmap: I am worried that since vmap() is already very
fast, we may cause a regression:

vmap() -> scan page array with linear map pointers -> vmap_get_aligned_vm_area (does
memory allocation, throwing out the linear map VAs from cache and TLB) -> walk
the pgtables and again access cold page array.

Perhaps I am being very pedantic here. What do you think?

> 
> - Patch 6 (32-bit count << PAGE_SHIFT overflow): Pre-existing. This was
>     already discussed in the V3 thread, and a separate fix was proposed
>     there.
> 
> Thanks,
> Wen
> 


