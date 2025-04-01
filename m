Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B62FC36014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 09:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DUtQE7nMd/6PSKoEtlC68hCAEgv6hCHzZZn6Ocd8nbQ=; b=RJm1AF9o7BruCBDnehxw0h1ll6
	aAdGvJz8m3BCO3hEs2UOhtCGBThYa2Btm3nZYmjjgPHDpo/o9RjVEcfwVp8/d0cWNFWAbf6tMJSqO
	vOrGgJSvfiPWUDskWC576t0CcUElsGl0/1BLDIXTscl3GnuBn2fnfTXsh30UsXoGjJ4ZiJ2Kg/4jB
	8YhE3wN/VUz57NyahGxO80SiQ0YyKlQeWjTkwnpOjbc6mGTnq6uYCbNdNunY3F2dz2r5NNFGX4dm7
	5VHZYHXFCcbJ2OCA/+Zps4L5l18FeZJpk3ke9r5pK1HqOYjEgYPFMzk87y0FgRiCDyDNpLD4GeGpx
	XK6cutjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzXXl-00000002PLJ-4C8a;
	Tue, 01 Apr 2025 09:04:26 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzXTD-00000002Obr-3m8N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 08:59:45 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-223fd89d036so112628105ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 01:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743497982; x=1744102782; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DUtQE7nMd/6PSKoEtlC68hCAEgv6hCHzZZn6Ocd8nbQ=;
        b=pg+wglvxxC7DzoiaeoJsb8PEup8f+i/M8sNlNGQE194qQMHAehoE6XKzLni1XQqjCI
         34KaKLbTZT1hnJdH8WkK40l48n3DEeDOgGX3aUeX2rIzWAWOUjshs4G7KWkFtp2ATIXg
         4ic/X9nChbXy/BQ+hN+7wbOJSQ2AssCAXU5JKltnWPAoN+kEjBkRnVIrZW5muKQ6zaKP
         PMOzDPTgvkosLGsELoExBKBu+us6vXRi6uoTjzRik7pU9S6pv5gdmEwAzquAXv76qVZg
         vBsLBU5kGs3WMwFoXwvN3AJOrDM9fqOsO730lUjyMoJu9tplW14toA5JgP60KMu8wwxh
         DVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743497982; x=1744102782;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DUtQE7nMd/6PSKoEtlC68hCAEgv6hCHzZZn6Ocd8nbQ=;
        b=jZp7mwAYt10i6e3m79igPF6ppIi04arF7KV0lqOmza9qnzdWn+mZ+dt/tS41gQBERD
         NG6FJUUR9UGk5V1w54WjXLQBrHddcjpiLTXB3dJj+k0gWkqOC0PGcNcWeEQQm6np8xoJ
         2EK83Tdp4J9QodV+lz7oFYs6/glKiAOKQc/AjpR83vv92Wlj+ztD8E5Vqjp8H+FP5zMM
         +fGGYtvwQCWdPJPxio3DO86LkwnXo25WZ/0MVMC/wEvqOPRnYZyD39TFglx1g3nGNKbT
         8az2Gy5TRl4Cli4E0mrKmk84mzsLHWaSn0ikQzv6UlQCd5198ZWUHGDgklSX/vSkIJN1
         NmcA==
X-Forwarded-Encrypted: i=1; AJvYcCUG4zmJJ/bbnUY2lMgwALrVJxNXClLKLqUa/iXCcUW4rphsG5C0EjCM5q8fwAh9rLjoCD4fZcIMvuWgPDHVvZf6@lists.infradead.org
X-Gm-Message-State: AOJu0Yy39q3Bxq7WwVhsJep2X1+JeIt0u5jSKbjIfRODCm/llVUKOJNo
	4g8bfhnjcuiXdFaNMwJwb0D8fF7p3m29IOKfiZg5Rvvsn87F9sRH6HH0N2eFn9QMFZTok08S4Ts
	6cRiKR5sipv/2Y6JCkQUIs4+VeqBBE2pgiSNNCQ==
X-Gm-Gg: ASbGnctk9EakPyWAjGijqbxHA6VXNRUxnlR+8hw5g0GvUsWpyMvOx9+RImcJi78Fus/
	tCMzB5+vYlm2EMl77u9f4PUFcDufzweemk7/niIP6PAeEyNEeHhcjOgwg7QPeLBvu9ScyN6jtPy
	E4vg40ASKG1z0nwJhFdnHLNdXXWqY=
X-Google-Smtp-Source: AGHT+IGzin6V0f0YGKy7Udk3aewjUGbBv6XmcP/DU6qB3LkeQJ2R2Z1zAebpSyapanvD2hTwAq7WiNaUzpcJ1/QKOno=
X-Received: by 2002:a05:6a00:853:b0:736:9fa2:bcbb with SMTP id
 d2e1a72fcca58-73980436cbamr19044549b3a.24.1743497982506; Tue, 01 Apr 2025
 01:59:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250311170451.611389-1-leo.yan@arm.com> <20250311170451.611389-2-leo.yan@arm.com>
