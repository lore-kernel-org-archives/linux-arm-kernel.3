Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6E0D59D96
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 21:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=NvEO8IWge7rjEvmTvBLfyyCkg8YrPNESaGlmNB9KmuA=; b=G6uEyYmaYrRhpZ
	X0fkUOo2QUWYjEiG/+FrovD+lW5c2fo0sOtEWM+AYe8X9GjYBdXY6dyUhlEU0zNaTyevxQJ3gflIj
	hmM0ZiXGt2h/XGjD5mY2ch5W9MHWX6HwGPkyVnd+UOnuIyGqqHKdiVPqgxVlD6cWoKjKe2o6p/7SV
	maOL/67ckGQsJmH27j0RcpuPM+k4p3VPRE37fs5h02MvveakOGwz306xCkJLoajpTBbMxAorw6Aqe
	G40U4avpL0XAgv/CXBnfTzMTwxm5b3MtC/OGtH3RduPLzhVj7rBlh0c14wVJOqHwEyWgbWXpNJhpe
	V/GFjYhx6CX5xXrJN4jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUALr-000000015s9-1DZv;
	Fri, 12 Dec 2025 21:06:59 +0000
Received: from mail-oo1-xc49.google.com ([2607:f8b0:4864:20::c49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUALo-000000015rm-1yfe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 21:06:57 +0000
Received: by mail-oo1-xc49.google.com with SMTP id 006d021491bc7-6574a047ec5so1367872eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 13:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765573614; x=1766178414; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NvEO8IWge7rjEvmTvBLfyyCkg8YrPNESaGlmNB9KmuA=;
        b=YAtXlkIhqgE7ClgU7X+xL3ykt1eJAy5HolVGm+6zC4kVcwu2MH07ks3ygpRdjs5hef
         w5BnDvwzxyEdieT02i5ivDrZtlWsF8KbNFVXkeTGg5iR+x0bKClmYUo9E38su1iHZLe3
         bPLwPUZPQ4BTpXQXRqHzTtgEsOMwtJZIXkaKwrgo8ERAgUl+ESvzhqTxkBSGHLszaxeP
         d5Y8XNzHmcu8k2Ydj+b/FhngygiBkTfvgW05gbSIryl45HNE2aGoSnTHugq6YaQkS/Zt
         ceMfWHzQSZzlsXkUBOKxXZcvnHPVk2HckTO1oyuaI3XdIDTB0EnDYQS+JiqzAC6N3q8Z
         2epA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765573614; x=1766178414;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NvEO8IWge7rjEvmTvBLfyyCkg8YrPNESaGlmNB9KmuA=;
        b=Z0+/OcXwblmAkd8lb7UYT3re+EGwXsL+nzIvTN6hNSjHaZmjcL/hJpICj1Hin9B2i6
         0ruEDzc3KEn7pD85EAKrLhehttgCBYD4mYSbbZE10Cb8IGfPJ4eWk7+e9bho01rek0C0
         Apobyih5WemPjwHkcVa1JPyjFTUN8LphjRVpyTOjxU821iV/V/AAJ1aiqw8680U8Z/I/
         R6GmvmHOD5A3KOIopfV1lKgLfhu5W4Ld+6nmXkHfJC80aw8/H+rtkwJlqSXXdHS7yEDn
         8GZ7FPapHzi7yS/BxArXdoJJME4w3Z3ocDk1ZE170SXms59knYU1OXy9gt5yxkdyHTw+
         4mwA==
X-Forwarded-Encrypted: i=1; AJvYcCWnozvyifZgp48mdqIu33PfgavLposFztwpsg7a5CpRG+mf3f+XZaR55yTecUzr3bzkjBUrUQZgnOEhV1Upyu4z@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4w54AAtIFHesQBG6LC4sianhGCYC1hu2Sw0M98TAzqQYxGiJr
	Zz24tUQt0HdFyhyTgP9bnd1g1wllxE5Zek8HoGev9SQ6mffgf11tNgFM9mDPvHpmVutfDjGxlZs
	PbaUdHuTFSisIPKDbswYX12ro9g==
X-Google-Smtp-Source: AGHT+IGLtIUbFameZTVObRWcG+lq04RJyrGiyVy+qxibJohcLHDXgLx6kR5HPWzG4MF6bmkp/GMqRXiYMN5HlbpHeg==
X-Received: from ilbcb7.prod.google.com ([2002:a05:6e02:3187:b0:430:c30d:ac37])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:1899:b0:659:9a49:8dde with SMTP id 006d021491bc7-65b45172277mr1612721eaf.32.1765573614348;
 Fri, 12 Dec 2025 13:06:54 -0800 (PST)
Date: Fri, 12 Dec 2025 21:06:53 +0000
In-Reply-To: <aTiSTODjzaLzwAPN@kernel.org> (message from Oliver Upton on Tue,
 9 Dec 2025 13:19:08 -0800)
Mime-Version: 1.0
Message-ID: <gsntsedf2yvm.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v5 13/24] KVM: arm64: Writethrough trapped PMOVS register
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oupton@kernel.org>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_130656_518859_8AE3FD5F 
X-CRM114-Status: GOOD (  21.37  )
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

Oliver Upton <oupton@kernel.org> writes:

> On Tue, Dec 09, 2025 at 08:51:10PM +0000, Colton Lewis wrote:
>> Because PMOVS remains trapped, it needs to be written through when
>> partitioned to affect PMU hardware when expected.

>> Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> ---
>>   arch/arm64/include/asm/arm_pmuv3.h | 10 ++++++++++
>>   arch/arm64/kvm/sys_regs.c          | 17 ++++++++++++++++-
>>   2 files changed, 26 insertions(+), 1 deletion(-)

>> diff --git a/arch/arm64/include/asm/arm_pmuv3.h  
>> b/arch/arm64/include/asm/arm_pmuv3.h
>> index 60600f04b5902..3e25c0313263c 100644
>> --- a/arch/arm64/include/asm/arm_pmuv3.h
>> +++ b/arch/arm64/include/asm/arm_pmuv3.h
>> @@ -140,6 +140,16 @@ static inline u64 read_pmicfiltr(void)
>>   	return read_sysreg_s(SYS_PMICFILTR_EL0);
>>   }

