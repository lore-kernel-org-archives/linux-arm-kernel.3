Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1054C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qz2jBtAAa++4Q3j8hazgRo9C7PlMfBWbWDI06fqnqyI=; b=ZdOH77q3pgxvsWvp9EgavSnv4G
	1BVp+zv1qGbbARYHt6L8ZRNMakO5CyY8Md/lENUOKxduDLyZs/S4ClGEHvKDRXHy5P4gbgbUWn2nl
	GLDFHjXp9VWUt0uK1aV8qGiCapP8+5NO5aE52qA+euxKBzlaFedWQ4mVKkHxH9oUe0ShCtQ7Ijw2l
	GGncU6ZNg/3Hg76M2UzfrDBZPvJjzP/kQ/3ogRVu1zH8M2NxQ8Zh2N3US25iHbx2tX/bw2Ep0AuT2
	bTwstWKq4k9YM/F3hsWCxSoTmz/DQquWyn0xlKC2KnpEEIcC6hM1mQWO/2rePafOKc+fEt1xtL61l
	FVLobwBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virbm-00000006nru-03aK;
	Thu, 22 Jan 2026 10:08:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virbj-00000006nrV-41hA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 10:08:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B15EC1476;
	Thu, 22 Jan 2026 02:07:57 -0800 (PST)
Received: from [10.57.9.125] (unknown [10.57.9.125])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D5243F740;
	Thu, 22 Jan 2026 02:08:01 -0800 (PST)
Message-ID: <f78f72ec-9b57-4373-a7f0-a9295326832b@arm.com>
Date: Thu, 22 Jan 2026 10:07:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/8] coresight: tmc: Introduce sysfs_read_ops to wrap
 sysfs read operations
Content-Language: en-GB
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com>
 <20260122-enable-byte-cntr-for-ctcu-v10-3-22978e3c169f@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260122-enable-byte-cntr-for-ctcu-v10-3-22978e3c169f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_020808_114549_E8C9E10C 
X-CRM114-Status: GOOD (  21.02  )
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

