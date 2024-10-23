Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79ECCCDDE49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 10:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZuI7XeoSEsr1GK+cjuKJaoXJFOTBx/ZDug/v1VTe/pk=; b=kt0mKboYEhI5mTODiJHYh0yHiJ
	kvCfuCOw5qejjW8FarowH0KVmu6uYwtB6UO3A+qVJVa2qJTtskznpQ19UU5DbOppZGMaLLpGRXoRI
	W1QlmsYglQG+jG4xMW7lJ9PFVLASh0JD3Dz9C6H1fV1KBBhydPtNiJP2Y9YT74zW1d4dr2vaP6oJE
	8x2ZagoTEUW7bp/y49lBGJWi2DVH2brvJ8omkBNS7UaTmwN8MvLskRdfjkSP0ROA0qnxjCLTIQef0
	32KG4kLLDyO9g1FYHHFShnm/bPJuseg3tE4emzBxl+LqZGcj/vnGKDzPeuA4B7fOYlmiGgZdV8l/R
	QVVgK0VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3YNW-0000000Dwen-0pEk;
	Wed, 23 Oct 2024 10:14:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Xvp-0000000DqnG-0np2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 09:45:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A0BB339;
	Wed, 23 Oct 2024 02:46:01 -0700 (PDT)
Received: from [10.57.66.28] (unknown [10.57.66.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7C6DE3F71E;
	Wed, 23 Oct 2024 02:45:30 -0700 (PDT)
Message-ID: <98173130-bb52-4378-aa54-119b5c3ab131@arm.com>
Date: Wed, 23 Oct 2024 10:45:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 RESEND 3/3] coresight-tpdm: Add support to enable the
 lane for MCMB TPDM
Content-Language: en-GB
To: Mao Jinlong <quic_jinlmao@quicinc.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tao Zhang <quic_taozha@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20241011064732.8480-1-quic_jinlmao@quicinc.com>
 <20241011064732.8480-4-quic_jinlmao@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20241011064732.8480-4-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_024533_466822_8DB08D7F 
X-CRM114-Status: GOOD (  21.78  )
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

On 11/10/2024 07:47, Mao Jinlong wrote:
> From: Tao Zhang <quic_taozha@quicinc.com>
> 
> Add the sysfs file to set/get the enablement of the lane. For MCMB
> configurations, the field "E_LN" in CMB_CR register is the
> individual lane enables. MCMB lane N is enabled for trace
> generation when M_CMB_CR.E=1 and M_CMB_CR.E_LN[N]=1. For lanes
> that are not implemented on a given MCMB configuration, the
> corresponding bits of this field read as 0 and ignore writes.
> 
> Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
> ---
>   .../testing/sysfs-bus-coresight-devices-tpdm  |  7 +++++
>   drivers/hwtracing/coresight/coresight-tpdm.c  | 29 +++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-tpdm.h  |  3 ++
>   3 files changed, 39 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> index b3292fa2a022..214f681a68ec 100644
> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> @@ -265,3 +265,10 @@ Contact:	Tao Zhang (QUIC) <quic_taozha@quicinc.com>
>   Description:
>   		(RW) Set/Get which lane participates in the output pattern
>   		match cross trigger mechanism for the MCMB subunit TPDM.
> +
> +What:		/sys/bus/coresight/devices/<tpdm-name>/mcmb_lanes_select
> +Date:		June 2024
> +KernelVersion	6.9
> +Contact:	Tao Zhang (QUIC) <quic_taozha@quicinc.com>
> +Description:
> +		(RW) Set/Get the enablement of the individual lane.
> \ No newline at end of file
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
> index f32c119e1b67..f8e22f4c3b52 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
> @@ -1055,6 +1055,34 @@ static ssize_t mcmb_trig_lane_store(struct device *dev,
>   }
>   static DEVICE_ATTR_RW(mcmb_trig_lane);
>   
> +static ssize_t mcmb_lanes_select_show(struct device *dev,
> +				      struct device_attribute *attr,
> +				      char *buf)
> +{
> +	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +
> +	return sysfs_emit(buf, "%u\n",
> +			  (unsigned int)drvdata->cmb->mcmb->mcmb_lane_select);
> +}
> +
> +static ssize_t mcmb_lanes_select_store(struct device *dev,
> +				       struct device_attribute *attr,
> +				       const char *buf,
> +				       size_t size)
> +{
> +	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	unsigned long val;
> +
> +	if (kstrtoul(buf, 0, &val))

	if (kstrstoul(buf, 0, &val) || (val & ~TPDM_MCMB_E_LN_MASK)) ?

> +		return -EINVAL;
> +
> +	guard(spinlock)(&drvdata->spinlock);
> +	drvdata->cmb->mcmb->mcmb_lane_select = val & TPDM_MCMB_E_LN_MASK;
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RW(mcmb_lanes_select);
> +
>   static struct attribute *tpdm_dsb_edge_attrs[] = {
>   	&dev_attr_ctrl_idx.attr,
>   	&dev_attr_ctrl_val.attr,
> @@ -1219,6 +1247,7 @@ static struct attribute *tpdm_cmb_msr_attrs[] = {
>   
>   static struct attribute *tpdm_mcmb_attrs[] = {
>   	&dev_attr_mcmb_trig_lane.attr,
> +	&dev_attr_mcmb_lanes_select.attr,
>   	NULL,
>   };
>   
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
> index e72dc19da310..e740039cd650 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.h
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.h
> @@ -48,6 +48,9 @@
>   /* MAX lanes in the output pattern for MCMB configurations*/
>   #define TPDM_MCMB_MAX_LANES 8
>   
> +/* High performance mode */

This doesn't match the descriptions ?

Suzuki

> +#define TPDM_MCMB_E_LN_MASK		GENMASK(7, 0)
> +
>   /* DSB Subunit Registers */
>   #define TPDM_DSB_CR		(0x780)
>   #define TPDM_DSB_TIER		(0x784)


