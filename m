Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30669CF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 15:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xKzMiSJJ52R4a8UwUG3jpi8BLyMUSMJY3DIfmEVvyjA=; b=Q6MSmQTwBBQ/5IQP1QYs3aUjov
	KAgP/TRWvMUjhK+LD21lBnkt8Wuio7AEagcGC2Tbkmf7l/IOzPyyLIPJjJRi2BRXVXBwEOpdh8Sq1
	eUzBfgZDPeO51i6hhqxOyAcuCr12/3Qo8iQj1Qf0YZV7rMtH/OPiTC9avX3jUya1Rc1cUj7Pn0mk9
	SJLeo4kfTeLKg+ornz59kyejMk6WxjNHhMtEI0CMtJthTD2GriXabuD8Sof1/Snc7yIoSIhpvVCZc
	CuzpBcPeoShZ28S676CmmSSpUUymRsEKhKYFZX8ucgziWgR0mF8UPI6U/7AOH3CiZTy3jajbk81BM
	cV4w1gtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM74E-00000006xgo-34HJ;
	Thu, 20 Nov 2025 15:59:30 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM74C-00000006xgK-0Ybu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 15:59:29 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-8b2dec4d115so96082885a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 07:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763654367; x=1764259167; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xKzMiSJJ52R4a8UwUG3jpi8BLyMUSMJY3DIfmEVvyjA=;
        b=XD+BWd9JrpYXiAwIA8pOwOd2Tmb+7c0g3NsedILzRmSYpUBt+9n8tTYJiQQ8XtSdnQ
         I/CyuaxHnSeBT10IaddzaDs6ULmElf7wto4AgsCnqkLExyDhuZAIx/Mbv6PFMmddZ+Ol
         h+Syxs81ML3j0F8PCzD+Uqs/G/csITZnsWkYgOm05zdHR0pXGrOxmisxQhmp1eQ35+Ty
         1UpBD0TU1a5PTDSa1HOfOoFx49cbeZjBe574lya3w5MksmvSyeNGE1xfbg8DAxRfAP8S
         u8iagbgQXeIT8PFRYMK1XEG7lObMDPSj8CPi8PCK1YQwmUlq4QmKDuWIYhaTLLLI1RP0
         yHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763654367; x=1764259167;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKzMiSJJ52R4a8UwUG3jpi8BLyMUSMJY3DIfmEVvyjA=;
        b=i9uP4h2mYrhlQDZXGXq5Ou6ARcYHKUo2/oEbPKZgl17w3+a3gsXZRwnXYmk5BHUEUP
         YMxrJNsB2v2ljOIsbGcHNFbhNFl+PcrM8eQ2Zfgrkg7kOktaH33mZ830tDILZeh2WuO0
         4YPlFjAyQXu8n9WNBSCzKKpQayjEl8Qur4hpLbQ+9BWOf0hJFKIR7/kZI3K8FhHOV7fK
         DDdvkW/t5KM135bbGiFyMvin1gs44dtPlNOzarc07gnWZ9CPWNQJbcOImMkcqJtzJcWq
         EW68SkLFWS3gqZgoBiY/b1FTsZ8HbgvXbk4ZP0dvqi3Y9AzAjhaRyD4XrdWdWVBBjv/s
         n/xw==
X-Forwarded-Encrypted: i=1; AJvYcCUtD04r3i7ayNJu5SCzqu4E6fP8C0rDMOT096UjVBcv9ie3OVH9ofCVh9c5KoDafMRH9yNqTSq3dpmdK9x/rrSA@lists.infradead.org
X-Gm-Message-State: AOJu0YyaFOVCwKXPTkF2hHmShvZ82UDxPCFTMtP2mHi4nnkTcCSUwpRn
	pxJMJveJMaVS66oJLFNTMbTg3SvFB8ADe4plP3iREgqSY52UyoQ3lPd5AA+jdoW5efDvgZJTVJU
	VpxditkpVoHa0vLJ3ydp/HonlXDORsIcSCMmmEbOy9g==
