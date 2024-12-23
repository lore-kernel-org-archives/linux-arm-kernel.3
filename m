Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4B6E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 11:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wgzz0gsE3gqrFwP8Idx/74NN9Vh0nBG1Pbn09jOALdI=; b=wzLc4dCJGV9ms9a3jWtP+TInRV
	nzfhYkIeGrLvmDgw1GzrbR3d+/riT060yYlo6ID0J5YjXeH7c1gvV1UJD+7oclC83PM121Z9SlLZk
	YtllvFdY9xb6DYPvNKbaSexZSbaw05CoWg3NOF30X0KMsj++IyVQ2WwuKzwR/hw/aKqKpEhTzMDTf
	B/v+tAshgJr/1HP1yanq9W0lXIsqx6qYrM30IFFy6vx/nyk75El4SY0Sn7AY1R6fSg5bkdOapVwVY
	WQMxHm+1z2kEs+j/OZJONBdIcZ1wkq7zMj5PrQCepKmoSGoKPBn9LJ8ew5MSzKERmecKFtmrQyS/N
	g8sQE88w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPghR-00000009umv-2L2M;
	Mon, 23 Dec 2024 11:34:13 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgba-00000009ty2-2N8F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 11:28:11 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso30914395e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 03:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734953288; x=1735558088; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wgzz0gsE3gqrFwP8Idx/74NN9Vh0nBG1Pbn09jOALdI=;
        b=mwIc7p3BVZDY6oIE0bjK6+GNeBJXbx50LkBVHmaYCEy8JHAK+eaDVoxvOH06dhrUak
         J9TV30Bml7wYiPcEavEiSaNNc20VctamtvhxsFQHwT7tzPXCYJaxdeOcW+5zR4saFuu8
         vUusdrkiNYJE85YdRwVJsuM2W3WSP3969WVkNuKD/TG8fV6ic5Mtzw9PTetLckDo7T1N
         fhYzGwepLKt8+g2PVHDULy+HmggrvP2Ph/HcPru5TSC9dKxUSoQK/bxdKCUZ4PfVGqX1
         PTIjdvQeqUBzINJ2QKWZe9PzP7MdiCkXwqH1AOG11H7ykvZ/z3wlqUdkH+Q1rV0E0a23
         5Kyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734953288; x=1735558088;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wgzz0gsE3gqrFwP8Idx/74NN9Vh0nBG1Pbn09jOALdI=;
        b=lp29MMWz4Q0eXkAgB5O0QGF371RRhCN8+6g4E+c2RBqZ+Q5OPy4q0BbWgAXtb1jSrh
         YwsUGFgTLpQfyXTS0yV7IsVZ7QDxKtJDCBoFsB2OiUgbZ8E03SB48DT21Fc40bm7yZiH
         +G8DctvHoI2DoZqLP3ZpjLP3fcj/r09HZkXkuO72XAYsYKUhJgW2nLJenuw8T4qMriuj
         8oNaVQXopmb0qYYzjEaq00bxGssdqN+VWi6haAtKdwNi8FqAuX+IGeIYroF5NlWv0zO6
         2LmrffkiO14nP5+JU71mizi6YQG1at4yXBT2jl0g62s8TbUqhxnYwpXfD8zTqRcqQa2q
         h7mQ==
X-Forwarded-Encrypted: i=1; AJvYcCUphV/fI+ULNc+AE5J+XUOdHxzK2+LpBk/pa+iKJFFLQJPJ1/okLKsZXVi5wVVuJYmj13OzE3GJzBHG2Ft0KMg8@lists.infradead.org
X-Gm-Message-State: AOJu0Yzijz/phmniN8v83ePCefUmKvRPrkSTfa5HQtBWuJU5jst2PevM
	SvvsLhxvk57N2awjb/Wgv9uS8F/zWEO2B1HdmUc8SV35GE8CCKN8yr5SRGMWk2k=
X-Gm-Gg: ASbGncs9+thfuPxZ2Vz1AVJwckqNSga+gRzvC7f2DLspc+W+BRalX7tz5IUeQ5gAtOo
	BGeWqf3Lv40DBKz+cpK9kRAMEWMIXA7SI3vc3LYq3zpJMuXefA4svCyqgI6fKpRgV+sLF1OKf7D
	IQ6Ib/kxkDnaD4qJReLnhKUtM3xeGKUauHfUsaPXwWmiW/w0i1psNjWEIyOd5vRw3UEA9ieHCOo
	vyAe5sm7Hbj//19tFT6B6kvrOJZZznQf/1lwtKZKchLqGN2jKbR3KuPz5kTLFcX9g==
