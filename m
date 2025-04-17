Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C26B4C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 13:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ogWxuTjp5Nks1uF5KHNpor010g6lBRaJanaXYtzaBMA=; b=YtgyFAxev8PI9IgHKg2hYKlLkF
	AdzIdIcmJEx6rK5+LZzHOedP/o3/2fpGoSOczhlpf+APDsTLd10c9xCmTygTDTvda14GltIJcQDOG
	W8Mrm3AnjrEIJ+8ByQ0EMtr43PoDGohnXwi8m6/ixzEhhBv9tIcGHvXzmAn6APBR2Xb6ZZFngNeNj
	YPeiilkbfjjgnyI2q+eZjrBG6lM4N+k+8SAUTmDEPDllz5E2GhbKcYlz1m5sndl5MMEIgYAI34r0r
	6labmN4MV0nFMyxdjhVDDhlhJfAdacKbUl943ThW5OiLbkDX/S+fBLL7XWzVgZuWJqYmq7fPb0IG0
	udoDP5OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Pbd-0000000DCMU-3D4L;
	Thu, 17 Apr 2025 13:48:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5PFP-0000000D9B3-23fE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 13:25:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AF8535C04A3;
	Thu, 17 Apr 2025 13:23:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3C28C4CEED;
	Thu, 17 Apr 2025 13:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744896342;
	bh=Drs94MUaxJbsVdM/zpcCB4DFPzpYU1vvnHCqfqX8EJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=svKG27U0i8ZPd4YWJD+dQsdHbDu921JnCpGNZ/L2EtDdybbKCnQLp5AEa0vf0Nq4F
	 vvbqao0DBlNINB4XZFl9lIJCj7PofcGV6AV/W+x85d0rb7SOIP35/HqZbcdWzAOOBN
	 TB/ccEpGWxwMlE9i/tS06x6K02JieGNmsYzIZ/e8BbahMA/tx51PaOhyMwPgPis1pF
	 IYr0CRFpeSHpI/VVOmWHvJsO50RvGsYQwWS0nbAusP0He4xVKPzlL/Py7bELrti3LV
	 cWibMsDQh8IYLb5RmBiveiqadY9OFFC/LD/heCp7shCjK0RrwizQAhmG1TkLrdqWjS
	 hFnnX9fhrzWcw==
Date: Thu, 17 Apr 2025 14:25:37 +0100
From: Will Deacon <will@kernel.org>
To: Charles Han <hanchunchao@inspur.com>
Cc: mark.rutland@arm.com, suzuki.poulose@arm.com,
	Ganapatrao.Kulkarni@cavium.com, gkulkarni@marvell.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/perf: Add NULL check in thunderx2_pmu
Message-ID: <20250417132536.GB12863@willie-the-truck>
References: <20250410112027.80131-1-hanchunchao@inspur.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410112027.80131-1-hanchunchao@inspur.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_062543_634903_065204B5 
X-CRM114-Status: GOOD (  18.14  )
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

On Thu, Apr 10, 2025 at 07:20:27PM +0800, Charles Han wrote:
> devm_kasprintf() can return a NULL pointer on failure,but this
> returned value in tx2_uncore_pmu_register() and
> tx2_uncore_pmu_init_dev() is not checked.
> Add NULL check in tx2_uncore_pmu_register() and
> tx2_uncore_pmu_init_dev(), to handle kernel NULL
> pointer dereference error.
> 
> Fixes: 69c32972d593 ("drivers/perf: Add Cavium ThunderX2 SoC UNCORE PMU driver")
> Fixes: 5e2c27e833bb ("drivers/perf: Add CCPI2 PMU support in ThunderX2 UNCORE driver.")
> Signed-off-by: Charles Han <hanchunchao@inspur.com>
> ---
>  drivers/perf/thunderx2_pmu.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/perf/thunderx2_pmu.c b/drivers/perf/thunderx2_pmu.c
> index 6ed4707bd6bb..03dd297ff326 100644
> --- a/drivers/perf/thunderx2_pmu.c
> +++ b/drivers/perf/thunderx2_pmu.c
> @@ -738,6 +738,8 @@ static int tx2_uncore_pmu_register(
>  
>  	tx2_pmu->pmu.name = devm_kasprintf(dev, GFP_KERNEL,
>  			"%s", name);
> +	if (!tx2_pmu->pmu.name)
> +		return -ENOMEM;

perf_pmu_register() rejects (and warns) for a NULL name, so I'm not sure
we need to litter the drivers with extra checks.

>  	return perf_pmu_register(&tx2_pmu->pmu, tx2_pmu->pmu.name, -1);
>  }
> @@ -837,6 +839,11 @@ static struct tx2_uncore_pmu *tx2_uncore_pmu_init_dev(struct device *dev,
>  		tx2_pmu->attr_groups = l3c_pmu_attr_groups;
>  		tx2_pmu->name = devm_kasprintf(dev, GFP_KERNEL,
>  				"uncore_l3c_%d", tx2_pmu->node);
> +		if (!tx2_pmu->name) {
> +			devm_kfree(dev, tx2_pmu);
> +			return ERR_PTR(-ENOMEM);
> +		}
> +
>  		tx2_pmu->init_cntr_base = init_cntr_base_l3c;
>  		tx2_pmu->start_event = uncore_start_event_l3c;
>  		tx2_pmu->stop_event = uncore_stop_event_l3c;
> @@ -852,6 +859,11 @@ static struct tx2_uncore_pmu *tx2_uncore_pmu_init_dev(struct device *dev,
>  		tx2_pmu->attr_groups = dmc_pmu_attr_groups;
>  		tx2_pmu->name = devm_kasprintf(dev, GFP_KERNEL,
>  				"uncore_dmc_%d", tx2_pmu->node);
> +		if (!tx2_pmu->name) {
> +			devm_kfree(dev, tx2_pmu);
> +			return ERR_PTR(-ENOMEM);
> +		}
> +
>  		tx2_pmu->init_cntr_base = init_cntr_base_dmc;
>  		tx2_pmu->start_event = uncore_start_event_dmc;
>  		tx2_pmu->stop_event = uncore_stop_event_dmc;
> @@ -866,6 +878,11 @@ static struct tx2_uncore_pmu *tx2_uncore_pmu_init_dev(struct device *dev,
>  		tx2_pmu->attr_groups = ccpi2_pmu_attr_groups;
>  		tx2_pmu->name = devm_kasprintf(dev, GFP_KERNEL,
>  				"uncore_ccpi2_%d", tx2_pmu->node);
> +		if (!tx2_pmu->name) {
> +			devm_kfree(dev, tx2_pmu);
> +			return ERR_PTR(-ENOMEM);
> +		}

Are any of these actually necessary? afaict, the vsprintf code will
emit "(null)" for a NULL pointer.

Will

