Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC49C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 09:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F03UWiz9sqyE/lLERqq+zEVb3woV/j4XoPFqk23mX8E=; b=LIERcSWB9VCXEok6UaQkSQ/TCQ
	ubN5J3XOJI5ACXUb9vViG/5XLl4aGxA0rUdLdjsSNzlXl7D+yScicRw23HwFW8nNln7BnJTTbyrIn
	0ImSUjCsCRjZ4Pv/3t5KW8aD3TkBZe6arvbw66VgCaZl1LISaLlSPdaJkSxjDiTaIxb6X01sknAOv
	YIexzOXTfHE6kIXPuDuH1DWjhen1yljAWxOaeiSbAT663y0yoVJ50SGiqC/Ta5W6n8iVmviBeNUq0
	E1UuzrQW+3DkzEYclSDFT3TiKJmhjY0wPmDzGFfetOek+zCNSfyau5MaivcUhqB06D2Ap/9OGbjc0
	Lk8ZUITQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA3pN-0000000CNgy-0MLM;
	Wed, 30 Apr 2025 09:34:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA3d5-0000000CLIC-1o6F
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Apr 2025 09:21:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=F03UWiz9sqyE/lLERqq+zEVb3woV/j4XoPFqk23mX8E=; b=Xv2PNwzyUIAlzQ6qDQSueOLWnW
	p/E91U0jynJ3YvQLfQtzZFRv29HMY8AvRv5wUf2CNngR6dGO9qBJ8kDf8ITx4TR4OkLM87H6yzt8E
	0cZnEnmcYPbWI0khOglq1usoVTnJ/X8cMwe1rdMn5rNk91rmyqRkqpSCdP0bteuZn0InuwPEQUqtl
	zdp4jMMqLtWjXrUwpP4xIZ233CgRpwE+6fT9SwPqaLXI52PLisZLXcAX0X8lsI2NyNxDjRp8ivgS6
	l/BM/lcUZ26k0aBrkFgTocagh1vei7vsFdn1KDDbkNePzGR+kGfsfkxxaN7tcJNAR/RVMk7JCudjI
	qkPIrTfA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uA3d1-0000000DkwN-1p7L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 09:21:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 125CE106F;
	Wed, 30 Apr 2025 02:21:09 -0700 (PDT)
