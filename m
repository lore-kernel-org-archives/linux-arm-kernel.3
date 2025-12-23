Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB2FE6F079
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 09:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EcZwl48G9KMTebpF68gPkJpLf5UwP7/HkHtmvCsnpvM=; b=RY4AXRkdMxi5CPVjxhdKtpsRbL
	k4bJQMCWVUHnDnTniGeL78UmwV/riY7VYpaszZnH3L72Eu+98rjfDdr9N4hMKIGRj6w8uGtqO0dJt
	+vBRtHaSVOD1X5VpZI2JAN521mqRP0lo51IcDYPGRSIR3NehJxcd7xeXpQVZ7L4Z3JZ9HmkpsSSve
	N4pS5Jmm2vNSk+Ju2bvKVsEV+Q5yo37pjal+jBxqDgqdCHDUXdkaR3sp9m8t0YWPitOn9aDEiXxeH
	UQt6zwJkWLBXZaWOxJiFww1uBGM2v6UASqc3QxI7U9rieY+DYAqPGb93+j6rXuc9hlE0knuwpPwLD
	ax0PuOBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXz11-0000000EnCm-2p98;
	Tue, 23 Dec 2025 09:49:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXz0y-0000000EnCO-1kNu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 09:49:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A34D497;
	Tue, 23 Dec 2025 01:49:04 -0800 (PST)
Received: from [10.57.78.114] (unknown [10.57.78.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CCCCF3F694;
	Tue, 23 Dec 2025 01:49:09 -0800 (PST)
Message-ID: <ab53c4e1-e0a2-4a6b-840b-a84e9b236e8f@arm.com>
Date: Tue, 23 Dec 2025 09:49:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/4] coresight: tpda: add logic to configure TPDA_SYNCR
 register
Content-Language: en-GB
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Tao Zhang <tao.zhang@oss.qualcomm.com>
References: <20251223-add_sysfs_nodes_to_configure_tpda-v7-0-db4e6810047c@oss.qualcomm.com>
 <20251223-add_sysfs_nodes_to_configure_tpda-v7-3-db4e6810047c@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251223-add_sysfs_nodes_to_configure_tpda-v7-3-db4e6810047c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_014912_550904_93CE3734 
X-CRM114-Status: GOOD (  25.66  )
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

On 23/12/2025 08:41, Jie Gan wrote:
> From: Tao Zhang <tao.zhang@oss.qualcomm.com>
> 
> The TPDA_SYNC counter tracks the number of bytes transferred from the
> aggregator. When this count reaches the value programmed in the
> TPDA_SYNCR register, an ASYNC request is triggered, allowing userspace
> tools to accurately parse each valid packet.
> 
> Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
> Reviewed-by: James Clark <james.clark@linaro.org>
> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-coresight-devices-tpda   | 18 +++++
>   drivers/hwtracing/coresight/coresight-tpda.c       | 90 ++++++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-tpda.h       | 10 +++
>   3 files changed, 118 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
> index c8bc7b19ab25..c989eea1ef59 100644
> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
> @@ -41,3 +41,21 @@ Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qu
>   Description:
>   		(RW) Set global (all ports) flush request bit. The bit remains set until a
>   		global flush request sequence completes.
> +
> +What:		/sys/bus/coresight/devices/<tpda-name>/syncr_mode
> +Date:		December 2025
> +KernelVersion:	6.19
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
> +Description:
> +		(RW) Set mode the of the syncr counter.
> +		mode 0 - COUNT[11:0] value represents the approximate number of bytes moved between two ASYNC packet requests
> +		mode 1 - the bits COUNT[11:7] are used as a power of 2. for example, we could insert an async packet every 8K
> +		         data by writing a value 13 to the COUNT[11:7] field.
> +
> +What:		/sys/bus/coresight/devices/<tpda-name>/syncr_count
> +Date:		December 2025
> +KernelVersion:	6.19
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
> +Description:
> +		(RW) Set value the of the syncr counter.
> +		Range: 0-4095
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> index d24a9098f1b1..8283e16ec400 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -163,6 +163,20 @@ static void tpda_enable_pre_port(struct tpda_drvdata *drvdata)
>   	 */
>   	if (drvdata->trig_flag_ts)
>   		writel_relaxed(0x0, drvdata->base + TPDA_FPID_CR);
> +
> +	/* Initialize with a value of 0 */
> +	val = 0;
> +	if (drvdata->syncr_mode)
> +		val |= TPDA_SYNCR_MODE_CTRL_MASK;
> +
> +	if (drvdata->syncr_count > 0 &&
> +	    drvdata->syncr_count < TPDA_SYNCR_COUNT_MASK)
> +		val |= drvdata->syncr_count;
> +	else
> +		/* Program the count to its MAX value by default */
> +		val |= TPDA_SYNCR_COUNT_MASK;
> +
> +	writel_relaxed(val, drvdata->base + TPDA_SYNCR);
>   }
>   
>   static int tpda_enable_port(struct tpda_drvdata *drvdata, int port)
> @@ -385,8 +399,84 @@ static ssize_t global_flush_req_store(struct device *dev,
>   }
>   static DEVICE_ATTR_RW(global_flush_req);
>   
> +static ssize_t syncr_mode_show(struct device *dev,
> +			       struct device_attribute *attr,
> +			       char *buf)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	unsigned long val, syncr_val;
> +
> +	if (!drvdata->csdev->refcnt)
> +		return -EINVAL;
> +
> +	guard(spinlock)(&drvdata->spinlock);
> +	syncr_val = readl_relaxed(drvdata->base + TPDA_SYNCR);
> +	val = FIELD_GET(TPDA_SYNCR_MODE_CTRL_MASK, syncr_val);
> +
> +	return sysfs_emit(buf, "%lu\n", val);
> +}
> +
> +static ssize_t syncr_mode_store(struct device *dev,
> +				struct device_attribute *attr,
> +				const char *buf,
> +				size_t size)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	unsigned long val;
> +
> +	if (kstrtoul(buf, 0, &val))
> +		return -EINVAL;
> +
> +	guard(spinlock)(&drvdata->spinlock);
> +	/* set the mode when first enabling the device */
> +	drvdata->syncr_mode = !!val;
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RW(syncr_mode);
> +
> +static ssize_t syncr_count_show(struct device *dev,
> +				struct device_attribute *attr,
> +				char *buf)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	unsigned long val;
> +
> +	if (!drvdata->csdev->refcnt)
> +		return -EINVAL;
> +
> +	guard(spinlock)(&drvdata->spinlock);
> +	val = readl_relaxed(drvdata->base + TPDA_SYNCR);
> +	val &= TPDA_SYNCR_COUNT_MASK;
> +
> +	return sysfs_emit(buf, "%lu\n", val);
> +}
> +
> +static ssize_t syncr_count_store(struct device *dev,
> +				 struct device_attribute *attr,
> +				 const char *buf,
> +				 size_t size)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	unsigned long val;
> +
> +	if (kstrtoul(buf, 0, &val))
> +		return -EINVAL;
> +
> +	if (val < 0 || val > TPDA_SYNCR_COUNT_MASK)

