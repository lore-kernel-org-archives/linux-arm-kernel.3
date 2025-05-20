Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B02C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 11:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pvu6MHxps7tuZFq/8QXEiNd5qSTK9uaKfhA1pvP9ip0=; b=SGA76IMb2swQn5Jo9+Aq2FZiyS
	LgLAkiWBJ82VicFNyvFmzJJVULjas7eASVfOO+w4Fb4WqlYLj5nl6Q+5XgZvj9d4qDeGf3PjWODms
	LnPPn3ij87nRFVZJUkXrQuKelL5HocP/oTLhBdph61SAsgr2YxJ/hL+ZXg5Ha129w0qjGlylrLked
	Y+GrgagpcUqpsnYc1VWGaVanw0IBy/z3xfUXpYMCtyCuR4Aeg2GhIE9ouqgtp5W9c7mlzUyeDAIYd
	5EhUs0cRBp36SQ149ARmBMqP/FF8rbGHlALghRS1+E5L57WQ6DFnWrPehfcmcNzZZyYWSN7gq/R7u
	H21HW7SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHLWY-0000000Cj3a-1kKj;
	Tue, 20 May 2025 11:52:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHLOT-0000000ChEo-0Dak
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 11:44:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30E511516;
	Tue, 20 May 2025 04:44:11 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 363743F6A8;
	Tue, 20 May 2025 04:44:24 -0700 (PDT)
Date: Tue, 20 May 2025 12:44:22 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH 06/10] perf: Add perf_event_attr::config4
Message-ID: <20250520114422.GP412060@e132581.arm.com>
References: <20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org>
 <20250506-james-perf-feat_spe_eft-v1-6-dd480e8e4851@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506-james-perf-feat_spe_eft-v1-6-dd480e8e4851@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_044425_137297_9A9AB208 
X-CRM114-Status: GOOD (  18.02  )
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

On Tue, May 06, 2025 at 12:41:38PM +0100, James Clark wrote:
> Arm FEAT_SPE_FDS adds the ability to filter on the data source of a
> packet using another 64-bits of event filtering control. As the existing
> perf_event_attr::configN fields are all used up for SPE PMU, an
> additional field is needed. Add a new 'config4' field.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

> ---
>  include/uapi/linux/perf_event.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
> index 5fc753c23734..c7c2b1d4ad28 100644
> --- a/include/uapi/linux/perf_event.h
> +++ b/include/uapi/linux/perf_event.h
> @@ -379,6 +379,7 @@ enum perf_event_read_format {
>  #define PERF_ATTR_SIZE_VER6	120	/* add: aux_sample_size */
>  #define PERF_ATTR_SIZE_VER7	128	/* add: sig_data */
>  #define PERF_ATTR_SIZE_VER8	136	/* add: config3 */
> +#define PERF_ATTR_SIZE_VER9	144	/* add: config4 */
>  
>  /*
>   * Hardware event_id to monitor via a performance monitoring event:
> @@ -533,6 +534,7 @@ struct perf_event_attr {
>  	__u64	sig_data;
>  
>  	__u64	config3; /* extension of config2 */
> +	__u64	config4; /* extension of config3 */
>  };
>  
>  /*
> 
> -- 
> 2.34.1
> 