X-Google-Smtp-Source: AGHT+IHm0ZFL9nIVAaexFN4PWOjn7+ySvP/pC4MHFJJmDVZySNdmlh63s633dEeCGONBXuT62LRO2Q==
X-Received: by 2002:a05:600c:35c8:b0:434:e892:1033 with SMTP id 5b1f17b1804b1-4365c763d24mr135710245e9.2.1734953288409;
        Mon, 23 Dec 2024 03:28:08 -0800 (PST)
Received: from [192.168.68.163] ([145.224.66.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b119ccsm167419945e9.24.2024.12.23.03.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2024 03:28:08 -0800 (PST)
Message-ID: <0cfda877-7c3d-4e59-a1b1-fe245f7298f0@linaro.org>
Date: Mon, 23 Dec 2024 11:28:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 7/8] KVM: arm64: Support trace filtering for guests
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>
Cc: kvmarm@lists.linux.dev, suzuki.poulose@arm.com,
 coresight@lists.linaro.org, Joey Gouly <joey.gouly@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 James Morse <james.morse@arm.com>, "Rob Herring (Arm)" <robh@kernel.org>,
 Shiqi Liu <shiqiliu@hust.edu.cn>, Fuad Tabba <tabba@google.com>,
 Raghavendra Rao Ananta <rananta@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241127100130.1162639-1-james.clark@linaro.org>
 <20241127100130.1162639-8-james.clark@linaro.org>
 <86r061p63b.wl-maz@kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <86r061p63b.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_032810_623245_088383CD 
X-CRM114-Status: GOOD (  32.77  )
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



On 21/12/2024 12:34 pm, Marc Zyngier wrote:
> On Wed, 27 Nov 2024 10:01:24 +0000,
> James Clark <james.clark@linaro.org> wrote:
>>
>> For nVHE, switch the filter value in and out if the Coresight driver
>> asks for it. This will support filters for guests when sinks other than
>> TRBE are used.
>>
>> For VHE, just write the filter directly to TRFCR_EL1 where trace can be
>> used even with TRBE sinks.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   arch/arm64/include/asm/kvm_host.h  |  5 +++++
>>   arch/arm64/kvm/debug.c             | 28 ++++++++++++++++++++++++++++
>>   arch/arm64/kvm/hyp/nvhe/debug-sr.c |  1 +
>>   3 files changed, 34 insertions(+)
>>
>> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
>> index ba251caa593b..cce07887551b 100644
>> --- a/arch/arm64/include/asm/kvm_host.h
>> +++ b/arch/arm64/include/asm/kvm_host.h
>> @@ -613,6 +613,7 @@ struct kvm_host_data {
>>   #define KVM_HOST_DATA_FLAG_HAS_SPE	0
>>   #define KVM_HOST_DATA_FLAG_HAS_TRF	1
>>   #define KVM_HOST_DATA_FLAG_TRBE_ENABLED	2
>> +#define KVM_HOST_DATA_FLAG_GUEST_FILTER	3
> 
> Guest filter what? This is meaningless.
> 

KVM_HOST_DATA_FLAG_SWAP_TRFCR maybe?

>>   	unsigned long flags;
>>   
>>   	struct kvm_cpu_context host_ctxt;
>> @@ -1387,6 +1388,8 @@ void kvm_clr_pmu_events(u64 clr);
>>   bool kvm_set_pmuserenr(u64 val);
>>   void kvm_enable_trbe(void);
>>   void kvm_disable_trbe(void);
>> +void kvm_set_trfcr(u64 guest_trfcr);
>> +void kvm_clear_trfcr(void);
>>   #else
>>   static inline void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr) {}
>>   static inline void kvm_clr_pmu_events(u64 clr) {}
>> @@ -1396,6 +1399,8 @@ static inline bool kvm_set_pmuserenr(u64 val)
>>   }
>>   static inline void kvm_enable_trbe(void) {}
>>   static inline void kvm_disable_trbe(void) {}
>> +static inline void kvm_set_trfcr(u64 guest_trfcr) {}
>> +static inline void kvm_clear_trfcr(void) {}
>>   #endif
>>   
>>   void kvm_vcpu_load_vhe(struct kvm_vcpu *vcpu);
>> diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
>> index 0c340ae7b5d1..9266f2776991 100644
>> --- a/arch/arm64/kvm/debug.c
>> +++ b/arch/arm64/kvm/debug.c
>> @@ -337,3 +337,31 @@ void kvm_disable_trbe(void)
>>   	host_data_clear_flag(TRBE_ENABLED);
>>   }
>>   EXPORT_SYMBOL_GPL(kvm_disable_trbe);
>> +
>> +void kvm_set_trfcr(u64 guest_trfcr)
> 
> Again. Is this the guest's view? or the host view while running the
> guest? I asked the question on the previous patch, and you didn't
> reply.
> 

