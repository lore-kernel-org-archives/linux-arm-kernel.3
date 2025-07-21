Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B9AC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 14:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vrn9rE6UkF/v98BJ3Qu5cq8UrY7vJ2riZbgUi0l0lcs=; b=2hGhN0lAisV+A4uLPOSwUXolph
	X8ph7U60LcuH5wYY72HJjGXCnpw6oI+mL0YMtefT+nGSv4pvZ+CSTtBh3ahee1ZWMDd2SZL9SpDIq
	LTq0dxIbqh2tESAv/OgUaJm/fgDEyiWhzfxpu71tuAGLv9gX7huHr4Oa32CgzjY0oG8nTgBzs/sPS
	yzUCa6loZaBw+8e2pWAlbq2oaKT8Xr0H7QMEF15BQIJ3AS2XNqKS6iOPqDtuTbeoj30USPwayztD7
	BM9GNY/eF3TwbDpGTCK4NjXW0R79TVPVi6N1Y8LKwEGf9OqnjgEvIZDiobFPXFzB57ACwDiEPIHNc
	bte2GSZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udrjR-0000000HZhN-1IUX;
	Mon, 21 Jul 2025 14:43:09 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udqRG-0000000HNA8-2B4R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 13:20:19 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso33562965e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 06:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753104017; x=1753708817; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vrn9rE6UkF/v98BJ3Qu5cq8UrY7vJ2riZbgUi0l0lcs=;
        b=mQ91Vwm8WAhEIvThi6B0aTm6Ry7ejzzd8Xv6bXB8n11al1gGlNBg0UxUpV5tbaRB+e
         WmXxoow+VTiAJFBoeCtZfIre7BxWe1iekM6BWAtGdaMv0/FqMU49eo7lwrfxYHgLo9n+
         rKRNV3e9ftNIpPor/DH7g2MzoC6uC4ZUZR+ujf0lKs3P7G++QF6xqKkR5O1L+7hnXkFK
         kuEhK55yFDwSRNXUwrcNOM4SukQqecMB+bjPKfDXlECWSxO6ULwwgJsbPMBx3nf++5Xk
         vnjgRzJGJGWShCKqZ9V0R+kg93u/6wmdDjVETkYSm4yqfXR953Qec6rg947YJ01sB+au
         SDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753104017; x=1753708817;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vrn9rE6UkF/v98BJ3Qu5cq8UrY7vJ2riZbgUi0l0lcs=;
        b=LWAkd0ArQwy9YcWaAgWu7Sj7/X+h4rnMDcelgZ/j87hK0Lg7lJ6tdEBLtBvd5Ah2Xf
         CZvsD//yMrEsJ0JOLAYAVSj/GYOTZbN25GOUPix3+7C/JWHRYBiiDOf7SQNpIphag64z
         bL4fSWALGYuV0Wt9wwbxF8D9Zs6K3dJCohCo0oos9axcn0pZZTW7DkNCJXmQRon4Q5gn
         iEK6ot8mCMgVyWRTAWwWK582cMkLaVhZRmk8OLvl3Pb4K1DqpKyFuZXoIAGMESugMXRa
         4iKUCQMKWu1k7bhRdgmKV8i0X4bVRj1u6YvFBdXD1LEenVRQ5/po7FFT9hrxhpQYLuxh
         RpUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBOcHZ3ixExNwILygeVVA37uYTAgeSYvR43KgsObuNXqfzfmKaHzgjJAy+JwlM6wIu65wI9+yWi0HsIp26L0go@lists.infradead.org
X-Gm-Message-State: AOJu0YzPEUWCdhtituUU2WE0IYxscrVKdxCVeunP6DcztIF8IiyaETPN
	ukPWrvHM4hgodi8Y43IuxQiubfwAAeiREJqxglb9SuAkZo1c2TP4Oocj3je1S44zD02D2Wyt/Nm
	xVEhxIwE=
X-Gm-Gg: ASbGncv/QSRZZp93MP3OASUQaCpuUlsVofeQ89/f9CoN/bMOL73b2LQXiI2oDCI7+YS
	lmxF149HCMGkZsU6NdfFjSHqlF/Ke334ZdFBOKObz6UklIVwWu9CDeYaZh0anihW7j2dN1TyIkV
	rVmu/zDqd9orirFtm2EwgJJIUEO2e/ahV+u1pBTjpC34U97+NIfkLwi/vkbxCA82Sg7izmHSqiO
	A2QjJ8vqdzHRbRvBhLh0jA/vOFVq8QojpydIhbts+cTyruZJtCugS4DILYpG6lojK3xHvzEI3LN
	YgAj99fN0bgY7d1ETzNtoyu4hp5wwFIbm13tRLKN4tbssDbh/6Q5Pi3aRtCZuOiA/TlGqkd2tlj
	XjgDTjn7ZR3VblwQ7sT34sHPjCj+6TxQFtUhncA==
X-Google-Smtp-Source: AGHT+IH+iH70+HX8sNgyQja7zJIW/pG4ctsn+z4ohiQa3kbUyjxssWONPs/1WpQT4zINE1WNbLE7Uw==
X-Received: by 2002:a05:6000:992:b0:3a4:f663:acb9 with SMTP id ffacd0b85a97d-3b61b0ec0dbmr9587918f8f.9.1753104016864;
        Mon, 21 Jul 2025 06:20:16 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b75baa7072sm3489845f8f.2.2025.07.21.06.20.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 06:20:16 -0700 (PDT)
Message-ID: <0c53164a-306a-4cb7-9085-bba8985c32e7@linaro.org>
Date: Mon, 21 Jul 2025 14:20:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] perf: arm_spe: Disable buffer before writing to
 PMBPTR_EL1 or PMBSR_EL1
