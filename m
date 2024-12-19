Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB7FE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 12:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+G4RnOipPGTEyD7q6bqMNwoiHSF6nKA2Oy+mNN0MiQ=; b=2J1plfzkPDphiC3lEcUvNT6NpT
	XIreoj4bQzdEqtgN62/bB6Rxbuwe23KdRiT9UAt2A9ypHVKh6jE3Ev9Prgw6l25qqlKBTF6p8aePk
	e1oKxwBqKlU3ywXbjRqlVyJWUYspHvCZd3gerxRAABTptfgUrLWjGi1yYt/KEnexrGIA5bFP/A2Si
	N6p7w3auAG5R4t9PW1jOqGx3XaByjcxLzwsypL/qha1Rc+cgpR4yWoGHmet9snOYPCuPEE6zUbo37
	OL0UBvPoXlMkaFfR9H56fxH9Ws1Lwv6vq3fNwQJm1fAWk/UO0y0IY26QC6zki8+E5nbPryYkVol7T
	W7lxA+SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFle-00000001p2R-38N7;
	Thu, 19 Dec 2024 12:36:38 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFdH-00000001n2B-1DC2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 12:28:00 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2156e078563so6252005ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 04:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734611278; x=1735216078; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g+G4RnOipPGTEyD7q6bqMNwoiHSF6nKA2Oy+mNN0MiQ=;
        b=PIhFpVGv/4mN5WWSdEQ/VDFnlyr53jot/WCp8gc+OHSDhU2AXe/Wb1g5rrSK+Dql0k
         vKnxIlYFDXNAZ1yxWcnJspzDQAEd9OjvQ0A1B5F9uUd1wClfOfJRvWy33K9MbvVKWtlk
         MyNKAZDaVPdv/lX5Fd9edLhWAFynkFvcwPuw/KCl/t4wJKCb9lQ+sqI4hTPhG+2iW8RZ
         gPWmLtXTqS1wEh/eRAVcfb28EQv/deiVerasFVv+ycyurXdIXXU+np5ShNhgxrQ6t0gJ
         hX/CUC7NCFewa7cgBbfa6kkOFoGb/5UFUsbY5dacekSVl92bzUf+emcmZd7aW3f+U2lj
         YsEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734611278; x=1735216078;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g+G4RnOipPGTEyD7q6bqMNwoiHSF6nKA2Oy+mNN0MiQ=;
        b=prLfWpWCocYutuG0snl5I3aqpFYuZzLXfeyKUpq+GjixEFQN7GNK9AZInAAU7lxQc6
         w5/YuInBACgI833EcdP9vuVkR/j40nwWRcTFLNrF3p8xj7guvGEP+VcCfUTfK/Me09Yc
         QES6kGzN1EOYQJoSGLaSRs0KJfYz+ezMxX19lf5kri6aTlRPk1GJknvO0YjbCKa5SNnw
         rHFsInqjgAkFEvijQr1mCTmXp1S28TFD/8xmeMPEh3L1jBIqyVuBcF2Wq7Y0iEkd+FeS
         yeCaXOsK+1+cJMRnvdAgoURVhBWLv0aPyS3G2XmjA8dDmRaMAQ0VgKu5ziifVDEv7U4i
         +yxA==
X-Forwarded-Encrypted: i=1; AJvYcCWEl2Hde7jnW2htvC1EaCNochvqFNRzY6oxXfD9LxqzfkXSaS97E/84AMRBoGJfVo8lpo3r7KQIH5039nuQlqCQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/aopaB+61oL7Uw7liA7ffXMPjPpnCVOfqEILp0eeOhztl0XGR
	/auK01vKXbbDkBh4J7Ik7KAij/m7lotBKqaz9Pp7Wp/vBNj1a+DZ2qJywbNm+2SgOOG4NLEecUR
	TIDr7PQNPL2MUFCt0IdTp/ypIfCNNppn4fc5XWA==
X-Gm-Gg: ASbGncu/NWRmIOp6CpN4L6MQzcjCdg2zz8KU8/bLCyFipy202VA2WH8tKGN8B/A3gWN
	Sz+0ruLpBWDvUTGjwojvChOz3OABu33p3p8SbxjM=
