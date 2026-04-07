Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 147B1EDB7CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 08:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nZIGuZCHJQP5m4aBGytdEyFb8ihiLnQypa4ZF2tHbC0=; b=IBX792Sfi2RYVvuYwvctWA8HPI
	y5d+b6hlUKD54eFj/osXCuxLcogg21o2bUe/H1UHw/TNppvKYBy/kJoo7LDShzMAhBfudYk3iHut9
	xqeqdwSmah9KtYa+Sh66IFwJJ0Yvoh5WI9MuSFlM+aDkxaVzoNVQKX15Q4FbZ2XGSPoE8Nd7rw3C5
	ivjZ2RmBnfGmfa+HLVxqvQuUbCc4Kc+b8AX+RDRHw7Se1KMinbMt2uO+y0HOu6QGisAs+cxE/B/AB
	0lUcwPxgmocUbBQo75m6U60wfNQGtuYml6TugShJMHnH6HkdNZxJL4ezOEwvUTS/wLuhAwbJ8/k1u
	YrHm1qdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1sl-00000006ALE-08L6;
	Tue, 07 Apr 2026 08:33:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1si-00000006AKS-2B5W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 08:33:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C45E1BB0;
	Tue,  7 Apr 2026 01:33:48 -0700 (PDT)
Received: from [10.57.87.42] (unknown [10.57.87.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27AA33F641;
	Tue,  7 Apr 2026 01:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775550833; bh=Heg4YQbV1vvgUn0TgfKMiao62MWpbj3co/ZqYPpLlFM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BeOvKBOwcfSrrgOOwLTx2bedDd9LnW/QQ2dazXB+DPDeacQE/pprpv5KjsFESUOp7
	 QAEEweOhufhnbL9FV8Fq+lLlX6dX9T/DlPrmxQ6hnW14JoYODNIAQmtXeIsWW89I5K
	 R1kdOEEy+hZf4eWOH8LvTYDjyXg4riRLxA3N6RwA=
Message-ID: <160ec79a-f842-421a-bfde-5b4da32b3b4e@arm.com>
Date: Tue, 7 Apr 2026 09:33:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: mm: Fix rodata=full block mapping support
 for realm guests
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, "David Hildenbrand (Arm)"
 <david@kernel.org>, Dev Jain <dev.jain@arm.com>,
 Yang Shi <yang@os.amperecomputing.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Jinjiang Tu <tujinjiang@huawei.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260330161705.3349825-1-ryan.roberts@arm.com>
 <20260330161705.3349825-2-ryan.roberts@arm.com> <ac7VD4Z85nS30GCp@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <ac7VD4Z85nS30GCp@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_013356_638913_5F02B8A1 
X-CRM114-Status: GOOD (  35.64  )
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

On 02/04/2026 21:43, Catalin Marinas wrote:
> On Mon, Mar 30, 2026 at 05:17:02PM +0100, Ryan Roberts wrote:
>>  int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
>>  {
>>  	int ret;
>>  
>> -	/*
>> -	 * !BBML2_NOABORT systems should not be trying to change permissions on
>> -	 * anything that is not pte-mapped in the first place. Just return early
>> -	 * and let the permission change code raise a warning if not already
>> -	 * pte-mapped.
>> -	 */
>> -	if (!system_supports_bbml2_noabort())
>> -		return 0;
>> -
>>  	/*
>>  	 * If the region is within a pte-mapped area, there is no need to try to
>>  	 * split. Additionally, CONFIG_DEBUG_PAGEALLOC and CONFIG_KFENCE may
>>  	 * change permissions from atomic context so for those cases (which are
>>  	 * always pte-mapped), we must not go any further because taking the
>> -	 * mutex below may sleep.
>> +	 * mutex below may sleep. Do not call force_pte_mapping() here because
>> +	 * it could return a confusing result if called from a secondary cpu
>> +	 * prior to finalizing caps. Instead, linear_map_requires_bbml2 gives us
>> +	 * what we need.
>>  	 */
>> -	if (force_pte_mapping() || is_kfence_address((void *)start))
>> +	if (!linear_map_requires_bbml2 || is_kfence_address((void *)start))
>>  		return 0;
>>  
>> +	if (!system_supports_bbml2_noabort()) {
>> +		/*
>> +		 * !BBML2_NOABORT systems should not be trying to change
>> +		 * permissions on anything that is not pte-mapped in the first
>> +		 * place. Just return early and let the permission change code
>> +		 * raise a warning if not already pte-mapped.
>> +		 */
>> +		if (system_capabilities_finalized())
>> +			return 0;
>> +
>> +		/*
>> +		 * Boot-time: split_kernel_leaf_mapping_locked() allocates from
>> +		 * page allocator. Can't split until it's available.
>> +		 */
>> +		if (WARN_ON(!page_alloc_available))
>> +			return -EBUSY;
>> +
>> +		/*
>> +		 * Boot-time: Started secondary cpus but don't know if they
>> +		 * support BBML2_NOABORT yet. Can't allow splitting in this
>> +		 * window in case they don't.
>> +		 */
>> +		if (WARN_ON(num_online_cpus() > 1))
>> +			return -EBUSY;
>> +	}
> 
> I think sashiko is over cautions here
> (https://sashiko.dev/#/patchset/20260330161705.3349825-1-ryan.roberts@arm.com)
> but it has a somewhat valid point from the perspective of
> num_online_cpus() semantics. We have have num_online_cpus() == 1 while
> having a secondary CPU just booted and with its MMU enabled. I don't
> think we can have any asynchronous tasks running at that point to
> trigger a spit though. Even async_init() is called after smp_init().

Yes I saw the Sashiko report, but we had previously had a (private) discussion
where I thought we had already concluded that this approach is safe in practice
due to the way that the boot cpu brings the secondaries online.

> 
> An option may be to attempt cpus_read_trylock() as this lock is taken by
> _cpu_up(). If it fails, return -EBUSY, otherwise check num_online_cpus()
> and unlock (and return -EBUSY if secondaries already started).

That sounds neat; I could dig deeper and have a go at something like this if you
want?

> 
> Another thing I couldn't get my head around - IIUC is_realm_world()
> won't return true for map_mem() yet (if in a realm). Can we have realms
> on hardware that does not support BBML2_NOABORT? We may not have
> configuration with rodata_full set (it should be complementary to realm
> support).

My understanding is that this is a pre-existing (and known) bug. It's not
related to the "map linear map by large leaves and split dynamically" feature so
wasn't attempting to fix it.

I had heard that in practice all FEAT_RME systems should support FEAT_BBML3
which would solve the problem. Not sure how true that is though.

> 
> I'll add the patches to for-next/core to give them a bit of time in
> -next but let's see next week if we ignore this (with an updated
> comment) or we try to avoid the issue altogether.
> 

Thanks,
Ryan



