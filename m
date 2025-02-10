Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8719C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 23:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=NzOtRn06dmJeLMt6lIohnur0KCLnTsq8EA/pFJWvUPc=; b=kVzeyIyK91Z3Da
	WSXiVaUkuuVz1875QmVgqL0vVBdr27JuJhGbHHpyL0VHGoVAYPbqwRbBWorlyWFb++USAnWrw+G2N
	pwHYw0mdgtJNydA6SekuEgghDdDCPO+/qMSj1+n0OhIYjVLcJHW166rU1vwyFqhtnXLThP8c+hVNS
	qfqvcqWTKDwtBxrxwTtH+9CXPrNuzoUOc/c9Jz6l8oJDH/jpOCXjUHduNKzeIVUxOfj+dGpz/BPf9
	X0lMBtpciFy2wG3ZEMb5V6LFVeEaxPxnZaD9vn/GW6KSmFHKlpNgOU0rPlwkNQcrjMXok3Xp8NE4p
	NiNb7Tgh1CnJ4/6p4WdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thd87-00000001pjX-3wU0;
	Mon, 10 Feb 2025 23:23:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcsk-00000001n4h-1IBM
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Feb 2025 23:08:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:References;
	bh=NzOtRn06dmJeLMt6lIohnur0KCLnTsq8EA/pFJWvUPc=; b=pkwSACI/74bHuSZWB+QgnE9xAd
	u23H2EHQIszmdiKfPWiXbhb83KO1j7T1rZnF8B7xbsdQmYzUG5KtiYqpwlX+eEEnq1sMZZtW+AsFz
	IoKm5b6SdIVdH9Qs7Euu/2SpUtrthaWEfzNFzRiBa0K0nMnQlDqgTBIuN5vc7v0aLrBagvVRYYUNX
	AnJbz9cQ3p8u17B6GlYdYRTre7exS1+CdGNexncBqqknHQoO0HlKn1tPgi89hNDVv3/FsnKhsjV58
	H+zbebNC5MbSOmHI2FyrRFDP8v298qPbsxAjHfpjC2BdSKOvySdRqW3p1J9Y0UZjQEpLB5Cp4OoKw
	Q+KcO82g==;
Received: from mail-il1-x149.google.com ([2607:f8b0:4864:20::149])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcsg-00000000M1Q-3Juz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 23:08:00 +0000
Received: by mail-il1-x149.google.com with SMTP id e9e14a558f8ab-3d14950ac9fso69431985ab.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 15:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739228875; x=1739833675; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NzOtRn06dmJeLMt6lIohnur0KCLnTsq8EA/pFJWvUPc=;
        b=k1QlHPB3fpp862l2CxA2BuGOG9z1OuCPM1XtJFHVwJquRJ8awG6AvZw2KsnWtplWve
         2bd3mpcTNRQAneUG1TiTIwiZA9pADcEcY5yoDrQ7VUTiMnwNCGDd/esYW+6Vl1F9K5Ki
         zgIvq3BSd3tc+wUBc6TZdnzxrmhwHdztKuXDGHn8GFVKQamwbdoT/E2HRAo4pocpx62d
         WcH5tx94SxjpTJqwNmMa7eMpU4KGGmmzGWM5cStmSqC+lyt+V/q/9THzY42Z1JxQFdhM
         pxttm1vqYJj/Vp3N3DEh0fd2LtnbsXqjrAQZczDyjhbgyKJYm9HmJkrNAdwTw7/QnemY
         NLYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739228875; x=1739833675;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NzOtRn06dmJeLMt6lIohnur0KCLnTsq8EA/pFJWvUPc=;
        b=cww1pYKMp3SID30lOPfdRHDp3uJuvuJglCeNUbEWw3jnQDP3y3K0dGQdHxw/YTlHgU
         6vBkCImHrFxnB3joBfyYG3tjeZyNfIirPkqCI1RSdRfn8E554jg2XFjJiNgVHIM8FQaW
         Lq65502kBueV7qMM0mWl2HICqcU+zi3i87G30KYy/KUriWC1NWwXcBCI0PkJLzv0ezpX
         Qj9smocFY4PVoKCfvun4r5v/vTMfls+g0IQQb8x/uN2RmK+3l/T6lwCVLYQl6Rlq+Bj5
         2QXf4nQecjqARRPWQrRoS29tcXTcXZ3VQCGbUoFXGnr60/dxqK9DDIRQDgvo1PeEYzWa
         SaVA==
X-Forwarded-Encrypted: i=1; AJvYcCUQOPnHFqB2Abw+kpKwleWg5qvCmVSxTdsxiIErLeKk0jg+Fo6cUQ8CIpZT2JdJCH4i3uTFuw9O33o6J87NCOYY@lists.infradead.org
X-Gm-Message-State: AOJu0YzAwq6xnrFBKOze0chVHgdYV8XNy8L6SDmVQ1ZjgKlQV0mA3ONF
	stfO/irz0PEjEqUJ+ihkEtMsOJkjFJEziE2xl5toEQDtgmnzH5vIFczYdjJQZJpdNSJZX+Pz9d9
	g6lSXArMZvhGToD/H/9YQmA==
