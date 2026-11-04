Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFA6606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 10:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J5ktwkd5;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=eDsuvw7f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nssP4eGI3zXDuFonBDPkQJxTRjYQwrWbLZScwkFMK9E=; b=J5ktwkd5DGeLOe
	vqBvD7fg2icUiUQ6SoIT1jkEjL31dH5aSXW/OLbSd3e7S0Hsy0R/BZqYxHGyg3zXFxi5V2FUxYXhY
	HLVlafGOvFhWZdet1Vml4yGBorzQl41jFpkAu6Cktc64fYtPrCmanC6eCOYCmUIzBGZm9npQk2dR+
	WEpWx7ezlfcSGCsy71tOP1L7i+7J2gxlRQkBkQjUNfxrpxX9xAGbXnTG2rFlOd33XIbJEqSIIbfef
	Z/Z5UldGnCT4D3qnpkm1NtRWZT6/NNJpsB6u7+1Lac6fMWW3SpA+rb4X5M2EfOMxGk30/PsNVWQmi
	Viq5pUdulD59P9Y1KQPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYOr-000000051E6-3xJJ;
	Wed, 04 Nov 2026 10:39:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYOp-000000051Dk-3wPJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 10:39:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 272AB1650;
	Wed,  4 Nov 2026 02:39:17 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2AE4E3F628;
	Wed,  4 Nov 2026 02:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793788760; bh=uv4Nu83ZWi1bXtWcHnSpsPJ7BG6d6N7mX+McDBYbtuY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eDsuvw7fRB91gXRC27O09DhHBx6xx9ag5Cesox1gcq2YZ8yZGORGZhEXCRlb3OFoZ
	 KitHx/tyq6HfjbQo7e/ec30gUCsMaQyAysA2e+QxXv2XSRh9Vp6SgUEQspDGAzk4lq
	 ZH24ZRdFSyXCgXan1tWqS7NumGlOoCyoWJYBzQhk=
Message-ID: <415f6a96-9ac2-4256-a9b9-e976bd0e73a8@arm.com>
Date: Wed, 4 Nov 2026 10:39:15 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] KVM: arm64: CCA: Check for RMI support at KVM init
To: Kohei Enju <enju.kohei@fujitsu.com>, Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
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
References: <20261102141304.126883-1-steven.price@arm.com>
 <20261102141304.126883-4-steven.price@arm.com>
 <ausEnXB1TE_moI0E@FCCLS0092175.localdomain>
 <ausIgejq7Io9VjZL@FCCLS0092175.localdomain>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <ausIgejq7Io9VjZL@FCCLS0092175.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_023924_103794_F3F123AA 
X-CRM114-Status: GOOD (  15.22  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Kohei

On 04/11/2026 10:27, Kohei Enju wrote:
> On 11/04 19:23, Kohei Enju wrote:
>> Hi Steven,
>>
>> On 11/02 14:12, Steven Price wrote:
>>> Check if the RMI support is sufficient for using in KVM. Specifically, we
>>> will only support creating realm VMs when KVM is set to 'rmm' mode.
>>>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>> ---
>>>   arch/arm64/kvm/Kconfig | 1 +
>>>   arch/arm64/kvm/rmi.c   | 4 +++-
>>>   2 files changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
>>> index cecea0820e52..d067063a3686 100644
>>> --- a/arch/arm64/kvm/Kconfig
>>> +++ b/arch/arm64/kvm/Kconfig
>>> @@ -34,6 +34,7 @@ menuconfig KVM
>>>   	select GUEST_PERF_EVENTS if PERF_EVENTS
>>>   	select KVM_GUEST_MEMFD
>>>   	select KVM_GENERIC_PRE_FAULT_MEMORY
>>> +	select ARM_RMM_RMI
>>>   	help
>>>   	  Support hosting virtualized guest machines.
>>>   
>>> diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
>>> index 5ecc8b349869..9d118768550d 100644
>>> --- a/arch/arm64/kvm/rmi.c
>>> +++ b/arch/arm64/kvm/rmi.c
>>> @@ -3,6 +3,7 @@
>>>    * Copyright (C) 2023-2026 ARM Ltd.
>>>    */
>>>   
>>> +#include <linux/arm-rmi-cmds.h>
>>>   #include <linux/kvm_host.h>
>>>   
>>>   #include <asm/virt.h>
>>> @@ -12,7 +13,8 @@ void kvm_init_rmi(void)
>>>   	if (kvm_get_mode() != KVM_MODE_RMM)
>>>   		return;
>>>   
>>> -	/* TODO: Check if the RMI is available */
>>> +	if (!is_rmi_available())
>>> +		return;
>>
>>  From an admin/operator's perspective, kvm_rmi_is_available would
>> silently remain FALSE in either of the following cases:
>> - kvm-arm.mode=rmm is set, but RMI is not available for some reason.

We could add a kvm_info() message for this.

>> - RMI is available, but the admin forgot to set kvm-arm.mode=rmm.

But not this one. We are additionally planning to move the RMM
activation to gate on kvm-arm.mode=rmm. I will send out a patch
soon.

Cheers
Suzuki



