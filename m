Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EA3C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 09:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AdqOBa0Y+4+hMz6T43UiEMBnLkl2i23ABjw2IJz/f/k=; b=csitkpDEtyXXwWsRdgC0420dWV
	Tbt5TLyeOwkLZBPhMH2fRJRzeZ7wi/lTpSB8dmpw2LOeJpOVBiNyWnys4DRXb+22O7lozfd63Cn/5
	H9GRshLsSgEunkUvVo9Tomn7M6T7YciqxwDA1ln8OZJ/EEZXcsXOyYP8HbA1BwrD61eOnB6lJ3vzk
	ur7eUXUhob0Pf2AtpgbsctbMgMV9gFiS+RsstlP1Zx8PlMyQnLIag6XdZ53I07nBQJ+nkTMagHW2E
	ELpv0cmdhIc0PrJjyoN25TRi0eA8ztxLL2s3rZLHRHrVNfLj7TMIvT7NOpBiCwxPmGq5fdAxEI8eg
	I1uKB2gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txjP3-0000000AYQk-38QK;
	Thu, 27 Mar 2025 09:19:57 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txjNK-0000000AYHp-2Ctf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 09:18:11 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3912baafc58so514587f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 02:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743067088; x=1743671888; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AdqOBa0Y+4+hMz6T43UiEMBnLkl2i23ABjw2IJz/f/k=;
        b=CsGEsp6ZQ3Ea43UqO/tcJZQ85HtqTBF1Ag9w3lQ5sc1BnMQeIQRvP+r4Iiyrlzf/JU
         9T3d5J9vFIMBCGSF7Oeu+/RRy3Vv3wt+FPUz9/ausprz3xvyW3pbZQxDBmxS4wtf+jrZ
         GMNaSvvYI19EoZPR9Y8OiHwLCFUi4m7KjUt+VTIKKelEDmJpnXLA+r/gfjibYliBJbud
         94wTz3XPIyLgE7Z1L/M7WR+XJuoI12rejsDvaxlITt2WSZlc1XmHel63Q7cMh8QdK+Ir
         pTcOb94M6L0mHo4Gz2aHU6NNRuHW/GAXqP3Q+0egqFqJU36hPybJJIe08j3kYW+3T2iD
         g+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743067088; x=1743671888;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AdqOBa0Y+4+hMz6T43UiEMBnLkl2i23ABjw2IJz/f/k=;
        b=S9WJlmFONDs02qIBHXG4gJ1RFTWucaa3LJVWF+XdCb4b6ENVbBuA/SkDMLmTgfD/m8
         PQCeyXyTXEYS866DQdhQNGrGKYg/0diU+uUZZvGGFOf6m7B9efbNb4snCoMv932hbVAE
         RR/C9rjAmBcUhKlg5+cOoJRDB2PcZCLkSqjAnFOnfo6n1FCgbGM18U4K93KIOCrwUcBO
         bjU+iYkhgiI/UCmfVcem70hgnNl7hO7ELU+u0/+clcJCM1GU/ffHDeRv7ter1aLM3fi4
         PDV5dND+phHApt2YRv4wXINqiIB3WaU4eje8s9JV2fiU+enEBEJwDZWCDlrJ2gW8xWmT
         hZzA==
X-Forwarded-Encrypted: i=1; AJvYcCWQ9GLD8nxs9wMI+G9ApA6p7zZtF71IhdsFqG3c2WJZSS29vL9CEp3G+qxz/3Zh5n56tid4sEIdB9cI7iNKd7xk@lists.infradead.org
X-Gm-Message-State: AOJu0YwFgDbnTqufIhQVAHJEklfVvSvsJj4R3YY11HjzBsxvpHybPMF/
	xoFMWgfrSHBUrKrg9yR16Y4ORIrtaTLR1dUgW7eL31KOHRg4V73mlMeqey/kDWI=
X-Gm-Gg: ASbGnctT1M1Jwv4bandn/QJqgREaQ8kF2UV4qpKsv08cW+mt7eJ5osmZ3HG2CGClSUZ
	pOe7Ydhw9XS4awyJ+kuEtPju7PUHjc3XXJzq9avR5eAXTl8X+TDQpaWA6+hbQ9tUNjJPycwQNBc
	I+deQt5CCCzyA2Gz8fZwGMYmKwgmDhMiQjnSmKKmMFgM4RGAfg0601y1myR0IIv2BnG50GchYGe
	W32ryANs6w2Y+P3sXbPTg4gm8lqddimqbxm2ImaDaICpMVoWmVJwBB5LlT1X1hlzYSzLEechvTr
	W+whFp71TTbt7xHluKg3mla1I9hL5emJ9LSjMX7wETmyJo3Nig==
