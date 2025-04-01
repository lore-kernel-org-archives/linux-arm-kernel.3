Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF14C36018
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 10:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bdu1GymYGk23uvATKjkOqthpfEU/FO+XWbjGjjdLCmg=; b=YF/PaMeIZuGy8wLvG6EnaX+aGU
	4UXQ0uE8M6U0y2n/tQ74SmbEJLW6iWEKGDBrd0ItfqiiljyRd1C/VD6GEQ3cyOsOSGmf4en5l9fZE
	6Gus834i4WhdSq2sLVuNbxbOFevY2BJKX14o7ufQC+3GdRkgdZf6AMozHhKhcPC57Jhnc0upuGs/w
	vFtF5y2UztgFSK6XnDMnUTUJ10/fiqI+4M2vkBZSYJYkaosMDC73VeUd/y5GzRlH49mWbVzRuKqNQ
	oqCupF+pj0pWheGdMYqBGou+h8XTjrUWU2Im/xMCclE3udfbDmHZqudFnKjdaI6KUpdglA7ifS5d+
	cFe8/FDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzZC0-00000002g77-3mQF;
	Tue, 01 Apr 2025 10:50:04 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYtf-00000002dJh-23qS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 10:31:09 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-227a8cdd241so16248735ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 03:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743503467; x=1744108267; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bdu1GymYGk23uvATKjkOqthpfEU/FO+XWbjGjjdLCmg=;
        b=ls4th2fuYnGK/Xjzy3nnmcCeQHjEZFAkzZdi2o0gWdcpJ0LowFhci5FqXQt0W4406j
         P/8Xd28YjgZ9NPMcTKvoOynODWJM6m9t6cF1iZmpfLxaI0kPxQMpIYLoGA4EFb6lku9v
         qZBlMhw8u4sqHwPL31UIs0w1swea16+jefZL8UyGrA4Z5e3OpU+1ibA0nBYQjPCWz1Yw
         JQKHzBTHMyBmW+voZuUNwwMg41M3uldpjAWWIWaffxj6R8mebgnAlZkP2YoVsx0OZ6v+
         SaAjdt0Mc70774dkzCJSUFnHaZ69nVbEwSEEXfJ1TokMtHhKGmJMaUoyb/IkBgkqYxhY
         C96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743503467; x=1744108267;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bdu1GymYGk23uvATKjkOqthpfEU/FO+XWbjGjjdLCmg=;
        b=VbuWkQJnKBb6vnr4zDbtyhV/b2awArZxBFeAwyW2ecXsxAH3tNMFJ+FgxsZa+s+dGw
         BGpySMycZ2pCvcky6gkti8EHt2sChKmlxqzEdGkua0oarjAAGv+x8hrOcf9WGA7lGuDL
         lC/EV2hI+3pV7UZnNIc59uB86X7LIjt1JWHURRt+Az84OY+WNUUE/Vz2ILNEwRfQuZbj
         5JYXRhQZZsB3jF9sX6fRkWjympOSbLQBePpTQfYZhJ5jyuYzClEr1E5058hu1R3eGOH6
         MkUohr8/w6owX7v6ws91AUG4pIEohl+feiw+PKoQZwbFiI06mvqmeeH9BwYpRourio6u
         laHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwBKL1IhHLdbU0mKDjfqYNUckEtBw97A4fitw5oAV5Nm9zPc/WNbDT0AvTo2Bwzitbqjdp1IUDTl++s3OaC7qN@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo5cAb87vgN/mCUtbvRFSx7+1CTgdw91frrSLsHcZSFiL2ki8X
	HFH5nFHDhImmPlynqFM0IDndaCTSD/oACaMW6E4lq/P3lV8yvpAMA7taSodVDQs8lBFivao2x3c
	xi1tuwWMgoVedf0KzDWtT68Yh/AP1bFYmabgolw==
X-Gm-Gg: ASbGncvgr2p27OHkzF4t9KGSlf9ZWoiX0508Z/Q/xHX7Hsaf6k8U94IQcahHdM/QIcX
	tkFmFtDoZZCXNmBMMIgBv/DpD/ddIXaKB+lz4p09xiP/WlRwXQP3uJ/Bw0fRYTOJE7t8g1pkn80
	gAbbi43X/EDphnvNVsIgYGPEPp1c/pAWKD+QF0lg==
X-Google-Smtp-Source: AGHT+IHTkvNe0ilh/P95MoDbxvfJtDi6TR93LnesNUxLFdWsIE/Px5Q1l9yNZZvD2lf1p5NcKRG1U03AkQgQjCO8L1s=
X-Received: by 2002:a05:6a00:218d:b0:736:fff2:99b with SMTP id
 d2e1a72fcca58-7398045dfecmr21978181b3a.23.1743503462715; Tue, 01 Apr 2025
 03:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250311170451.611389-1-leo.yan@arm.com> <20250311170451.611389-4-leo.yan@arm.com>
