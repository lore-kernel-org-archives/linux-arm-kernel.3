Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C6BCF887B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 16:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NC66yCYtByGbmL0G9T+1ZptR//0cP5kWdBfOjIW3o4k=; b=JrS6UIH6gwIHhSFlZ2RgS8GQCF
	VS1qOW4P2ul2wbzrN/MkQFyKiEcc+S4ipkUX1lmNwN+/ErWyxCcBZ4cuZoOhof9Lh2zhocSbseHku
	6RmldAI4qY6No79J3A2IkhMYdm+zGJFxDu6c7tudEiKgMw8eFbHLeCmrf4Vznn0hXNLtjUODdxWc0
	hseM5eTL3Q+/lgyO2wtFugB2wOUUE79MC61ebk5uTbFwgGJkgFdyEBdi+dXy4P+2MaIxcxKYeRUGX
	MDUkv8HI0YqX6tNARujog8nSCt2SvDDMfPVugN6C4W187AlWSbVqVK3o8sqqbSBCA1P8BEDZT3hwH
	TCsZRyQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7FW-00000006yiA-1NxH;
	Thu, 20 Nov 2025 16:11:10 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7FR-00000006yhV-4AzL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 16:11:08 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-8b2627269d5so93533185a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 08:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763655065; x=1764259865; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NC66yCYtByGbmL0G9T+1ZptR//0cP5kWdBfOjIW3o4k=;
        b=wFcYZd7Ni1R5cyME3XpNjQeZDmOo3sYxaQB97ORYHfSNw4OS3CtIHA+JAUcQoRW00b
         JWENHeAndTBM+Rk7hqayPDqrov5bYhS6UVJwiza8vQALJwTX55k515/NwagORsNFyAd8
         D2NIU/SIMcUX7epYB+GuoNsQHHJIZpky91cSFHt/GV7Q7ta1h7nnGiKMcdnVwPV3got1
         /SmeDfPgpTdt3ArSKzJ4jwxDIPWvSPxjJB/5Jdqv4tUYDpdKz6k3nUT7udGlNd+RIvIz
         Y8bYrklOX0O7TFOrbmnxlQW48N0VhEQvWBfG6et8XtgdDZlUg+R6rMVtUtRTcIfA94LD
         d9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763655065; x=1764259865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NC66yCYtByGbmL0G9T+1ZptR//0cP5kWdBfOjIW3o4k=;
        b=DuCLprkAvoLWkc8XDQzi990WIlveCiMNiUqBrYd8WTaFdnrFO8/W0TQ5/O9fP4WaRw
         Ph1X8pDvHDZBy9yqa8FerbXG0wgwZnSaOolPqZtz6U/IbjaHHXZRyGWwxcx921sbYXAQ
         SCTmOH6qrB82pwXEljqvZ8D69qBgEInTHUGUI08Gje1gMqcyEPb1XOkGowcKwjB1S0U0
         Z713zQsDgoEKa+6q7Du2A49s8OKsK3JN2KeRe0sFjGTUdRKSIJ5NzlllCwuZEYBM4iej
         e14uAc15qXhlyzDVZ8ZPuchWaTitKmb1eFYaK3wpT++k++dmcyjDAIu2Q4lRkmsPfG0I
         EMQg==
X-Forwarded-Encrypted: i=1; AJvYcCVhXo+Ll+daKH02XngDkuAUK6d0A266ExYSJkEeKxs38rzKgxEyZPnDis3dMuQD/WYkST89PL839lNAjWfYGbtO@lists.infradead.org
X-Gm-Message-State: AOJu0YxtJc9dejN26f2nUbs3sNAHvmaEd/47eAw0FkOz4UwpZePfffnq
	12/iYFaAiavz8RTDztNvN1aftXNwUTtrB8So3n/cFYezFHVBnfPZ/CF8XYsLc0N3XvFt0i/G4rv
	KQ/o2KQAtI1GApCVFGZYKm58U4FiVI5iInovDnxGCmw==
