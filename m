Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7ECCD3B7F3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 13:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6x4q7pYt+yBI8IV/ZgaXayi6EhlEVDj7sYbIN6bcwR8=; b=mDp6GPArvwQeefUhFHycv11daj
	S9sbTASN5aeT+OwHJK7mr3P1st+kQsmQ7sEBI5WLxrfrO/XgUGsv1QU9ugnjb2p2d217LVGXBxGZD
	9fiKS6OGsX6WUIZujpg/sRThqD45k7dcHrPap/9rWkx9E7FKm1kDGkesDVw0Ct6K8puxb9vCOeezX
	9Baj3abXxpi4u1OK8NjrWX6niJtVprLzVCp+fkgmJ4bmTp8+CbwPkgmdsMARrXOlAo6p7jasHfvOD
	+0r4lbEbC2fKo46luG7r++ufsgv+AO8UZ5Fz6TDc81WIlHBeEZgoPvqAX9ax8hXFyELOENhCLu4xD
	oqJUsQ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSxbJ-0000000EJMA-0CNv;
	Tue, 09 Dec 2025 13:17:57 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSxbF-0000000EJLk-3Fzx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 13:17:55 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-42e2e40582eso3311829f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 05:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765286272; x=1765891072; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6x4q7pYt+yBI8IV/ZgaXayi6EhlEVDj7sYbIN6bcwR8=;
        b=qNmv3JdO/xO+CJDbP/aRXRNpODgxPCJY9Nkj5EeAtaowpTz6vZ9YQW7hTdWEYS8D7p
         SvVdbYQwGUeZeIfF0e6zpcd1dgRT6T0a8jKmdtbXLK0qyAJwg6RyUE+nHlWfUKRgSuW5
         jSUoQMnPnRr8+fbQYTEBjuJzuXzWfzIXyLOvTkCcn+G6Vt/V5P08uLovG5+2YU3Tipm8
         l+u/p8zJRylysEnytB8dMaOGBzg3G1UIO44WqygU1K8TG+0a/odiOSXUjNSwhvO2iJtH
         PQ5El/H/G0Fg/7e9rLiTCe54WSR7NM5/eZAOqNdR5PkyAg9D+OimJw+wvduL+X79elqm
         yuDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765286272; x=1765891072;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6x4q7pYt+yBI8IV/ZgaXayi6EhlEVDj7sYbIN6bcwR8=;
        b=rhDrWAto8W7OZuCCVjGcLf4ODZtLLUmteSJxm1foPWKqpaSc2/1I5P4Gdgd7EwP1eo
         Bcnx+DuWL/YYgKX4x50cHf75V09ZfqgfkDnUYRyQVlKhPZQhEuEFEwmvKNu7wZJNe7A2
         22MayVABeHWDwfcwK495igMzN7vVq+8L8X7D1R5jwjEZvKZ8XzVlojfST+TaL0ImJ27Y
         qfGxxslIOINeZ9Jc/G1xWZkW5b6lSY9XB4ul7Ip9oAdagUl/3XnNh0RVANm/xbl8Mr83
         4iH0fKTvgqulxYlXS4o37WiXnoKu34kyy0vrnFECVDoJRHaLJonQr9IVzPi6is9JlA71
         ar1w==
X-Forwarded-Encrypted: i=1; AJvYcCWdtGZrKkEFn+WGzPa7ZkzGqrrpOpl49bZQK9/tHiXVNSQZj+1OKNSWWUocEq5XsO23MaNIiiQhurD1PQPGki1i@lists.infradead.org
X-Gm-Message-State: AOJu0YyOOFwV6+y5/jY6G76OTZHIWYPUBMBna8lagY4AQzpodB5/eOU0
	a+IJP5dff6yoYr3Ybl15TcXYKn+gjJ4vYOzO4BJ6xViXUQQ1lvDt0z3x+8kqMo52p74=
X-Gm-Gg: AY/fxX4OGexhuq0O2048Wok/QWkfd/zI8K3eBvD0YyMJBpeeNmBHEN8iss2ACJ9R9Yz
	i8GdwnTgZb5B77qVDPmf9/t2V/+g9twSkVvKr2GYZgufxBM38hLOQutvf2SgM0bLvLEyztwA7EY
	hzkadHEj8agekfzRFDIDJ0FvSBcwCc944GfX+qvLX9uX9fNgeHwBg1wN63qlq+CC8CUApgrweB2
	+ubYaV2ZXejSMlo+6GIQ7BDG4WM4F9JnQt+ss28dnagr6glduJhCUv7nBGM6wdvxTxUtHqhQgOv
	gNyazXUDdCfbCCyr9yvxGUc26K8LpeUFRgidkZvKFq+P0IpauyV316fDg5PURKAmc0brl/apSI+
	GWFgHu9m48M0/mpzAuy7e/AHOBJmfaNdZrKw8PVLCmyGv2xIRITpZLyHiK2EeTRgA5ET+mPUATQ
	g9TiyZoYZzrHHAPi/1
