Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C42D35696
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 09:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O+XrW4k5epiAxYyQWxolP9CdYG+5jWSB8YXfa97drgM=; b=JTdRNZUXGREiegC7AN/Yn1PFSD
	CxoillYLRSil45gYdrsAGK/pz7nBeEC145qU8oNUyllRd4o3jMUuqhLvr60KfvtSBysnjxwQSWMFj
	aI0SYNhOpVnM7SIaWms1MJPkerDKZPlOcdvK8yEY4l9gAy7hrr2LeyRIaGOvhvyfq8AQADfMWZY1e
	DU0BaHUFloXkaPxyqCMdJiobaE7FZHrPEeJoLn0AyzZgAwh4xiA7gIVOv+pSWpcsMqdOQ8F4NW9HE
	8b3Ax8j6OaZciOmw9DGGfaPW9OY59VNnYmNxlCBZ0Q5Qye0ceXEPYbdSsjiE0Al/WtMsZtrb6X5pH
	4jUo0PRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1ZM-0000000Fim2-0zvx;
	Wed, 28 Jan 2026 09:10:36 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1ZE-0000000Fik9-3GiR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 09:10:35 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=O+XrW4k5epiAxYyQWxolP9CdYG+5jWSB8YXfa97drgM=;
	b=e6oNIkiu1+7o3lFWO1HaNNSCyiA9PhM2YNveAbVUWynnqCJRglfmHjFoqNRsbH+54mri71ZXR
	jW8JDBCqY+mSXg0mdD5k00imBuDu+t1g3oV7zf1GzIXKUCDUO4sOiRMlLZ6p6x7BEQ9w2PwLsAI
	cGplGXAGefuNlLkNXacWJv4=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4f1GcD2n8HzmV7H;
	Wed, 28 Jan 2026 17:06:52 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 046094056B;
	Wed, 28 Jan 2026 17:10:21 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 28 Jan 2026 17:10:17 +0800
Message-ID: <3407c779-9e7e-8f90-353f-c2b58992aae2@huawei.com>
Date: Wed, 28 Jan 2026 17:10:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2] arm64: kexec: Add support for crashkernel CMA
 reservation
Content-Language: en-US
To: Mike Rapoport <rppt@kernel.org>
CC: <ardb@kernel.org>, <leitao@debian.org>, <corbet@lwn.net>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <akpm@linux-foundation.org>,
	<bp@alien8.de>, <mingo@kernel.org>, <pawan.kumar.gupta@linux.intel.com>,
	<feng.tang@linux.alibaba.com>, <kees@kernel.org>, <elver@google.com>,
	<arnd@arndb.de>, <fvdl@google.com>, <lirongqing@baidu.com>,
	<bhelgaas@google.com>, <bhe@redhat.com>, <dave.hansen@linux.intel.com>,
	<cfsworks@gmail.com>, <osandov@fb.com>, <sourabhjain@linux.ibm.com>,
	<jbohac@suse.cz>, <ryan.roberts@arm.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20260126081334.699147-1-ruanjinjie@huawei.com>
 <aXnJd_Xghj9JLsnK@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <aXnJd_Xghj9JLsnK@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_011029_835447_FD435BFD 
X-CRM114-Status: GOOD (  25.52  )
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



