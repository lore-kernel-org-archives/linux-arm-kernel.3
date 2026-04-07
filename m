Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7830EDB7E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 09:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ir3H9E0YacMxAtkRfJL5DPGjH1Xyn++W5XyESzyPWhg=; b=NrglIdmLxw1X9cGcg+Zdvl+h3D
	DSP9ka5YAKyfCQrE2DUa9ExkiDXj6yddc6Yrf7v4IsJPEZLExvvDoyZKGikuSXxWUKrb3L2A0ffEc
	hk8eLIf8LTi73dC2JQdj5yI7GPJQxAiHCCVQTqQa5eWrH3d8w9RgD8zfnXsZRShXIV3vTzf8l0Xpn
	6Yu7dXjQWiUHa2jzlry2dr69ejthY7JPHXUkkZWZW4xeacoCw4HAEwi5r+FDoaApSUfy7aLPZ/r2i
	fGeLeUqTXfL9UeL7zDpzhmzMga41ebt2tdwQYXm0Bsyqn/ChXgcZs0V4gCQ242SPsnExY4S6kNNfU
	tg4JwrTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA3Bo-00000006Frk-1CVY;
	Tue, 07 Apr 2026 09:57:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA3Bl-00000006FrN-1Z7w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 09:57:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A354D1BB2;
	Tue,  7 Apr 2026 02:57:32 -0700 (PDT)
Received: from [10.57.62.20] (unknown [10.57.62.20])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C21E03F7D8;
	Tue,  7 Apr 2026 02:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775555858; bh=GDEYdp9RtUTCRAaXXYD6KpDKVf+j1vyiOvYCN2p8fxE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XU+r8HEdffWkHWIz9LDQmKaOh8jWEiuN53Vb72TAtJ3qBPJmaTUn5V/Ts74qgohF5
	 ZiYUKRdqLa89HvI499eDJOJgZprE6LBFrCyNrR87yMTQ0mZowKa7ZQWUaQGHnF5TLK
	 fEsXI26cKPemRpcd0cCuCQ3rXNI/1DUSJahoD9vY=
Message-ID: <1db93bd3-cb47-445b-b8ca-6de6f04b41cc@arm.com>
Date: Tue, 7 Apr 2026 10:57:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: mm: Fix rodata=full block mapping support
 for realm guests
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>,
 Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>, "David Hildenbrand (Arm)"
 <david@kernel.org>, Dev Jain <dev.jain@arm.com>,
 Yang Shi <yang@os.amperecomputing.com>, Jinjiang Tu <tujinjiang@huawei.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260330161705.3349825-1-ryan.roberts@arm.com>
 <20260330161705.3349825-2-ryan.roberts@arm.com> <ac7VD4Z85nS30GCp@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <ac7VD4Z85nS30GCp@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_025741_508334_AA5B22C3 
X-CRM114-Status: GOOD (  32.31  )
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
>>   int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
>>   {
>>   	int ret;
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
>>   	/*
>>   	 * If the region is within a pte-mapped area, there is no need to try to
>>   	 * split. Additionally, CONFIG_DEBUG_PAGEALLOC and CONFIG_KFENCE may
>>   	 * change permissions from atomic context so for those cases (which are
>>   	 * always pte-mapped), we must not go any further because taking the
>> -	 * mutex below may sleep.
>> +	 * mutex below may sleep. Do not call force_pte_mapping() here because
>> +	 * it could return a confusing result if called from a secondary cpu
>> +	 * prior to finalizing caps. Instead, linear_map_requires_bbml2 gives us
>> +	 * what we need.
>>   	 */
>> -	if (force_pte_mapping() || is_kfence_address((void *)start))
>> +	if (!linear_map_requires_bbml2 || is_kfence_address((void *)start))
>>   		return 0;
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
> 
> An option may be to attempt cpus_read_trylock() as this lock is taken by
> _cpu_up(). If it fails, return -EBUSY, otherwise check num_online_cpus()
> and unlock (and return -EBUSY if secondaries already started).
> 
> Another thing I couldn't get my head around - IIUC is_realm_world()
> won't return true for map_mem() yet (if in a realm). 
That is correct. map_mem() comes from paginig_init(), which gets called
before arm64_rsi_init(). Realm check was delayed until psci_xx_init().
We had a version which parsed the DT for PSCI conduit early enough
to be able to make the SMC calls to detect the Realm. But there
were concerns around it.


> Can we have realms on hardware that does not support BBML2_NOABORT? 

I can get this checked. I expect that they all will have BBML2 (v8.4
extension). But NOABORT is something that may need to be checked.

We may not have


> configuration with rodata_full set (it should be complementary to realm
> support).



> 
> I'll add the patches to for-next/core to give them a bit of time in
> -next but let's see next week if we ignore this (with an updated
> comment) or we try to avoid the issue altogether.
> 

Thanks

Suzuki


