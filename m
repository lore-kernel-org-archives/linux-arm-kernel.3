Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D02C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uKR6EFCmDJpjzdoVVb7y/NFOnqReCZIcocNqlzCjmGA=; b=Z4tVoELRV8mg9R
	a3G2UMyCuWe9Camm5rnyFIOnoCdV4b0CaHjWV2wUJXvioer3G0M93r3zgCLaGX0JVJ9+hqeCVLHac
	3+Z6xD/+lqcAa/3gxx4w/QCh+kY11c2juKj6oWCY1Pc8ZeRQIaYQVOP3Qsr2aNLg3BPwpCrMgNZtE
	MiPPYBEzMsb3ES3GPFo100Y9cnKTNfd4KUBrrlHt1K+EmsjIIcNDK+ZRzUqzDhnVf26C0UGThMNRc
	ztyW20sE0GgEhzais7RRlGigpQYSNUenhz+lj6cdtLMIr/uUPnY5Gzi63mDalyaZUxqVO7xiwCyPE
	NESauuFPybCudBIv+wJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjboa-0000000Bpwb-2taY;
	Tue, 14 Jul 2026 12:00:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjboY-0000000Bpv9-3N1G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:00:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5BA8497;
	Tue, 14 Jul 2026 05:00:37 -0700 (PDT)
Received: from [10.1.34.162] (e121487-lin.cambridge.arm.com [10.1.34.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CDAF63F93E;
	Tue, 14 Jul 2026 05:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784030442; bh=pGbV6yNiHo/cJz3PV6+R1SPL2TNF6PtNXT3LvC4tCag=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hisrsUS0ZuBtzp5Wb0BVr4hdcxrNKZWnt1svyi8QAz0pH+HWV0Jy5aqCoqx4/RzbF
	 L9RqpcV7iDJYarG6hG9p7tkooo9kQuHYVbPh1L6V+/D66U5JThqZ/9+X5puuamiWN8
	 kmHdYMs1iYajyMLzg97W+dv/jObFCcJqV+AJ9Rns=
Message-ID: <a7d8d40b-d7f8-4a0f-bb04-3994b381e64d@arm.com>
Date: Tue, 14 Jul 2026 13:00:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 12/36] arm64: entry: replace DAIF helpers with entry
 helpers
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-13-vladimir.murzin@arm.com>
 <42317a74-471e-4721-81e9-79e0d0a000fb@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <42317a74-471e-4721-81e9-79e0d0a000fb@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_050042_886681_FEBE944D 
X-CRM114-Status: GOOD (  15.01  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org, catalin.marinas@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 7/10/26 11:01, Jinjie Ruan wrote:
> 
> On 7/9/2026 8:13 PM, Vladimir Murzin wrote:
>> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>
>> Replace all uses of the `local_daif_...` helpers in `entry-common.c`
>> with the new entry-specific exception masking helpers.
>>
>> Also replace `local_irq_disable()` with a switch to NOIRQ context
>> using the new helpers. This provides:
>>
>> - consistency checks for hardware state
>>
>> - a unified style for managing exception context
>>
>> Now that exception context is tracked explicitly, involuntary kernel
>> preemption can be optimized. We either preempt:
>>
>> - from PROCESS exception context, or
>>
>> - when returning from an interrupt handler, where the GIC code
>>   switches from NONMI to NOIRQ exception context
>>
>> To support this split, divide `arm64_exit_to_kernel_mode()` into
>> preempt, non-preempt, and dispatch parts.
>>
>> Remove `local_daif_inherit()`, since it is no longer used.
>>
>> Now that both the irqflags API and entry code handle DAIF and PMR
>> correctly, remove `GIC_PRIO_PSR_I_SET` from the PMR value set by
>> `kernel_entry` in `entry.S` and by `init_gic_priority_masking()` in
>> `kernel/smp.c`.
>>
>> The `local_daif_...` helpers and other specialized code still use
>> `GIC_PRIO_PSR_I_SET` for now; this commit does not change their
>> behavior.
>>
>> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> 
> I think this patch and the previous one have too many changes, making it
> difficult to review.
> 

Really sorry about that!

> Can it be broken down into smaller patches with modifications that
> include the original context? Otherwise, it will be hard to identify
> what changes have been made.

I'll have a look what can be done with this patch (and previous one).

Thanks
Vladimir

