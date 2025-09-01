Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6891CA0FFF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 17:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iESc6dfW9RcmL1rZ9bcUT9E2jgBG3o06ZEwcLauMwJI=; b=fuCKD2/xMKgEP/5xuUzaBYEvme
	5WPFbQbMzle2R7GQnAIk72k3gZ2b+7T5bgsnA5Th0ajz+Cc9Xz3UXOWUcotE2XbyRAvreM3WP4VFo
	C2uDLlaz15T8VW3pme88znsOOUT5eFKKbaAdb4KOWHMjeJf69kCdIvWUCxVhKbhZFwAAsw/TuatLb
	rWA7ue6JYII4O/z43Ifcvhn4ioAp0K5xr7LaOhZQWoQLMGOAqrHWgvOL/LcjrQpL1jNO80LMnJDXf
	UKyht5MAr9zW44JckFKuhwv8sXApoTWkktVt4j7e7J5ikohWsGPSh5bLWVnPvGsW3/j9j4s3S7/FW
	WrJiMDdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut8Q4-0000000DTOC-3ZWk;
	Mon, 01 Sep 2025 17:34:16 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5L0-0000000CojD-3YNd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 14:16:51 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3d1bf79d758so1835060f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 07:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756736209; x=1757341009; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iESc6dfW9RcmL1rZ9bcUT9E2jgBG3o06ZEwcLauMwJI=;
        b=fZVd1raKY4PXMzSZBurlpbOqF9/FLYy75Qs76Tji4MIEVGqVhCYUQkF8mQ/p3chqAd
         xM5BwuisYP/kxCnNhMIJ2vw4iA9uUGvnvMP7LnWHk9sXC5Rf4IznT0UP855//wA59sqM
         iBA24CF2SBAC4INncVivnEKXodoEVFTzMxONqIz6dbim80ncA9JTaOrauAsCRJ67t6cp
         skytXUuQLm77YGx6HlwQrvwPKUdKOdZUFGM8oni33QRe1cYEHUDYOcIMUFAX+Htth2WL
         xBgEnWlaoiU7MXT63D3KyAVvy1LsmCC7H0qzYERXPFNDW+d4I7UmrhGSS6ePy5PtaEI5
         7gUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756736209; x=1757341009;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iESc6dfW9RcmL1rZ9bcUT9E2jgBG3o06ZEwcLauMwJI=;
        b=M5O9C8AwZu23qWDnwzP/1xRpwDKxJwKGRjZyqIwCytc8OU/1UgpSGQ4byRdNwQSK/V
         50r01gPe9t2Rjqw2xgQeETuWXTzn3KRScaXVrgSHH226cIcySyEvAVRbaPE7xwen+URB
         hthzkcfDQgb9PSHb5cZafNILraSQzLdPf279OHtSyOCILQ12TiNrnVJJGKrF8+Sg6R1i
         CAadEI8Rx4weCX642Tw6REEkPwe4ec7RpdOFpASDC/7JZk+TjOq55t/iCiONg8UDa81e
         tUiVi+hNoZtljuoRxYAZIvQMd9t7jinLuRS2A3SQETKVuEKTsaoL8zxKGtn+soqa14dZ
         e6SA==
X-Gm-Message-State: AOJu0YzBNWqLNWaggiy+9xpUsHtuXmYo1aKc+ruUmuIYVFpmx4U5k3RH
	ZJ4TLroB6OTsXcH8xllM8bI+aO0N7yZxcno51bPgyDMcWeFzTejfrHDHedpkyePZHvc=
X-Gm-Gg: ASbGncuQ0V9JW5s7SFEVj3Es1ODG0gyd5RbCILGYhDnLtpul0PU+7FPOw69ow0WdhT1
	v457RmmpXC3oLHNPdE4tIpEe4cLmiYkzbRS5yyfEgP89WjBd6PjPkE0QR2GovLkplZnLSvgler9
	fCTeeml2fBdGLEJ+PrM4If+4jTb9HSZ8CUizITlesmkNzx3k3LVrB+sun33hjYc6jbWnbgilK0x
	jP2piYU5pytct5V0FG528mZviI0PdhMmkI2+xRT8Q5EJLNNRSWErC/4cqQ5tKb8Q0tEY9+Nx5yp
	D7EfMasHZNCMX2I8AtnKuwtu+KJJ8uI2TrJRcwPTF96zWtn4SiWB4ZoSmQG8TnDEjJuepKmof7h
	cyHjs6b9WlEZ4FEJM4VKDxNOtqLE=
X-Google-Smtp-Source: AGHT+IHlQJYM2HX5g9ub7kOJOAXNXL4BWDzftuXNNBg0pmc4Ys0RWFLMX49ejuXDiUIn/rslt0RP/A==
X-Received: by 2002:a05:6000:4021:b0:3ce:e9d6:ad24 with SMTP id ffacd0b85a97d-3d1e05bab3dmr5752072f8f.50.1756736209038;
        Mon, 01 Sep 2025 07:16:49 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d21a32dbc5sm11053282f8f.11.2025.09.01.07.16.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 07:16:48 -0700 (PDT)
