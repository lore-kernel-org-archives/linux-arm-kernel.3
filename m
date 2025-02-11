Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A47C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 12:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Cc:References:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZW7ej7wACuX9LQfZQnm7QjGssLkzGcZB/hqxhr2dwP0=; b=B36hyuJC3BlkIKiuVNN93oLI96
	jMgwY0xeS4LS+Fj5iV2T14orXQvRNZA5rU0SHCYJxsHhPqUufJM+CINI5LrTPKJaEcBlqFJz0uEgd
	yX6LKXUCjCLYARuG1slwYgbVvdWRpy1MwLyUH6M/MbuhLsF01an7HhXygYgyvllgYO4gBbBvG8DoP
	sVeXxyM8vw0uMfWfSUg5F9DK8e+c2I1wvhnJYk57gip9tg/KC3daeoWms4EOoGmWEzIbqWLwxElNa
	G66fHA7UDpRlVyXVuMDK/x3TwTWPiRSd5AXI0NK3jBLBN8lDZxaxIdjqVlcr4ItlhbDHXq8CyPlXP
	0sLNCW7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thpYI-00000003o8I-0nCv;
	Tue, 11 Feb 2025 12:39:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thoZH-00000003ZmV-3iQS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 11:36:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDBC11424;
	Tue, 11 Feb 2025 03:37:04 -0800 (PST)
