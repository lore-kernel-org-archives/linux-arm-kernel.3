Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42591CF31AF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 11:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ed4Dydxg4iY705zW5b/jYW5HOtHMKCF/y5HtYetJu1Q=; b=qyrBuupJHQQCsw8/eNgUjHdHXj
	M5mEBqdwe13KiHCtTQWgmvFvniKtJJUi0U/qTBtcGfX/ovftiFlJq5KuwTrxuPeuwI4ICKS5Ip/IQ
	hOKjwxT2tOnILcDNSxGg7U3Zazow7ZbqRm7Tq0FZ3ZLZ4aPoBeiD3jCK6t2g2q2c2653Pr19itnqG
	2gDetqMq2gnhprs5zflu3RbAerB1RnDsN/Qr0qoFmQMylqMokE4kzM9o8FenT81oGX5l3t9nM+6pZ
	RS12b+lwaimonKpK2anMee3mIWBuuK+4FCMfrHaxySTWpIFX1Tks1JQ806yTzEdFxjCBPz0GUlge4
	JT1DWKGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLgcp-000000033wp-3cfm;
	Wed, 19 Nov 2025 11:45:27 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLgcn-000000033wQ-1AD9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 11:45:26 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-8b25ed53fcbso866720785a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 03:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763552724; x=1764157524; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ed4Dydxg4iY705zW5b/jYW5HOtHMKCF/y5HtYetJu1Q=;
        b=kPiIsSRVmUdQkOT4xLDEU/Z2WD99UmHQAcLj5O3YKFoPKr05jApqMjjyYCaYxS4FKJ
         YTEhdgWhwYWFMTz9hvS1aIFwCMvuXL267MP4/zdUzfGazw2KKiP3pFT7EOMImnxs0HNe
         hZ1JKaRJqzDbhTUefKeu5M0YFPJu675BEdi1KM6zID+in+w2RvsI7sBxiwX6kiupKJTh
         C1vzXsJeqMD71b4GcIhQlixbnzxe2XNvfInjNQZZFjbTTM0/GqHJcjZH40BSUDhHjw7G
         p/CBEOtoA+iLyPJ7ycaLBUOaC83NXhuDlwKOHBrdvA6KTcEfzeCzoGJp6stYEgDHiqsa
         Y/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763552724; x=1764157524;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ed4Dydxg4iY705zW5b/jYW5HOtHMKCF/y5HtYetJu1Q=;
        b=cNxjaEbgaUiAR79GoPtCtNRdAqBOQXVqtJkydcik9Pdov1HNiBJQged2nKXrePMgKH
         5Aj2nIwDBwD88tAQfuOoOx77zBUl+okxY7OHQG1he8Skuw/Te51s4DfCIKYqEH8dmB+0
         76VmUQHL3RZ3LLbd0aipauT87zCv+3UcIWtFiP2ClOTcetYltmq06sUGMH31LFc4w8Hn
         esrQxP3sg2i13i+nEJb8MEBjH2qryEbL3LN3nCBmHF0V4aV6UTOLx+CnEHpYQ/frnweQ
         mGSJJDjJrGBtT2UocbTWZ++dAOTMO7cceurE5O6ERIDe2pLQ1cq83frD2LD619JX+eld
         m3BQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEUHs/AbMIe+tu+ZdGEgFu6tMaXsvj+VZ6uHra3ED1gJqNpumEWM3FlK4B/zHmGBtw0p9+9DUbvEo1Fp/0aPp9@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ9NR3dDBXM47s92DNoV88WpWaLl8ebjRslJKqIInTSxWv564Q
	zNhm6Rpe5ZUQfce/zWRxEg5UG/J2TuIGIfR2k7ihnr9OLipYWzUESPaEet6zW0aFmHyTva8SEYB
	1RjAT+0EKuHmx6/bfzXPonFm+Oj0RaCRVIC5AEDtEgw==
X-Gm-Gg: ASbGncsKIuZe1YN7BwyTmaMG+FJaQ6YOj4IX+Ah1J8VLAkaVLRiRQb57u+o4k+e6/Y2
	gyl2Hc/bET9pVu5Lrn2Rf/fPkkq96xrIWPq6h1gEWtWMwHQZooiLo/DkjK9fGWFz2tQovwVTOLJ
	ksSbG2zNqoPep71CRcimkuzs8S3iGQzgZzlXgaDbrsJYfZU99x8t1ZKaettnKsguH7TJfaGHB5I
	niyXfxTCIfssoBFCCnJ28pMD2fEE4NRaJbtfj/W0VvwEQN2nl8ncCsw2uMY08LEa3+B/OIjoAOU
	rSNqh0g5RuEBXdmCZ2d25bprPClINjM/2CbaZIyyU4SydXn5lA==
X-Google-Smtp-Source: AGHT+IEDXViXTZ73FVo6/KsQ3F595W6URZvEq6U8EMaBp6NQP2CAzPlJ77FmXdspCIEOO9KZ/cgPukGFikDQSyW8kSc=
X-Received: by 2002:a05:622a:7e49:b0:4ee:5fc:43d8 with SMTP id
 d75a77b69052e-4ee05fc4b20mr149384621cf.21.1763552723829; Wed, 19 Nov 2025
 03:45:23 -0800 (PST)
MIME-Version: 1.0
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
 <20251118-james-cs-syncfreq-v5-8-82efd7b1a751@linaro.org> <CAJ9a7VgQH4yc8490CQSv1S6k+=Uc6dEjyEpgRp1EwUQdwdxOHQ@mail.gmail.com>
 <416cf32d-d647-46dd-bcef-acc019490561@linaro.org>
