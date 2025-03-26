Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58258C36010
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 17:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8qVND4tenJBQx/xK/Ve6LMeZrg3oeI6UK9LzOuingT0=; b=FvhUp1pbAF2/iotAmZCKNIv1v6
	gjj6fUK1YAxNe4BAatOo9+K+CcNblPKOqCT2X/VeC+nuWtXbrd8dK2RtwttB6t5idXifmBKkqMgZH
	p6oKPJda+GOvwtA65sZOuyxT88ft79vNlSYH7urI5A0lQex92pC7d2mn159gPQoh5JO0d5Z9v+pH5
	LS67aY8Y1ePGm8FqQqBAZJqW1sErigXZPR2lnqiiXzWBjdLnminiWVwX0JBBG+nKqaa5QNG7tUbDA
	cToRoB4An1QAHgVfD0Hc32FX5LNcgKOc53jYgMxYCBgTxw1/wKrjx9NfAvqmL8WlfjMF/rzKSCSFi
	hMFUyNkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txUlU-00000009EgI-2IQA;
	Wed, 26 Mar 2025 17:42:08 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txUi6-00000009Di9-1dJH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 17:38:39 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso1013775e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 10:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743010716; x=1743615516; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8qVND4tenJBQx/xK/Ve6LMeZrg3oeI6UK9LzOuingT0=;
        b=VUw2WG/0t0/RkzItxmpy2eGZjrbfTTg2FpxdExgxMA6bkB6CYMy31nG/El4Hg/N4uo
         hqi7WmzSnxdc+QQriSEQA+7IKUrjZWLC15E3Y2HdcdohQ7ijQj4qeGhCFbix2f+GkoEi
         /beHVx8OjjOMD2CI5UhGDAmyoolgCtwg72JjlQnbDxtdCl2O5FeGxJaKS2rIzVvUJH9T
         TPAPdKzt4Sip3Lz4jHLlsEg5ZZlNgh/sa6myvBYuC5Wst8N3ZZDK747gLTRdHoZY6a4z
         SylK2uIOOKOKs2Aqy9mn0X5ByT7HCP/FOzMAcP91SlC/vB7fG9cYv2jch5h/+MgPl/Xn
         vShw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743010716; x=1743615516;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8qVND4tenJBQx/xK/Ve6LMeZrg3oeI6UK9LzOuingT0=;
        b=xVb4M5w2WKPKxrhVSw5IpmIDkuuD6yz2Te0BHgjcc5MVls3248egDS+Ovjgv30PeRa
         JMHhJ0t2QYvLHVIC0Aprt0/QmJ8zKoSmpb2RswW1/jBiMbQAkiWGKUbjGpRIwRlz2pi5
         pQTFYfG9npCjil9suXwgx9tYA4j4tmxQYiP2hJc+5KwHQtZ7DWIJzoZmf3Ci+gQ/5EEd
         5EURAAMXUhH8z8Lq86KpmZzbilj/BevEXA1WVnsOtgmm+2K3DoCmafT9pPQ/9HUN9jkz
         5M/eWvwH0lGvWJWCSSiZD1nQRJPbqNRlAQ2LKziq0tMk+fJIpbFR3Tj0uwvMf/kY2ru9
         Rqjw==
X-Forwarded-Encrypted: i=1; AJvYcCWYP/HLI4c8LJ+Ytipk8nb24mvQ8wNTVlH5ablSk/t9uWP5lRjjprY4qDUP78WIjLNjJsM4nRqHlJrqu9Q9Qu6v@lists.infradead.org
X-Gm-Message-State: AOJu0YxpcnHPMQ385CLkf7gw1Z9we/luDahjojk1QH6HzBx8NoKD6xSs
	UERilDBub25TchvK1gL+0HDmC0T4N6L1e1xv7H1DwIgHEBUx53MQuK5n3TrFssU=
X-Gm-Gg: ASbGncvgGPTWzkbUL8uGLh2IwhPFcazXEEpvUK2DOwxCuFVRtN53aGjTy01p9tVSxjj
	437jCmrwVVIJuJ0Iad/hqH8ZQHbioqPfXW/g7E9ktzwinH+5/+HnfDc7+L0WxQjhy2jAMfj4lNm
	QWqPreoEAOVM7FebtxyBkNE5No2ty+1TA0tRNjDo3nVRHiPaq0gGobGhWBBD3KyNhz7gXHtkYoc
	MSkQCt8ZkmdRfd1JL6UFijs1AllZ2bmpv54BtipDfw92wgvULsdRa2zl0yKT4twYdkXeNln1wDU
	tT9u57eK4jl3qiItwFP3uAJ8RZkLQkxytT2/CVGbGBbuBKyXOg==
X-Google-Smtp-Source: AGHT+IFWImSgAxE2tnY9m2ZViZ+epH+rNo6E42n/cKyi3Pxy880VgCejpCzrgRBe13sBLMsd3ILXAQ==
X-Received: by 2002:a05:600c:1e0d:b0:43d:10c:2f60 with SMTP id 5b1f17b1804b1-43d8524f43cmr2296105e9.24.1743010716400;
        Wed, 26 Mar 2025 10:38:36 -0700 (PDT)
Received: from [192.168.1.247] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a6326sm17050515f8f.29.2025.03.26.10.38.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 10:38:36 -0700 (PDT)
Message-ID: <f7d543f6-2660-460f-88ac-741dd47ed440@linaro.org>
Date: Wed, 26 Mar 2025 17:38:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 5/8] KVM: arm64: Introduce module param to
 partition the PMU
