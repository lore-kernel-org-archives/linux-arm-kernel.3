Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910B1C55822
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 10:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XrcStaMXdkE1hM0cDDyjF0ywdDXESAjsr6s/h+tclqU=; b=aFhgZAAJQC2j1urHw54vtKH3wU
	2xGK5i9pvmmO6r352cZR48WySEVGr/KIzFtCzGVoKMN+poPtciun7Yi7iyAf54p2wCf81KwtTfp42
	BeD18TZWKmWhCntjEDA7G8zZjoixrMqomNYj6y3sbc3DWTGowty+KB+ROiwiSobqtAUjMHvdtKlkk
	rLPmfZ47s+/ZJFcH2ACYfIoqMkD4rkPZyaI9J61atmSYz6hNywyRgqCq/xgFqDJWVL0NfQ5V/qMqz
	i46JdfPYTYh67M7cA0quKUwixOSFa++D/towTbOn18T6Iq3EbbKOXYY4hycKnHQFWSSXmOtOS3/tw
	ZCu/pS+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrYYl-00000003hGz-15d1;
	Wed, 05 Aug 2026 10:09:15 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrYYi-00000003hGC-1uot
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 10:09:13 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-47fdd674e17so465555f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 03:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785924550; x=1786529350; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XrcStaMXdkE1hM0cDDyjF0ywdDXESAjsr6s/h+tclqU=;
        b=GPlpC1CYJFh/Xc6obR9XAeUFha110Fes+pTtMJrJGbNdr0vxyKaW+zhVUPa781YyEG
         TEVkc9YVsGGYKOnPQB7YS/VqSW1Akne90ltF2b8ZbQLzWQ00Z/28VmLGJSK9WCh2PfBs
         56vTOpTJjELmyfCDaeTdb8m8MFI0rYjRj1oASxcFYhZCRU9zSD+ClLY04RmQuQ0jOq52
         lHgHgTl6A+RNTjmfHSVWPGhIxyyQxxbqrWarS9PRmaNj89X31CH+z6rQ04THUlN1LVR8
         2HBS/zlIdErENhF+CpvC5Vq5i3F4XOGLqwPqf8aml1WvVrwvM3dj9te5BXd+x7Yuc8GF
         n2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785924550; x=1786529350;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XrcStaMXdkE1hM0cDDyjF0ywdDXESAjsr6s/h+tclqU=;
        b=OOGRoRIXvUeIvb3yvOyfmJv1SWRSIGpkM/83XUeKhWreTdDn8DWlJ0DZz5RylJ6p98
         V/VozQErpAnDFgXxiVhHoCO/IcFlaS1WlpkcVk8AA1iejP4Am85RLN0GoaIzXXObnLfa
         XABqFZoTyIbbv6goG+yQhDCx+axjRZpxCdpKS8ME+rvat8szELlECzCOuEq645m+s4oo
         C2JCFihzs85tJp+QwsjyiEcPlMyfyFa5Fx1BytP4NS0ai3IaKSScqtnvZa6cBGvIseVo
         RQ7MRsk2klEEM8xeoMiJwozbHyk+yAXPYPSI0mbXRqeZEn2psAnerD+VVgxJvdFmWAZe
         X+Mw==
X-Forwarded-Encrypted: i=1; AHgh+RoGbDpAaJm7Q+G67WXycr0AsU2lJUX1zItJhqQHSU7Y94whPizRBh8sqvVpL6M9Ctr2condaJH0B4cH8aQtxvxH@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6z0KULZQJOtM6X/owF3wRY9cx69Bh0UkQegumYgqD4LkXTwrb
	3o1XgtT9lHnVe1Vly2Neyb0c4LfQ8qMReelDElXh15wYiIo0xrRihlDPZOJPwWhKvds=
X-Gm-Gg: AR+sD1328RlV/gdm7zz0a8Mjbym4BiOWclMyjOeakRRgdxyr1ToXS1rnoCGyXxvpipv
	TwId+9jp46RSsyDlbRO+lOFL3iKidacr3ruVlo0/CUk2OsB25wJeNxkF9OGHyMDpKGR6umJmRWf
	IsDIpE1umZaWX2Q46t1JHWhsB4nEo4mbg3d9vpqISkjLZJ2OXPLNupswBzACZXMNTdJyqA/GX25
	kiaxJ5YR0bQSyaXt/ihIG0G2r3Tb7mZRQoQswOkeFgadIgd+llId5iwycPKGHbafnhseKvsAB/2
	FM36fSKANc2VwXcC/E1G+a9CfySvGQejKzVfDuLfTxnJJKBbDjgdzEfwDrHOTcErPZEgQA3J7os
	oZ0P+AhJjZhEI68rIbAEUeJya5qKZ/msMjLfNU65nknq+rLf4FdG4xzfMgoGZkd6UUaxgpsHAHA
	wrsbpZqlWLDGormc8LF1z094+knngC485sN/CBgbsCi9bb9fQjsV6irTzatmcT/vYLwQo=
