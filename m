Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E4BC83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 11:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rjMtWlZcH9KDWdY+uSujQcWsrGYDBsGSKcWmFVedP5g=; b=Jvf90yLAmG7L8SXDf5aWXm80Oj
	AeY9Uc1bGxn5fmEGtunw0nZiiN5yUEfr5G5qN3QQaCkXDjZUNfyllY9yRed08DPP5ictF1NQMOdFI
	SqCwALt9UVd7Hsc8prENsLlWSx6DxFp5u/hM6t8n8EpcTvKM0xN42fBqF+xWlFa4FNmdw3Abk4a9t
	mtRWyGvqxWflMzh/RINe2GGkfnjPQS18cyrGc09ZuysuLepaHVkuV21XFn/mwmWoaLt6F0B9Li5Ub
	18cjJVCjtx3QSN2qWrpbsJB5yxrc5DPFdux0YMkIqIV4dr98F3+sZlTpZ2K1OidwoiQkj2TVbL5sV
	3RWE5pUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYkQn-00000002LRI-2xYY;
	Mon, 07 Jul 2025 11:54:45 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYjvd-00000002GcA-1UM2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 11:22:34 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4530921461aso20027885e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 04:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751887352; x=1752492152; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rjMtWlZcH9KDWdY+uSujQcWsrGYDBsGSKcWmFVedP5g=;
        b=xgSycJH3GLj7iUjbdZBA1MOdiQ47otgatOFHJgdFYBrH5XSndY+UKBhKyT9hG6X3P1
         OE8shoAeVgkryML5NVMHTCUHqvWPcx0ipZS5gvYhkkIMROtKvTRSFWWz8Eu1bh1OBi+Q
         LWAefR+R5KI4AwGqXV5d6Q52uSN9d7pvn9f1UyMb9FJUhxKeRM7Uc2N8KcTKGyeLZt4K
         oxPoLDkBkaE5Mpc7GQTRq+tKvI0+tp6vpiujuOsDEcdPDzXa1KAHxeEKuBiVY915KJy6
         duyavcNry4wlViPqQdlowXSrOhSwjc4u7fWPgpUZfuCG0G6fTxJ4SyyznvLHiqKI497p
         AHdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751887352; x=1752492152;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rjMtWlZcH9KDWdY+uSujQcWsrGYDBsGSKcWmFVedP5g=;
        b=YKcolVQuR8T9+juuuS7nV9v7zKWnKYo5xXaHJzb9UbJHszs5mS2ao6M7+FNgjoIOM0
         nIYCVX6zKF0kOTGJ1RUJlm7yX7b8jLyqEMCUbHLYRrYCaQluW+GN1OFfncAYsWPRigiR
         shCnhR1XkVWf852P41iEptgfWDye0StGrAPC+O2nMlsCZ+yRFVqRqHcqAclrYxpyynkO
         4UlAPBxW4M3jmpoJuHYbUqsa5n217wqadweNlLrYuCYhNATqT2Dk52DlCCLIGkags46/
         YW1xQPTMiS+333prqaNx5D9j5KHmnEB8vZJ32nZ511G+B0MRPU4Cf6DlJHF0XIDREjcm
         JpfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmvBJuP75KjsOKah/cBsr8Wwk6O7vJVSoVn5zXV86DOd5qWWv63piBvSyEy2XnRgy0KE6pab0BX+iG8M3W0/HO@lists.infradead.org
X-Gm-Message-State: AOJu0YyvCJCtK5mmwP1Qxe48n6YQCiI4Yod64g0vH9bw9tVc7srCwBeI
	naCuIaJJ9kuALOky1IqB8xUb501JH3wJmXANLBuImX8XzRhYc9naTSPe8pp7JosHHQY=
