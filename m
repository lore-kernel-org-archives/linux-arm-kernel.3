Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC70CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 09:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jj8juTRF8BNg42eLql4dmeLHvm0zqwKNTWAupdQfKl8=; b=TTifUskIuwgES6XIg6MC7aZQ05
	78dkSsdIWY26n1MqYJuApwT4zyVQ0IC6XMXUZqIE612rkmh0Ep7tq1WS3bvLQ9OFvQhLRVN1H3TO1
	iZQb+Y7vYvOI95HlrLMrXc5qNg/ZRCNxqWE46RJ6hVdmQeuJtc6+hjvr3wufmj7jk/EKKa8lndl14
	KpnGS02GFvJh4vxSH/W/qh1EheTFAo8czB24FeZfeJhEi0LVA5o73NclC9x5UP8WcOiRoNcpdO/kK
	XEdHeDOcV8FZnuMKBjV21/qiZOYC3dK7BxFm4wmKxmLYg+v+uRGmr36jj5UAQ3fsCmAlgiHvkqi64
	Rfo+QQog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDf35-0000000G0pJ-0Iaw;
	Mon, 05 Oct 2026 09:31:55 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDf33-0000000G0og-04LT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 09:31:54 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c2940ff2313so106310866b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 02:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791192711; x=1791797511; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jj8juTRF8BNg42eLql4dmeLHvm0zqwKNTWAupdQfKl8=;
        b=eVi1peE13wBRBwBFc0S4w3HsvArj+d3vv38mCWx77ha3PGVZX0uromAIT9+STTP8Nj
         aSNO12AjuBVU4f/gqvmv+34EPR3+xBldBigB0Um+aDD8zSDxQAojIVjFy10dKOp7J2s+
         f9SXSWHhWh+iwdfHBO9CM/BJu5doDzPA4zblKt19h+QJKvcrVBDso2TmAzeOqLexqWpG
         Ek4IX/+D/FbzqhQ7y9hEW9GfXnVWIejlMDMpnXJCIW0wUR5HAnyA/L8ZyfikuFA8FKhT
         PB9wxyLUQ6m66Bf+HYcwWwRYHRK65Wef3G4cvgZGm0dNXSogYOhIyRRfzbDpg/kqbkk6
         fj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791192711; x=1791797511;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jj8juTRF8BNg42eLql4dmeLHvm0zqwKNTWAupdQfKl8=;
        b=nWrtmlXq4t/ewR3bH3cDAmX1VqsZtXu5wLothVh3vN2vubtINuc9B7EKZ5/qTtIdef
         1k99CHcB3augnujK7gC58ds/2M4yK3TrGuHN/3lJaIbkjJkn/YGxWWq2bgB4CXt5to4f
         MUg4R8V0bKSeUuGVZLCQJOJW16Bkc4O4ov3XyiotDdaZGpadqjS5NzBlYKaKRwG2zmXL
         bkaTc6FhCWxliW/MEkF4+HTGmL7+qWuALua23l0uV70LupXcolbefUxDmxWwnCj9WqOt
         r8kBoPUrsUd3lfbiH+Mqcj+6eie5wYstYJ1bkLRValeQwB94rpA4N4ynseA/Y+5MHVa1
         XYyg==
X-Forwarded-Encrypted: i=1; AKwUvBwceztZRyRo6PgQcoXF0OIWxKaNN6iAK+Qlv1g9QsLgEVH54G8Sdah/UdSyJID3LT1JWpOD7dEqzm4FtBlnrsnD@lists.infradead.org
X-Gm-Message-State: AFuF++lHHxKPtzQ6SmeNOOJWRY5pyKw3V2py5Y3pqcCxMnBeprd8VkWj
	8WuIah9N7SUfCuM1RsbkwTGRQeZ6SnF+KxeYuEWzntzU1hbH0uxkHx2qD9yBmsXdSys=
