Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6771DD12D7A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 16:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YNHcidsGe04kdEErUl/oOuWTs8dVIo4GSpbJWtZxKKU=; b=BT9PcB7XYzG+56Ur4p99tBjnmP
	mryfX+hwPkVqTlVNMgW8QbCGdAh5U/WuqVxVsDNzmqaxKkCAX+ZyIzgWZAINJ1ea6lLO/b/0dgbHH
	Rjvo6KEY5rSt5YA0saZuCghSYAjaDui35jq4yFMOimTnAvGCr2pG4I7AakOy8X7XLjRjHY8Tmlenk
	few2kCE4TmFyX2+EksDUbZy9DOxbdwCIIG5SFwoSoq+gWYQDztpGaZVFc6j8yIvvKkX15NzWMmLYc
	8gs+ETCHik/GFB+uPQmcA56UDSqF3Fd9JYLWBCiLg4qX1KA3e64hvpLm6mtjM/wSdNgQTaEqxTv/x
	RO8mvKQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQpb6-00000006nL5-0Olr;
	Wed, 03 Dec 2025 16:20:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQpb3-00000006nKe-1z6b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 16:20:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FA33339;
	Wed,  3 Dec 2025 08:20:43 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09AB03F66E;
	Wed,  3 Dec 2025 08:20:48 -0800 (PST)
Message-ID: <9d163813-068b-4921-87fe-8e229692ba2b@arm.com>
Date: Wed, 3 Dec 2025 16:20:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/9] coresight: tmc: add etr_buf_list to store
 allocated etr_buf
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
 <20250908-enable-byte-cntr-for-tmc-v6-3-1db9e621441a@oss.qualcomm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250908-enable-byte-cntr-for-tmc-v6-3-1db9e621441a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_082053_636046_C5352F5F 
X-CRM114-Status: GOOD (  19.73  )
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

On 08/09/2025 03:01, Jie Gan wrote:
> Add a list to store allocated etr_buf.
> 
> The byte-cntr functionality requires two etr_buf to receive trace data.
> The active etr_buf collects the trace data from source device, while the
> byte-cntr reading function accesses the deactivated etr_buf after is
> has been filled and synced, transferring data to the userspace.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

This patch alone doesn't make any sense. Please fold it with a proper 
user (i.e. later patches). I can't make any sense of how this will be
used TBH without the following patches and on its own, it doesn't do
much anyways.

Suzuki


> ---
>   drivers/hwtracing/coresight/coresight-tmc-core.c |  1 +
>   drivers/hwtracing/coresight/coresight-tmc.h      | 17 +++++++++++++++++
>   2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index be964656be93..4d249af93097 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -830,6 +830,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>   		idr_init(&drvdata->idr);
>   		mutex_init(&drvdata->idr_mutex);
>   		dev_list = &etr_devs;
> +		INIT_LIST_HEAD(&drvdata->etr_buf_list);
>   		break;
>   	case TMC_CONFIG_TYPE_ETF:
>   		desc.groups = coresight_etf_groups;
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index 6541a27a018e..292e25d82b62 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -208,6 +208,19 @@ struct tmc_resrv_buf {
>   	s64		len;
>   };
>   
> +/**
> + * @sysfs_buf:	Allocated sysfs_buf.
> + * @is_free:	Indicates whether the buffer is free to choose.
> + * @pos:	Position of the buffer.
> + * @node:	Node in etr_buf_list.
> + */
> +struct etr_buf_node {
> +	struct etr_buf		*sysfs_buf;
> +	bool			is_free;
> +	loff_t			pos;
> +	struct list_head	node;
> +};
> +
>   /**
>    * struct tmc_drvdata - specifics associated to an TMC component
>    * @pclk:	APB clock if present, otherwise NULL
> @@ -242,6 +255,8 @@ struct tmc_resrv_buf {
>    *		(after crash) by default.
>    * @crash_mdata: Reserved memory for storing tmc crash metadata.
>    *		 Used by ETR/ETF.
> + * @etr_buf_list: List that is used to manage allocated etr_buf.
> + * @reading_node: Available buffer for byte-cntr reading.
>    */
>   struct tmc_drvdata {
>   	struct clk		*pclk;
> @@ -271,6 +286,8 @@ struct tmc_drvdata {
>   	struct etr_buf		*perf_buf;
>   	struct tmc_resrv_buf	resrv_buf;
>   	struct tmc_resrv_buf	crash_mdata;
> +	struct list_head        etr_buf_list;
> +	struct etr_buf_node     *reading_node;
>   };
>   
>   struct etr_buf_operations {
> 


