Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F0BDE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 13:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ul3jV26q/OyEv82Q0FmpZheBVp/UPEqN3sZqLd2am5k=; b=WpT/1xalpL4fPHtdVrTSum/pJk
	+uVKS4XnmUKcogqKyrD4Sy3XS7qsZeAdy5GFZITg7kY1T6cTje79G3I6ArMf/ZOh3KdR1GhEz901t
	lC7ScYeuBDBLiQyY1ghT+p6hXMkBB2bVaF597oNEO1+naHqllL4lI6u7Vk5hduiVFHb7hWuKertHo
	a0R22dFW61sV3wLzuJidMcgEIr3GxCUCh5NZY8oCoKF8/Ow+Pu3VoiANnoqXBJ+HjmIrTQrW2pgAM
	yG+0VRJkw6ChwnKz3oXxZx4sMexLQyWzFdgbB3PHeylTeUZ544n3DYK/k2hTHw3jBsAGFl+gB4Yl+
	7cjVARUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNuNI-0000000GlOf-1aUo;
	Wed, 18 Dec 2024 13:46:04 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNuMB-0000000GlHG-2jXr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 13:44:57 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-7ea8de14848so3589528a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 05:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734529494; x=1735134294; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ul3jV26q/OyEv82Q0FmpZheBVp/UPEqN3sZqLd2am5k=;
        b=x+HkpOpKSaDNnpEgr9NFytWH3NUobb+Msm/9iITpJzyIFJYkKRIJBrhIlymZVISHgi
         8yPs9nT27h/+yclC3m8M7XxZJi3lxl70mZIFgR8xTs0kPXXmr+gpsUzg77F+Zs2M3Ctp
         hAXd0TZ4OnyYeQgcFCgCopmJeKEl/wo74O+HfWXZaQtZIN2+l0EdXsB36UuZamuLXDpZ
         0N6a9T6oF1rregdBFm51eSAWetAjh4sSCmlG7mrk5wszmMJFwYPoP/pN7ShbpFzO0ZDd
         MC4Eg8UYYnl2wb8Mlo0M6Khnb6d2taBfOUU4eLNcHQhgcu9c6TARDJT41HJFRpqBbjLt
         Zpwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734529494; x=1735134294;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ul3jV26q/OyEv82Q0FmpZheBVp/UPEqN3sZqLd2am5k=;
        b=vNglOa115eCboQM02DZXcIH62x+dnP/7BokponMF8WcU0WrSQawaRXsSAlSavoDjEa
         VDI8YqEBU/+Gs8uiy6BH16Hl1ZDdGACLsfBGvSzZlr7ycHnWpB9sE28ILVBbD0J8WYrB
         J+o5CO+7Sbxxcch5yPdLDlT7zjmVP/s0ivcqve2sm2d8MGQWZxZHsECd4PoihQqogJSi
         kHZ6GyIfk1yLACLqy7TOw2nbL3bysEbAJnUzN50yJ1Rev49U4ANkf5pcTUbc6GVg+Oa7
         xih1keGeBDYfoe9PN/69dw/s5bBUFakR4pkjluFLOK5lA8n55JOgCUly/lX1QiYgYlY0
         NRZA==
X-Forwarded-Encrypted: i=1; AJvYcCXIca7Ia2N4WB3D1cv1vlvpog6NnIxhlfFyyPW3KTWYVE9TNexhzUkZTdBcAkLd9IEWL367MreqxrFPf+RYpUA3@lists.infradead.org
X-Gm-Message-State: AOJu0YwguVyylfZkDEBhj8BJmpMHCOBlCsunNatnEgybfgDJwVOsCMm5
	J2QHDM3T69s7Bvl1dfqsi62lKO29wWPq/mRmKSfpXoRuklv2e8XW35Pdsv72HTLp8WBVYHc/YQ4
	yX6dprgj7CeF6BQYOr3cjxy+qq0vnP3fexOovSg==
