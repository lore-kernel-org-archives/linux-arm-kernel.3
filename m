Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F2BCCD182
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 11:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OCgbjAlHcSbjH8BiVx15NJCnv2QZ2gu7kzCgUqpV43g=; b=Viwt8ZQc5nbj0LEiKILveDZB6S
	yAveAuIGWXYbF3i42jXGvZCbXW7UeuryOwXQ5uOyCsF+fpNpbkLzm6k1veGaRvF2BMUdDGRtyydWu
	jYjBILIy1E08X/rIIVJB5C3yvlcRRgq4ddfa7AuPcx4I+YEXXf8LyS9wLp3ZfacLm5ezPLYvB3U7m
	GSNzrnX8q1ZCQu58hX0KUEa/ftRSlRyb4XWj7qq0HHuFYFTfJyIU9zJ+KZi8dEUeh92QJBlaTK4H8
	kWuEesThcgQRXcSJiRI45S5HTPfdoTriiZZWH2F2o3r6RZIkmZhvZnDp8P9tVUsMJyfhn/TbWYNHO
	sv3u9j1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4eBQ-0000000CDMW-23fW;
	Fri, 03 Oct 2025 11:42:44 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4eBO-0000000CDM8-2Mrv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 11:42:43 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3305c08d9f6so1505210a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 04:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759491762; x=1760096562; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OCgbjAlHcSbjH8BiVx15NJCnv2QZ2gu7kzCgUqpV43g=;
        b=rrP90DkYQmdlU4//z+wEMIyDbWSD2ESnfNVgu2mmhV9HY17jH950GCdzB+ia8rV4gg
         ZRpRUfIAPdku69IID88lfAfNyLsbDCzm1KYnnpzLphp367Nb+jtiaNWGRuUcd9Wj8bqD
         RRzTQgCeHEi4jEDLPJXE3uuHq6q6SBj4bzCunNwV/hJkPbmVV3xJIbeFeKpTxpTHYgF+
         qctmq7lsGB1n6+ly/AzgwlJ9CgG3uebDcsyorIVV08TEKAxdFDy4VrCi7Gs6nCuKd8yv
         lQxGkPw9XasGWadxekZjPMjHqAUC8cWCnZeete8QNnt76+lf6Nu+hx7ofqCPZCqk/csT
         WKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759491762; x=1760096562;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OCgbjAlHcSbjH8BiVx15NJCnv2QZ2gu7kzCgUqpV43g=;
        b=VEX8wLqNRIkGYZYu1FYGCj8uDHeV1svzcWs577wURWIo3TNZ4Nnsr/A/i645aCoau4
         gR6Egen+H2SHJYRQqHYF/PQUBhtKTNq1tZ1nFyTqvmwG0P20ytcWHlPlj8bGgucvLa/Y
         u6PgZXfu0uS0bR1D5bJaMWKC+meCSdR6N2DUQxxxC4ubiQYJEjPWwikDxo5pHAdnfGaK
         Spz67tedCFTxA9ncMQUOnrpWpXNliFxi4MavjE2TGJeroEmNzJEhVsP5et/WuQ9FJnEa
         gIfnY2QZRs6WENGiQy28j1gye7APSqQ317Pc93xNIZ3UP4GEbaVYV/QT2BZc1ZOJME5W
         W7HQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfD8EmjmYS+sbxc1jJ7Ge7ew0DOrx4ymWn0y0l8VX+IiHYtb/FogRmiVmvLI3LX1KlQF3adxP/sNMFaQf6vITh@lists.infradead.org
X-Gm-Message-State: AOJu0YxTu9SXRcGUJR7SHrz3aY4VpIj2ixzt6c4yAiNm5QI09nV/BFk+
	88oJ9Se9BTbS8RnflPq3NyqPK5a4MhwPvcEQizLFyEzYOXqy1SWMAidNUlOoD9zEQeHk8aTg1Uc
	82IYUWjuRa2DT7mmUeR4EWiig8R7agaRd4k7rwrNbhQ==
X-Gm-Gg: ASbGncsJ8bNhrhDSXOW99KeQuyCcaVWYZNPNkcoxc0PGV9G7Stikry75q/YJHvAnT4I
	UqNGxfKc4izFQVgSWst1jyJ8wHu2QNrJpJLgsVs5IPWWRvsy2ouxHh2sep9tbzKUQahZVJyifm9
	YlzqAf1J+OaiGk7FRqShyM5S5qSTQnecQzbVAvz8c30tCRUg3kD/DefQ9raxMrtUywVGoS1h02U
	qsJweCppkoBrE/TTXSQAlNOb6D2PAf2rRV12qKJCfgoAGY=
