Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B007D116F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 12:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRQtvmz0huP51ZQf+R4LzzzrfMRBZdx3Rn9IgaixUbY=; b=BCaoqzEwIf/fHEDMl6RWzE4nGa
	NinK+ed7JYQsFWP8H+QUU9xbE7TV17R0mPwL7hQlZOdP7oKkcrFcDCHYpvUa5odlI58O1+nL/mO+u
	Bx8V/XEY0s/nZQGXYXa4TPce7xD7kTVzaB4gQVBuIM73uK0QbuCMFLmSkedWaTGVozdGhf39f4v1W
	FLwsYi5DTOSuy5d0/s0/b855G/CT6apGBMCG7+D7Mu5Y1A1H003L3pGXbyQ+DtHu9p2HrVI5U+SSP
	S4G2lEsDrHYlMA7SZNAZ8wwtr/qzt8PfJT+vw0ruYbiUSF3ncCkEExdEjyUQakAJaFBKHNwCXuOlD
	0rkvZqAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQPI8-00000005Mg6-2vhM;
	Tue, 02 Dec 2025 12:15:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQPI6-00000005MfU-0Xq4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 12:15:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C75CE153B;
	Tue,  2 Dec 2025 04:15:23 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C0DBE3F73B;
	Tue,  2 Dec 2025 04:15:30 -0800 (PST)
Date: Tue, 2 Dec 2025 12:15:28 +0000
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
Subject: Re: [PATCH 6/7] perf cs-etm: Don't hard code config attribute when
 configuring the event
Message-ID: <20251202121528.GX724103@e132581.arm.com>
References: <20251201-james-perf-config-bits-v1-0-22ecbbf8007c@linaro.org>
 <20251201-james-perf-config-bits-v1-6-22ecbbf8007c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201-james-perf-config-bits-v1-6-22ecbbf8007c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_041534_288777_AAA3FE3E 
X-CRM114-Status: GOOD (  17.69  )
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

On Mon, Dec 01, 2025 at 04:41:09PM +0000, Coresight ML wrote:

[...]

> @@ -103,13 +103,20 @@ static int cs_etm_validate_context_id(struct perf_pmu *cs_etm_pmu, struct evsel
>  				      struct perf_cpu cpu)
>  {
>  	int err;
> -	__u64 val;
> -	u64 contextid = evsel->core.attr.config &
> -		(perf_pmu__format_bits(cs_etm_pmu, "contextid") |
> -		 perf_pmu__format_bits(cs_etm_pmu, "contextid1") |
> -		 perf_pmu__format_bits(cs_etm_pmu, "contextid2"));
> +	u64 ctxt, ctxt1, ctxt2;
> +	__u64 trcidr2;
>  
> -	if (!contextid)
> +	err = evsel__get_config_val(cs_etm_pmu, evsel, "contextid", &ctxt);
> +	if (err)
> +		return err;
> +	err = evsel__get_config_val(cs_etm_pmu, evsel, "contextid1", &ctxt1);
> +	if (err)
> +		return err;
> +	err = evsel__get_config_val(cs_etm_pmu, evsel, "contextid2", &ctxt2);
> +	if (err)
> +		return err;

Seems to me, this is not right.  The current code checks any context
ID setting but it can tolerate if missing "contexid[*]" format.

After calling evsel__get_config_val(), if any "contextid[*]" format is
missed, it returns error and will diretly bail out.  As a result,
cs_etm_validate_context_id() will always return error.

> +
> +	if (!ctxt && !ctxt1 && !ctxt2)
>  		return 0;
>  
>  	/* Not supported in etmv3 */
> @@ -120,12 +127,11 @@ static int cs_etm_validate_context_id(struct perf_pmu *cs_etm_pmu, struct evsel
>  	}
>  
>  	/* Get a handle on TRCIDR2 */
> -	err = cs_etm_get_ro(cs_etm_pmu, cpu, metadata_etmv4_ro[CS_ETMV4_TRCIDR2], &val);
> +	err = cs_etm_get_ro(cs_etm_pmu, cpu, metadata_etmv4_ro[CS_ETMV4_TRCIDR2], &trcidr2);
>  	if (err)
>  		return err;
>  
> -	if (contextid &
> -	    perf_pmu__format_bits(cs_etm_pmu, "contextid1")) {
> +	if (ctxt1) {
>  		/*
>  		 * TRCIDR2.CIDSIZE, bit [9-5], indicates whether contextID
>  		 * tracing is supported:
> @@ -133,15 +139,14 @@ static int cs_etm_validate_context_id(struct perf_pmu *cs_etm_pmu, struct evsel
>  		 *  0b00100 Maximum of 32-bit Context ID size.
>  		 *  All other values are reserved.
>  		 */
> -		if (BMVAL(val, 5, 9) != 0x4) {
> +		if (BMVAL(trcidr2, 5, 9) != 0x4) {
>  			pr_err("%s: CONTEXTIDR_EL1 isn't supported, disable with %s/contextid1=0/\n",
>  			       CORESIGHT_ETM_PMU_NAME, CORESIGHT_ETM_PMU_NAME);
>  			return -EINVAL;
>  		}
>  	}
>  
> -	if (contextid &
> -	    perf_pmu__format_bits(cs_etm_pmu, "contextid2")) {
> +	if (ctxt2) {
>  		/*
>  		 * TRCIDR2.VMIDOPT[30:29] != 0 and
>  		 * TRCIDR2.VMIDSIZE[14:10] == 0b00100 (32bit virtual contextid)
> @@ -149,7 +154,7 @@ static int cs_etm_validate_context_id(struct perf_pmu *cs_etm_pmu, struct evsel
>  		 * virtual context id is < 32bit.
>  		 * Any value of VMIDSIZE >= 4 (i.e, > 32bit) is fine for us.
>  		 */
> -		if (!BMVAL(val, 29, 30) || BMVAL(val, 10, 14) < 4) {
> +		if (!BMVAL(trcidr2, 29, 30) || BMVAL(trcidr2, 10, 14) < 4) {
>  			pr_err("%s: CONTEXTIDR_EL2 isn't supported, disable with %s/contextid2=0/\n",
>  			       CORESIGHT_ETM_PMU_NAME, CORESIGHT_ETM_PMU_NAME);
>  			return -EINVAL;
> @@ -163,10 +168,14 @@ static int cs_etm_validate_timestamp(struct perf_pmu *cs_etm_pmu, struct evsel *
>  				     struct perf_cpu cpu)
>  {
>  	int err;
> -	__u64 val;
> +	u64 val;
> +	__u64 trcidr0;
>  
> -	if (!(evsel->core.attr.config &
> -	      perf_pmu__format_bits(cs_etm_pmu, "timestamp")))
> +	err = evsel__get_config_val(cs_etm_pmu, evsel, "timestamp", &val);
> +	if (err)
> +		return err;
> +
> +	if (!val)
>  		return 0;

Similiar issue here.  The current code returns 0 if not find "timestamp"
format.  With this change, it returns error instead.

Thanks,
Leo