X-Gm-Gg: ASbGncuzuqTkZB07AHL/VrbCEkwfm+9AFw2rUq7hQHe+cqKtiAAqqcBM9pmw8GPqEi7
	cTkGGUp3KZm3tIEW5ktpa077c7c9q4l7b01LDn7KwgBXBsGQeEhrWoN8/L/jNzh25qQJz/vV0wK
	+RwfYurr9/l5g8elUZ2w+YXRJyhLloPIStEJoBoE8d0IRYhNVd1RjEIZm8bTWPB+A54/k7GNbza
	1xR+P+t0D05CMtAzSe4oBNNcRO5ooso7c8dF80EctpkzUFbPjmxJN22WKuRtSfzsQ2bJW9Jy0Nb
	W6fQhNx71bUw8NfzTMoH6Zgrv2bn
X-Google-Smtp-Source: AGHT+IFAsL9ZZ5dsE+7OqtUWMt8jK/zT02YmKKSJb2s7WZOEZz24NLjndXe9DfyQ9/pPQenldO5JJZKGTRYBSMu4/RM=
X-Received: by 2002:a05:620a:461f:b0:8b2:f371:5601 with SMTP id
 af79cd13be357-8b33875e6c2mr10281785a.50.1763655064662; Thu, 20 Nov 2025
 08:11:04 -0800 (PST)
MIME-Version: 1.0
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org> <20251118-james-cs-syncfreq-v5-9-82efd7b1a751@linaro.org>
In-Reply-To: <20251118-james-cs-syncfreq-v5-9-82efd7b1a751@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 20 Nov 2025 16:10:53 +0000
X-Gm-Features: AWmQ_bndk5MrqOE3hlPSMYIUdZZipVhGm5EA_jJg6IcLxzkgaOf2Jf_Wcx9wb7Y
Message-ID: <CAJ9a7ViUiifOwnzO+AoP4MY-TuEtMwwrVAxnYSiMjr+ez0c-Ag@mail.gmail.com>
Subject: Re: [PATCH v5 09/13] coresight: Interpret ETMv4 config with ATTR_CFG_GET_FLD()
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Leo Yan <leo.yan@arm.com>, Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_081106_061521_CCA29309 
X-CRM114-Status: GOOD (  27.55  )
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

