Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A0D2E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 14:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HghZUTdW0XXbFLWN1muFrcSsQ1ZihgfgslndjD0QVzU=; b=2GhMre2eFylGVl78LcnHI3Lwy4
	KUApMsb3sdIV9S7yBN/ftSrDRUQLx3NepLTYSqXy8L/w8av0O89D7f0lz9xpxvXTMHVsjIaBzdi4F
	i4R4HMzmSyvT9K0cLD3si9yDBNyG9p+LDFX7yP64IQgSZIKyMjbycJk8+3P0ZupVXLxMwjTStnTBY
	bJZh2WkojjJc+9+wp7KEwzqTkypLVJDIQ4ufDbqwuAnzOQ8UcYewPhA4JBMdOTqoYQlyjgY8P30Jf
	tkvKtJqkHEdIENOx6mfpxgCt34L1YM+eRmrapzssU03BKZduayObHUwPnV6KcwO1vDyVWnx8f+d5A
	UMJj1nog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvCq-0000000GsS3-0lDy;
	Wed, 18 Dec 2024 14:39:20 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvBj-0000000GsDy-1wQh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 14:38:13 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43623f0c574so46405425e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 06:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734532689; x=1735137489; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HghZUTdW0XXbFLWN1muFrcSsQ1ZihgfgslndjD0QVzU=;
        b=XJGBGlKlTRhY5odtdp5ledLy38lnMBAvaOuSesptlbEvS5ljajuxaYdlhNuUnQuMz3
         K2p8H3mwYa1S2tEdw+LJlqkEZIUlFUJ0QmZJgsG4nObu/UE78ZuKd1GYoZEHrZ31gJgr
         H/4Q8h+3dNwqSxIo+IkdLa43cjim62/FBQoJ8CR7eyDIMHpor/C9kTkWYSl08uD9K5dM
         mQQZrgiBdyhUgKnkzsvwYnW5iNIUWtIYk+oVJDhoMMnAhkxANYhE64zCSDa+2DezbjaJ
         JNWSRoe6HliN3Lk8kS0cgWlsXohHEkO15bNbs4W6DuJd9vXqSMC7yYu8nFgpmw/tPecr
         2HPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734532689; x=1735137489;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HghZUTdW0XXbFLWN1muFrcSsQ1ZihgfgslndjD0QVzU=;
        b=FxlJpnqc89Cx+lr26p9yGuez7yMCQe8jL/AzkRfGucglu2tWYR+d8hjCTHswhDq/71
         gKqlruTBdoZqpLtlGEmsefJURcBrklXe+SScrMDOEoYgC/vJkgUR1ynKRuT9cSOjuPlo
         23ryIkvLrt0OklaqG7gy28MCykzsoodHz/RFmYMyOWUHufqd3mimv5erro9u126bRrWI
         AKHNaAm+o5eMTSGZTyNaXv1x7FX9JZwr75AUx2sqRJQlXEN1QQa7ZhZ9xpSj6W7Lz3Cc
         jwK569jc4Jsq5mOb+uqOSdMOSuHiPTava3auA95JfRlPfHonD/1+8tPoSngyLPV2vFaI
         8s9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWexBosNH/ci2nKzG0Re2u9MJsD5f77770UAGOsJg5wLbylekH7V1FCP/ZyTDRVQpLVIo1QpxKr+A6gaWDmp3Yz@lists.infradead.org
X-Gm-Message-State: AOJu0YxrXFqih1leo+mb+qWD3myXDu2fiyw5kqmKfJ/6mS8TJbTK/jKn
	KOjARD9usOwXn56arSd+Xbg2N6LsKCrewDZdK0WluUi2v8hb4VNjuxY1BirrW5o=
X-Gm-Gg: ASbGncsIwzxYXwjIBpuk5Zu1TB8h/2RZxlTlS2teI4gn2Sh5CLl+83EHcQzucDcD9ja
	yTuBLHMPM7gXHxfL0wW0PcAim8G/BwwYBWtPhxheVKcLmaAe5hTyAss9Dmjnqn1FAyBVPVCkGHw
	pyckLZ7/1NOlmYfSoO3kj0DxiZ6DyeUyR38TF2GO9h8q3BvRpkdn6OlrqXPj8uoD5W+iaSYspkR
	7y6L0esGeEno5U8q1SDqL585ug4m+aJSz3ZFyHnGyGte93rjMViVwzfNHknxZkyUco=
X-Google-Smtp-Source: AGHT+IF+yf8lOXI6vWUd8PEcKXkFdISeBDrUKk8fn98+vBPawVSHM5et30l0PCEbj2o6tGQL7Xglig==
X-Received: by 2002:a05:600c:4586:b0:436:1c04:aa9a with SMTP id 5b1f17b1804b1-43655370395mr29857435e9.14.1734532689484;
        Wed, 18 Dec 2024 06:38:09 -0800 (PST)