X-Google-Smtp-Source: AGHT+IEYUiomyuN/bGInuZpdaF2fRRM/BetqkFJjxK+LoWD1u4DPDFiIADjLJWFWyB1MEsSvhotxG42I2ZAf1MOJBQ==
X-Received: from ilbbn13.prod.google.com ([2002:a05:6e02:338d:b0:3d0:23fd:8ce4])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:481c:b0:3cf:b626:66c2 with SMTP id e9e14a558f8ab-3d13df546c4mr121244895ab.19.1739228875706;
 Mon, 10 Feb 2025 15:07:55 -0800 (PST)
Date: Mon, 10 Feb 2025 23:07:54 +0000
In-Reply-To: <Z6mp4NeklzORJg5y@linux.dev> (message from Oliver Upton on Sun, 9
 Feb 2025 23:25:20 -0800)
Mime-Version: 1.0
Message-ID: <gsntfrkl1jqt.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [RFC PATCH v2 2/4] perf: arm_pmuv3: Introduce module param to
 partition the PMU
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: kvm@vger.kernel.org, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, mark.rutland@arm.com, pbonzini@redhat.com, 
	shuah@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_230758_975554_7333D79B 
X-CRM114-Status: GOOD (  28.67  )
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

Hi Oliver, thanks for the review.

Oliver Upton <oliver.upton@linux.dev> writes:

> Hi Colton,

> On Sat, Feb 08, 2025 at 02:01:09AM +0000, Colton Lewis wrote:
>> For PMUv3, the register MDCR_EL2.HPMN partitiones the PMU counters
>> into two ranges where counters 0..HPMN-1 are accessible by EL1 and, if
>> allowed, EL0 while counters HPMN..N are only accessible by EL2.

>> Introduce a module parameter in the PMUv3 driver to set this
>> register. The name reserved_host_counters reflects the intent to
>> reserve some counters for the host so the guest may eventually be
>> allowed direct access to a subset of PMU functionality for increased
>> performance.

>> Track HPMN and whether the pmu is partitioned in struct arm_pmu
>> because KVM will need to know that to handle guests correctly.

>> While FEAT_HPMN0 does allow HPMN to be set to 0, this patch
>> specifically disallows that case because it's not useful given the
>> intention to allow guests access to their own counters.

> Quite the contrary.

> FEAT_HPMN0 is useful if userspace wants to provide a vPMU that has a
> fixed cycle counter w/o event counters. Certain OSes refuse to boot
> without it...

Cool. I'll make sure writing 0 is allowed if we have FEAT_HPMN0.

>> static inline u32 read_mdcr(void)
>> {
>> 	return read_sysreg(HDCR);
>> }

>> static inline void write_mdcr(u32 val)
>> {
>> 	write_sysreg(val, HDCR);
>> }


> Hmm... While this fixes the 32bit compilation issues, it opens a new can
> of worms.

> VHE is a 64bit only feature, so you're *guaranteed* that these accessors
> will undef (running at EL1).

True. I mentioned in the cover letter they aren't intended to actually
run in the PMU driver because I guard for VHE there.

>> +static void armv8pmu_partition(u8 hpmn)
>> +{
>> +	u64 mdcr = armv8pmu_mdcr_read();
>> +
>> +	mdcr &= ~ARMV8_PMU_MDCR_HPMN;
>> +	mdcr |= FIELD_PREP(ARMV8_PMU_MDCR_HPMN, hpmn);
>> +	/* Prevent guest counters counting at EL2 */
>> +	mdcr |= ARMV8_PMU_MDCR_HPMD;
>> +
>> +	armv8pmu_mdcr_write(mdcr);
>> +}
>> +

> After giving this a read, I don't think the host PMU driver should care
> about MDCR_EL2 at all. The only time that 'guest' events are loaded into
> the PMU is between vcpu_load() / vcpu_put(), at which point *KVM* has
> reconfigured MDCR_EL2.

> I'm not sure if there's much involvement with the host PMU driver beyond
> it pinky-swearing to only use the specified counters. KVM is what
> actually will program HPMN.

> That'd alleviate the PMU driver from having VHE awareness or caring
> about MDCR_EL2.

That does seem like a cleaner solution. I can lift that handling into
KVM code, but I will still need the variables I introduced in struct
arm_pmu to be populated so the driver knows what counters to use.

Without looking, I'm concerned there might be an initilization ordering
issue with that where KVM will get the value for HPMN first because it's
initialized first but then can't store them somewhere accessible to the
driver because the driver hasn't been initialized yet. Then the driver
is initialized and used without knowing HPMN and is now using counters
we wanted the guest to have.

There is probably an easy way around this, but I'll need to do some
digging.

