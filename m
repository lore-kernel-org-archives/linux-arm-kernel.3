Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD84C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 06:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QrQp4u7BKm6gGzZCqOb8APZXqNDJNPpqpX8eEWyOLX8=; b=WeVolkfkoKesMIEBHK5RLVdrKD
	zfIHPZHyCCoHSQStgH4pyA2F8d0d6qyfhRkiDbndVqRfPQtAXLAGW7R8xGGL9ceK7BxlGdPfQzme0
	S7cSrj3qcMa3VXjgXe2Vze2PsfOqmtS6T2lH3MklBQmJCyhLLkOX+YsgwwC3f8Dn721U9OHce+WmC
	8Z4rz4AIBQTV1rKWAoST937Y3PhPUk8nxXQjhMygoHi1TSFBssZtIMSqguvIDj9ACTAeMVlT7TcgY
	WNJh5lEtu35EkEAv9pLaipQgVzs7oy+OPca60bvUr/Nr/wgTYfmjKOzeraVfAusTO34wDc/vchg3E
	ZNb9Kcsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvVmb-0000000DzgQ-1rlY;
	Fri, 21 Mar 2025 06:23:05 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvVkV-0000000DzE1-03Ge
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 06:20:56 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-22403cbb47fso30030005ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 23:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1742538054; x=1743142854; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QrQp4u7BKm6gGzZCqOb8APZXqNDJNPpqpX8eEWyOLX8=;
        b=qCWi56UPumqk7Q8vY4U7lwba9goqPC5PmXFIewPOjYR4Vi1NDAFpjyZIUM3UMIt4lW
         m2AI7pF7fjWSdRugU9OmInDIdJPWnkTWP/JBEQ3tNY0iNgqgmBizQNr3calJ46Wv3xFL
         9+qlUu5EUMFW925vCyjQ5tpnzEg42D684oFYwpvRzBFNK3bon7A8d9l64wrJWYPj1J7H
         T2dPtuGvs6di3tNXBkab3XmPOY8WYFH6fh46KmCX+Rt7bPNE33981s2JPyMSRZL+PRp9
         v0+WLOjlTwOgQsfCUqTfu30sMBsC+fHFpJnEYR6XaSyjIsorBDr5yGa17TkJT21hTdE2
         sumw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742538054; x=1743142854;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QrQp4u7BKm6gGzZCqOb8APZXqNDJNPpqpX8eEWyOLX8=;
        b=pu8X0BPkK0XewRLmOphBTtw9QTQr0D5qCSBz6uw5Nu0sPrfPbTE7g0Ah72Kw7habcu
         y+nRfrCtL8+nUFpemR2GvwLZC0tw7n9H46v0HUK6BMkGaSsCN+e6emMrUq5XGeu+xNSk
         wcPTAmBmwwfRcJe+/Eg6QRIB11cc+IZm1akEuT99ylMITmkIZTguXwlAb1FXAntM3IXL
         pVs8nqhllpBwyShky30uFcLuLapkSC/vabUqDhao8/3DqI5q4V8KrwmNafS0dliOeW7E
         6oMb9QocvMTuVvITBeT3I9DB4aQXvQkBcFRUff5UIthkYlZ1Wm1C7FEYKnxEzem2XM2P
         BOJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnBBzQH/z6bZSiAJsj9qPfZQzsXxCNWlXVv2XKJdR9rFY2UdgmJFIrhbaT6HGAhUUSU/Fj2dDbd3DnU5kF6FiL@lists.infradead.org
X-Gm-Message-State: AOJu0YyzxTx0km//D5vWF1kVuatyvzK6+ZaBEl2gYo1Ic6ABjdzNsIeh
	4rUiuFxzom1Uh+gFdAiD/be6Ls/83l2f7J+uJlRcc0VaTNbemEra/oXqIU9dp58=
