Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D096CA0FFF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 16:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X4N+q8o8KXEkY16pL6AM0vbzSxIIo1LQ5f2tTSY1L9I=; b=Tra2rWe7D0I2YZHY7kivkbY8TY
	8Rvkt5nYkmSdy+5y9DXp8rob7CmV/DuEsbwdNM2Y9NrBV0fGtrjOQu2YLMSfxUNJ1xEawX+zbnRXc
	45VrpQlpTvETzQgXMTidubZczW+gNUKPLPSUqadBNSCNs0pbZPH1cprNgA6TL9AD+NfsYb9Wff2hL
	RgCLZm+l7vOSKVJn3vdoEPHQ+YGn65KfPMiNxi5mqeJjfJWA+De1NqREOSE9EXsCUbbnIshNoaFjt
	eCzK9FqgRO0ge91pDh19anlZCsFFZv906eC9dWRs+p2s+DbIHWz5OY84AP9FLx89CD+tU21fXpaML
	oT+u95JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7VI-0000000DGrs-1ypc;
	Mon, 01 Sep 2025 16:35:36 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3h2-0000000CV0P-0iow
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 12:31:29 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3d19699240dso1469939f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 05:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756729886; x=1757334686; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X4N+q8o8KXEkY16pL6AM0vbzSxIIo1LQ5f2tTSY1L9I=;
        b=EYsYUr4ApEio4qaqoBMoahOosfKvnvwO43abiSnl92aGN1xdoDd1HmR4S95b5XzUl3
         diSWgV1Q3k8dg8fHtj1IC2FVUwa6iKeVdIk8zR/1oYBkl1suDz2oDtuCOfLI9f+wMqpB
         EweJMS5RSt/S4ry5hSIm8ND7SGVjm9mvmwGLwZeKTZMoHhwASCU8kBfvNE1rkm4euSF5
         a3YAwsXLlsr3icAygAUBnnWU/+c/By5cuqLD/+yfQqZAZTvpCsrEqG4mk5LczPrlIZqc
         wHiv/4/uoR0xnjduqRKHAGWqm7ZNGD5faTXvYIwfsjy/cxx02QWJyFeXSNfXov271bGH
         9/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756729886; x=1757334686;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X4N+q8o8KXEkY16pL6AM0vbzSxIIo1LQ5f2tTSY1L9I=;
        b=RjalqL0qHjjCMvYis3Ox3db4DGdHiyJeZDYtJxRTu/tv1bTdzpTbb7llxkeLyTnj1f
         ikye8W8d2eCvvG8iDE/gMs5+f4UvzSUVojxelOLbpPFFaPVGJnjTS/fWO8ynzB5VsZba
         Z3jskXBknt+Ah7sF4sdUIiqWrTwVc6LAVHnkLMHSweS23F1cCRLITFrEU6dUFD6/CLuZ
         mZhbEJm/WofmLsB607NLMGaWBUUGp60UtX2G2Jh8YltfQYVjZq5l1ekX9i9BcJNMQg9n
         H1GzqjRb2SnNU1zLhOnzTymjGFHM+Rjt/ZW9pPqv2ieFl5LmmpSZpMtGZjBdbRZq/A4e
         4qtQ==
X-Gm-Message-State: AOJu0YzI2ZBvEnJFHY6xYhz9POXAMgD6bAtMpBBs1q2/Qvag+H62jjHc
	5Cx/8vlbcsGtjeV1+ibaATLQR4nXnWumaT8toxR3LZWebu3nyqlguxFjawIeIboRuM0=
X-Gm-Gg: ASbGnctM/CD6JOvdCEpneoYxoQZJAyVc6Bq1TN3pNb0EyDT1Z25dFJaocCQ+k1rCRgy
	fb/IN4XMm6g1CrTjMvzelrBD4eQI7MHoL7WjBoGUHXrS8lP0TF2x1M0wC1SjxoTq33l93m1/y8J
	WdiUjL8q69pHT4Qwn3zpFZxzmrVCHF6l2vYxAej1J0F1GQdZnQKOi+OV4AFfYnHzC1DL4/cLTZv
	b3vSWkHv2d4ye+ox2+AtRZPfS4gTE+VKqfZt9+xrfIJv+zfJJSU82RRXE2efAoIjTBACpQ76DWP
	/Ijo5oRQKtv9OkSuHOCAi2gP7RNpHIlb0DBn3cSfIc9MT9atHMBYMKrjzDOo6tUV21ewkJszdoQ
	p5wTcc7ymhwA9PjAw9TbLE2eBDObsjZ7Pq++TE6TkhrP02fC2