On Tue, 18 Nov 2025 at 16:28, James Clark <james.clark@linaro.org> wrote:
>
> Remove hard coded bitfield extractions and shifts and replace with
> ATTR_CFG_GET_FLD().
>
> ETM4_CFG_BIT_BB was defined to give the register bit positions to
> userspace, TRCCONFIGR_BB should be used in the kernel so replace it.
>
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 44 ++++++++++------------
>  1 file changed, 19 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 5d21af346799..c7208ffc9432 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -29,6 +29,7 @@
>  #include <linux/seq_file.h>
>  #include <linux/uaccess.h>
>  #include <linux/perf_event.h>
> +#include <linux/perf/arm_pmu.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/property.h>
> @@ -780,17 +781,17 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>                 goto out;
>
>         /* Go from generic option to ETMv4 specifics */
> -       if (attr->config & BIT(ETM_OPT_CYCACC)) {
> +       if (ATTR_CFG_GET_FLD(attr, cycacc)) {
>                 config->cfg |= TRCCONFIGR_CCI;
>                 /* TRM: Must program this for cycacc to work */
> -               cc_threshold = attr->config3 & ETM_CYC_THRESHOLD_MASK;
> +               cc_threshold = ATTR_CFG_GET_FLD(attr, cc_threshold);
>                 if (!cc_threshold)
>                         cc_threshold = ETM_CYC_THRESHOLD_DEFAULT;
>                 if (cc_threshold < drvdata->ccitmin)
>                         cc_threshold = drvdata->ccitmin;
>                 config->ccctlr = cc_threshold;
>         }
> -       if (attr->config & BIT(ETM_OPT_TS)) {
> +       if (ATTR_CFG_GET_FLD(attr, timestamp)) {
>                 /*
>                  * Configure timestamps to be emitted at regular intervals in
>                  * order to correlate instructions executed on different CPUs
> @@ -810,17 +811,17 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>         }
>
>         /* Only trace contextID when runs in root PID namespace */
> -       if ((attr->config & BIT(ETM_OPT_CTXTID)) &&
> +       if (ATTR_CFG_GET_FLD(attr, contextid1) &&
>             task_is_in_init_pid_ns(current))
>                 /* bit[6], Context ID tracing bit */
>                 config->cfg |= TRCCONFIGR_CID;
>
>         /*
> -        * If set bit ETM_OPT_CTXTID2 in perf config, this asks to trace VMID
> -        * for recording CONTEXTIDR_EL2.  Do not enable VMID tracing if the
> -        * kernel is not running in EL2.
> +        * If set bit contextid2 in perf config, this asks to trace VMID for
> +        * recording CONTEXTIDR_EL2.  Do not enable VMID tracing if the kernel
> +        * is not running in EL2.
>          */
> -       if (attr->config & BIT(ETM_OPT_CTXTID2)) {
> +       if (ATTR_CFG_GET_FLD(attr, contextid2)) {
>                 if (!is_kernel_in_hyp_mode()) {
>                         ret = -EINVAL;
>                         goto out;
> @@ -831,26 +832,22 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>         }
>
>         /* return stack - enable if selected and supported */
> -       if ((attr->config & BIT(ETM_OPT_RETSTK)) && drvdata->retstack)
> +       if (ATTR_CFG_GET_FLD(attr, retstack) && drvdata->retstack)
>                 /* bit[12], Return stack enable bit */
>                 config->cfg |= TRCCONFIGR_RS;
>
>         /*
> -        * Set any selected configuration and preset.
> -        *
> -        * This extracts the values of PMU_FORMAT_ATTR(configid) and PMU_FORMAT_ATTR(preset)
> -        * in the perf attributes defined in coresight-etm-perf.c.
> -        * configid uses bits 63:32 of attr->config2, preset uses bits 3:0 of attr->config.
> -        * A zero configid means no configuration active, preset = 0 means no preset selected.
> +        * Set any selected configuration and preset. A zero configid means no
> +        * configuration active, preset = 0 means no preset selected.
>          */
> -       if (attr->config2 & GENMASK_ULL(63, 32)) {
> -               cfg_hash = (u32)(attr->config2 >> 32);
> -               preset = attr->config & 0xF;
> +       cfg_hash = ATTR_CFG_GET_FLD(attr, configid);
> +       if (cfg_hash) {
> +               preset = ATTR_CFG_GET_FLD(attr, preset);
>                 ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
>         }
>
>         /* branch broadcast - enable if selected and supported */
> -       if (attr->config & BIT(ETM_OPT_BRANCH_BROADCAST)) {
> +       if (ATTR_CFG_GET_FLD(attr, branch_broadcast)) {
>                 if (!drvdata->trcbb) {
>                         /*
>                          * Missing BB support could cause silent decode errors
> @@ -859,7 +856,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>                         ret = -EINVAL;
>                         goto out;
>                 } else {
> -                       config->cfg |= BIT(ETM4_CFG_BIT_BB);
> +                       config->cfg |= TRCCONFIGR_BB;
>                 }
>         }
>
> @@ -1083,11 +1080,8 @@ static int etm4_disable_perf(struct coresight_device *csdev,
>                 return -EINVAL;
>
>         etm4_disable_hw(drvdata);
> -       /*
> -        * The config_id occupies bits 63:32 of the config2 perf event attr
> -        * field. If this is non-zero then we will have enabled a config.
> -        */
> -       if (attr->config2 & GENMASK_ULL(63, 32))
> +       /* If configid is non-zero then we will have enabled a config. */
> +       if (ATTR_CFG_GET_FLD(attr, configid))
>                 cscfg_csdev_disable_active_config(csdev);
>
>         /*
>
> --
> 2.34.1
>
Reviewed-by: Mike Leach  <mike.leach@linaro.org>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

