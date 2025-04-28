Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5DAC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 13:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KZ+hZvgWgCjquAZ+ZBwl2/vkMD/4TTPsFc7p906D4JU=; b=oH4V+VAW7P1WYkLFPv4EcC4SwV
	YNtXVcgmOGQHgcnUhntCiy38mWHSJJ6Y/BSTj7xlzF+1//gSP1+9E1HB6+BMRG7rN0nBgQunUVUxX
	rI+BVAr8q4bsqoA5bjkqT11+L+ZLP2USLc45YdcmRwdIw/US0Vlw7iw707ZzKjt89wNEhLxUPAMoP
	O675bLJUS3wMD+LZzo+MEwOOjrsFnv0iSOu7CR5wGECPIxZrgIZTzlfCTATbIByIUYloI49WlpIxd
	GAp4UdhviVm9uJQpc5Ojj+YtkCHsol5OU7wm1JCWPS/pfJC5mGPDCG+dpYk0rT0g65Bdq4uTBh9wG
	MOqnLKtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ORp-00000006SE5-3xi3;
	Mon, 28 Apr 2025 13:23:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Ny0-00000006Gtl-0MnZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 12:52:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E44D01516;
	Mon, 28 Apr 2025 05:52:04 -0700 (PDT)
Received: from [10.163.78.210] (unknown [10.163.78.210])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 680863F673;
	Mon, 28 Apr 2025 05:52:03 -0700 (PDT)
Message-ID: <72b0be04-73d5-49e3-8e35-c8999e37fd58@arm.com>
Date: Mon, 28 Apr 2025 18:22:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Optimize mprotect for large folios
To: akpm@linux-foundation.org
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
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250428120414.12101-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_055212_164559_D185FD09 
X-CRM114-Status: GOOD (  12.17  )
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



On 28/04/25 5:34 pm, Dev Jain wrote:
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

Messed up the denominator, I mean ((7.9 - 2.1) / 7.9) * 100 = 73%.

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