X-Gm-Gg: ASbGncukvfbjwcFfKZUVrevoaeZ/CWalgFqcq/yGtrt+mwOGPJs1yHulL/dFwaK9L+o
	8aq1HuppF84eSrOIGfoaUmvqANTAUiAW3A5g4ZIxP8jgOgmFq4Q6usIlWcJK9C68Y42icex6Ncu
	ZsqeqXxgxdjhlaZgxhqZj8r3O1Spr8Df+yNkkcFOhSJPDKt5SRs6V3NzVh/p0fvsU0d0coffyZm
	c8scEZ7M58gQmboZrf575nhlYeWzaQZtHObCkVvU1WRLnlGdbNlPzNnch2Msk6DyJhOTRHcJ8O5
	wTqRnAthTGdlSf6eQjvdiZktHLZNVBTtGYVzHjh/H95By/XY/QgkdnBvHEHNryq2WVE=
X-Google-Smtp-Source: AGHT+IHP+NzOEoebO2F65iIhUokYTdg25eXvRyuw2XM8rhBPvr8L/1ygaNVNU239JiCScgrpFEZPwA==
X-Received: by 2002:a05:600c:c3db:b0:43c:ec4c:25b4 with SMTP id 5b1f17b1804b1-454bc4c1e94mr47310605e9.10.1751887351597;
        Mon, 07 Jul 2025 04:22:31 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b16990aasm109152915e9.32.2025.07.07.04.22.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 04:22:31 -0700 (PDT)
Message-ID: <6f55d9ba-02c5-4075-a751-018b1521ddd4@linaro.org>
Date: Mon, 7 Jul 2025 12:22:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] perf: arm_spe: Add barrier before enabling profiling
 buffer
To: Leo Yan <leo.yan@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Alexandru Elisei <Alexandru.Elisei@arm.com>,
 Anshuman Khandual <Anshuman.Khandual@arm.com>,
 Rob Herring <Rob.Herring@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
 Robin Murphy <Robin.Murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250701-james-spe-vm-interface-v1-0-52a2cd223d00@linaro.org>
 <20250701-james-spe-vm-interface-v1-1-52a2cd223d00@linaro.org>
 <20250704140443.GH1039028@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250704140443.GH1039028@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_042233_403879_D8946470 
X-CRM114-Status: GOOD (  29.79  )
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



On 04/07/2025 3:04 pm, Leo Yan wrote:
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
> I know that you and Alexandru have discussed whether the isb() should
> be placed here or after the out_write_limit label. I should have engaged
> in the discussion earlier. Sorry for raising the question now.
> 
> My understanding is that isb() is not only for synchronizing the write
> to PMBPTR_EL1. It also serves as a context synchronization event
> between any other SPE register writes and the write to
> SYS_PMBLIMITR_EL1.
> 
> Let me give an example (perhaps a rare one): if we use perf snapshot
> mode or the AUX pause/resume mode, it's possible that the flow does
> not trigger an interrupt via overflow. Instead, the sequence might
> look like this:
> 
>    arm_spe_pmu_stop()
>      `> arm_spe_pmu_start()
>           `> arm_spe_perf_aux_output_begin()
> 
> In this case, to ensure that all SPE system registers are properly
> written to the hardware, the safest approach is to always execute isb()
> just before writing to SYS_PMBLIMITR_EL1. (In other words, after the
> label out_write_limit).
> 
> Thanks,
> Leo
> 

I think the point is that any write that enables the buffer must come 
last, but not necessarily all writes. And not all paths in 
arm_spe_perf_aux_output_begin() enable it so the isb() was only added on 
the path that does.

I couldn't see an issue with your example, are you saying 
arm_spe_pmu_stop() could call arm_spe_pmu_start()? It doesn't call it 
directly. Or do you mean the aux pause/resume thing can cause a 
arm_spe_pmu_start() from any point in time? If that was true then it 
doesn't matter where the isb() is because you can never be sure it will 
be before the write.

James

>>   out_write_limit:
>>   	write_sysreg_s(limit, SYS_PMBLIMITR_EL1);
>>
>> -- 
>> 2.34.1
>>
>>
> 