In-Reply-To: <416cf32d-d647-46dd-bcef-acc019490561@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 19 Nov 2025 11:45:12 +0000
X-Gm-Features: AWmQ_bnzSRG4iB6fbtTwoZEOZ8nJyrsroAOJ3GpmuRTr0m-QQvY3mph-2fZSpwo
Message-ID: <CAJ9a7Vg9HsMsTP-zroTgaaKWTPkSXE1u5WMORuqMLKSDDz2HSw@mail.gmail.com>
Subject: Re: [PATCH v5 08/13] coresight: Interpret perf config with ATTR_CFG_GET_FLD()
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Leo Yan <leo.yan@arm.com>, Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_034525_358070_E2F15622 
X-CRM114-Status: GOOD (  30.72  )
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

On Wed, 19 Nov 2025 at 11:26, James Clark <james.clark@linaro.org> wrote:
>
>
>
> On 19/11/2025 9:32 am, Mike Leach wrote:
> > Hi James
> >
> > On Tue, 18 Nov 2025 at 16:28, James Clark <james.clark@linaro.org> wrote:
> >>
> >> The "config:" string construction in format_attr_contextid_show() can be
> >> removed because it either showed the existing context1 or context2
> >> formats which have already been generated, so can be called themselves.
> >>
> >> The other conversions are straightforward replacements.
> >>
> >> Signed-off-by: James Clark <james.clark@linaro.org>
> >> ---
> >>   drivers/hwtracing/coresight/coresight-etm-perf.c | 26 +++++++++++++++---------
> >>   1 file changed, 16 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> >> index 28f1bfc4579f..1b9ae832a576 100644
> >> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> >> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> >> @@ -80,12 +80,19 @@ static ssize_t format_attr_contextid_show(struct device *dev,
> >>                                            struct device_attribute *attr,
> >>                                            char *page)
> >>   {
> >> -       int pid_fmt = ETM_OPT_CTXTID;
> >> +       /*
> >> +        * is_kernel_in_hyp_mode() isn't defined in arm32 so avoid calling it
> >> +        * even though is_visible() prevents this function from being called.
> >> +        */
> >> +#if IS_ENABLED(CONFIG_ARM64)
> >> +       if (is_kernel_in_hyp_mode())
> >> +               return contextid2_show(dev, attr, page);
> >>
> >> -#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
> >> -       pid_fmt = is_kernel_in_hyp_mode() ? ETM_OPT_CTXTID2 : ETM_OPT_CTXTID;
> >> +       return contextid1_show(dev, attr, page);
> >> +#else
> >> +       WARN_ONCE(1, "ETM contextid not supported on arm32\n");
> >> +       return 0;
> >
> > Context ID is supported in aarch32 - and traced in etmv3 / ptm and etmv4.
> >
> > Mike
> >
>
> Not in Perf mode unless I'm missing something:
>
> #define ETM3X_SUPPORTED_OPTIONS (ETMCR_CYC_ACC | \
>                                  ETMCR_TIMESTAMP_EN | \
>                                  ETMCR_RETURN_STACK)
>
> Only these options are currently accepted. I suppose the comment is
> describing what the current behavior is, whether that is what we want is
> another thing.
>
> But if we do start supporting context ID in ETMv3 we can update that
> comment.
>

Unlikely - but the comment seems to conflate core architecture and etm
architecture.
A core with aarch32 can be traced in etm4 - i.e etm4 supports A64, A32
and T32 instruction sets.
If this set gets another version it might be worth saying "not
ETMv3/PTM" rather than not A32.

Mike


> >>   #endif
> >> -       return sprintf(page, "config:%d\n", pid_fmt);
> >>   }
> >>
> >>   static struct device_attribute format_attr_contextid =
> >> @@ -337,7 +344,7 @@ static bool sinks_compatible(struct coresight_device *a,
> >>   static void *etm_setup_aux(struct perf_event *event, void **pages,
> >>                             int nr_pages, bool overwrite)
> >>   {
> >> -       u32 id, cfg_hash;
> >> +       u32 sink_hash, cfg_hash;
> >>          int cpu = event->cpu;
> >>          cpumask_t *mask;
> >>          struct coresight_device *sink = NULL;
> >> @@ -350,13 +357,12 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
> >>          INIT_WORK(&event_data->work, free_event_data);
> >>
> >>          /* First get the selected sink from user space. */
> >> -       if (event->attr.config2 & GENMASK_ULL(31, 0)) {
> >> -               id = (u32)event->attr.config2;
> >> -               sink = user_sink = coresight_get_sink_by_id(id);
> >> -       }
> >> +       sink_hash = ATTR_CFG_GET_FLD(&event->attr, sinkid);
> >> +       if (sink_hash)
> >> +               sink = user_sink = coresight_get_sink_by_id(sink_hash);
> >>
> >>          /* check if user wants a coresight configuration selected */
> >> -       cfg_hash = (u32)((event->attr.config2 & GENMASK_ULL(63, 32)) >> 32);
> >> +       cfg_hash = ATTR_CFG_GET_FLD(&event->attr, configid);
> >>          if (cfg_hash) {
> >>                  if (cscfg_activate_config(cfg_hash))
> >>                          goto err;
> >>
> >> --
> >> 2.34.1
> >>
> >
> >
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

