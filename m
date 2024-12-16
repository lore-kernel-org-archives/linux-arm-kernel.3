Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E875E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 09:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/c7GZNUXwiTUWXiN5svU9h/Vqh5j1pQZlxSZR0FYw0=; b=uVTBSunJTIrWyHnQ23TcjUgjsE
	G5tlWelKOmULjQwYIckL9aP2bc8cfnJoCXAKdcRQw4HqQmqbJVkKRc/NKLsvzLNbCMlr2bVu5ycTO
	XNnBYJUDdQxqIwnJsJAGP2Qr+cO6NJwh80zFC74rt6BGAmObTPVPHn4pZI/rvhPMTzwGbEB5psu4F
	vPPRvLpWh318ZeT7oNN44MlRarN1b1cmFWYv8g2MqigFw+vh+4QTLgEp3kbi4FE4z1zjAzUOe+T6y
	vJkeEa1KVD5YEUmJuXpKYPU0BmuP/IlvI8EaaDn+8s1H5jHOvrE+F2M1pAMc+ei7hkj5+1/sYNEJ0
	y+1bjh4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN7VI-00000009YL5-2auL;
	Mon, 16 Dec 2024 09:35:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN7UC-00000009YAJ-1Opn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 09:33:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53170113E;
	Mon, 16 Dec 2024 01:34:21 -0800 (PST)
Received: from [10.57.71.247] (unknown [10.57.71.247])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6B7203F720;
	Mon, 16 Dec 2024 01:33:52 -0800 (PST)
Message-ID: <9094b068-ed3a-444d-b790-e43a652ab6e9@arm.com>
Date: Mon, 16 Dec 2024 09:33:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] coresight: tmc: Update error logging in tmc common
 functions
Content-Language: en-GB
To: Mike Leach <mike.leach@linaro.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org
Cc: james.clark@linaro.org, alexander.shishkin@linux.intel.com
References: <20241213144919.110642-1-mike.leach@linaro.org>
 <20241213144919.110642-3-mike.leach@linaro.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20241213144919.110642-3-mike.leach@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_013356_466535_A508CC70 
X-CRM114-Status: GOOD (  18.95  )
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

On 13/12/2024 14:49, Mike Leach wrote:
> Enhance the error logging in the tmc_wait_for_tmcready() and
> tmc_flush_and_stop() to print key tmc  register values on error
> conditions to improve hardware debug information.
> 
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> ---
>   .../hwtracing/coresight/coresight-tmc-core.c  | 37 +++++++++++++++----
>   drivers/hwtracing/coresight/coresight-tmc.h   |  2 +-
>   2 files changed, 30 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index e9876252a789..1a9299adae93 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -34,25 +34,36 @@ DEFINE_CORESIGHT_DEVLIST(etb_devs, "tmc_etb");
>   DEFINE_CORESIGHT_DEVLIST(etf_devs, "tmc_etf");
>   DEFINE_CORESIGHT_DEVLIST(etr_devs, "tmc_etr");
>   
> +#define TMC_WAIT_READY_FMT_STR "timeout while waiting for TMC to be Ready [STS=0x%04x]\n"
> +
>   int tmc_wait_for_tmcready(struct tmc_drvdata *drvdata)
>   {
>   	struct coresight_device *csdev = drvdata->csdev;
>   	struct csdev_access *csa = &csdev->access;
> +	u32 tmc_sts = 0;
>   
>   	/* Ensure formatter, unformatter and hardware fifo are empty */
> -	if (coresight_timeout(csa, TMC_STS, TMC_STS_TMCREADY_BIT, 1)) {
> -		dev_err(&csdev->dev,
> -			"timeout while waiting for TMC to be Ready\n");
> +	if (coresight_timeout_retval(csa, TMC_STS, TMC_STS_TMCREADY_BIT, 1,
> +				     &tmc_sts)) {
> +		dev_err(&csdev->dev, TMC_WAIT_READY_FMT_STR, tmc_sts);
>   		return -EBUSY;
>   	}
>   	return 0;
>   }
>   
> -void tmc_flush_and_stop(struct tmc_drvdata *drvdata)
> +int tmc_flush_and_stop(struct tmc_drvdata *drvdata)
>   {
>   	struct coresight_device *csdev = drvdata->csdev;
>   	struct csdev_access *csa = &csdev->access;
> -	u32 ffcr;
> +	u32 ffcr, ffsr, tmc_sts;
> +	int rc = 0;
> +
> +	/* note any MemErr present when stopping TMC */
> +	tmc_sts = readl_relaxed(drvdata->base + TMC_STS);
> +	if (tmc_sts & TMC_STS_MEMERR)
> +		dev_err(&csdev->dev,
> +			"MemErr detected before Manual Flush; STS[0x%02x]\n",
> +			tmc_sts);
>   
>   	ffcr = readl_relaxed(drvdata->base + TMC_FFCR);
>   	ffcr |= TMC_FFCR_STOP_ON_FLUSH;
> @@ -60,12 +71,22 @@ void tmc_flush_and_stop(struct tmc_drvdata *drvdata)
>   	ffcr |= BIT(TMC_FFCR_FLUSHMAN_BIT);
>   	writel_relaxed(ffcr, drvdata->base + TMC_FFCR);
>   	/* Ensure flush completes */
> -	if (coresight_timeout(csa, TMC_FFCR, TMC_FFCR_FLUSHMAN_BIT, 0)) {
> +	if (coresight_timeout_retval(csa, TMC_FFCR, TMC_FFCR_FLUSHMAN_BIT, 0,
> +				     &ffcr)) {
> +		ffsr = readl_relaxed(drvdata->base + TMC_FFSR);
>   		dev_err(&csdev->dev,
> -		"timeout while waiting for completion of Manual Flush\n");
> +			"timeout while waiting for completion of Manual Flush\n");
> +		dev_err(&csdev->dev,
> +			"regs: FFCR[0x%02x] FFSR[0x%02x] STS[0x%02x]\n",
> +			ffcr, ffsr, tmc_sts);
> +		rc = -EBUSY;
>   	}
>   
> -	tmc_wait_for_tmcready(drvdata);
> +	if (tmc_wait_for_tmcready(drvdata)) {
> +		dev_err(&csdev->dev, "TMC ready error after Manual flush\n");
> +		rc = -EBUSY;
> +	}
> +	return rc;
>   }

All of this looks good to me. Do we need to move the MemErr check post 
the flush ? There is a potential chance of hitting a MemERR on flushing
and we could miss reproting those ones ?

Suzuki

>   void tmc_enable_hw(struct tmc_drvdata *drvdata)
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index 2671926be62a..34513f07c3aa 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -259,7 +259,7 @@ struct tmc_sg_table {
>   
>   /* Generic functions */
>   int tmc_wait_for_tmcready(struct tmc_drvdata *drvdata);
> -void tmc_flush_and_stop(struct tmc_drvdata *drvdata);
> +int tmc_flush_and_stop(struct tmc_drvdata *drvdata);
>   void tmc_enable_hw(struct tmc_drvdata *drvdata);
>   void tmc_disable_hw(struct tmc_drvdata *drvdata);
>   u32 tmc_get_memwidth_mask(struct tmc_drvdata *drvdata);


