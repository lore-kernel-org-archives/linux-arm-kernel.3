Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16782D10F5D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 15:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v6OgNIakmq/dMbgcCgQqjaI96XbvPUGh0ExL/DxZVZY=; b=XH/DWQYkRnpmsE1TpTid5SVnFv
	T3rNL84m9dhOEuk1V+r3yiCjdwm46Lyj/1xZYSQhhGoChjc8RrB9zTxLhxYoJueTmVJMw4lV1QK++
	iNKhMIqKTvK7kbGmK5S2mCEVgpb0ojbA3JR6ctav+0SWbwjpsfwGwZOsJNGLGFgV+KdU2R1PRPKsp
	Umw0m8c+IEBSL6rlnD6U+1j+zK32pKu2hUa4zJkZn9o/F4+eyjAKvojtWWqZdE6Awrc+RfaDY49jV
	gXDEQEnZJeskIGr/vbuV1m8eyhCIqHKtuLfJMm0RsyZfxAmzc+lMrZuPE5xgbOBpedtcFd0c/cnfR
	L6OJzq1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOH7u-0000000F9uk-3PpF;
	Wed, 26 Nov 2025 15:08:14 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOH7s-0000000F9uK-2b1I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 15:08:14 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-42b3377aaf2so3994116f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 07:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764169690; x=1764774490; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v6OgNIakmq/dMbgcCgQqjaI96XbvPUGh0ExL/DxZVZY=;
        b=CUm6J8bl6Kns+UxrdcZG3+dreTKeT/johVh/0K3tAmyYWoLpKAPdMDr+LvRBjwc/WK
         1hGNiFNQydZNeVIcVfTxD7niIdA1JNo6khKj63Aw37XGlKYylhdRQBxBT78sYYerfEXh
         RWysXSorQXTqUcTyex+f/UimTQkabBcEqBUwGZKSYHphFPzaxzuzr329AHjHPpMDBNU7
         AjIcCqOAwvOwrq/NE/o82nANwLRkvalQ9u+1W01MbdD0C8QaCaB4nFPrrMlD6+X3UQ4J
         o760gIupxk4w+g1gTtvFkreV3yPJG6u3nNwbfB5pMk6oIU1YzpVuf7QyS55X49uZ1W0A
         2GNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764169690; x=1764774490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v6OgNIakmq/dMbgcCgQqjaI96XbvPUGh0ExL/DxZVZY=;
        b=rrRlf6sMFp4WXZqyNzJZCKMyUJB6g6C0oTp78gQL5+heVcWVdbtqiUEyyFXiZmOaSc
         MtCpZRuV3RWNkAX9IyqMmDV4/tuYo9T6ARJ/AyCp6l4Zs7UKrO9fNtnI20Zf5bSZAVu9
         gxOJuoKVIoVm4bmForfE4WQkuEuYCHJTEs0dLcvwg/SmWbgV9glVvMTv2KTZTkNiVIqs
         TiJZJJuOdy86Auuc55ThMKBjjiIzDQb9NVdpdnaWQKqeUbUaSZFzQ3nqYHkyxuyWGtLa
         ia0pZb8/gRHGtA4quR+aATWN7s49Jdy3A1Gj01Ktgmcr6pwOicovJCKiztqFH5cFabz0
         lslQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDucikLkJ+FHoczYI0Q7jVeCSvrM6bDoZHwnJxVzzj8Q8lfRLMHqyE4/Jsu+FcCdO9z0QpX7U2QlGPsFS8S+Ju@lists.infradead.org
X-Gm-Message-State: AOJu0YzljVyEbMz5ynfsc48YuKJvAE7PiQp1BDdDf8XzRXxqLr6HVoN8
	HqyPQxWSUjdxuMIWOxtuiq3mD1B9Us4e/o7XsgOI0k+73DG0QUT/awa4sNPCX2Tjkz0=
X-Gm-Gg: ASbGnct9oFDS13YYmJ3AsA99ta+Jhwtxz7IvfDKIgzqDBM26Ufj8cUZ/E5gLjUaZtUr
	6WPlhNkIUMsPZwuRAfOsSZibeolkXzW3gC860K3UzVEfJ6S6Wr7G9fkM86FlBEmWIIkdRPYmCOp
	ybcTjqX9OdzWw3sJqZK47QGs5zhPWY0uqPMeiMWNqYbZxOobg+gsJXHnuUlV8gkInwVZWL1rVtv
	IMK3WMHkHMyPvVcAuTOoX8S3hvo0wSB/sOofljyBxW30qxtl8vX/50BXFpyf9X9J2t43ORwPqNk
	PIZw5NBM0T9Nx7zh3iLgFx86YFdYJN3s5xJcWTjg33O2+j5CedNji9Oled9jUcaPku46jGRGsoI
	oqAPJ2gKw6VOdlb1jKGi5YlBzyPeP2dSZYzy5H24yutcPl97HvTbLqzxiVK2JEe5sXkhScSCrTc
	EEywczVYV4cZuHR5S7