X-Gm-Gg: ASbGncsx/wBf56gS24ct9WpgRBlLEd6/D7nBqgedt6yDoFQjZMgQdMm0vPQI7F7911w
	4uJtwUnFu+bfop42Z+5vdy6UOlApGA3QdsQW9HJOn8oBNpfbLq94EeKmrGdOfWLACeq56RDml4n
	jmNkggIY9opKPRP3jtYoDm2n/oxjLEm4PigZ2csuoPbqllYosr64OQQOm7sC/bLh9ZksJY7NlkF
	oWbjRLgd8a1PM9+gRsUuy2EKY6AvFX0TISvrxXGssfwu8BEdXGgV/qD+39r4B4uo/4tlk11C1oa
	fwRFD1dq/d/YFOWzZmbmIfoA+Nsr
X-Google-Smtp-Source: AGHT+IGBoIJQSOQgcFp7Q1w/IaRvFFn+9jbL6qZVEjA9+AYRXy4BoOTsXOneNoHjHiJmtw4UqdIs4V4vVcNg1bZnDzk=
X-Received: by 2002:a05:620a:4095:b0:8b1:fde4:59ee with SMTP id
 af79cd13be357-8b3274b5b75mr477062385a.85.1763654366737; Thu, 20 Nov 2025
 07:59:26 -0800 (PST)
