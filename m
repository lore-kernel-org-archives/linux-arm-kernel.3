Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C946ACA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 18:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MAvCbKbdsh9AD3IPo9PqUkN5Wi8Z7B3asWHTingNxr4=; b=s6lPKdZ+TZ5pshwDTfrHdkCXf5
	bNSqRvKd8xJ2+XkIIkXOjM+hf6YVAVGq8Y+83NYWT3th4t9oL9zCd84m3052Ht7apSZXF7WW+haSM
	h6fCQH0KY4zL3GzeBO+9/8I5Inb4D9DKkVQ1Qq57CEo6BLrJ2z2Ye88m4sJakBoD/KHHhkCEaEvXp
	CW0kqh2NFRrb9++th20UsagTlTu0H3W/Lxc5O32wyF7PK9ygx35pQRAAre6N8KfVu+XTioLh/TksE
	rLXXMWbVmR0NVHreD+rxfs8jchT0uTRO9JpwT8RfLTlJZiIQnLb31UDMd/+k8KJB9y6grQSX412x8
	UEH3ipqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvgCJ-00000001O1C-1MU1;
	Mon, 08 Sep 2025 18:02:35 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvdAM-00000000Dzk-3PHg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 14:48:23 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45dcfecdc0fso38332815e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 07:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757342901; x=1757947701; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MAvCbKbdsh9AD3IPo9PqUkN5Wi8Z7B3asWHTingNxr4=;
        b=C54QmYfZphI6f/kO/k7yePUQI6xIL6/FsmPHriurAltfQ+H/kKJhGZoLqPybx2XIPg
         aUUhUGBMKlXOaT85EFp9CjSybiaWriRs12ovfxJ12jrtEImwSYSEn9vny0FwgEsbc5C4
         IwneK/xJlVaQRxF15EAjNOftd4qV6AAu4ogdE6b+bIg5YnnrpHrh4QOHvJIljpiwU06D
         +9OO0OQ2+k3YVhxBA57sxn+aBvYvWZI5xLqMonzADxJUHHXCYHd+buCL7GGw50Fpnnkn
         sM7WO7JYVYOL945bgZJmrCyFZoyyAjv2U9ghgBdCpvxkVHwPCJ1HlSoqiO4Jm0T+dNxK
         HCkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757342901; x=1757947701;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MAvCbKbdsh9AD3IPo9PqUkN5Wi8Z7B3asWHTingNxr4=;
        b=UhWqtprCvwazpERm4I3ZKvA3ark73SKEkEH6uHNxY2mxBfX85XHiwzr9HUYxhDpPcY
         8WV/cFah81dQIgeFDuAV60D8/jNcpUj3kQJydlTneEIznzO0BnuDhTT75x5kvpCEwFgZ
         ypWnDwQwaYynGnO7zh3DF4ojPSBRi+n4zDTcY6TyFGjHFbS1EJJNLzWBP+zn7zfM7bZF
         HOt6P5vSxZKo9dQUpTcDA74+CoyUBmXazmARIahqF49TAMoXxGNPp93vblWHU/LNdYT0
         2BS9Kf0eLfj1ui0infEIT4r+OclhbXhOGT/vuvh6KyhCGnVyz5zBIfsHBScdczHuY2Qd
         7iVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSZ3O/LYv6BwOTT4d4hmHRdp3lYXdu/mOm2phf+xDpThmj34oJ4WdlVlnKkfvkQh19haxwp8QbzQ8r3Fj+2nov@lists.infradead.org
X-Gm-Message-State: AOJu0YwsnGbZNRAD9e85O1XGKC5IfXxUOAQDFU8vTYl1OF45BCx//qoE
	IsMAJavk/ru4x9VCiA35gM/+aWIZAAz0yxJnadBRhdolN+7QQS7PkZosyp66gvdrgSI=
X-Gm-Gg: ASbGncshMnwlPdemoSjk3ThfGCZuLBpgD+aWikdMQ/fnhoc2PZ4dDIRC+H8NT6JhCae
	tUPZNwy/KwR5WmpfDWojaK9+JmoIUGFE8ew6GoLGQH0OAlhn/XWnrU+bLk5BXEwlTGzYM2FRDTH
	9hZvOyZqsVUPZvK1wi8z7tdTrZbEp4Lzga7K8PQfUvUjjS8xJvghpeFMzNG1I7Xeau/62K7+27t
	suS5RGV3kvgQjq+vqKwZ6otyBZY38i7hEKcRkJe4mgpII+cK5UYUEdcXulY6YC21d1gmZmGRTIW
	LcJ+qRQFiag7xT8yDycx5c0U16O87VHnpgtqVBDo65gZRWlxWtj2T7gUfq9HK12KiJBrRLezqjY
	DE3N+jJUwWqS7AqCqvcUqPZcNSd4PDnfx+faOQg==
