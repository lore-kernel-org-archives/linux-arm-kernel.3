Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408ADCA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 08:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vudjbGjiy1hJU/K3fzzlHHbpdoQXTBqyD6F+qv1tj/o=; b=mhOHV91kZ0RwygD9THrD4tHeVd
	A7zSFpzjKG0FytAHcHBsKVN/efu47FXI7iVBZGYGMK0tdNCbIZC3Ns1u4qC9xKTiSX5n/fuSjlXUR
	pm0tImF56joYO9QoRyhyImYQaWS2lWhfhYbV+4u5qAaDN9EqvhTkHn2LLyaClHwE0dk+ZmN1OTXHc
	gZ0zGZRRh5D8I5uvW8GAKRLl3RbY/okA4lUPSUOViCrPrwEfnLLXNp7WldaDn+3WvTwFImVCwthMK
	+dnam/VQSmM8gJ12LTic+xfPq30QtO+IomsZYJVg3Bnl3I5k5dd2HyVJ+la8E7vaZnHdF9BHc9qiq
	AH2HFrnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uszxX-0000000BaHt-0HFs;
	Mon, 01 Sep 2025 08:32:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uszW4-0000000BWc6-0Cir
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 08:03:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 301431A25;
	Mon,  1 Sep 2025 01:03:41 -0700 (PDT)
Received: from [10.57.92.127] (unknown [10.57.92.127])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D2293F694;
	Mon,  1 Sep 2025 01:03:47 -0700 (PDT)
Message-ID: <dd242f5b-8bbe-48e8-8d5f-be6a835a8841@arm.com>
Date: Mon, 1 Sep 2025 09:03:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/6] arm64: support FEAT_BBM level 2 and large block
 mapping when rodata=full
To: Dev Jain <dev.jain@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Yang Shi <yang@os.amperecomputing.com>, Ard Biesheuvel <ardb@kernel.org>,
 scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20250829115250.2395585-1-ryan.roberts@arm.com>
 <e722e49a-d982-4b58-98f7-6fef3d0a4468@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
Content-Language: en-GB
In-Reply-To: <e722e49a-d982-4b58-98f7-6fef3d0a4468@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_010352_172608_8257ECB5 
X-CRM114-Status: GOOD (  21.14  )
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