MIME-Version: 1.0
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org> <20251118-james-cs-syncfreq-v5-5-82efd7b1a751@linaro.org>
In-Reply-To: <20251118-james-cs-syncfreq-v5-5-82efd7b1a751@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 20 Nov 2025 15:59:15 +0000
X-Gm-Features: AWmQ_bk67t0Rxh3fHd1PdSZQTAaW2NpP3v1ZIeR9WE8KZhxBSYLhvS_chL6Uylc
Message-ID: <CAJ9a7VjYQGzchv9z1Pypv1VtkMmZM99xi2eX4wdc-WksNPXB1g@mail.gmail.com>
Subject: Re: [PATCH v5 05/13] coresight: Define format attributes with GEN_PMU_FORMAT_ATTR()
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Leo Yan <leo.yan@arm.com>, Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_075928_197589_5B8F76AD 
X-CRM114-Status: GOOD (  19.32  )
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
> This allows us to define and consume them in a unified way in later
> commits.
>
> A lot of the existing code has open coded bit shifts or direct usage of
> whole config values which is error prone and hides which bits are in use
> and which are free.
>
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-etm-perf.c | 22 ++++++++---------
>  drivers/hwtracing/coresight/coresight-etm-perf.h | 31 ++++++++++++++++++++++++
>  2 files changed, 42 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index faebd7822a77..28f1bfc4579f 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -13,6 +13,7 @@
>  #include <linux/mm.h>
>  #include <linux/init.h>
>  #include <linux/perf_event.h>
> +#include <linux/perf/arm_pmu.h>
>  #include <linux/percpu-defs.h>
>  #include <linux/slab.h>
>  #include <linux/stringhash.h>
> @@ -54,22 +55,21 @@ static DEFINE_PER_CPU(struct coresight_device *, csdev_src);
>   * The PMU formats were orignally for ETMv3.5/PTM's ETMCR 'config';
>   * now take them as general formats and apply on all ETMs.
>   */
> -PMU_FORMAT_ATTR(branch_broadcast, "config:"__stringify(ETM_OPT_BRANCH_BROADCAST));
> -PMU_FORMAT_ATTR(cycacc,                "config:" __stringify(ETM_OPT_CYCACC));
> +GEN_PMU_FORMAT_ATTR(branch_broadcast);
> +GEN_PMU_FORMAT_ATTR(cycacc);
>  /* contextid1 enables tracing CONTEXTIDR_EL1 for ETMv4 */
> -PMU_FORMAT_ATTR(contextid1,    "config:" __stringify(ETM_OPT_CTXTID));
> +GEN_PMU_FORMAT_ATTR(contextid1);
>  /* contextid2 enables tracing CONTEXTIDR_EL2 for ETMv4 */
> -PMU_FORMAT_ATTR(contextid2,    "config:" __stringify(ETM_OPT_CTXTID2));
> -PMU_FORMAT_ATTR(timestamp,     "config:" __stringify(ETM_OPT_TS));
> -PMU_FORMAT_ATTR(retstack,      "config:" __stringify(ETM_OPT_RETSTK));
> +GEN_PMU_FORMAT_ATTR(contextid2);
> +GEN_PMU_FORMAT_ATTR(timestamp);
> +GEN_PMU_FORMAT_ATTR(retstack);
>  /* preset - if sink ID is used as a configuration selector */
> -PMU_FORMAT_ATTR(preset,                "config:0-3");
> +GEN_PMU_FORMAT_ATTR(preset);
>  /* Sink ID - same for all ETMs */
> -PMU_FORMAT_ATTR(sinkid,                "config2:0-31");
> +GEN_PMU_FORMAT_ATTR(sinkid);
>  /* config ID - set if a system configuration is selected */
> -PMU_FORMAT_ATTR(configid,      "config2:32-63");
> -PMU_FORMAT_ATTR(cc_threshold,  "config3:0-11");
> -
> +GEN_PMU_FORMAT_ATTR(configid);
> +GEN_PMU_FORMAT_ATTR(cc_threshold);
>
>  /*
>   * contextid always traces the "PID".  The PID is in CONTEXTIDR_EL1
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
> index 5febbcdb8696..c794087a0e99 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.h
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
> @@ -20,6 +20,37 @@ struct cscfg_config_desc;
>   */
>  #define ETM_ADDR_CMP_MAX       8
>
> +#define ATTR_CFG_FLD_preset_CFG                        config
> +#define ATTR_CFG_FLD_preset_LO                 0
> +#define ATTR_CFG_FLD_preset_HI                 3
> +#define ATTR_CFG_FLD_branch_broadcast_CFG      config
> +#define ATTR_CFG_FLD_branch_broadcast_LO       8
> +#define ATTR_CFG_FLD_branch_broadcast_HI       8
> +#define ATTR_CFG_FLD_cycacc_CFG                        config
> +#define ATTR_CFG_FLD_cycacc_LO                 12
> +#define ATTR_CFG_FLD_cycacc_HI                 12
> +#define ATTR_CFG_FLD_contextid1_CFG            config
> +#define ATTR_CFG_FLD_contextid1_LO             14
> +#define ATTR_CFG_FLD_contextid1_HI             14
> +#define ATTR_CFG_FLD_contextid2_CFG            config
> +#define ATTR_CFG_FLD_contextid2_LO             15
> +#define ATTR_CFG_FLD_contextid2_HI             15
> +#define ATTR_CFG_FLD_timestamp_CFG             config
> +#define ATTR_CFG_FLD_timestamp_LO              28
> +#define ATTR_CFG_FLD_timestamp_HI              28
> +#define ATTR_CFG_FLD_retstack_CFG              config
> +#define ATTR_CFG_FLD_retstack_LO               29
> +#define ATTR_CFG_FLD_retstack_HI               29
> +#define ATTR_CFG_FLD_sinkid_CFG                        config2
> +#define ATTR_CFG_FLD_sinkid_LO                 0
> +#define ATTR_CFG_FLD_sinkid_HI                 31
> +#define ATTR_CFG_FLD_configid_CFG              config2
> +#define ATTR_CFG_FLD_configid_LO               32
> +#define ATTR_CFG_FLD_configid_HI               63
> +#define ATTR_CFG_FLD_cc_threshold_CFG          config3
> +#define ATTR_CFG_FLD_cc_threshold_LO           0
> +#define ATTR_CFG_FLD_cc_threshold_HI           11
> +
>  /**
>   * struct etm_filter - single instruction range or start/stop configuration.
>   * @start_addr:        The address to start tracing on.
>
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

