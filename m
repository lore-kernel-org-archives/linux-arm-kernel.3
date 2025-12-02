Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBBECFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 11:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ytGE1Zx2sLd8Z/V5X4apLU4kWCW6QvdB+Bk1X2SIlM=; b=snvEprW3HcbSFOdjXVoXk+zswT
	YQHZxNDBBQyADeomjFRWE1mliroOt6TcKk4Lv8j5CT+zasc11fhL4fMPx+SkKWiu2J6jwAZs1rJVQ
	HGPwZynci8S18LK7ekvo7rlHobXEMsz7W80o9CUXGPuzAix6eyiXc3KBt7hpCpy/+JYt91XK98BAU
	YQ3zBMQPpMvfsmXxuEzSSweXlJEe63xRARcJWesmjChlyTmE23Nml5gBVj109Q57r7edv261IdvPG
	5ykF7tP9DAAjNonWp+hWUlv2jO/jueKlF5UWtN0hKgBi/OzeylBuMJ8jimaus7m9Lo2dNDuGhmeJ9
	G2yir7FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQOKg-00000005Ine-2MUM;
	Tue, 02 Dec 2025 11:14:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQOKe-00000005Imu-0NuI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 11:14:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D160D153B;
	Tue,  2 Dec 2025 03:13:58 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9A213F59E;
	Tue,  2 Dec 2025 03:14:05 -0800 (PST)
Date: Tue, 2 Dec 2025 11:14:03 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Leo Yan <leo.yan@linux.dev>, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/7] perf tools: apply evsel__set_config_if_unset() to
 all config fields
Message-ID: <20251202111403.GS724103@e132581.arm.com>
References: <20251201-james-perf-config-bits-v1-0-22ecbbf8007c@linaro.org>
 <20251201-james-perf-config-bits-v1-2-22ecbbf8007c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201-james-perf-config-bits-v1-2-22ecbbf8007c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_031408_196835_8CB0BE76 
X-CRM114-Status: GOOD (  12.86  )
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

On Mon, Dec 01, 2025 at 04:41:05PM +0000, Coresight ML wrote:

[...]

>  void evsel__set_config_if_unset(struct perf_pmu *pmu, struct evsel *evsel,
>  				const char *config_name, u64 val)
>  {
>  	u64 user_bits = 0, bits;
> -	struct evsel_config_term *term = evsel__get_config_term(evsel, USR_CHG_CONFIG);
> +	struct evsel_config_term *term;
> +	struct perf_pmu_format *format = pmu_find_format(&pmu->format, config_name);
> +	__u64 *vp;

Should check (format == NULL) here and bail out for a unknown config name?

> +
> +	switch (format->value) {
> +	case PERF_PMU_FORMAT_VALUE_CONFIG:
> +		term = evsel__get_config_term(evsel, USR_CHG_CONFIG);
> +		vp = &evsel->core.attr.config;
> +		break;
> +	case PERF_PMU_FORMAT_VALUE_CONFIG1:
> +		term = evsel__get_config_term(evsel, USR_CHG_CONFIG1);
> +		vp = &evsel->core.attr.config1;
> +		break;
> +	case PERF_PMU_FORMAT_VALUE_CONFIG2:
> +		term = evsel__get_config_term(evsel, USR_CHG_CONFIG2);
> +		vp = &evsel->core.attr.config2;
> +		break;
> +	case PERF_PMU_FORMAT_VALUE_CONFIG3:
> +		term = evsel__get_config_term(evsel, USR_CHG_CONFIG3);
> +		vp = &evsel->core.attr.config3;
> +		break;
> +	case PERF_PMU_FORMAT_VALUE_CONFIG4:
> +		term = evsel__get_config_term(evsel, USR_CHG_CONFIG4);
> +		vp = &evsel->core.attr.config4;
> +		break;
> +	default:
> +		pr_err("Unknown format value: %d\n", format->value);
> +		return;
> +	}
>  
>  	if (term)
>  		user_bits = term->val.cfg_chg;
> @@ -1396,20 +1436,8 @@ void evsel__set_config_if_unset(struct perf_pmu *pmu, struct evsel *evsel,
>  		return;
>  
>  	/* Otherwise replace it */
> -	evsel->core.attr.config &= ~bits;
> -	evsel->core.attr.config |= field_prep(bits, val);
> -}
> -
> -static struct perf_pmu_format *
> -pmu_find_format(const struct list_head *formats, const char *name)
> -{
> -	struct perf_pmu_format *format;
> -
> -	list_for_each_entry(format, formats, list)
> -		if (!strcmp(format->name, name))
> -			return format;
> -
> -	return NULL;
> +	*vp &= ~bits;
> +	*vp |= FIELD_PREP(bits, val);
>  }

