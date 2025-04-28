Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF98C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 13:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1I1m/NMRedzmoEPaCinaZP4GnU/mr3udTbmFVWL9GKc=; b=L2argGxIYaR/YzdKAv3Tu/0u1l
	qgWFV33cOEYSknxkvWbogc0QPknWZAFYIX8yF7EjkrNnzk6VmDI2MBx/SdJF8/cWI1Dxjrq5FaeBB
	ZBiHjAl4ehGVQ832yl3MafYKfdLK343viyxcLDOK9P+ttbP4uy1zdAeWMw+CoSUXlPf+0Xwx4qARO
	dWO+cdkhc1G62c02qvnBS8icTzuf8Fg6fZBtxYT01bHFcRn2CgcW/LZcBhEGgoVJMqPlHlrNtxnYw
	Q1P6VeBo59DdpySDWhLx4CbKz8jP22ihdxggEICVDX4bQhBtt7Y+Nka3q03lvDl8zpTdeGM2hoeK9
	PZ0R3XvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Ouw-00000006Y3M-22Sf;
	Mon, 28 Apr 2025 13:53:06 +0000
Received: from out-180.mta0.migadu.com ([91.218.175.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Oai-00000006UdQ-3Z4z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 13:32:14 +0000
Message-ID: <2c70d515-f02e-477a-afc5-d3a25f6c9c0d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745847120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1I1m/NMRedzmoEPaCinaZP4GnU/mr3udTbmFVWL9GKc=;
	b=Lf9J4TLdsEL7qv8tRkyxqwiS2Mw9EzoicQ9mUKrPz/9krGq7uE4l+FoLo/dfhvmzEJc7fM
	QtCdib57F8JZyzFQz9LA46XNFAA9ff00znw8ix8cwaIvQEZ9a98oRTz79TZeqPNdii253h
	UhnJw+hpU0rcz3+blGmfL5Wg0DM6Tyg=
Date: Mon, 28 Apr 2025 21:31:40 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 0/7] Optimize mprotect for large folios
Content-Language: en-US
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, david@redhat.com, willy@infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com,
 vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
 peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
 baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, namit@vmware.com, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250428120414.12101-1-dev.jain@arm.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20250428120414.12101-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_063213_173589_C57E09D2 
X-CRM114-Status: GOOD (  15.31  )
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

I'm hitting the following compilation errors after applying this patch
series:

In file included from ./include/linux/kasan.h:37,
                  from ./include/linux/slab.h:260,
                  from ./include/linux/crypto.h:19,
                  from arch/x86/kernel/asm-offsets.c:9:
./include/linux/pgtable.h: In function ‘modify_prot_start_ptes’:
./include/linux/pgtable.h:905:15: error: implicit declaration of 
function ‘ptep_modify_prot_start’ [-Werror=implicit-function-declaration]
   905 |         pte = ptep_modify_prot_start(vma, addr, ptep);
       |               ^~~~~~~~~~~~~~~~~~~~~~
./include/linux/pgtable.h:905:15: error: incompatible types when 
assigning to type ‘pte_t’ from type ‘int’
./include/linux/pgtable.h:909:27: error: incompatible types when 
assigning to type ‘pte_t’ from type ‘int’
   909 |                 tmp_pte = ptep_modify_prot_start(vma, addr, ptep);
       |                           ^~~~~~~~~~~~~~~~~~~~~~
./include/linux/pgtable.h: In function ‘modify_prot_commit_ptes’:
./include/linux/pgtable.h:925:17: error: implicit declaration of 
function ‘ptep_modify_prot_commit’ [-Werror=implicit-function-declaration]
   925 |                 ptep_modify_prot_commit(vma, addr, ptep, 
old_pte, pte);
       |                 ^~~~~~~~~~~~~~~~~~~~~~~
./include/linux/pgtable.h: At top level:
./include/linux/pgtable.h:1360:21: error: conflicting types for 
‘ptep_modify_prot_start’; have ‘pte_t(struct vm_area_struct *, long 
unsigned int,  pte_t *)’
  1360 | static inline pte_t ptep_modify_prot_start(struct 
vm_area_struct *vma,
       |                     ^~~~~~~~~~~~~~~~~~~~~~
./include/linux/pgtable.h:905:15: note: previous implicit declaration of 
‘ptep_modify_prot_start’ with type ‘int()’
   905 |         pte = ptep_modify_prot_start(vma, addr, ptep);
       |               ^~~~~~~~~~~~~~~~~~~~~~
./include/linux/pgtable.h:1371:20: warning: conflicting types for 
‘ptep_modify_prot_commit’; have ‘void(struct vm_area_struct *, long 
unsigned int,  pte_t *, pte_t,  pte_t)’
  1371 | static inline void ptep_modify_prot_commit(struct 
vm_area_struct *vma,
       |                    ^~~~~~~~~~~~~~~~~~~~~~~
./include/linux/pgtable.h:1371:20: error: static declaration of 
‘ptep_modify_prot_commit’ follows non-static declaration
./include/linux/pgtable.h:925:17: note: previous implicit declaration of 
‘ptep_modify_prot_commit’ with type ‘void(struct vm_area_struct *, long 
unsigned int,  pte_t *, pte_t,  pte_t)’
   925 |                 ptep_modify_prot_commit(vma, addr, ptep, 
old_pte, pte);
       |                 ^~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[2]: *** [scripts/Makefile.build:98: arch/x86/kernel/asm-offsets.s] 
Error 1
make[1]: *** 
[/home/runner/work/mm-test-robot/mm-test-robot/linux/Makefile:1280: 
prepare0] Error 2
make: *** [Makefile:248: __sub-make] Error 2

Based on:

mm-unstable b18dec6a6ad3d051dadc3c16fb838e4abddf8d3c ("mm/numa: remove 
unnecessary local variable in alloc_node_data()")


Thanks,
Lance



On 2025/4/28 20:04, Dev Jain wrote:
> This patchset optimizes the mprotect() system call for large folios
> by PTE-batching.
> 
> We use the following test cases to measure performance, mprotect()'ing
> the mapped memory to read-only then read-write 40 times:
> 
> Test case 1: Mapping 1G of memory, touching it to get PMD-THPs, then
> pte-mapping those THPs
> Test case 2: Mapping 1G of memory with 64K mTHPs
> Test case 3: Mapping 1G of memory with 4K pages
> 
> Average execution time on arm64, Apple M3:
> Before the patchset:
> T1: 7.9 seconds   T2: 7.9 seconds   T3: 4.2 seconds
> 
> After the patchset:
> T1: 2.1 seconds   T2: 2.2 seconds   T3: 4.2 seconds
> 
> Observing T1/T2 and T3 before the patchset, we also remove the regression
> introduced by ptep_get() on a contpte block. And, for large folios we get
> an almost 276% performance improvement.
> 
> Dev Jain (7):
>    mm: Refactor code in mprotect
>    mm: Optimize mprotect() by batch-skipping PTEs
>    mm: Add batched versions of ptep_modify_prot_start/commit
>    arm64: Add batched version of ptep_modify_prot_start
>    arm64: Add batched version of ptep_modify_prot_commit
>    mm: Batch around can_change_pte_writable()
>    mm: Optimize mprotect() through PTE-batching
> 
>   arch/arm64/include/asm/pgtable.h |  10 ++
>   arch/arm64/mm/mmu.c              |  21 +++-
>   include/linux/mm.h               |   4 +-
>   include/linux/pgtable.h          |  42 ++++++++
>   mm/gup.c                         |   2 +-
>   mm/huge_memory.c                 |   4 +-
>   mm/memory.c                      |   6 +-
>   mm/mprotect.c                    | 163 +++++++++++++++++++++----------
>   mm/pgtable-generic.c             |  16 ++-
>   9 files changed, 198 insertions(+), 70 deletions(-)
> 


