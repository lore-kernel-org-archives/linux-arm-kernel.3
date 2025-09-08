Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72E4CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tCHpJvxz6Qb8QBxhEywwqTxUHZsPubTDT4UbMJARa5E=; b=2+l3zP7f52xezOcJ/KGyNnPsIV
	467VjVbzKEpZ1PszbezsDS6qmZBew0DHsOIE8iQTgwVr3carzCSSJKNOIR/MBK9EIq+vU+XgMqxae
	Z9+T6RFMlJkFuveC7K/z2L9MIIP5NLH/7iXGVqfWcZ2Se8IGyZYvlUPsgPGkftwfnTW6jml55KQGs
	gZdpoL7zmbjZ84o0rqvDArNbQaGa86/sqFQVcTstiRr8hoG5yzQCFM7L+FFbUtgKOAC0orYnuQRLw
	niP/4jzZgYX6H56HBd6T0F1bKtrP2ArhV5D5nG9q121egKprGge12UfqTi6QThkywDGX8QnKlQDNo
	66X68Sow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvftL-00000001HOS-0xvu;
	Mon, 08 Sep 2025 17:42:59 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvcKJ-0000000HWnA-0IW2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 13:54:36 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45b4d89217aso28435215e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 06:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757339673; x=1757944473; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tCHpJvxz6Qb8QBxhEywwqTxUHZsPubTDT4UbMJARa5E=;
        b=rzYJ/pYHc2m915Te6BB7U1IPIKaz+S+JMOwHUcjfSTa/gK4qVlMX9OKv/mKxOjDeIC
         bC5ewtdnp8fYsOc6/8Tndt7n2FT97x/vK3iCfW0CClVCanptdl0DYp5gTd9K67Nq74bm
         2fVsO+YTJBRzgEZmsPTWOfTsTK9EMKW7/OwMRhHrwTdqm40W7SPoE5yTvsJ82t1L8Tor
         zQ16fCYhhEMujzUziW2Dy2WnqshQj+ifIwtjahPKyEwEILVp5Ma4+4PGuXkz0pFRCSIh
         LlTlDTrkfDs1ykZIyZPxUQresNRFiJ0B+LNpvc9Xi7y/pFIDJaiYWVchoOU/yvHZxG6F
         cLJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757339673; x=1757944473;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tCHpJvxz6Qb8QBxhEywwqTxUHZsPubTDT4UbMJARa5E=;
        b=HknoRC71juYHmprN7jgjXki7a+tFoVBmeA6XO/VIuaqHcPvZCTvEvAIHQho9/lEwJA
         moGFJd8P54AP5dvMbJJ6iF922ZJHcJ7PGNKg6qBgRyNOWD9f/xfzQUiBmhMYJdZfXyww
         V+/+6hjQNKxOoT66SwQqHVZMyEgrorXjpAZx/dJJeQQqmRuLUSCvwEiobtsbjCDbSE/1
         +F4GaR/X3xMUlv4G2ZqdXCGw7wr/qK5gc7wvh27hWF8jR3PUtuUETTjxo75St2I0KFj/
         ZPBxBtyz/kt+k+JSVGpy08X7C2ip8tpVtcWsVRQWnmcNTmrIwwcL2x5hsGWoy3cBTHne
         QhRw==
X-Forwarded-Encrypted: i=1; AJvYcCWtFR3ePeM0etl85sV/4FDMWM4/ulIU+/W/ab7ocZBdmwYHa3/yW7ZJIuNr3cEvAw84OnVIIfRTHfvh6YcWDbTn@lists.infradead.org
X-Gm-Message-State: AOJu0YzULfNUme+EHc203qAuo0L3s0vwdOE94crak/1wCebLJYlDc+v8
	/a3g4ktzYgg8ZlEAFp/Lfp9j1B139dsYNDphOBN/18sCpKfdA1ESY9/u6ldT23ZdGac=
X-Gm-Gg: ASbGncuWwpXXrkZOvb3a/hiyGZEFQTEAset3lLrbCm493NNjBHbQi6lZIW1KidVOHEE
	jNO2xzoVEeY4oyisW5CatKhbDTrDwNKLcIEQeNgwmQKRSZ5+ti5fmuwDedGqOgHCi54+5AcGbkK
	6h4PJwuIJ2rwtghEFK9SXZOIWhugEwWh1LZy2827kWVxJ1RSyid+Xc3sDIxRM8A5Oa03aINXQ4p
	6XyaeMqn5xW12e/rsBmRRkfR3tnk4pQO6OiWpFRoyISqDQXZ80I1LDlY6Q44Y6OctHppMh6+0IK
	6AumxTKgjw1ZoOLeUSO7RxXwveqRsRr+eB69bfgJhrJNtWcpiV8ca8t1UizUWNSfzKFyJeeC/+c
	v76ib3iugwuleAjH813tTXV/J0TE=