X-Google-Smtp-Source: AGHT+IG+DwoeKZMyQK0/FrDX1/zsZOt9uOjo3LxwUJR6T3aI/xF9wDI32daJCRJC1VHUq0z9Z84svrqZ+ZWq3+R7gek=
X-Received: by 2002:a17:90b:3805:b0:32e:72bd:6d5a with SMTP id
 98e67ed59e1d1-339c20a4dbemr3545823a91.1.1759491761501; Fri, 03 Oct 2025
 04:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-27-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-27-ea49e91124ec@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 3 Oct 2025 12:42:30 +0100
X-Gm-Features: AS18NWAjkHCta3yyuOOjlfBXe8TUai_uFIymLJVnlCAOzk8ItpF73xJUPkPtGXA
Message-ID: <CAJ9a7VjgCwEbSuT4Qy=3NW9m9+cyRH5PsT3Pxnm7W73CEAGSkA@mail.gmail.com>
Subject: Re: [PATCH v3 27/31] coresight: Add PM callbacks for percpu sink
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Yabin Cui <yabinc@google.com>, 
	Keita Morisaki <keyz@google.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_044242_623953_579DBACC 
X-CRM114-Status: GOOD (  30.95  )
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

Hi Leo,

Since we are now passing in_idle to enable/disable path would if not
be easier to choose the correct callback in there?

e,g,

in enable path something like

case CORESIGHT_DEV_TYPE_SINK:
      if (in_idle && cs_ops(csdev)->pm_restore_enable)
                      cs_ops->pm_restore_enable(csdev)
     else
                 sink_ops(csdev)->enable(csdev, mode,data)

This would remove the need for new functions and replicating the
enable / disable helpers logic

Regards

Mike




