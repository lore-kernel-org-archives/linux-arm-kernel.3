Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE56C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 20:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=l0gzEZMaKBz+geZl5pxHGq7kFzj0QyinBj1xrmpUWk4=; b=eSu7/RcCPnQqSv
	YyJ15KwhBcds7XnfwXocrHBbg9ELft/Biusbn/visCmj4/tHa26TikRf3KVigKfEdL+5pNFx2bvfB
	3GsS6BwEs0GVKTYb8hkWw/QF5L1VOjFKfWFa3kRlkgEZ9yVAUqKM7AcPNvN04inlIQyfLGbIqBZ+I
	48frfy2YtSYuCZzl7/tCDaWmE6FFfqp/Ux+0Tns1E+GXAzWbojzJeMPAfBWGlAqdIwbDZHW5ycVX1
	LB/wkGy/7d3ZjqigSGHNtHdyC/hMj62ELbkbj8QxeSHUpN9a5Dc0AtOFvXhM07cLCDIxkVloPPx8c
	xWO7GoyZIeSDT10zkU6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMune-0000000EC06-0JoX;
	Wed, 04 Jun 2025 20:33:26 +0000
Received: from mail-il1-x14a.google.com ([2607:f8b0:4864:20::14a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMuRl-0000000EA4U-0YCe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 20:10:50 +0000
Received: by mail-il1-x14a.google.com with SMTP id e9e14a558f8ab-3ddc1af1e5bso6277565ab.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 13:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749067848; x=1749672648; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l0gzEZMaKBz+geZl5pxHGq7kFzj0QyinBj1xrmpUWk4=;
        b=HIisjJI2go+rhMf1867nOg3Imz+zdtZCW9aHf1xrNRfWbGBx51fhsiJNktjJMKOyhL
         T5QhzISy0obiB3m4IG4ADEiB/U+Tvj31d91VnyC0UrvodEa0Smz+pNjqlB7T5/1LWhZl
         zv3r6dLYC0EUkuf2NLao9xH+FkH3KsROAauB5ERDQeiQst9HUQ8ZpLUQcTZ38mYgwrEn
         NYLCGunALXqO5ZN6R0qoFsCdk5ounyHDd4kl4yQojr8Zcs9B41DK5g3RXwdqcWRlA2QI
         V7jjYtA8j3LYn3F68NTglB+JSFCuI41IN8/jjWtAb9M7i4E2eNHr2ckVTZEH9G6EeYPr
         wmIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749067848; x=1749672648;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l0gzEZMaKBz+geZl5pxHGq7kFzj0QyinBj1xrmpUWk4=;
        b=Y5S2/bLVANKxHJrAEivlOPUkKNgW4ioXzNSpju8qlD7DfVj7ehgYfzR5MPTbr1vgNI
         uXzFbNA6GO2uhcg0eCjIu81ewUkMGO/vPD725pWfg/adVYwyEfM8WzO2VoNQh6Dto2Y2
         iWvHChnNb+9PeNE+s3x1GOb1OXwy5UpKwAFwtSBJUSYLA1NfN2mu9eqqv9MK1c1S8jrQ
         sV9h24uNLKRHso7T6QWWRpUZMttspxqSEQoqmhrZ9bZ+fVJ1cpeTVR2CgvevYXIsnNi5
         RSbv2D/DupeLKvH0PYBrYNzeUoZ43hh7S+GYLQCfGKtcIolQrCvQYeQch/YJoiU/a93G
         qrqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdmYd0wbN3GiZmktS0O1x4aTcsPswuMQjTCaX5DVBpBU3cBlUhlTYJcXIaGxNLURdmmfEwVpOH0r8ZLt+JoJfO@lists.infradead.org
X-Gm-Message-State: AOJu0Ywn1qPLprd4Y6ZjSFPlzj4lQFUweDebdk5nG1BUBndm9wBtJVDk
	eFAtfKN95fD8F2AkJrgM7Ol7QqsuaTtZ9hdtrVxJLq07PEZow1lq5xKmgUDApQf5r1Sox6JGvcM
	lD9qjxRqrWi4Y4VKQ2KxuLG9f8w==
X-Google-Smtp-Source: AGHT+IEebJ+gdBmXEWqe1Fe3czqgQNBwW10WesxaqzS4IgnDmyZIhGpgkmk6gkpNi9jz//MbXeTmhCWS5OjtRGNtmg==
X-Received: from ilfj26.prod.google.com ([2002:a05:6e02:221a:b0:3dd:7629:ec3a])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:3e06:b0:3dc:87c7:a5b5 with SMTP id e9e14a558f8ab-3ddbfc344efmr50438865ab.3.1749067847917;
 Wed, 04 Jun 2025 13:10:47 -0700 (PDT)
Date: Wed, 04 Jun 2025 20:10:47 +0000
In-Reply-To: <aD91vp8QXdIjs1Nh@linux.dev> (message from Oliver Upton on Tue, 3
 Jun 2025 15:22:54 -0700)
Mime-Version: 1.0
Message-ID: <gsntqzzz1d4o.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH 10/17] KVM: arm64: Writethrough trapped PMEVTYPER register
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, mark.rutland@arm.com, shuah@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_131049_167859_D525809E 
X-CRM114-Status: GOOD (  20.43  )
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

Oliver Upton <oliver.upton@linux.dev> writes:

> On Mon, Jun 02, 2025 at 07:26:55PM +0000, Colton Lewis wrote:
>> With FGT in place, the remaining trapped registers need to be written
>> through to the underlying physical registers as well as the virtual
>> ones. Failing to do this means delaying when guest writes take effect.

>> Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> ---
>>   arch/arm64/kvm/sys_regs.c | 27 +++++++++++++++++++++++++--
>>   1 file changed, 25 insertions(+), 2 deletions(-)

>> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
>> index d368eeb4f88e..afd06400429a 100644
>> --- a/arch/arm64/kvm/sys_regs.c
>> +++ b/arch/arm64/kvm/sys_regs.c
>> @@ -18,6 +18,7 @@
>>   #include <linux/printk.h>
>>   #include <linux/uaccess.h>
>>   #include <linux/irqchip/arm-gic-v3.h>
>> +#include <linux/perf/arm_pmu.h>
>>   #include <linux/perf/arm_pmuv3.h>

>>   #include <asm/arm_pmuv3.h>
>> @@ -942,7 +943,11 @@ static bool pmu_counter_idx_valid(struct kvm_vcpu  
>> *vcpu, u64 idx)
>>   {
>>   	u64 pmcr, val;

>> -	pmcr = kvm_vcpu_read_pmcr(vcpu);
>> +	if (kvm_vcpu_pmu_is_partitioned(vcpu))
>> +		pmcr = read_pmcr();

> Reading PMCR_EL0 from EL2 is not going to have the desired effect.
> PMCR_EL0.N only returns HPMN when read from the guest.

Okay. I'll change that.

>> +	else
>> +		pmcr = kvm_vcpu_read_pmcr(vcpu);
>> +
>>   	val = FIELD_GET(ARMV8_PMU_PMCR_N, pmcr);
>>   	if (idx >= val && idx != ARMV8_PMU_CYCLE_IDX) {
>>   		kvm_inject_undefined(vcpu);
>> @@ -1037,6 +1042,22 @@ static bool access_pmu_evcntr(struct kvm_vcpu  
>> *vcpu,
>>   	return true;
>>   }

>> +static void writethrough_pmevtyper(struct kvm_vcpu *vcpu, struct  
>> sys_reg_params *p,
>> +				   u64 reg, u64 idx)
>> +{
>> +	u64 evmask = kvm_pmu_evtyper_mask(vcpu->kvm);
>> +	u64 val = p->regval & evmask;
>> +
>> +	__vcpu_sys_reg(vcpu, reg) = val;
>> +
>> +	if (idx == ARMV8_PMU_CYCLE_IDX)
>> +		write_pmccfiltr(val);
>> +	else if (idx == ARMV8_PMU_INSTR_IDX)
>> +		write_pmicfiltr(val);
>> +	else
>> +		write_pmevtypern(idx, val);
>> +}
>> +

> How are you preventing the VM from configuring an event counter to count
> at EL2?

I had thought that's what kvm_pmu_evtyper_mask() did since masking with
that is what kvm_pmu_set_counter_event_type() writes to the vCPU register.

> I see that you're setting MDCR_EL2.HPMD (which assumes FEAT_PMUv3p1) but
> due to an architecture bug there's no control to prohibit the cycle
> counter until FEAT_PMUv3p5 (MDCR_EL2.HCCD).

I'll fix that.

> Since you're already trapping PMCCFILTR you could potentially configure
> the hardware value in such a way that it filters EL2.

Sure.

>>   static bool access_pmu_evtyper(struct kvm_vcpu *vcpu, struct  
>> sys_reg_params *p,
>>   			       const struct sys_reg_desc *r)
>>   {
>> @@ -1063,7 +1084,9 @@ static bool access_pmu_evtyper(struct kvm_vcpu  
>> *vcpu, struct sys_reg_params *p,
>>   	if (!pmu_counter_idx_valid(vcpu, idx))
>>   		return false;

>> -	if (p->is_write) {
>> +	if (kvm_vcpu_pmu_is_partitioned(vcpu) && p->is_write) {
>> +		writethrough_pmevtyper(vcpu, p, reg, idx);

> What about the vPMU event filter?

I'll check that too.

>> +	} else if (p->is_write) {
>>   		kvm_pmu_set_counter_event_type(vcpu, p->regval, idx);
>>   		kvm_vcpu_pmu_restore_guest(vcpu);
>>   	} else {
>> --
>> 2.49.0.1204.g71687c7c1d-goog


> Thanks,
> Oliver

