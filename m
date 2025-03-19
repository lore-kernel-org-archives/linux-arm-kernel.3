Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588C1C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 09:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URT+ol7yr7IkqsLZIejgOopr/T23HsqDn4mFBZGFxiA=; b=cXTztU8o7YEwLBMSz9CrQ6WhTq
	KwZUq5wMgeObqk40q1WCPtJIv5OyjtIgMcCw3lYMTmhS2Q2n9S4O/SwOi1vdBsDab+BSDlBG5wZY4
	catJcVDeJz6UEfc7svFsYilk2ycb+4MaJ2tDHWtLDQ8JK+e6EaXDmfOXfImKU2C0mcIzke23maSq4
	i1bJG6kDqJ9qA+C5S59ZtBO9f1qUyrca+FaxrNnrLDT9Sqgn4LB+ZD5oFTJdefXyF4c8jKa/zdmfM
	N3ZbMJNwDKIhH3pCPlqJl0X6YItCE8oq2bZ8hM1i7gKWJthWIkiOLdNUlCRfneh5oZuD+S5Kk4jiO
	POQa6fxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tupWc-00000008SFv-23tt;
	Wed, 19 Mar 2025 09:15:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tupUY-00000008Rt8-45Kw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 09:13:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87ED812FC;
	Wed, 19 Mar 2025 02:13:46 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E22B13F63F;
	Wed, 19 Mar 2025 02:13:37 -0700 (PDT)
Date: Wed, 19 Mar 2025 09:13:33 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 6/8] coresight: Clear self hosted claim tag on probe
Message-ID: <20250319091333.GG2860028@e132581.arm.com>
References: <20250318-james-coresight-claim-tags-v2-0-e9c8a9cde84e@linaro.org>
 <20250318-james-coresight-claim-tags-v2-6-e9c8a9cde84e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-james-coresight-claim-tags-v2-6-e9c8a9cde84e@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_021339_103435_CBA2F3EA 
X-CRM114-Status: GOOD (  20.14  )
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

On Tue, Mar 18, 2025 at 04:22:00PM +0000, James Clark wrote:
> This can be left behind from a crashed kernel after a kexec so clear it
> when probing each device. Clearing the self hosted bit even when claimed
> externally is harmless, so do it unconditionally.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

Just a note from me.

I'd expect it would be a rare case that users enable a Arm CoreSight
trace in a dump-capture kernel, as the second kernel is for dumping
CoreSight trace data but it is not necessarily to enable CoreSight
components.

This patch is not only helpful for crash kernel case, it can dismiss
quirks caused by insane hardware reset cases.

Reviewed-by: Leo Yan <leo.yan@arm.com>

