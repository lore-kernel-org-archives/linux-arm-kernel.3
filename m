Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5430CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 14:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b34wGs9nD0Y9CaZ4JvoEB/jenHfEgOrSeC6h74K8yrA=; b=PT5XktrKqZ5ByL5Gy5NBVx8zhD
	uqNTehOk7LYq2pxN5np0et/esHYggMSdmtPh1rs+mhrwNiRmkRp7X1vYihWltnS5cie1TYHJJw21Q
	Zd+hyFUDIMSUqLcCPtL5DI2VVdiYb1D51YL5XMlpaK+pJ+6ObyX8SIqpxdrfLs+LXaUf6mmH8lnHt
	xU5f9qhDr27zBloyxDYgJuRw8FtA0c+/wDxtQ3mm4R0DLmDgM5hVK3PO6tUbYpCRWg1aNy3JgdW53
	jo/8BMLy1jRw4zL9Y/DWqXdIY11IoaXfu1QaxzLLhQp6WrMKVsHEPqNKrJ7x0dnGu948qCvNrqkao
	tc9zpcKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v292N-00000001ndx-0NSC;
	Fri, 26 Sep 2025 14:03:03 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v292C-00000001nUQ-2i3s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 14:02:53 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7704f3c46ceso2164829b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 07:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758895372; x=1759500172; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b34wGs9nD0Y9CaZ4JvoEB/jenHfEgOrSeC6h74K8yrA=;
        b=M5EPBqhwEPUUlSzi95YjzGkOcFxgFsmbVD2Zv6H3yxAM2nSEiHJhMhWWoYjGTBXJ+0
         xRYoQWWOdo/ko6jEAlwKn423hV07imG7qIZzCnAfKVA5i1R/nUlOSMblgAbKS/YRYQK0
         Be0R+9QTnVC8E75mL2iAcqA9tqMbuT4Ry9zn1YX1grX5+Aih/ANZJszs8/jlRBROKc4y
         tJx95uCmU4RPtdfSAgvLU+Izmyc5TqFJblB2BjjU2hetkL5wUwkamE0PnMr1edBWc8/m
         dVAAgOIMPMFRmCuEwdJcEsurTPOzYe4flw3NIjDIPMq9ApzUP6HRTsP0A7xz9SfwHJK2
         NOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758895372; x=1759500172;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b34wGs9nD0Y9CaZ4JvoEB/jenHfEgOrSeC6h74K8yrA=;
        b=ElbmZDaDLFFV/jh7S4z8d5AaJEkpa0WL6OCu/KYP+lljHCSTwX+47ny8x9Uo08B+cX
         DKPR18EhuoZGOdnk0KUmcI8JAXmMiSWK1pRTfVT3y2Qswn/eceUFLd1XnxeO9gvDvHfc
         b5fxry880Mo8t2fq9Bq9pqI3bE/fd1Q6RjqLqsoiB0YIXCOMzyz3K93oDQF14jrQLzOi
         7lt4Dqfq0DDofJthWEargrpd1gi8LmQAEZEBZ3mw/eYcazgwlrSQD62cbcNXox7z4515
         csqhNI4K3rJZt16LVdHrneTo1fvzbIBZOZ0THWPBeNVUiTN57RU9IPcZm/D2ToGmTswz
         aGFg==
X-Forwarded-Encrypted: i=1; AJvYcCUzFucqA0oKJA9tWmD8nRFsck14GL+RhDhbT+AINNyHVt7JwE3L7at+y+fr6ASnz5L9ijRUBiVVTEjPgaEjSAsN@lists.infradead.org
X-Gm-Message-State: AOJu0YxW+3Y7E6VZRM0X1MYUo/rSZxpkFOLTMIzYttCd1RPmD/W2Xlc8
	eqscfefLcygWAny4hc4t8MqAnVgPvPMwFa2pONWna9da5c5X+7GZX5GVVJ9swylGuGcDohpCq7B
	o7tAgAdGzL8OG38HrRrQ6+OF0z/s0Y2PCY5YqupLKRQ==
X-Gm-Gg: ASbGncsNhYcZPJ1tJ9kqxpzxqoX7Dv35IqBjPM/hP2GEVzzlj7CDkzpE+Ar5IQqLpyB
	Hv4Q/5q1WzePoHEZvF7EJEUy+y7UZ/jjxLQcd6eg2maJo6DzjYGnYSn+I7OS7VqFhFuFU/H6Xtp
	D2GM7eYKfbe8PKsxInrSZN4HAWwyZS+3JQQYKopafpK5L/iwBkGkI6ccI1IIZKx1aygMErycwdP
	OL8nP5fKo+fLmODHAeThAJr1Fw=
X-Google-Smtp-Source: AGHT+IHNVQTA/69oU/CUQR/qzRklnjI8rfcKmvQcJDYQudYDMOwxgD081JACtBJAStB/G2wUf0OyzRhddDm5971nSG4=
X-Received: by 2002:a17:90b:3b92:b0:330:4604:3ae8 with SMTP id
 98e67ed59e1d1-3342a299079mr7973533a91.21.1758895369114; Fri, 26 Sep 2025
 07:02:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-3-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-3-ea49e91124ec@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 26 Sep 2025 15:02:37 +0100
X-Gm-Features: AS18NWDTcb7oxwMgCuAkf5sEgmhUv6FvzbyMYKujmlMyb_diOW8BQdP0dPPl23g
Message-ID: <CAJ9a7ViRQFonAp4kxP5icC5pNCqJjT0AY=saWnkEiEkBOi6wVg@mail.gmail.com>
Subject: Re: [PATCH v3 03/31] coresight: etm3x: Always set tracer's device
 mode on target CPU
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Yabin Cui <yabinc@google.com>, 
	Keita Morisaki <keyz@google.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_070252_689875_5835E6B6 
