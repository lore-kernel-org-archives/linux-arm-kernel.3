Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2AAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 09:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oPLibf5QTIENtK/a1w6mHsH90E+s7HphtCSAcJvN1Ug=; b=jVs9IbsuUjsxUrUWeK23b/U+tq
	rFXha86tZVFieNLTvoZLwo8um4pJt97JtSSqQOjOXrExMNHlCQMtlEK4Tju8kHt2cUm0lCDzINM/d
	LmjdBr+eKnDrwXn6cRICdITotOprgHoJq9/DQ033XbDXl+pWhPNlpoMTSCMIw7xzFxTYqGM8Z0n0Z
	pt2Crwc9RAO64h7ypt9bP+ocp60kieodlLQJZLxe3Jlv6tGGGqAjIJkuepG8gooUo78ByFdp1OPw3
	GP0A9F/RqCQbn5Gkt/M67bc+2eII7ldzrSY0grkEWezL1LTDlKsabEvC1pqxqqa5dqE9d94x/DT5p
	s0b00OUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZgr-0000000BUAh-0ksM;
	Tue, 14 Jul 2026 09:44:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZgo-0000000BU9q-2bmM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 09:44:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0456339;
	Tue, 14 Jul 2026 02:44:28 -0700 (PDT)
Received: from [10.1.34.162] (e121487-lin.cambridge.arm.com [10.1.34.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 937F43F93E;
	Tue, 14 Jul 2026 02:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784022273; bh=EIiGWFGBwbQOY9pU7snzN1nO5uflgqlCSuQ1vkL+rHc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WZenSKyNv5kzXTkQ9Nwa1kCAIMyPVAVp6WaBgLQ8+nDHkxlAX/25XajfbPVfS9w2k
	 3b3yW1MP9qyD8dXask4aD6h/scH5303v9p0yFgZHxQIe/lFquKcBRyEj6G1ctmfzJC
	 Gj/DLpvU7pkdKF4Jw3DVuUdrwqqmxHPs0JvOVeNk=
Message-ID: <253e0c6b-7b50-46e6-bd13-69c0459ddae0@arm.com>
Date: Tue, 14 Jul 2026 10:44:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 10/36] arm64: irqflags: save and use both DAIF and PMR
To: Jinjie Ruan <ruanjinjie@huawei.com>, "Liao, Chang"
 <liaochang1@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, maz@kernel.org, catalin.marinas@arm.com,
 will@kernel.org
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-11-vladimir.murzin@arm.com>
 <73bfbebb-e8fd-4b6c-b0e4-8f7d5b09b6af@huawei.com>
 <7a4e09a4-18e9-49a6-9a17-cad552e39076@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <7a4e09a4-18e9-49a6-9a17-cad552e39076@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_024434_712538_95A8E0C4 
X-CRM114-Status: UNSURE (   8.42  )
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

On 7/10/26 09:11, Jinjie Ruan wrote:
>>> diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
>>> index f7dc5fb9427d..192eb97cd50b 100644
>>> --- a/arch/arm64/include/asm/ptrace.h
>>> +++ b/arch/arm64/include/asm/ptrace.h
>>> @@ -205,7 +205,7 @@ static inline void forget_syscall(struct pt_regs *regs)
>>>  
>>>  #define irqs_priority_unmasked(regs)					\
>>>  	(system_uses_irq_prio_masking() ?				\
>>> -		(regs)->pmr == GIC_PRIO_IRQON :				\
>>> +		(regs)->pmr >= GIC_PRIO_IRQON :				\
>>>  		true)
>>>  
>>>  static __always_inline bool regs_irqs_disabled(const struct pt_regs *regs)
>> Is there any reason to keep interrupt_enabled()? It appears to be rarely used
>> across interrupt and exception code. So far, i've only found a single use in
>> gic_handle_irq(), corret me if i'm wrong. So using regs_irqs_disable() directly
>> might reduce the number of small helper that people need to remember.
> For arm32.

Indeed, gic_handle_irq() is shared between arm64 and arm32, and latter
doesn't provide regs_irqs_disabled(), thus we have to keep
interrupt_enabled() for now.

Thanks
Vladimir

