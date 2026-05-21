Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FC3CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 16:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TE+flxUmppj+ZFgC+QBrYRcvnvQLDwrZCpxIpu25Sz4=; b=xTB9271O5w2W1CqVIe3IExxfIQ
	sCK3ZsAB58yu+diD1Rkndhq4rNYhSd3bHV2vzyr5BD74dPeTx4nyhkhi4UqyTV5pNZvFgRS/D8yE7
	GEPIvrHHnzdDSYb7UvDI7geA7FOkH+seLsfvhnsCz3/9Ri/RCFVUoSk8CldOaSXvogo2Img7kpVt1
	1ODzTzcVm9Lg3RWIVTZp/ZEXDzrM6WgJ1rDQtXrZ6wxybYJ8XsT25yCLLg44V4oVJ1ZMRdeYnB1p7
	zOTeXWs2HnH2GOlr+KRHrd5gd0IJt48HJL3bmapm8JKtIgd5venJR9u6hzcwHjkz8Ej1lhMhFeJs0
	6rUdbGUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5qF-00000008Qng-2cru;
	Thu, 21 May 2026 16:01:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5qD-00000008QnC-0249
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 16:01:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A3C24A0B;
	Thu, 21 May 2026 09:01:38 -0700 (PDT)
Received: from [10.57.22.108] (unknown [10.57.22.108])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F5EE3F632;
	Thu, 21 May 2026 09:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779379303; bh=C2XTErJ4Ho5VJBYfNuKsd2pdN6y06CRfbrg4qfvDAz8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=McqcDVXe4IqzgUYd4mxIG/hYeLAE3i7TYhvxyEIollCwXRYESsG2LiwTNqbyaijA2
	 KaH8ngphdfSCUdD6gmOOb7cw/upUDzgNlOu5NhKShrCTrapTXfvvcYpug7sDh9RDfw
	 +wsaMVm9eJLG34qTaFiKmXEGweOC+75P3zDrLZSk=
Message-ID: <a81c3688-30f1-43e4-8d57-1d08a6e563af@arm.com>
Date: Thu, 21 May 2026 17:01:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 09/44] arm64: RMI: Provide functions to
 delegate/undelegate ranges of memory
Content-Language: en-GB
To: Marc Zyngier <maz@kernel.org>, Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo.Pieralisi2@arm.com
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-10-steven.price@arm.com>
 <867bowx3qx.wl-maz@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <867bowx3qx.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_090145_133185_4ACE43DF 
X-CRM114-Status: GOOD (  23.80  )
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

On 21/05/2026 14:59, Marc Zyngier wrote:
> On Wed, 13 May 2026 14:17:17 +0100,
> Steven Price <steven.price@arm.com> wrote:
>>
>> The RMM requires memory is 'delegated' to it so that it can be used
>> either for a realm guest or for various tracking purposes within the RMM
>> (e.g. for metadata or page tables). Memory that has been delegated
>> cannot be accessed by the host (it will result in a Granule Protection
>> Fault).
>>
>> Undelegation may fail if the memory is still in use by the RMM. This
>> shouldn't happen (Linux should ensure it has destroyed the RMM objects
>> before attempting to undelegate). In the event that it does happen this
>> points to a programming bug and the only reasonable approach is for the
>> physical pages to be leaked - it is up to the caller of
>> rmi_undelegate_range() to handle this.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> v14:
>>   * Split into separate patch and moved out of KVM
>> ---
>>   arch/arm64/include/asm/rmi_cmds.h | 13 +++++++++++
>>   arch/arm64/kernel/rmi.c           | 36 +++++++++++++++++++++++++++++++
>>   2 files changed, 49 insertions(+)
>>
>> diff --git a/arch/arm64/include/asm/rmi_cmds.h b/arch/arm64/include/asm/rmi_cmds.h
>> index 9078a2920a7c..eb213c8e6f26 100644
>> --- a/arch/arm64/include/asm/rmi_cmds.h
>> +++ b/arch/arm64/include/asm/rmi_cmds.h
>> @@ -33,6 +33,19 @@ struct rmi_sro_state {
>>   } while (RMI_RETURN_STATUS(res.a0) == RMI_BUSY ||			\
>>   	 RMI_RETURN_STATUS(res.a0) == RMI_BLOCKED)
>>   
>> +int rmi_delegate_range(phys_addr_t phys, unsigned long size);
>> +int rmi_undelegate_range(phys_addr_t phys, unsigned long size);
>> +
>> +static inline int rmi_delegate_page(phys_addr_t phys)
>> +{
>> +	return rmi_delegate_range(phys, PAGE_SIZE);
>> +}
>> +
>> +static inline int rmi_undelegate_page(phys_addr_t phys)
>> +{
>> +	return rmi_undelegate_range(phys, PAGE_SIZE);
>> +}
>> +
>>   bool rmi_is_available(void);
>>   
>>   unsigned long rmi_sro_execute(struct rmi_sro_state *sro, gfp_t gfp);
>> diff --git a/arch/arm64/kernel/rmi.c b/arch/arm64/kernel/rmi.c
>> index 52a415e99500..08cef54acadb 100644
>> --- a/arch/arm64/kernel/rmi.c
>> +++ b/arch/arm64/kernel/rmi.c
>> @@ -12,6 +12,42 @@ static bool arm64_rmi_is_available;
>>   unsigned long rmm_feat_reg0;
>>   unsigned long rmm_feat_reg1;
>>   
>> +int rmi_delegate_range(phys_addr_t phys, unsigned long size)
>> +{
>> +	unsigned long ret = 0;
>> +	unsigned long top = phys + size;
>> +	unsigned long out_top;
>> +
>> +	while (phys < top) {
>> +		ret = rmi_granule_range_delegate(phys, top, &out_top);
>> +		if (ret == RMI_SUCCESS)
>> +			phys = out_top;
>> +		else if (ret != RMI_BUSY && ret != RMI_BLOCKED)
>> +			return ret;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +int rmi_undelegate_range(phys_addr_t phys, unsigned long size)
>> +{
>> +	unsigned long ret = 0;
>> +	unsigned long top = phys + size;
>> +	unsigned long out_top;
>> +
>> +	WARN_ON(size == 0);
> 
> I find it odd to warn on size = 0. After all, free(NULL) is not an
> error. But even then, you continue feeding this to the RMM.
> 
> You also don't seem to be bothered with that on the delegation side...
> 
>> +
>> +	while (phys < top) {
>> +		ret = rmi_granule_range_undelegate(phys, top, &out_top);
>> +		if (ret == RMI_SUCCESS)
>> +			phys = out_top;
> 
> and size==0 doesn't violate any of the failure conditions listed in
> B4.5.18.2 (beta2). Will you end-up looping around forever?

That is not true ? It triggers, top_bound error condition, for both.


pre: UInt(top) <= UInt(base)
post: result.status == RMI_ERROR_INPUT


Suzuki
> 
> Same questions for the delegation, obviously.
> 
> 	M.
> 


