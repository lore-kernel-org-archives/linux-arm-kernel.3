Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3D7F459EE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 15:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bw38PnBdSNXhdJyIevgOHCVVA6X7oz8sPdt2169neKA=; b=iiOqDwt947BLp2jJO9Lg4mPyIP
	dyxvMedJOOhxctmIFS0CeChwdS1NlHfuo7x8F14anwm+G9vhYouf/b30VOXcXCyuX4fSsps1w5cm7
	EcUJ6/27RU0rChjZXURJlON6K3XP/CkHzeB4EX1UMsbi8LkDe3KhkFyoX7ou5UNLIw7pq4lZcLHYC
	fjpvDVXtpIuAhD1JIGUClepQwaYXQtxdEtiK2v85YBaMGn6wLOoRUqlrpRjHf22ui6kHh/KM5rwF+
	wfjprFzYEwRmCDCocwtCI2MKAg1+cxRW1YycSjW37KcIl/qz64UKi1LVSwNAAXM6diRghzEkP3UR7
	sZyfuKRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBDXD-0000000CQaE-3KWD;
	Fri, 10 Apr 2026 15:12:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBDXB-0000000CQZ3-2lto
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 15:12:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F5564765;
	Fri, 10 Apr 2026 08:12:29 -0700 (PDT)
Received: from [10.1.29.18] (e122027.cambridge.arm.com [10.1.29.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 384E23FAA1;
	Fri, 10 Apr 2026 08:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775833955; bh=tUJIj0Hyp53sZYA/2hZAp5bB68EFisIzjC9uDA35L50=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FpNkfiJkuQ26Zy//0xfa9SbJWVQySMYuazfVL+O2kgLpv4D91gcjwg3jB1uvs7Tag
	 z7b6MNriYmZoeNZ0OzblQzcZ2dUry4sFGWIWLeAd8BoxXGRVdm8OB7UWlunFaHJcXJ
	 ZMb61s+59TcJ1gR1Yu5YpeiO9+Ua/aMPitZyDSOE=
Message-ID: <7481c2ec-7fea-4606-adc4-4e09b82fc10e@arm.com>
Date: Fri, 10 Apr 2026 16:12:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 46/48] KVM: arm64: Expose KVM_ARM_VCPU_REC to user
 space
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
 <20260318155413.793430-47-steven.price@arm.com>
 <79564d59-032e-40c9-b4eb-f79f805b8238@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <79564d59-032e-40c9-b4eb-f79f805b8238@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_081237_738182_AC4A0154 
X-CRM114-Status: GOOD (  12.20  )
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

On 19/03/2026 17:36, Suzuki K Poulose wrote:
> On 18/03/2026 15:54, Steven Price wrote:
>> Increment KVM_VCPU_MAX_FEATURES to expose the new capability to user
>> space.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
> 
> Not needed any more as we don't need the VCPU feature.

This patch caused so much bother with rebasing in the past, I'd
completely forgotten it isn't actually needed! Thanks for spotting!

Thanks,
Steve

> Cheers
> Suzuki
> 
> 
> 
>> ---
>> Changes since v8:
>>   * Since NV is now merged and enabled, this no longer conflicts with it.
>> ---
>>   arch/arm64/include/asm/kvm_host.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/
>> asm/kvm_host.h
>> index 1d5fb001408c..b02f97de4436 100644
>> --- a/arch/arm64/include/asm/kvm_host.h
>> +++ b/arch/arm64/include/asm/kvm_host.h
>> @@ -40,7 +40,7 @@
>>     #define KVM_MAX_VCPUS VGIC_V3_MAX_CPUS
>>   -#define KVM_VCPU_MAX_FEATURES 9
>> +#define KVM_VCPU_MAX_FEATURES 10
>>   #define KVM_VCPU_VALID_FEATURES    (BIT(KVM_VCPU_MAX_FEATURES) - 1)
>>     #define KVM_REQ_SLEEP \
> 


