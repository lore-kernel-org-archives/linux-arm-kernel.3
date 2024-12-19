Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8884AE7718A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 13:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e81Vh4n5E44XmINm9ngPLGaHxgXFOdylY3YBTrbgY2E=; b=mTQQBI9d5xDdwf48UacSDctPIS
	HB98hckbx+yCfJBSqyPROSOOkYzG5B8YJ2Siq/EJ1jj4C4NG1zUuE7LylQXMiQ1ihh6Yhv1jQJ4F5
	Z7k5JNqynOHiHGHDAgrcE5fThi909huwd4WAAJFx558jC5h+JRnjXXng2jVuWNWFKSJ6Fgdfk3WjW
	1/du/m5k2U4pSjXhKxRv9Qprf9J3EgkkWfQgTSOHLFt3/PyGqjyZhgkie62WzH9VQH0IsxdHmC7Qg
	obVPhT9da3lFDbCAUZ5KZwV1C3EwRgG6PZXXDiCVuBf5dHU5STHMuFO/VAqq8B/IYyY+OHrX2M1ad
	v7cJR3SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOGlG-00000001yUx-2Nxa;
	Thu, 19 Dec 2024 13:40:18 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFZj-00000001m9Q-428l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 12:24:21 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-215770613dbso4599145ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 04:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734611059; x=1735215859; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e81Vh4n5E44XmINm9ngPLGaHxgXFOdylY3YBTrbgY2E=;
        b=yvfxQj25MRx95GWc8ZAMwcspfT3eBV49brcdhlQiAPbNk9BpGscsgx+xsdtLjLp0ri
         5CXRMgFwAuSxnUEgMQYqENzgwl3jFDG2svZW7Sw3QZI/Ud7HagClOhlR1jID7dGyjrYi
         4Ffe2E9mU0obM1/kO15qgVzuzo+Bn7k/cxq1wsEuNQkM3jhr/Wmmy4aQTun4c4DiLm+P
         DZT+s7NCDpHwoRV++FY8dx6mQEju3iTRBDaF684UhRMs4lcD3dcqnXbuh9xxKeoR+XUZ
         jYn4psm2g5KLKpaSNCX6VqBxlpb9YFpKQWRes6UAB7MnGT665L/JnwNLsMnYCYkBX1RC
         o/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734611059; x=1735215859;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e81Vh4n5E44XmINm9ngPLGaHxgXFOdylY3YBTrbgY2E=;
        b=gQY+QjYwO9F2mOOOKqhtOFqf+C0/Wl3IpIdfyjQtvaTG7jwSggAR7kFIBu6ozGpaen
         tJBTcl1jvfAHKJsD+K6cHyvEH9l9L8xo1nTD/+B2zlwWdStTVU4mYWtTk9CRr0Aql5H5
         SO69g9TiluhvxoBx64rE/43Ir0/y56u4idxcKbWu55xXEWP0e6iVFNOR9/JYtPNb5GHd
         jvit4Aao6wXZGpBUImUAR5xkTGyEbiV+wlMOhAYvaax8mgBOaf3GR01Am3w2XfMe43Fq
         KuKu5HhSiPBstTzU6OmkaACs46cRwOls+h8m6y6yZo5MPROiBu9djgPgubwScbZllZqi
         sWtA==
X-Forwarded-Encrypted: i=1; AJvYcCUZxsV+6Rc++aQZo0+YOqnhyEz8gYayeztalrC8H5RmrXdJSoDWO7okvMqZK4mcYJkjbI7ByriVBLzY2DfUMTEN@lists.infradead.org
X-Gm-Message-State: AOJu0YydsXda24T8nKN+nbykjr2MpfVYUEFP6qIEiJc3uo1MbDK/e23C
	v2p4/RSjdGfFpxxF9VNgbiINljh41ZLgnVXlDAFoswPLwab1zRPfs02r2Es4nd0efCUUXFZUt7a
	dFOyT5OJYAZysrMgvZ/aGHLlIiLjPxbw6g5lDrg==
