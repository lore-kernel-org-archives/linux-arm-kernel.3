Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B6CC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0e2jnnOEGPy/vfUkFbT48vxlfAwh6z62bRoVArUKL1Q=; b=KGL2HDwY6lqofsyx9bBp9q8fVX
	s/p/Yp83yh24MClKTQpBx3fu/pWtWzQu6/wJ6gIyP45abUmjNilIjhavraQEBMYKVGBFQW/R1E0eR
	bMbVv+SdvNnerXLMoyx2odvQB/h3nsntjsKVMWLpbbolGu72++NLPNMT5SLiGJuilmVoWf7QQEUJJ
	Jlja+kl1XJDn23DS/p37VTp6FvCjA4hMZ3QE2GS2O/OvyCKIu7uSRCzDqpb1SLBHdLxoC6g0jxy7z
	dE9GP932YOlBb06nhJtKJxXy4BRjbciTdDEamtvn54S/8YGUVtvBoKEDAzvdRvBhu4c8JmDiJLwpH
	bX/HtIUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy4A-00000000QYC-0eng;
	Tue, 25 Feb 2025 16:45:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxpx-00000000Dqp-2Mqi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 16:31:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 186951BCB;
	Tue, 25 Feb 2025 08:31:29 -0800 (PST)
Received: from [192.168.4.165] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 414483F6A8;
	Tue, 25 Feb 2025 08:31:11 -0800 (PST)
Message-ID: <5a135acb-b94d-47f5-9436-2d558cf78268@arm.com>
Date: Tue, 25 Feb 2025 16:31:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: realm: Use aliased addresses for device DMA
 to shared buffers
Content-Language: en-GB
To: Gavin Shan <gshan@redhat.com>, will@kernel.org, robin.murphy@arm.com,
 catalin.marinas@arm.com
Cc: maz@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 aneesh.kumar@kernel.org, steven.price@arm.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Christoph Hellwig <hch@lst.de>, Tom Lendacky <thomas.lendacky@amd.com>
References: <20250219220751.1276854-1-suzuki.poulose@arm.com>
 <20250219220751.1276854-4-suzuki.poulose@arm.com>
 <c710a9d6-bd1b-4867-bdc9-b3a79e577d0e@redhat.com>
 <308f8a08-a6f8-403e-a130-18c7d3db2e23@redhat.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <308f8a08-a6f8-403e-a130-18c7d3db2e23@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_083113_694324_21C65A6B 
X-CRM114-Status: GOOD (  19.67  )
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

Hi Gavin

Thanks for the review.

On 25/02/2025 05:28, Gavin Shan wrote:
> On 2/25/25 3:24 PM, Gavin Shan wrote:
>> On 2/20/25 8:07 AM, Suzuki K Poulose wrote:
>>> When a device performs DMA to a shared buffer using physical addresses,
>>> (without Stage1 translation), the device must use the "{I}PA address" 
>>> with the
>>> top bit set in Realm. This is to make sure that a trusted device will 
>>> be able
>>> to write to shared buffers as well as the protected buffers. Thus, a 
>>> Realm must
>>> always program the full address including the "protection" bit, like 
>>> AMD SME
>>> encryption bits.
>>>
>>> Enable this by providing arm64 specific 
>>> dma_{encrypted,decrypted,clear_encryption}
>>> helpers for Realms. Please note that the VMM needs to similarly make 
>>> sure that
>>> the SMMU Stage2 in the Non-secure world is setup accordingly to map 
>>> IPA at the
>>> unprotected alias.
>>>
>>> Cc: Will Deacon <will@kernel.org>
>>> Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>> Cc: Robin Murphy <robin.murphy@arm.com>
>>> Cc: Steven Price <steven.price@arm.com>
>>> Cc: Christoph Hellwig <hch@lst.de>
>>> Cc: Tom Lendacky <thomas.lendacky@amd.com>
>>> Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
>>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>> ---
>>>   arch/arm64/include/asm/mem_encrypt.h | 22 ++++++++++++++++++++++
>>>   1 file changed, 22 insertions(+)
>>>
>>> diff --git a/arch/arm64/include/asm/mem_encrypt.h b/arch/arm64/ 
>>> include/asm/mem_encrypt.h
>>> index f8f78f622dd2..aeda3bba255e 100644
>>> --- a/arch/arm64/include/asm/mem_encrypt.h
>>> +++ b/arch/arm64/include/asm/mem_encrypt.h
>>> @@ -21,4 +21,26 @@ static inline bool force_dma_unencrypted(struct 
>>> device *dev)
>>>       return is_realm_world();
>>>   }
>>> +static inline dma_addr_t dma_decrypted(dma_addr_t daddr)
>>> +{
>>> +    if (is_realm_world())
>>> +        daddr |= prot_ns_shared;
>>> +    return daddr;
>>> +}
>>> +#define dma_decrypted dma_decrypted
>>> +
>>
>> There is an existing macro (PROT_NS_SHARED), which is preferred to return
>> prot_ns_shared or 0 depending on the availability of the realm 
>> capability.
>> However, that macro needs to be improved a bit so that it can be used 
>> here.
>> We need to return 0UL to match with the type of prot_ns_shared 
>> (unsigned long)
>>
>> -#define PROT_NS_SHARED         (is_realm_world() ? prot_ns_shared : 0)
>> +#define PROT_NS_SHARED         (is_realm_world() ? prot_ns_shared : 0UL)
>>
>> After that, the chunk of code can be as below.
>>
>>      return daddr | PROT_NS_SHARED;
>>
>>> +static inline dma_addr_t dma_encrypted(dma_addr_t daddr)
>>> +{
>>> +    if (is_realm_world())
>>> +        daddr &= prot_ns_shared - 1;
>>> +    return daddr;
>>> +}
>>> +#define dma_encrypted dma_encrypted
>>> +
>>
>> With PROT_NS_SHARED, it can become something like below. 
>> (PROT_NS_SHARED - 1)
>> is equivalent to -1UL, 'daddr & -1UL' should be fine since it does 
>> nothing.
>>
> 
> I meant (PROT_NS_SHARED - 1) is equivalent to -1UL when no realm capability
> is around :)

I didn't want this to be there ;-). But with Robin's comment, I think we
can revert back to PROT_NS_SHARED.

Cheers
Suzuki

> 
>>      return daddr & (PROT_NS_SHARED - 1);
>>
>>> +static inline dma_addr_t dma_clear_encryption(dma_addr_t daddr)
>>> +{
>>> +    return dma_encrypted(daddr);
>>> +}
>>> +#define dma_clear_encryption dma_clear_encryption
>>> +
>>>   #endif    /* __ASM_MEM_ENCRYPT_H */
> 
> Thanks,
> Gavin
> 


