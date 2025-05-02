Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB7EC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 08:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xDy8bSLdgEwCg1LBSSBw86QXLomX57x8aF1LWmsm5p0=; b=aYl+yN3LahJHVlAQwFiBEAdMU2
	2gThUXvvoY1qgrHpsNXOMjc7DZ/PUtgUpfdhT17r+bGSRJvQsx51PZ1lpI5hvsQs9rF0L4m0icQyD
	MVbGrFyVvONE//T/I+1xVIOKNtTgNkhNDTWfqDBUn0vGEpyQeG4RqS8hRh35hiiJyjDnOB4fg00Y7
	ljvZW9M7qy5y62Kx4e7TIAT8X2/iI2CeARGD/QQqx6QOTPpVjt8HYb7Mkj2jbn9038NqNPXBWrDs/
	n6iALH/tdYX6mFHOSd3oojqlCp9OATcaCBpXqmzWJ2uNTO9A9TtI10jVL5HYJ3ikbQ2SOcOAvgK0H
	s69alUow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAm3u-00000001EKf-3t0D;
	Fri, 02 May 2025 08:48:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAm1u-00000001Drj-1hRm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 08:46:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 854211688;
	Fri,  2 May 2025 01:45:49 -0700 (PDT)
Received: from [10.163.80.122] (unknown [10.163.80.122])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 093013F66E;
	Fri,  2 May 2025 01:45:52 -0700 (PDT)
Message-ID: <0ebbc509-9e17-4b93-9a72-b9e7cc03637e@arm.com>
Date: Fri, 2 May 2025 14:15:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] coresight: Refactor runtime PM
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250423151726.372561-1-leo.yan@arm.com>
 <20250423151726.372561-10-leo.yan@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250423151726.372561-10-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_014558_591844_C602D393 
X-CRM114-Status: GOOD (  18.48  )
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



On 4/23/25 20:47, Leo Yan wrote:
> The validation for driver data pointers and clock pointers are redundant
> in the runtime PM callbacks.  After a driver's probing, its driver data
> and clocks have been initialized successfully, this ensures it is safe
> to access driver data and clocks in the runtime PM callbacks.  A corner
> case is a clock pointer is NULL, in this case, the clock core layer can
> handle it properly.  So remove these redundant checking.
> 
> In runtime resume, respect values returned from clock function and add
> error handling.

Although not checking drvdata and drvdata->apb_clk does make sense, but
why change the semantics on the resume paths as well, which now returns
stored error value from clk_prepare_enable().

> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-cpu-debug.c  |  8 +++-----
>  drivers/hwtracing/coresight/coresight-ctcu-core.c  |  8 ++------
>  drivers/hwtracing/coresight/coresight-etb10.c      |  8 ++------
>  drivers/hwtracing/coresight/coresight-etm3x-core.c |  8 ++------
>  drivers/hwtracing/coresight/coresight-funnel.c     | 21 +++++++++++----------
>  drivers/hwtracing/coresight/coresight-replicator.c | 20 +++++++++++---------
>  drivers/hwtracing/coresight/coresight-stm.c        | 20 +++++++++++---------
>  drivers/hwtracing/coresight/coresight-tpiu.c       | 20 +++++++++++---------
>  8 files changed, 53 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> index 481ffcbed534..dff663ac7805 100644
> --- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
> +++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> @@ -731,8 +731,8 @@ static int debug_runtime_suspend(struct device *dev)
>  {
>  	struct debug_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_disable_unprepare(drvdata->pclk);
> +	clk_disable_unprepare(drvdata->pclk);
> +
>  	return 0;
>  }
>  
> @@ -740,9 +740,7 @@ static int debug_runtime_resume(struct device *dev)
>  {
>  	struct debug_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_prepare_enable(drvdata->pclk);
> -	return 0;
> +	return clk_prepare_enable(drvdata->pclk);
>  }
>  #endif
>  
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> index 75b5114ef652..c586495e9a08 100644
> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> @@ -278,8 +278,7 @@ static int ctcu_runtime_suspend(struct device *dev)
>  {
>  	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata && !IS_ERR_OR_NULL(drvdata->apb_clk))
> -		clk_disable_unprepare(drvdata->apb_clk);
> +	clk_disable_unprepare(drvdata->apb_clk);
>  
>  	return 0;
>  }
> @@ -288,10 +287,7 @@ static int ctcu_runtime_resume(struct device *dev)
>  {
>  	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata && !IS_ERR_OR_NULL(drvdata->apb_clk))
> -		clk_prepare_enable(drvdata->apb_clk);
> -
> -	return 0;
> +	return clk_prepare_enable(drvdata->apb_clk);
>  }
>  #endif
>  
> diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
> index 45c2f8f50a3f..3f3b0eb48fdb 100644
> --- a/drivers/hwtracing/coresight/coresight-etb10.c
> +++ b/drivers/hwtracing/coresight/coresight-etb10.c
> @@ -807,8 +807,7 @@ static int etb_runtime_suspend(struct device *dev)
>  {
>  	struct etb_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata && !IS_ERR(drvdata->atclk))
> -		clk_disable_unprepare(drvdata->atclk);
> +	clk_disable_unprepare(drvdata->atclk);
>  
>  	return 0;
>  }
> @@ -817,10 +816,7 @@ static int etb_runtime_resume(struct device *dev)
>  {
>  	struct etb_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata && !IS_ERR(drvdata->atclk))
> -		clk_prepare_enable(drvdata->atclk);
> -
> -	return 0;
> +	return clk_prepare_enable(drvdata->atclk);
>  }
>  #endif
>  
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> index adbb134f80e6..615ff743eef0 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> @@ -925,8 +925,7 @@ static int etm_runtime_suspend(struct device *dev)
>  {
>  	struct etm_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata && !IS_ERR(drvdata->atclk))
> -		clk_disable_unprepare(drvdata->atclk);
> +	clk_disable_unprepare(drvdata->atclk);
>  
>  	return 0;
>  }
> @@ -935,10 +934,7 @@ static int etm_runtime_resume(struct device *dev)
>  {
>  	struct etm_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata && !IS_ERR(drvdata->atclk))
> -		clk_prepare_enable(drvdata->atclk);
> -
> -	return 0;
> +	return clk_prepare_enable(drvdata->atclk);
>  }
>  #endif
>  
> diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
> index 62e5125c37ad..6494a3b5d18e 100644
> --- a/drivers/hwtracing/coresight/coresight-funnel.c
> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
> @@ -283,11 +283,8 @@ static int funnel_runtime_suspend(struct device *dev)
>  {
>  	struct funnel_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata && !IS_ERR(drvdata->atclk))
> -		clk_disable_unprepare(drvdata->atclk);
> -
> -	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_disable_unprepare(drvdata->pclk);
> +	clk_disable_unprepare(drvdata->atclk);
> +	clk_disable_unprepare(drvdata->pclk);
>  
>  	return 0;
>  }
> @@ -295,13 +292,17 @@ static int funnel_runtime_suspend(struct device *dev)
>  static int funnel_runtime_resume(struct device *dev)
>  {
>  	struct funnel_drvdata *drvdata = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_prepare_enable(drvdata->pclk);
> +	if (ret)
> +		return ret;
>  
> -	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_prepare_enable(drvdata->pclk);
> +	ret = clk_prepare_enable(drvdata->atclk);
> +	if (ret)
> +		clk_disable_unprepare(drvdata->pclk);
>  
> -	if (drvdata && !IS_ERR(drvdata->atclk))
> -		clk_prepare_enable(drvdata->atclk);
> -	return 0;
> +	return ret;
>  }
>  #endif
>  
> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
> index 56b03e6d8336..8595dc104795 100644
> --- a/drivers/hwtracing/coresight/coresight-replicator.c
> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
> @@ -322,24 +322,26 @@ static int replicator_runtime_suspend(struct device *dev)
>  {
>  	struct replicator_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata && !IS_ERR(drvdata->atclk))
> -		clk_disable_unprepare(drvdata->atclk);
> +	clk_disable_unprepare(drvdata->atclk);
> +	clk_disable_unprepare(drvdata->pclk);
>  
> -	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_disable_unprepare(drvdata->pclk);
>  	return 0;
>  }
>  
>  static int replicator_runtime_resume(struct device *dev)
>  {
>  	struct replicator_drvdata *drvdata = dev_get_drvdata(dev);
> +	int ret;
>  
> -	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_prepare_enable(drvdata->pclk);
> +	ret = clk_prepare_enable(drvdata->pclk);
> +	if (ret)
> +		return ret;
>  
> -	if (drvdata && !IS_ERR(drvdata->atclk))
> -		clk_prepare_enable(drvdata->atclk);
> -	return 0;
> +	ret = clk_prepare_enable(drvdata->atclk);
> +	if (ret)
> +		clk_disable_unprepare(drvdata->pclk);
> +
> +	return ret;
>  }
>  #endif
>  
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> index f17986edac00..f859ab932d22 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -957,24 +957,26 @@ static int stm_runtime_suspend(struct device *dev)
>  {
>  	struct stm_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata && !IS_ERR(drvdata->atclk))
> -		clk_disable_unprepare(drvdata->atclk);
> +	clk_disable_unprepare(drvdata->atclk);
> +	clk_disable_unprepare(drvdata->pclk);
>  
> -	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_disable_unprepare(drvdata->pclk);
>  	return 0;
>  }
>  
>  static int stm_runtime_resume(struct device *dev)
>  {
>  	struct stm_drvdata *drvdata = dev_get_drvdata(dev);
> +	int ret;
>  
> -	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_prepare_enable(drvdata->pclk);
> +	ret = clk_prepare_enable(drvdata->pclk);
> +	if (ret)
> +		return ret;
>  
> -	if (drvdata && !IS_ERR(drvdata->atclk))
> -		clk_prepare_enable(drvdata->atclk);
> -	return 0;
> +	ret = clk_prepare_enable(drvdata->atclk);
> +	if (ret)
> +		clk_disable_unprepare(drvdata->pclk);
> +
> +	return ret;
>  }
>  #endif
>  
> diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
> index 4701b34778bd..a68ed6b97bf7 100644
> --- a/drivers/hwtracing/coresight/coresight-tpiu.c
> +++ b/drivers/hwtracing/coresight/coresight-tpiu.c
> @@ -206,24 +206,26 @@ static int tpiu_runtime_suspend(struct device *dev)
>  {
>  	struct tpiu_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata && !IS_ERR(drvdata->atclk))
> -		clk_disable_unprepare(drvdata->atclk);
> +	clk_disable_unprepare(drvdata->atclk);
> +	clk_disable_unprepare(drvdata->pclk);
>  
> -	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_disable_unprepare(drvdata->pclk);
>  	return 0;
>  }
>  
>  static int tpiu_runtime_resume(struct device *dev)
>  {
>  	struct tpiu_drvdata *drvdata = dev_get_drvdata(dev);
> +	int ret;
>  
> -	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_prepare_enable(drvdata->pclk);
> +	ret = clk_prepare_enable(drvdata->pclk);
> +	if (ret)
> +		return ret;
>  
> -	if (drvdata && !IS_ERR(drvdata->atclk))
> -		clk_prepare_enable(drvdata->atclk);
> -	return 0;
> +	ret = clk_prepare_enable(drvdata->atclk);
> +	if (ret)
> +		clk_disable_unprepare(drvdata->pclk);
> +
> +	return ret;
>  }
>  #endif
>  