X-Google-Smtp-Source: AGHT+IF+ypPVfQCAEOxwFI3Zr/SauvJzp3o2msqjq7oBAEzx5/Zdo6XXLDnm5bhPV93Qax8SeMujHg==
X-Received: by 2002:a05:600c:4f8b:b0:456:19be:5e8 with SMTP id 5b1f17b1804b1-45dddecd860mr67247425e9.20.1757339673359;
        Mon, 08 Sep 2025 06:54:33 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd296ed51sm189909035e9.3.2025.09.08.06.54.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 06:54:33 -0700 (PDT)
Message-ID: <b4bcb7cf-da03-4263-9101-feec6d0e0d8d@linaro.org>
Date: Mon, 8 Sep 2025 14:54:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] perf: arm_spe: Add barrier before enabling profiling
 buffer
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Alexandru Elisei <Alexandru.Elisei@arm.com>,
 Anshuman Khandual <Anshuman.Khandual@arm.com>,
 Rob Herring <Rob.Herring@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
 Robin Murphy <Robin.Murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250701-james-spe-vm-interface-v1-0-52a2cd223d00@linaro.org>
 <20250701-james-spe-vm-interface-v1-1-52a2cd223d00@linaro.org>
 <aL7dFIzEgiEETcIb@willie-the-truck>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aL7dFIzEgiEETcIb@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_065435_115432_3D7B83FA 
X-CRM114-Status: GOOD (  22.91  )
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



On 08/09/2025 2:41 pm, Will Deacon wrote:
> On Tue, Jul 01, 2025 at 04:31:57PM +0100, James Clark wrote:
>> DEN0154 states that PMBPTR_EL1 must not be modified while the profiling
>> buffer is enabled. Ensure that enabling the buffer comes after setting
>> PMBPTR_EL1 by inserting an isb().
>>
>> This only applies to guests for now, but in future versions of the
>> architecture the PE will be allowed to behave in the same way.
>>
>> Fixes: d5d9696b0380 ("drivers/perf: Add support for ARMv8.2 Statistical Profiling Extension")
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/perf/arm_spe_pmu.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
>> index 3efed8839a4e..6235ca7ecd48 100644
>> --- a/drivers/perf/arm_spe_pmu.c
>> +++ b/drivers/perf/arm_spe_pmu.c
>> @@ -537,6 +537,7 @@ static void arm_spe_perf_aux_output_begin(struct perf_output_handle *handle,
>>   	limit += (u64)buf->base;
>>   	base = (u64)buf->base + PERF_IDX2OFF(handle->head, buf);
>>   	write_sysreg_s(base, SYS_PMBPTR_EL1);
>> +	isb();
> 
> 
> Hmm.
> 
> arm_spe_perf_aux_output_begin() is only called in two places:
> 
> 1. From arm_spe_pmu_start()
> 2. From arm_spe_pmu_irq_handler()
> 
> For (1), we know that profiling is disabled by PMSCR_EL1.ExSPE.
> For (2), we know that profiling is disabled by PMBSR_EL1.S.
> 
> In both cases, we already have an isb() before enabling profiling again
> so I don't understand what this additional isb() is achieving.
> 
> Will

It's to prevent PMBPTR_EL1 from being written to after the PMBLIMITR_EL1 
write than enables the buffer again. So you're right it's already 
disabled up to this point, which is why we didn't need to add another 
isb(). This change is only for the re-enabling bit.

If the instructions were reordered you could get this ordering at the 
end of arm_spe_perf_aux_output_begin():

   write_sysreg_s(limit, SYS_PMBLIMITR_EL1); // Enables buffer

   write_sysreg_s(base, SYS_PMBPTR_EL1);  // Invalid write to PMBPTR

Instead of the new version with the barrier where PMBPTR must come before:

   write_sysreg_s(base, SYS_PMBPTR_EL1);
   isb()
   write_sysreg_s(limit, SYS_PMBLIMITR_EL1);

Thanks
James