X-Gm-Gg: ASbGncvaTQXEbvK+krQf9kSX7JOW+dQlZBsY0o8e/0thsOLk3+GxmPe14AGMfi9Mk4a
	X81IL12rooJtCEFiDiPXt8sD8n/tU6a07M5qfltk=
X-Google-Smtp-Source: AGHT+IHBn43pdX0pYf/rQYn2FYOzNPAA9risDSKTi00PJeRhVMrc0NPEChFuLLhTcXQ+q+xLrnxw0aDpCWiEidk7IpA=
X-Received: by 2002:a17:902:db04:b0:215:a2e2:53ff with SMTP id
 d9443c01a7336-219d9617e99mr38845615ad.11.1734611059237; Thu, 19 Dec 2024
 04:24:19 -0800 (PST)
MIME-Version: 1.0
References: <20241216115006.415861-1-yeoreum.yun@arm.com> <20241216115006.415861-4-yeoreum.yun@arm.com>
In-Reply-To: <20241216115006.415861-4-yeoreum.yun@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 19 Dec 2024 12:24:08 +0000
Message-ID: <CAJ9a7VhBkrggH9y1jqZZoXfhqiqKTkqU+U0aEm=659kpNUMj7Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] coresight: change coresight_trace_id_map's lock
 type to raw_spinlock_t
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: suzuki.poulose@arm.com, james.clark@linaro.org, 
	alexander.shishkin@linux.intel.com, bigeasy@linutronix.de, 
	clrkwllms@kernel.org, rostedt@goodmis.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_042419_997867_7C0AD720 
X-CRM114-Status: GOOD (  19.97  )
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

