Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B24ACF3185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 09:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DiKyAko1CiKmjIm1YZo69KyzTEMTjrDMipirUCdeTOs=; b=hsEL4jMp7mWYxWZf5LQ2uvebfC
	A34xlmlynFF0P/u+mk1c6BX/KanyOd48lRobaeBYalZ2rmbjER6w2bUnofjvmTqAMqMGraZYYXHtb
	Npj+jpaOEHgUMz8QMt65eeULnOQ6KE5ttYSiSbHvFDssbpxwPU4qDWeFUYTo1irD6gPb+/joDkjmQ
	A9jiUEiDw+lG/6/WiAvGYVt7H2wWanUCbGeORfrOuoz2OeG17zDrGUPo5UYlYuEzIGQdn/mgz+xvD
	R8LyRf0r7pn6UgSdxXrG7c3C+jumgKCbA4YKfanfnhRtirxz3oJPbW3YW+TO/Qz4xIs8Yx314SAbF
	J4woDnPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLeYk-00000002sDO-3bD4;
	Wed, 19 Nov 2025 09:33:06 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLeYh-00000002sCw-0zu7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 09:33:04 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-8b144ec3aa8so644191585a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 01:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763544781; x=1764149581; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DiKyAko1CiKmjIm1YZo69KyzTEMTjrDMipirUCdeTOs=;
        b=LUb0GEIL5jkBVVtl6ITBCx987tUovECSYcOfrDo1AHDaEDMlLGR61gIFQdAVwy0EG9
         LgupQkYhKaveyac2cATvJezcCwmA8aF4kgmuCTaXPFZOLXXfsAlXatkk0Gy5/kCQDOgj
         G9aSNEQdLb+zX6tmvoqa5tOgkJcVQVDH1KaWRcLKDuaeYK/P5e9E+0TMKMMvj4hK/cHO
         sL/Rrm//vi8WUJr267AObKaQlbFOY9QN5JpWIziJK5tOUcxL0Y1MESXpd7S+VPtBi2ry
         fShvDcmvGVktOlXEgJnyigwAD3vJEb+seZZaT/KXN2iidzqY47SIkNvCWWACrea8RueH
         tlsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763544781; x=1764149581;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DiKyAko1CiKmjIm1YZo69KyzTEMTjrDMipirUCdeTOs=;
        b=XnBiZae2BNtGQ92nJ5Xb5m1d3LBYx6vfZvjK6lsM5sdXaUY1L0ce/RaDsqn4m/hOMo
         PfuPGskWaZgaM0F7etxiqQ6B95rHWR64wz14e5Z74Nk+r482NghkS6G7UKUNfpaOH6TG
         Kgm7pSBSr70EMIe2Vqa9x3maivJaYEiRr6SJEHW2sriRA1vl94xFJwFsxbjAxGe8tQ2j
         C7RtunnG9keQQ1DKKdWpho2N9cqJqWnY2+Ufd0D/Pc2Orh+gi8oJ+Qv6O+a8jch7YFUO
         aYHCyavzfks/8RUxOZNbhX80bLpNRBWVzl+hckzQck31Wymp3KVz7sO/1WM99fK6ammn
         lhOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXc+cP2xY4NIrXoYAyJ6jhSPyJ72Gd66dqldr2oWO1Q3bqYizOkobiOZxNL/ootLZ40kh31p+Z3D0X5DUKOaaF+@lists.infradead.org
X-Gm-Message-State: AOJu0Yzjc9LUDjJg7b7qrkHUBDCVL231CYHUp88R7o4dOTidiQrlt6GB
	3OqXxnW5fuQNSA0S1NVtdHmeHvr3CW5nwhpfofDQOdQtChuIaXoxAqye/oXHVt1AsZwNGWqpV4m
	801rSSmNqAP+CqtlR0mM5kZr7q54RkNmr0fy0bibCKg==
X-Gm-Gg: ASbGncuKluMvZ5bedkkcjh9Xvjnj2H5pnQDlq0KLTdCj2T7YJ6jbVJc3pOO6oFKUdOa
	AWFFqOSj3LSlc/OR3AXHE0OgFKcchGkqJTEpiZoipPcdJDTkJYpK/GxalkwaEQOCsCLcN4NLHNl
	2uGycZA8r228Xl1FtkRV9/unJgoWo7LgXrWM7npffnxrgzYMmG4K+oeUVGRw4v50R06JI287FCY
	ePee9pXEyJTQcfvEfAb4JrltFQ2yvSAARAF4ZTnFMDxJW6aAah/E11DdgKEhxLqz6/UTrTYZWDn
	ULndtVaPY7vpRztukL4kIsidz2G9jwS10urgyXZKGFIrmb1J/g==
