Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01B8CD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 23:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=4p6UmVH4InlQHDX0xOai2hxHDLRoZeq2zsnVbO1aygg=; b=si3QNK0pxqMteF
	UtUjo+dqV53ES+Rx56g2lOKDF2hAttH2/rLvjYr6NfXDV6hZ96oQasIf9xpBqfRwY5pfMGVeSGLYi
	aIMx9pd53WpgUT0pkXWNZrWmEk1mr3++6SUpI6FnBoAJKTiHsu0FXfJPM/KZN1YrRgeEHO4ZR3+aY
	6H0vual7lHIiPo0UqCw0NEuASoa6RyGOXD/T9n9jVdz67mF6XDRb6gVLKbpyT4H4tFczUEmivE+te
	hxvNi2d+5t4mEbZZlCujUIhbdRhz/oieTtAw5YeeHfSzwz4CwpyXnq2Hs5e6dqwektE6I3laPEYzN
	LAQeQCPP9eE29mBi1RmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waMBb-00000001rg9-2qOZ;
	Thu, 18 Jun 2026 23:30:15 +0000
Received: from mail-oi1-x249.google.com ([2607:f8b0:4864:20::249])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waMBZ-00000001rfn-1sDd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 23:30:14 +0000
Received: by mail-oi1-x249.google.com with SMTP id 5614622812f47-4863abb79b0so4775632b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 16:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781825411; x=1782430211; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4p6UmVH4InlQHDX0xOai2hxHDLRoZeq2zsnVbO1aygg=;
        b=ulW/UoDtpl1mBcH/sd260qrIEurMtAvPBT+BcdW0b7/QqpKueQg9qv6f/oK+pDjGQ+
         5j5UNcToFweFL8H4Spfy3PYge9438RwjqcLfKEdvNKzOMiFejVFWs9PuCSmpJQT1NxgL
         VUe22hIm2NiOIKDqbn980RBCHcE5SiBxx0iQl9CD6trXNm6zLXmrKmBWRFBmZf96/13Q
         HrEh3vwTADMhSWOxPBYsGxqXY3RUEn6Dxvr/jsM7YlXa0t8Rr09UIYFk4be/puFA5gVH
         KIuvlhTVTlFz7gwcxzdRLyrGPf3i2XR92B29CKFEg4yTl1mK8Nie0VJne/qrcJDrjrGW
         7uVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781825411; x=1782430211;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4p6UmVH4InlQHDX0xOai2hxHDLRoZeq2zsnVbO1aygg=;
        b=CQLdDH0F3AoF2z9YGOkW3nzpoIgUFySysBm2KVM62+i/8gxXtAAWm3vcNdW8Tk0cu6
         iMkgwZeH9whmRqKzlMjRXnVkFaTCCkCPB1FtU7Zc5iXrRKf2go01nbX6NBNl2i/UzQ6X
         RIgSy3WDU8ghFXk/GLxXCUWyjU2z457K0cewvM5VXx/H3AS9H89rpAJPIq9/+U3SY3pZ
         5JtHHwaMcN89+xhCsnyymwKx0LBxAozjepHhU52Y38jDgqFgTcE9sNLXwtgK4pFGXM2k
         GkA93P3fn4PZD+xLkSPARPUSA/41MG7FuNjoBSfDHp9vjJDK3DbweAqjQUGK1hRky1sf
         IRRQ==
X-Forwarded-Encrypted: i=1; AFNElJ95i51MbwPuC0tV0m/B53NX2zmkRsfJfCxslF2TCqPaCbW1sBBHMxAupey5/U7FWF7eZ39oXuaSCiUkcsJipqX0@lists.infradead.org
X-Gm-Message-State: AOJu0YyyhZRECqHgJ6iZpCqdezQYY+i/phh8P/UU3qH0GYt+0NtHOuVM
	EEzNxfnSNzW8oUMlIz/0CJmqKvE3SQJrrmdCamr6glA/LGd+bMF74wi+ShNmacHu7YQbPcLFpxm
	8Uk+YJztWtM3eyTNr5oojJUffbA==
X-Received: from jabjq11.prod.google.com ([2002:a05:6638:8d8b:b0:5e2:40af:256a])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:2444:b0:467:d71:7f1a with SMTP id 5614622812f47-4896c8a3f7cmr734469b6e.21.1781825411153;
 Thu, 18 Jun 2026 16:30:11 -0700 (PDT)
Date: Thu, 18 Jun 2026 23:30:10 +0000
In-Reply-To: <df30b9e0-6938-47f5-bb5d-5b1e67c8879c@huawei.com> (message from
 wuyifan on Tue, 16 Jun 2026 17:07:48 +0800)
Mime-Version: 1.0
Message-ID: <gsntv7bfctq5.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v7 11/20] KVM: arm64: Enforce PMU event filter at vcpu_load()
From: Colton Lewis <coltonlewis@google.com>
To: wuyifan <wuyifan50@huawei.com>
Cc: kvm@vger.kernel.org, alexandru.elisei@arm.com, pbonzini@redhat.com, 
	corbet@lwn.net, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	james.clark@linaro.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, wangyushan12@huawei.com, 
	fanghao11@huawei.com, wangzhou1@hisilicon.com, prime.zeng@hisilicon.com, 
	xuwei5@huawei.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_163013_488378_62FC7E11 
X-CRM114-Status: GOOD (  12.36  )
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


Hi Yifan, thanks for the review.

wuyifan <wuyifan50@huawei.com> writes:

> Hi Colton,

> On 5/5/2026 5:18 AM, Colton Lewis wrote:
>> +	for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS) {
>> +		if (i == ARMV8_PMU_CYCLE_IDX) {
>> +			val = __vcpu_sys_reg(vcpu, PMCCFILTR_EL0);
>> +			evsel = ARMV8_PMUV3_PERFCTR_CPU_CYCLES;
>> +		} else {
>> +			val = __vcpu_sys_reg(vcpu, PMEVTYPER0_EL0 + i);
>> +			evsel = val & kvm_pmu_event_mask(vcpu->kvm);
>> +		}
>> +
>> +		guest_include_el2 = (val & ARMV8_PMU_INCLUDE_EL2);
>> +		val &= ~evtyper_clr;
>> +
>> +		if (unlikely(is_hyp_ctxt(vcpu)) && guest_include_el2)
>> +			val &= ~ARMV8_PMU_EXCLUDE_EL1;
>> +
>> +		if (vcpu->kvm->arch.pmu_filter &&
>> +		    !test_bit(evsel, vcpu->kvm->arch.pmu_filter))
>> +			val |= evtyper_set;
>> +
>> +		if (i == ARMV8_PMU_CYCLE_IDX) {
>> +			write_sysreg(val, pmccntr_el0);
> This should be pmccfiltr_el0.
> Writing the filter bits to pmccntr_el0 would corrupt the cycle count  
> value.

Yes it should. I found that and thought I corrected it before I sent out
the series. Thanks for catching it.

>> +		} else {
>> +			write_sysreg(i, pmselr_el0);
>> +			write_sysreg(val, pmxevtyper_el0);
>> +		}
>> +	}
>> +}
> Thanks,
> Yifan