X-Google-Smtp-Source: AGHT+IFkh1qNBfsdlzavryRRrHz55vGlnsqEVl3PW1eyYgIUgYX4YzhkI06ypPZmgVor+ogQtygTpQ==
X-Received: by 2002:a05:6000:2008:b0:42b:3b62:cd86 with SMTP id ffacd0b85a97d-42f89f09474mr10823996f8f.6.1765286271664;
        Tue, 09 Dec 2025 05:17:51 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbfeb38sm31235105f8f.12.2025.12.09.05.17.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 05:17:51 -0800 (PST)
Message-ID: <1c1092e6-aa5d-4bb1-84e5-81151a02cc6f@linaro.org>
Date: Tue, 9 Dec 2025 13:17:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/19] coresight: trbe: Refactor syndrome decoding
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Mike Leach <mike.leach@linaro.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Tamas Petz <tamas.petz@arm.com>,
 Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>
References: <20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com>
 <20251201-trbe_buffer_refactor_v1-1-v1-6-7da32b076b28@arm.com>
 <65c84357-0bda-454f-88c3-623b3ff9d29d@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <65c84357-0bda-454f-88c3-623b3ff9d29d@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_051753_858801_34547276 
X-CRM114-Status: GOOD (  28.57  )
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



On 02/12/2025 11:06 am, Suzuki K Poulose wrote:
> Hi Leo
> 
> A couple of minor nits below. Otherwise looks like a nice cleanup
> 
> 
> On 01/12/2025 11:21, Leo Yan wrote:
>> It gives priority to TRBSR_EL1.EA (external abort); an external abort
>> will immediately bail out and return an error.
>>
>> Next, the syndrome decoding is refactored based on two levels of
>> information: the EC (Event Class) bits and the BSC (Trace Buffer Status
>> Code) bits.
>>
>> If TRBSR_EL1.EC==0b000000, the driver continues parsing TRBSR_EL1.BSC to
>> identify the specific trace buffer event.  Otherwise, any non-zero
>> TRBSR_EL1.EC is treated as an error.
>>
>> For error cases, the driver prints an error string and dumps registers
>> for debugging.
> 
> minor nit: Please avoid describing the code, which cod does well.
> Briefly mention what you are doing, giving any additional contexts
> that may not be evident from the code.
> 
> e.g:
> 
> "Add support for decoding the syndrome for TRBE, providing a verbose
> description of the code for Fatal/unhandled events.
> While at it add the new definitions from the latest Arm ARM for
> EC and BSC"
> 
> 
> 
> 
>>
>> No additional checks are required for wrap mode beyond verifying the
>> TRBSR_EL1.WRAP bit, even on units with overwrite errata, as this bit
> 
> 
>> reliably indicates a buffer wrap.
>>
>> Signed-off-by: Leo Yan <leo.yan@arm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-trbe.c | 60 ++++++++++++++++++ 
>> +++-------
>>   drivers/hwtracing/coresight/coresight-trbe.h |  8 ++--
>>   2 files changed, 51 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/ 
>> hwtracing/coresight/coresight-trbe.c
>> index 
>> 9e565122816949b37b8ff5e4ba04cfbc317c6f25..28e2bfa68074f19ccaa4a737d00af577aea818fe 100644
>> --- a/drivers/hwtracing/coresight/coresight-trbe.c
>> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
>> @@ -643,29 +643,61 @@ static void trbe_enable_hw(struct trbe_buf *buf)
>>   static enum trbe_fault_action trbe_get_fault_act(struct 
>> perf_output_handle *handle,
>>                            u64 trbsr)
>>   {
>> +    const char *err_str;
>>       int ec = get_trbe_ec(trbsr);
>>       int bsc = get_trbe_bsc(trbsr);
>> -    struct trbe_buf *buf = etm_perf_sink_config(handle);
>> -    struct trbe_cpudata *cpudata = buf->cpudata;
>>       WARN_ON(is_trbe_running(trbsr));
>> -    if (is_trbe_trg(trbsr) || is_trbe_abort(trbsr))
>> -        return TRBE_FAULT_ACT_FATAL;
>> -    if ((ec == TRBE_EC_STAGE1_ABORT) || (ec == TRBE_EC_STAGE2_ABORT))
>> -        return TRBE_FAULT_ACT_FATAL;
>> +    if (is_trbe_abort(trbsr)) {
>> +        err_str = "External abort";
>> +        goto out_fatal;
>> +    }
>> -    /*
>> -     * If the trbe is affected by TRBE_WORKAROUND_OVERWRITE_FILL_MODE,
>> -     * it might write data after a WRAP event in the fill mode.
>> -     * Thus the check TRBPTR == TRBBASER will not be honored.
>> -     */
>> -    if ((is_trbe_wrap(trbsr) && (ec == TRBE_EC_OTHERS) && (bsc == 
>> TRBE_BSC_FILLED)) &&
>> -        (trbe_may_overwrite_in_fill_mode(cpudata) ||
>> -         get_trbe_write_pointer() == get_trbe_base_pointer()))
>> +    switch (ec) {
>> +    case TRBE_EC_OTHERS:
>> +        break;
>> +    case TRBE_EC_BUF_MGMT_IMPL:
>> +        err_str = "Unexpected implemented management";
> 
> minor nit: "Unexpected IMPDEF buffer management event"
> 
> 
> Suzuki
> 
>> +        goto out_fatal;
>> +    case TRBE_EC_GP_CHECK_FAULT:
>> +        err_str = "Granule Protection Check fault";
>> +        goto out_fatal;
>> +    case TRBE_EC_STAGE1_ABORT:
>> +        err_str = "Stage 1 data abort";
>> +        goto out_fatal;
>> +    case TRBE_EC_STAGE2_ABORT:
>> +        err_str = "Stage 2 data abort";
>> +        goto out_fatal;
>> +    default:
>> +        err_str = "Unknown error code";
>> +        goto out_fatal;
>> +    }
>> +
>> +    switch (bsc) {
>> +    case TRBE_BSC_NOT_STOPPED:
>> +        break;
>> +    case TRBE_BSC_FILLED:
>> +        break;
>> +    case TRBE_BSC_TRIGGERED:
>> +        err_str = "Unexpected trigger status";
>> +        goto out_fatal;
>> +    default:
>> +        err_str = "Unexpected buffer status code";
>> +        goto out_fatal;
>> +    }
>> +
>> +    if (is_trbe_wrap(trbsr))
>>           return TRBE_FAULT_ACT_WRAP;
>>       return TRBE_FAULT_ACT_SPURIOUS;
>> +
>> +out_fatal:
>> +    pr_err_ratelimited("%s on CPU %d [TRBSR=0x%016llx, 
>> TRBPTR=0x%016llx, TRBLIMITR=0x%016llx]\n",
>> +               err_str, smp_processor_id(), trbsr,
>> +               read_sysreg_s(SYS_TRBPTR_EL1),
>> +               read_sysreg_s(SYS_TRBLIMITR_EL1));

