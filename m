Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08BDC36018
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 10:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wyjemxHYQVfV2RAp28JZowO/OFLohCsOjkUOahPABvs=; b=MwkK1a6MHL7BCIXHu+3VXfPDiy
	TgpDo0ryyzlp3cZ3R8yVu4x8n4vB6GiNQYu2LRLFaawJYByHHGjpTcFf0RGfjV4Ltr5fdtzeLyuxj
	xKiP3nBy9KZnKSMDmry0otSJ1w0EGtjwkJfNbaKmxNppT79CNYi/d+4cI2Flz0Etp1woetWxTgzf5
	ugWh4WmIHDP7Bp0QZUx9h8mvHKRisfEY/5ncRwLC1X3PufbLOzCdyYf3zCK8F1H5gBHdq/hS4o3O4
	4MTvWjuqMv7jbvtAw2sRsOuK1fbQUO5AVi/7p+ctAkygTHeRMn5VhVZ5oSt6EEP4PNWd5lGFVRWaw
	qSGVJk4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYpA-00000002coG-3Gyh;
	Tue, 01 Apr 2025 10:26:28 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYRV-00000002YSd-3H1o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 10:02:03 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2241053582dso84160065ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 03:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743501721; x=1744106521; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wyjemxHYQVfV2RAp28JZowO/OFLohCsOjkUOahPABvs=;
        b=j+d1ljNDs/ELZECvRtAb7nftTb/w5YU/2Q60SM/LSfR/vaeZeS1lTEQPxE7AMRoZiz
         YAsVfJLvC28dpZl0W8Lnm2xLTBRtZcSukG9hhOt8ruDJDzagUmPGITnCU2EJVzs8woPf
         sH9skI2oHtfO75Tcr+seRZejWwibyASu9az2mQl16UW8wBK1tZk08ekTgW8rjzG73nHN
         8IVZ78jCOKkLSAHFIXzoNHKQL6XKMhRAE/21lOnNQLGN5WF5KntxjGOgvdCMuwT1Xnx2
         zL8DsT3kh65z05Vzy4E2Jlv6I4E/h44nQkV6EWNNmmb0S1hX8epuh9Vc4n25D32Wc5Kr
         +2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743501721; x=1744106521;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wyjemxHYQVfV2RAp28JZowO/OFLohCsOjkUOahPABvs=;
        b=qRgFK7xJZkd2gVKTXMCTEUaoV+C0dRdnUNywezikPUe+c0+eUNxxlGPMwipe1A1RVL
         rbQXJV3o9ZeJOfrtzWA3g23eSB8tZJsZoE59cE354dMhBEiRtIujed9X8tWZcNbnN5L+
         /HIzK678S+1yrDqWPfMI4YXf/+uFQ4xpLEsPhXUFYbYWwf7mufrxbOaRsYXHJzJDtnga
         QGdC+wCI9M/ZiPkEII/soSiL+vVkE5cicHVO0f94K5WPxxMFHNvsJlFU8YYYaKkcLEvw
         K35XSt4ZPfZceO6B1NBQiaqDddEGFfF4ueyJXmtxhTV20FQQFgemcxxL8EqqGw1aDJZK
         czEw==
X-Forwarded-Encrypted: i=1; AJvYcCV3kD0uqDAaHMNQ61jqall6dNGyPr/kue7lFI8Ej4FZdXahWg7iJVC1TvnG1chd66MDO7Fsr1pFvXeWhhcqqV1K@lists.infradead.org
X-Gm-Message-State: AOJu0YzfqRfVLrBoxQXiJRic78zp2xXcsVc3Xt1D5c2WwI2ZYmnfif8x
	1LgqO058APtKF9rE8cO/LTTdrsoXwMNgHwgz4So1NF2/+j5oaNiL5sY+aS24r4sypKREcKuW0mE
	Vqx9ZCS5YvlV9YZ/usq+tiFMfMAgMIu7ePthipg==
X-Gm-Gg: ASbGnctHs0Cll3DlGQaGnSMAFALittjA5APf43e3cdKkuEsbHs/hERiwwvWRx36rlYD
	9XG7+N+JS88lMXdtdi+7JEf5aNuKsajua2i3Ny0g5a1DYYQWFs0JbNg9t8lj9gthIDCngdAz8+r
	zKTY4hzKDe/NVNucNr3rR9Zxi2q+g=
