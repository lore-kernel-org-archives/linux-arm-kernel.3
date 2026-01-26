Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAA4D19501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 16:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4OcDfh/FvtG+LxPKpO91sJONkVp0lR/biQur/Xrpdaw=; b=itly98+rtY38HjxhKjY8F+4AZB
	ccIdEbjyxxZS8Bl8ajg+PCR+mQ1BuxSkY4/WCtDsjQBuvNLeckLPL4AhKjhKITFXY0WxV1CG6Lgq0
	SWufQT/lsLSCtyQmRLQRTIV08k08Bi1f3Rc5DZmaxj24Q/kCVGMIIbNSnA49IaLqwubAjufzp0Wuo
	DqneLVGiPy8iHZleD4q5kc/9G7cx5L3diYZrHB91atkW06N2gJ/G3tSQA7jYw3YLjOhL/1zD+dvgg
	3KGKzormcIY1ATYDRgfSoIrKYBLAMzh2dAiEQBSDc1uoGmje6r4e7WVudbiTFoucesHK29ZbuON1X
	BCAxq3Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPAs-0000000Cpwq-1Xky;
	Mon, 26 Jan 2026 16:10:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPAp-0000000CpwA-3oLN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 16:10:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52723339;
	Mon, 26 Jan 2026 08:10:35 -0800 (PST)
Received: from [10.57.68.157] (unknown [10.57.68.157])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D7493F5CA;
	Mon, 26 Jan 2026 08:10:39 -0800 (PST)
Message-ID: <c046085f-82e8-4a77-93be-c2a8d59db97e@arm.com>
Date: Mon, 26 Jan 2026 16:10:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/8] coresight: etr: refactor the
 tmc_etr_get_catu_device function
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
 <20260122-enable-byte-cntr-for-ctcu-v10-4-22978e3c169f@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260122-enable-byte-cntr-for-ctcu-v10-4-22978e3c169f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_081044_039544_804D982B 
X-CRM114-Status: GOOD (  22.53  )
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
> Refactor tmc_etr_get_catu_device to retrieve the helper device connected
> to the TMC ETR based on helper_subtype.

Please could you leave this as it is and add :

tmc_etr_get_ctcu_device() ?

It doesn't make much sense to refactor something that is a wrapper for
a generic function. Please avoid un-necessary abstraction

Suzuki


> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-catu.c    |  3 ++-
>   drivers/hwtracing/coresight/coresight-tmc-etr.c | 32 ++++++++++++++++---------
>   drivers/hwtracing/coresight/coresight-tmc.h     |  3 ++-
>   3 files changed, 25 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> index 69b36bae97ab..d3972619cc96 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -334,7 +334,8 @@ static int catu_alloc_etr_buf(struct tmc_drvdata *tmc_drvdata,
>   	struct tmc_sg_table *catu_table;
>   	struct catu_etr_buf *catu_buf;
>   
> -	csdev = tmc_etr_get_catu_device(tmc_drvdata);
> +	csdev = tmc_etr_get_helper_device(tmc_drvdata,
> +			CORESIGHT_DEV_SUBTYPE_HELPER_CATU);
>   	if (!csdev)
>   		return -ENODEV;
>   	catu_buf = kzalloc(sizeof(*catu_buf), GFP_KERNEL);
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index cbbb15648fb7..16a4562533d5 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -844,28 +844,37 @@ static const struct etr_buf_operations etr_sg_buf_ops = {
>   };
>   
>   /*
> - * TMC ETR could be connected to a CATU device, which can provide address
> - * translation service. This is represented by the Output port of the TMC
> - * (ETR) connected to the input port of the CATU.
> + * TMC ETR could be connected to the helper device, which can provide address
> + * translation service(CATU) or data filter function(CTCU). This is represented
> + * by the Output port of the TMC (ETR) connected to the input port of the helper.
>    *
> - * Returns	: coresight_device ptr for the CATU device if a CATU is found.
> + * @drvdata	: drvdata of the TMC device
> + * @subtype	: helper_subtype of the helper device
> + *
> + * Returns	: coresight_device ptr for the helper device if a helper is found.
>    *		: NULL otherwise.
>    */
>   struct coresight_device *
> -tmc_etr_get_catu_device(struct tmc_drvdata *drvdata)
> +tmc_etr_get_helper_device(struct tmc_drvdata *drvdata,
> +			  enum coresight_dev_subtype_helper subtype)
>   {
>   	struct coresight_device *etr = drvdata->csdev;
> -	union coresight_dev_subtype catu_subtype = {
> -		.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CATU
> +	union coresight_dev_subtype helper_subtype = {
> +		.helper_subtype = subtype
>   	};
>   
> -	if (!IS_ENABLED(CONFIG_CORESIGHT_CATU))
> +
> +	if (subtype == CORESIGHT_DEV_SUBTYPE_HELPER_CATU &&
> +	    !IS_ENABLED(CONFIG_CORESIGHT_CATU))
> +		return NULL;
> +	else if (subtype == CORESIGHT_DEV_SUBTYPE_HELPER_CTCU &&
> +		 !IS_ENABLED(CONFIG_CORESIGHT_CTCU))
>   		return NULL;
>   
>   	return coresight_find_output_type(etr->pdata, CORESIGHT_DEV_TYPE_HELPER,
> -					  catu_subtype);
> +					  helper_subtype);
>   }
> -EXPORT_SYMBOL_GPL(tmc_etr_get_catu_device);
> +EXPORT_SYMBOL_GPL(tmc_etr_get_helper_device);
>   
>   static const struct etr_buf_operations *etr_buf_ops[] = {
>   	[ETR_MODE_FLAT] = &etr_flat_buf_ops,
> @@ -913,7 +922,8 @@ static void get_etr_buf_hw(struct device *dev, struct etr_buf_hw *buf_hw)
>   
>   	buf_hw->has_iommu = iommu_get_domain_for_dev(dev->parent);
>   	buf_hw->has_etr_sg = tmc_etr_has_cap(drvdata, TMC_ETR_SG);
> -	buf_hw->has_catu = !!tmc_etr_get_catu_device(drvdata);
> +	buf_hw->has_catu = !!tmc_etr_get_helper_device(drvdata,
> +			CORESIGHT_DEV_SUBTYPE_HELPER_CATU);
>   	buf_hw->has_resrv = tmc_has_reserved_buffer(drvdata);
>   }
>   
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index c9a82ff6cd00..7690a70069da 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -471,7 +471,8 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
>   	return crc32_le(0, (void *)drvdata->resrv_buf.vaddr, crc_size);
>   }
>   
> -struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
> +struct coresight_device *tmc_etr_get_helper_device(struct tmc_drvdata *drvdata,
> +						   enum coresight_dev_subtype_helper subtype);
>   
>   void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
>   void tmc_etr_remove_catu_ops(void);
> 