Received: from [10.57.81.93] (unknown [10.57.81.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD9443F5A1;
	Tue, 11 Feb 2025 03:36:41 -0800 (PST)
Message-ID: <7ca5e8a6-9f01-40c6-a46d-c717ae7ab3b1@arm.com>
Date: Tue, 11 Feb 2025 11:36:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 PATCH 0/2] arm64: support FEAT_BBM level 2 and large
 block mapping when rodata=full
Content-Language: en-GB
From: Ryan Roberts <ryan.roberts@arm.com>
To: Yang Shi <yang@os.amperecomputing.com>, catalin.marinas@arm.com,
 will@kernel.org
References: <20250103011822.1257189-1-yang@os.amperecomputing.com>
 <022c4799-bf0e-44d4-b657-d6af29a9a31d@arm.com>
Cc: cl@gentwo.org, scott@os.amperecomputing.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <022c4799-bf0e-44d4-b657-d6af29a9a31d@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_033644_015075_ED5F4C8C 
X-CRM114-Status: GOOD (  24.87  )
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

Sorry managed to send this to the list only. Resending with original recipients
added back in...


On 11/02/2025 11:34, Ryan Roberts wrote:
> Hi Yang,
> 
> Thanks for putting this together; I'm hoping to piggyback on this and use BBML2
> to reduce the cost of contpte_convert().
> 
> review incoming...
> 
> 
> On 03/01/2025 01:17, Yang Shi wrote:
>>
>> When rodata=full kernel linear mapping is mapped by PTE due to arm's
>> break-before-make rule.
>>
>> This resulted in a couple of problems:
>>   - performance degradation
>>   - more TLB pressure
>>   - memory waste for kernel page table
>>
>> There are some workarounds to mitigate the problems, for example, using
>> rodata=on, but this compromises the security measurement.
>>
>> With FEAT_BBM level 2 support, splitting large block page table to
>> smaller ones doesn't need to make the page table entry invalid anymore.
>> This allows kernel split large block mapping on the fly.
>>
>> Add kernel page table split support and use large block mapping by
>> default when FEAT_BBM level 2 is supported for rodata=full.  When
>> changing permissions for kernel linear mapping, the page table will be
>> split to PTE level.
>>
>> The machine without FEAT_BBM level 2 will fallback to have kernel linear
>> mapping PTE-mapped when rodata=full.
>>
>> With this we saw significant performance boost with some benchmarks with
>> keeping rodata=full security protection in the mean time.
>>
>> The test was done on AmpereOne machine (192 cores, 1P) with 256GB memory and
>> 4K page size + 48 bit VA.
>>
>> Function test (4K/16K/64K page size)
>>   - Kernel boot.  Kernel needs change kernel linear mapping permission at
>>     boot stage, if the patch didn't work, kernel typically didn't boot.
>>   - Module stress from stress-ng. Kernel module load change permission for
>>     module sections.
>>   - A test kernel module which allocates 80% of total memory via vmalloc(),
>>     then change the vmalloc area permission to RO, then change it back
>>     before vfree(). Then launch a VM which consumes almost all physical
>>     memory.
> 
> I don't really understand how vmalloc is relevant here? vmalloc can already map
> huge pages you use vmalloc_huge() and changing the permissions of vmalloc
> mapping will only affect the ptes pertaining to that mapping; I don't see why
> that would cause permissions to be changed on the linear map or for huge pages
> in the linear map to be split?
> 
>>   - VM with the patchset applied in guest kernel too.
>>   - Kernel build in VM with patched guest kernel.
>>
>> Memory consumption
>> Before:
>> MemTotal:       258988984 kB
>> MemFree:        254821700 kB
>>
>> After:
>> MemTotal:       259505132 kB
>> MemFree:        255410264 kB
>>
>> Around 500MB more memory are free to use.  The larger the machine, the
>> more memory saved.
>>
>> Performance benchmarking
>> * Memcached
>> We saw performance degradation when running Memcached benchmark with
>> rodata=full vs rodata=on.  Our profiling pointed to kernel TLB pressure.
>> With this patchset we saw ops/sec is increased by around 3.5%, P99
>> latency is reduced by around 9.6%.
>> The gain mainly came from reduced kernel TLB misses.  The kernel TLB
>> MPKI is reduced by 28.5%.
>>
>> The benchmark data is now on par with rodata=on too.
>>
>> * Disk encryption (dm-crypt) benchmark
>> Ran fio benchmark with the below command on a 128G ramdisk (ext4) with disk
>> encryption (by dm-crypt).
>> fio --directory=/data --random_generator=lfsr --norandommap --randrepeat 1 \
>>     --status-interval=999 --rw=write --bs=4k --loops=1 --ioengine=sync \
>>     --iodepth=1 --numjobs=1 --fsync_on_close=1 --group_reporting --thread \
>>     --name=iops-test-job --eta-newline=1 --size 100G
>>
>> The IOPS is increased by 90% - 150% (the variance is high, but the worst
>> number of good case is around 90% more than the best number of bad case).
>> The bandwidth is increased and the avg clat is reduced proportionally.
>>
>> * Sequential file read
>> Read 100G file sequentially on XFS (xfs_io read with page cache populated).
>> The bandwidth is increased by 150%.
> 
> The performance gains definitely look worthwhile!
> 
> Thanks,
> Ryan
> 
>>
>> RFC v2:
>>   * Used allowlist to advertise BBM lv2 on the CPUs which can handle TLB
>>     conflict gracefully per Will Deacon
>>   * Rebased onto v6.13-rc5
>>
>> RFC v1: https://lore.kernel.org/lkml/20241118181711.962576-1-yang@os.amperecomputing.com/
>>
>> Yang Shi (2):
>>       arm64: cpufeature: detect FEAT_BBM level 2
>>       arm64: mm: support large block mapping when rodata=full
>>
>>  arch/arm64/include/asm/cpufeature.h |  19 ++++++++++++
>>  arch/arm64/include/asm/pgtable.h    |   7 ++++-
>>  arch/arm64/kernel/cpufeature.c      |  11 +++++++
>>  arch/arm64/mm/mmu.c                 |  32 ++++++++++++++++++--
>>  arch/arm64/mm/pageattr.c            | 173 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----
>>  arch/arm64/tools/cpucaps            |   1 +
>>  6 files changed, 234 insertions(+), 9 deletions(-)
>>
>>
> 


