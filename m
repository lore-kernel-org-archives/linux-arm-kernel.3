Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC090F46433
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 09:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZgL34rlUi2NBuxPARbZN5tDobVBp32CanrCwKfcSoBs=; b=Ul+JK790BsWkuKrJgzJX5FZEiQ
	Ofsrt80SMYx9XfOU6ud7sjCVlaaWvFvVCgOYQiSQPENhoJH3QalznIodNKzq08a+xBfaXrvhtzF0G
	0eEf1wyY8WfhWnXZsBuY06jzAHYqJ43TNtK21PYq5Z4ONtz7T47kt/BK6poXIL1vUfdaO8E1WBI2g
	E0sxT9GQ4YJRyaKXU8OGTZSrrUskc+3wuoB6Brj5KrAFGLTOXZ6j6AyAkUgElAbUGV812xy6LcSBo
	K6gUGaXhpPn+fRBJ/Zw2u1nKH9C4T34UL7cXHcE8Ca6UIg1Z30Yof3EYlpNl4fAf/pcmJuY3G9tqt
	5hb16HKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24JR-00000003dxV-02TL;
	Mon, 16 Mar 2026 09:32:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24JN-00000003dx8-3vhA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 09:32:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 404581477;
	Mon, 16 Mar 2026 02:32:24 -0700 (PDT)
Received: from [10.57.18.169] (unknown [10.57.18.169])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3CCD03F778;
	Mon, 16 Mar 2026 02:32:29 -0700 (PDT)
Message-ID: <a503ecdc-53e9-4c7a-b228-f697fb9c0ac6@arm.com>
Date: Mon, 16 Mar 2026 09:32:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] coresight: tpdm: add traceid_show for checking traceid
Content-Language: en-GB
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260316-add-traceid-show-for-tpdm-v2-1-1dec2a67e4ed@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260316-add-traceid-show-for-tpdm-v2-1-1dec2a67e4ed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_023234_115553_4D285B60 
X-CRM114-Status: GOOD (  24.15  )
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

On 16/03/2026 07:23, Jie Gan wrote:
> Save the trace ID in drvdata during TPDM enablement and expose it
> to userspace to support trace data parsing.
> 
> The TPDM device’s trace ID corresponds to the trace ID allocated
> to the connected TPDA device.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
> Changes in V2:
> 1. Use sysfs_emit instead of sprintf.
> Link to V1 - https://lore.kernel.org/all/20260306-add-traceid-show-for-tpdm-v1-1-0658a8edb972@oss.qualcomm.com/

Why is this patch required even ? For each TPDM there is a single
port in a single TPDA in the system where it can reach and that is
fixed for a platform. Can we not get this from there ? Also, there
is not TraceID technically for a TPDM, right ? It is all a property
of the TPDA ?

Suzuki


> ---
>   drivers/hwtracing/coresight/coresight-tpdm.c | 31 +++++++++++++++++++++++++++-
>   drivers/hwtracing/coresight/coresight-tpdm.h |  2 ++
>   2 files changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
> index da77bdaad0a4..774a63def817 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
> @@ -481,7 +481,7 @@ static void __tpdm_enable(struct tpdm_drvdata *drvdata)
>   
>   static int tpdm_enable(struct coresight_device *csdev, struct perf_event *event,
>   		       enum cs_mode mode,
> -		       __maybe_unused struct coresight_path *path)
> +		       struct coresight_path *path)
>   {
>   	struct tpdm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>   
> @@ -497,6 +497,7 @@ static int tpdm_enable(struct coresight_device *csdev, struct perf_event *event,
>   	}
>   
>   	__tpdm_enable(drvdata);
> +	drvdata->traceid = path->trace_id;
>   	drvdata->enable = true;
>   	spin_unlock(&drvdata->spinlock);
>   
> @@ -693,6 +694,26 @@ static struct attribute_group tpdm_attr_grp = {
>   	.attrs = tpdm_attrs,
>   };
>   
> +static ssize_t traceid_show(struct device *dev,
> +			    struct device_attribute *attr, char *buf)
> +{
> +	unsigned long val;
> +	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +
> +	val = drvdata->traceid;
> +	return sysfs_emit(buf, "%#lx\n", val);
> +}
> +static DEVICE_ATTR_RO(traceid);
> +
> +static struct attribute *traceid_attrs[] = {
> +	&dev_attr_traceid.attr,
> +	NULL,
> +};
> +
> +static struct attribute_group traceid_attr_grp = {
> +	.attrs = traceid_attrs,
> +};
> +
>   static ssize_t dsb_mode_show(struct device *dev,
>   			     struct device_attribute *attr,
>   			     char *buf)
> @@ -1367,6 +1388,12 @@ static const struct attribute_group *tpdm_attr_grps[] = {
>   	&tpdm_cmb_patt_grp,
>   	&tpdm_cmb_msr_grp,
>   	&tpdm_mcmb_attr_grp,
> +	&traceid_attr_grp,
> +	NULL,
> +};
> +
> +static const struct attribute_group *static_tpdm_attr_grps[] = {
> +	&traceid_attr_grp,
>   	NULL,
>   };
>   
> @@ -1425,6 +1452,8 @@ static int tpdm_probe(struct device *dev, struct resource *res)
>   	desc.access = CSDEV_ACCESS_IOMEM(base);
>   	if (res)
>   		desc.groups = tpdm_attr_grps;
> +	else
> +		desc.groups = static_tpdm_attr_grps;

 >   	drvdata->csdev = coresight_register(&desc);>   	if 
(IS_ERR(drvdata->csdev))
>   		return PTR_ERR(drvdata->csdev);
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
> index 2867f3ab8186..befecbb896f4 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.h
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.h
> @@ -300,6 +300,7 @@ struct cmb_dataset {
>    * @cmb         Specifics associated to TPDM CMB.
>    * @dsb_msr_num Number of MSR supported by DSB TPDM
>    * @cmb_msr_num Number of MSR supported by CMB TPDM
> + * @traceid	trace ID of the path.
>    */
>   
>   struct tpdm_drvdata {
> @@ -313,6 +314,7 @@ struct tpdm_drvdata {
>   	struct cmb_dataset	*cmb;
>   	u32			dsb_msr_num;
>   	u32			cmb_msr_num;
> +	u8			traceid;
>   };
>   
>   /* Enumerate members of various datasets */
> 
> ---
> base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
> change-id: 20260316-add-traceid-show-for-tpdm-88d040651f00
> 
> Best regards,


