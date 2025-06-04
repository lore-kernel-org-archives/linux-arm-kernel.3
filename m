Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A93C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 20:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=l2ZfRBtkCFUyGNfWWgvViMBCRTnEKTD5lF2sn5A9h8E=; b=G1Oqs3eDX/f1gh
	D6e/5YJh+vkE56IOXVsSsX9VhFNDtEecatkQ4U/7He+wLYuemrOWYAQz9sQowKcqW7CCnUG1lKcc7
	LXWhn12gtFrhg/LeILTZ2S0fJt5/RhflwcxRHXz8hFIxuswjRJhTcJlEm1W+lKSkW/Z5pa+2wm53Y
	PvwKuMYlQzf63kk0sirkRNs3REZOPyHwLK+UHEcOQjq50vrQ5YxUx0WSLgbvcWzke9BkmKdNnzHk4
	L0CJTaL43qPwM0RxmmWTejcj2a4lSNTpc/qQnaTGC7x2pZviU2rQubnyZiaSFemGI0ApViuwdWAXM
	MfP76JsQoDSAiMdNMlnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMuu4-0000000ECgE-1lQs;
	Wed, 04 Jun 2025 20:40:04 +0000
Received: from mail-oa1-x4a.google.com ([2001:4860:4864:20::4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMuT1-0000000EALs-2pFq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 20:12:08 +0000
Received: by mail-oa1-x4a.google.com with SMTP id 586e51a60fabf-2e43c3e66d1so318163fac.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 13:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749067926; x=1749672726; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l2ZfRBtkCFUyGNfWWgvViMBCRTnEKTD5lF2sn5A9h8E=;
        b=ruxnXA56ptz5XeOO0aCy14StnRzyeTDEpqVxEZg55wUv1DJTHKGS2qYdiOQxbCu29t
         4NJLcoV0YUiIvanuz8rAx/iizfVLcRML7K4UkFZwCT8K8FDMF/E9Da4rP2XAtuvOwXHy
         rdnM5B2tDojsEk8G3facHFt+YvR3/tW68WI5Jr1Dh/roeC017TKJZpGF2CNV8UAIuaUA
         Vf5xu75izwNzFTRzTtMyTX8zp5/nTaoLqWNfGAz9BODMteKKW6HXAco8O9o6qLI8gfKT
         er716s+EG4ZL+pCOcSPJSDxppKB42vxbcOyl5mHjfTIyJVtPJ+q4x1wSrvvTN9D9LlOR
         IJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749067926; x=1749672726;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l2ZfRBtkCFUyGNfWWgvViMBCRTnEKTD5lF2sn5A9h8E=;
        b=tnJajl26wMMgqRD9ynWKmbE51LDrSFkRRVp/XF6jGhrAQ4+XNGqQV3CfxKHbreJzxv
         liu8ADDYRy/Ye+2B9W/r6ESqCjv8o2Byz81t2YsXzebCnYSYZj08jv9owIykxb2669tE
         Qm9hbZlg1ZXzQkrNPoYADvBdQgadsJG3VpWwKIlIOAcRhGi3TtT8lTlUjcnEOHeQDsYs
         9R/F5xfNQj7NJfrO8qZ2TEHItdfNt4J+bH7Vg1OX4HxBf3ZTMDjCp8JRuonsof3MChbr
         hGb2lAm/mhCq+9bHLlYkXl824bFYjvKyiLNvxLmsx5Yn5E86QLOPJLxs+eIHkgbkRWzT
         EpAA==
X-Forwarded-Encrypted: i=1; AJvYcCXb96Fffo2hQMo9U9Pe/ss3sOhi9pY9VSZci8+qviNMD64sAALo1kUnkKoSpeFdjzru/nmpi0dhv4JOyXbguj15@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo64NfHDWaYqgmVSEogor9Chf86m7XMr0pzZnqHbRNhTUDhCBh
	nt/0YupgcRw9aaSFQAFxrV1hMfLtBXKgF7z2T7QlBEe1A6zxDkmtg62SMGjJYkR9m5/8FTl1gon
	1sipEfdFP2qJt62XHM0Ene8aIZA==
X-Google-Smtp-Source: AGHT+IHnv4E1vDPP/ZiBUn0UZugjQZBj8858Crg/sw9WU1O9tNE8wE+e6qgJBHSzAxiHAj9ZIzvPLqoD1kotwzxLmg==
X-Received: from oabfz25.prod.google.com ([2002:a05:6870:ed99:b0:2e9:175e:cff3])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6871:e716:b0:2d4:e29d:5297 with SMTP id 586e51a60fabf-2e9bfbe153emr3220979fac.29.1749067926258;
 Wed, 04 Jun 2025 13:12:06 -0700 (PDT)
Date: Wed, 04 Jun 2025 20:12:05 +0000
In-Reply-To: <gsnt1ps033ch.fsf@coltonlewis-kvm.c.googlers.com> (message from
 Colton Lewis on Tue, 03 Jun 2025 21:46:54 +0000)
Mime-Version: 1.0
Message-ID: <gsntplfj1d2i.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH 16/17] KVM: arm64: Add ioctl to partition the PMU when supported
From: Colton Lewis <coltonlewis@google.com>
To: Colton Lewis <coltonlewis@google.com>
Cc: oliver.upton@linux.dev, kvm@vger.kernel.org, pbonzini@redhat.com, 
	corbet@lwn.net, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, mark.rutland@arm.com, shuah@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_131207_714037_09637743 
X-CRM114-Status: GOOD (  17.58  )
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

> Oliver Upton <oliver.upton@linux.dev> writes:

>> On Mon, Jun 02, 2025 at 07:27:01PM +0000, Colton Lewis wrote:
>>> +	case KVM_ARM_PARTITION_PMU: {

>> This should be a vCPU attribute similar to the other PMUv3 controls we
>> already have. Ideally a single attribute where userspace tells us it
>> wants paritioning and specifies the PMU ID to use. None of this can be
>> changed after INIT'ing the PMU.

> Okay

>>> +		struct arm_pmu *pmu;
>>> +		u8 host_counters;
>>> +
>>> +		if (unlikely(!kvm_vcpu_initialized(vcpu)))
>>> +			return -ENOEXEC;
>>> +
>>> +		if (!kvm_pmu_partition_supported())
>>> +			return -EPERM;
>>> +
>>> +		if (copy_from_user(&host_counters, argp, sizeof(host_counters)))
>>> +			return -EFAULT;
>>> +
>>> +		pmu = vcpu->kvm->arch.arm_pmu;
>>> +		return kvm_pmu_partition(pmu, host_counters);

>> Yeah, we really can't be changing the counters available to the ARM PMU
>> driver at this point. What happens to host events already scheduled on
>> the CPU?

> Okay. I remember talking about this before.

>> Either the partition of host / KVM-owned counters needs to be computed
>> up front (prior to scheduling events) or KVM needs a way to direct perf
>> to reschedule events on the PMU based on the new operating constraints.

> Yes. I will think about it.

It would be cool to have perf reschedule events. I'm not positive how to
do that, but it looks not too hard. Can someone comment on the
correctness and feasibility here?

1. Scan perf events and call event_sched_out on all events using the
    counters KVM wants.
2. Do the PMU surgery to change the available counters.
3. Call ctx_resched to reschedule events with the available counters.

There is a second option to avoid a permanent partition up front. We
know which counters are in use through used_mask. We could check if the
partition would claim any counters in use and fail with an error if it
would.

