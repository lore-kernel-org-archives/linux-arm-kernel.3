Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 858EBD1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 14:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I77rqlgPE4VEYTyOhE8C9IAUeqfQbxcz2xaE/KeMMmY=; b=yPwjiAPyZDK5O8pmVeEbzL9cgU
	b6CP+NjSr2YEagCRKHMYClwlTlbKSg+H84fKTuh6zBPvbSx5odicBBdNkZbQuWrxkb+0xY63JzOUQ
	Yuy/Z4AH4804RCcQHaV/9OQIsk1PjQzA1YvRcR1vNLkZAYUe1mgpVjMVNf16kZyqrhLQlSaFcNh47
	BzwGhovvHWoPQ4kK9ZAIFk8G1t04pXKK0uh6tjkEPztEVHIj6m/Y1pKxU35gmhMSHEmOnBJY73gEN
	+UxL/GXmNzXrgmJF0V7tSJKq4Plw/RfATJ+KJXN7kQexgIysYRMG5dxeWxCdYAY3aOe/FlGsFgpxd
	hQ8z8OtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSz6f-0000000EQTS-1ikU;
	Tue, 09 Dec 2025 14:54:25 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSz6d-0000000EQSx-0eOG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 14:54:24 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso43577325e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 06:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765292061; x=1765896861; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I77rqlgPE4VEYTyOhE8C9IAUeqfQbxcz2xaE/KeMMmY=;
        b=qoVz0/LyW2RiY7b7eGB979EyRuGq5s9iHi0UYDYS0QviAnBuSVLtPSAmCcj3BaAXxD
         2vMtIS4MmYiblRh9n6zYkTGEzghZMGy6zXfrvcLTLCTiBW1RFYJYade4SBe7ebBFeyf7
         6/0hzUjnqhGW9Np5hYYbsqfYEgBYzWYtAapj3CIsS00OCgJghg9dHLL8s0Tg1qoe9BAy
         MzNx3AwtmwyREsw0rAA4oVRs4bgGKna6DH5CN6nRK4jl8E/cvuuTeJXv+z4LkVdliOk2
         ruatQ7AhRldv3Mr8jgutXaiD9tu3O+BhLhOHipqWF1HWNoVg7O+aXjNInnMTRNqb6ell
         YusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765292061; x=1765896861;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I77rqlgPE4VEYTyOhE8C9IAUeqfQbxcz2xaE/KeMMmY=;
        b=NZxHBPw2o6IW8zcuLcsXnZ0EByLojWnj9BBAKkCDSJXdbvvM6vwlMleKHxE3JkZQas
         x7xUubRUR986TBXNMOM0CQ/CYi/q6BSSO23PxKpO051yvwQAREhc0M1jP7CV/+IrfiTF
         0mBEnOEeZ4sgIFElStscMVeUkwXscgU+V0JAMgKD3rr9iacpRDJge5IbJb+7TikyZXwH
         GkO7ffkYtnAzNGvPBYKWY/Q3APPtawTyQ7cuBKbZbNFJCexebgI+uZirjB2DeQ93mt6j
         yrUTw0trrkk2gy4oqwl2qjiCFlFtI0BnSXn38/xDTrxZgRti2QjFkN9WGsEt4UUSEdXP
         /gNQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+SzH7SE8+f0L69Q9o9l+MAAEGATA7qhInstQNUJJKpBQXuaRklS0hV2v/emnnLB0uD9EO/rNPY9lWIjAGbszB@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+n7yDbv3TbSPuWVfcdpmQYQkwft1GR1Fl8DSHgcm4+4E4LaP0
	zZbBWijKu7cowUVzglQ07o/6oKRJHXcoZpnwCqkIW175kw/2FTLjadc1ncTU4ihyujA=