In-Reply-To: <20250311170451.611389-2-leo.yan@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 1 Apr 2025 09:59:31 +0100
X-Gm-Features: AQ5f1JpICOn046XWir454LuVhWbevJeRSx1F27tfX6sfrfiP5_Zt2Y4Br9MlhyM
Message-ID: <CAJ9a7Vi7kkjqfTWkY1-KP-HZUNG-25sPCZqDf2_n5i_OagEDGw@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] coresight: etm4x: Extract the trace unit controlling
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Jonathan Corbet <corbet@lwn.net>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_015943_945909_44756A2A 
X-CRM114-Status: GOOD (  28.59  )
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
> The trace unit is controlled in the ETM hardware enabling and disabling.
> The sequential changes for support AUX pause and resume will reuse the
> same operations.
>
> Extract the operations in the etm4_{enable|disable}_trace_unit()
> functions.  A minor improvement in etm4_enable_trace_unit() is for
> returning the timeout error to callers.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  .../coresight/coresight-etm4x-core.c          | 103 +++++++++++-------
>  1 file changed, 62 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index e5972f16abff..53cb0569dbbf 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -431,6 +431,44 @@ static int etm4x_wait_status(struct csdev_access *csa, int pos, int val)
>         return coresight_timeout(csa, TRCSTATR, pos, val);
>  }
>
> +static int etm4_enable_trace_unit(struct etmv4_drvdata *drvdata)
> +{
> +       struct coresight_device *csdev = drvdata->csdev;
> +       struct device *etm_dev = &csdev->dev;
> +       struct csdev_access *csa = &csdev->access;
> +
> +       /*
> +        * ETE mandates that the TRCRSR is written to before
> +        * enabling it.
> +        */
> +       if (etm4x_is_ete(drvdata))
> +               etm4x_relaxed_write32(csa, TRCRSR_TA, TRCRSR);
> +
> +       etm4x_allow_trace(drvdata);
> +       /* Enable the trace unit */
> +       etm4x_relaxed_write32(csa, 1, TRCPRGCTLR);
> +
> +       /* Synchronize the register updates for sysreg access */
> +       if (!csa->io_mem)
> +               isb();
> +
> +       /* wait for TRCSTATR.IDLE to go back down to '0' */
> +       if (etm4x_wait_status(csa, TRCSTATR_IDLE_BIT, 0)) {
> +               dev_err(etm_dev,
> +                       "timeout while waiting for Idle Trace Status\n");
> +               return -ETIME;
> +       }
> +
> +       /*
> +        * As recommended by section 4.3.7 ("Synchronization when using the
> +        * memory-mapped interface") of ARM IHI 0064D
> +        */
> +       dsb(sy);
> +       isb();
> +
> +       return 0;
> +}
> +
>  static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>  {
>         int i, rc;
> @@ -539,33 +577,7 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>                 etm4x_relaxed_write32(csa, trcpdcr | TRCPDCR_PU, TRCPDCR);
>         }
>
> -       /*
> -        * ETE mandates that the TRCRSR is written to before
> -        * enabling it.
> -        */
> -       if (etm4x_is_ete(drvdata))
> -               etm4x_relaxed_write32(csa, TRCRSR_TA, TRCRSR);
> -
> -       etm4x_allow_trace(drvdata);
> -       /* Enable the trace unit */
> -       etm4x_relaxed_write32(csa, 1, TRCPRGCTLR);
> -
> -       /* Synchronize the register updates for sysreg access */
> -       if (!csa->io_mem)
> -               isb();
> -
> -       /* wait for TRCSTATR.IDLE to go back down to '0' */
> -       if (etm4x_wait_status(csa, TRCSTATR_IDLE_BIT, 0))
> -               dev_err(etm_dev,
> -                       "timeout while waiting for Idle Trace Status\n");
> -
> -       /*
> -        * As recommended by section 4.3.7 ("Synchronization when using the
> -        * memory-mapped interface") of ARM IHI 0064D
> -        */
> -       dsb(sy);
> -       isb();
> -
> +       rc = etm4_enable_trace_unit(drvdata);
>  done:
>         etm4_cs_lock(drvdata, csa);
>
> @@ -884,25 +896,12 @@ static int etm4_enable(struct coresight_device *csdev, struct perf_event *event,
>         return ret;
>  }
>
> -static void etm4_disable_hw(void *info)
> +static void etm4_disable_trace_unit(struct etmv4_drvdata *drvdata)
>  {
>         u32 control;
> -       struct etmv4_drvdata *drvdata = info;
> -       struct etmv4_config *config = &drvdata->config;
>         struct coresight_device *csdev = drvdata->csdev;
>         struct device *etm_dev = &csdev->dev;
>         struct csdev_access *csa = &csdev->access;
> -       int i;
> -
> -       etm4_cs_unlock(drvdata, csa);
> -       etm4_disable_arch_specific(drvdata);
> -
> -       if (!drvdata->skip_power_up) {
> -               /* power can be removed from the trace unit now */
> -               control = etm4x_relaxed_read32(csa, TRCPDCR);
> -               control &= ~TRCPDCR_PU;
> -               etm4x_relaxed_write32(csa, control, TRCPDCR);
> -       }
>
>         control = etm4x_relaxed_read32(csa, TRCPRGCTLR);
>
> @@ -943,6 +942,28 @@ static void etm4_disable_hw(void *info)
>          * of ARM IHI 0064H.b.
>          */
>         isb();
> +}
> +
> +static void etm4_disable_hw(void *info)
> +{
> +       u32 control;
> +       struct etmv4_drvdata *drvdata = info;
> +       struct etmv4_config *config = &drvdata->config;
> +       struct coresight_device *csdev = drvdata->csdev;
> +       struct csdev_access *csa = &csdev->access;
> +       int i;
> +
> +       etm4_cs_unlock(drvdata, csa);
> +       etm4_disable_arch_specific(drvdata);
> +
> +       if (!drvdata->skip_power_up) {
> +               /* power can be removed from the trace unit now */
> +               control = etm4x_relaxed_read32(csa, TRCPDCR);
> +               control &= ~TRCPDCR_PU;
> +               etm4x_relaxed_write32(csa, control, TRCPDCR);
> +       }
> +
> +       etm4_disable_trace_unit(drvdata);
>
>         /* read the status of the single shot comparators */
>         for (i = 0; i < drvdata->nr_ss_cmp; i++) {
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike;leach@linaro.org>
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