On 2026/1/28 16:31, Mike Rapoport wrote:
> On Mon, Jan 26, 2026 at 04:13:34PM +0800, Jinjie Ruan wrote:
>> Commit 35c18f2933c5 ("Add a new optional ",cma" suffix to the
>> crashkernel= command line option") and commit ab475510e042 ("kdump:
>> implement reserve_crashkernel_cma") added CMA support for kdump
>> crashkernel reservation.
>>
>> Crash kernel memory reservation wastes production resources if too
>> large, risks kdump failure if too small, and faces allocation difficulties
>> on fragmented systems due to contiguous block constraints. The new
>> CMA-based crashkernel reservation scheme splits the "large fixed
>> reservation" into a "small fixed region + large CMA dynamic region": the
>> CMA memory is available to userspace during normal operation to avoid
>> waste, and is reclaimed for kdump upon crash—saving memory while
>> improving reliability.
>>
>> So extend crashkernel CMA reservation support to arm64. The following
>> changes are made to enable CMA reservation:
>>
>> - Parse and obtain the CMA reservation size along with other crashkernel
>>   parameters.
>> - Call reserve_crashkernel_cma() to allocate the CMA region for kdump.
>> - Include the CMA-reserved ranges for kdump kernel to use.
>> - Exclude the CMA-reserved ranges from the crash kernel memory to
>>   prevent them from being exported through /proc/vmcore.
>>
>> Update kernel-parameters.txt to document CMA support for crashkernel on
>> arm64 architecture.
> 
> I'm looking at this and at almost identical patch for riscv 
> https://lore.kernel.org/all/20260126080738.696723-1-ruanjinjie@huawei.com
> and it feels wrong that we have duplicate the code that excludes cma
> ranges.
> CMA ranges are known to the crash_core and I don't see why we cannot
> exclude them there.

Youa are right, x86 and powerpc has similar implementations that
excludes crashkernel cma ranges.

x86 [1]

+	for (i = 0; i < crashk_cma_cnt; ++i) {
+		ret = crash_exclude_mem_range(cmem, crashk_cma_ranges[i].start,
+					      crashk_cma_ranges[i].end);
+		if (ret)
+			return ret;
+	}
+
+	return 0;

But powerpc [2] is a little different which uses a wrapper for
crash_exclude_mem_range() and more check and realloc_mem_ranges().

+	for (i = 0; i < crashk_cma_cnt; ++i) {
+		ret = crash_exclude_mem_range_guarded(mem_ranges,
crashk_cma_ranges[i].start,
+					      crashk_cma_ranges[i].end);
+		if (ret)
+			goto out;
+	}

[1]: https://lore.kernel.org/all/ZWEAWMJtesa3O9M5@dwarf.suse.cz/
[2]:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b4a96ab50f368afc2360ff539a20254ca2c9a889

>  
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>> v2:
>> - Free cmem in prepare_elf_headers()
>> - Add the mtivation.
>> ---
>>  Documentation/admin-guide/kernel-parameters.txt |  2 +-
>>  arch/arm64/kernel/machine_kexec_file.c          | 15 ++++++++++++++-
>>  arch/arm64/mm/init.c                            |  5 +++--
>>  3 files changed, 18 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>> index 1058f2a6d6a8..36bb642a7edd 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -1119,7 +1119,7 @@ Kernel parameters
>>  			It will be ignored when crashkernel=X,high is not used
>>  			or memory reserved is below 4G.
>>  	crashkernel=size[KMG],cma
>> -			[KNL, X86, ppc] Reserve additional crash kernel memory from
>> +			[KNL, X86, ARM64, ppc] Reserve additional crash kernel memory from
>>  			CMA. This reservation is usable by the first system's
>>  			userspace memory and kernel movable allocations (memory
>>  			balloon, zswap). Pages allocated from this memory range
>> diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
>> index 410060ebd86d..ef6ce9aaba80 100644
>> --- a/arch/arm64/kernel/machine_kexec_file.c
>> +++ b/arch/arm64/kernel/machine_kexec_file.c
>> @@ -48,7 +48,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
>>  	u64 i;
>>  	phys_addr_t start, end;
>>  
>> -	nr_ranges = 2; /* for exclusion of crashkernel region */
>> +	nr_ranges = 2 + crashk_cma_cnt; /* for exclusion of crashkernel region */
>>  	for_each_mem_range(i, &start, &end)
>>  		nr_ranges++;
>>  
>> @@ -64,6 +64,12 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
>>  		cmem->nr_ranges++;
>>  	}
>>  
>> +	for (i = 0; i < crashk_cma_cnt; i++) {
>> +		cmem->ranges[cmem->nr_ranges].start = crashk_cma_ranges[i].start;
>> +		cmem->ranges[cmem->nr_ranges].end = crashk_cma_ranges[i].end;
>> +		cmem->nr_ranges++;
>> +	}
>> +
>>  	/* Exclude crashkernel region */
>>  	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
>>  	if (ret)
>> @@ -75,6 +81,13 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
>>  			goto out;
>>  	}
>>  
>> +	for (i = 0; i < crashk_cma_cnt; ++i) {
>> +		ret = crash_exclude_mem_range(cmem, crashk_cma_ranges[i].start,
>> +					      crashk_cma_ranges[i].end);
>> +		if (ret)
>> +			goto out;
>> +	}
>> +
>>  	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
>>  
>>  out:
>> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
>> index 524d34a0e921..28165d94af08 100644
>> --- a/arch/arm64/mm/init.c
>> +++ b/arch/arm64/mm/init.c
>> @@ -96,8 +96,8 @@ phys_addr_t __ro_after_init arm64_dma_phys_limit;
>>  
>>  static void __init arch_reserve_crashkernel(void)
>>  {
>> +	unsigned long long crash_base, crash_size, cma_size = 0;
>>  	unsigned long long low_size = 0;
>> -	unsigned long long crash_base, crash_size;
>>  	bool high = false;
>>  	int ret;
>>  
>> @@ -106,11 +106,12 @@ static void __init arch_reserve_crashkernel(void)
>>  
>>  	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
>>  				&crash_size, &crash_base,
>> -				&low_size, NULL, &high);
>> +				&low_size, &cma_size, &high);
>>  	if (ret)
>>  		return;
>>  
>>  	reserve_crashkernel_generic(crash_size, crash_base, low_size, high);
>> +	reserve_crashkernel_cma(cma_size);
>>  }
>>  
>>  static phys_addr_t __init max_zone_phys(phys_addr_t zone_limit)
>> -- 
>> 2.34.1
>>
> 

