Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00DFD6ACF6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 16:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fW8xExxeIKpIvS1coftBu84q3jUSvnzFCGKxsDAIRY4=; b=cqV/CJl+QCS5xFkA9PBrnP0qhC
	vBdM2kq2kezMwaacqmBPSXq56MNaYp8ftSCZHquIcFexuzvUdtknMgA6jRWctng6N5oK3nC8Vp4eU
	xJSkyd6ZjV2YuD3xbLL4KsWmZiFn+e3HQw1fdiwpOuSfIkDi9tuCPnyDRegEgf0qylacn8obL2Mbg
	uM+0WDfhC17P5AFNlaZ+LcMV95DEMj0RS3GKoW7H8w49tG9TZAgUbX1hl1x4XxqupRvdjLNU/8RGG
	HDF4GmjUw7RpzBytLDO8xom6HhIHDidTrHbKfUdjHuzxl5DLh2R5ZqkHELiUv3eFp3Rz689rBfFha
	xnIt6OHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGLK2-0000000DhJy-3hhm;
	Wed, 27 Nov 2024 16:55:26 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGL9q-0000000DfJn-1Iwb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 16:44:56 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-53df1e0641fso874565e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 08:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732725893; x=1733330693; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fW8xExxeIKpIvS1coftBu84q3jUSvnzFCGKxsDAIRY4=;
        b=wCtroYenJL4nuCjDQxgaS07uBDEEfDflh9H4xfCYcpmrtnp4+yMpFinG6GFE3MNSXr
         CnDd7ZoTCcIueFRfJ/HqJT7b9btBhgAuW/braIcL5WFg224JVCov2M14MLVpf+XARpTJ
         MKlVC/LipsWEd2pi9/cQqZi+ij5WfZepHFndIps7Sqy4VpiHprC3F3rw714vBK6DV9wh
         Ew+/PQPra/q7JwHzEHYoHNPeH7LYhRoaFzLmKPuBtN+VJtOYweykCUCh286h3uC5oD2z
         53T4n0Ev8CgOhRVb/1vU7TiHu/HDxFb+1Hw0Q0g+FzuxhBuiLPSs52dCNyRkvqcy4Tvj
         EghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732725893; x=1733330693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fW8xExxeIKpIvS1coftBu84q3jUSvnzFCGKxsDAIRY4=;
        b=KI83rHhD2A/gIuW88PPb8aJqwRuU/XGLTtUgK+xL5gmm8eSSpgIQClIotmqnb6Mx5T
         qjdsXlYezzyQsoTXq7R6n4ROayRwDIjb9YqmGgJJXzbJeM5q1TnQO+78kj41B5Z4wZwD
         ePDHjizkufZDxNfERITr87+LNDJmZ1zWAmhzgGV9tTjZrLqdrIfqtcMFRJVKoJO6w56b
         eP6oKbwZLMzdiRrH7sHoIG4SFcQKxCIxmRvlPGunLTDBdsDz1YS+kArF+2AHfv3clx8h
         1PAqGrSUpH0wf3Zs3I9dMHJvxf2P3cV8BnmUerO6ztLpzlj4WDkiGYhpG5FeXqALwXZk
         WO4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWNDqGQrr67ipMPzXuArt473BPoVSkrd9NDvCgSIxc8zhxetq1vVBLwP1EFYqW9qwRsv3DRqEPXOzUzEF6QIKfw@lists.infradead.org
X-Gm-Message-State: AOJu0YyWLHeNAfHHSjZ50Q36cGwKH8O81sy2K6BRhYyK/ZeS9kyG1VCx
	RxGEdxGI8XbfAlM6OpwXGpz8VLCg+GD5uD+Rscgbml2BHoI5jF7YOnQpWrSRJ3eI59IzoI/3eS9
	44Ks=
X-Gm-Gg: ASbGncsGsdtatK9xuk324+P7pwkNwt+gdiEsOq44tCrnWzB5EBoBj3YqmBOyLTZpMcb
	Ntn2ZjwECmwbL05axd5NB2qvlWIUVNd3IJghtut6LH/kzCiTIABbG6q4YFegvLBMl2RQeYz/iod
	02ZiD0S3REK5iPs8rZWx8fOC8Cp71kV5ZTGWt+XZP7vSDDDhHF87j1pZ62JaWidtHEz7PvDyTcB
	VGn7Mrbcy83BLlp07epHp7lguRqvhbt2UQQod2A8RQaNHW/7Sg1+hi07GY/
X-Google-Smtp-Source: AGHT+IESX0M/mKeeOPEaJAvih6k+WhOExY781wFMg2q0kk+FhBaoTszX5Z/64SQGu7rfW5ScvTae1A==
X-Received: by 2002:a05:6512:2355:b0:53d:e5fd:a445 with SMTP id 2adb3069b0e04-53df00dd3ddmr2625559e87.32.1732725892585;
        Wed, 27 Nov 2024 08:44:52 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.200])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa53a146fd0sm538629966b.143.2024.11.27.08.44.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 08:44:52 -0800 (PST)
Message-ID: <22ef761d-7a9c-46a2-8d61-3d16c2188c0c@linaro.org>
Date: Wed, 27 Nov 2024 16:44:50 +0000
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
X-CRM114-CacheID: sfid-20241127_084454_366993_CEA395A3 
X-CRM114-Status: GOOD (  16.49  )
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

Reviewed-by: James Clark <james.clark@linaro.org>

Somewhat related to this change, but not something that needs to be done 
now:

All of the spinlocks for the syfs store/read functions don't need to be 
raw spinlocks, or spinlocks at all. They're never called from the 
scheduling code and can be locked by coresight_mutex instead. 
coresight_mutex is held on the sysfs enable/disable path when those 
values are actually used.

Same point as here: 
https://lore.kernel.org/linux-arm-kernel/9a637e74-d81d-405c-bad0-c97ec1aa4b77@linaro.org/

Probably needs a review of which values in each device might be shared 
between perf mode and sysfs mode when they shouldn't be, as there was 
one in the link above.

I thought the only thing shared between sysfs and perf should be the 
'mode' which is taken with a compare and swap without locking anyway.