>> +static inline void write_pmovsset(u64 val)
>> +{
>> +	write_sysreg(val, pmovsset_el0);
>> +}
>> +
>> +static inline u64 read_pmovsset(void)
>> +{
>> +	return read_sysreg(pmovsset_el0);
>> +}
>> +
>>   static inline void write_pmovsclr(u64 val)
>>   {
>>   	write_sysreg(val, pmovsclr_el0);
>> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
>> index 2e6d907fa8af2..bee892db9ca8b 100644
>> --- a/arch/arm64/kvm/sys_regs.c
>> +++ b/arch/arm64/kvm/sys_regs.c
>> @@ -1307,6 +1307,19 @@ static bool access_pminten(struct kvm_vcpu *vcpu,  
>> struct sys_reg_params *p,
>>   	return true;
>>   }

>> +static void writethrough_pmovs(struct kvm_vcpu *vcpu, struct  
>> sys_reg_params *p, bool set)
>> +{
>> +	u64 mask = kvm_pmu_accessible_counter_mask(vcpu);
>> +
>> +	if (set) {
>> +		__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, |=, (p->regval & mask));
>> +		write_pmovsset(p->regval & mask);
>> +	} else {
>> +		__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, &=, ~(p->regval & mask));
>> +		write_pmovsclr(p->regval & mask);
>> +	}

> There's only ever a single canonical guest view of a register. Either it  
> has
> been loaded onto the CPU or it is in memory, writing the value to two
> different locations is odd. What guarantees the guest context is on the
> CPU currently? And what about preemption?

My thinking here was pmovs is trapped so the "canonical" view is in
memory, but the guest still expects it to have an effect immediately.

Otherwise we would have to wait until the next load before the value
makes it to hardware. Are you okay with that latency? I'm not sure
how well that's going to work. Consider PMEVTYPER as an example. If I
don't write it to hardware immediately, a guest may expect a counter to
start counting as soon as it is written, but if it's only in memory the
counter won't start until the next load.

Echoing discussion on the previous patch, I wasn't aware preemption was
possible while servicing these register writes. I'll figure out how to
account for that.