Message-ID: <239f2e3d-1fb5-4d53-869f-aba2d7a6530d@linaro.org>
Date: Mon, 1 Sep 2025 15:16:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: Fix NULL pointer access issue
To: Marc Zyngier <maz@kernel.org>,
 Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org, quic_yingdeng@quicinc.com,
 jinlong.mao@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>
References: <20250901-etm_crash-v1-1-ce65e44c137c@oss.qualcomm.com>
 <450f11c2-6c11-4ffa-ae20-db4ea419a3ca@linaro.org>
 <863496e4yg.wl-maz@kernel.org>
 <80178c90-b9f3-4e1f-baa5-f54aa89ec927@linaro.org>
 <86y0qycnb8.wl-maz@kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <86y0qycnb8.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_071650_896985_B9CE7C97 
X-CRM114-Status: GOOD (  21.91  )
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



On 01/09/2025 2:30 pm, Marc Zyngier wrote:
> On Mon, 01 Sep 2025 13:31:23 +0100,
> James Clark <james.clark@linaro.org> wrote:
>>
>>
>>
>> On 01/09/2025 1:24 pm, Marc Zyngier wrote:
>>> On Mon, 01 Sep 2025 11:36:11 +0100,
>>> James Clark <james.clark@linaro.org> wrote:
>>>>
>>>>
>>>>
>>>> On 01/09/2025 11:01 am, Yingchao Deng wrote:
>>>>> When linux is booted in EL1, macro "host_data_ptr()" is a wrapper that
>>>>> resolves to "&per_cpu_ptr_nvhe_sym(kvm_host_data, cpu)",
>>>>> is_hyp_mode_available() return false during kvm_arm_init, the per-CPU base
>>>>> pointer __kvm_nvhe_kvm_arm_hyp_percpu_base[cpu] remains uninitialized.
>>>>> Consequently, any access via per_cpu_ptr_nvhe_sym(kvm_host_data, cpu)
>>>>> will result in a NULL pointer.
>>>>>
>>>>> Add is_kvm_arm_initialised() condition check to ensure that kvm_arm_init
>>>>> completes all necessary initialization steps, including init_hyp_mode.
>>>>>
>>>>> Fixes: 054b88391bbe2 ("KVM: arm64: Support trace filtering for guests")
>>>>> Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
>>>>> ---
>>>>> Add a check to prevent accessing uninitialized per-CPU data.
>>>>> ---
>>>>>     arch/arm64/kvm/debug.c | 7 ++++---
>>>>>     1 file changed, 4 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
>>>>> index 381382c19fe4741980c79b08bbdab6a1bcd825ad..add58056297293b4eb337028773b1b018ecc9d35 100644
>>>>> --- a/arch/arm64/kvm/debug.c
>>>>> +++ b/arch/arm64/kvm/debug.c
>>>>> @@ -233,7 +233,7 @@ void kvm_debug_handle_oslar(struct kvm_vcpu *vcpu, u64 val)
>>>>>     void kvm_enable_trbe(void)
>>>>>     {
>>>>>     	if (has_vhe() || is_protected_kvm_enabled() ||
>>>>> -	    WARN_ON_ONCE(preemptible()))
>>>>> +	    WARN_ON_ONCE(preemptible()) || !is_kvm_arm_initialised())
>>>>
>>>> Hi Yingchao,
>>>>
>>>> There shouldn't be a warning for this, at least for the case where
>>>> it's not initialized and never will be. If you're never going to run a
>>>> guest these functions can all skip, the same way for !has_vhe() etc.
>>>
>>> It's not a warning. It's a bona-fide crash:
>>>
>>> void kvm_enable_trbe(void)
>>> {
>>> 	if (has_vhe() || is_protected_kvm_enabled() ||
>>> 	    WARN_ON_ONCE(preemptible()))
>>> 		return;
>>>
>>> 	host_data_set_flag(TRBE_ENABLED); <--- Explodes here
>>> }
>>>
>>> So the write of the flag has to be skipped if KVM is available, even
>>> if KVM is compiled in.
>>>
>>> 	M.
>>>
>>
>> Yeah. And just in case there is any confusion, I didn't mean that we
>> should not have the check entirely, just that it shouldn't be in the
>> WARN_ON_ONCE(). We should put it in the part that makes the functions
>> silently skip:
>>
>>    if (has_vhe() || is_protected_kvm_enabled() ||
>>        !is_kvm_arm_initialised() ||
>>        WARN_ON_ONCE(preemptible()))
>>            return;
> 
> Which is exactly what the OP wrote, except for swapping the last two
> terms.
> 
> 	M.
> 

Hah! So it is. Being on the same line as the warning really threw me 
despite looking at it 10 times.

Not sure if it's just me but I think having the warning at the end or on 
its own line is more readable.

Either way:

Reviewed-by: James Clark <james.clark@linaro.org>





