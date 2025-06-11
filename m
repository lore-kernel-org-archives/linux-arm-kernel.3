Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EA0C61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 09:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ge6AKe268955C+iO3ERSUeTMJbT5c3PFunc4a6ThgtY=; b=4QuPTHDwhf/AoL5lXSVVlQdigU
	F2E3gSlcZtsb9biBoUMZlh7YZaaj7xFyb/1cRl9DY2BEkvyXkUiVgn52mM3Nrxsdlp3r4DgGMN7H4
	Apt4wJDYItyZuUMM5Br09PDKxKgAJItX3neZxvOpGdMZBOPPf9FobPnQnBoNUdNUTrSwxOaZnHbfM
	mwPyR7+FXm7D+bD5bCB9bFsYb5D/k8kxq41zeyyj2cjAQHQP7WQENjMWbh6DYum4aSD+/OfyGt8be
	/xNW+0y0ifMq1HDqZM0ajHQOPauqXtgQfbdVGpv4bb83uAHqtO5J3y48pT2lTv11j5mpGS+vGbxQM
	vyiUXKcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHSn-00000009QzE-2lN1;
	Wed, 11 Jun 2025 09:09:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHN1-00000009PoA-0WPo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 09:03:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 789E41688;
	Wed, 11 Jun 2025 02:03:22 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A70C93F59E;
	Wed, 11 Jun 2025 02:03:41 -0700 (PDT)
Date: Wed, 11 Jun 2025 10:03:37 +0100
From: Leo Yan <leo.yan@arm.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	James Clark <james.clark@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v2] perf: arm_spe: Relax period restriction
Message-ID: <20250611090337.GS8020@e132581.arm.com>
References: <20250528132501.129586-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528132501.129586-1-leo.yan@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_020343_206473_50C784B6 
X-CRM114-Status: GOOD (  21.92  )
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

On Wed, May 28, 2025 at 02:25:01PM +0100, Leo Yan wrote:
> The minimum interval specified the PMSIDR_EL1.Interval field is a
> hardware recommendation. However, this value is set by hardware designer
> before the production. It may not accurately reflects actual hardware
> limitations, and tools currently have no way to test shorter periods.
> 
> This change relaxes the limitation by allowing any non-zero periods.
> This gives chance for experimenting smaller periods.
> 
> The downside is that small periods may increase the risk of AUX ring
> buffer overruns. When an overrun occurs, the perf core layer will
> trigger an irq work to disable the event and wake up the tool in user
> space to read the trace data. After the tool finishes reading, it will
> re-enable the AUX event.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Gentle ping. thanks!

> ---
> 
> Changes from v1:
> - Shifted bits with FIELD_PREP().
> - Removed warning log which is not quite useful. (James Clark)
> 
>  drivers/perf/arm_spe_pmu.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
> index 3efed8839a4e..e40e5daa838d 100644
> --- a/drivers/perf/arm_spe_pmu.c
> +++ b/drivers/perf/arm_spe_pmu.c
> @@ -308,12 +308,16 @@ static u64 arm_spe_event_to_pmscr(struct perf_event *event)
>  
>  static void arm_spe_event_sanitise_period(struct perf_event *event)
>  {
> -	struct arm_spe_pmu *spe_pmu = to_spe_pmu(event->pmu);
>  	u64 period = event->hw.sample_period;
>  	u64 max_period = PMSIRR_EL1_INTERVAL_MASK;
>  
> -	if (period < spe_pmu->min_period)
> -		period = spe_pmu->min_period;
> +	/*
> +	 * As per the Arm ARM (DDI 0487 L.a), section D24.7.12 PMSIRR_EL1,
> +	 * Sampling Interval Reload Register, the INTERVAL field (bits [31:8])
> +	 * states: "Software must set this to a nonzero value."
> +	 */
> +	if (period < FIELD_PREP(PMSIRR_EL1_INTERVAL_MASK, 1))
> +		period = FIELD_PREP(PMSIRR_EL1_INTERVAL_MASK, 1);
>  	else if (period > max_period)
>  		period = max_period;
>  	else
> -- 
> 2.34.1
> 

