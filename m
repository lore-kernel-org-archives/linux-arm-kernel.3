Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01076C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 07:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yj/8LclNtNwWmJ9CEP9M1/JR4rLCdikDYGSP8pmcUC4=; b=G5ZO1aWoUFQj675L9WFbwg4p3X
	Q2V0h/rgZLOmoNPHPcw9j8xcMa5dKaHDfPhq86oYLPh0Hc/CsIAy8vhEzVcb1sQ03c1wHfd47LYZW
	iZ6mtJLqEjIiddPytyK/3U82A/IQkeJ0Vz+9thZaKQfiD3iSTwclO2ZgiyFjcwTwloS1M09sMQ39q
	2ZybOAI3eBTmsmHvpSS44+gKDOfXhzj2x7jtxQPBWrWH4gyl+/8d/c/yXpIOq6kIqjwmJT/yRRqRe
	iJwMgwV2uYZfUbpX6uvd0zEGVF3xCAn+J1lgKSfS3i2i8DIjmnQ7rIR6+mirksOKDK8G6PKF01tQt
	zMIa8VDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ElE-000000083wU-1wx0;
	Thu, 03 Apr 2025 07:13:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Ej5-000000083bZ-0XZT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 07:11:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20879106F;
	Thu,  3 Apr 2025 00:11:00 -0700 (PDT)
Received: from [10.163.48.25] (unknown [10.163.48.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D029D3F694;
	Thu,  3 Apr 2025 00:10:49 -0700 (PDT)
Message-ID: <d94c6f97-4ca8-4a3a-ae8a-8e872eaa8d3b@arm.com>
Date: Thu, 3 Apr 2025 12:40:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 7/9] coresight: Make clock sequence consistent
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250327113803.1452108-1-leo.yan@arm.com>
 <20250327113803.1452108-8-leo.yan@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250327113803.1452108-8-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_001059_260490_C0803187 
X-CRM114-Status: GOOD (  16.38  )
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

On 3/27/25 17:08, Leo Yan wrote:
> Since atclk is enabled after pclk during the probe phase, this commit
> maintains the same sequence for the runtime resume flow.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-funnel.c     | 6 +++---
>  drivers/hwtracing/coresight/coresight-replicator.c | 6 +++---
>  drivers/hwtracing/coresight/coresight-stm.c        | 6 +++---
>  drivers/hwtracing/coresight/coresight-tpiu.c       | 6 +++---
>  4 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
> index ec6d3e656548..e378c2fffca9 100644
> --- a/drivers/hwtracing/coresight/coresight-funnel.c
> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
> @@ -299,11 +299,11 @@ static int funnel_runtime_resume(struct device *dev)
>  {
>  	struct funnel_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata && !IS_ERR(drvdata->atclk))
> -		clk_prepare_enable(drvdata->atclk);
> -
>  	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>  		clk_prepare_enable(drvdata->pclk);
> +
> +	if (drvdata && !IS_ERR(drvdata->atclk))
> +		clk_prepare_enable(drvdata->atclk);
>  	return 0;
>  }

funnel_probe() enables pclk after atclk though - which needs to be
reversed as well ?

static int funnel_probe(struct device *dev, struct resource *res)
{
	..................
        drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
        if (IS_ERR(drvdata->atclk))
                return PTR_ERR(drvdata->atclk);

        drvdata->pclk = coresight_get_enable_apb_pclk(dev);
        if (IS_ERR(drvdata->pclk))
                return PTR_ERR(drvdata->pclk);

>  #endif
> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
> index 460af0f7b537..78854f586e89 100644
> --- a/drivers/hwtracing/coresight/coresight-replicator.c
> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
> @@ -337,11 +337,11 @@ static int replicator_runtime_resume(struct device *dev)
>  {
>  	struct replicator_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata && !IS_ERR(drvdata->atclk))
> -		clk_prepare_enable(drvdata->atclk);
> -
>  	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>  		clk_prepare_enable(drvdata->pclk);
> +
> +	if (drvdata && !IS_ERR(drvdata->atclk))
> +		clk_prepare_enable(drvdata->atclk);
>  	return 0;
>  }

replicator_probe() enables pclk after atclk though - which needs to be
reversed as well ?

static int replicator_probe(struct device *dev, struct resource *res)
{
	..................
        drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
        if (IS_ERR(drvdata->atclk))
                return PTR_ERR(drvdata->atclk);

        drvdata->pclk = coresight_get_enable_apb_pclk(dev);
        if (IS_ERR(drvdata->pclk))
                return PTR_ERR(drvdata->pclk);



>  #endif
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> index f13fbab4d7a2..ddb4f6678efd 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -972,11 +972,11 @@ static int stm_runtime_resume(struct device *dev)
>  {
>  	struct stm_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata && !IS_ERR(drvdata->atclk))
> -		clk_prepare_enable(drvdata->atclk);
> -
>  	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>  		clk_prepare_enable(drvdata->pclk);
> +
> +	if (drvdata && !IS_ERR(drvdata->atclk))
> +		clk_prepare_enable(drvdata->atclk);
>  	return 0;
>  }
>  #endif

same here as well.

> diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
> index cac1b5bba086..8212959f60d4 100644
> --- a/drivers/hwtracing/coresight/coresight-tpiu.c
> +++ b/drivers/hwtracing/coresight/coresight-tpiu.c
> @@ -220,11 +220,11 @@ static int tpiu_runtime_resume(struct device *dev)
>  {
>  	struct tpiu_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata && !IS_ERR(drvdata->atclk))
> -		clk_prepare_enable(drvdata->atclk);
> -
>  	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>  		clk_prepare_enable(drvdata->pclk);
> +
> +	if (drvdata && !IS_ERR(drvdata->atclk))
> +		clk_prepare_enable(drvdata->atclk);
>  	return 0;
>  }
>  #endif

same here as well.

I assume this patch is trying to have the same clock sequence enablement
during original probe and resume path and then just the reverse sequence
during suspend path.

