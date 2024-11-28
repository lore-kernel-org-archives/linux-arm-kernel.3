Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4471D690F9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 10:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sqpsi2rhTNaEAfBxryPApXcrOr2+7ywjD7Fk+1YK40o=; b=T8DJ8cycdRfNfSJk0QwmKtXwRG
	ioO5eMY7/QrWSq40fBfTWs4JtlY4MaVf03LAGV/spZVsNJAo9gipRsfZSvP1B15TNeqLEVqVwXGFT
	VbUmtohe/ZtArKLr0dpmKQ228sBorRhOU+oSuObarCv2TiMqmwlmvuu9864R+jggkYR1QC8bO3xHR
	Kiz1+8gYjvWZSCMPjfdvyEIgc5es+c1BrWNF1l8p8KmZcQi+wScMhxk4IPY9RTdL0gGY9t3ucGuRu
	dokbFUvaEzysMNNZPTHCwHMf8K8xlwSSG0uJjKiGzxlCGa6Vxr+EGbCLwMX950XdSyDf3mQh87e3l
	nXJThJmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGcCm-0000000FJCG-2rP8;
	Thu, 28 Nov 2024 10:57:04 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGcBn-0000000FJ14-2DYh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 10:56:04 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5cfa9979cd1so473341a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 02:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732791361; x=1733396161; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sqpsi2rhTNaEAfBxryPApXcrOr2+7ywjD7Fk+1YK40o=;
        b=O5Ts2Ec2gkRYleLS5oERVk3tyhWew6ExoF5WgMPcKP24DXjC+Xq4Zgqm1W9oy2Kygn
         7fI4wCnljwVwIyf6lQEq9g0e2XOk6Qz+Uap53uiU65w38pLmxa+tfRvvFOAdxHXHAR9e
         r9N2zxeqSV8JoUUwJbJgjtQgsAqsbb6tui03BuavGJcf8bNyayw5rq+UlwSVzH+k9pYQ
         XRaWhuNNTaS9PG507JM4/SLrhXYBtQfm/SwWjZWLd9h13pueHdNdX3so0zf/KVioBn/R
         aH7dB/BJ+R/Esjcm9FfeJTYseMIvzcsqKzavMdOCSIyU+w3Ju8wOstPOcId2bH8CHCtM
         vy5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732791361; x=1733396161;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sqpsi2rhTNaEAfBxryPApXcrOr2+7ywjD7Fk+1YK40o=;
        b=dY0Ww5pI3TgRKTldH0lgHs9R+blKRztrEQ1azyWlHWs2UN6lka6Fc0WNyHdpwkzhMR
         h2fsGBFP24S38vWmc688CqvEFx1bh8rmuw04mwyX5XFbjn8ejoTHuHkLk1qe1O5mfweV
         UYTQBwN7DzsELqeeuQn9MMrBP0O6owdvXCdAOOuRWyI207ETBghAO8BJ/9YLdZY8MAtO
         kiQIXPTlZ73aYIYFxfLey/iqriyCCWbjs44EH98360pqqBZOD7ddExlgn1cahvSfZuBb
         zjYoTeKRFlY4NG5/FNxsH6jiSK2e7fVJnMDcoUygk6ViCTXvWwllPUOZZYO0+Q7M3a54
         YFuA==
X-Forwarded-Encrypted: i=1; AJvYcCWYmgRTWeiTSTnT0Y0BIQDrc4qNZLn9EcCq+LA2j8r7uvM08dsGbVA0Uf7HRtAffWoL2nP4xQGlQ0APaHvBS3E8@lists.infradead.org
X-Gm-Message-State: AOJu0YwVToTNF7XZJQMKB0NckrpPayDxw5S+dm3maCaCnq4Ro2lIcc8N
	5wVD/6azVoVXrupOLb2VJ25ibQqeGSjtaFotpGZYd3bxukoDc+xzU/uu6bFAEM4=
X-Gm-Gg: ASbGncvHTBHW8nXutrRCQOOjERF+aDM9uyb6cDb2+VhVNb3ziGfGaBugtRyLzg4R8Bm
	Ec3CAtJz9i+iTsPZcofLKW7BkrRtHjABb+YZfRnLsE4CUIYnoN9xpVuEI85v9oQTbZZ4X8FAXq2
	kXZDqiJbCLNRQ5V0eNTuWY3C5L1DchQWJjS5CRAYrO9YJre7LnNG+kTABu0gCCpgiAJBH//aaL6
	kh+mLdDgb/8brt8rvCAbWoBfs77mgX7zUGWrS7SP/BapjJQfboupLjIKJR0
