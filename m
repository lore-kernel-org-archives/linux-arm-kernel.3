Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92426C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 11:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gvHNVZyKR2DtKBoW11M6k8zN4d/kmrkOW2ikjxRgacU=; b=0vU0M6lPGhllAA6HRQshhEd1JG
	UDYKjQhEbCeFfkON39D/FijQRveAh0ED60UPrRNHAxySavSy/D5wxlmS3QB/YVXJzwMfynvjPcUsd
	JrOQAbDwQZiOsCvnP/pCXK8INxhlq0fklkkHe56BhoQvlePlWtWQoIr71P+6iFNot08wmTr6Jz0mN
	cCCy8ZnxdS/zjlgatKqHFuMoRQbBYDedujsTFVQL4LEA+UxnxDjmttf8TT3UEYiP8B1GhfvI0oCtJ
	SXouMhmhAWjfvwf8oy80eNLuGYmYC7KsB81/oCLYgoBzf3t/mkJbwjUWEop/1RJdpu57l3b0oR+id
	kF67W1dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1turbC-00000008p6i-0qTS;
	Wed, 19 Mar 2025 11:28:38 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1turZ1-00000008of6-1NAZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 11:26:24 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2254e0b4b79so30425145ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 04:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1742383582; x=1742988382; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gvHNVZyKR2DtKBoW11M6k8zN4d/kmrkOW2ikjxRgacU=;
        b=MomDi6WR1ulTyPggI17WaSazxpQc6WQf/Fmtuw/H1S9MpUJYhRro+ebObSDdUiE4w2
         uXU+FARaf6Kg2zC2STMDcltesAP/qHZFkc86XI2wa+ny7l4Yl8aQEzW6EXVom5c2R8hY
         dUJMqsCbK32UBIqYStNqN6rQ7p8l+VYSKyqXr6pj8U1fA1vEUMrimMWlBjuRxeMd2yLo
         jgqrgGmOfFdpH1L4Y3bpgtO0d36syCqWjqI9y+kcphggaNnwzxToXCF+4uHYgHQntAzz
         6q0twcJK6qMwz/FxCxGMQeGdOhjbNym8ZYD+DmgZaET8kfbW2PYoP8fOKpm/4JnRqT3p
         PBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742383582; x=1742988382;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gvHNVZyKR2DtKBoW11M6k8zN4d/kmrkOW2ikjxRgacU=;
        b=bQSOCIw/1V7028Vywn+oIUr6PJDtVpy3YtDk87aBltxT457y847smd8TVG4/IPXa+v
         i7nwKuTg8F9h++i1BxzsWmOYQ1IQp2xPTuazA4Alw5GTYKsQ9Ohe40U+CppJkITVO9Jg
         Vec60wgIKZQFZE19aSjurNZgXnw7OpZX4zVkTPgpu1C9sik20xJKa1u7st9q2f85KHeI
         f2jThCFSwTieJz527nsy3TMILaviN6lWclDZ77CY3RQOMdC5nYozo6zEd5jj5B67mO2l
         PqeC50H1AOThpjC0L9fPKXR4hcVSgNtPQmJXtV1jKsKntH7Z8IwNREFQGYQbbyxOpDSL
         yGYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeUdF4hXs0FvsLuq7gtvBvr+3uKza40/PtJ7dznifVeqFYLRVy7BCZE5vRv/enmH23dOIkeCIDfjHihWvY2396@lists.infradead.org
X-Gm-Message-State: AOJu0YyaMY/hk0nb593HNZ5xI10pF5z7+YHnZS4dbj1qwe+T6wnLr78T
	NjlKg4fZq/mBTHn1yG3zyyMLGJrGj4L51BXrZwUgY2s+/pIpqPeW564tJtWl308=
X-Gm-Gg: ASbGncs4LbnqMkrF1im6MCWnYFMY2z2yQlLm+AMSZ7+gX1cmxvm1jMVBKCz+jRmcuSf
	4ZoprNjbfa2YtzlJ9h/nn3/WU8vmZDbck8FRKHevyZYUs4vlJPDm179FD/sgHQ4V4JR4SKUOiT4
	9g02tQ5J3mCi6uCvRgKjtGhGdfMprtKUAzwAHosxgSbNQW1kYTy+Z3GhQ81ssTK6zZuWG80x7bk
	0WvcQcfCOPcCCUP+JaugJKXTnrWlThHRr7kNMfX9roAKjw3ON25hCRdR+J7ZBnVU73K7doNhTC4
	4Ba8u0Tn17wIjJ7pOtCjm6CK3eCS9sGGbgMI6iLnZFLIH9Q0e4G9PRKqpw==
X-Google-Smtp-Source: AGHT+IHYI4Zbz8LC6Q+OTsZJdgqJkzYI1MdKioTutHwbHR0I7glDazEa7IUKMxIdUxtXsKc3B5OuKg==
X-Received: by 2002:a05:6a21:3a48:b0:1ee:63d7:1d32 with SMTP id adf61e73a8af0-1fbe8334084mr4316868637.0.1742383582502;
        Wed, 19 Mar 2025 04:26:22 -0700 (PDT)