X-CRM114-Status: GOOD (  27.31  )
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

On Mon, 15 Sept 2025 at 11:33, Leo Yan <leo.yan@arm.com> wrote:
>
> The ETMv3 driver shares the same issue as ETMv4 regarding race
> conditions when accessing the device mode.
>
> This commit applies the same fix: ensuring that the device mode is
> modified only by the target CPU to eliminate race conditions across
> CPUs.
>
> Fixes: 22fd532eaa0c ("coresight: etm3x: adding operation mode for etm_enable()")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-etm3x-core.c | 54 +++++++++++++++-------
>  1 file changed, 37 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> index 45630a1cd32fbd05ec8b2a6979f0174cacce365e..f759a47eaed9e804e30530a232370c9504912ac6 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> @@ -442,10 +442,23 @@ struct etm_enable_arg {
>  static void etm_enable_hw_smp_call(void *info)
>  {
>         struct etm_enable_arg *arg = info;
> +       struct coresight_device *csdev;
>
>         if (WARN_ON(!arg))
>                 return;
> +
> +       csdev = arg->drvdata->csdev;
> +       if (!coresight_take_mode(csdev, CS_MODE_SYSFS)) {
> +               /* Someone is already using the tracer */
> +               arg->rc = -EBUSY;
> +               return;
> +       }
> +
>         arg->rc = etm_enable_hw(arg->drvdata);
> +
> +       /* The tracer didn't start */
> +       if (arg->rc)
> +               coresight_set_mode(csdev, CS_MODE_DISABLED);
>  }
>
>  static int etm_cpu_id(struct coresight_device *csdev)
> @@ -464,17 +477,26 @@ static int etm_enable_perf(struct coresight_device *csdev,
>                            struct perf_event *event,
>                            struct coresight_path *path)
>  {
> +       int ret = 0;
>         struct etm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>
>         if (WARN_ON_ONCE(drvdata->cpu != smp_processor_id()))
>                 return -EINVAL;
>
> +       if (!coresight_take_mode(csdev, CS_MODE_PERF))
> +               return -EBUSY;
> +
>         /* Configure the tracer based on the session's specifics */
>         etm_parse_event_config(drvdata, event);
>         drvdata->traceid = path->trace_id;
>
>         /* And enable it */
> -       return etm_enable_hw(drvdata);
> +       ret = etm_enable_hw(drvdata);
> +       /* The tracer didn't start */
> +       if (ret)
> +               coresight_set_mode(csdev, CS_MODE_DISABLED);
> +
> +       return ret;
>  }
>
>  static int etm_enable_sysfs(struct coresight_device *csdev, struct coresight_path *path)
> @@ -517,12 +539,6 @@ static int etm_enable(struct coresight_device *csdev, struct perf_event *event,
>                       enum cs_mode mode, struct coresight_path *path)
>  {
>         int ret;
> -       struct etm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> -
> -       if (!coresight_take_mode(csdev, mode)) {
> -               /* Someone is already using the tracer */
> -               return -EBUSY;
> -       }
>
>         switch (mode) {
>         case CS_MODE_SYSFS:
> @@ -535,17 +551,12 @@ static int etm_enable(struct coresight_device *csdev, struct perf_event *event,
>                 ret = -EINVAL;
>         }
>
> -       /* The tracer didn't start */
> -       if (ret)
> -               coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
> -
>         return ret;
>  }
>
> -static void etm_disable_hw(void *info)
> +static void etm_disable_hw(struct etm_drvdata *drvdata)
>  {
>         int i;
> -       struct etm_drvdata *drvdata = info;
>         struct etm_config *config = &drvdata->config;
>         struct coresight_device *csdev = drvdata->csdev;
>
> @@ -567,6 +578,15 @@ static void etm_disable_hw(void *info)
>                 "cpu: %d disable smp call done\n", drvdata->cpu);
>  }
>
> +static void etm_disable_hw_smp_call(void *info)
> +{
> +       struct etm_drvdata *drvdata = info;
> +
> +       etm_disable_hw(drvdata);
> +
> +       coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
> +}
> +
>  static void etm_disable_perf(struct coresight_device *csdev)
>  {
>         struct etm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> @@ -588,6 +608,8 @@ static void etm_disable_perf(struct coresight_device *csdev)
>
>         CS_LOCK(drvdata->csa.base);
>
> +       coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
> +
>         /*
>          * perf will release trace ids when _free_aux()
>          * is called at the end of the session
> @@ -612,7 +634,8 @@ static void etm_disable_sysfs(struct coresight_device *csdev)
>          * Executing etm_disable_hw on the cpu whose ETM is being disabled
>          * ensures that register writes occur when cpu is powered.
>          */
> -       smp_call_function_single(drvdata->cpu, etm_disable_hw, drvdata, 1);
> +       smp_call_function_single(drvdata->cpu, etm_disable_hw_smp_call,
> +                                drvdata, 1);
>
>         spin_unlock(&drvdata->spinlock);
>         cpus_read_unlock();
> @@ -652,9 +675,6 @@ static void etm_disable(struct coresight_device *csdev,
>                 WARN_ON_ONCE(mode);
>                 return;
>         }
> -
> -       if (mode)
> -               coresight_set_mode(csdev, CS_MODE_DISABLED);
>  }
>
>  static const struct coresight_ops_source etm_source_ops = {
>
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>

--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