On Mon, 15 Sept 2025 at 11:34, Leo Yan <leo.yan@arm.com> wrote:
>
> Unlike a system level's sink, the per-CPU sink may lose power during CPU
> idle states. Currently, this refers specifically to TRBE as the sink.
> This commit registers save and restore callbacks for the per-CPU sink
> via the PM notifier.
>
> There are no changes to the coresight_enable_helpers() function; the
> code movement is solely for compilation purposes.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-core.c | 101 +++++++++++++++++++++------
>  include/linux/coresight.h                    |   4 ++
>  2 files changed, 82 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 04e8c3b862494abb2a5a46d385f0ff4cad93b71f..ef9dbba285710fe508580ee2726e22bcc654014e 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -393,6 +393,25 @@ static void coresight_disable_helper(struct coresight_device *csdev, void *data)
>         helper_ops(csdev)->disable(csdev, data);
>  }
>
> +static int coresight_enable_helpers(struct coresight_device *csdev,
> +                                   enum cs_mode mode, void *data)
> +{
> +       int i, ret = 0;
> +       struct coresight_device *helper;
> +
> +       for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
> +               helper = csdev->pdata->out_conns[i]->dest_dev;
> +               if (!helper || !coresight_is_helper(helper))
> +                       continue;
> +
> +               ret = coresight_enable_helper(helper, mode, data);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return 0;
> +}
> +
>  static void coresight_disable_helpers(struct coresight_device *csdev, void *data)
>  {
>         int i;
> @@ -480,6 +499,43 @@ static void coresight_restore_source(struct coresight_device *csdev)
>                 source_ops(csdev)->restore(csdev);
>  }
>
> +static int coresight_save_percpu_sink(struct coresight_device *csdev)
> +{
> +       int ret;
> +
> +       if (csdev && sink_ops(csdev)->save) {
> +               ret = sink_ops(csdev)->save(csdev);
> +               if (ret)
> +                       return ret;
> +
> +               coresight_disable_helpers(csdev, NULL);
> +       }
> +
> +       /* Return success if callback is not supported */
> +       return 0;
> +}
> +
> +static int coresight_restore_percpu_sink(struct coresight_device *csdev,
> +                                        struct coresight_path *path,
> +                                        enum cs_mode mode)
> +{
> +       int ret = 0;
> +
> +       if (csdev && sink_ops(csdev)->restore) {
> +               ret = coresight_enable_helpers(csdev, mode, path);
> +               if (ret)
> +                       return ret;
> +
> +               ret = sink_ops(csdev)->restore(csdev);
> +               if (ret) {
> +                       coresight_disable_helpers(csdev, path);
> +                       return ret;
> +               }
> +       }
> +
> +       return ret;
> +}
> +
>  /*
>   * coresight_disable_path_from : Disable components in the given path beyond
>   * @nd in the list. If @nd is NULL, all the components, except the SOURCE are
> @@ -553,25 +609,6 @@ void coresight_disable_path(struct coresight_path *path)
>  }
>  EXPORT_SYMBOL_GPL(coresight_disable_path);
>
> -static int coresight_enable_helpers(struct coresight_device *csdev,
> -                                   enum cs_mode mode, void *data)
> -{
> -       int i, ret = 0;
> -       struct coresight_device *helper;
> -
> -       for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
> -               helper = csdev->pdata->out_conns[i]->dest_dev;
> -               if (!helper || !coresight_is_helper(helper))
> -                       continue;
> -
> -               ret = coresight_enable_helper(helper, mode, data);
> -               if (ret)
> -                       return ret;
> -       }
> -
> -       return 0;
> -}
> -
>  static int _coresight_enable_path(struct coresight_path *path,
>                                   enum cs_mode mode, void *sink_data,
>                                   bool in_idle)
> @@ -1670,9 +1707,12 @@ EXPORT_SYMBOL_GPL(coresight_alloc_device_name);
>  static int coresight_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
>                                    void *v)
>  {
> +       int ret;
>         unsigned int cpu = smp_processor_id();
>         struct coresight_device *source = per_cpu(csdev_source, cpu);
>         struct coresight_path *path;
> +       struct coresight_device *sink;
> +       enum cs_mode mode;
>
>         if (!coresight_need_save_restore_source(source))
>                 return NOTIFY_OK;
> @@ -1685,18 +1725,33 @@ static int coresight_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
>         if (WARN_ON(!path))
>                 return NOTIFY_BAD;
>
> +       sink = coresight_get_sink(path);
> +       mode = coresight_get_mode(source);
> +
>         switch (cmd) {
>         case CPU_PM_ENTER:
>                 if (coresight_save_source(source))
>                         return NOTIFY_BAD;
>
> -               coresight_disable_path_from(path, NULL, true);
> +               ret = 0;
> +               if (coresight_is_percpu_sink(sink))
> +                       ret = coresight_save_percpu_sink(sink);
> +               else
> +                       coresight_disable_path_from(path, NULL, true);
> +
> +               if (ret) {
> +                       coresight_restore_source(source);
> +                       return NOTIFY_BAD;
> +               }
>                 break;
>         case CPU_PM_EXIT:
>         case CPU_PM_ENTER_FAILED:
> -               if (_coresight_enable_path(path,
> -                                          coresight_get_mode(source),
> -                                          NULL, true))
> +               if (coresight_is_percpu_sink(sink))
> +                       ret = coresight_restore_percpu_sink(sink, path, mode);
> +               else
> +                       ret = _coresight_enable_path(path, mode, NULL, true);
> +
> +               if (ret)
>                         return NOTIFY_BAD;
>
>                 coresight_restore_source(source);
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 462876b5a870f3e93ad2a1807a9045d5eb115ccd..21bb99f9684747d7a610aa7185e1ba5f987248d9 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -363,6 +363,8 @@ enum cs_mode {
>   * @alloc_buffer:      initialises perf's ring buffer for trace collection.
>   * @free_buffer:       release memory allocated in @get_config.
>   * @update_buffer:     update buffer pointers after a trace session.
> + * @save:              save context for a sink.
> + * @restore:           restore context for a sink.
>   */
>  struct coresight_ops_sink {
>         int (*enable)(struct coresight_device *csdev, enum cs_mode mode,
> @@ -375,6 +377,8 @@ struct coresight_ops_sink {
>         unsigned long (*update_buffer)(struct coresight_device *csdev,
>                               struct perf_output_handle *handle,
>                               void *sink_config);
> +       int (*save)(struct coresight_device *csdev);
> +       int (*restore)(struct coresight_device *csdev);
>  };
>
>  /**
>
> --
> 2.34.1
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