Don't you need to use %p to not leak pointers?

>> +    return TRBE_FAULT_ACT_FATAL;
>>   }
>>   static unsigned long trbe_get_trace_size(struct perf_output_handle 
>> *handle,
>> diff --git a/drivers/hwtracing/coresight/coresight-trbe.h b/drivers/ 
>> hwtracing/coresight/coresight-trbe.h
>> index 
>> 45202c48accec7c86ba56130e2737bc2d1830fae..d7f7cd763c0c7139cf322b7336ee563073e3bea0 100644
>> --- a/drivers/hwtracing/coresight/coresight-trbe.h
>> +++ b/drivers/hwtracing/coresight/coresight-trbe.h
>> @@ -35,9 +35,11 @@ static inline bool is_trbe_enabled(void)
>>       return trblimitr & TRBLIMITR_EL1_E;
>>   }
>> -#define TRBE_EC_OTHERS        0
>> -#define TRBE_EC_STAGE1_ABORT    36
>> -#define TRBE_EC_STAGE2_ABORT    37
>> +#define TRBE_EC_OTHERS            0x0
>> +#define TRBE_EC_GP_CHECK_FAULT        0X1e
>> +#define TRBE_EC_BUF_MGMT_IMPL        0x1f
>> +#define TRBE_EC_STAGE1_ABORT        0x24
>> +#define TRBE_EC_STAGE2_ABORT        0x25

I know some were already defined here, but this should probably be an 
enum in sysreg.

>>   static inline int get_trbe_ec(u64 trbsr)
>>   {
>>
> 