X-Google-Smtp-Source: AGHT+IF25+bCsnh44Rs1BuWbDq3wwHppqFNiO2iYcxQwZpTeUDMqhwvZIXXNgbYCm6EGUjwyqFQPJqFyUIIpbLQ7emQ=
X-Received: by 2002:a17:902:e752:b0:216:70b6:8723 with SMTP id
 d9443c01a7336-218d726bce8mr82711205ad.44.1734611278280; Thu, 19 Dec 2024
 04:27:58 -0800 (PST)
MIME-Version: 1.0
References: <20241216115006.415861-1-yeoreum.yun@arm.com>
In-Reply-To: <20241216115006.415861-1-yeoreum.yun@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 19 Dec 2024 12:27:47 +0000
Message-ID: <CAJ9a7VhxG_8R6j5uRCzOhLpy4ZmzyVvyW0+ryCcd4w7wqpZ2ew@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] coresight: change some driver' spinlock type to raw_spinlock_t
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: suzuki.poulose@arm.com, james.clark@linaro.org, 
	alexander.shishkin@linux.intel.com, bigeasy@linutronix.de, 
	clrkwllms@kernel.org, rostedt@goodmis.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_042759_369183_ADCD638A 
X-CRM114-Status: GOOD (  16.62  )
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

Hi,

On Mon, 16 Dec 2024 at 11:50, Yeoreum Yun <yeoreum.yun@arm.com> wrote:
>
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
> Reviewed-by: James Clark <james.clark@linaro.org>
>
> v2 to v3:
>     - Fix build error
>
> v1 to v2:
>     - seperate patchsets to change locktype and apply gurad API.
>
> Yeoreum Yun (9):
>   coresight: change coresight_device lock type to  raw_spinlock_t
>   coresight-etm4x: change etmv4_drvdata spinlock type to  raw_spinlock_t
>   coresight: change coresight_trace_id_map's lock type to
>     raw_spinlock_t
>   coresight-cti: change cti_drvdata spinlock's type to raw_spinlock_t
>   coresight-etb10: change etb_drvdata spinlock's type to raw_spinlock_t
>   coresight-funnel: change funnel_drvdata spinlock's type to
>     raw_spinlock_t
>   coresight-replicator: change replicator_drvdata spinlock's type to
>     raw_spinlock_t
>   coresight-tmc: change tmc_drvdata spinlock's type to raw_spinlock_t
>   coresight/ultrasoc: change cti_drvdata spinlock's type to
>     raw_spinlock_t
>
>  .../hwtracing/coresight/coresight-config.c    |   8 +-
>  .../hwtracing/coresight/coresight-config.h    |   2 +-
>  drivers/hwtracing/coresight/coresight-core.c  |   2 +-
>  .../hwtracing/coresight/coresight-cti-core.c  |  44 +--
>  .../hwtracing/coresight/coresight-cti-sysfs.c |  76 +++---
>  drivers/hwtracing/coresight/coresight-cti.h   |   2 +-
>  drivers/hwtracing/coresight/coresight-etb10.c |  26 +-
>  .../coresight/coresight-etm4x-core.c          |  18 +-
>  .../coresight/coresight-etm4x-sysfs.c         | 250 +++++++++---------
>  drivers/hwtracing/coresight/coresight-etm4x.h |   2 +-
>  .../hwtracing/coresight/coresight-funnel.c    |  12 +-
>  .../coresight/coresight-replicator.c          |  12 +-
>  .../hwtracing/coresight/coresight-syscfg.c    |  26 +-
>  .../hwtracing/coresight/coresight-tmc-core.c  |   6 +-
>  .../hwtracing/coresight/coresight-tmc-etf.c   |  48 ++--
>  .../hwtracing/coresight/coresight-tmc-etr.c   |  40 +--
>  drivers/hwtracing/coresight/coresight-tmc.h   |   2 +-
>  .../hwtracing/coresight/coresight-trace-id.c  |  22 +-
>  drivers/hwtracing/coresight/ultrasoc-smb.c    |  12 +-
>  drivers/hwtracing/coresight/ultrasoc-smb.h    |   2 +-
>  include/linux/coresight.h                     |   4 +-
>  21 files changed, 308 insertions(+), 308 deletions(-)
>
> --
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
>

Notably missing is the same changes for the etm3x driver. The ETMv3.x
and PTM1.x are supported by this driver, and these trace source
variants are also supported in perf in the cs_etm.c code.

STM is also missing, though this is not directly enabled via perf -
but could perhaps run concurrently as it can be a target output for
ftrace.

Regards

Mike

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

