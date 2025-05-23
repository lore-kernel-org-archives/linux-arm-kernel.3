Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6AAC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 17:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NwSnBgPFez8PLTovNHh7DO/HqAHVQL0w4mtppSLYja0=; b=yoxieENjf0e10xmZDSV7zsSu8v
	sI9ls/AC1vCRl4+UnSF35Q6zFnRvam+Dvp3jAXAzaJbFyZkl11iIc2YCLlg8+rmtlJlbiO335g8aV
	MGe3JLxRWyFVtcR4kFsOpVQaha1/ut46TixXz1OUAncWd6XteciX9/ITwtM1oQ8NxkhVv68PVQaNX
	vKpBJfm2quOr+jGyMP4wCAsivBVHjWfpRtAUT/1/V4o/EEbEiMyfuOunqS3j+DNK6fsnMCGMge+kK
	jAiQUYaBW1TGowKQfqpq4K4l5zO7DSNRWcYzWnlauXmTSo6qG/YF630zZkMpkEwCizDwK5sx/Z98O
	4r3vWxAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIW7Y-00000004X01-0Fvo;
	Fri, 23 May 2025 17:23:48 +0000
Received: from out-187.mta1.migadu.com ([2001:41d0:203:375::bb])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIW0U-00000004VlC-1yw9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 17:16:32 +0000
Message-ID: <61627296-6f94-45ea-9410-ed0ea2251870@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748020578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NwSnBgPFez8PLTovNHh7DO/HqAHVQL0w4mtppSLYja0=;
	b=p4ygCmn0/SgSUw/j+FUlcInOw5bcP3qQpAP+WTRtVHCq8zqDVxfsG3vreS7WCBAJhRjcTY
	CNS0wuI2Zor/NqLA6i4HP+ByVNwTy/KZWyPRvH4hhejZLNvTG/9jo7xnLQXl37V2+/wL9Q
	eok6kr9D3cEhlTaruAu9Wmz5VZIJWYI=
Date: Fri, 23 May 2025 10:16:11 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version to
 3.0
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv <linux-riscv-bounces@lists.infradead.org>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
 <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
 <DA3KSSN3MJW5.2CM40VEWBWDHQ@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <DA3KSSN3MJW5.2CM40VEWBWDHQ@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_101630_641320_5423E5CE 
X-CRM114-Status: GOOD (  13.47  )
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


On 5/23/25 6:31 AM, Radim Krčmář wrote:
> 2025-05-22T12:03:43-07:00, Atish Patra <atishp@rivosinc.com>:
>> Upgrade the SBI version to v3.0 so that corresponding features
>> can be enabled in the guest.
>>
>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>> ---
>> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
>> -#define KVM_SBI_VERSION_MAJOR 2
>> +#define KVM_SBI_VERSION_MAJOR 3
> I think it's time to add versioning to KVM SBI implementation.
> Userspace should be able to select the desired SBI version and KVM would
> tell the guest that newer features are not supported.

We can achieve that through onereg interface by disabling individual SBI 
extensions.
We can extend the existing onereg interface to disable a specific SBI 
version directly
instead of individual ones to save those IOCTL as well.

> We could somewhat get away with the userspace_sbi patch I posted,
> because userspace would at least be in control of the SBI version, but
> it would still be incorrect without a KVM enforcement, because a
> misbehaving guest could use features that should not be supported.

