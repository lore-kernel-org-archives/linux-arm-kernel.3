Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F18C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 18:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=20cWD5p7ccnwhlNMlBrNcTrycGkEJXJawgp5mTV+25g=; b=vT40bYcoUVQ9hbJrhOtkdxrSRa
	fflZOWDA27V3dpBENV2xABXANUIqT1bo6Hu2PnnKASz3K91IlvRpq9QEJ4VVf88QvNU4QSVQsjhac
	EKEIg4CkYQVp6LiMZvwRuj2ClWC6i5iikJ1nD6skxNFB0DSnPiT6YGYJfoo6QFGLzPT0zLyFs5qi9
	SiK7CQ7i5oQ253yKMimjPurKqDg5xLe3MrPni5e2R0/yGMNK+W+i58WA9rrZ23jk4VkhCT3vW7mH4
	JxkI8bkxKm57O5fPwE5siuz8w1NvVeynLq1rQ/RwkL7Sf+oM1zhts50ZM0lDHBhLh0uW806X/S97M
	FeE+gLPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTlo7-00000003fv8-0TOG;
	Mon, 23 Jun 2025 18:22:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTiQV-000000036Oq-0YxN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 14:45:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5414D1D14;
	Mon, 23 Jun 2025 07:45:20 -0700 (PDT)
Received: from [10.57.29.183] (unknown [10.57.29.183])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D3E143F66E;
	Mon, 23 Jun 2025 07:45:33 -0700 (PDT)
Message-ID: <1c1f1970-4b6d-4914-b6eb-fd8f53a55356@arm.com>
Date: Mon, 23 Jun 2025 15:45:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 15/43] arm64: RME: Allow VMM to set RIPAS
To: zhuangyiwei <zhuangyiwei@huawei.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 zhouguangwei5@huawei.com, wangyuan46@huawei.com
References: <20250611104844.245235-1-steven.price@arm.com>
 <20250611104844.245235-16-steven.price@arm.com>
 <5934e102-0e3c-43a8-a887-0c97904e6f6c@huawei.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <5934e102-0e3c-43a8-a887-0c97904e6f6c@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_074539_298937_FDDFD383 
X-CRM114-Status: GOOD (  16.41  )
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

On 17/06/2025 13:56, zhuangyiwei wrote:
> Hi Steven
> 
> On 2025/6/11 18:48, Steven Price wrote:
>> Each page within the protected region of the realm guest can be marked
>> as either RAM or EMPTY. Allow the VMM to control this before the guest
>> has started and provide the equivalent functions to change this (with
>> the guest's approval) at runtime.
>>
>> When transitioning from RIPAS RAM (1) to RIPAS EMPTY (0) the memory is
>> unmapped from the guest and undelegated allowing the memory to be reused
>> by the host. When transitioning to RIPAS RAM the actual population of
>> the leaf RTTs is done later on stage 2 fault, however it may be
>> necessary to allocate additional RTTs to allow the RMM track the RIPAS
>> for the requested range.
>>
>> When freeing a block mapping it is necessary to temporarily unfold the
>> RTT which requires delegating an extra page to the RMM, this page can
>> then be recovered once the contents of the block mapping have been
>> freed.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
[...]
>> diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
>> index 25705da6f153..fe75c41d6ac3 100644
>> --- a/arch/arm64/kvm/rme.c
>> +++ b/arch/arm64/kvm/rme.c
[...]
>> @@ -126,6 +206,40 @@ static int realm_rtt_destroy(struct realm *realm,
>> unsigned long addr,
>>       return ret;
>>   }
>>   +static int realm_create_rtt_levels(struct realm *realm,
>> +                   unsigned long ipa,
>> +                   int level,
>> +                   int max_level,
>> +                   struct kvm_mmu_memory_cache *mc)
>> +{
>> +    if (level == max_level)
>> +        return 0;
>> +
>> +    while (level++ < max_level) {
>> +        phys_addr_t rtt = alloc_rtt(mc);
>> +        int ret;
>> +
>> +        if (rtt == PHYS_ADDR_MAX)
>> +            return -ENOMEM;
>> +
>> +        ret = realm_rtt_create(realm, ipa, level, rtt);
>> +
>> +        if (RMI_RETURN_STATUS(ret) == RMI_ERROR_RTT &&
>> +            RMI_RETURN_INDEX(ret) == level - 1) {
>> +            /* The RTT already exists, continue */
> Should rtt be freed and undelegated in this branch?

Indeed it should! There's a missing call to free_rtt(). Thanks for spotting.

>> +            continue;
>> +        }
>> +        if (ret) {
>> +            WARN(1, "Failed to create RTT at level %d: %d\n",
>> +                 level, ret);
>> +            free_rtt(rtt);
>> +            return -ENXIO;
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>> +

Thanks,
Steve