> ---
>  drivers/hwtracing/coresight/coresight-catu.c       | 1 +
>  drivers/hwtracing/coresight/coresight-cti-core.c   | 2 ++
>  drivers/hwtracing/coresight/coresight-etb10.c      | 2 ++
>  drivers/hwtracing/coresight/coresight-etm3x-core.c | 1 +
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 2 ++
>  drivers/hwtracing/coresight/coresight-funnel.c     | 1 +
>  drivers/hwtracing/coresight/coresight-replicator.c | 1 +
>  drivers/hwtracing/coresight/coresight-tmc-core.c   | 1 +
>  8 files changed, 11 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> index fa170c966bc3..deaacfd875af 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -558,6 +558,7 @@ static int __catu_probe(struct device *dev, struct resource *res)
>  	catu_desc.subtype.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CATU;
>  	catu_desc.ops = &catu_ops;
>  
> +	coresight_clear_self_claim_tag(&catu_desc.access);
>  	drvdata->csdev = coresight_register(&catu_desc);
>  	if (IS_ERR(drvdata->csdev))
>  		ret = PTR_ERR(drvdata->csdev);
> diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
> index 80f6265e3740..8fb30dd73fd2 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-core.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-core.c
> @@ -931,6 +931,8 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>  	cti_desc.ops = &cti_ops;
>  	cti_desc.groups = drvdata->ctidev.con_groups;
>  	cti_desc.dev = dev;
> +
> +	coresight_clear_self_claim_tag(&cti_desc.access);
>  	drvdata->csdev = coresight_register(&cti_desc);
>  	if (IS_ERR(drvdata->csdev)) {
>  		ret = PTR_ERR(drvdata->csdev);
> diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
> index 7948597d483d..2bfcb669aa84 100644
> --- a/drivers/hwtracing/coresight/coresight-etb10.c
> +++ b/drivers/hwtracing/coresight/coresight-etb10.c
> @@ -772,6 +772,8 @@ static int etb_probe(struct amba_device *adev, const struct amba_id *id)
>  	desc.pdata = pdata;
>  	desc.dev = dev;
>  	desc.groups = coresight_etb_groups;
> +
> +	coresight_clear_self_claim_tag(&desc.access);
>  	drvdata->csdev = coresight_register(&desc);
>  	if (IS_ERR(drvdata->csdev))
>  		return PTR_ERR(drvdata->csdev);
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> index cfd463ac715c..1c6204e14422 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> @@ -764,6 +764,7 @@ static void etm_init_arch_data(void *info)
>  	drvdata->nr_ext_out = BMVAL(etmccr, 20, 22);
>  	drvdata->nr_ctxid_cmp = BMVAL(etmccr, 24, 25);
>  
> +	coresight_clear_self_claim_tag_unlocked(&drvdata->csa);
>  	etm_set_pwrdwn(drvdata);
>  	etm_clr_pwrup(drvdata);
>  	CS_LOCK(drvdata->csa.base);
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index e5972f16abff..52c9aa56e8b9 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1372,6 +1372,8 @@ static void etm4_init_arch_data(void *info)
>  	drvdata->nrseqstate = FIELD_GET(TRCIDR5_NUMSEQSTATE_MASK, etmidr5);
>  	/* NUMCNTR, bits[30:28] number of counters available for tracing */
>  	drvdata->nr_cntr = FIELD_GET(TRCIDR5_NUMCNTR_MASK, etmidr5);
> +
> +	coresight_clear_self_claim_tag_unlocked(csa);
>  	etm4_cs_lock(drvdata, csa);
>  	cpu_detect_trace_filtering(drvdata);
>  }
> diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
> index 0541712b2bcb..7249cc356ccb 100644
> --- a/drivers/hwtracing/coresight/coresight-funnel.c
> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
> @@ -255,6 +255,7 @@ static int funnel_probe(struct device *dev, struct resource *res)
>  		drvdata->base = base;
>  		desc.groups = coresight_funnel_groups;
>  		desc.access = CSDEV_ACCESS_IOMEM(base);
> +		coresight_clear_self_claim_tag(&desc.access);
>  	}
>  
>  	dev_set_drvdata(dev, drvdata);
> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
> index ee7ee79f6cf7..b2acd4535c74 100644
> --- a/drivers/hwtracing/coresight/coresight-replicator.c
> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
> @@ -284,6 +284,7 @@ static int replicator_probe(struct device *dev, struct resource *res)
>  	desc.pdata = dev->platform_data;
>  	desc.dev = dev;
>  
> +	coresight_clear_self_claim_tag(&desc.access);
>  	drvdata->csdev = coresight_register(&desc);
>  	if (IS_ERR(drvdata->csdev)) {
>  		ret = PTR_ERR(drvdata->csdev);
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index a7814e8e657b..a09579eff3fd 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -869,6 +869,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>  	dev->platform_data = pdata;
>  	desc.pdata = pdata;
>  
> +	coresight_clear_self_claim_tag(&desc.access);
>  	drvdata->csdev = coresight_register(&desc);
>  	if (IS_ERR(drvdata->csdev)) {
>  		ret = PTR_ERR(drvdata->csdev);
> 
> -- 
> 2.34.1
> 

