Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4E1C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 08:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=THlSxblMU/aDpCrRdi8YJExhKk1axIZf9m1OAOx5PRo=; b=l8/wgxAH791YwVClAV9p77TD4m
	Gl+qfvcq2YTR++3f6j1/hCJcI7Q2xswJFAS0TSCK9hB43T9mAl3T5d3pzvN9OxKfOgKKHeJBsPo1l
	JCjFUxTOT2Rs91TUDbsuThM+Si4h9/E70byVXhW3mbSJl4glCwGWlwl5JfhnGfwyO9tnmsChp1pLL
	0O1eD9RFfOIFFXFsFt18yqBD5etG2BXJZ+Cp2ng433RKKEV46Cs1qACFy2faAZzQ4v7EDvT8Zzg4y
	24F++PjvgrsMtvtt0NvBUqB49uc7LBGNv9Y9jRg0ARaFTFEzvU/hUiu2/CaDNkzVaUTl2JCQ8R6ac
	SsZkp8lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6U9-000000002TM-0ReM;
	Mon, 28 Sep 2026 08:13:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6U7-000000002Sy-0dX2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 08:13:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF46B1692;
	Mon, 28 Sep 2026 01:13:10 -0700 (PDT)
Received: from [10.57.12.79] (unknown [10.57.12.79])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7EE4C3F86F;
	Mon, 28 Sep 2026 01:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790583194; bh=WPsNvAvqg8vhI8zzc//qW9WbhUe4lVNYZ4Eno5ypewM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iOZvP4NMl30vWU5Lqmr7s+xMn1mwl56R/TOdnVKw8skmeTKUUs/4iTPO6zUeezNuh
	 XXNrVLaKC9r6XO1DXTxyxf09PwHbXMzYRHE7a5vCAj38rwWFunIuBYTvnOy+264YZA
	 2ACgAlSG9yCd0UTWaM9fHAUo4RIvzG5gDxgUrkVo=
Message-ID: <3bd74dc2-d057-4f63-8a3d-b6337953c047@arm.com>
Date: Mon, 28 Sep 2026 09:13:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 09/20] KVM: arm64: Add VM specific callback for S2 MMU
 operations
Content-Language: en-GB
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260920212845.707-1-suzuki.poulose@arm.com>
 <20260920212845.707-10-suzuki.poulose@arm.com>
 <647ae455-4175-4070-a40e-d2d89f18971f@redhat.com>
 <df7e9870-1176-4679-bd79-807c0d87a4f2@redhat.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <df7e9870-1176-4679-bd79-807c0d87a4f2@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_011315_273286_4B59EF29 
X-CRM114-Status: GOOD (  13.82  )
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

On 28/09/2026 02:25, Gavin Shan wrote:
> On 9/28/26 11:09 AM, Gavin Shan wrote:
>> On 9/21/26 7:28 AM, Suzuki K Poulose wrote:
>>> Add VM type specific S2 MMU operation backends which can be 
>>> initialized per
>>> VM flavor, to keep the handling cleaner.
>>>
>>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>> ---
>>>   arch/arm64/include/asm/kvm_host.h |  15 ++++
>>>   arch/arm64/kvm/mmu.c              | 137 +++++++++++++++++++++++++-----
>>>   2 files changed, 131 insertions(+), 21 deletions(-)

...

>>> +int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm,
>>> +                     gfn_t gfn, u64 nr_pages)
>>> +{
>>> +    if (!kvm->arch.vm_s2_ops->vm_flush_remote_tlbs_range)
>>> +        return 1;
>>> +
>>
>> Realm would the only case where vm_s2_ops->vm_flush_remote_{tlbs, 
>> tlbs_range)
>> are NULL. On request to flush remote TLBs by 
>> kvm_flush_remote_tlbs_range(), it
>> ends up with event KVM_REQ_TLB_FLUSH queued for each vCPU. How this 
>> queued event
>> is linked to a remote TLB flush for realm? The problem is TLBs are 
>> owned by EL2
>> realm and there are no RMI calls for the management. So I'm wandering 
>> we should
>> return 0 here?
>>
> 
> vm_s2_ops->vm_flush_remote_{tlbs, tlbs_range} are added in PATCH[14] 
> where 0 is
> returned for both function. So I guess needn't this check at all?
> 
>       if (!kvm->arch.vm_s2_ops->vm_flush_remote_tlbs_range)

I would leave that check as they are. The only callback that
is mandatory is the vm_mem_abort and we do enforce it at init.

Cheers
Suzuki