X-Gm-Gg: AYBFou2VTSHX5tp1ow9CNZ1dbxJrJy8rEed2MUQo1BrLHyTpQXE2Dc/J656EQw3UVhQ
	bZQAUt8NzB1yQoidqLFN+MLzmBdzItKmpbM8fPijHuEf9xH+iUk7H9TuoDXkncg6UvN9iUnfiJk
	lIH5DUwFOom4fTJX3Imerfip6oZDM5V7I8IwGUB3uocRzl4BYihy5tkhNJSNRlH07uGX7kqA7PQ
	drE0dwF0FdGc/VdPQhtiKBhAC7qoZuBfI3f6u5xQcj4g0ZtVCbmGhoVsKJQ4xK3j6rv++Y3d5t3
	hxzBd5f4UblaerjZEmjBbrO5at/NuKwPxc6OJnjinXxbNwYpWmfVPn/4ZZGfu0vL9BOseNjS+kE
	Y2292nkWCLKN7c+SJyh+JNwWpzGBtz7FOH4cj/iLiCvoflw9JUEyCMJoKW5NV23JotIraYt/9Qf
	8Shsq60Q11mLRR20d0+1hO10j68lgP2/rFjkD/PUXirLqHZFma3wf+/g4AF27eoRS2s2HZLwQE6
	eibNH/62c7eLw==
X-Received: by 2002:a17:907:179a:b0:c2d:c6e7:9e9a with SMTP id a640c23a62f3a-c2e4aabae2emr924547566b.11.1791192711132;
        Mon, 05 Oct 2026 02:31:51 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3155ef11b9sm49533566b.0.2026.10.05.02.31.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 02:31:50 -0700 (PDT)
Message-ID: <9c5e1aa7-4e0f-4576-b322-b4594cdea5b0@linaro.org>
Date: Mon, 5 Oct 2026 10:31:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] perf: arm_spe: Factor HW discard mode out of
 arm_spe_perf_aux_output_begin()
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Leo Yan <leo.yan@arm.com>,
 Suzuki Poulose <Suzuki.Poulose@arm.com>, Al Grant <Al.Grant@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260805-james-spe-software-discard-v1-0-0ff0e44c4c92@linaro.org>
 <20260805-james-spe-software-discard-v1-2-0ff0e44c4c92@linaro.org>
 <asNfh-qywjOPxajj@willie-the-truck>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <asNfh-qywjOPxajj@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_023153_084414_8EAB5269 
X-CRM114-Status: GOOD (  21.65  )
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



On 05/10/2026 09:27, Will Deacon wrote:
> On Wed, Aug 05, 2026 at 04:01:52PM +0100, James Clark wrote:
>> Discard mode doesn't call perf_aux_output_begin() or emit aux records,
>> and enabling it never fails. We'll add a second discard mode in the
>> next commit so it will be cleaner if there is a separate begin function
>> just for discard mode.
>>
>> No functional changes intended.
> 
> [...]
> 
>> +static void arm_spe_pmu_begin_discard(struct perf_output_handle *handle,
>> +				      struct perf_event *event)
>> +{
>> +	u64 limit;
>> +
>> +	limit = FIELD_PREP(PMBLIMITR_EL1_FM, PMBLIMITR_EL1_FM_DISCARD);
>> +	limit |= PMBLIMITR_EL1_E;
>> +
>> +	write_sysreg_s(limit, SYS_PMBLIMITR_EL1);
>> +}
>> +
>>   static int arm_spe_perf_aux_output_begin(struct perf_output_handle *handle,
>>   					 struct perf_event *event)
>>   {
>>   	u64 base, limit;
>>   	struct arm_spe_pmu_buf *buf;
> 
> Is it worth checking that we have a discard event in begin_discard() and
> similarly that we don't have a discard event in output_begin()? It looks
> like quite an error-prone interface for the caller, otherwise.
> 

Makes sense, I can add that.

>> @@ -775,6 +785,12 @@ static irqreturn_t arm_spe_pmu_irq_handler(int irq, void *dev)
>>   		arm_spe_pmu_disable_and_drain_local();
>>   		break;
>>   	case SPE_PMU_BUF_FAULT_ACT_OK:
>> +		if (arm_spe_discard_mode(event)) {
>> +			arm_spe_pmu_begin_discard(handle, event);
>> +			isb();
>> +			break;
>> +		}
> 
> This looks like new behaviour?
> 
> Will

I just extracted the discard part of arm_spe_perf_aux_output_begin() 
into here and arm_spe_pmu_begin_discard(). The PMBLIMITR_EL1 write and 
isb() should be the same.

Do you mean that now it does arm_spe_pmu_begin_discard() unconditionally 
before checking PERF_AUX_FLAG_TRUNCATED? Truncated would never be set in 
HW discard mode, so it should be equivalent. And the IRQ would never 
fire anyway so we don't get here until SW discard is added, and even if 
it did, handle->event is NULL so the handler would exit on the first 
line anyway.

I suppose there's another change that it can never call 
arm_spe_pmu_stop()? But that wouldn't have happened in discard mode either.

James


