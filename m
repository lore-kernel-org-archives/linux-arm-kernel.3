Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F5DE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 14:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DwR8Wo6Od5uxfoDeyApscIhzH6q6khCgaGUdP4Xr41A=; b=H7lEzkE2ad2i0V57GCkWN0Ms5Y
	PVrNcX9ae6sUNiigrdVHDM5ky7NIKY9l3Z2uL0JrKTUkboHzkFrPvs4TZ25yP01q2IkP3Lp+oSqkU
	enEQtJwbkY2yqi+92agg/o3yv5lNxwHiwDFbu0oIlSTEQM8du3+GL/vtyu/x/fTU09Qf6NAPlyVvw
	4XKZemn4VkwJkYxXoKZbQZzmk1MKT2pDoMAVBr5CUCU13AyOX4T+f1pWokaaQQLScVmqylqavQtU7
	CnFTgj6Au2FRike1sfCFHtbMkoUtTWnUzqQi+P9wAWi/V7txoANq5RtZb3Zx5bNnQ6M7s/pn73HgJ
	igWLrwMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZ0N-0000000Dqrc-3om7;
	Tue, 17 Dec 2024 14:56:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYyf-0000000DqXT-2BXB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 14:55:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E25D91063;
	Tue, 17 Dec 2024 06:55:40 -0800 (PST)
Received: from [10.57.71.247] (unknown [10.57.71.247])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9EFE03F528;
	Tue, 17 Dec 2024 06:55:11 -0800 (PST)
Message-ID: <8ca3d31b-74a0-497a-9b53-dfe9becd0f7a@arm.com>
Date: Tue, 17 Dec 2024 14:55:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] coresight-tpdm: Add support to enable the lane for
 MCMB TPDM
Content-Language: en-GB
To: Mao Jinlong <quic_jinlmao@quicinc.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tao Zhang <quic_taozha@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20241105123940.39602-1-quic_jinlmao@quicinc.com>
 <20241105123940.39602-4-quic_jinlmao@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20241105123940.39602-4-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_065513_658579_4DF2756F 
X-CRM114-Status: GOOD (  20.71  )
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

On 05/11/2024 12:39, Mao Jinlong wrote:
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
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>   .../testing/sysfs-bus-coresight-devices-tpdm  |  7 +++++
>   drivers/hwtracing/coresight/coresight-tpdm.c  | 29 +++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-tpdm.h  |  3 ++
>   3 files changed, 39 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> index e833edfec79e..fcc2a8f1f17f 100644
> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> @@ -265,3 +265,10 @@ Contact:	Tao Zhang (QUIC) <quic_taozha@quicinc.com>
>   Description:
>   		(RW) Set/Get which lane participates in the output pattern
>   		match cross trigger mechanism for the MCMB subunit TPDM.
> +
> +What:		/sys/bus/coresight/devices/<tpdm-name>/mcmb_lanes_select
> +Date:		Nov 2024
> +KernelVersion	6.13

6.14

Suzuki


> +Contact:	Tao Zhang (QUIC) <quic_taozha@quicinc.com>
> +Description:
> +		(RW) Set/Get the enablement of the individual lane.
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
> index 2e4dc86b03ea..bb0d6505ec9f 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
> @@ -1063,6 +1063,34 @@ static ssize_t mcmb_trig_lane_store(struct device *dev,
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
> +			  (unsigned int)drvdata->cmb->mcmb.lane_select);
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
> +	if (kstrtoul(buf, 0, &val) || (val & ~TPDM_MCMB_E_LN_MASK))
> +		return -EINVAL;
> +
> +	guard(spinlock)(&drvdata->spinlock);
> +	drvdata->cmb->mcmb.lane_select = val & TPDM_MCMB_E_LN_MASK;
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RW(mcmb_lanes_select);
> +
>   static struct attribute *tpdm_dsb_edge_attrs[] = {
>   	&dev_attr_ctrl_idx.attr,
>   	&dev_attr_ctrl_val.attr,
> @@ -1227,6 +1255,7 @@ static struct attribute *tpdm_cmb_msr_attrs[] = {
>   
>   static struct attribute *tpdm_mcmb_attrs[] = {
>   	&dev_attr_mcmb_trig_lane.attr,
> +	&dev_attr_mcmb_lanes_select.attr,
>   	NULL,
>   };
>   
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
> index aa9746b2e77f..a80f3d680995 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.h
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.h
> @@ -48,6 +48,9 @@
>   /* MAX lanes in the output pattern for MCMB configurations*/
>   #define TPDM_MCMB_MAX_LANES 8
>   
> +/* Filter bit 0~7 from the value for CR_E_LN */
> +#define TPDM_MCMB_E_LN_MASK		GENMASK(7, 0)
> +
>   /* DSB Subunit Registers */
>   #define TPDM_DSB_CR		(0x780)
>   #define TPDM_DSB_TIER		(0x784)