X-Google-Smtp-Source: AGHT+IF9q6whwwkhqGN2Pk+AEph3LrTbbtoFFPYNJTAshCFIqJMIeQt7KSSkyJwJU5Ap2Rh/HnzcAg==
X-Received: by 2002:a05:6000:2cb:b0:39a:c8a8:4fdc with SMTP id ffacd0b85a97d-39ad175c052mr2069156f8f.16.1743067088494;
        Thu, 27 Mar 2025 02:18:08 -0700 (PDT)
Received: from [192.168.1.247] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d7ae6a319sm30665955e9.0.2025.03.27.02.18.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 02:18:07 -0700 (PDT)
Message-ID: <ba2c38f1-d686-45dc-ae47-924cc11d15f6@linaro.org>
Date: Thu, 27 Mar 2025 09:18:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 5/8] KVM: arm64: Introduce module param to
 partition the PMU
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Colton Lewis <coltonlewis@google.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, kvm@vger.kernel.org,
 robh@kernel.org, linux@armlinux.org.uk, catalin.marinas@arm.com,
 will@kernel.org, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, mark.rutland@arm.com, pbonzini@redhat.com,
 shuah@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <gsnt1pulnepv.fsf@coltonlewis-kvm.c.googlers.com>
 <f7d543f6-2660-460f-88ac-741dd47ed440@linaro.org>
 <Z-RmMLkTuwsea7Uk@linux.dev>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <Z-RmMLkTuwsea7Uk@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_021810_588567_9D0B25C7 
X-CRM114-Status: GOOD (  28.66  )
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



On 26/03/2025 8:40 pm, Oliver Upton wrote:
> On Wed, Mar 26, 2025 at 05:38:34PM +0000, James Clark wrote:
>> On 25/03/2025 6:32 pm, Colton Lewis wrote:
>>>> I don't know if this is a stupid idea, but instead of having a fixed
>>>> number for the partition, wouldn't it be nice if we could trap and
>>>> increment HPMN on the first guest use of a counter, then decrement it on
>>>> guest exit depending on what's still in use? The host would always
>>>> assign its counters from the top down, and guests go bottom up if they
>>>> want PMU passthrough. Maybe it's too complicated or won't work for
>>>> various reasons, but because of BRBE the counter partitioning changes go
>>>> from an optimization to almost a necessity.
>>>
>>> This is a cool idea that would enable useful things. I can think of a
>>> few potential problems.
>>>
>>> 1. Partitioning will give guests direct access to some PMU counter
>>> registers. There is no reliable way for KVM to determine what is in use
>>> from that state. A counter that is disabled guest at exit might only be
>>> so temporarily, which could lead to a lot of thrashing allocating and
>>> deallocating counters.
> 
> KVM must always have a reliable way to determine if the PMU is in use.
> If there's any counter in the vPMU for which kvm_pmu_counter_is_enabled()
> is true would do the trick...
> 
> Generally speaking, I would like to see the guest/host context switch in
> KVM modeled in a way similar to the debug registers, where the vPMU
> registers are loaded onto hardware lazily if either:
> 
>    1) The above definition of an in-use PMU is satisfied
> 
>    2) The guest accessed a PMU register since the last vcpu_load()
> 
>>> 2. HPMN affects reads of PMCR_EL0.N, which is the standard way to
>>> determine how many counters there are. If HPMN starts as a low number,
>>> guests have no way of knowing there are more counters
>>> available. Dynamically changing the counters available could be
>>> confusing for guests.
>>>
>>
>> Yes I was expecting that PMCR would have to be trapped and N reported to be
>> the number of physical counters rather than how many are in the guest
>> partition.
> 
> I'm not sure this is aligned with the spirit of the feature.
> 
> Colton's aim is to minimize the overheads of trapping the PMU *and*
> relying on the perf subsystem for event scheduling. To do dynamic
> partitioning as you've described, KVM would need to unconditionally trap
> the PMU registers so it can pack the guest counters into the guest
> partition. We cannot assume the VM will allocate counters sequentially.

Yeah I agree, requiring cooperation from the guest probably makes it a 
non starter.

> 
> Dynamic counter allocation can be had with the existing PMU
> implementation. The partitioned PMU is an alternative userspace can
> select, not a replacement for what we already have.
> 
> Thanks,
> Oliver


It's just a shame that it doesn't look like there's a way to make BRBE 
work properly in guests with the existing implementation. Maybe we're 
stuck with only allowing it in a partition for now.

Thanks
James


