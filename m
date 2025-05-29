Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AECCDC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 18:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D/pRYWDTxiG5vCNFI6iYMlgTAzPGEOIy86Z1rIh0MtM=; b=dF3etldCZL7fL0q8lnlSbDkQ3S
	iDV3Ss02LwUVRzw4pMcrHDBeMN6wHHZwKTyrXpuparYcyHh26Hyrfawa0Nt6GxP+8MVdb6c2tE+XR
	+ESpKy8uhn/RYFD6ANWxHYMa1wjwnxoLW2qniqcVHaOfDxM7MUuYKHcEXrnN6mn9rZBxS+MLJIIDE
	Y4Ac5QkHlCQJgTZGqdq8ov7bIa4REFe6ODBEKTrF9W+pK6UjIa9p9Oj14uHI5d0Qn/hiqk07DOWsv
	sfMLqMf9koekjP80T1Y4ah2wG2/AJ52y0QF1zJdQH7VlaZ4WyoZsOFh7c+SN13t4NskBppwLg9Uyf
	2N2n/0hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKiHV-0000000GO1f-3klR;
	Thu, 29 May 2025 18:47:09 +0000
Received: from out-184.mta0.migadu.com ([2001:41d0:1004:224b::b8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKiFN-0000000GNsG-3miv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 18:44:59 +0000
Message-ID: <2bac252c-883c-4f8a-9ae1-283660991520@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748544285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D/pRYWDTxiG5vCNFI6iYMlgTAzPGEOIy86Z1rIh0MtM=;
	b=t6mBC+6Vi9P2ogn7IGSjVpOGG1D0PLvPIsnclmwguKD8GZzY2EEBw/0/oi4M/Egs3o+WNK
	HH1NOZh09QJrVEtpDa095Akv9MrBQAzRDOB0r2l/HaMNV1G8fR9FrQ3JwJG9336cGDa+IH
	hJYSzpx0d4G0hPc4CWp7pb1SJGYRCiM=
Date: Thu, 29 May 2025 11:44:38 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version to
 3.0
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
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
 <DA8KL716NTCA.2QJX4EW2OI6AL@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <DA8KL716NTCA.2QJX4EW2OI6AL@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_114458_077897_8A9A8C14 
X-CRM114-Status: GOOD (  42.56  )
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


On 5/29/25 3:24 AM, Radim Krčmář wrote:
> I originally gave up on the idea, but I feel kinda bad for Drew now, so
> trying again:

I am sorry if some of my replies came across in the wrong way. That was 
never
the intention.


> 2025-05-28T12:21:59-07:00, Atish Patra <atish.patra@linux.dev>:
>> On 5/28/25 8:09 AM, Andrew Jones wrote:
>>> On Wed, May 28, 2025 at 07:16:11AM -0700, Atish Patra wrote:
>>>> On 5/26/25 4:13 AM, Andrew Jones wrote:
>>>>> On Mon, May 26, 2025 at 11:00:30AM +0200, Radim Krčmář wrote:
>>>>>> 2025-05-23T10:16:11-07:00, Atish Patra <atish.patra@linux.dev>:
>>>>>>> On 5/23/25 6:31 AM, Radim Krčmář wrote:
>>>>>>>> 2025-05-22T12:03:43-07:00, Atish Patra <atishp@rivosinc.com>:
>>>>>>>>> Upgrade the SBI version to v3.0 so that corresponding features
>>>>>>>>> can be enabled in the guest.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>>>>>>>>> ---
>>>>>>>>> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
>>>>>>>>> -#define KVM_SBI_VERSION_MAJOR 2
>>>>>>>>> +#define KVM_SBI_VERSION_MAJOR 3
>>>>>>>> I think it's time to add versioning to KVM SBI implementation.
>>>>>>>> Userspace should be able to select the desired SBI version and KVM would
>>>>>>>> tell the guest that newer features are not supported.
>>>>> We need new code for this, but it's a good idea.
>>>>>
>>>>>>> We can achieve that through onereg interface by disabling individual SBI
>>>>>>> extensions.
>>>>>>> We can extend the existing onereg interface to disable a specific SBI
>>>>>>> version directly
>>>>>>> instead of individual ones to save those IOCTL as well.
>>>>>> Yes, I am all in favor of letting userspace provide all values in the
>>>>>> BASE extension.
>>>> We already support vendorid/archid/impid through one reg. I think we just
>>>> need to add the SBI version support to that so that user space can set it.
>>>>
>>>>> This is covered by your recent patch that provides userspace_sbi.
>>>> Why do we need to invent new IOCTL for this ? Once the user space sets the
>>>> SBI version, KVM can enforce it.
>>> If an SBI spec version provides an extension that can be emulated by
>>> userspace, then userspace could choose to advertise that spec version,
>>> implement a BASE probe function that advertises the extension, and
>>> implement the extension, even if the KVM version running is older
>>> and unaware of it. But, in order to do that, we need KVM to exit to
>>> userspace for all unknown SBI calls and to allow BASE to be overridden
>> You mean only the version field in BASE - Correct ?
> No, "BASE probe function" is the sbi_probe_extension() ecall.
>
>>> by userspace. The new KVM CAP ioctl allows opting into that new behavior.
>> But why we need a new IOCTL for that ? We can achieve that with existing
>> one reg interface with improvements.
> It's an existing IOCTL with a new data payload, but I can easily use
> ONE_REG if you want to do everything through that.
>
> KVM doesn't really need any other IOCTL than ONE_REGs, it's just
> sometimes more reasonable to use a different IOCTL, like ENABLE_CAP.
>
>>> The old KVM with new VMM configuration isn't totally far-fetched. While
>>> host kernels tend to get updated regularly to include security fixes,
>>> enterprise kernels tend to stop adding features at some point in order
>>> to maximize stability. While enterprise VMMs would also eventually stop
>>> adding features, enterprise consumers are always free to use their own
>>> VMMs (at their own risk). So, there's a real chance we could have
>> I think we are years away from that happening (if it happens). My
>> suggestion was not to
>> try to build a world where no body lives ;). When we get to that
>> scenario, the default KVM
>> shipped will have many extension implemented. So there won't be much
>> advantage to
>> reimplement them in the user space. We can also take an informed
>> decision at that time
>> if the current selective forwarding approach is better
> Please don't repeat the design of SUSP/SRST/DBCN.
> Seeing them is one of the reasons why I proposed the new interface.
>
> "Blindly" forwarding DBCN to userspace is even a minor optimization. :)
>
>>                                                         or we need to
>> blindly forward any
>> unknown SBI calls to the user space.
> Yes, KVM has to do what userpace configures it to do.
>
> I don't think that implementing unsupported SBI extensions in KVM is
> important -- they should not be a hot path.
>
>>> deployments with older, stable KVM where users want to enable later SBI
>>> extensions, and, in some cases, that should be possible by just updating
>>> the VMM -- but only if KVM is only acting as an SBI implementation
>>> accelerator and not as a userspace SBI implementation gatekeeper.
>> But some of the SBI extensions are so fundamental that it must be
>> implemented in KVM
>> for various reasons pointed by Anup on other thread.
> No, SBI does not have to be implemented in KVM at all.
>
> We do have a deep disagreement on what is virtualization and the role of
> KVM in it.  I think that userspace wants a generic ISA accelerator.