Received: from [10.1.33.69] (Suzukis-MBP.cambridge.arm.com [10.1.33.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B45673F5A1;
	Wed, 30 Apr 2025 02:21:14 -0700 (PDT)
Message-ID: <e99c390f-229f-41cf-8646-b1400331605e@arm.com>
Date: Wed, 30 Apr 2025 10:21:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] coresight: etm4x: Extract the trace unit
 controlling
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250401180708.385396-1-leo.yan@arm.com>
 <20250401180708.385396-2-leo.yan@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250401180708.385396-2-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_102120_161708_B320C404 
X-CRM114-Status: GOOD (  29.49  )
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

On 01/04/2025 19:07, Leo Yan wrote:
> The trace unit is controlled in the ETM hardware enabling and disabling.
> The sequential changes for support AUX pause and resume will reuse the
> same operations.
> 
> Extract the operations in the etm4_{enable|disable}_trace_unit()
> functions.  A minor improvement in etm4_enable_trace_unit() is for
> returning the timeout error to callers.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> Reviewed-by: Mike Leach <mike.leach@linaro.org>

The patch looks good to me. One comment below, nothing with your patch 
though.


> ---
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 103 +++++++++++++++++++++++++----------------
>   1 file changed, 62 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index e5972f16abff..53cb0569dbbf 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -431,6 +431,44 @@ static int etm4x_wait_status(struct csdev_access *csa, int pos, int val)
>   	return coresight_timeout(csa, TRCSTATR, pos, val);
>   }
>   
> +static int etm4_enable_trace_unit(struct etmv4_drvdata *drvdata)
> +{
> +	struct coresight_device *csdev = drvdata->csdev;
> +	struct device *etm_dev = &csdev->dev;
> +	struct csdev_access *csa = &csdev->access;
> +
> +	/*
> +	 * ETE mandates that the TRCRSR is written to before
> +	 * enabling it.
> +	 */
> +	if (etm4x_is_ete(drvdata))
> +		etm4x_relaxed_write32(csa, TRCRSR_TA, TRCRSR);
> +
> +	etm4x_allow_trace(drvdata);
> +	/* Enable the trace unit */
> +	etm4x_relaxed_write32(csa, 1, TRCPRGCTLR);
> +
> +	/* Synchronize the register updates for sysreg access */
> +	if (!csa->io_mem)
> +		isb();
> +
> +	/* wait for TRCSTATR.IDLE to go back down to '0' */
> +	if (etm4x_wait_status(csa, TRCSTATR_IDLE_BIT, 0)) {
> +		dev_err(etm_dev,
> +			"timeout while waiting for Idle Trace Status\n");
> +		return -ETIME;
> +	}
> +
> +	/*
> +	 * As recommended by section 4.3.7 ("Synchronization when using the
> +	 * memory-mapped interface") of ARM IHI 0064D
> +	 */
> +	dsb(sy);
> +	isb();
> +
> +	return 0;
> +}
> +
>   static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>   {
>   	int i, rc;
> @@ -539,33 +577,7 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>   		etm4x_relaxed_write32(csa, trcpdcr | TRCPDCR_PU, TRCPDCR);
>   	}
>   
> -	/*
> -	 * ETE mandates that the TRCRSR is written to before
> -	 * enabling it.
> -	 */
> -	if (etm4x_is_ete(drvdata))
> -		etm4x_relaxed_write32(csa, TRCRSR_TA, TRCRSR);
> -
> -	etm4x_allow_trace(drvdata);
> -	/* Enable the trace unit */
> -	etm4x_relaxed_write32(csa, 1, TRCPRGCTLR);
> -
> -	/* Synchronize the register updates for sysreg access */
> -	if (!csa->io_mem)
> -		isb();
> -
> -	/* wait for TRCSTATR.IDLE to go back down to '0' */
> -	if (etm4x_wait_status(csa, TRCSTATR_IDLE_BIT, 0))
> -		dev_err(etm_dev,
> -			"timeout while waiting for Idle Trace Status\n");
> -
> -	/*
> -	 * As recommended by section 4.3.7 ("Synchronization when using the
> -	 * memory-mapped interface") of ARM IHI 0064D
> -	 */
> -	dsb(sy);
> -	isb();
> -
> +	rc = etm4_enable_trace_unit(drvdata);
>   done:
>   	etm4_cs_lock(drvdata, csa);
>   
> @@ -884,25 +896,12 @@ static int etm4_enable(struct coresight_device *csdev, struct perf_event *event,
>   	return ret;
>   }
>   
> -static void etm4_disable_hw(void *info)
> +static void etm4_disable_trace_unit(struct etmv4_drvdata *drvdata)
>   {
>   	u32 control;
> -	struct etmv4_drvdata *drvdata = info;
> -	struct etmv4_config *config = &drvdata->config;
>   	struct coresight_device *csdev = drvdata->csdev;
>   	struct device *etm_dev = &csdev->dev;
>   	struct csdev_access *csa = &csdev->access;
> -	int i;
> -
> -	etm4_cs_unlock(drvdata, csa);
> -	etm4_disable_arch_specific(drvdata);
> -
> -	if (!drvdata->skip_power_up) {
> -		/* power can be removed from the trace unit now */
> -		control = etm4x_relaxed_read32(csa, TRCPDCR);
> -		control &= ~TRCPDCR_PU;
> -		etm4x_relaxed_write32(csa, control, TRCPDCR);
> -	}
>   
>   	control = etm4x_relaxed_read32(csa, TRCPRGCTLR);
>   
> @@ -943,6 +942,28 @@ static void etm4_disable_hw(void *info)
>   	 * of ARM IHI 0064H.b.
>   	 */
>   	isb();
> +}
> +
> +static void etm4_disable_hw(void *info)
> +{
> +	u32 control;
> +	struct etmv4_drvdata *drvdata = info;
> +	struct etmv4_config *config = &drvdata->config;
> +	struct coresight_device *csdev = drvdata->csdev;
> +	struct csdev_access *csa = &csdev->access;
> +	int i;
> +
> +	etm4_cs_unlock(drvdata, csa);
> +	etm4_disable_arch_specific(drvdata);
> +
> +	if (!drvdata->skip_power_up) {
> +		/* power can be removed from the trace unit now */
> +		control = etm4x_relaxed_read32(csa, TRCPDCR);
> +		control &= ~TRCPDCR_PU;
> +		etm4x_relaxed_write32(csa, control, TRCPDCR);
> +	}

Shouldn't we delay ^^ until we have read all the registers back and 
disabled the trace ? As I said, this is an existing problem and may need
to be fixed. It would be good to move it after we have done everything 
with the accesses. If we start with that patch, we could easily backport
it to stable.


Suzuki


> +
> +	etm4_disable_trace_unit(drvdata);
>   
>   	/* read the status of the single shot comparators */
>   	for (i = 0; i < drvdata->nr_ss_cmp; i++) {