X-Gm-Gg: AY/fxX4O0yfnLo3fh0EQTx0y9QCKfnT/4DCIenmjom6WGhFAvGS73j4M4RpRUDcTaZy
	Ps1uBTocbMH5do3ntwNBqTwNRKvivlRbOqpyZuqNWPRJLyFwngUxd8zrf3Y1HAJEfc5F0cw/YVR
	OwDlGrAQwOKetPk8GswhLKNgQ74dKYaRGqaqpPNb1sOR91Ct6sqCxlRzKUYKgGloy9GoRQY7/NV
	O6j3fdtLRdJ8NeIZkpo+IT0TTptjFRPmBB7NyiYZh2bAfATgb8aOfV12YK/inUXK2Z1mNlguG4/
	vdRPNeUiJJI3mUQXdo/vXUKHj2DIrvrBWcxd3LUcY9SSb3e8TI82EGBzjbS8GVRQaLGKhcJk0KQ
	KFwtaom0uZ8/KO7LT0/WferO2lu6x6w2fTUX6aW4LJJERiCXKQeRDKvutI1h18NRbK/a19WnWav
	niFggb8ePdmsNqZnmA
X-Google-Smtp-Source: AGHT+IG4v9UP6u54PQph65mR9oenZhjMF6WsEAAW8pYbnWdPqIyPTf06tVvcbxXr0zMULbQ5hddMqg==
X-Received: by 2002:a05:6000:2284:b0:42b:2e1c:6341 with SMTP id ffacd0b85a97d-42f89f0ab32mr12255937f8f.9.1765292060866;
        Tue, 09 Dec 2025 06:54:20 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbff352sm32569419f8f.17.2025.12.09.06.54.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 06:54:20 -0800 (PST)
Message-ID: <5ebf1743-b01c-4664-961c-9e1e2aa7ffce@linaro.org>
Date: Tue, 9 Dec 2025 14:54:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/19] perf: cs-etm: Set watermark for AUX trace
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>
References: <20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com>
 <20251201-trbe_buffer_refactor_v1-1-v1-19-7da32b076b28@arm.com>
 <c22b084b-3853-405d-8b43-397786af7be9@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <c22b084b-3853-405d-8b43-397786af7be9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_065423_221239_1F4B7454 
X-CRM114-Status: GOOD (  21.94  )
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



On 05/12/2025 4:48 am, Anshuman Khandual wrote:
> On 01/12/25 4:52 PM, Leo Yan wrote:
>> The default watermark is half of the total buffer size. In many cases,
>> the tool can not be notified with sufficient free space, especially when
>> profiling with small AUX buffer (e.g., 64KiB).
> 
> Could not smaller AUX buffer be prevented for TRBE instead ?
> 

It's not really about the size of the buffer but where the wakeup points 
are. With only two wakeup points (middle and end) once you pass the 
first one you are immediately into the last chance end section.

Now the driver is writing into the end section, but Perf is still 
reading from the first one. Once the end one fills up, you end up with 
no space left without Perf having a chance to say it's finished reading.

To guarantee free space, there needs to be at least one additional 
section as a buffer zone. Ideally we'd set the wakeup point at thirds so 
there were fewer wakeups and still have one free section, but it might 
not always divide by 3, so 4 is also fine.

The commit message could probably explain it a bit better though.

The reason this is different now is because we want to be able to enable 
wrap mode as much as possible. If you imagine the scenario where a half 
way watermark is hit, you can't enable wrap mode without wrapping into 
Perf's part of the buffer (the beginning) as it's all that's left after 
the second half.

>>> Setting watermark to quarter of the buffer to notifies the tool to read
>> data earlier and prevents the data loss.
>>
>> Signed-off-by: Leo Yan <leo.yan@arm.com>
>> ---
>>   tools/perf/arch/arm/util/cs-etm.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
>> index ea891d12f8f40beebf8dee1d3db71cad701f5666..649b8b0d0f92b4af45fb97db9da3c5ccf24a978b 100644
>> --- a/tools/perf/arch/arm/util/cs-etm.c
>> +++ b/tools/perf/arch/arm/util/cs-etm.c
>> @@ -424,6 +424,13 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
>>   		pr_debug2("%s snapshot size: %zu\n", CORESIGHT_ETM_PMU_NAME,
>>   			  opts->auxtrace_snapshot_size);
>>   
>> +	if (!opts->auxtrace_snapshot_mode && !opts->auxtrace_sample_mode) {
>> +		size_t aw = opts->auxtrace_mmap_pages * (size_t)page_size / 4;
>> +		u32 aux_watermark = aw > UINT_MAX ? UINT_MAX : aw;
>> +
>> +		cs_etm_evsel->core.attr.aux_watermark = aux_watermark;
>> +	}
>> +
>>   	/*
>>   	 * To obtain the auxtrace buffer file descriptor, the auxtrace
>>   	 * event must come first.
>>
> 


