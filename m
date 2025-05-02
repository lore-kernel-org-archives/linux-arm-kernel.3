Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3C8C3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 06:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mMkJU1Re8i3/vKXwbcLquHO07NuIDC8oMQhe1LLeiJw=; b=vt7N3quhM9JGCFgsQw9eZbfNhf
	PA5doYIPGGcopia054cLCUWnKqpn/DXhGsEQ5cS6AxJBuPPqVZ72hEKs9nTssriwJhjIP9+vVPESh
	+H3MRZVMUomo/9elOsM4OGgkazLLBk1I8daXmR2QxNDxF/CqtGH/DKuTuV1mwOdFjd5oBwYc3EAKL
	Ee8VlRnZQieMe+pTux0zgDPIvZm2bkyzqUu1nJ3J65Mu7P+zxCEQJBHg7cK6r8RbZMXBmzvQB3crp
	eohuUM4Gi8pz0K+LqEArReytxrM26jvIkBUgmsFbnbHQOW6L7WEEYG6+kb8gEjw3qsAiSZGJOQ3ny
	BbYXvA7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAkLu-000000012Qn-3iwB;
	Fri, 02 May 2025 06:58:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAkJz-0000000129E-0D7L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 06:56:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6661D106F;
	Thu,  1 May 2025 23:56:22 -0700 (PDT)
Received: from [10.163.80.122] (unknown [10.163.80.122])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 313E53F5A1;
	Thu,  1 May 2025 23:56:25 -0700 (PDT)
Message-ID: <2b39dd04-9b3a-4b50-99d5-e3a45cc3f374@arm.com>
Date: Fri, 2 May 2025 12:26:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] coresight: Make clock sequence consistent
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250423151726.372561-1-leo.yan@arm.com>
 <20250423151726.372561-9-leo.yan@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250423151726.372561-9-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_235631_180590_E77FCFC9 
X-CRM114-Status: GOOD (  14.79  )
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
> Since atclk is enabled after pclk during the probe phase, this commit
> maintains the same sequence for the runtime resume flow.

which is also the exact opposite of the suspend flow as expected.

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
> index 173fee3aaa6e..62e5125c37ad 100644
> --- a/drivers/hwtracing/coresight/coresight-funnel.c
> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
> @@ -296,11 +296,11 @@ static int funnel_runtime_resume(struct device *dev)
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
>  #endif
> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
> index 7250a2174145..56b03e6d8336 100644
> --- a/drivers/hwtracing/coresight/coresight-replicator.c
> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
> @@ -334,11 +334,11 @@ static int replicator_runtime_resume(struct device *dev)
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
>  #endif
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> index 89e90e7f54de..f17986edac00 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -969,11 +969,11 @@ static int stm_runtime_resume(struct device *dev)
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
> diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
> index b3d0db0e53b9..4701b34778bd 100644
> --- a/drivers/hwtracing/coresight/coresight-tpiu.c
> +++ b/drivers/hwtracing/coresight/coresight-tpiu.c
> @@ -218,11 +218,11 @@ static int tpiu_runtime_resume(struct device *dev)
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

These also matches the clock initialization sequence during probe()
via the new helper coresight_get_enable_clocks().

LGTM.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

