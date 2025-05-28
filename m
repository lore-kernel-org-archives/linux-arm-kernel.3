Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B5AC3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 14:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c5mLYhkH15cgSjxuuv6l4kYe/fzzBQUwpR9u2pfZOy8=; b=O6gx83gR+N1n/06hlbmv0oc8oP
	4Fgm1IREHvjmFYBSsc3ceZi1FrKf7mbl6FEjqP3t6jQhi6piONqYHuk/1YJACYhYPTI/N4Oq4cSBp
	RhoRmxqRlEyxMf5sTwRiYajSReqZzVWpCX8a6OXT+AVo7hc8fwxhJ/rqMNhEB4gNl0jcH+Zs5Ppyp
	m8ankxEMKtJj3+UXGEd3Vh5HP/V6eT78BStcoiKMffZO/PxdyjtYHlD/Xrnx9BEGrYvYKWlTMhzt1
	N6n3KovDruO5Sh27/WvMF/pevHXbSHfY9Drq06oPCmTMua1qXbXNH6iOrWLTkjZIGBnQw+jUfx7Qt
	qGt4pjbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHlt-0000000DOwI-47fR;
	Wed, 28 May 2025 14:28:46 +0000
Received: from out-189.mta0.migadu.com ([91.218.175.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHZw-0000000DLdR-18sG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 14:16:26 +0000
Message-ID: <ace8be22-3dba-41b0-81f0-bf6d661b4343@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748441779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c5mLYhkH15cgSjxuuv6l4kYe/fzzBQUwpR9u2pfZOy8=;
	b=qjpKfob7Z9nwJXoxx5GUB/npEZom5q2cVoX+WSrhUvhCp38miksFI15n7HED2ElCpa+Gzh
	rMarA3QV5uYksrG/9PUOkqwZt07frFarx52lcp28KkCgCK6TwCddvcYR3TQi0qP59jouqi
	jrs60IDKyBiuILyERrfCfy38ldk8MHk=
Date: Wed, 28 May 2025 07:16:11 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version to
 3.0
To: Andrew Jones <ajones@ventanamicro.com>,
 =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Mayuresh Chitale <mchitale@ventanamicro.com>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv <linux-riscv-bounces@lists.infradead.org>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
 <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
 <DA3KSSN3MJW5.2CM40VEWBWDHQ@ventanamicro.com>
 <61627296-6f94-45ea-9410-ed0ea2251870@linux.dev>
 <DA5YWWPPVCQW.22VHONAQHOCHE@ventanamicro.com>
 <20250526-224478e15ee50987124a47ac@orel>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250526-224478e15ee50987124a47ac@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_071624_825461_61C9D839 
X-CRM114-Status: GOOD (  21.08  )
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

On 5/26/25 4:13 AM, Andrew Jones wrote:
> On Mon, May 26, 2025 at 11:00:30AM +0200, Radim Krčmář wrote:
>> 2025-05-23T10:16:11-07:00, Atish Patra <atish.patra@linux.dev>:
>>> On 5/23/25 6:31 AM, Radim Krčmář wrote:
>>>> 2025-05-22T12:03:43-07:00, Atish Patra <atishp@rivosinc.com>:
>>>>> Upgrade the SBI version to v3.0 so that corresponding features
>>>>> can be enabled in the guest.
>>>>>
>>>>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>>>>> ---
>>>>> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
>>>>> -#define KVM_SBI_VERSION_MAJOR 2
>>>>> +#define KVM_SBI_VERSION_MAJOR 3
>>>> I think it's time to add versioning to KVM SBI implementation.
>>>> Userspace should be able to select the desired SBI version and KVM would
>>>> tell the guest that newer features are not supported.
> 
> We need new code for this, but it's a good idea.
> 
>>>
>>> We can achieve that through onereg interface by disabling individual SBI
>>> extensions.
>>> We can extend the existing onereg interface to disable a specific SBI
>>> version directly
>>> instead of individual ones to save those IOCTL as well.
>>
>> Yes, I am all in favor of letting userspace provide all values in the
>> BASE extension.
> 

We already support vendorid/archid/impid through one reg. I think we 
just need to add the SBI version support to that so that user space can 
set it.

> This is covered by your recent patch that provides userspace_sbi.

Why do we need to invent new IOCTL for this ? Once the user space sets 
the SBI version, KVM can enforce it.

> With that, userspace can disable all extensions that aren't
> supported by a given spec version, disable BASE and then provide
> a BASE that advertises the version it wants. The new code is needed
> for extensions that userspace still wants KVM to accelerate, but then
> KVM needs to be informed it should deny all functions not included in
> the selected spec version.
> 
> Thanks,
> drew
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