X-Google-Smtp-Source: AGHT+IEnjxh9ZBhFyGvzawlD+/dtL6pKTEdS19cAB25msc9FJ2UvOItsJK1YudpESRUS0TPKtq58ow==
X-Received: by 2002:a05:6402:510b:b0:5d0:96db:dd96 with SMTP id 4fb4d7f45d1cf-5d096dbe865mr1728463a12.0.1732791361409;
        Thu, 28 Nov 2024 02:56:01 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.200])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d097e8dcfasm626237a12.67.2024.11.28.02.55.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 02:56:00 -0800 (PST)
Message-ID: <6468302c-f1f1-4edb-a6b6-ca248944cbbf@linaro.org>
Date: Thu, 28 Nov 2024 10:55:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] coresight: change some driver' spinlock type to
 raw_spinlock_t
To: Yeoreum Yun <yeoreum.yun@arm.com>, suzuki.poulose@arm.com,
 mike.leach@linaro.org
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, nd@arm.com,
 alexander.shishkin@linux.intel.com, bigeasy@linutronix.de,
 clrkwllms@kernel.org, rostedt@goodmis.org
References: <20241125094816.365472-1-yeoreum.yun@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20241125094816.365472-1-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_025603_574554_B7A8EF2F 
X-CRM114-Status: GOOD (  14.08  )
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



On 25/11/2024 9:48 am, Yeoreum Yun wrote:
> In some coresight drivers, drvdata->spinlock can be held during __schedule()
> by perf_event_task_sched_out()/in().
> 
> Since drvdata->spinlock type is spinlock_t and
> perf_event_task_sched_out()/in() is called after acquiring rq_lock,
> which is raw_spinlock_t (an unsleepable lock),
> this poses an issue in PREEMPT_RT kernel where spinlock_t is sleepable.
> 
> To address this,change type drvdata->spinlock in some coresight drivers,
> which can be called by perf_event_task_sched_out()/in(),
> from spinlock_t to raw_spinlock_t.
> 
> Levi Yun (9):
>    coresight: change coresight_device lock type to raw_spinlock_t
>    coresight-etm4x: change etmv4_drvdata spinlock type to raw_spinlock_t
>    coresight: change coresight_trace_id_map's lock type to raw_spinlock_t
>    coresight-cti: change cti_drvdata spinlock's type to raw_spinlock_t
>    coresight-etb10: change etb_drvdata spinlock's type to raw_spinlock_t
>    coresight-funnel: change funnel_drvdata spinlock's type to
>      raw_spinlock_t
>    coresight-replicator: change replicator_drvdata spinlock's type to
>      raw_spinlock_t
>    coresight-tmc: change tmc_drvdata spinlock's type to raw_spinlock_t
>    coresight/ultrasoc: change cti_drvdata spinlock's type to
>      raw_spinlock_t
> 
>   .../hwtracing/coresight/coresight-config.c    |  21 +-
>   .../hwtracing/coresight/coresight-config.h    |   2 +-
>   drivers/hwtracing/coresight/coresight-core.c  |   2 +-
>   .../hwtracing/coresight/coresight-cti-core.c  |  65 +-
>   .../hwtracing/coresight/coresight-cti-sysfs.c | 135 +++--
>   drivers/hwtracing/coresight/coresight-cti.h   |   2 +-
>   drivers/hwtracing/coresight/coresight-etb10.c |  62 +-
>   .../coresight/coresight-etm4x-core.c          |  71 ++-
>   .../coresight/coresight-etm4x-sysfs.c         | 566 +++++++++---------
>   drivers/hwtracing/coresight/coresight-etm4x.h |   2 +-
>   .../hwtracing/coresight/coresight-funnel.c    |  34 +-
>   .../coresight/coresight-replicator.c          |  36 +-
>   .../hwtracing/coresight/coresight-syscfg.c    |  75 ++-
>   .../hwtracing/coresight/coresight-tmc-core.c  |   9 +-
>   .../hwtracing/coresight/coresight-tmc-etf.c   | 195 +++---
>   .../hwtracing/coresight/coresight-tmc-etr.c   | 199 +++---
>   drivers/hwtracing/coresight/coresight-tmc.h   |   2 +-
>   .../hwtracing/coresight/coresight-trace-id.c  |  93 ++-
>   drivers/hwtracing/coresight/ultrasoc-smb.c    |  12 +-
>   drivers/hwtracing/coresight/ultrasoc-smb.h    |   2 +-
>   include/linux/coresight.h                     |   4 +-
>   21 files changed, 751 insertions(+), 838 deletions(-)
> 
> --
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
> 

Can TPIU be used as a sink with Perf? If so that one is missing the update.

Makes me wonder if something like a "perf_component" flag in 
coresight_device or a #define would make sense. Then the lock type gets 
auto picked. Seems like in a few years we will have completely forgotten 
why some of the coresight locks are raw and others aren't.