Received: from [192.168.68.163] ([145.224.66.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c804a34fsm14393947f8f.76.2024.12.18.06.38.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 06:38:08 -0800 (PST)
Message-ID: <7a370fb3-f5eb-4d6a-a42d-b43960efb930@linaro.org>
Date: Wed, 18 Dec 2024 14:38:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] coresight: change some driver' spinlock type to
 raw_spinlock_t
To: Mike Leach <mike.leach@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>
Cc: suzuki.poulose@arm.com, alexander.shishkin@linux.intel.com,
 bigeasy@linutronix.de, clrkwllms@kernel.org, rostedt@goodmis.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, nd@arm.com
References: <20241203114942.697188-1-yeoreum.yun@arm.com>
 <CAJ9a7Vis9vcdJOzu9tvNQ4eAacmXkbhbZBaRYd1acOrd8G-ZUQ@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAJ9a7Vis9vcdJOzu9tvNQ4eAacmXkbhbZBaRYd1acOrd8G-ZUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_063811_519129_934D8674 
X-CRM114-Status: GOOD (  17.25  )
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



On 18/12/2024 1:44 pm, Mike Leach wrote:
> This change seems to omit devices:
> 
> etm3x - which provides support for ETMv3 and PTM, both of which are
> valid trace sources in the cs_etm handling code.
> stm - can be integrated into the kernel STM via configfs providing a
> MIPI source for ftrace.
> 
> Mike
> 

Isn't ETMv3 32 bit only? arm32 is still missing ARCH_SUPPORTS_RT so we 
could technically leave the spinlocks as is. It might be better to 
update them anyway though or add !PREEMPT_RT to 
CONFIG_CORESIGHT_SOURCE_ETM3X.

> On Tue, 3 Dec 2024 at 11:49, Yeoreum Yun <yeoreum.yun@arm.com> wrote:
>>
>> In some coresight drivers, drvdata->spinlock can be held during __schedule()
>> by perf_event_task_sched_out()/in().
>>
>> Since drvdata->spinlock type is spinlock_t and
>> perf_event_task_sched_out()/in() is called after acquiring rq_lock,
>> which is raw_spinlock_t (an unsleepable lock),
>> this poses an issue in PREEMPT_RT kernel where spinlock_t is sleepable.
>>
>> To address this,change type drvdata->spinlock in some coresight drivers,
>> which can be called by perf_event_task_sched_out()/in(),
>> from spinlock_t to raw_spinlock_t.
>>
>> Reviewed-by: James Clark <james.clark@linaro.org>
>>
>> v1 to v2:
>>      - seperate patchsets to change locktype and apply gurad API.
>>
>> Levi Yun (9):
>>    coresight: change coresight_device lock type to raw_spinlock_t
>>    coresight-etm4x: change etmv4_drvdata spinlock type to raw_spinlock_t
>>    coresight: change coresight_trace_id_map's lock type to raw_spinlock_t
>>    coresight-cti: change cti_drvdata spinlock's type to raw_spinlock_t
>>    coresight-etb10: change etb_drvdata spinlock's type to raw_spinlock_t
>>    coresight-funnel: change funnel_drvdata spinlock's type to
>>      raw_spinlock_t
>>    coresight-replicator: change replicator_drvdata spinlock's type to
>>      raw_spinlock_t
>>    coresight-tmc: change tmc_drvdata spinlock's type to raw_spinlock_t
>>    coresight/ultrasoc: change cti_drvdata spinlock's type to
>>      raw_spinlock_t
>>
>>   .../hwtracing/coresight/coresight-config.c    |  21 +-
>>   .../hwtracing/coresight/coresight-config.h    |   2 +-
>>   drivers/hwtracing/coresight/coresight-core.c  |   2 +-
>>   .../hwtracing/coresight/coresight-cti-core.c  |  65 +-
>>   .../hwtracing/coresight/coresight-cti-sysfs.c | 135 +++--
>>   drivers/hwtracing/coresight/coresight-cti.h   |   2 +-
>>   drivers/hwtracing/coresight/coresight-etb10.c |  62 +-
>>   .../coresight/coresight-etm4x-core.c          |  71 ++-
>>   .../coresight/coresight-etm4x-sysfs.c         | 566 +++++++++---------
>>   drivers/hwtracing/coresight/coresight-etm4x.h |   2 +-
>>   .../hwtracing/coresight/coresight-funnel.c    |  34 +-
>>   .../coresight/coresight-replicator.c          |  36 +-
>>   .../hwtracing/coresight/coresight-syscfg.c    |  75 ++-
>>   .../hwtracing/coresight/coresight-tmc-core.c  |   9 +-
>>   .../hwtracing/coresight/coresight-tmc-etf.c   | 195 +++---
>>   .../hwtracing/coresight/coresight-tmc-etr.c   | 199 +++---
>>   drivers/hwtracing/coresight/coresight-tmc.h   |   2 +-
>>   .../hwtracing/coresight/coresight-trace-id.c  |  93 ++-
>>   drivers/hwtracing/coresight/ultrasoc-smb.c    |  12 +-
>>   drivers/hwtracing/coresight/ultrasoc-smb.h    |   2 +-
>>   include/linux/coresight.h                     |   4 +-
>>   21 files changed, 751 insertions(+), 838 deletions(-)
>>
>> --
>> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
>>
> 
> 