X-Google-Smtp-Source: AGHT+IHXtmQob1b7Rs4cNBuYrALG5hGMqWQXnzmK+aNypH2iP2VuDHlxsl2YjI4dIm1Td/krkHWR6B7QIhb7w94VNog=
X-Received: by 2002:a05:620a:7103:b0:8b2:e704:5626 with SMTP id
 af79cd13be357-8b31701c1c9mr296607785a.38.1763544781519; Wed, 19 Nov 2025
 01:33:01 -0800 (PST)
MIME-Version: 1.0
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org> <20251118-james-cs-syncfreq-v5-8-82efd7b1a751@linaro.org>
In-Reply-To: <20251118-james-cs-syncfreq-v5-8-82efd7b1a751@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 19 Nov 2025 09:32:50 +0000
X-Gm-Features: AWmQ_blt4kfPQ_sXTgGskmfmHkLnOJSOj0nXDD6BuZsfj4XK6KdoYdmlWkDkB4M
Message-ID: <CAJ9a7VgQH4yc8490CQSv1S6k+=Uc6dEjyEpgRp1EwUQdwdxOHQ@mail.gmail.com>
Subject: Re: [PATCH v5 08/13] coresight: Interpret perf config with ATTR_CFG_GET_FLD()
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Leo Yan <leo.yan@arm.com>, Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_013303_313006_03D3C802 
X-CRM114-Status: GOOD (  23.81  )
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

Hi James

On Tue, 18 Nov 2025 at 16:28, James Clark <james.clark@linaro.org> wrote:
>
> The "config:" string construction in format_attr_contextid_show() can be
> removed because it either showed the existing context1 or context2
> formats which have already been generated, so can be called themselves.
>
> The other conversions are straightforward replacements.
>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-etm-perf.c | 26 +++++++++++++++---------
>  1 file changed, 16 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index 28f1bfc4579f..1b9ae832a576 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -80,12 +80,19 @@ static ssize_t format_attr_contextid_show(struct device *dev,
>                                           struct device_attribute *attr,
>                                           char *page)
>  {
> -       int pid_fmt = ETM_OPT_CTXTID;
> +       /*
> +        * is_kernel_in_hyp_mode() isn't defined in arm32 so avoid calling it
> +        * even though is_visible() prevents this function from being called.
> +        */
> +#if IS_ENABLED(CONFIG_ARM64)
> +       if (is_kernel_in_hyp_mode())
> +               return contextid2_show(dev, attr, page);
>
> -#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
> -       pid_fmt = is_kernel_in_hyp_mode() ? ETM_OPT_CTXTID2 : ETM_OPT_CTXTID;
> +       return contextid1_show(dev, attr, page);
> +#else
> +       WARN_ONCE(1, "ETM contextid not supported on arm32\n");
> +       return 0;

Context ID is supported in aarch32 - and traced in etmv3 / ptm and etmv4.

Mike

>  #endif
> -       return sprintf(page, "config:%d\n", pid_fmt);
>  }
>
>  static struct device_attribute format_attr_contextid =
> @@ -337,7 +344,7 @@ static bool sinks_compatible(struct coresight_device *a,
>  static void *etm_setup_aux(struct perf_event *event, void **pages,
>                            int nr_pages, bool overwrite)
>  {
> -       u32 id, cfg_hash;
> +       u32 sink_hash, cfg_hash;
>         int cpu = event->cpu;
>         cpumask_t *mask;
>         struct coresight_device *sink = NULL;
> @@ -350,13 +357,12 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>         INIT_WORK(&event_data->work, free_event_data);
>
>         /* First get the selected sink from user space. */
> -       if (event->attr.config2 & GENMASK_ULL(31, 0)) {
> -               id = (u32)event->attr.config2;
> -               sink = user_sink = coresight_get_sink_by_id(id);
> -       }
> +       sink_hash = ATTR_CFG_GET_FLD(&event->attr, sinkid);
> +       if (sink_hash)
> +               sink = user_sink = coresight_get_sink_by_id(sink_hash);
>
>         /* check if user wants a coresight configuration selected */
> -       cfg_hash = (u32)((event->attr.config2 & GENMASK_ULL(63, 32)) >> 32);
> +       cfg_hash = ATTR_CFG_GET_FLD(&event->attr, configid);
>         if (cfg_hash) {
>                 if (cscfg_activate_config(cfg_hash))
>                         goto err;
>
> --
> 2.34.1
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

