Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD3DC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 15:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U5FMAtU6uZKy9691HaUsR2MdNjJRe7xHfCwBWSeowO8=; b=EWcdC/fpRyuboYGy6Kqs27UIuL
	rUWNPZaBk7cZrDXOM9rhssMgrwUiiLVBXvAY/Ot4Fd5pBzMdtH5FqLlK663tEdVtD66SSUwiizsSt
	55H6RJk1xntkKmtgLejznTw0rLJTWCRV4DC4rBBGSez0fnRSMLqhqIVHY/OK/GhYTJsexcV3GaP5x
	ItduQQyCYdKtfVe8uygP/koUWh2kxgZJlbiREZ6ZWS1JT3j3BpdWInGFg2MUE7rSh3xmeFDkX0ZGA
	Qf7MiJ5e+fkoM8Hq5NZY/n1KXUVpCWxiD33biKdDJEAi+Z4+HZ96gbE2UN3O6wLkgxkdDAXHY2Sej
	HU56bkRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td9wt-00000007Eep-2dYF;
	Wed, 29 Jan 2025 15:25:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td9vZ-00000007EY0-1pWH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 15:24:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E18C497;
	Wed, 29 Jan 2025 07:24:52 -0800 (PST)
Received: from [10.57.77.31] (unknown [10.57.77.31])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 336153F63F;
	Wed, 29 Jan 2025 07:24:22 -0800 (PST)
Message-ID: <c4c5bb64-bbbc-48d4-9569-c6a55e6edfb4@arm.com>
Date: Wed, 29 Jan 2025 15:24:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/43] arm64: RME: Check for RME support at KVM init
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
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
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20241212155610.76522-1-steven.price@arm.com>
 <20241212155610.76522-7-steven.price@arm.com>
 <7271b3ff-8665-4a98-b3dd-77417f85d5e3@redhat.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <7271b3ff-8665-4a98-b3dd-77417f85d5e3@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_072429_563093_5BD0BA14 
X-CRM114-Status: GOOD (  22.63  )
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

On 29/01/2025 03:57, Gavin Shan wrote:
> On 12/13/24 1:55 AM, Steven Price wrote:
>> Query the RMI version number and check if it is a compatible version. A
>> static key is also provided to signal that a supported RMM is available.
>>
>> Functions are provided to query if a VM or VCPU is a realm (or rec)
>> which currently will always return false.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> Changes since v5:
>>   * Reword "unsupported" message from "host supports" to "we want" to
>>     clarify that 'we' are the 'host'.
>> Changes since v2:
>>   * Drop return value from kvm_init_rme(), it was always 0.
>>   * Rely on the RMM return value to identify whether the RSI ABI is
>>     compatible.
>> ---
>>   arch/arm64/include/asm/kvm_emulate.h | 18 +++++++++
>>   arch/arm64/include/asm/kvm_host.h    |  4 ++
>>   arch/arm64/include/asm/kvm_rme.h     | 56 ++++++++++++++++++++++++++++
>>   arch/arm64/include/asm/virt.h        |  1 +
>>   arch/arm64/kvm/Makefile              |  3 +-
>>   arch/arm64/kvm/arm.c                 |  6 +++
>>   arch/arm64/kvm/rme.c                 | 50 +++++++++++++++++++++++++
>>   7 files changed, 137 insertions(+), 1 deletion(-)
>>   create mode 100644 arch/arm64/include/asm/kvm_rme.h
>>   create mode 100644 arch/arm64/kvm/rme.c
>>
> 
> [...]
> 
>> +
>> +static inline bool kvm_is_realm(struct kvm *kvm)
>> +{
>> +    if (static_branch_unlikely(&kvm_rme_is_available) && kvm)
>> +        return kvm->arch.is_realm;
>> +    return false;
>> +}
>> +
> 
> kvm->arch.is_realm won't be true when kvm_rme_is_available is false.
> It's set
> in kvm_arch_init_vm() of PATCH[10]. So it's safe to be simplified as
> below if
> the changes to kvm_arch_init_vm() is slightly modified, more details can be
> found from the comments to PATCH[10]
> 
> With the changes, we don't have to check kvm_rme_is_available every time.

This is true, however, kvm_rme_is_available is a static key, which means
that the kernel uses runtime patching to change the value. So by
checking kvm_rme_is_available this check is short-circuited and there's
no (data) memory access.

I have to admit I've no idea whether this actually makes any practical
difference to any benchmark but the intention was to have the minimum
possible overhead on systems which don't have the RME hardware.

Steve

> static inline bool kvm_is_realm(struct kvm *kvm)
> {
>     return (kvm && kvm->arch.is_realm);
> }
> 
> Thanks,
> Gavin
> 


