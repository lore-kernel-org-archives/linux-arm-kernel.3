Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91431109023F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 15:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kdIXh9/KlxTSjE6LuBpFumfCtDJshMgu0zl78RY8MjI=; b=1p+kLhVOXqbGU2KaBYypLHmYhx
	E8yuwB6nJGcr/LKq5PlilBb0HHR/5w5u7iXYl3V5ueDeC8pKY1if/Ma9GsObOrsbYIsTTHMDVnNVP
	l4VaN7bMjeqxRL1O41xein+1yQqfX3r8AH+V2mTUUWUidKExDmngf1N5mW8eauPDZ/O62gFXB5N8i
	HRW/Fi1z16RQkMvpMw7PSxQXhlIQf8F4xkvFNUZfWfAFAh72Y3mqzzFrYcEhSl4AGy0Tqe9qD4qnJ
	aZbG58hf0R/GotNdDDlvDMQtct7PfI7A5Ff07CB0v00anZXcoSTaOZsfrlf39W5CY6DuPL0XpkRy7
	6rcQ9hJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3FFL-0000000AucY-0fa9;
	Thu, 19 Mar 2026 15:25:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3FFJ-0000000Aubq-0rDW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 15:25:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C3161A25;
	Thu, 19 Mar 2026 08:25:06 -0700 (PDT)
Received: from [10.1.35.24] (e122027.cambridge.arm.com [10.1.35.24])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8108A3F778;
	Thu, 19 Mar 2026 08:25:08 -0700 (PDT)
Message-ID: <3e917733-0272-4f2c-aa10-36364604fcbd@arm.com>
Date: Thu, 19 Mar 2026 15:25:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 13/48] kvm: arm64: Don't expose unsupported
 capabilities for realm guests
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>
References: <20260318155413.793430-1-steven.price@arm.com>
 <20260318155413.793430-14-steven.price@arm.com>
 <56fb42ad-eada-40df-8c81-53cb7c0c310e@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <56fb42ad-eada-40df-8c81-53cb7c0c310e@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_082513_358505_D36E38F5 
X-CRM114-Status: GOOD (  15.98  )
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

On 19/03/2026 14:09, Suzuki K Poulose wrote:
> On 18/03/2026 15:53, Steven Price wrote:
>> From: Suzuki K Poulose <suzuki.poulose@arm.com>
>>
>> RMM v1.0 provides no mechanism for the host to perform debug operations
>> on the guest. So limit the extensions that are visible to an allowlist
>> so that only those capabilities we can support are advertised.
>>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> Changes since v10:
>>   * Add a kvm_realm_ext_allowed() function which limits which extensions
>>     are exposed to an allowlist. This removes the need for special casing
>>     various extensions.
>> Changes since v7:
>>   * Remove the helper functions and inline the kvm_is_realm() check with
>>     a ternary operator.
>>   * Rewrite the commit message to explain this patch.
>> ---
>>   arch/arm64/kvm/arm.c | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>> index 9b17bdfaf0c2..ddbf080e4f55 100644
>> --- a/arch/arm64/kvm/arm.c
>> +++ b/arch/arm64/kvm/arm.c
>> @@ -357,6 +357,25 @@ static bool kvm_has_full_ptr_auth(void)
>>           (apa + api + apa3) == 1);
>>   }
>>   +static bool kvm_realm_ext_allowed(long ext)
>> +{
>> +    switch (ext) {
>> +    case KVM_CAP_IRQCHIP:
>> +    case KVM_CAP_ARM_PSCI:
>> +    case KVM_CAP_ARM_PSCI_0_2:
>> +    case KVM_CAP_NR_VCPUS:
>> +    case KVM_CAP_MAX_VCPUS:
>> +    case KVM_CAP_MAX_VCPU_ID:
>> +    case KVM_CAP_MSI_DEVID:
>> +    case KVM_CAP_ARM_VM_IPA_SIZE:
>> +    case KVM_CAP_ARM_PTRAUTH_ADDRESS:
>> +    case KVM_CAP_ARM_PTRAUTH_GENERIC:
>> +    case KVM_CAP_ARM_RMI:
>> +        return true;
>> +    }
>> +    return false;
>> +}
>> +
>>   int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>>   {
>>       int r;
>> @@ -364,6 +383,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm,
>> long ext)
>>       if (is_protected_kvm_enabled() && !kvm_pkvm_ext_allowed(kvm, ext))
>>           return 0;
>>   +    if (kvm && kvm_is_realm(kvm) && !kvm_realm_ext_allowed(ext))
>> +        return 0;
>> +
> 
> We need a similar check in in kvm_vm_ioctl_enable_cap() to prevent
> enabling the filtered caps ? Otherwise looks good to me.

Indeed - thanks for spotting.

Thanks,
Steve

> Suzuki
> 
>>       switch (ext) {
>>       case KVM_CAP_IRQCHIP:
>>           r = vgic_present;
> 