Checking "val < 0" for an unsigned type is invalid. Simply keep the 
second part.

Suzuki


> +		return -EINVAL;
> +
> +	guard(spinlock)(&drvdata->spinlock);
> +	drvdata->syncr_count = val;
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RW(syncr_count);
> +
>   static struct attribute *tpda_attrs[] = {
>   	&dev_attr_global_flush_req.attr,
> +	&dev_attr_syncr_mode.attr,
> +	&dev_attr_syncr_count.attr,
>   	tpda_trig_sysfs_rw(freq_ts_enable, FREQTS),
>   	tpda_trig_sysfs_rw(trig_freq_enable, FRIE),
>   	tpda_trig_sysfs_rw(trig_flag_ts_enable, FLRIE),
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
> index 1cc9253293ec..56d35697303a 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.h
> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
> @@ -9,6 +9,7 @@
>   #define TPDA_CR			(0x000)
>   #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
>   #define TPDA_FPID_CR		(0x084)
> +#define TPDA_SYNCR		(0x08C)
>   
>   /* Cross trigger global (all ports) flush request bit */
>   #define TPDA_CR_FLREQ		BIT(0)
> @@ -36,6 +37,11 @@
>   /* Aggregator port DSB data set element size bit */
>   #define TPDA_Pn_CR_DSBSIZE		BIT(8)
>   
> +/* TPDA_SYNCR count mask */
> +#define TPDA_SYNCR_COUNT_MASK		GENMASK(11, 0)
> +/* TPDA_SYNCR mode control bit */
> +#define TPDA_SYNCR_MODE_CTRL_MASK	GENMASK(12, 12)
> +
>   #define TPDA_MAX_INPORTS	32
>   
>   /**
> @@ -52,6 +58,8 @@
>    * @trig_freq:	Enable/disable cross trigger FREQ packet request interface.
>    * @freq_ts:	Enable/disable the timestamp for all FREQ packets.
>    * @cmbchan_mode: Configure the CMB/MCMB channel mode.
> + * @syncr_mode:	Setting the mode for counting packets.
> + * @syncr_count: Setting the value of the count.
>    */
>   struct tpda_drvdata {
>   	void __iomem		*base;
> @@ -66,6 +74,8 @@ struct tpda_drvdata {
>   	bool			trig_freq;
>   	bool			freq_ts;
>   	bool			cmbchan_mode;
> +	bool			syncr_mode;
> +	u32			syncr_count;
>   };
>   
>   /* Enumerate members of global control register(cr) */
> 


