Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E73CC79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 11:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=msLApuQdOfsEu6rx1kNx8hTGIemJpWdVfYWmIEIv5BE=; b=nYYKISzBBcletVmO7P16mCFFfg
	Ia65Fon7DmxuUchnsS7XPSmJzCFTI7JJfwxFYHZ8aAYe4AxlYYT+/ksxLZeClC8gNIMeBZZgO380M
	Dz+mTW9bcMnFhJlQv9seEq8pzWNuYXhqycVeQoplvyv+AXa7LBy/aBAUQhu+WbelwTZvz6t8ATqQu
	3s9OtVtLMNnLXzKP3WXvirxhRDNtLBsJtma6iH9NAEQPOV/Ym7bomCjJ7BdlehRavXp6sg6MdbNui
	kqJrjEYwoltfnAVCV+tBD1PbBY+XODGx52MLo4P3w5MZSTHiLISsnBxezwdytkCN1cLYkdnlvqhpi
	mKocW4qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4GPd-0000000BYqt-0rye;
	Wed, 09 Sep 2026 11:24:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4GPZ-0000000BYqQ-3kFi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 11:24:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B23621691;
	Wed,  9 Sep 2026 04:24:10 -0700 (PDT)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F8C13F528;
	Wed,  9 Sep 2026 04:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788953054; bh=y74L0DLhbdt+Ower+oXr1Vl+Ik+e0ELSA4xWXm212qs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XNqERASChp/Zp7Dp+uULGdCu5WA7QNGKEVyJWabIpdbt8Y78BBxn4OORUFIRldKuI
	 1cu+VTjUhYFKXb/5zHsKA3zVVIKksgKzB2m/zOGShHJqd4k8sZxmp2/sZBRIhZECs5
	 68eDhqzMxdiHZM71Q3QwzE6Oz5yh79foLy6c1Zxk=
Message-ID: <6c899477-40a9-443b-8f0a-0fb85beca3b3@arm.com>
Date: Wed, 9 Sep 2026 12:24:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 02/20] KVM: arm64: Avoid including linux/kvm_host.h in
 kvm_pgtable.h
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev,
 gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com,
 alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com,
 lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260908162223.1683432-1-suzuki.poulose@arm.com>
 <20260908162223.1683432-3-suzuki.poulose@arm.com>
 <CA+EHjTzGeHCWV=ooEv-P79NNqTDi-A+7y5BFvZRR0z8RwavoeA@mail.gmail.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <CA+EHjTzGeHCWV=ooEv-P79NNqTDi-A+7y5BFvZRR0z8RwavoeA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_042418_310703_C5AB56A4 
X-CRM114-Status: GOOD (  15.07  )
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

On 09/09/2026 12:22, Fuad Tabba wrote:
> On Tue, 8 Sept 2026 at 17:22, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>>
>> From: Steven Price <steven.price@arm.com>
>>
>> To avoid future include cycles, drop the linux/kvm_host.h include in
>> kvm_pgtable.h and include the lightweight headers required for the types
>> and inline helpers used there. Additionally provide a forward
>> declaration for struct kvm_s2_mmu as it's only used as a pointer in this
>> file.
>>
>> Both pgtable.c and kvm_pkvm.h relied on the indirect inclusion of
>> kvm_host.h, so make that explicit.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> New patch in v13
> 
> Is this meant to be here (the "New in patch 13")?

Just trying to carry the legacy, but yes, you're right. I could remove
it. v13, is so ancient now :-)


> 
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers
Suzuki


> 
> Cheers,
> /fuad
> 
> 
>> ---
>>   arch/arm64/include/asm/kvm_pgtable.h | 6 +++++-
>>   arch/arm64/include/asm/kvm_pkvm.h    | 2 +-
>>   arch/arm64/kvm/hyp/pgtable.c         | 1 +
>>   3 files changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
>> index 41a8687938eb6..c2e4b29e605fc 100644
>> --- a/arch/arm64/include/asm/kvm_pgtable.h
>> +++ b/arch/arm64/include/asm/kvm_pgtable.h
>> @@ -8,9 +8,13 @@
>>   #define __ARM64_KVM_PGTABLE_H__
>>
>>   #include <linux/bits.h>
>> -#include <linux/kvm_host.h>
>> +#include <linux/kvm_types.h>
>> +#include <linux/rbtree_types.h>
>> +#include <linux/rcupdate.h>
>>   #include <linux/types.h>
>>
>> +struct kvm_s2_mmu;
>> +
>>   #define KVM_PGTABLE_FIRST_LEVEL                -1
>>   #define KVM_PGTABLE_LAST_LEVEL         3
>>
>> diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
>> index beea00e693a0a..54a618d887fa4 100644
>> --- a/arch/arm64/include/asm/kvm_pkvm.h
>> +++ b/arch/arm64/include/asm/kvm_pkvm.h
>> @@ -7,9 +7,9 @@
>>   #define __ARM64_KVM_PKVM_H__
>>
>>   #include <linux/arm_ffa.h>
>> +#include <linux/kvm_host.h>
>>   #include <linux/memblock.h>
>>   #include <linux/scatterlist.h>
>> -#include <asm/kvm_host.h>
>>   #include <asm/kvm_pgtable.h>
>>
>>   /* Maximum number of VMs that can co-exist under pKVM. */
>> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
>> index b74dd5ce1efd3..f48253b9d88b5 100644
>> --- a/arch/arm64/kvm/hyp/pgtable.c
>> +++ b/arch/arm64/kvm/hyp/pgtable.c
>> @@ -8,6 +8,7 @@
>>    */
>>
>>   #include <linux/bitfield.h>
>> +#include <linux/kvm_host.h>
>>   #include <asm/kvm_pgtable.h>
>>   #include <asm/stage2_pgtable.h>
>>
>> --
>> 2.43.0
>>