Received: from [157.82.207.107] ([157.82.207.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711529526sm11302182b3a.24.2025.03.19.04.26.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 04:26:22 -0700 (PDT)
Message-ID: <aabd71eb-286b-475c-a30e-d5cf5c4f2769@daynix.com>
Date: Wed, 19 Mar 2025 20:26:18 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] KVM: arm64: PMU: Use multiple host PMUs
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 devel@daynix.com
References: <20250319-hybrid-v1-1-4d1ada10e705@daynix.com>
 <Z9pze3J2_zrTk_yC@linux.dev>
 <e8324d9d-3756-41cf-a102-28572e302368@daynix.com>
 <86plidmjwh.wl-maz@kernel.org>
 <bd681ec6-0b4c-47d9-8a4a-b7324c0883a6@daynix.com>
 <86o6xxmg87.wl-maz@kernel.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <86o6xxmg87.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_042623_372712_3DF882C0 
X-CRM114-Status: GOOD (  32.85  )
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

On 2025/03/19 20:07, Marc Zyngier wrote:
> On Wed, 19 Mar 2025 10:26:57 +0000,
> Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>
>>>> It should also be the reason why the perf program creates an event for
>>>> each PMU. tools/perf/Documentation/intel-hybrid.txt has more
>>>> descriptions.
>>>
>>> But perf on non-Intel behaves pretty differently. ARM PMUs behaves
>>> pretty differently, because there is no guarantee of homogeneous
>>> events.
>>
>> It works in the same manner in this particular aspect (i.e., "perf
>> stat -e cycles -a" creates events for all PMUs).
> 
> But it then becomes a system-wide counter, and that's not what KVM
> needs to do.

There is also an example of program profiling:
"perf stat -e cycles \-- taskset -c 16 ./triad_loop"

This also creates events for all PMUs.

> 
>>>> Allowing to enable more than one counter and/or an event type other
>>>> than the cycle counter is not the goal. Enabling another event type
>>>> may result in a garbage value, but I don't think it's worse than the
>>>> current situation where the count stays zero; please tell me if I miss
>>>> something.
>>>>
>>>> There is still room for improvement. Returning a garbage value may not
>>>> be worse than returning zero, but counters and event types not
>>>> supported by some cores shouldn't be advertised as available in the
>>>> first place. More concretely:
>>>>
>>>> - The vCPU should be limited to run only on cores covered by PMUs when
>>>> KVM_ARM_VCPU_PMU_V3 is set.
>>>
>>> That's userspace's job. Bind to the desired PMU, and run. KVM will
>>> actively prevent you from running on the wrong CPU.
>>>
>>>> - PMCR_EL0.N advertised to the guest should be the minimum of ones of
>>>> host PMUs.
>>>
>>> How do you find out? CPUs can be hot-plugged on long after a VM has
>>> started, bringing in a new PMU, with a different number of counters.
>>>
>>>> - PMCEID0_EL0 and PMCEID1_EL0 advertised to the guest should be the
>>>> result of the AND operations of ones of host PMUs.
>>>
>>> Same problem.
>>
>> I guess special-casing the cycle counter is the only option if the
>> kernel is going to deal with this.
> 
> Indeed. I think Oliver's idea is the least bad of them all, but man,
> this is really ugly.
> 
>>>> Special-casing the cycle counter may make sense if we are going to fix
>>>> the advertised values of PMCR_EL0.N, PMCEID0_EL0, and
>>>> PMCEID1_EL0. PMCR_EL0.N as we can simply return zero for these
>>>> registers. We can also prevent enabling a counter that returns zero or
>>>> a garbage value.
>>>>
>>>> Do you think it's worth fixing these registers? If so, I'll do that by
>>>> special-casing the cycle counter.
>>>
>>> I think this is really going in the wrong direction.
>>>
>>> The whole design of the PMU emulation is that we expose a single,
>>> architecturally correct PMU implementation. This is clearly
>>> documented.
>>>
>>> Furthermore, userspace is being given all the relevant information to
>>> place vcpus on the correct physical CPUs. Why should we add this sort
>>> of hack in the kernel, creating a new userspace ABI that we will have
>>> to support forever, when usespace can do the correct thing right now?
>>>
>>> Worse case, this is just a 'taskset' away, and everything will work.
>>
>> It's surprisingly difficult to do that with libvirt; of course it is a
>> userspace problem though.
> 
> Sorry, I must admit I'm completely ignorant of libvirt. I tried it
> years ago, and concluded that 95% of what I needed was adequately done
> with a shell script...
> 
>>> Frankly, I'm not prepared to add more hacks to KVM for the sake of the
>>> combination of broken userspace and broken guest.
>>
>> The only counter argument I have in this regard is that some change is
>> also needed to expose all CPUs to Windows guest even when the
>> userspace does its best. It may result in odd scheduling, but still
>> gives the best throughput.
> 
> But that'd be a new ABI, which again would require buy-in from
> userspace.  Maybe there is scope for an all CPUs, cycle-counter only
> PMUv3 exposed to the guest, but that cannot be set automatically, as
> we would otherwise regress existing setups.
> 
> At this stage, and given that you need to change userspace, I'm not
> sure what the best course of action is.

Having an explicit flag for the userspace is fine for QEMU, which I 
care. It can flip the flag if and only if threads are not pinned to one 
PMU and the machine is a new setup.

I also wonder what regression you think setting it automatically causes.

Regards,
Akihiko Odaki

> 
> Thanks,
> 
> 	M.
> 