I think the disagreement is the role of SBI in KVM virtualization rather 
than
a generic virtualization and the role of KVM in it. I completely agree 
that KVM should act as an accelerator and defer the control to the user 
space in most of the cases
such e.g I/O operations or system related functionalities. However, SBI 
specification solves
much wider problems than those. Broadly we can categorize SBI 
functionalities into the following
areas

1. Bridging ISA GAP
2. Higher Privilege Assistance
3. Virtualization
4. Platform abstraction
5. Confidential computing

For #1, #3 and #5, I believe user space shouldn't be involved in 
implementation
some of them are in hot path as well. For #4 and #2, there are some 
opportunities which
can be implemented in user space depending on the exact need. I am still 
not clear what is the exact
motivation /right now/ to pursue such a path. May be I missed something.
As per my understanding from our discussion threads, there are two use 
cases possible

1. userspace wants to update more states in HSM. What are the states 
user space should care about scounteren (fixed already in usptream) ?
2. VMM vs KVM version difference - this may be true in the future 
depending on the speed of RISC-V virtualization adoption in the industry.
But we are definitely not there yet. Please let me know if I 
misunderstood any use cases.

> Even if userspace wants SBI for the M-mode interface, security minded
This is probably a 3rd one ? Why we want M-mode interface in the user 
space ?
> userspace aims for as little kernel code as possible.

We trust VMM code more than KVM code ?

> Userspace might want to accelerate some SBI extension in KVM, but it
> should not be KVM who decides what userspace wants.

