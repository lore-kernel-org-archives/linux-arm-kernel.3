Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EFCCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 16:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XrHTwyWRmcCmqZ+ZvtvvUN7JeKm53BmHzdcNZQjwcwU=; b=JKfj89PfCw6Ym+VijgIx/qzZp4
	v+6Z5FE1PkZUrCoaoMji1dkYZjevCYEtX77hQRgUm1At161u4Mk3Sla3Qbcdn3YGW9fVhjYlUISUE
	MhAmm2EQwojaqv1oFsZFw2loBzGkV1f4NRE3BrxLVuX5veKDFjXkNT8+IZZJGAKHypKLOVDmEb1I9
	lgu+qVQ95V6EMDvLRRTBNfLB30x6VyFhGnoIL1+phHzrYK0mCurxP4aC01iHONXMOJVYsuiGIlhk7
	Af+xKyDNUTRVc68JLyBfsoqkVtvCQf9L5g75b+KPybutRrTR5b1dvNjzxPXEaDN6vZNRQ0KlBkp3o
	bADZ6RHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjqe-000000046eC-32j8;
	Thu, 11 Sep 2025 16:08:36 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjqc-000000046dG-382X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 16:08:36 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45dfb8e986aso10490135e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 09:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757606913; x=1758211713; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XrHTwyWRmcCmqZ+ZvtvvUN7JeKm53BmHzdcNZQjwcwU=;
        b=iv7rAS0LvnFzePEtlT4eK2p8FjtgP3PgB3KRg+kERoHB7v2n6CbTiUV5XMbrCkYl+r
         lEpIbnyUy9N544KCF6EjbgzqWXXmoRYKF97C9oBocRRtWDq5Rix0nGZ6oe0WeTKmMkC5
         E5tz2GQVb0rVISksj89Xl7LoPUvdMFNO/OOrnmuBdVvmLJ9Dtr0e2iXwHm1rwOQ30PHX
         7QEpxVc5XTAr3iuIv6KFOi/hvBP/hK1JURgeWphIIMyCZf+mr82/pw9DlOMmzYXgKsH4
         akZHWc9uKYowkqOZ0TjPKcIkByihZjHn2QwpDCG3m12KSbfo2yPkJoxKguRJiElwH2Cc
         EduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757606913; x=1758211713;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XrHTwyWRmcCmqZ+ZvtvvUN7JeKm53BmHzdcNZQjwcwU=;
        b=YULKd8KxvJU9zntB5F6UT+J7MB/sOzbXKcj5Qjksjz1HpQua3IqvraBt2dkvObHzRv
         MXF/8cJwaWmjVx+ScI/7laNP6XhxHG0fA29dozzpje2uRuY7kt3nMDuoNX11+l9J1owx
         j/c+1h5xI5A6IEqvpv/Cfgq6chg5LzfxK9dAHZvDc5Sxxa4YCZ3FBcdeLsYzcIiVweDx
         eMAhzfMS/QxsjgWFTph7dX/qJs7tc1Urzfj4BVL82SYa54+SmOSRC9yruSDwa97M5qz1
         p8H+0v/7ODhrNP2tM0T7IAOwrlbcX5EDrC0aFUi9hmtF21uSCShqv1Kip6XuogOWa+do
         WkWw==
X-Forwarded-Encrypted: i=1; AJvYcCVa7FXozmspnTHU4/nyyu/Xy4QJ70QwOO//sJvYtq9eSMJML2HPTIOqrlLA81kxZ6W39Ouj+DnqKJPrJLC1RYw1@lists.infradead.org
X-Gm-Message-State: AOJu0YxHtFMtruOghuJMxP+ybuPFB+On2P4N0We7cea4H2yi9weTLT8G
	w4N3edZ5bQLvOuPOeQ3cmwKudTU3G8bQIyBSaGNTe6pRWfEwoUUKMWUrzHGaHmXJ68k=
X-Gm-Gg: ASbGncv/6lXr5A0kvGRFmhEdAW3ezGs+bkdPRlk0LisTMcoAWMiw9zM2Q81dOMYp986
	J2lDCiQRDzyHK9mfts7tJ/4jmGDnj5penfvyByCLeQyZTpZwVVvatO3RyiEv0qKjmIOHc9sbHpB
	vy7u5U4PMvMZQQ8nOCbD458abHLIXmOgh/nJg2MNAQwsSuk3dkkdiAdv1iU9XcqKebHeRY/DdXa
	SeNog4yHw2acqZCQneKwW5mKw5jT2A/BVvIb9ZClpls7GQiNKd21fqFZ58McuIRHl9ssbQk/IqB
	ZYS4EXm/QMUmHswXyT9sfLpC+hd22cmsifEjSaLUNwOWmpwmP1DjAm7aQnfjYiVjxWrGRK/+Dlp
	ArmYJNHQoRzxY1+fNQuJ/mhMmzsbU1x0Sy51iVD3Sy5vEzet8
