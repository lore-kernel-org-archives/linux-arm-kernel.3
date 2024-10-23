Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5856CDDE49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 10:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tyxvlzwWeaj2PzXyZeZFfwEmE+K2WRvRnJ0soJKYOKw=; b=AG93Z2+fVx7FSpQwdXuDPVyeXk
	I5XQnmUTMuaMccSfTMdKIsmvtCYH1HZiRecrXP0WQfdJgKqGReWwVWVHN2a61aR1xkeKs5+RDgE4M
	K78AS78rn2QhpHMqw8T7X0ybFraj2x32KSzWZYBgSNwQMA6/U8lg9xowv4e/MMNxFDskYkWGFmjUK
	Q4Oys3Rn/3muWerZqa1YvV1FqGQCfSMvs8zxqW0FLUKCnKLXzqXhzR+PHF/z6ZCp4rkVocaOXz6AR
	bVmT7HS5qdOWSkNapPukTUrKPrWwzhjtQb6nONYcapVavNTvcJ8OO+mDjMV7fTIqY+oxxMHdjHsDW
	kIu86yhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3YM2-0000000DwTv-0FYM;
	Wed, 23 Oct 2024 10:12:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Xr7-0000000Dppn-0C1I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 09:42:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2062339;
	Wed, 23 Oct 2024 02:41:09 -0700 (PDT)
Received: from [10.57.66.28] (unknown [10.57.66.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BF8A03F71E;
	Wed, 23 Oct 2024 02:40:38 -0700 (PDT)
Message-ID: <d57eca00-1196-4ac7-ac45-7420ee4ac603@arm.com>
Date: Wed, 23 Oct 2024 10:40:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 RESEND 2/3] coresight-tpdm: Add support to select lane
Content-Language: en-GB
To: Mao Jinlong <quic_jinlmao@quicinc.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tao Zhang <quic_taozha@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20241011064732.8480-1-quic_jinlmao@quicinc.com>
 <20241011064732.8480-3-quic_jinlmao@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20241011064732.8480-3-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_024041_217309_1049671D 
X-CRM114-Status: GOOD (  21.54  )
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
> TPDM MCMB subunits supports up to 8 lanes CMB. For MCMB
> configurations, the field "XTRIG_LNSEL" in CMB_CR register selects
> which lane participates in the output pattern mach cross trigger
> mechanism goverened by the M_CMB_DXPR and M_CMB_XPMR regisers.

minor nit: s/goverened/governed/

> 
> Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
> ---
>   .../testing/sysfs-bus-coresight-devices-tpdm  |  8 +++
>   drivers/hwtracing/coresight/coresight-tpdm.c  | 51 +++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-tpdm.h  |  3 ++
>   3 files changed, 62 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> index bf710ea6e0ef..b3292fa2a022 100644
> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> @@ -257,3 +257,11 @@ Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_t
>   Description:
>   		(RW) Set/Get the MSR(mux select register) for the CMB subunit
>   		TPDM.
> +
> +What:		/sys/bus/coresight/devices/<tpdm-name>/mcmb_trig_lane
> +Date:		June 2024
> +KernelVersion	6.9
> +Contact:	Tao Zhang (QUIC) <quic_taozha@quicinc.com>

Didn't we already discuss about modifying the date and version ? Simply 
resending the patch is not going to help if it is not uptodate.

Please fix all the dates in the series

Suzuki

> +Description:
> +		(RW) Set/Get which lane participates in the output pattern
> +		match cross trigger mechanism for the MCMB subunit TPDM.
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
> index 58f8c3e804c1..f32c119e1b67 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
> @@ -238,6 +238,18 @@ static umode_t tpdm_cmb_msr_is_visible(struct kobject *kobj,
>   	return 0;
>   }
>   
> +static umode_t tpdm_mcmb_is_visible(struct kobject *kobj,
> +				    struct attribute *attr, int n)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +
> +	if (drvdata && tpdm_has_mcmb_dataset(drvdata))
> +		return attr->mode;
> +
> +	return 0;
> +}
> +
>   static void tpdm_reset_datasets(struct tpdm_drvdata *drvdata)
>   {
>   	if (tpdm_has_dsb_dataset(drvdata)) {
> @@ -1015,6 +1027,34 @@ static ssize_t cmb_trig_ts_store(struct device *dev,
>   }
>   static DEVICE_ATTR_RW(cmb_trig_ts);
>   
> +static ssize_t mcmb_trig_lane_show(struct device *dev,
> +				   struct device_attribute *attr,
> +				   char *buf)
> +{
> +	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +
> +	return sysfs_emit(buf, "%u\n",
> +			  (unsigned int)drvdata->cmb->mcmb->mcmb_trig_lane);
> +}
> +
> +static ssize_t mcmb_trig_lane_store(struct device *dev,
> +				    struct device_attribute *attr,
> +				    const char *buf,
> +				    size_t size)
> +{
> +	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	unsigned long val;
> +
> +	if ((kstrtoul(buf, 0, &val)) || (val >= TPDM_MCMB_MAX_LANES))
> +		return -EINVAL;
> +
> +	guard(spinlock)(&drvdata->spinlock);
> +	drvdata->cmb->mcmb->mcmb_trig_lane = val;
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RW(mcmb_trig_lane);
> +
>   static struct attribute *tpdm_dsb_edge_attrs[] = {
>   	&dev_attr_ctrl_idx.attr,
>   	&dev_attr_ctrl_val.attr,
> @@ -1177,6 +1217,11 @@ static struct attribute *tpdm_cmb_msr_attrs[] = {
>   	NULL,
>   };
>   
> +static struct attribute *tpdm_mcmb_attrs[] = {
> +	&dev_attr_mcmb_trig_lane.attr,
> +	NULL,
> +};
> +
>   static struct attribute *tpdm_dsb_attrs[] = {
>   	&dev_attr_dsb_mode.attr,
>   	&dev_attr_dsb_trig_ts.attr,
> @@ -1243,6 +1288,11 @@ static struct attribute_group tpdm_cmb_msr_grp = {
>   	.name = "cmb_msr",
>   };
>   
> +static struct attribute_group tpdm_mcmb_attr_grp = {
> +	.attrs = tpdm_mcmb_attrs,
> +	.is_visible = tpdm_mcmb_is_visible,
> +};
> +
>   static const struct attribute_group *tpdm_attr_grps[] = {
>   	&tpdm_attr_grp,
>   	&tpdm_dsb_attr_grp,
> @@ -1254,6 +1304,7 @@ static const struct attribute_group *tpdm_attr_grps[] = {
>   	&tpdm_cmb_trig_patt_grp,
>   	&tpdm_cmb_patt_grp,
>   	&tpdm_cmb_msr_grp,
> +	&tpdm_mcmb_attr_grp,
>   	NULL,
>   };
>   
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
> index 2e84daad1a58..e72dc19da310 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.h
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.h
> @@ -45,6 +45,9 @@
>   /* MAX number of DSB MSR */
>   #define TPDM_CMB_MAX_MSR 32
>   
> +/* MAX lanes in the output pattern for MCMB configurations*/
> +#define TPDM_MCMB_MAX_LANES 8
> +
>   /* DSB Subunit Registers */
>   #define TPDM_DSB_CR		(0x780)
>   #define TPDM_DSB_TIER		(0x784)