X-Received: by 2002:a5d:5291:0:b0:47f:d072:87d7 with SMTP id ffacd0b85a97d-47fec4f663fmr7081483f8f.9.1785924550297;
        Wed, 05 Aug 2026 03:09:10 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47febfda0cbsm7427247f8f.6.2026.08.05.03.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 03:09:09 -0700 (PDT)
Message-ID: <ebb8a1b7-d5c8-4be0-af64-1496a7fd29d0@linaro.org>
Date: Wed, 5 Aug 2026 11:09:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/21] ARM64 PMU Partitioning
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, alexandru.elisei@arm.com, pbonzini@redhat.com,
 corbet@lwn.net, linux@armlinux.org.uk, catalin.marinas@arm.com,
 will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <gsntse4tvbn2.fsf@coltonlewis-kvm.c.googlers.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <gsntse4tvbn2.fsf@coltonlewis-kvm.c.googlers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_030912_521289_ADBAE4F0 
X-CRM114-Status: GOOD (  23.35  )
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



On 04/08/2026 10:06 pm, Colton Lewis wrote:
> James Clark <james.clark@linaro.org> writes:
> 
>> On 23/07/2026 9:57 pm, Colton Lewis wrote:
>>> James Clark <james.clark@linaro.org> writes:
>>>>>> When running the guest on a single CPU I get different counts for the
>>>>>> same event for a single process, although this never happens on a 
>>>>>> host.
>>>>>> I think there might even be some Perf tests which expect them to 
>>>>>> be the
>>>>>> same, and this doesn't depend on whether any events are running on 
>>>>>> the
>>>>>> host or not. Not sure if you ran all the Perf selftests in a guest or
>>>>>> not?
> 
>>>>> I'll investigate but I'm not sure perf is intended to guarantee
>>>>> that. perf stat just runs the event counters but may not write or read
>>>>> them at exactly the same time.
> 
> 
>>>> Is that true? The perf core calls perf_pmu_disable() when a process is
>>>> scheduled out before reading the count of each event of that process in
>>>> an inner loop. The perf_pmu_disable() clears PMCR_EL0.E which freezes
>>>> all of the counters so they can be read out in a consistent state.
> 
>>>> It's important that they're all stopped at the same time because
>>>> counters might be used in metrics as ratios of each other. So I think
>>>> it's deliberately designed that way and appears to not be working in a
>>>> guest now.
> 
>>> By default I think perf assumes events can be measured independently, If
>>> you want to guarantee events are scheduled together to avoid measurement
>>> skew you need to make sure the events are grouped.
> 
>>> The common way to do that is with {} around the event list:
> 
>>> perf stat -e {branches,branches}
> 
>>> Please see if that resolves the issue.
> 
> 
>> Groups only change how the events are scheduled, not how the driver
>> starts or stops multiple events running on the same PMU (grouped or
>> ungrouped). In my repro I had less events than counters in HW, so they
>> will always be scheduled at the same time regardless of grouping.
> 
>> I did notice something extra though, you have to first open some amount
>> of counters, and then open more than that. Then the second time the ones
>> with different counts will be however many were opened first time, as if
>> some state has stuck.
> 
>> For example if I open two counters then 6, the first two always have
>> different counts the second time:
> 
>>     $ perf stat -e branches,branches true
> 
>>     Performance counter stats for 'true':
> 
>>               106129      branches
> 
>>               106129      branches
> 
> 
> 
>>     $ perf stat -e
>> '{branches,branches,branches,branches,branches,branches}' true
> 
>>     Performance counter stats for 'true':
> 
>>               117013      branches
> 
>>               117013      branches
> 
>>               110364      branches
> 
>>               110364      branches
> 
>>               110364      branches
> 
>>               110364      branches
> 
> 
>> After opening 6 again a third time they'll all have the same counts.
> 
> Interesting. Thanks. To clarify, is this happening in the host or VM?

This is in the VM