In-Reply-To: <20250311170451.611389-4-leo.yan@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 1 Apr 2025 11:30:51 +0100
X-Gm-Features: AQ5f1JrhoMjcpCkzXCXq-qk91PQYs0xMOO4GtS2OMtCAe1f01A9RYiWD2k0hQzw
Message-ID: <CAJ9a7VjbCTzycnYUMyCJbVhFpwqhTA6b7LSxtyiELqBii8iW4w@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] coresight: etm4x: Hook pause and resume callbacks
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Jonathan Corbet <corbet@lwn.net>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_033107_596098_77E5D788 
X-CRM114-Status: GOOD (  27.96  )
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

On Tue, 11 Mar 2025 at 17:05, Leo Yan <leo.yan@arm.com> wrote:
>
> Add callbacks for pausing and resuming the tracer.
>
> A "paused" flag in the driver data indicates whether the tracer is
> paused.  If the flag is set, the driver will skip starting the hardware
> trace.  The flag is always set to false for the sysfs mode, meaning the
> tracer will never be paused in the case.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  .../coresight/coresight-etm4x-core.c          | 42 ++++++++++++++++++-
>  drivers/hwtracing/coresight/coresight-etm4x.h |  2 +
>  2 files changed, 43 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 53cb0569dbbf..5b69446db947 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -577,7 +577,8 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>                 etm4x_relaxed_write32(csa, trcpdcr | TRCPDCR_PU, TRCPDCR);
>         }
>
> -       rc = etm4_enable_trace_unit(drvdata);
> +       if (!drvdata->paused)
> +               rc = etm4_enable_trace_unit(drvdata);
>  done:
>         etm4_cs_lock(drvdata, csa);
>
> @@ -820,6 +821,9 @@ static int etm4_enable_perf(struct coresight_device *csdev,
>
>         drvdata->trcid = path->trace_id;
>
> +       /* Populate pause state */
> +       drvdata->paused = !!READ_ONCE(event->hw.aux_paused);
> +
>         /* And enable it */
>         ret = etm4_enable_hw(drvdata);
>
> @@ -846,6 +850,9 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
>
>         drvdata->trcid = path->trace_id;
>
> +       /* Tracer will never be paused in sysfs mode */
> +       drvdata->paused = false;
> +
>         /*
>          * Executing etm4_enable_hw on the cpu whose ETM is being enabled
>          * ensures that register writes occur when cpu is powered.
> @@ -1080,10 +1087,43 @@ static void etm4_disable(struct coresight_device *csdev,
>                 coresight_set_mode(csdev, CS_MODE_DISABLED);
>  }
>
> +static int etm4_resume_perf(struct coresight_device *csdev)
> +{
> +       struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +       struct csdev_access *csa = &csdev->access;
> +
> +       if (coresight_get_mode(csdev) != CS_MODE_PERF)
> +               return -EINVAL;
> +
> +       etm4_cs_unlock(drvdata, csa);
> +       etm4_enable_trace_unit(drvdata);
> +       etm4_cs_lock(drvdata, csa);
> +
> +       drvdata->paused = false;
> +       return 0;
> +}
> +
> +static void etm4_pause_perf(struct coresight_device *csdev)
> +{
> +       struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +       struct csdev_access *csa = &csdev->access;
> +
> +       if (coresight_get_mode(csdev) != CS_MODE_PERF)
> +               return;
> +
> +       etm4_cs_unlock(drvdata, csa);
> +       etm4_disable_trace_unit(drvdata);
> +       etm4_cs_lock(drvdata, csa);
> +
> +       drvdata->paused = true;
> +}
> +
>  static const struct coresight_ops_source etm4_source_ops = {
>         .cpu_id         = etm4_cpu_id,
>         .enable         = etm4_enable,
>         .disable        = etm4_disable,
> +       .resume_perf    = etm4_resume_perf,
> +       .pause_perf     = etm4_pause_perf,
>  };
>
>  static const struct coresight_ops etm4_cs_ops = {
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> index bd7db36ba197..ac649515054d 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -983,6 +983,7 @@ struct etmv4_save_state {
>   * @state_needs_restore: True when there is context to restore after PM exit
>   * @skip_power_up: Indicates if an implementation can skip powering up
>   *                the trace unit.
> + * @paused:    Indicates if the trace unit is paused.
>   * @arch_features: Bitmap of arch features of etmv4 devices.
>   */
>  struct etmv4_drvdata {
> @@ -1036,6 +1037,7 @@ struct etmv4_drvdata {
>         struct etmv4_save_state         *save_state;
>         bool                            state_needs_restore;
>         bool                            skip_power_up;
> +       bool                            paused;
>         DECLARE_BITMAP(arch_features, ETM4_IMPDEF_FEATURE_MAX);
>  };
>
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