To: Colton Lewis <coltonlewis@google.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>
Cc: kvm@vger.kernel.org, robh@kernel.org, linux@armlinux.org.uk,
 catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
 oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, mark.rutland@arm.com, pbonzini@redhat.com,
 shuah@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <gsnt1pulnepv.fsf@coltonlewis-kvm.c.googlers.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <gsnt1pulnepv.fsf@coltonlewis-kvm.c.googlers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_103838_435213_0BCFA6D5 
X-CRM114-Status: GOOD (  47.11  )
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



On 25/03/2025 6:32 pm, Colton Lewis wrote:
> Hi James,
> 
> Thanks for the review.
> 
> James Clark <james.clark@linaro.org> writes:
> 
>> On 13/02/2025 6:03 pm, Colton Lewis wrote:
>>> For PMUv3, the register MDCR_EL2.HPMN partitiones the PMU counters
>>> into two ranges where counters 0..HPMN-1 are accessible by EL1 and, if
>>> allowed, EL0 while counters HPMN..N are only accessible by EL2.
> 
>>> Introduce a module parameter in KVM to set this register. The name
>>> reserved_host_counters reflects the intent to reserve some counters
>>> for the host so the guest may eventually be allowed direct access to a
>>> subset of PMU functionality for increased performance.
> 
>>> Track HPMN and whether the pmu is partitioned in struct arm_pmu
>>> because both KVM and the PMUv3 driver will need to know that to handle
>>> guests correctly.
> 
>>> Due to the difficulty this feature would create for the driver running
>>> at EL1 on the host, partitioning is only allowed in VHE mode. Working
>>> on nVHE mode would require a hypercall for every register access
>>> because the counters reserved for the host by HPMN are now only
>>> accessible to EL2.
> 
>>> The parameter is only configurable at boot time. Making the parameter
>>> configurable on a running system is dangerous due to the difficulty of
>>> knowing for sure no counters are in use anywhere so it is safe to
>>> reporgram HPMN.
> 
> 
>> Hi Colton,
> 
>> For some high level feedback for the RFC, it probably makes sense to
>> include the other half of the feature at the same time. I think there is
>> a risk that it requires something slightly different than what's here
>> and there ends up being some churn.
> 
> I agree. That's what I'm working on now. I justed wanted an iteration or
> two in public so I'm not building on something that needs drastic change
> later.
> 
>> Other than that I think it looks ok apart from some minor code review 
>> nits.
> 
> Thank you
> 
>> I was also thinking about how BRBE interacts with this. Alex has done
>> some analysis that finds that it's difficult to use BRBE in guests with
>> virtualized counters due to the fact that BRBE freezes on any counter
>> overflow, rather than just guest ones. That leaves the guest with branch
>> blackout windows in the delay between a host counter overflowing and the
>> interrupt being taken and BRBE being restarted.
> 
>> But with HPMN, BRBE does allow freeze on overflow of only one partition
>> or the other (or both, but I don't think we'd want that) e.g.:
> 
>>    RNXCWF: If EL2 is implemented, a BRBE freeze event occurs when all of
>>    the following are true:
> 
>>    * BRBCR_EL1.FZP is 1.
>>    * Generation of Branch records is not paused.
>>    * PMOVSCLR_EL0[(MDCR_EL2.HPMN-1):0] is nonzero.
>>    * The PE is in a BRBE Non-prohibited region.
> 
>> Unfortunately that means we could only let guests use BRBE with a
>> partitioned PMU, which would massively reduce flexibility if hosts have
>> to lose counters just so the guest can use BRBE.
> 
>> I don't know if this is a stupid idea, but instead of having a fixed
>> number for the partition, wouldn't it be nice if we could trap and
>> increment HPMN on the first guest use of a counter, then decrement it on
>> guest exit depending on what's still in use? The host would always
>> assign its counters from the top down, and guests go bottom up if they
>> want PMU passthrough. Maybe it's too complicated or won't work for
>> various reasons, but because of BRBE the counter partitioning changes go
>> from an optimization to almost a necessity.
> 
> This is a cool idea that would enable useful things. I can think of a
> few potential problems.
> 
> 1. Partitioning will give guests direct access to some PMU counter
> registers. There is no reliable way for KVM to determine what is in use
> from that state. A counter that is disabled guest at exit might only be
> so temporarily, which could lead to a lot of thrashing allocating and
> deallocating counters.
> 
> 2. HPMN affects reads of PMCR_EL0.N, which is the standard way to
> determine how many counters there are. If HPMN starts as a low number,
> guests have no way of knowing there are more counters
> available. Dynamically changing the counters available could be
> confusing for guests.
> 

Yes I was expecting that PMCR would have to be trapped and N reported to 
be the number of physical counters rather than how many are in the guest 
partition.

> 3. If guests were aware they could write beyond HPMN and get the
> counters allocated to them, nothing stops them from writing at counter
> N and taking as many counters as possible to starve the host.
> 

Is that much different than how it is now with virtualized PMUs? As in, 
the guest can use all of the counters and the host's events will have to 
contend with them.

You can still have a module param, except it's more of a limit to the 
size of the partition rather than fixing it upfront. The default value 
would be the max number of counters, allowing the most flexibility for 
the common use case where it's unlikely that both host and guests are 
contending for all counters. But if you really want to make sure the 
host doesn't get starved you can set it to a lower value.

All this does sound a bit like it could be done on top of the simple 
partitioning though. And it's mainly for making BRBE more accessible, 
which I'm not 100% convinced that the blackout windows are that big of a 
problem. We could say BRBE may have some holes if the host happens to be 
using counters at the same time, and if you want to be certain of no 
holes, use a host with partitioned counters.

James


