Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EE7CA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 06:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c6YJuhedJRK4dI/S7YyGfYS41mgc91F4B7g0TFXuP9M=; b=h8LXtFUR199APzcAm9WoE9ptMl
	S1ZOAYl/0YqHAzuKrx0uRGYdpBBFnb6ZIKtrvc6qH29GEQKW0GJBiLyGE3K/cYGwIawDsza4W2CPj
	Tn7BcgK/tJayiAHiA3zaaNmUx02WQ1AfbMva54QDYvILemzTp9OW0SalqWFxZ3EJBVqPB4pjOEwmc
	/27Xcg4b3XTmdSDyYJ2kQiEmq5ZY6M8QZTe1bxM6i26k4chFR7TyVH/A9REv0+2DDoJxMQahUhKAl
	UxUc+mpGVzgEcXFwmFfgf0EW261BQHMIVDgpV5R6MqNHtTO5dAx1acwvKZ4ZDo04ETdjBj/lyENZH
	dw5qi72g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCswn-0000000D54M-0yS1;
	Sat, 03 Oct 2026 06:10:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCswk-0000000D53k-28yh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 06:10:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D4B92F;
	Fri,  2 Oct 2026 23:10:04 -0700 (PDT)
Received: from [10.57.8.170] (unknown [10.57.8.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3AFDB3F763;
	Fri,  2 Oct 2026 23:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791007807; bh=Q88K6c2p+V4U9XzYzl+P/XsCq4/B0X4qU3qU4p8xVnY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tBT5G2DIgzL1ccv4x26BwoZyvujNVbTt5W37TYDCRmwiYao13lwP0PFQjLNauJOR4
	 vRLUNPJxU7ShBkFlhZNUM7Pdy/uoELx9psdqI+7X7QalRn0tvcrMALxJQ5e+5MPqsQ
	 0tIRFLNl8T0zEycDv284LDrqDn35ga4XBy9RtcnY=
Message-ID: <ed658964-bdf2-4258-946e-0fc115d33975@arm.com>
Date: Sat, 3 Oct 2026 07:10:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v13 03/14] coresight: etm3x: prohibit modifying
 cntr_val and reset while session is enabled
Content-Language: en-GB
To: Yeoreum Yun <yeoreum.yun@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
References: <20261003-separate_etm_cfg_v2-v13-0-5d8a29aead95@arm.com>
 <20261003-separate_etm_cfg_v2-v13-3-5d8a29aead95@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261003-separate_etm_cfg_v2-v13-3-5d8a29aead95@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_231010_759532_C9298F15 
X-CRM114-Status: GOOD (  17.43  )
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

On 03/10/2026 03:52, Yeoreum Yun wrote:
> cntr_val are overwritten with the values read from the corresponding
> registers by etm_disable_hw() when the session is disabled.
> 
> This means that any changes to this value made while the session is
> enabled would be lost when the session is disabled.
> 
> Also, reset shouldn't be called while session is enabled.
> 
> Therefore, prohibit modifying cntr_val and reset while the session is enabled.
> 

Same as the other one, fixed subject and the above line

Cheers
Suzuki

> Reviewed-by: Mike Leach <mike.leach@arm.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm3x-sysfs.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> index b3c67e96a82a..cdb70a4382eb 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> @@ -75,6 +75,10 @@ static ssize_t reset_store(struct device *dev,
>   	if (ret)
>   		return ret;
>   
> +	if (IS_ERR_OR_NULL(drvdata->csdev) ||
> +	    coresight_get_mode(drvdata->csdev))
> +		return -EBUSY;
> +
>   	if (val) {
>   		spin_lock(&drvdata->spinlock);
>   		memset(config, 0, sizeof(struct etm_config));
> @@ -744,6 +748,9 @@ static ssize_t cntr_val_store(struct device *dev,
>   	ret = kstrtoul(buf, 16, &val);
>   	if (ret)
>   		return ret;
> +	if (IS_ERR_OR_NULL(drvdata->csdev) ||
> +	    coresight_get_mode(drvdata->csdev))
> +		return -EBUSY;
>   
>   	spin_lock(&drvdata->spinlock);
>   	config->cntr_val[config->cntr_idx] = val;
> 


