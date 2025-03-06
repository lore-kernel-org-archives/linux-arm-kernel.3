Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D0CC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 11:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ofY78JZG9a7Zw2VcIzlPFwS8jqgg0FQDKx4xLhmMzzU=; b=hdq/xaizQOIZ24gM0+oVBQAO/O
	Un2cABbLeQLRcExVF7kv58zC9XlYue/xxQdebM2TmOpfU9tuzpxrywgvLCSqKJA79XhVoaNSc0ats
	iljpnYAOEYZ/Nib1/RUyASls027syHna1G/YXzSrOvLqOldwYNXjp91bRbGOYvMZuLFlSApXSmrF/
	6iMMLjJLL79ghRACJb3VTylvU2uQmXAgUy/U3Wa08XPlU9FnP7ZuTBN+SDzcfAEUl3Pg7Hkyv8wTP
	q4YgOdM2bqjzX6zAypIMvdztCg/pahvZzveT8XGfGNKhy68f7F15OL5D4nYF2baBFs9QRqxxR99il
	sfteyZWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9UD-0000000AnLV-1H4y;
	Thu, 06 Mar 2025 11:33:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8QB-0000000Ae7V-2sTg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 10:25:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52B0DFEC;
	Thu,  6 Mar 2025 02:25:53 -0800 (PST)
Received: from [10.57.38.145] (unknown [10.57.38.145])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AC8053F66E;
	Thu,  6 Mar 2025 02:25:38 -0800 (PST)
Message-ID: <c7a142ee-d34f-494a-b4f9-921d739aeb59@arm.com>
Date: Thu, 6 Mar 2025 10:25:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 8/9] coresight-tmc: change tmc_drvdata spinlock's type
 to raw_spinlock_t
Content-Language: en-GB
To: Yeoreum Yun <yeoreum.yun@arm.com>, mike.leach@linaro.org,
 james.clark@linaro.org, alexander.shishkin@linux.intel.com,
 bigeasy@linutronix.de, clrkwllms@kernel.org, rostedt@goodmis.org
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
References: <20250306094800.1082950-1-yeoreum.yun@arm.com>
 <20250306094800.1082950-9-yeoreum.yun@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250306094800.1082950-9-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_022543_810597_DBD0A469 
X-CRM114-Status: GOOD (  11.48  )
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

Hi Levi,

On 06/03/2025 09:47, Yeoreum Yun wrote:
> In coresight-tmc drivers, tmc_drvdata->spinlock can be held
> during __schedule() by perf_event_task_sched_out()/in().
> 
> Since tmc_drvdata->spinlock type is spinlock_t and
> perf_event_task_sched_out()/in() is called after acquiring rq_lock,
> which is raw_spinlock_t (an unsleepable lock),
> this poses an issue in PREEMPT_RT kernel where spinlock_t is sleepable.
> 
> To address this, change type tmc_drvdata->spinlock in coresight-tmc drivers,
> which can be called by perf_event_task_sched_out()/in(),
> from spinlock_t to raw_spinlock_t.
> 
> Reviewed-by: James Clark <james.clark@linaro.org>
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>


Unfortunately, this still doesn't cover the current coresight next 
branch. I get build errors as below :

"[PATCH] coresight-tmc: change tmc_drvdata spinlock's type to" has style 
problems, please review. This is because, we merged the coresight panic
trace support in the coresight next, on 21st Feb.


NOTE: If any of the errors are false positives, please report
       them to the maintainer, see CHECKPATCH in MAINTAINERS.
   CALL    scripts/checksyscalls.sh
   CC [M]  drivers/hwtracing/coresight/coresight-tmc-core.o
   CC [M]  drivers/hwtracing/coresight/coresight-tmc-etf.o
   CC [M]  drivers/hwtracing/coresight/coresight-tmc-etr.o
   CC [M]  drivers/hwtracing/coresight/coresight-catu.o
In file included from ./include/linux/mmzone.h:8,
                  from ./include/linux/gfp.h:7,
                  from ./include/linux/slab.h:16,
                  from ./include/linux/resource_ext.h:11,
                  from ./include/linux/acpi.h:13,
                  from drivers/hwtracing/coresight/coresight-tmc-core.c:7:
drivers/hwtracing/coresight/coresight-tmc-core.c: In function 
‘tmc_crashdata_open’:
drivers/hwtracing/coresight/coresight-tmc-core.c:361:20: error: passing 
argument 1 of ‘spinlock_check’ from incompatible pointer type 
[-Werror=incompatible-pointer-types]
   361 |  spin_lock_irqsave(&drvdata->spinlock, flags);
       |                    ^~~~~~~~~~~~~~~~~~
       |                    |
       |                    raw_spinlock_t * {aka struct raw_spinlock *}
./include/linux/spinlock.h:244:34: note: in definition of macro 
‘raw_spin_lock_irqsave’
   244 |   flags = _raw_spin_lock_irqsave(lock); \
       |                                  ^~~~
drivers/hwtracing/coresight/coresight-tmc-core.c:361:2: note: in 
expansion of macro ‘spin_lock_irqsave’
   361 |  spin_lock_irqsave(&drvdata->spinlock, flags);
       |  ^~~~~~~~~~~~~~~~~
In file included from ./include/linux/mmzone.h:8,
                  from ./include/linux/gfp.h:7,
                  from ./include/linux/slab.h:16,
                  from ./include/linux/resource_ext.h:11,
                  from ./include/linux/acpi.h:13,
                  from drivers/hwtracing/coresight/coresight-tmc-core.c:7:
./include/linux/spinlock.h:324:67: note: expected ‘spinlock_t *’ {aka 
‘struct spinlock *’} but argument is of type ‘raw_spinlock_t *’ {aka 
‘struct raw_spinlock *’}
   324 | static __always_inline raw_spinlock_t 
*spinlock_check(spinlock_t *lock)


Cheers
Suzuki


