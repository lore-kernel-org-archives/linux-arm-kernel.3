Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F184CE7B1E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GjNMVxw3sy186tpIDWZ7FMZSb26DnU2kW5dD+c/ntOw=; b=KqeX6432aJnlQuVvIKc5GugUct
	inXq7DZbgvoGDkB9M7938vKTqCwC+oi4fpxjhEaBPyUlJMvXjVe+mN8T77qOkcFebhy1kKIIu4QU0
	BWZQDSsEabwgO9RvTKnevopuq+7q7juHIPEDq9Wcl15f0W01EZUGwNM1aE5p3e1dpSOxZCggRAM7I
	KO52vdpxzGKstn/99S7fLAG6aVNG+ill0NYIjglJ41MnjxZHd2lfwtOKN9pz8H9BZsBXQzqG5E6AN
	50uWUyYRfVT0X5Rnf8sFTheb2ZAHGZQtu2GPl2F3jnL0i13ZzupTUf/csED2fUTaZPo3faEg7VFRj
	tHUEMPlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvOt-0000000CSdm-1jZe;
	Fri, 14 Nov 2025 15:07:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvOs-0000000CSdI-29ON
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 15:07:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GjNMVxw3sy186tpIDWZ7FMZSb26DnU2kW5dD+c/ntOw=; b=qpQaBiaIXnZ7V+ofjuiKY7R2eh
	Q+ohuh64GQQG/i86DJcg1yX/nINdZGuoFOLvX5P4WtKh7FzKP+bp3AEWuCdQDiJMSiy++/bV7hsLI
	TUUXJ3Gwh97Ckv2HI5kalyuHJXGNrMlX4Dy47K/NJ0QpV2rVvP8FCJpXrc5Aay6xDPCn4MEUHMZ32
	wHOJwm4dLVndep800+k1Ts3hs6fXBezSQnalJI7w54fQs4VkZqEqtwbZQLAyU+fqNykI6kawfy/e7
	0YFe1SMz5oDTHfGXUFc6HaWG1QKffBhJ1jvP4H3KEyaPFYM17lDFGM63iKuHJYAeFtfOU85oi88O/
	sqrSjIng==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJuXA-00000002lmT-15X2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:12:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDEDC1063;
	Fri, 14 Nov 2025 07:07:31 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 351DF3F66E;
	Fri, 14 Nov 2025 07:07:39 -0800 (PST)
Date: Fri, 14 Nov 2025 15:07:37 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 06/13] coresight: Interpret ETMv3 config with
 ATTR_CFG_GET_FLD()
Message-ID: <20251114150737.GF3568724@e132581.arm.com>
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
 <20251112-james-cs-syncfreq-v4-6-165ba21401dc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-james-cs-syncfreq-v4-6-165ba21401dc@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_141216_471651_D5B60C98 
X-CRM114-Status: GOOD (  25.97  )
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

On Wed, Nov 12, 2025 at 03:22:12PM +0000, James Clark wrote:
> Currently we're programming attr->config directly into ETMCR after some
> validation. This obscures which fields are being used, and also makes it
> impossible to move fields around or use other configN fields in the
> future.
> 
> Improve it by only reading the fields that are valid and then setting
> the appropriate ETMCR bits based on each one.
> 
> The ETMCR_CTXID_SIZE part can be removed as it was never a valid option
> because it's not in ETM3X_SUPPORTED_OPTIONS.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

LGTM:

Reviewed-by: Leo Yan <leo.yan@arm.com>

> ---
>  drivers/hwtracing/coresight/coresight-etm3x-core.c | 24 ++++++++++++----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> index a5e809589d3e..4511fc2f8d72 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> @@ -28,6 +28,7 @@
>  #include <linux/uaccess.h>
>  #include <linux/clk.h>
>  #include <linux/perf_event.h>
> +#include <linux/perf/arm_pmu.h>
>  #include <asm/sections.h>
>  
>  #include "coresight-etm.h"
> @@ -339,21 +340,22 @@ static int etm_parse_event_config(struct etm_drvdata *drvdata,
>  	if (attr->config & ~ETM3X_SUPPORTED_OPTIONS)
>  		return -EINVAL;
>  
> -	config->ctrl = attr->config;
> +	config->ctrl = 0;
>  
> -	/* Don't trace contextID when runs in non-root PID namespace */
> -	if (!task_is_in_init_pid_ns(current))
> -		config->ctrl &= ~ETMCR_CTXID_SIZE;
> +	if (ATTR_CFG_GET_FLD(attr, cycacc))
> +		config->ctrl |= ETMCR_CYC_ACC;
> +
> +	if (ATTR_CFG_GET_FLD(attr, timestamp))
> +		config->ctrl |= ETMCR_TIMESTAMP_EN;
>  
>  	/*
> -	 * Possible to have cores with PTM (supports ret stack) and ETM
> -	 * (never has ret stack) on the same SoC. So if we have a request
> -	 * for return stack that can't be honoured on this core then
> -	 * clear the bit - trace will still continue normally
> +	 * Possible to have cores with PTM (supports ret stack) and ETM (never
> +	 * has ret stack) on the same SoC. So only enable when it can be honored
> +	 * - trace will still continue normally otherwise.
>  	 */
> -	if ((config->ctrl & ETMCR_RETURN_STACK) &&
> -	    !(drvdata->etmccer & ETMCCER_RETSTACK))
> -		config->ctrl &= ~ETMCR_RETURN_STACK;
> +	if (ATTR_CFG_GET_FLD(attr, retstack) &&
> +	    (drvdata->etmccer & ETMCCER_RETSTACK))
> +		config->ctrl |= ETMCR_RETURN_STACK;
>  
>  	return 0;
>  }
> 
> -- 
> 2.34.1
> 