X-Google-Smtp-Source: AGHT+IGrnn1L8KSzGAh7XbvH79/rG6fnYHAK9B7UFvN5X3Uprgh7HyajfkfIB/lPSY0JEyfTs23H3Q==
X-Received: by 2002:a05:6000:40dc:b0:429:66bf:1475 with SMTP id ffacd0b85a97d-42cc1ac9d4dmr21082742f8f.3.1764169689695;
        Wed, 26 Nov 2025 07:08:09 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa35b7sm41986590f8f.20.2025.11.26.07.08.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 07:08:09 -0800 (PST)
Message-ID: <5096f4ba-913a-477f-bfe7-f2a6bb563d30@linaro.org>
Date: Wed, 26 Nov 2025 15:08:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 13/13] coresight: docs: Document etm4x timestamp
 interval option
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
 <20251126-james-cs-syncfreq-v7-13-7fae5e0e5e16@linaro.org>
 <20251126140154.GK724103@e132581.arm.com>
 <CAJ9a7VgcAiw_h=OTxOK0Vcv=9WFCbdb-+RzDKYhigZZhepM7xg@mail.gmail.com>
 <20251126144437.GL724103@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251126144437.GL724103@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_070812_836860_7FA4BDE1 
X-CRM114-Status: GOOD (  29.16  )
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



On 26/11/2025 2:44 pm, Leo Yan wrote:
> On Wed, Nov 26, 2025 at 02:20:14PM +0000, Mike Leach wrote:
> 
> [...]
> 
>>>>      * - timestamp
>>>> -     - Session local version of the system wide setting: :ref:`ETMv4_MODE_TIMESTAMP
>>>> -       <coresight-timestamp>`
>>>> +     - Controls generation and interval of timestamps.
>>>> +
>>>> +       0 = off, 1 = minimum interval .. 15 = maximum interval.
>>>> +
>>>> +       Values 1 - 14 use a counter that decrements every cycle to generate a
>>>> +       timestamp on underflow. The reload value for the counter is 2 ^ (interval
>>>> +       - 1). If the value is 1 then the reload value is 1, if the value is 11
>>>> +       then the reload value is 1024 etc.
>>>> +
>>>> +       Setting the maximum interval (15) will disable the counter generated
>>>> +       timestamps, freeing the counter resource, leaving only ones emitted when
>>>> +       a SYNC packet is generated. The sync interval is controlled with
>>>> +       TRCSYNCPR.PERIOD which is every 4096 bytes of trace by default.
>>>> +
>>
>> What is the default value?
> 
>  From driver's pespective, the default value is 0 (disabled).  We do
> set default values in perf:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/perf/arch/arm/util/cs-etm.c#n444
> 
> IIUC, the default value would be the same with or without this series.
> 
>> As far as I recall when this command line parameter was a bool then:
>> perf -e cs_etm/timestamp/ <program>
>> is sufficient to turn on timestamping.
> 
> Hmm... with the latest perf, we must assign value to `timestamp`,
> otherwise perf will report error:
> 
>    # /mnt/build/perf record -e cs_etm/timestamp/ -C 0 -- taskset -c 0 ls
>    event syntax error: 'cs_etm/timestamp/'
>                         \___ Bad event or PMU
>    
>    Unable to find PMU or event on a PMU of 'cs_etm'
>    
>    event syntax error: 'cs_etm/timestamp/'
>                         \___ no value assigned for term
>    
>    event syntax error: 'cs_etm/timestamp/'
>                         \___ no value assigned for term
>    Run 'perf list' for a list of valid events
>    
> 

That's unfortunate and not what I expected. And I don't think it makes 
sense to remove that validation from Perf. The test uses "timestamp=1" 
so I didn't notice.

Can we accept that people are most likely using the defaults so 
timestamps are already on and they wouldn't be using it? The only real 
use case of that at the moment is to do timestamp=0 and that doesn't fail.

Although it's not the default for per-thread mode and I did find the 
OpenCSD HOWTO.md uses it as an example. timestamps make less sense in 
per-thread mode as you don't need to correlate between CPUs or watch for 
context switches.

I suppose we need to choose what's worse, breaking some subset of Perf 
commands in a slightly annoying way or having two separate options to 
control timestamps that you have to use together. I think it's 50/50, 
maybe with the breakage being the slightly better option.


>> This is worth mentioning so users can correctly assess what happens
>> for any existing scripts they might have.
>>
>> Based on this then the same command must set the timestamp to 1 -
>> which will have the same effect as before as we do not want to break
>> existing behaviour.
>>
>> Mike
>>
>>
>>>>      * - cc_threshold
>>>>        - Cycle count threshold value. If nothing is provided here or the provided value is 0, then the
>>>>          default value i.e 0x100 will be used. If provided value is less than minimum cycles threshold
>>>>
>>>> --
>>>> 2.34.1
>>>>
>>
>>
>>
>> -- 
>> Mike Leach
>> Principal Engineer, ARM Ltd.
>> Manchester Design Centre. UK


