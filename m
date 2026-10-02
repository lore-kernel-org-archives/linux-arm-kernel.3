Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD8F8CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 17:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GN5S3DhyS1F/0sbvbMWgNgDhlY2skKWvA4N87xXHYkk=; b=f1QASdVhJlOHDX9Za1+J5JYM4x
	ReUv8PT9wSx9n74ngz1s9aUock28pTe0cu13E+LGW4MlXMWpD3b3SatHwOZU6SMB6Q/Ysw6UzLiEP
	3thsxl+aOaO9Fps7wtvVRrcu5Y3hedkXLTEo3pjgio+mOUVzF7SR3Q6fbNc/zGENqS5ov7OoGpaPP
	qPlF09TFm0y2tXatXC0j8jedZ3b7Tlj1HWD3IDuQhYqt1BCoWU5dDGkqIKMXLnQPlZymcBRoNJ0ko
	3ePotaVipX6fXw8HZfdjdN3SAGQvsFLEUkyt400+/7CqSuycWY9ZWa3ae1FOy5xOsnVTDZUCsmwZA
	cNKEmoow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgpn-0000000C84l-1QkY;
	Fri, 02 Oct 2026 17:14:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgpl-0000000C84I-1UX6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 17:14:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47F012F;
	Fri,  2 Oct 2026 10:14:04 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A4FA3F85F;
	Fri,  2 Oct 2026 10:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790961247; bh=bl3TUcuEor0ntvv140M+GUV3h7G2r8r6Edcjw0sDACk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FygPz1ynvgOKgzWas1VAzqnRikEpOTFZb0IC5AyA9jGyaYTxxZl8eM4HuSAUY2mV/
	 E6oewknrFjcMEvJ5Xf+8ef2VmNhnrqwSNd/XrP9OxY8guAXR0sTc6pFwcjQtnwkJjx
	 lf8PTo+eWjaYdkMl4vw+MdT6nBdZz+r6CrSs1RdA=
Date: Fri, 2 Oct 2026 18:14:05 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] perf cs-etm: Synthesize missing HW_ID mappings
 for raw trace
Message-ID: <20261002171405.GG1208404@e132581.arm.com>
References: <20261002-james-cs-hw_id-output-failure-v3-0-1d8b6ef339c8@linaro.org>
 <20261002-james-cs-hw_id-output-failure-v3-3-1d8b6ef339c8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-james-cs-hw_id-output-failure-v3-3-1d8b6ef339c8@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_101409_460434_BAD3E810 
X-CRM114-Status: GOOD (  15.18  )
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

On Fri, Oct 02, 2026 at 12:15:13PM +0100, James Clark wrote:

[...]

>  static struct cs_etm_queue *cs_etm__get_queue(struct cs_etm_auxtrace *etm, int cpu)
> @@ -314,12 +317,11 @@ static int cs_etm__map_trace_id_v0(struct cs_etm_auxtrace *etm, u8 trace_chan_id
>  		return -EINVAL;
>  
>  	/*
> -	 * If the queue is unformatted then only save one mapping in the
> -	 * queue associated with that CPU so only one decoder is made.
> +	 * Ignore HW_IDs for unformatted, a decoder will be made
> +	 * unconditionally later.
>  	 */
>  	if (etmq->format == UNFORMATTED)
> -		return cs_etm__insert_trace_id_node(etmq, trace_chan_id,
> -						    cpu_metadata);
> +		return 0;

Nitpick: It seems to me that we can move the
etmq->format == UNFORMATTED check into cs_etm__process_aux_output_hw_id().

This avoids duplicating the check in both cs_etm__map_trace_id_v0()
and cs_etm__process_trace_id_v0_1(), and makes it more apparent that
the unformatted case does not use HW_ID at all.

It's up to you whether to keep it as is or update it. Either way:

Reviewed-by: Leo Yan leo.yan@arm.com

P.S. Although I contributed the initial idea, the change is now quite
different from the original patch I shared. Please feel free to drop my
name if you prefer.