To: Leo Yan <leo.yan@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Anshuman Khandual <Anshuman.Khandual@arm.com>,
 Rob Herring <Rob.Herring@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
 Robin Murphy <Robin.Murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250701-james-spe-vm-interface-v1-0-52a2cd223d00@linaro.org>
 <20250701-james-spe-vm-interface-v1-2-52a2cd223d00@linaro.org>
 <20250704155016.GI1039028@e132581.arm.com>
 <b77f12e7-ea3f-4c57-9706-ff8e32721cc8@linaro.org>
 <20250707153710.GB2182465@e132581.arm.com> <aG4_uYJgpMXo3QHQ@raptor>
 <20250714085849.GC1093654@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250714085849.GC1093654@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_062018_574558_F6DB80EB 
X-CRM114-Status: GOOD (  31.03  )
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



On 14/07/2025 9:58 am, Leo Yan wrote:
> Hi Alexandru,
> 
> On Wed, Jul 09, 2025 at 11:08:57AM +0100, Alexandru Elisei wrote:
> 
> [...]
> 
>>>>>>    	case SPE_PMU_BUF_FAULT_ACT_OK:
>>>>>>    		/*
>>>>>> @@ -679,18 +692,14 @@ static irqreturn_t arm_spe_pmu_irq_handler(int irq, void *dev)
>>>>>>    		 * PMBPTR might be misaligned, but we'll burn that bridge
>>>>>>    		 * when we get to it.
>>>>>>    		 */
>>>>>> -		if (!(handle->aux_flags & PERF_AUX_FLAG_TRUNCATED)) {
>>>>>> +		if (!(handle->aux_flags & PERF_AUX_FLAG_TRUNCATED))
>>>>>>    			arm_spe_perf_aux_output_begin(handle, event);
>>>>>> -			isb();
>>>>>
>>>>> I am a bit suspecious we can remove this isb().
>>>>>
>>>>> As a reference to the software usage PKLXF in Arm ARM (DDI 0487 L.a),
>>>>> after enable TRBE trace unit, an ISB is mandatory. Maybe check a bit
>>>>> for this?
>>>>
>>>> Wasn't this isb() to separate the programming of the registers with the
>>>> status register clear at the end of this function to enable profiling?
>>>
>>> Enabling profiling buffer followed an isb() is not only for separating
>>> other register programming.
>>>
>>> As described in section D17.9, Synchronization and Statistical Profiling
>>> in Arm ARM:
>>>
>>>    "A Context Synchronization event guarantees that a direct write to a
>>>    System register made by the PE in program order before the Context
>>>    synchronization event are observable by indirect reads and indirect
>>>    writes of the same System register made by a profiling operation
>>>    relating to a sampled operation in program order after the Context
>>>    synchronization event."
>>>
>>> My understanding is: after the ARM SPE profiling is enabled, the
>>> followed ISB is a Synchronization to make sure the system register
>>> values are observed by SPE. And we cannot rely on ERET, especially if
>>> we are tracing the kernel mode.
>>
>> Thought about this some more.
>>
>> Before:
>>
>> arm_spe_pmu_buf_get_fault_act:
>>    <drain buffer>
>>    ISB
>> arm_spe_perf_aux_output_begin:
>>    PMBLIMITR_EL1.E = 1
>> ISB
>> PMBSR_EL1.S = 0
>> ERET
>>
>> Now:
>>
>> PMBLIMITR_EL1 = 0
>> ISB
>>
>> PMBSR_EL1.S = 0
>> arm_spe_perf_aux_output_begin:
>>    ISB
>>    PMBLIMITR_EL1.E = 1
>> ERET
>>
>> I don't see much of a difference between the two sequences - the point after
>> which we can be sure that profiling is enabled remains the ERET from the
>> exception return.  The only difference is that, before this change, the ERET
>> synchronized clearing the PMBSR_EL1.S bit, now it synchronizes setting the
>> PMBLIMITR_EL1.E bit.
>>
>> Thoughts?
> 
> To make the discussion easier, I'll focus on the trace enabling flow
> in this reply.
> 
> My understanding of a sane flow would be:
> 
>    arm_spe_pmu_irq_handler() {
>      arm_spe_perf_aux_output_begin() {
>            SYS_PMBPTR_EL1 = base;
> 
>            ISB // Synchronization between SPE register setting and
>                // enabling profiling buffer.
>            PMBLIMITR_EL1.E = 1;
>      }
>      ISB // Context synchronization event to ensure visibility to SPE
>    }
> 
>    ... start trace ... (Bottom half, e.g., softirq, etc)
> 
>    ERET
> 
> In the current code, arm_spe_perf_aux_output_begin() is followed by an
> ISB, which serves as a context synchronization event to ensure
> visibility to the SPE. After that, it ensures that the trace unit will
> function correctly.
> 

But I think Alex's point is that in the existing code the thing that 
finally enables trace (PMBSR_EL1.S = 0) isn't followed by an isb(), only 
an ERET. So the new flow isn't any different in that regard.

> I understand that the Software Usage PKLXF recommends using an ERET as
> the synchronization point. However, between enabling the profiling
> buffer and the ERET, the kernel might execute other operations (e.g.,
> softirqs, tasklets, etc.).

Isn't preemption disabled? Surely that's not possible. Even if something 
did run it wouldn't be anything that touches the SPE registers, and 
we're sure there's an isb() between setting up the buffer and the final 
PMBLIMITR_EL1.E = 1

> 
> Therefore, it seems to me that using ERET as the synchronization point
> may be too late. This is why I think we should keep an ISB after
> arm_spe_perf_aux_output_begin().
> 
> Thanks,
> Leo

Wouldn't that make the ERET too late even in the current code then? But 
I think we're agreeing there's no issue there?

James