Ah sorry missed that one:

 > Guest value? Or host state while running the guest? If the former,
 > then this has nothing to do here. If the latter, this should be
 > spelled out (trfcr_in_guest?), and the comment amended.

Yes, the latter, guest TRFCR reads are undef anyway. I can rename this 
and the host_data variable to be trfcr_in_guest.

>> +{
>> +	if (is_protected_kvm_enabled() || WARN_ON_ONCE(preemptible()))
>> +		return;
>> +
>> +	if (has_vhe())
>> +		write_sysreg_s(guest_trfcr, SYS_TRFCR_EL12);
>> +	else {
>> +		*host_data_ptr(guest_trfcr_el1) = guest_trfcr;
>> +		host_data_set_flag(GUEST_FILTER);
>> +	}
> 
> Oh come on. This is basic coding style, see section 3 in
> Documentation/process/coding-style.rst.
> 

Oops, I'd have thought checkpatch could catch something like that. Will fix.

>> +}
>> +EXPORT_SYMBOL_GPL(kvm_set_trfcr);
>> +
>> +void kvm_clear_trfcr(void)
>> +{
>> +	if (is_protected_kvm_enabled() || WARN_ON_ONCE(preemptible()))
>> +		return;
>> +
>> +	if (has_vhe())
>> +		write_sysreg_s(0, SYS_TRFCR_EL12);
>> +	else {
>> +		*host_data_ptr(guest_trfcr_el1) = 0;
>> +		host_data_clear_flag(GUEST_FILTER);
>> +	}
>> +}
>> +EXPORT_SYMBOL_GPL(kvm_clear_trfcr);
> 
> Why do we have two helpers? Clearly, calling kvm_set_trfcr() with
> E{1,0}TRE=={0,0} should result in *disabling* things.  Except it
 > doesn't, and you should fix it. Once that is fixed, it becomes 
obvious> that kvm_clear_trfcr() serves no purpose.
> 

With only one kvm_set_trfcr() there's no way to distinguish swapping in 
a 0 value or stopping swapping altogether. I thought we wanted a single 
flag that gated the register accesses so the hyp mostly does nothing? 
With only kvm_set_trfcr() you first need to check FEAT_TRF then you need 
to compare the real register with trfcr_in_guest to know whether to swap 
or not every time.

Actually I think some of the previous versions had something like this 
but it was a bit more complicated.

Maybe set/clear_trfcr() aren't great names. Perhaps 
kvm_set_trfcr_in_guest() and kvm_disable_trfcr_in_guest()? With the 
second one hinting that it stops the swapping regardless of what the 
values are.

I don't think calling kvm_set_trfcr() with E{1,0}TRE=={0,0} is actually 
broken in this version, it means that the Coresight driver wants that 
value to be installed for guests. So it should actually _enable_ 
swapping in the value of 0, not disable anything.

> To sum it up, KVM's API should reflect the architecture instead of
> making things up.
> 

We had kvm_set_trfcr(u64 host_trfcr, u64 guest_trfcr) on the last 
version, which also serves the same purpose I mentioned above because 
you can check if they're the same or not and disable swapping. I don't 
know if that counts as reflecting the architecture better. But Oliver 
mentioned he preferred it more "intent" based which is why I added the 
clear_trfcr().

>> diff --git a/arch/arm64/kvm/hyp/nvhe/debug-sr.c b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
>> index 9479bee41801..7edee7ace433 100644
>> --- a/arch/arm64/kvm/hyp/nvhe/debug-sr.c
>> +++ b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
>> @@ -67,6 +67,7 @@ static void __trace_do_switch(u64 *saved_trfcr, u64 new_trfcr)
>>   static bool __trace_needs_switch(void)
>>   {
>>   	return host_data_test_flag(TRBE_ENABLED) ||
>> +	       host_data_test_flag(GUEST_FILTER) ||
>>   	       (is_protected_kvm_enabled() && host_data_test_flag(HAS_TRF));
> 
> Wouldn't it make more sense to just force the "GUEST_FILTER" flag in
> the pKVM case, and drop the 3rd term altogether?
> 
> 	M.
> 

Yep we can set GUEST_FILTER once at startup and it gets dropped along 
with HAS_TRF. That's a lot simpler.

Thanks
James