On 01/09/2025 06:04, Dev Jain wrote:
> 
> On 29/08/25 5:22 pm, Ryan Roberts wrote:
>> Hi All,
>>
>> This is a new version following on from the v6 RFC at [1] which itself is based
>> on Yang Shi's work. On systems with BBML2_NOABORT support, it causes the linear
>> map to be mapped with large blocks, even when rodata=full, and leads to some
>> nice performance improvements.
>>
>> I've tested this on an AmpereOne system (a VM with 12G RAM) in all 3 possible
>> modes by hacking the BBML2 feature detection code:
>>
>>    - mode 1: All CPUs support BBML2 so the linear map uses large mappings
>>    - mode 2: Boot CPU does not support BBML2 so linear map uses pte mappings
>>    - mode 3: Boot CPU supports BBML2 but secondaries do not so linear map
>>      initially uses large mappings but is then repainted to use pte mappings
>>
>> In all cases, mm selftests run and no regressions are observed. In all cases,
>> ptdump of linear map is as expected:
>>
>> Mode 1:
>> =======
>> ---[ Linear Mapping start ]---
>> 0xffff000000000000-0xffff000000200000           2M PMD       RW NX SHD
>> AF        BLK UXN    MEM/NORMAL-TAGGED
>> 0xffff000000200000-0xffff000000210000          64K PTE       RW NX SHD AF   
>> CON     UXN    MEM/NORMAL-TAGGED
>> 0xffff000000210000-0xffff000000400000        1984K PTE       ro NX SHD
>> AF            UXN    MEM/NORMAL
>> 0xffff000000400000-0xffff000002400000          32M PMD       ro NX SHD
>> AF        BLK UXN    MEM/NORMAL
>> 0xffff000002400000-0xffff000002550000        1344K PTE       ro NX SHD
>> AF            UXN    MEM/NORMAL
>> 0xffff000002550000-0xffff000002600000         704K PTE       RW NX SHD AF   
>> CON     UXN    MEM/NORMAL-TAGGED
>> 0xffff000002600000-0xffff000004000000          26M PMD       RW NX SHD
>> AF        BLK UXN    MEM/NORMAL-TAGGED
>> 0xffff000004000000-0xffff000040000000         960M PMD       RW NX SHD AF   
>> CON BLK UXN    MEM/NORMAL-TAGGED
>> 0xffff000040000000-0xffff000140000000           4G PUD       RW NX SHD
>> AF        BLK UXN    MEM/NORMAL-TAGGED
>> 0xffff000140000000-0xffff000142000000          32M PMD       RW NX SHD AF   
>> CON BLK UXN    MEM/NORMAL-TAGGED
>> 0xffff000142000000-0xffff000142120000        1152K PTE       RW NX SHD AF   
>> CON     UXN    MEM/NORMAL-TAGGED
>> 0xffff000142120000-0xffff000142128000          32K PTE       RW NX SHD
>> AF            UXN    MEM/NORMAL-TAGGED
>> 0xffff000142128000-0xffff000142159000         196K PTE       ro NX SHD
>> AF            UXN    MEM/NORMAL-TAGGED
>> 0xffff000142159000-0xffff000142160000          28K PTE       RW NX SHD
>> AF            UXN    MEM/NORMAL-TAGGED
>> 0xffff000142160000-0xffff000142240000         896K PTE       RW NX SHD AF   
>> CON     UXN    MEM/NORMAL-TAGGED
>> 0xffff000142240000-0xffff00014224e000          56K PTE       RW NX SHD
>> AF            UXN    MEM/NORMAL-TAGGED
>> 0xffff00014224e000-0xffff000142250000           8K PTE       ro NX SHD
>> AF            UXN    MEM/NORMAL-TAGGED
>> 0xffff000142250000-0xffff000142260000          64K PTE       RW NX SHD
>> AF            UXN    MEM/NORMAL-TAGGED
>> 0xffff000142260000-0xffff000142280000         128K PTE       RW NX SHD AF   
>> CON     UXN    MEM/NORMAL-TAGGED
>> 0xffff000142280000-0xffff000142288000          32K PTE       RW NX SHD
>> AF            UXN    MEM/NORMAL-TAGGED
>> 0xffff000142288000-0xffff000142290000          32K PTE       ro NX SHD
>> AF            UXN    MEM/NORMAL-TAGGED
>> 0xffff000142290000-0xffff0001422a0000          64K PTE       RW NX SHD
>> AF            UXN    MEM/NORMAL-TAGGED
>> 0xffff0001422a0000-0xffff000142465000        1812K PTE       ro NX SHD
>> AF            UXN    MEM/NORMAL-TAGGED
>> 0xffff000142465000-0xffff000142470000          44K PTE       RW NX SHD
>> AF            UXN    MEM/NORMAL-TAGGED
>> 0xffff000142470000-0xffff000142600000        1600K PTE       RW NX SHD AF   
>> CON     UXN    MEM/NORMAL-TAGGED
>> 0xffff000142600000-0xffff000144000000          26M PMD       RW NX SHD
>> AF        BLK UXN    MEM/NORMAL-TAGGED
>> 0xffff000144000000-0xffff000180000000         960M PMD       RW NX SHD AF   
>> CON BLK UXN    MEM/NORMAL-TAGGED
>> 0xffff000180000000-0xffff000181a00000          26M PMD       RW NX SHD
>> AF        BLK UXN    MEM/NORMAL-TAGGED
>> 0xffff000181a00000-0xffff000181b90000        1600K PTE       RW NX SHD AF   
>> CON     UXN    MEM/NORMAL-TAGGED
>> 0xffff000181b90000-0xffff000181b9d000          52K PTE       RW NX SHD
>> AF            UXN    MEM/NORMAL-TAGGED
>> 0xffff000181b9d000-0xffff000181c80000         908K PTE       ro NX SHD
>> AF            UXN    MEM/NORMAL-TAGGED
>> 0xffff000181c80000-0xffff000181c90000          64K PTE       RW NX SHD
>> AF            UXN    MEM/NORMAL-TAGGED
>> 0xffff000181c90000-0xffff000181ca0000          64K PTE       RW NX SHD AF   
>> CON     UXN    MEM/NORMAL-TAGGED
>> 0xffff000181ca0000-0xffff000181dbd000        1140K PTE       ro NX SHD
>> AF            UXN    MEM/NORMAL-TAGGED
>> 0xffff000181dbd000-0xffff000181dc0000          12K PTE       RW NX SHD
>> AF            UXN    MEM/NORMAL-TAGGED
>> 0xffff000181dc0000-0xffff000181e00000         256K PTE       RW NX SHD AF   
>> CON     UXN    MEM/NORMAL-TAGGED
>> 0xffff000181e00000-0xffff000182000000           2M PMD       RW NX SHD
>> AF        BLK UXN    MEM/NORMAL-TAGGED
>> 0xffff000182000000-0xffff0001c0000000         992M PMD       RW NX SHD AF   
>> CON BLK UXN    MEM/NORMAL-TAGGED
>> 0xffff0001c0000000-0xffff000300000000           5G PUD       RW NX SHD
>> AF        BLK UXN    MEM/NORMAL-TAGGED
>> 0xffff000300000000-0xffff008000000000         500G PUD
>> 0xffff008000000000-0xffff800000000000      130560G PGD
>> ---[ Linear Mapping end ]---
>>
>> Mode 3:
>> =======
>> ---[ Linear Mapping start ]---
>> 0xffff000000000000-0xffff000000210000        2112K PTE       RW NX SHD
>> AF            UXN    MEM/NORMAL-TAGGED
>> 0xffff000000210000-0xffff000000400000        1984K PTE       ro NX SHD
>> AF            UXN    MEM/NORMAL
>> 0xffff000000400000-0xffff000002400000          32M PMD       ro NX SHD
>> AF        BLK UXN    MEM/NORMAL
>> 0xffff000002400000-0xffff000002550000        1344K PTE       ro NX SHD
>> AF            UXN    MEM/NORMAL
>> 0xffff000002550000-0xffff000143a61000     5264452K PTE       RW NX SHD
>> AF            UXN    MEM/NORMAL-TAGGED
>> 0xffff000143a61000-0xffff000143c61000           2M PTE       ro NX SHD
>> AF            UXN    MEM/NORMAL-TAGGED
>> 0xffff000143c61000-0xffff000181b9a000     1015012K PTE       RW NX SHD
>> AF            UXN    MEM/NORMAL-TAGGED
>> 0xffff000181b9a000-0xffff000181d9a000           2M PTE       ro NX SHD
>> AF            UXN    MEM/NORMAL-TAGGED
>> 0xffff000181d9a000-0xffff000300000000     6261144K PTE       RW NX SHD
>> AF            UXN    MEM/NORMAL-TAGGED
>> 0xffff000300000000-0xffff008000000000         500G PUD
>> 0xffff008000000000-0xffff800000000000      130560G PGD
>> ---[ Linear Mapping end ]---
>>
>>
>> Performance Testing
>> ===================
>>
>> Yang Shi has gathered some compelling results which are detailed in the commit
>> log for patch #3. Additionally I have run this through a random selection of
>> benchmarks on AmpereOne. None show any regressions, and various benchmarks show
>> statistically significant improvement. I'm just showing those improvements here:
>>
>> +----------------------
>> +----------------------------------------------------------
>> +-------------------------+
>> | Benchmark            | Result
>> Class                                             | Improvement vs 6.17-rc1 |
>> +======================+==========================================================+=========================+
>> | micromm/vmalloc      | full_fit_alloc_test: p:1, h:0, l:500000
>> (usec)           |              (I) -9.00% |
>> |                      | kvfree_rcu_1_arg_vmalloc_test: p:1, h:0, l:500000
>> (usec) |              (I) -6.93% |
>> |                      | kvfree_rcu_2_arg_vmalloc_test: p:1, h:0, l:500000
>> (usec) |              (I) -6.77% |
>> |                      | pcpu_alloc_test: p:1, h:0, l:500000
>> (usec)               |              (I) -4.63% |
>> +----------------------
>> +----------------------------------------------------------
>> +-------------------------+
>> | mmtests/hackbench    | process-sockets-30
>> (seconds)                             |              (I) -2.96% |
>> +----------------------
>> +----------------------------------------------------------
>> +-------------------------+
>> | mmtests/kernbench    | syst-192
>> (seconds)                                       |             (I) -12.77% |
>> +----------------------
>> +----------------------------------------------------------
>> +-------------------------+
>> | pts/perl-benchmark   | Test: Interpreter
>> (Seconds)                              |              (I) -4.86% |
>> +----------------------
>> +----------------------------------------------------------
>> +-------------------------+
>> | pts/pgbench          | Scale: 1 Clients: 1 Read Write
>> (TPS)                     |               (I) 5.07% |
>> |                      | Scale: 1 Clients: 1 Read Write - Latency
>> (ms)            |              (I) -4.72% |
>> |                      | Scale: 100 Clients: 1000 Read Write
>> (TPS)                |               (I) 2.58% |
>> |                      | Scale: 100 Clients: 1000 Read Write - Latency
>> (ms)       |              (I) -2.52% |
>> +----------------------
>> +----------------------------------------------------------
>> +-------------------------+
>> | pts/sqlite-speedtest | Timed Time - Size 1,000
>> (Seconds)                        |              (I) -2.68% |
>> +----------------------
>> +----------------------------------------------------------
>> +-------------------------+
>>
>>
>> Changes since v6 [1]
>> ====================
>>
>> - Patch 1: Minor refactor to implement walk_kernel_page_table_range() in terms
>>    of walk_kernel_page_table_range_lockless(). Also lead to adding *pmd argument
>>    to the lockless variant for consistency (per Catalin).
>> - Misc function/variable renames to improve clarity and consistency.
>> - Share same syncrhonization flag between idmap_kpti_install_ng_mappings and
>>    wait_linear_map_split_to_ptes, which allows removal of bbml2_ptes[] to save
>>    ~20K from kernel image.
>> - Only take pgtable_split_lock and enter lazy mmu mode once for both splits.
>> - Only walk the pgtable once for the common "split single page" case.
>> - Bypass split to contpmd and contpte when spllitting linear map to ptes.
>>
>>
>> Applies on v6.17-rc3.
>>
>>
>> [1] https://lore.kernel.org/linux-arm-kernel/20250805081350.3854670-1-
>> ryan.roberts@arm.com/
>>
>> Thanks,
>> Ryan
>>
>> Dev Jain (1):
>>    arm64: Enable permission change on arm64 kernel block mappings
>>
>> Ryan Roberts (3):
>>    arm64: mm: Optimize split_kernel_leaf_mapping()
>>    arm64: mm: split linear mapping if BBML2 unsupported on secondary CPUs
>>    arm64: mm: Optimize linear_map_split_to_ptes()
>>
>> Yang Shi (2):
>>    arm64: cpufeature: add AmpereOne to BBML2 allow list
>>    arm64: mm: support large block mapping when rodata=full
>>
>>   arch/arm64/include/asm/cpufeature.h |   2 +
>>   arch/arm64/include/asm/mmu.h        |   3 +
>>   arch/arm64/include/asm/pgtable.h    |   5 +
>>   arch/arm64/kernel/cpufeature.c      |  12 +-
>>   arch/arm64/mm/mmu.c                 | 418 +++++++++++++++++++++++++++-
>>   arch/arm64/mm/pageattr.c            | 157 ++++++++---
>>   arch/arm64/mm/proc.S                |  27 +-
>>   include/linux/pagewalk.h            |   3 +
>>   mm/pagewalk.c                       |  36 ++-
>>   9 files changed, 599 insertions(+), 64 deletions(-)
>>
>> -- 
>> 2.43.0
>>
> 
> Hi Yang and Ryan,
> 
> I observe there are various callsites which will ultimately use
> update_range_prot() (from patch 1),
> that they do not check the return value. I am listing the ones I could find:

So your concern is that prior to patch #3 in this series, any error returned by
__change_memory_common() would be due to programming error only. But patch #3
introduces the possibility of dynamic error (-ENOMEM) due to the need to
allocate pgtable memory to split a mapping?

There is a WARN_ON_ONCE(ret) for the return code of split_kernel_leaf_mapping()
which will at least make the error visible, but I agree it's not a great solution.

> 
> set_memory_ro() in bpf_jit_comp.c

There is a set_memory_rw() for the same region of memory directly above this,
which will return -EFAULT on failure. If that one succeeded, then the pgtable
must already be appropriately split for set_memory_ro() so that should never
fail in practice. I agree with improving the robustness of the code by returning
-EFAULT (or just propagate the error?) as you suggest though.

> set_memory_valid() in kernel_map_pages() in pageattr.c

This is used by CONFIG_DEBUG_PAGEALLOC to make pages in the linear map invalid
while they are not in use to catch programming errors. So if making a page
invalid during freeing fails would not technically lead to a huge issue, it just
reduces our capability of catching an errant access to that free memory.

In principle, if we were able to make the memory invalid, we should therefore be
able to make it valid again, because the mappings should be sufficiently split
already. But that doesn't actually work, because we might be allocating a
smaller order than was freed so we might not have split at free-time to the
granularity is required at allocation-time.