X-Gm-Gg: ASbGncvrCipCNKrIOzgSf116LvardffnSBRUmBr7LK48F/H2zx7hV+T72by9tfKRCsZ
	HUN5G6ef1ulHrGMy3PWiThq8LSIakasCzI3LnsuU=
X-Google-Smtp-Source: AGHT+IGsoXTWsZd2EEH9lplUvC3+MNK93cd4idsL7abuAi1JyYAl22P2kd0k3H8ZJ1NCDnSk3wgNv/EGdrZus4stKfo=
X-Received: by 2002:a17:90b:5251:b0:2ee:4b8f:a59c with SMTP id
 98e67ed59e1d1-2f2e91fe20bmr3713758a91.22.1734529492703; Wed, 18 Dec 2024
 05:44:52 -0800 (PST)
MIME-Version: 1.0
References: <20241203114942.697188-1-yeoreum.yun@arm.com>
In-Reply-To: <20241203114942.697188-1-yeoreum.yun@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 18 Dec 2024 13:44:41 +0000
Message-ID: <CAJ9a7Vis9vcdJOzu9tvNQ4eAacmXkbhbZBaRYd1acOrd8G-ZUQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] coresight: change some driver' spinlock type to raw_spinlock_t
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: suzuki.poulose@arm.com, james.clark@linaro.org, 
	alexander.shishkin@linux.intel.com, bigeasy@linutronix.de, 
	clrkwllms@kernel.org, rostedt@goodmis.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_054455_687465_9CEAF413 
X-CRM114-Status: GOOD (  16.17  )
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

This change seems to omit devices:

etm3x - which provides support for ETMv3 and PTM, both of which are
valid trace sources in the cs_etm handling code.
stm - can be integrated into the kernel STM via configfs providing a
MIPI source for ftrace.

Mike

On Tue, 3 Dec 2024 at 11:49, Yeoreum Yun <yeoreum.yun@arm.com> wrote:
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
> v1 to v2:
>     - seperate patchsets to change locktype and apply gurad API.
>
> Levi Yun (9):
>   coresight: change coresight_device lock type to raw_spinlock_t
>   coresight-etm4x: change etmv4_drvdata spinlock type to raw_spinlock_t
>   coresight: change coresight_trace_id_map's lock type to raw_spinlock_t
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
>  .../hwtracing/coresight/coresight-config.c    |  21 +-
>  .../hwtracing/coresight/coresight-config.h    |   2 +-
>  drivers/hwtracing/coresight/coresight-core.c  |   2 +-
>  .../hwtracing/coresight/coresight-cti-core.c  |  65 +-
>  .../hwtracing/coresight/coresight-cti-sysfs.c | 135 +++--
>  drivers/hwtracing/coresight/coresight-cti.h   |   2 +-
>  drivers/hwtracing/coresight/coresight-etb10.c |  62 +-
>  .../coresight/coresight-etm4x-core.c          |  71 ++-
>  .../coresight/coresight-etm4x-sysfs.c         | 566 +++++++++---------
>  drivers/hwtracing/coresight/coresight-etm4x.h |   2 +-
>  .../hwtracing/coresight/coresight-funnel.c    |  34 +-
>  .../coresight/coresight-replicator.c          |  36 +-
>  .../hwtracing/coresight/coresight-syscfg.c    |  75 ++-
>  .../hwtracing/coresight/coresight-tmc-core.c  |   9 +-
>  .../hwtracing/coresight/coresight-tmc-etf.c   | 195 +++---
>  .../hwtracing/coresight/coresight-tmc-etr.c   | 199 +++---
>  drivers/hwtracing/coresight/coresight-tmc.h   |   2 +-
>  .../hwtracing/coresight/coresight-trace-id.c  |  93 ++-
>  drivers/hwtracing/coresight/ultrasoc-smb.c    |  12 +-
>  drivers/hwtracing/coresight/ultrasoc-smb.h    |   2 +-
>  include/linux/coresight.h                     |   4 +-
>  21 files changed, 751 insertions(+), 838 deletions(-)
>
> --
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

