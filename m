Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A383CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jGYytEnMw+6xuEh78CWcB0+W8fGeyKd2M/PYTH6aJS0=; b=eFW8TGWHTruwh8yEVk5uVl8mc8
	SavX5LgeJpvOaAnJgPsGFHx1ISvtVF0BPeQguUGHnSlsMaoyBxyHiQ1mmsxS3ksTWBtfm5kdy0qYw
	4zR7y7SAL36zZ7FG945k0C2c9DQRrDUpQykohm+j022xNVR5HHOs0WZ0PsQpu1vCSPiY2YlvNHmWl
	e5Kk5fCMqvo+oZ6KpiL2qTPoieg5arkHfF937JMsvHQPR/9Bt1mNL8oOgBgnoMiECsSOG1bk8otCu
	FF9aWfhj/8gw9D8Nn30bk4NtTkKbV81Yt3fkkd4vaD4dPIzoByCcaL6T+FxQWa8k0Zr+iYHIsj/ts
	yqS0lIGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfUx-000000019RM-07Bm;
	Mon, 08 Sep 2025 17:17:47 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvcyJ-000000009Ka-025u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 14:35:56 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45cb659e858so30983895e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 07:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757342153; x=1757946953; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jGYytEnMw+6xuEh78CWcB0+W8fGeyKd2M/PYTH6aJS0=;
        b=TdDTcQbD0XwoHWGLwouKtn2jEL9C/SVdC+Ucbvir441WohbRynNKLYbFEZHLFpyKmr
         HkR5LQKeQ54UNRzepniX+kc4WZY1mVQ2S8syZft9ojnQa3RzBfhy3rO5LgvbtNUsIPuH
         FuH5pR98nKKZkDhlSboMqoaByqadf5UVgTZHTCMwteN8XsA7v7PQg3w1yAPYEj2r9qLx
         NhDtZWB0MzS66GCX4ZPdReXa94sMvAypGwIAv/Xmlit95yRadFk1W/Y3024sesspwaAW
         mv21bbFuBGjh/WBUO+4cTuzXR9sXFO+Aw9XuBvhzoGPXYbaA3v7MCnF+NqELDIO1vu4t
         +8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757342153; x=1757946953;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jGYytEnMw+6xuEh78CWcB0+W8fGeyKd2M/PYTH6aJS0=;
        b=ss3ZdW2jgIvsOCChvVI/PNZzMyyQn/EFscoy1EHyxVupVHhbWIDmwCCQeBrijp+nyv
         W93rYbLJtLy3HZF1SF8eyhhlshL9sGpUAQY4matwg211GMHH6m5CWb7kpO0bBYndAsLr
         c6Co/qsMXeOBpY6vC3qUD0Ks8N6Kq+MLbdi3byXuQYHweSNp4Fd/ygDaSEOXQbRCBS20
         lhvJAW7Pl5rY/2GsDkcNjykS0FaKB8Rq/WJ3X4bKIoN+2iCRB9oXZ+5EbMMpTCOwdzxE
         DN41souS9jWDEgm0YADP1UzvNGU4LL8y82C7CUJs7LhsAZyaZR15459KErVBA4yhzHQw
         qqtw==
X-Forwarded-Encrypted: i=1; AJvYcCXVHx4mdVLhliqPSUTV5njcClpa//LD5F0Kio7DW9yLleug4I+MRluGuBhaYB8mHz8czcT5Vlg5tp1lrmO32QT7@lists.infradead.org
X-Gm-Message-State: AOJu0YzTC1mP5cHoGEUAbEeH1jyP29W1d+4Q0jxg9LZz1k1DbM3IwYOv
	AGFkU1cSjEYto7gpHQBCRagz0qFFYXQoAGXkIceiatjmMskmklyCMn/h0wo+QMwco1dkGmwoiqp
	8Z6ijjYtg5A==
X-Gm-Gg: ASbGncsroaMKQdhi7ZhWJgMKCPxz1+/PIXcVeuY5VlhDUsdreO4xcrQmk2EcQopPyk5
	eWDvaVRZ8+VpjwsbXkWZ3DA2GVhPNLU5z90H2Ef5PCs+3dpmfuzybMBeBYQ2sUegSPX70uuKyxg
	D3eLr+C7ORQpw2Qi9SvRrFtM+gY9rHlcUWLen2jUlwblWiQNZItbAc1TuD4F+1Hfu6m1s9ERQ7H
	+c7blSDQScsOqQJ1hx0fWcdU1DWgo5hTmK/brXB6wbPF+EiHbB/1lYcVmwXb4EXplPb37YM/2on
	JXxweT/X9i0XxJyB1fPS9juxgMiMmezQa7L6l0BhMDrYGXkUJFKkolefdaW4R0SWFBj4Bl7DhpN
	YUJHXpcz4NN1O5iWKCFVAjkzU66lCww7slxT7jw==
X-Google-Smtp-Source: AGHT+IHqTDAEvQOt+q1sz1oM/FMn4xs+DKIlODRGS8+cELpR8JABY1klHI4WNO8R4+DbWuABkVVF1g==
X-Received: by 2002:a05:6000:2a85:b0:3e6:b06c:5b2e with SMTP id ffacd0b85a97d-3e6b06c622fmr3645332f8f.57.1757342153210;
        Mon, 08 Sep 2025 07:35:53 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d0a1f807f9sm40948664f8f.38.2025.09.08.07.35.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 07:35:52 -0700 (PDT)