But as you say, for CONFIG_DEBUG_PAGEALLOC we disable this whole path anyway, so
no issue here.

> set_direct_map_invalid_noflush() in vm_reset_perms() in vmalloc.c
> set_direct_map_default_noflush() in vm_reset_perms() in vmalloc.c, and in
> secretmem.c
> (the secretmem.c ones should be safe as explained in the commments therein)

Agreed for secretmem. vmalloc looks like a problem though...

If vmalloc was only setting the linear map back to default permissions, I guess
this wouldn't be an issue because we must have split the linear map sucessfully
when changing away from default permissions in the first place. But the fact
that it is unconditionally setting the linear map pages to invalid then back to
default causes issues; I guess even without the risk of -ENOMEM, this will cause
the linear map to be split to PTEs over time as vmalloc allocs and frees?

We probably need to think through how we can solve this. It's not clear to me
why vm_reset_perms wants to unconditionally transiently set to invalid?

> 
> The first one I think can be handled easily by returning -EFAULT.
> 
> For the second, we are already returning in case of !can_set_direct_map, which
> renders DEBUG_PAGEALLOC useless. So maybe it is
> safe to ignore the ret from set_memory_valid?
> 
> For the third, the call chain is a sequence of must-succeed void functions.
> Notably, when using vfree(), we may have to allocate a single
> pagetable page for splitting.
> 
> I am wondering whether we can just have a warn_on_once or something for the case
> when we fail to allocate a pagetable page. Or, Ryan had
> suggested in an off-the-list conversation that we can maintain a cache of PTE
> tables for every PMD block mapping, which will give us
> the same memory consumption as we do today, but not sure if this is worth it.
> x86 can already handle splitting but due to the callchains
> I have described above, it has the same problem, and the code has been working
> for years :)

I think it's preferable to avoid having to keep a cache of pgtable memory if we
can...

Thanks,
Ryan