X-Google-Smtp-Source: AGHT+IEJo0vSHfdIztLW0ycIdQO2nmVSvnB0WqI6b4WOE4jzB6Nqjlg+ZSbAlvlaOsL9wHYhXgC+lg==
X-Received: by 2002:a05:600c:3149:b0:45d:e326:96d7 with SMTP id 5b1f17b1804b1-45de45f2bb7mr38192255e9.13.1757342901125;
        Mon, 08 Sep 2025 07:48:21 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9a6ecfafsm297159625e9.21.2025.09.08.07.48.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 07:48:20 -0700 (PDT)
Message-ID: <5e0926df-053e-4217-9141-5b1107363a89@linaro.org>
Date: Mon, 8 Sep 2025 15:48:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] perf: arm_spe: Add barrier before enabling profiling
 buffer
To: Alexandru Elisei <alexandru.elisei@arm.com>, Will Deacon <will@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Anshuman Khandual <Anshuman.Khandual@arm.com>,
 Rob Herring <Rob.Herring@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
 Robin Murphy <Robin.Murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250701-james-spe-vm-interface-v1-0-52a2cd223d00@linaro.org>
 <20250701-james-spe-vm-interface-v1-1-52a2cd223d00@linaro.org>
 <aG0tsz1EPbrDFTia@raptor>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aG0tsz1EPbrDFTia@raptor>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_074822_859570_A694646B 
X-CRM114-Status: GOOD (  29.43  )
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



On 08/07/2025 3:40 pm, Alexandru Elisei wrote:
> Hi James,
> 
> On Tue, Jul 01, 2025 at 04:31:57PM +0100, James Clark wrote:
>> DEN0154 states that PMBPTR_EL1 must not be modified while the profiling
>> buffer is enabled. Ensure that enabling the buffer comes after setting
>> PMBPTR_EL1 by inserting an isb().
>>
>> This only applies to guests for now, but in future versions of the
>> architecture the PE will be allowed to behave in the same way.
>>
>> Fixes: d5d9696b0380 ("drivers/perf: Add support for ARMv8.2 Statistical Profiling Extension")
> 
> A note on why I think this is a fix.
> 
> The write to PMBLIMITR_EL1 serves two purposes: to enable the buffer and to set
> the limit for the new buffer. The statistical profiling unit (I'm calling it
> SPU) performs indirect reads of the registers. Without the ISB between the
> buffer pointer write and the write that enables + sets limit for the buffer, I
> think it's possible for the SPU to observe the PMBLIMITR_EL1 write before the
> PMBPTR_EL1 write. During this time, from the point of view of the SPU, the
> buffer is incorrectly programmed, and potentially the old PMBPTR_EL1.PTR > new
> PMBLIMITR_EL1.Limit.
> 
> arm_spe_perf_aux_output_begin() can be called after sampling has been enabled
> (PMSCR_EL1.E1SPE = 1).
> 
> Putting it all together, this means that we have all the conditions to break the
> restrictions on the current write pointer and the behaviour is UNPREDICTABLE, as
> per section D17.7.1, ARM DDI 0487L. I think it's worth pointing out that the SPU
> can do any of the folling in this situation: writing to any writable virtual
> address in the current owning translation regime (!), generate a profiling
> management event, discard all data or don't enable profiling.

D17.7.1, ARM DDI 0487L only states this is an issue at the point of 
enabling, not writing:

   "When profiling becomes enabled, all the following must be true..."

I think Will has a point that it's not enabled at this point and it only 
gets enabled after some existing isb()s. This is only an issue if we're 
following DEN0154 which seems to be more strict.

> 
> Thanks,
> Alex
> 
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
>>   
>>   out_write_limit:
>>   	write_sysreg_s(limit, SYS_PMBLIMITR_EL1);
>>
>> -- 
>> 2.34.1
>>


