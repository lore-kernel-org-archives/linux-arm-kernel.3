Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1336FC5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 10:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xie2gTSahw4aUuUE6gmFHlDvykYcFXZMpNQiTAD4xCE=; b=MrkujKniub9S7z0R+s1ffyiplf
	BiCThFtxui3KXnPKE5ol8bqQ5c2Jk/ERWHNSjayPkkkjN5teGyhHM1feF90mu01T6uip+1N7TYRMY
	PCXyepNRM+RcN3Fe0RAq1+tJURT8u59WQX8jpH8+FlO1VLJfdRWCQRPCCuVJRuKn404vjcWt7Gz0L
	qJWzodm6s4iYQs0RLkr2TD2kVqB4FzxhDNHB6z7rVow/oLk+1OgR3bKMvQLoRxhTU+VGirNt7Snyw
	GHPFqXIGp0a4Q/VmHoLl5iO3N7yCbB+7wc5cWhJgOrVFAavNjS+mbuEcCH1LHpIFtRhl8lmfmPJpr
	J2lc+unA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHZG-00000007b0d-3g6K;
	Fri, 07 Aug 2026 10:12:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHZF-00000007azr-00uG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 10:12:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B8FB1516;
	Fri,  7 Aug 2026 03:12:37 -0700 (PDT)
Received: from [10.57.40.157] (unknown [10.57.40.157])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 389683F9A2;
	Fri,  7 Aug 2026 03:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786097561; bh=RCjEnEVGvnPhNyVz+L0gppAUU0iJNEMsCr6Uit3ezoM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RxcFF9v8HQg/UXJUre/Po0mVBjk1Q+BuwXj0dOswBiiMFJKfkVMFZdDGim2VLPy7O
	 yWZcoh7+WGEY+nwEVOJP8ugA5VfOQPBj/xE8od5N9Qzs5CYocAPEZN+wTd4Smy6xHC
	 xPZb4plN5N3J556tMiN/owCKTPJWfiLp3i/UUA5U=
Message-ID: <92b81b5a-933b-4b4f-b889-7f9ec68d53a5@arm.com>
Date: Fri, 7 Aug 2026 11:12:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 24/45] KVM: arm64: Expose support for private memory
Content-Language: en-GB
To: Ackerley Tng <ackerleytng@google.com>, Steven Price
 <steven.price@arm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
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
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
References: <20260803134403.80630-1-steven.price@arm.com>
 <20260803134403.80630-25-steven.price@arm.com>
 <CAEvNRgE5O4FcNQDHwh+DWsHH7gLs3qzm+L4ZQ9FHkt=WoTV2Hw@mail.gmail.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <CAEvNRgE5O4FcNQDHwh+DWsHH7gLs3qzm+L4ZQ9FHkt=WoTV2Hw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_031245_155351_696D6DC0 
X-CRM114-Status: UNSURE (   9.10  )
X-CRM114-Notice: Please train this message.
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

On 05/08/2026 17:02, Ackerley Tng wrote:
> Steven Price <steven.price@arm.com> writes:
> 
>> Select KVM_GENERIC_MEMORY_ATTRIBUTES and provide the necessary support
>> functions.
>>
>> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> Changes since v14:
>>   * Switch to guest_memfd in-place memory conversion and drop support
>>     for KVM_VM_MEMORY_ATTRIBUTES.
>>
>> [...snip...]
>>
>> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
>> index 15d42d1993bb..146c52f867c0 100644
>> --- a/arch/arm64/include/asm/kvm_host.h
>> +++ b/arch/arm64/include/asm/kvm_host.h
>> @@ -1510,6 +1510,8 @@ struct kvm *kvm_arch_alloc_vm(void);
>>
>>   #define vcpu_is_protected(vcpu)		kvm_vm_is_protected((vcpu)->kvm)
>>
>> +#define kvm_arch_has_private_mem(kvm) ((kvm)->arch.is_realm)
>> +
> 
> Perhaps related to Fuad's question about pKVM and CCA state: would
> conditioning this on is_realm mess up pKVM?

Not really. The comment is about unifiying the conditions which
both pKVM and Realm selects. Right now, only CCA uses guest_memfd.
When pkvm comes along to use guest_memfd, this could be something
like:

kvm->arch.needs_private_mem  (set by both pKVM and Realm) ?

Cheers
Suzuki


> 
>>   int kvm_arm_vcpu_finalize(struct kvm_vcpu *vcpu, int feature);
>>   bool kvm_arm_vcpu_is_finalized(struct kvm_vcpu *vcpu);
>>
>> --
>> 2.43.0