X-Google-Smtp-Source: AGHT+IExjhwjUgqrY49LySsRqAJm8YC5ZRKGtAm/z9Pw2/iVB4FhrUIv+Mv6vy9Kr6j7/votc74ImA==
X-Received: by 2002:a05:600c:1c9a:b0:45b:9c93:d21d with SMTP id 5b1f17b1804b1-45f211c9bcbmr384085e9.8.1757606912643;
        Thu, 11 Sep 2025 09:08:32 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e037c4490sm28511385e9.19.2025.09.11.09.08.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 09:08:32 -0700 (PDT)
Message-ID: <4d645f83-0ec1-4b31-81dc-431b6c6f205f@linaro.org>
Date: Thu, 11 Sep 2025 17:08:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/15] perf arm_spe: Improve CPU number retrieving in
 per-thread mode
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, German Gomez
 <german.gomez@arm.com>, Ali Saidi <alisaidi@amazon.com>
References: <20250731-arm_spe_support_hitm_overhead_v1_public-v4-0-58e5677a412b@arm.com>
 <20250731-arm_spe_support_hitm_overhead_v1_public-v4-12-58e5677a412b@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250731-arm_spe_support_hitm_overhead_v1_public-v4-12-58e5677a412b@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_090834_816007_02C47FC3 
X-CRM114-Status: GOOD (  25.24  )
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



On 31/07/2025 2:25 pm, Leo Yan wrote:
> In per-thread mode on a homogeneous system, the current code simply
> picks the first metadata entry for data source parsing.
> 
> This change improves that by using the PMU type to find the matching PMU
> event. From there, it reads the CPU map and uses the first CPU ID to
> fetch the metadata.
> 
> Although this makes no difference when there's only one Arm SPE PMU, it
> helps for future support of multiple SPE events.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/util/arm-spe.c | 19 +++++++++++++++----
>   1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> index db681dd2aed205655e77f3dfcd7eb3c33f20277a..2ac10b8008527a066c9b2f67a22eb8511af9239a 100644
> --- a/tools/perf/util/arm-spe.c
> +++ b/tools/perf/util/arm-spe.c
> @@ -914,6 +914,9 @@ static bool arm_spe__synth_ds(struct arm_spe_queue *speq,
>   			      union perf_mem_data_src *data_src)
>   {
>   	struct arm_spe *spe = speq->spe;
> +	struct perf_cpu_map *cpus;
> +	struct perf_cpu perf_cpu;
> +	int16_t cpu_nr;
>   	u64 *metadata = NULL;
>   	u64 midr;
>   	unsigned int i;
> @@ -935,13 +938,21 @@ static bool arm_spe__synth_ds(struct arm_spe_queue *speq,
>   			if (!spe->is_homogeneous)
>   				return false;
>   
> -			/* In homogeneous system, simply use CPU0's metadata */
> -			if (spe->metadata)
> -				metadata = spe->metadata[0];
> +			cpus = perf_pmus__find_by_type(spe->pmu_type)->cpus;

You can't run perf_pmus__find_by_type() at this point because we're 
decoding and might not even be running on the same system or even 
architecture.

If we've already determined that it's homogeneous I don't think this is 
much of an improvement anwyay. Looks like handling multiple SPE 
instances needs a lot more work than this. We should skip doing it in 
this patchset and do it properly on its own later.

> +			if (!cpus)
> +				return false;
> +
> +			/* In a homogeneous system, fetch the first CPU in the map. */
> +			perf_cpu = perf_cpu_map__cpu(cpus, 0);
> +			if (perf_cpu.cpu == -1)
> +				return false;
> +
> +			cpu_nr = perf_cpu.cpu;
>   		} else {
> -			metadata = arm_spe__get_metadata_by_cpu(spe, speq->cpu);
> +			cpu_nr = speq->cpu;
>   		}
>   
> +		metadata = arm_spe__get_metadata_by_cpu(spe, cpu_nr);
>   		if (!metadata)
>   			return false;
>   
> 


