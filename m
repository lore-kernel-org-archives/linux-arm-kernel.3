Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0275ED3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 13:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=72QsK2qLtuVkRibbCMc0jfemrzd33YGdmN+Tg9YYMXY=; b=atDB+AJMujl/5Ki2yOyHjnvzC3
	FQVyT2UYqhOHvZRumcWJUITL7WVEHsAQ55ITn4kPhXzRuMKx78k26H/3fbgEPyvTQfvZryuIjkfAA
	GMgTeYQWoPn7Yn2HV4zO3NjxV98THL7Vclwbxz9YrcNauivsSfPbwOP6khLBiGVkPaCf6bQiWgxrS
	mbpj+Brc2jOoY/r9iejB02ILW11zACt0IxV9rKRyKv1b6dpo7iZS6hjINmNv4vcBe1H6t6AgaV3GU
	vFsZVdFLicDqx6Q8NsEMmm1JhLjUAfzPdg21ruuLWvs6uRH+HLnKnbHbnwkt2gjST+4aH67Qmo6J0
	kogbGXpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSxxI-0000000EKRb-3WZB;
	Tue, 09 Dec 2025 13:40:40 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSxxH-0000000EKRG-13Q9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 13:40:40 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-42f762198cbso3664039f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 05:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765287637; x=1765892437; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=72QsK2qLtuVkRibbCMc0jfemrzd33YGdmN+Tg9YYMXY=;
        b=HhFrlowTEmH32nzv8PnToj/uglBjqLOl+Alga323G/PBEhg0GzuFx27cOhCE48dyb/
         8nFnGN6cAmYP1H1RVzSKvrZWGS/rZ/AwDrs3eSqn473kS12qxCYSZTa9J9NvDZWWcH4h
         vP/KL430tRiIb6Q8h31vntUhG7sK1SqA0x7uHYN6sHbSgtOMvccnzsXB/Vu62LIj8bxJ
         Hkam0IQiCtpZauLwDYUZmSH2/rJS8kbMknlsEDeJjyRc7/AivgIdX6n5iHBK47M/0IM6
         arp+k0K7LWPscXIgblVABsTH7Cd9ATUDXhJU65Y2xLaSN2LStgnbP8xEu4hgpyWS1B57
         j6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765287637; x=1765892437;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=72QsK2qLtuVkRibbCMc0jfemrzd33YGdmN+Tg9YYMXY=;
        b=Wf469v5fPHOx2v62vvwSfho83QSrDPIORFfXJkNnhW+gLfAroNcZGZ3RnRb8xUYXVI
         WJbO5ntJU0qxe4DX1/FXuSpt2lFogpqrrMV3nh3JboJjKucbA1iALFtcNtJ/3sGmLvKu
         Xg8eIQs7T1AzmIam1DuUjsIPiqniLDwh9A7iYNxOmYZslg8JgJx+wXH/y6jdWSlU1dQA
         3svQS2Pxzz8AAW5qTp7dl0uqcUUSbLVZ0+RL6kHbouzgys1QHTwd6JitdgJazi75s5F1
         /E9svFM385fh2KgRIB/I5m0vLzd3ZkhHXXBVLdCOzzZqFXSrseL0wce8Zc5ekdPVNy0Y
         tBHA==
X-Forwarded-Encrypted: i=1; AJvYcCXrgfXsznKsHitJUtgt+ZTkDwK62JuXDGQMQk/tueK1As6mBx4pxm0Z6W35Ow1/4L9By3e13xN5Os08+THuJrAL@lists.infradead.org
X-Gm-Message-State: AOJu0YyHX53CZKud0XepLkxcdxhyYbGn/tflEnm/cjGZh3O5S6vMqhot
	YQPYCQo5hmZUp6gi4XByYQORExGkU3zI2EXs5w2PH+pWj3zYfK30ctQKbJlhV2P4MEY=
X-Gm-Gg: AY/fxX6whllZbidXIIeWRUCkFhw1fGl3NrWFjrgyA1tJZvMfzO6naiO6PvkNdarTWio
	uK1i349nG/jKtDu78HTnOB5eW1bOw4U11QVM421bXFzsaexiccJuAm56As9BOy/mCA4wEj+BamQ
	ZQ090sJVEsFwDj7kv2ERKThTFVv4eRlV0B369H4VrLFboLCgAhWEfdO7BueTV5EbXo2grVMmFLO
	yr/vqmyizcl3us3+IodF06/NLsd4lSKDSq6pS+rlurpg4Ew2ny2UTIdJ9Dx+FjBwokvF1o6vMhz
	MRBZrYSg+AyBAEZhTxqvBpaSFVPa5nCv6EzJJwDU2m+BBI+rVP0q3LI5pnZbrurMztQdB7mIcrV
	8kLMVJnjoZNC3kv8KjxpvLIn3ZXnNmvwQ4MtdcsK1tYZY7Nmkrw7a1KzpptvvO5fgj0n+klnZR/
	VKBDYyQoAyavhTU7HY
