Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C050C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 00:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8MZYMhTjyXQwSFJY/e0Bg+aJ/DYLC4LmKmte6yFXBpM=; b=C7bfeLbo87Wou56DJXhc8LA1xW
	2q+Wo1hDkqcczRc3f9VFf3YoP5gxK+l1xzBKC//ZRc4aFdyhr53GSpgVZ9UqA9Q3fYTHKIJG6f24X
	0709xrquEEneG2KfHkdmozS6vDiqeyOc0Ny8gMSvuqLKGnVrTuf8Di9fX+Vx8T7JyoF44r5HUftTK
	NaiIyzENUmhR12dVD+T2MCUcw2+YlSSyd0sF5Pf/Rp4SR29xvQEQAMrd0n0imtV2b70qQhOIe9cVb
	E8hFTiMjSrvR876aakzyOR4CobJzgopYVxVc4uObMclL63FBUuczGQ+mZCWXmzSOimWE8IzIcKmI7
	Nk517Z5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMc3V-0000000C4PI-2RG4;
	Wed, 04 Jun 2025 00:32:33 +0000
Received: from out-173.mta0.migadu.com ([91.218.175.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMc1I-0000000C4Ep-18eF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 00:30:17 +0000
Message-ID: <6138a043-5b5b-46af-ba8b-01dac55dee23@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748997001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8MZYMhTjyXQwSFJY/e0Bg+aJ/DYLC4LmKmte6yFXBpM=;
	b=WEPUnmjl01eoxpfj2bo/wjnCnhorQhBLZ1U6kM9OBHA8kNJHz74sZvC5bbf9Xq5wG8FEwv
	2RVwYAOiBOU0zVcu1kuuJpmJnm5Ki55YySE0AfXWX4gcRbFoRZDZsm2tjcyYXSTjjwAR5F
	F+e/j1567odazU5Fm1OHqh6K6+KqGGI=
Date: Tue, 3 Jun 2025 17:29:55 -0700
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
 <2bac252c-883c-4f8a-9ae1-283660991520@linux.dev>
 <DA9G60UI0ZLC.1KIWBXCTX0427@ventanamicro.com>
 <0dcd01cd-419f-4225-b22c-cbaf82718235@linux.dev>
 <DACVBRLJ5MMV.1COZ83HBMUD6A@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <DACVBRLJ5MMV.1COZ83HBMUD6A@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_173016_602231_23379C61 
X-CRM114-Status: GOOD (  26.13  )
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


On 6/3/25 4:40 AM, Radim Krčmář wrote:
> 2025-05-30T12:29:30-07:00, Atish Patra <atish.patra@linux.dev>:
>> On 5/30/25 4:09 AM, Radim Krčmář wrote:
>>> 2025-05-29T11:44:38-07:00, Atish Patra <atish.patra@linux.dev>:
>>>> On 5/29/25 3:24 AM, Radim Krčmář wrote:
>>>>> I originally gave up on the idea, but I feel kinda bad for Drew now, so
>>>>> trying again:
>>>> I am sorry if some of my replies came across in the wrong way. That was
>>>> never
>>>> the intention.
>>> I didn't mean to accuse you, my apologies.  I agree with Drew's
>>> positions, so to expand on a question that wasn't touched in his mail:
>>>
>>>>> Even if userspace wants SBI for the M-mode interface, security minded
>>>> This is probably a 3rd one ? Why we want M-mode interface in the user
>>>> space ?
>>> It is about turning KVM into an ISA accelerator.
>>>
>>> A guest thinks it is running in S/HS-mode.
>>> The ecall instruction traps to M-mode.  RISC-V H extension doesn't
>>> accelerate M-mode, so we have to emulate the trap in software.
>> We don't need to accelerate M-mode. That's the beauty of the RISC-V H
>> extension.
> (It is a gap to me. :])
RISC-V H extension is designed to virtualize S-mode and U-mode. Not M-mode.
I don't think retrofitting M-mode virtualization has absolutely any 
benefit. It has
many challenges that will probably result in poor performance. It can be 
a hobby project
but I am not sure if it can be adopted in production.

Are there any similar use cases in other ISAs ? Does anybody support 
virtualizaing EL3 in ARM64 ?

>> The ISA is designed in such a way that the SBI is the interface between
>> the supervisor environment (VS/HS)
>> and the supervisor execution environment (HS/M).
> The ISA says nothing about the implementation of said interface.
>
> Returning 42 in x21 as a response to an ecall with 0x10 in a7 and 0x3 in
> a6 is perfectly valid RISC-V implementation that KVM currently cannot
> virtualize.

If the concern is only supporting an older version of SBI version, we 
can support that with onereg
interface today. I think I already agreed on that earlier in this thread 
and revise this series to have
it ready for review.


>>> The ISA doesn't say that M-mode means SBI.  We try really hard to have
>>> SBI on all RISC-V, but I think KVM is taking it a bit too far.
>>>
>>> We can discuss how best to describe SBI, so userspace can choose to
>>> accelerate the M-mode in KVM, but I think that the ability to emulate
>>> M-mode in userspace should be provided.
>> I am still trying to understand the advantages of emulating the M-mode
>> in the user space.
>> Can you please elaborate ?
> This thread already has a lot of them, so to avoid repeating them, I
> have to go into quite niche use-cases:
> When developing M-mode software on RISC-V (when RISC-V has more useful
> implementations than QEMU), a developer might want to accelerate the
> S/U-modes in KVM.
> It is also simpler to implement an old SBI interface (especially with
> bugs/quirks) if virtualization just executes the old M-mode binary.
>
> Why must KVM prevent userspace from virtualizing RISC-V?

If there is a valid use case that can be put into production or
if you have any prototype that it has better performance then we can 
have it.
In absence of either, isn't it better to spend our energy on things that 
actually matter
right now and improve RISC-V virtualization performance rather than 
something that
may or may not be possible in the very far future.

>> I am assuming you are not hinting Nested virtualization which can be
>> achieved with existing
>> ISA provided mechanisms and accelerated by SBI NACL.
> Right, I am talking about virtualization of RISC-V, because I don't have
> a crystal ball to figure out what users will want.

