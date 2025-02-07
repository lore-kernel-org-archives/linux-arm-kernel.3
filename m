Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397E7C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 17:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jKtJQM69Dt5xuaq0xF/wBZsN3mW1EpKKNOFTyBlI+j4=; b=ohb1XGY1sO6Pc7j4uQMQmc79Gt
	yoj+L/Scp9y/9EXiB98l1hQTujWSQnPg3m1g/Ar2GUdMLJXq7faVQeI1gZk0obN8ZpbTosL1QgG7d
	kik5B9LupP65+CYNDkPg20e/RYKmpkFw7+1sGCsj8DpjLqmuw2imSv6ALKJJswlFNpH8BZ4IweQdI
	yTmY7iEqTW+T9ZYPoY8vGMlG2WKNtia1oJadZ+NBGzBG297ZCBHhkQ/ouUorAliQ+fYCVY0yJ/I7D
	ZJqKzccG/myiT4emBoVNKpj35/MTJZtk/8odfSlzqOT5al9qb0i3am8e+sJ5KedCRyPs8Xav2V4H+
	hBwYUuxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSE5-0000000AVNU-1CTo;
	Fri, 07 Feb 2025 17:33:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRmw-0000000APZb-35cg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 17:05:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98BCF113E;
	Fri,  7 Feb 2025 09:05:32 -0800 (PST)
Received: from [10.1.26.24] (e122027.cambridge.arm.com [10.1.26.24])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B83F3F63F;
	Fri,  7 Feb 2025 09:05:05 -0800 (PST)
Message-ID: <56908846-0d8e-4d84-9c7a-61e696d40825@arm.com>
Date: Fri, 7 Feb 2025 17:05:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 25/43] arm64: Don't expose stolen time for realm guests
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
 <20241212155610.76522-26-steven.price@arm.com>
 <ae13e762-bd0d-4525-8919-f6b1bcfc8fee@redhat.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <ae13e762-bd0d-4525-8919-f6b1bcfc8fee@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_090510_817661_E0DAC876 
X-CRM114-Status: GOOD (  16.63  )
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

On 02/02/2025 02:15, Gavin Shan wrote:
> On 12/13/24 1:55 AM, Steven Price wrote:
>> It doesn't make much sense as a realm guest wouldn't want to trust the
>> host. It will also need some extra work to ensure that KVM will only
>> attempt to write into a shared memory region. So for now just disable
>> it.
>>
>> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>>   arch/arm64/kvm/arm.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>> index eff1a4ec892b..134acb4ee26f 100644
>> --- a/arch/arm64/kvm/arm.c
>> +++ b/arch/arm64/kvm/arm.c
>> @@ -432,7 +432,10 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm,
>> long ext)
>>           r = system_supports_mte();
>>           break;
>>       case KVM_CAP_STEAL_TIME:
>> -        r = kvm_arm_pvtime_supported();
>> +        if (kvm_is_realm(kvm))
>> +            r = 0;
>> +        else
>> +            r = kvm_arm_pvtime_supported();
>>           break;
> 
> kvm_vm_ioctl_check_extension() can be called on the file descriptor of
> "/dev/kvm".
> 'kvm' is NULL and kvm_is_realm() returns false, which is the missed
> corner case.

This is a general problem with checking extensions on the /dev/kvm file
descriptor. In this case the kernel does support stolen time, but it
doesn't support it with a realm guest. Because there's no context to
know whether the query is about realm guests or not there's little the
kernel can do other than report support.

This is the same situation with other extensions that are keyed off
kvm_is_realm(). I'm not sure what we can do other than say that VMMs
shouldn't do that.

Steve

>>       case KVM_CAP_ARM_EL1_32BIT:
>>           r = cpus_have_final_cap(ARM64_HAS_32BIT_EL1);
> 
> Thanks,
> Gavin
> 


