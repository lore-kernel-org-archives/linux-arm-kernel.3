Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7BDC3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 01:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8uJJOQ8lxfvmIQ5Wkp1c8cgXJ9Z8D5V6tF2OpxE4+0s=; b=g0pMmroc05iN9sdJfRpPQWVYEM
	34/ujFTVfcqsZcUoC2bPecZ5OilN9DU6rH6dMFfjg02WwIZmWSxZGY4qhYddEXw0Aq58g7MKpjmW3
	6GWpudutc1ww6Iv0lB2pLG7Gisjf14l/PQcHFSrfXdIlX5LI2faIVE8MfCAQuS0rA82fl8kplgsMp
	/fjOuKRNiwQlLDhYAqLJG/fPpMOtxjx3FocTWZCgE5MpQWAIMuutxsD8XGEtWX8cnura4yT6wrZEp
	VLse0p2snlKevTDacCmsf5iX50L69RoyU3nmkP/gbGmt0i+3RVijxrPxgpWqy5ixUIJF1pFcHIy5L
	fiARAbSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKRvw-0000000Ecz6-2Dqu;
	Thu, 29 May 2025 01:19:48 +0000
Received: from out-186.mta0.migadu.com ([2001:41d0:1004:224b::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKRtk-0000000EcQl-3dgs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 01:17:35 +0000
Message-ID: <de7bb6aa-543f-4bfa-a76c-722871a8f0f2@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748481449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8uJJOQ8lxfvmIQ5Wkp1c8cgXJ9Z8D5V6tF2OpxE4+0s=;
	b=tdjxoYDyfihDSKK53F2QPE25Xi4RHvl/i+uko67IN20AfTqw/yYy+C4v8Peh5pcKsbMf9e
	DqICBUuPyrC0fJezQDQIQzdsOdd3ikrpy93YRfZUDQu1JhzCkuUcWP61I6hCtM26xHO7VW
	nK/7rphkN1n8T56/5QltKyT5Tz/7VSE=
Date: Wed, 28 May 2025 18:17:23 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version to
 3.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org,
 linux-riscv <linux-riscv-bounces@lists.infradead.org>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
 <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
 <DA3KSSN3MJW5.2CM40VEWBWDHQ@ventanamicro.com>
 <61627296-6f94-45ea-9410-ed0ea2251870@linux.dev>
 <DA5YWWPPVCQW.22VHONAQHOCHE@ventanamicro.com>
 <20250526-224478e15ee50987124a47ac@orel>
 <ace8be22-3dba-41b0-81f0-bf6d661b4343@linux.dev>
 <20250528-ff9f6120de39c3e4eefc5365@orel>
 <1169138f-8445-4522-94dd-ad008524c600@linux.dev>
Content-Language: en-US
In-Reply-To: <1169138f-8445-4522-94dd-ad008524c600@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_181733_883972_0EEE3BB8 
X-CRM114-Status: GOOD (  37.58  )
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



On 5/28/25 12:21 PM, Atish Patra wrote:
> <Removing Palmer's rivos email address to avoid bouncing>
> 
> On 5/28/25 8:09 AM, Andrew Jones wrote:
>> On Wed, May 28, 2025 at 07:16:11AM -0700, Atish Patra wrote:
>>> On 5/26/25 4:13 AM, Andrew Jones wrote:
>>>> On Mon, May 26, 2025 at 11:00:30AM +0200, Radim Krčmář wrote:
>>>>> 2025-05-23T10:16:11-07:00, Atish Patra <atish.patra@linux.dev>:
>>>>>> On 5/23/25 6:31 AM, Radim Krčmář wrote:
>>>>>>> 2025-05-22T12:03:43-07:00, Atish Patra <atishp@rivosinc.com>:
>>>>>>>> Upgrade the SBI version to v3.0 so that corresponding features
>>>>>>>> can be enabled in the guest.
>>>>>>>>
>>>>>>>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>>>>>>>> ---
>>>>>>>> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/ 
>>>>>>>> include/asm/kvm_vcpu_sbi.h
>>>>>>>> -#define KVM_SBI_VERSION_MAJOR 2
>>>>>>>> +#define KVM_SBI_VERSION_MAJOR 3
>>>>>>> I think it's time to add versioning to KVM SBI implementation.
>>>>>>> Userspace should be able to select the desired SBI version and 
>>>>>>> KVM would
>>>>>>> tell the guest that newer features are not supported.
>>>> We need new code for this, but it's a good idea.
>>>>
>>>>>> We can achieve that through onereg interface by disabling 
>>>>>> individual SBI
>>>>>> extensions.
>>>>>> We can extend the existing onereg interface to disable a specific SBI
>>>>>> version directly
>>>>>> instead of individual ones to save those IOCTL as well.
>>>>> Yes, I am all in favor of letting userspace provide all values in the
>>>>> BASE extension.
>>> We already support vendorid/archid/impid through one reg. I think we 
>>> just
>>> need to add the SBI version support to that so that user space can 
>>> set it.
>>>
>>>> This is covered by your recent patch that provides userspace_sbi.
>>> Why do we need to invent new IOCTL for this ? Once the user space 
>>> sets the
>>> SBI version, KVM can enforce it.
>> If an SBI spec version provides an extension that can be emulated by
>> userspace, then userspace could choose to advertise that spec version,
>> implement a BASE probe function that advertises the extension, and
>> implement the extension, even if the KVM version running is older
>> and unaware of it. But, in order to do that, we need KVM to exit to
>> userspace for all unknown SBI calls and to allow BASE to be overridden
> You mean only the version field in BASE - Correct ?
> 
> We already support vendorid/archid/impid through one reg. I don't see the
> point of overriding SBI implementation ID & version.
> 
>> by userspace. The new KVM CAP ioctl allows opting into that new behavior.
> 
> But why we need a new IOCTL for that ? We can achieve that with existing
> one reg interface with improvements.
> 
>> The old KVM with new VMM configuration isn't totally far-fetched. While
>> host kernels tend to get updated regularly to include security fixes,
>> enterprise kernels tend to stop adding features at some point in order
>> to maximize stability. While enterprise VMMs would also eventually stop
>> adding features, enterprise consumers are always free to use their own
>> VMMs (at their own risk). So, there's a real chance we could have
> 
> I think we are years away from that happening (if it happens). My 
> suggestion was not to
> try to build a world where no body lives ;). When we get to that 

We also support KVM as a kernel module. So it is relatively easier to 
update the RISC-V KVM module for enterprise consumers.

> scenario, the default KVM
> shipped will have many extension implemented. So there won't be much 
> advantage to
> reimplement them in the user space. We can also take an informed 
> decision at that time
> if the current selective forwarding approach is better or we need to 
> blindly forward any
> unknown SBI calls to the user space.
> 
>> deployments with older, stable KVM where users want to enable later SBI
>> extensions, and, in some cases, that should be possible by just updating
>> the VMM -- but only if KVM is only acting as an SBI implementation
>> accelerator and not as a userspace SBI implementation gatekeeper.
> 
> But some of the SBI extensions are so fundamental that it must be 
> implemented in KVM
> for various reasons pointed by Anup on other thread.
> 
>> Thanks,
>> drew
>>
>>>> With that, userspace can disable all extensions that aren't
>>>> supported by a given spec version, disable BASE and then provide
>>>> a BASE that advertises the version it wants. The new code is needed
>>>> for extensions that userspace still wants KVM to accelerate, but then
>>>> KVM needs to be informed it should deny all functions not included in
>>>> the selected spec version.
>>>>
>>>> Thanks,
>>>> drew
>>>>
>>>> _______________________________________________
>>>> linux-riscv mailing list
>>>> linux-riscv@lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/linux-riscv