X-Google-Smtp-Source: AGHT+IHW3lTb4bkJPYXQGsF8dafV63QpW/SGM7fqaQRwVN5UO/PBPV8PAIucTl7a1lglMk9ffw/Mpw==
X-Received: by 2002:a05:6000:2912:b0:42b:394a:9e3 with SMTP id ffacd0b85a97d-42f89f3d70dmr11919856f8f.38.1765287637295;
        Tue, 09 Dec 2025 05:40:37 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbe8f85sm32683180f8f.5.2025.12.09.05.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 05:40:36 -0800 (PST)
Message-ID: <f1ac7190-bdd9-4725-8955-d82d6f1912fb@linaro.org>
Date: Tue, 9 Dec 2025 13:40:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/19] coresight: trbe: Use PERF_AUX_FLAG_PARTIAL instead
 of PERF_AUX_FLAG_COLLISION
To: Anshuman Khandual <anshuman.khandual@arm.com>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>
References: <20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com>
 <20251201-trbe_buffer_refactor_v1-1-v1-8-7da32b076b28@arm.com>
 <5f6bcd93-b565-4b10-9a2d-6851141e5dbe@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <5f6bcd93-b565-4b10-9a2d-6851141e5dbe@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_054039_342665_22284FF8 
X-CRM114-Status: GOOD (  23.98  )
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



On 05/12/2025 4:28 am, Anshuman Khandual wrote:
> On 01/12/25 4:51 PM, Leo Yan wrote:
>> When tracing stops, there is no collision with other samples, so using
>> PERF_AUX_FLAG_COLLISION does not accurately reflect the trace state and
>> may mislead userspace.
>>
>> Use PERF_AUX_FLAG_PARTIAL instead to indicate that tracing stopped and
>> the record may contain gaps.
>>
>> Signed-off-by: Leo Yan <leo.yan@arm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-trbe.c | 19 ++++++-------------
>>   1 file changed, 6 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
>> index b06885a08e082fd34f68d9588518807b5c47c86e..0caa4a6b437a3aa39fc6bcc72a23711b54f7c598 100644
>> --- a/drivers/hwtracing/coresight/coresight-trbe.c
>> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
>> @@ -669,21 +669,14 @@ static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *hand
>>   	}
>>   
>>   	/*
>> -	 * Mark the buffer to indicate that there was a WRAP event by
>> -	 * setting the COLLISION flag. This indicates to the user that
>> -	 * the TRBE trace collection was stopped without stopping the
>> -	 * ETE and thus there might be some amount of trace that was
>> -	 * lost between the time the WRAP was detected and the IRQ
>> -	 * was consumed by the CPU.
>> -	 *
>> -	 * Setting the TRUNCATED flag would move the event to STOPPED
>> -	 * state unnecessarily, even when there is space left in the
>> -	 * ring buffer. Using the COLLISION flag doesn't have this side
>> -	 * effect. We only set TRUNCATED flag when there is no space
>> -	 * left in the ring buffer.
>> +	 * Mark the buffer to indicate that the trace is stopped by setting
>> +	 * the PARTIAL flag. This indicates to the user that the TRBE trace
>> +	 * collection was stopped without stopping the ETE and thus there
>> +	 * might be some amount of trace that was lost between the time the
>> +	 * TRBE event was detected and the IRQ was consumed by the CPU.
>>   	 */
>>   	if (!is_trbe_running(trbsr))
>> -		perf_aux_output_flag(handle, PERF_AUX_FLAG_COLLISION);
>> +		perf_aux_output_flag(handle, PERF_AUX_FLAG_PARTIAL);
> 
> This is interesting. So there is a no possibility for the records to be
> overridden in the perf ring buffer and incomplete record is all that can
> happen when TRBE is stopped, without stopping the ETE first ? Could both
> of these scenarios might be possible as well ?
> 

There's no chance of overwriting because that would be the TRUNCATED 
case and the event would get disabled. PARTIAL seems to be when there 
was an error that's recoverable in the driver only, but as in my other 
comment I don't think the extra complexity is necessary and always using 
TRUNCATED would be enough.

>>   
>>   	if (is_trbe_wrap(trbsr))
>>   		return TRBE_FAULT_ACT_WRAP;
>>