X-Gm-Gg: ASbGncv1C7Z848jRv4wVPxSLMax/G1b8+yjtdNdZbb0NgN9SgrJb5XXKSm1eEDfmhc2
	vOIZqTKe6ci/GY4rdnlLvotG02qoqmF87n3l2AwV7D9P2o6p5xp+u/xRuD6o5YMgwfiL2MGnxgS
	otd7JHTvQ9f0IAUL7o8c1EozOpQ4AY5iQb5qgQ368p9Sj0YOg12ZOKhpnvbhZN37c/Hky3eFZuU
	+eN8izu4UPc7TvS8Kiu7Dc4vjvUFTLatSDstd8OPAGT7P2hvrR4yk63URTdJLK0rMSQuyrCrGd9
	1AfHMIa+rTEQsrVlmWWxuJ+zxIH01wIDT4gosZs8gkDCrj2FlW0vItOdew==
X-Google-Smtp-Source: AGHT+IHe/Q9y2RWJQUcpyi6SzGNru8XSVxXcx9in0WkoW/tVessiSlrZXGzWXyQI3jGi8CYr6TyrAg==
X-Received: by 2002:a17:902:8b85:b0:21f:bd66:cafa with SMTP id d9443c01a7336-22780c7ba20mr26069275ad.17.1742538054144;
        Thu, 20 Mar 2025 23:20:54 -0700 (PDT)
