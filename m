Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9102BD68BC2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 23:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=GLCAorwrKlMW8FunTjt8zj7Va5wWm7XneVrIZBSPv24=; b=oXolMAwzHl1wQs
	dx2xQvJgtRoOKTnX+AoxQwj7k4V5KMeHX35lCmXXZwqNN2lXy5chh9e8dWc/EPKqTRBiNHuOV2IqF
	TUGR1zJOH3aRpqGrZmNhlnlbbczBtqICqGR/IqV5jo/LOcH7CzN+AcryiK+O+ozddUdiA6rQW4qgJ
	op2aUX1JbwwO9DGNFvRAsPBm9lP/AlAAMnZATwd1M7fEqoCDIxYnLoo/r1tN4EjL9gcKNY4QOPHZJ
	H1rn3l3c5dSWlJca7/Ge5pKyVY1vj+WMw23oZtw2PsbsWlTUsBNJlybGqB0oEiRjrf+EP68X3jhwI
	2BMMWjB38rHY0mNfSxXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW0aJ-00000007Vfb-0rIv;
	Wed, 17 Dec 2025 23:05:31 +0000
Received: from mail-oo1-xc49.google.com ([2607:f8b0:4864:20::c49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW0aH-00000007VfA-0yKQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 23:05:30 +0000
Received: by mail-oo1-xc49.google.com with SMTP id 006d021491bc7-65b26eca9c7so31105eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 15:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766012727; x=1766617527; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GLCAorwrKlMW8FunTjt8zj7Va5wWm7XneVrIZBSPv24=;
        b=a5o67fnIb/gusRpxMbumys1Xly5YPj8IklR5eNuWBHMCGY5XRvTDGpxkMfa4sSCa5Z
         rtJrGBwXL6ZljGV3RIBfToj6PIYr3KnRY9XvXJlpyhj1u/HFy0AjgR4yupert2tGjn/w
         DhzvTXDMhIJ1XqjlbG4Z8DaN6+b/f1kJ4YBWs5UHcGt9whMMOqP7sXmnzGLbyMu+jx3V
         KzqR6PTVXyrOmIA7Ibprd1oW9q8JmUDpzXpwX6dmtGDjhKftDBcd4GQ/Gh/mo5s6VXxT
         asW8KSLZtSSNiXgospEqVcBGVMigrErZCafTcQbvnAsXwqyREomTDtSjbB4V8GMabc/E
         ZNbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766012727; x=1766617527;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GLCAorwrKlMW8FunTjt8zj7Va5wWm7XneVrIZBSPv24=;
        b=of8rtKqeRVMFlJrniDqWz7wZkwx7/0gX1SlcXvSZbmprZEo1Xm7il1uotuJI+9NcTv
         J9vR65Yszzp3wyrrF48Veg7fNcj/K6BcqLsJdHIOgAG3Tj1E5xpsrIi6qy3CWcrMZhqA
         6RiM0HN0K/tclteWYzzB/8o3YMowlyDgVx3e0QIdWZNr1C2x/cGNzmduan8Fw1V1om+d
         8yat6lJsyQh10MupSAUMCe3xW44cNBBIcC6R7ZHi22rCC4xR+EXmJa8hpv70QTrTtT3A
         6W3AIH6yDOHUZwwjjN0DoCN/CPA9WAkLW9YBEa3H3ClSTzaqBk70YgjSUeYkxkw57wEQ
         YNrA==
X-Forwarded-Encrypted: i=1; AJvYcCVuRVmRdiar1TnK/DSI7giBEMoZj3x+MWVBc2Pqbn3Yg+ibQVYR4k8B4XwerWKYfgIiVlZN9MNfrE3ZmQsE1Q52@lists.infradead.org
X-Gm-Message-State: AOJu0YwZx/KghIAigWcJfdxEzrlrDLc0MhNuApm2sb1DMyaK8KsMPgPE
	hX0O42DqSa3mtGhod1C/03HlictJKC5R0rwO0afVule79vaPwf7Jpb1PlhdnKR3o3k+7AkKcpj9
	/tmKLkDhdZ13L2fe25TolnDxQmw==
X-Google-Smtp-Source: AGHT+IFeAgC0uw9c+8LafGLGz/f6/NPZAPXmK9qXp7aoSKF9A72AfmoYnPNSSr0uyMWXg523FecZ0oA8sQssQiXDkg==
X-Received: from ilbbo32.prod.google.com ([2002:a05:6e02:3420:b0:430:ccc7:4f1e])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:4815:b0:65c:fe5b:9f4d with SMTP id 006d021491bc7-65cfe5ba58emr301994eaf.47.1766012727236;
 Wed, 17 Dec 2025 15:05:27 -0800 (PST)
Date: Wed, 17 Dec 2025 23:05:26 +0000
In-Reply-To: <aUH_7yYZsmFlRvEc@kernel.org> (message from Oliver Upton on Tue,
 16 Dec 2025 16:57:19 -0800)
Mime-Version: 1.0
Message-ID: <gsntzf7g1zgp.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v5 18/24] KVM: arm64: Enforce PMU event filter at vcpu_load()
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
X-CRM114-CacheID: sfid-20251217_150529_276513_D62E9486 
X-CRM114-Status: GOOD (  15.94  )
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

> Re-reading this patch...

> On Tue, Dec 09, 2025 at 08:51:15PM +0000, Colton Lewis wrote:
>> The KVM API for event filtering says that counters do not count when
>> blocked by the event filter. To enforce that, the event filter must be
>> rechecked on every load since it might have changed since the last
>> time the guest wrote a value.

> Just directly state that this is guarding against userspace programming
> an unsupported event ID.

Sure

>> +static void kvm_pmu_apply_event_filter(struct kvm_vcpu *vcpu)
>> +{
>> +	struct arm_pmu *pmu = vcpu->kvm->arch.arm_pmu;
>> +	u64 evtyper_set = ARMV8_PMU_EXCLUDE_EL0 |
>> +		ARMV8_PMU_EXCLUDE_EL1;
>> +	u64 evtyper_clr = ARMV8_PMU_INCLUDE_EL2;
>> +	u8 i;
>> +	u64 val;
>> +	u64 evsel;
>> +
>> +	if (!pmu)
>> +		return;
>> +
>> +	for (i = 0; i < pmu->hpmn_max; i++) {

> Iterate the bitmask of counters and you'll handle the cycle counter 'for
> free'.

Will do.

> <snip>

>> +		val = __vcpu_sys_reg(vcpu, PMEVTYPER0_EL0 + i);
>> +		evsel = val & kvm_pmu_event_mask(vcpu->kvm);
>> +
>> +		if (vcpu->kvm->arch.pmu_filter &&
>> +		    !test_bit(evsel, vcpu->kvm->arch.pmu_filter))
>> +			val |= evtyper_set;
>> +
>> +		val &= ~evtyper_clr;
>> +		write_pmevtypern(i, val);

> </snip>

> This all needs to be shared with writethrough_pmevtyper() instead of
> open-coding the same thing.

Will do.

> Thanks,
> Oliver