X-Google-Smtp-Source: AGHT+IH0S4sTgNfQTnXRI0LudR80zD5+ZfC1keDZdSJ/oEiPdxO1oTocHeU7oQD+khKpjNKxQMuv3Q==
X-Received: by 2002:a5d:64cb:0:b0:3d4:1acb:aeda with SMTP id ffacd0b85a97d-3d41acbb2d4mr4092257f8f.15.1756729885028;
        Mon, 01 Sep 2025 05:31:25 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf275d2717sm15246537f8f.15.2025.09.01.05.31.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 05:31:24 -0700 (PDT)
Message-ID: <80178c90-b9f3-4e1f-baa5-f54aa89ec927@linaro.org>
Date: Mon, 1 Sep 2025 13:31:23 +0100
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
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <863496e4yg.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_053128_253911_47D2F0EF 
X-CRM114-Status: GOOD (  22.15  )
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



On 01/09/2025 1:24 pm, Marc Zyngier wrote:
> On Mon, 01 Sep 2025 11:36:11 +0100,
> James Clark <james.clark@linaro.org> wrote:
>>
>>
>>
>> On 01/09/2025 11:01 am, Yingchao Deng wrote:
>>> When linux is booted in EL1, macro "host_data_ptr()" is a wrapper that
>>> resolves to "&per_cpu_ptr_nvhe_sym(kvm_host_data, cpu)",
>>> is_hyp_mode_available() return false during kvm_arm_init, the per-CPU base
>>> pointer __kvm_nvhe_kvm_arm_hyp_percpu_base[cpu] remains uninitialized.
>>> Consequently, any access via per_cpu_ptr_nvhe_sym(kvm_host_data, cpu)
>>> will result in a NULL pointer.
>>>
>>> Add is_kvm_arm_initialised() condition check to ensure that kvm_arm_init
>>> completes all necessary initialization steps, including init_hyp_mode.
>>>
>>> Fixes: 054b88391bbe2 ("KVM: arm64: Support trace filtering for guests")
>>> Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
>>> ---
>>> Add a check to prevent accessing uninitialized per-CPU data.
>>> ---
>>>    arch/arm64/kvm/debug.c | 7 ++++---
>>>    1 file changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
>>> index 381382c19fe4741980c79b08bbdab6a1bcd825ad..add58056297293b4eb337028773b1b018ecc9d35 100644
>>> --- a/arch/arm64/kvm/debug.c
>>> +++ b/arch/arm64/kvm/debug.c
>>> @@ -233,7 +233,7 @@ void kvm_debug_handle_oslar(struct kvm_vcpu *vcpu, u64 val)
>>>    void kvm_enable_trbe(void)
>>>    {
>>>    	if (has_vhe() || is_protected_kvm_enabled() ||
>>> -	    WARN_ON_ONCE(preemptible()))
>>> +	    WARN_ON_ONCE(preemptible()) || !is_kvm_arm_initialised())
>>
>> Hi Yingchao,
>>
>> There shouldn't be a warning for this, at least for the case where
>> it's not initialized and never will be. If you're never going to run a
>> guest these functions can all skip, the same way for !has_vhe() etc.
> 
> It's not a warning. It's a bona-fide crash:
> 
> void kvm_enable_trbe(void)
> {
> 	if (has_vhe() || is_protected_kvm_enabled() ||
> 	    WARN_ON_ONCE(preemptible()))
> 		return;
> 
> 	host_data_set_flag(TRBE_ENABLED); <--- Explodes here
> }
> 
> So the write of the flag has to be skipped if KVM is available, even
> if KVM is compiled in.
> 
> 	M.
> 

Yeah. And just in case there is any confusion, I didn't mean that we 
should not have the check entirely, just that it shouldn't be in the 
WARN_ON_ONCE(). We should put it in the part that makes the functions 
silently skip:

   if (has_vhe() || is_protected_kvm_enabled() ||
       !is_kvm_arm_initialised() ||
       WARN_ON_ONCE(preemptible()))
           return;

And the same for kvm_disable_trbe() and kvm_tracing_set_el1_configuration().

James