Received: from [157.82.207.107] ([157.82.207.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811b806asm8600895ad.111.2025.03.20.23.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 23:20:53 -0700 (PDT)
Message-ID: <54cb5388-e278-41de-be29-d578cc5c37c5@daynix.com>
Date: Fri, 21 Mar 2025 15:20:49 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] KVM: arm64: PMU: Use multiple host PMUs
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 devel@daynix.com
References: <20250319-hybrid-v1-1-4d1ada10e705@daynix.com>
 <Z9pze3J2_zrTk_yC@linux.dev>
 <e8324d9d-3756-41cf-a102-28572e302368@daynix.com>
 <86plidmjwh.wl-maz@kernel.org>
 <bd681ec6-0b4c-47d9-8a4a-b7324c0883a6@daynix.com>
 <86o6xxmg87.wl-maz@kernel.org>
 <aabd71eb-286b-475c-a30e-d5cf5c4f2769@daynix.com>
 <86msdhmemw.wl-maz@kernel.org>
 <cd7b4528-34a3-4d87-9711-acc2c2e6f6e1@daynix.com>
 <86ldt0n9w1.wl-maz@kernel.org> <Z9sSMJAlf7cQ5viu@linux.dev>
 <0d84bc94-1c65-4737-a2eb-aa7f96a7d1e0@daynix.com>
 <86iko4m5i4.wl-maz@kernel.org>
 <ba9cd6d2-1ee5-478a-8102-42b4dac411ce@daynix.com>
 <86cyebmxo7.wl-maz@kernel.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <86cyebmxo7.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_232055_327624_114DB228 
X-CRM114-Status: GOOD (  42.30  )
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

On 2025/03/21 2:14, Marc Zyngier wrote:
> On Thu, 20 Mar 2025 09:52:59 +0000,
> Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>
>> On 2025/03/20 18:10, Marc Zyngier wrote:
>>> On Thu, 20 Mar 2025 06:03:35 +0000,
>>> Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>>>
>>>> On 2025/03/20 3:51, Oliver Upton wrote:
>>>>> On Wed, Mar 19, 2025 at 06:38:38PM +0000, Marc Zyngier wrote:
>>>>>> On Wed, 19 Mar 2025 11:51:21 +0000, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>>>>>> What about setting the flag automatically when a user fails to pin
>>>>>>> vCPUs to CPUs that are covered by one PMU? There would be no change if
>>>>>>> a user correctly pins vCPUs as it is. Otherwise, they will see a
>>>>>>> correct feature set advertised to the guest and the cycle counter
>>>>>>> working.
>>>>>>
>>>>>> How do you know that the affinity is "correct"? VCPU affinity can be
>>>>>> changed at any time. I, for one, do not want my VMs to change
>>>>>> behaviour because I let the vcpus bounce around as the scheduler sees
>>>>>> fit.
>>>>
>>>> Checking the affinity when picking the default PMU; the vCPU affinity
>>>> is the only thing that rules the choice of the default PMU even now.
>>>>
>>>> Perhaps we may model the API as follows: introduce another "composite"
>>>> PMU that works on any core but only exposes the cycle counter. Robust
>>>> VMMs will choose it or one of hardware PMUs with
>>>> KVM_ARM_VCPU_PMU_V3_SET_PMU. KVM will choose the default PMU according
>>>> to the vCPU affinity at the point of KVM_ARM_VCPU_INIT otherwise. If
>>>> the affinity is covered by one hardware PMU, that PMU will be chosen
>>>> as the default. The "composite" PMU will be the default otherwise.
>>>
>>> This makes no sense to me. A VCPU is always affine to a PMU, because
>>> we do not support configurations where only some CPUs have a PMU. This
>>> is an all-or-nothing situation.
>>
>> At least isn't it fine to have the composite PMU with a new value for
>> KVM_ARM_VCPU_PMU_V3_SET_PMU?
> 
> Not sure KVM_ARM_VCPU_PMU_V3_SET_PMU is the right hook (it takes a PMU
> 'type', which is under control of the perf subsystem). But if we can
> find a value that is guaranteed to be unique, why not.
> 
>>> More importantly, you keep suggesting the same "new default", and I
>>> keep saying NO.
>>>
>>> My position is clear: if you want a *new* behaviour, you *must* add a
>>> new flag that the VMM explicitly provides to enable this CC-only PMU.
>>> No change in default behaviour at all.
>>>
>>> I'm not going to move from that.
>>
>> Why not? It will not break anything guaranteed to work in the past.
> 
> It doesn't have to be guaranteed. It just has to *exist*. That's the
> Linux ABI for you.
> 
>> Currently KVM only guarantees that the emulated PMU correctly counts
>> only when
>> 1) the vCPU affinity is contained by one PMU and
>> 2) it will not expand
>>
>> Breaking these conditions will make the behavior of the emulated PMU
>> undefined. Now I'm proposing to remove 1).
> 
> And I'm saying no to that. I'm also getting tired of arguing the same
> point on and on.
> 
> We currently have two different behaviours:
> 
> - either you explicitly set a PMU, and the affinity of this PMU
>    constraints the affinity of the vcpus. The vcpus are not allowed to
>    run outside of this affinity. Everything counts all the time.
> 
> - or you don't explicitly set a PMU, and a default PMU will be picked
>    from the current affinity of the first vcpu. Your vcpus will be able
>    to run anywhere, but the virtual PMU will *only* count when the
>    vcpus are affine to the default PMU. When the vcpus are not affine
>    to default PMU, *nothing* counts.
> 
> These two behaviours are ABI. They are not changing. They don't get
> relaxed, they don't get tightened, they stay just as they are,
> forever.

Is the latter one is really ABI? I see it as part of behaviors that are 
undefined and not included in ABI for the following reasons:

1) It depends on the scheduler behavior, which cannot be ABI.

2) It provides a broken PMU so the proposed behavioral change is similar 
a bug fix though I call it a undefined behavior instead of a bug as it 
is explicitly told that there is no assurance that the PMU works in such 
a scenario.

3) The userspace could not have relied on it so the "no regressions" 
rule cannot be applied here; how can anyone have a userspace that relies 
on a kernel behavior that depends on scheduling?

But for 3), Oliver raised a concern for the guest compatibility so I'd 
like to hear an explanation for that concern.

> 
> You want a *third* behaviour, go ahead. Define it the way you want.
> But the behaviours described above will stay unchanged.> > I'm looking forward to your patches implementing it, but I am also
> done arguing on it.

I understand the discussion is tiring but I want to know the reasoning 
behind such a design decision before sending an RFC patch to a VMM 
(QEMU) so that I can explain them why it is necessary in turn.

Regards,
Akihiko Odaki

> 
> 	M.
> 