On 22/01/2026 02:08, Jie Gan wrote:
> Introduce sysfs_read_ops as a wrapper, wrap sysfs read operations, for reading
> trace data from the TMC buffer.
> 
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-tmc-core.c | 50 +++++++++++-------------
>   drivers/hwtracing/coresight/coresight-tmc.h      | 17 ++++++++
>   2 files changed, 40 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index 1ea255ffa67c..8b0397a77e57 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -232,17 +232,10 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
>   {
>   	int ret = 0;
>   
> -	switch (drvdata->config_type) {
> -	case TMC_CONFIG_TYPE_ETB:
> -	case TMC_CONFIG_TYPE_ETF:
> -		ret = tmc_read_prepare_etb(drvdata);
> -		break;
> -	case TMC_CONFIG_TYPE_ETR:
> -		ret = tmc_read_prepare_etr(drvdata);
> -		break;
> -	default:
> +	if (drvdata->sysfs_ops)
> +		ret = drvdata->sysfs_ops->read_prepare(drvdata);
> +	else
>   		ret = -EINVAL;
> -	}
>   
>   	if (!ret)
>   		dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
> @@ -254,17 +247,10 @@ static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
>   {
>   	int ret = 0;
>   
> -	switch (drvdata->config_type) {
> -	case TMC_CONFIG_TYPE_ETB:
> -	case TMC_CONFIG_TYPE_ETF:
> -		ret = tmc_read_unprepare_etb(drvdata);
> -		break;
> -	case TMC_CONFIG_TYPE_ETR:
> -		ret = tmc_read_unprepare_etr(drvdata);
> -		break;
> -	default:
> +	if (drvdata->sysfs_ops)
> +		ret = drvdata->sysfs_ops->read_unprepare(drvdata);
> +	else
>   		ret = -EINVAL;
> -	}
>   
>   	if (!ret)
>   		dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
> @@ -291,13 +277,8 @@ static int tmc_open(struct inode *inode, struct file *file)
>   static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
>   				   char **bufpp)
>   {
> -	switch (drvdata->config_type) {
> -	case TMC_CONFIG_TYPE_ETB:
> -	case TMC_CONFIG_TYPE_ETF:
> -		return tmc_etb_get_sysfs_trace(drvdata, pos, len, bufpp);
> -	case TMC_CONFIG_TYPE_ETR:
> -		return tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
> -	}
> +	if (drvdata->sysfs_ops)
> +		return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);

minor nit: Please could we bail out in tmc_open() if the 
drvdata->sysfs_ops is not set. That way, we don't have to sprinkle it 
everywhere. And also, we don't expect to see this case anyways.

>   
>   	return -EINVAL;
>   }
> @@ -769,6 +750,18 @@ static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
>   			"Valid crash tracedata found\n");
>   }
>   
> +static const struct sysfs_read_ops tmc_etb_sysfs_read_ops = {

minor nit: please could we rename the struct type to :

struct tmc_sysfs_ops

and then use

etb_sysfs_ops = {}
etr_sysfs_ops = {}


Rest looks fine to me

Suzuki

> +	.read_prepare	= tmc_read_prepare_etb,
> +	.read_unprepare	= tmc_read_unprepare_etb,
> +	.get_trace_data	= tmc_etb_get_sysfs_trace,
> +};
> +
> +static const struct sysfs_read_ops tmc_etr_sysfs_read_ops = {
> +	.read_prepare	= tmc_read_prepare_etr,
> +	.read_unprepare	= tmc_read_unprepare_etr,
> +	.get_trace_data	= tmc_etr_get_sysfs_trace,
> +};
> +
>   static int __tmc_probe(struct device *dev, struct resource *res)
>   {
>   	int ret = 0;
> @@ -828,6 +821,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>   		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
>   		desc.ops = &tmc_etb_cs_ops;
>   		dev_list = &etb_devs;
> +		drvdata->sysfs_ops = &tmc_etb_sysfs_read_ops;
>   		break;
>   	case TMC_CONFIG_TYPE_ETR:
>   		desc.groups = coresight_etr_groups;
> @@ -841,6 +835,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>   		mutex_init(&drvdata->idr_mutex);
>   		dev_list = &etr_devs;
>   		INIT_LIST_HEAD(&drvdata->etr_buf_list);
> +		drvdata->sysfs_ops = &tmc_etr_sysfs_read_ops;
>   		break;
>   	case TMC_CONFIG_TYPE_ETF:
>   		desc.groups = coresight_etf_groups;
> @@ -849,6 +844,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>   		desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
>   		desc.ops = &tmc_etf_cs_ops;
>   		dev_list = &etf_devs;
> +		drvdata->sysfs_ops = &tmc_etb_sysfs_read_ops;
>   		break;
>   	default:
>   		pr_err("%s: Unsupported TMC config\n", desc.name);
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index 9b3c4e6f0a5e..c9a82ff6cd00 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -221,6 +221,8 @@ struct etr_buf_node {
>   	struct list_head	node;
>   };
>   
> +struct sysfs_read_ops;
> +
>   /**
>    * struct tmc_drvdata - specifics associated to an TMC component
>    * @atclk:	optional clock for the core parts of the TMC.
> @@ -258,6 +260,7 @@ struct etr_buf_node {
>    *		 Used by ETR/ETF.
>    * @etr_buf_list: List that is used to manage allocated etr_buf.
>    * @reading_node: Available buffer_node for byte-cntr reading.
> + * @sysfs_ops:	Read operations for sysfs mode.
>    */
>   struct tmc_drvdata {
>   	struct clk		*atclk;
> @@ -290,6 +293,20 @@ struct tmc_drvdata {
>   	struct tmc_resrv_buf	crash_mdata;
>   	struct list_head        etr_buf_list;
>   	struct etr_buf_node     *reading_node;
> +	const struct sysfs_read_ops	*sysfs_ops;
> +};
> +
> +/**
> + * struct sysfs_read_ops - read operations for TMC and its helper devices
> + * @read_prepare:	prepare operation.
> + * @read_unprepare:	unprepare operation.
> + * @get_trace_data:	read operation.
> + */
> +struct sysfs_read_ops {
> +	int (*read_prepare)(struct tmc_drvdata *drvdata);
> +	int (*read_unprepare)(struct tmc_drvdata *drvdata);
> +	ssize_t (*get_trace_data)(struct tmc_drvdata *drvdata, loff_t pos,
> +				  size_t len, char **bufpp);
>   };
>   
>   struct etr_buf_operations {
> 