X-Google-Smtp-Source: AGHT+IH4yoC0IXNJC0YNilNe/ARbknkDvKtfRQS06TMmC8WC5ANOsA0AGY+eH2ffVNsMurol4yN7DGOyBc3sRAf0eSo=
X-Received: by 2002:aa7:88d2:0:b0:736:3be3:3d76 with SMTP id
 d2e1a72fcca58-7398041dafdmr16611300b3a.17.1743501720739; Tue, 01 Apr 2025
 03:02:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250311170451.611389-1-leo.yan@arm.com> <20250311170451.611389-3-leo.yan@arm.com>
In-Reply-To: <20250311170451.611389-3-leo.yan@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 1 Apr 2025 11:01:49 +0100
X-Gm-Features: AQ5f1Jp1RW5fkG8Kbz_MFd1dM6zqYns3yVh04MaQfoZg_wzQM8iHEY3uu07DATc
Message-ID: <CAJ9a7VjcWHiRQmWW3sWTf8iBWMr5K3zCCJ6RF=i6bU+qO154qA@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] coresight: Introduce pause and resume APIs for source
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Jonathan Corbet <corbet@lwn.net>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_030201_926206_84F12631 
X-CRM114-Status: GOOD (  21.07  )
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
> Introduce APIs for pausing and resuming trace source and export as GPL
> symbols.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-core.c | 22 ++++++++++++++++++++
>  drivers/hwtracing/coresight/coresight-priv.h |  2 ++
>  include/linux/coresight.h                    |  4 ++++
>  3 files changed, 28 insertions(+)
>
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index fb43ef6a3b1f..d4c3000608f2 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -367,6 +367,28 @@ void coresight_disable_source(struct coresight_device *csdev, void *data)
>  }
>  EXPORT_SYMBOL_GPL(coresight_disable_source);
>
> +void coresight_pause_source(struct coresight_device *csdev)
> +{
> +       if (!coresight_is_percpu_source(csdev))
> +               return;
> +
> +       if (source_ops(csdev)->pause_perf)
> +               source_ops(csdev)->pause_perf(csdev);
> +}
> +EXPORT_SYMBOL_GPL(coresight_pause_source);
> +
> +int coresight_resume_source(struct coresight_device *csdev)
> +{
> +       if (!coresight_is_percpu_source(csdev))
> +               return -EOPNOTSUPP;
> +
> +       if (!source_ops(csdev)->resume_perf)
> +               return -EOPNOTSUPP;
> +
> +       return source_ops(csdev)->resume_perf(csdev);
> +}
> +EXPORT_SYMBOL_GPL(coresight_resume_source);
> +
>  /*
>   * coresight_disable_path_from : Disable components in the given path beyond
>   * @nd in the list. If @nd is NULL, all the components, except the SOURCE are
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index 82644aff8d2b..2d9baa9d8228 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -249,5 +249,7 @@ void coresight_add_helper(struct coresight_device *csdev,
>  void coresight_set_percpu_sink(int cpu, struct coresight_device *csdev);
>  struct coresight_device *coresight_get_percpu_sink(int cpu);
>  void coresight_disable_source(struct coresight_device *csdev, void *data);
> +void coresight_pause_source(struct coresight_device *csdev);
> +int coresight_resume_source(struct coresight_device *csdev);
>
>  #endif
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index d79a242b271d..c95c72e07e02 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -398,6 +398,8 @@ struct coresight_ops_link {
>   *             is associated to.
>   * @enable:    enables tracing for a source.
>   * @disable:   disables tracing for a source.
> + * @resume_perf: resumes tracing for a source in perf session.
> + * @pause_perf:        pauses tracing for a source in perf session.
>   */
>  struct coresight_ops_source {
>         int (*cpu_id)(struct coresight_device *csdev);
> @@ -405,6 +407,8 @@ struct coresight_ops_source {
>                       enum cs_mode mode, struct coresight_path *path);
>         void (*disable)(struct coresight_device *csdev,
>                         struct perf_event *event);
> +       int (*resume_perf)(struct coresight_device *csdev);
> +       void (*pause_perf)(struct coresight_device *csdev);
>  };
>
>  /**
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