Message-ID: <ff94b709-2861-445d-81c4-9ed98125fe94@linaro.org>
Date: Mon, 8 Sep 2025 15:35:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] perf: arm_spe: Add barrier before enabling profiling
 buffer
To: Will Deacon <will@kernel.org>, Alexandru Elisei <Alexandru.Elisei@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Anshuman Khandual <Anshuman.Khandual@arm.com>,
 Rob Herring <Rob.Herring@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
 Robin Murphy <Robin.Murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250701-james-spe-vm-interface-v1-0-52a2cd223d00@linaro.org>
 <20250701-james-spe-vm-interface-v1-1-52a2cd223d00@linaro.org>
 <aL7dFIzEgiEETcIb@willie-the-truck>
 <b4bcb7cf-da03-4263-9101-feec6d0e0d8d@linaro.org>
 <aL7gsXbr_-k4q-i5@willie-the-truck>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aL7gsXbr_-k4q-i5@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_073555_067039_2F440FE4 
X-CRM114-Status: GOOD (  28.77  )
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



On 08/09/2025 2:57 pm, Will Deacon wrote:
> On Mon, Sep 08, 2025 at 02:54:32PM +0100, James Clark wrote:
>>
>>
>> On 08/09/2025 2:41 pm, Will Deacon wrote:
>>> On Tue, Jul 01, 2025 at 04:31:57PM +0100, James Clark wrote:
>>>> DEN0154 states that PMBPTR_EL1 must not be modified while the profiling
>>>> buffer is enabled. Ensure that enabling the buffer comes after setting
>>>> PMBPTR_EL1 by inserting an isb().
>>>>
>>>> This only applies to guests for now, but in future versions of the
>>>> architecture the PE will be allowed to behave in the same way.
>>>>
>>>> Fixes: d5d9696b0380 ("drivers/perf: Add support for ARMv8.2 Statistical Profiling Extension")
>>>> Signed-off-by: James Clark <james.clark@linaro.org>
>>>> ---
>>>>    drivers/perf/arm_spe_pmu.c | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
>>>> index 3efed8839a4e..6235ca7ecd48 100644
>>>> --- a/drivers/perf/arm_spe_pmu.c
>>>> +++ b/drivers/perf/arm_spe_pmu.c
>>>> @@ -537,6 +537,7 @@ static void arm_spe_perf_aux_output_begin(struct perf_output_handle *handle,
>>>>    	limit += (u64)buf->base;
>>>>    	base = (u64)buf->base + PERF_IDX2OFF(handle->head, buf);
>>>>    	write_sysreg_s(base, SYS_PMBPTR_EL1);
>>>> +	isb();
>>>
>>>
>>> Hmm.
>>>
>>> arm_spe_perf_aux_output_begin() is only called in two places:
>>>
>>> 1. From arm_spe_pmu_start()
>>> 2. From arm_spe_pmu_irq_handler()
>>>
>>> For (1), we know that profiling is disabled by PMSCR_EL1.ExSPE.
>>> For (2), we know that profiling is disabled by PMBSR_EL1.S.
>>>
>>> In both cases, we already have an isb() before enabling profiling again
>>> so I don't understand what this additional isb() is achieving.
>>>
>>
>> It's to prevent PMBPTR_EL1 from being written to after the PMBLIMITR_EL1
>> write than enables the buffer again. So you're right it's already disabled
>> up to this point, which is why we didn't need to add another isb(). This
>> change is only for the re-enabling bit.
>>
>> If the instructions were reordered you could get this ordering at the end of
>> arm_spe_perf_aux_output_begin():
>>
>>    write_sysreg_s(limit, SYS_PMBLIMITR_EL1); // Enables buffer
>>
>>    write_sysreg_s(base, SYS_PMBPTR_EL1);  // Invalid write to PMBPTR
>>
>> Instead of the new version with the barrier where PMBPTR must come before:
>>
>>    write_sysreg_s(base, SYS_PMBPTR_EL1);
>>    isb()
>>    write_sysreg_s(limit, SYS_PMBLIMITR_EL1);
> 
> ... but my point is that profiling is still disabled after writing to
> PMBLIMITR_EL1.
> 
> Will

Oh I see what you mean, I misunderstood that.

You might be right, but I'm looking at statement SFDXJJ and it only says 
"...PMBLIMITR_EL1.E is 0b1, meaning the Profiling Buffer is enabled...", 
so it's just the buffer rather than "profiling is enabled" which would 
require both bits PMBLIMITR_EL1.E = 1 and PMBSR_EL1.S = 0:

   SFDXJJ

   When PMBLIMITR_EL1.E is 0b1, meaning the Profiling Buffer is enabled,
   software must behave as if the PE can do all of the following:

   * Ignore writes to the Profiling Buffer controls, other than a write
     to PMBLIMITR_EL1.E that disables the Profiling Buffer. The
     Statistical Profiling Unit registers affected are:

    - PMBPTR_EL1.
    - PMBLIMITR_EL1.
    - PMBSR_EL1.
    - If FEAT_SPE_nVM is implemented, PMBMAR_EL1.

I'm trying to read Alex's other reply to this patch with it in mind that 
profiling is still disabled, and it feels like your same point might 
apply. Even if it's incorrectly programmed according to the existing Arm 
ARM it doesn't matter if it's disabled.

We did discuss internally about the difference between just the buffer 
being enabled or profiling altogether being enabled. Looks like I need 
to check again.

James