On Mon, 16 Dec 2024 at 11:50, Yeoreum Yun <yeoreum.yun@arm.com> wrote:
>
> coresight_trace_id_map->lock can be acquired while coresight devices'
> drvdata_lock.
>
> But the drvdata_lock can be raw_spinlock_t (i.e) coresight-etm4x.
>
> To address this, change type of coresight_trace_id_map->lock to
> raw_spinlock_t
>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-core.c  |  2 +-
>  .../hwtracing/coresight/coresight-trace-id.c  | 22 +++++++++----------
>  include/linux/coresight.h                     |  2 +-
>  3 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index ea38ecf26fcb..cc2d87b2f248 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -1164,7 +1164,7 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
>
>         if (csdev->type == CORESIGHT_DEV_TYPE_SINK ||
>             csdev->type == CORESIGHT_DEV_TYPE_LINKSINK) {
> -               spin_lock_init(&csdev->perf_sink_id_map.lock);
> +               raw_spin_lock_init(&csdev->perf_sink_id_map.lock);
>                 csdev->perf_sink_id_map.cpu_map = alloc_percpu(atomic_t);
>                 if (!csdev->perf_sink_id_map.cpu_map) {
>                         kfree(csdev);
> diff --git a/drivers/hwtracing/coresight/coresight-trace-id.c b/drivers/hwtracing/coresight/coresight-trace-id.c
> index d98e12cb30ec..a6531869e9ec 100644
> --- a/drivers/hwtracing/coresight/coresight-trace-id.c
> +++ b/drivers/hwtracing/coresight/coresight-trace-id.c
> @@ -16,7 +16,7 @@
>  static DEFINE_PER_CPU(atomic_t, id_map_default_cpu_ids) = ATOMIC_INIT(0);
>  static struct coresight_trace_id_map id_map_default = {
>         .cpu_map = &id_map_default_cpu_ids,
> -       .lock = __SPIN_LOCK_UNLOCKED(id_map_default.lock)
> +       .lock = __RAW_SPIN_LOCK_UNLOCKED(id_map_default.lock)
>  };
>
>  /* #define TRACE_ID_DEBUG 1 */
> @@ -121,11 +121,11 @@ static void coresight_trace_id_release_all(struct coresight_trace_id_map *id_map
>         unsigned long flags;
>         int cpu;
>
> -       spin_lock_irqsave(&id_map->lock, flags);
> +       raw_spin_lock_irqsave(&id_map->lock, flags);
>         bitmap_zero(id_map->used_ids, CORESIGHT_TRACE_IDS_MAX);
>         for_each_possible_cpu(cpu)
>                 atomic_set(per_cpu_ptr(id_map->cpu_map, cpu), 0);
> -       spin_unlock_irqrestore(&id_map->lock, flags);
> +       raw_spin_unlock_irqrestore(&id_map->lock, flags);
>         DUMP_ID_MAP(id_map);
>  }
>
> @@ -134,7 +134,7 @@ static int _coresight_trace_id_get_cpu_id(int cpu, struct coresight_trace_id_map
>         unsigned long flags;
>         int id;
>
> -       spin_lock_irqsave(&id_map->lock, flags);
> +       raw_spin_lock_irqsave(&id_map->lock, flags);
>
>         /* check for existing allocation for this CPU */
>         id = _coresight_trace_id_read_cpu_id(cpu, id_map);
> @@ -161,7 +161,7 @@ static int _coresight_trace_id_get_cpu_id(int cpu, struct coresight_trace_id_map
>         atomic_set(per_cpu_ptr(id_map->cpu_map, cpu), id);
>
>  get_cpu_id_out_unlock:
> -       spin_unlock_irqrestore(&id_map->lock, flags);
> +       raw_spin_unlock_irqrestore(&id_map->lock, flags);
>
>         DUMP_ID_CPU(cpu, id);
>         DUMP_ID_MAP(id_map);
> @@ -178,12 +178,12 @@ static void _coresight_trace_id_put_cpu_id(int cpu, struct coresight_trace_id_ma
>         if (!id)
>                 return;
>
> -       spin_lock_irqsave(&id_map->lock, flags);
> +       raw_spin_lock_irqsave(&id_map->lock, flags);
>
>         coresight_trace_id_free(id, id_map);
>         atomic_set(per_cpu_ptr(id_map->cpu_map, cpu), 0);
>
> -       spin_unlock_irqrestore(&id_map->lock, flags);
> +       raw_spin_unlock_irqrestore(&id_map->lock, flags);
>         DUMP_ID_CPU(cpu, id);
>         DUMP_ID_MAP(id_map);
>  }
> @@ -193,10 +193,10 @@ static int coresight_trace_id_map_get_system_id(struct coresight_trace_id_map *i
>         unsigned long flags;
>         int id;
>
> -       spin_lock_irqsave(&id_map->lock, flags);
> +       raw_spin_lock_irqsave(&id_map->lock, flags);
>         /* prefer odd IDs for system components to avoid legacy CPU IDS */
>         id = coresight_trace_id_alloc_new_id(id_map, 0, true);
> -       spin_unlock_irqrestore(&id_map->lock, flags);
> +       raw_spin_unlock_irqrestore(&id_map->lock, flags);
>
>         DUMP_ID(id);
>         DUMP_ID_MAP(id_map);
> @@ -207,9 +207,9 @@ static void coresight_trace_id_map_put_system_id(struct coresight_trace_id_map *
>  {
>         unsigned long flags;
>
> -       spin_lock_irqsave(&id_map->lock, flags);
> +       raw_spin_lock_irqsave(&id_map->lock, flags);
>         coresight_trace_id_free(id, id_map);
> -       spin_unlock_irqrestore(&id_map->lock, flags);
> +       raw_spin_unlock_irqrestore(&id_map->lock, flags);
>
>         DUMP_ID(id);
>         DUMP_ID_MAP(id_map);
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 924b58c343b3..6446ca1f09d8 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -233,7 +233,7 @@ struct coresight_trace_id_map {
>         DECLARE_BITMAP(used_ids, CORESIGHT_TRACE_IDS_MAX);
>         atomic_t __percpu *cpu_map;
>         atomic_t perf_cs_etm_session_active;
> -       spinlock_t lock;
> +       raw_spinlock_t lock;
>  };
>
>  /**
> --
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>


--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

