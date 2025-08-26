Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C5DCCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 09:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+7KkN9quivPmpt1BF4RV8411bNcmDhGVsoU9lDrlTTk=; b=h3mFIeo+CJBml6Hap+eTgYwjgW
	GkGRQqgudJWHEHq8U1wyd/nI9rnNYQxXrGGKO3EGwK4V7tbVhw12SO5G94/kjsulS79uX6yhgO5X1
	dU9QoSkMesF8WttzYlW0xTG7LTwTWg3q07zEloAucP8c0gAcYnYkZ9EASTwCiTNFvboXnl27EZB87
	+Kmn2O46WBP7N/ntjL2Leq+xeJoWcgkY/XzRpHFatMuGXJ5bCE4ObRdAjls/DoT5QuHWVWyyve/8O
	jte+lcDWHRzluoWBjcZ4KF9XLbJ/U5nI+I+ow614wIEF3tbx84bLL0xoDCQgEs7bAue7R3L+s9cnl
	bLPsJP5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqpa9-0000000BC3Y-0QBX;
	Tue, 26 Aug 2025 09:03:09 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqpXR-0000000BAY1-1xAW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 09:00:22 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3c79f0a606eso1560805f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 02:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756198820; x=1756803620; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+7KkN9quivPmpt1BF4RV8411bNcmDhGVsoU9lDrlTTk=;
        b=g69X7OFS3XCw4YsiYMsSW8jqu3VpDLL4HZUTrna8eVixohFOj3xNKNSk2NIZTI/75O
         BVPuHn255Z0iWz8cMkwoKFWL4AONYT9Gr9zFd4ai5mVXmBPglKjTlEia0xiwOpr6sYBm
         IGJswCzQzrn9nNm+PUpBzuS1f80Sv8bXVwN6Q2nJHdUVRAoqX7wQXfApzJ9WvPr4ZnS+
         /9kzeyUpsQplNBqgns7k+NHddicxBrnHEDabuIDJH/B5mBN73aEZ+gmqmKIcIyNXzv1M
         nZBq7N2TbNng9KEhNc3Ht6gYfb0OYOVmTuX/R7QG9fytdM+QRuOlypRQoLErykn5+OC4
         eEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756198820; x=1756803620;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+7KkN9quivPmpt1BF4RV8411bNcmDhGVsoU9lDrlTTk=;
        b=he08UmR1ER24FCPJ/07fl/RSRM0wyNlFMBaUv/q+wiot6CRt8are+vY1va0LR2jHLy
         gWjh7adnv069TUb/r91yft4mhLdBoieSvtT6tkqBYIPG+BHxQvEC13K4zVCzcnBTcL+1
         iuW8/omf8k8YnaJi6RCrejd9RWD23Mev3GNUajeC0TkjildzNnIuik2unDjJwwqL75tG
         mOO/FsZCBCoEnEaZiENwN7NgqHQO9t4e2pC6N9PsNBC3fTkD2bDbZxNZRVPh+eoTbvdh
         5vhCNL48VbwSHVnXPmlFXz7wtBgpFyAYRyz5lwynICahm2ooFH9VAFknAHUZ/7NVAdiF
         VarQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfzHEN0aw+IvFZS2FUh+xjKRY4YIvjje/SSwaN234rZDb1DUFDK7NQ0EmM59zBBTp+qaKIiGc3R5z8RNj0irKh@lists.infradead.org
X-Gm-Message-State: AOJu0YzfNwBzwnxPyh6uU3X5jyt/A6zLbjj+wmRmU/rjbDtbd+Bh8xhv
	XB+VqAnN8w1qbw2Cgd5r+BlABWOigGNv1nU7gJhv2Wh/n929bnUy/lfWMmJY5mradpg=
X-Gm-Gg: ASbGncuB8SJo1NPNFIgOMlQPTrs8zB9RrmKVff14cmWYbAFEjgciOgaQ6l4aCzlbnfN
	ouQvAUBqXOtjd7Mj0KE3XVKKxnOjgXKAincvyv2lsQrzUw2fpDZQCxqY4QG7acgc9WKSn0tb3nl
	znIF99mQyHwb21IWzyA6oSKc3raYyKIOvLc+46hj7XXWXRBa3da7SIhIYMvmFhIOv4BMr1BI9ic
	DNDPCNJYF0u9phagPM9ixwoQFqvmzKNlyWlECam1wG3U6Ta2Im3eFCcBxea0FKuA+rsR602UMV8
	mFTO49mmh7N4hYy65Emzb6a8niV5BzyEf21NdTDH3tB7B1/Fy7gNU48eIxAKaztii7sFNqVbPhP
	4Kzec2d/QPIFq8KBmwsuctlvRVg+UkXqZUjxsNw==
X-Google-Smtp-Source: AGHT+IH0ru1Ur49X+/9xlJm7QLqjH4kudau0AswpLus2lXUF1Z44bEpFDwsPCy8mGE1wo3XS3RMmAA==
X-Received: by 2002:a5d:5d84:0:b0:3b9:10c4:e99a with SMTP id ffacd0b85a97d-3c5dc734325mr9394468f8f.34.1756198819769;
        Tue, 26 Aug 2025 02:00:19 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711abd15asm15402512f8f.56.2025.08.26.02.00.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 02:00:19 -0700 (PDT)
Message-ID: <60355fd1-2126-493f-93fe-a36c198a0b32@linaro.org>
Date: Tue, 26 Aug 2025 10:00:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] coresight: tpda: Add sysfs node for tpda
 cross-trigger configuration
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20250826070150.5603-1-jie.gan@oss.qualcomm.com>
 <20250826070150.5603-2-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250826070150.5603-2-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_020021_523679_1CE40485 
X-CRM114-Status: GOOD (  27.30  )
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



On 26/08/2025 8:01 am, Jie Gan wrote:
> From: Tao Zhang <tao.zhang@oss.qualcomm.com>
> 
> Introduce sysfs nodes to configure cross-trigger parameters for TPDA.
> These registers define the characteristics of cross-trigger packets,
> including generation frequency and flag values.
> 
> Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   .../testing/sysfs-bus-coresight-devices-tpda  |  43 ++++
>   drivers/hwtracing/coresight/coresight-tpda.c  | 241 ++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-tpda.h  |  27 ++
>   3 files changed, 311 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
> new file mode 100644
> index 000000000000..e827396a0fa1
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
> @@ -0,0 +1,43 @@
> +What:		/sys/bus/coresight/devices/<tpda-name>/trig_async_enable
> +Date:		August 2025
> +KernelVersion:	6.17
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
> +Description:
> +		(RW) Enable/disable cross trigger synchronization sequence interface.
> +
> +What:		/sys/bus/coresight/devices/<tpda-name>/trig_flag_ts_enable
> +Date:		August 2025
> +KernelVersion:	6.17
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
> +Description:
> +		(RW) Enable/disable cross trigger FLAG packet request interface.
> +
> +What:		/sys/bus/coresight/devices/<tpda-name>/trig_freq_enable
> +Date:		August 2025
> +KernelVersion:	6.17
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
> +Description:
> +		(RW) Enable/disable cross trigger FREQ packet request interface.
> +
> +What:		/sys/bus/coresight/devices/<tpda-name>/freq_ts_enable
> +Date:		August 2025
> +KernelVersion:	6.17
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
> +Description:
> +		(RW) Enable/disable the timestamp for all FREQ packets.
> +
> +What:		/sys/bus/coresight/devices/<tpda-name>/global_flush_req
> +Date:		August 2025
> +KernelVersion:	6.17
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
> +Description:
> +		(RW) Set/unset global (all ports) flush request bit. The bit remains set until a

I don't think you can unset? global_flush_req_store() only does 
something for set.

> +		global flush request sequence completes.
> +
> +What:		/sys/bus/coresight/devices/<tpda-name>/cmbchan_mode
> +Date:		August 2025
> +KernelVersion:	6.17
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
> +Description:
> +		(RW) Configure the CMB/MCMB channel mode for all enabled ports.
> +		Value 0 means raw channel mapping mode. Value 1 means channel pair marking mode.
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> index 4e93fa5bace4..cc254d53b8ec 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -156,9 +156,37 @@ static void tpda_enable_pre_port(struct tpda_drvdata *drvdata)
>   	u32 val;
>   
>   	val = readl_relaxed(drvdata->base + TPDA_CR);
> +	val &= ~TPDA_CR_MID;
>   	val &= ~TPDA_CR_ATID;
>   	val |= FIELD_PREP(TPDA_CR_ATID, drvdata->atid);
> +	if (drvdata->trig_async)
> +		val = val | TPDA_CR_SRIE;
> +	else
> +		val = val & ~TPDA_CR_SRIE;

val |=
val &=

> +	if (drvdata->trig_flag_ts)
> +		val = val | TPDA_CR_FLRIE;
> +	else
> +		val = val & ~TPDA_CR_FLRIE;
> +	if (drvdata->trig_freq)
> +		val = val | TPDA_CR_FRIE;
> +	else
> +		val = val & ~TPDA_CR_FRIE;
> +	if (drvdata->freq_ts)
> +		val = val | TPDA_CR_FREQTS;
> +	else
> +		val = val & ~TPDA_CR_FREQTS;
> +	if (drvdata->cmbchan_mode)
> +		val = val | TPDA_CR_CMBCHANMODE;
> +	else
> +		val = val & ~TPDA_CR_CMBCHANMODE;
>   	writel_relaxed(val, drvdata->base + TPDA_CR);
> +
> +	/*
> +	 * If FLRIE bit is set, set the master and channel
> +	 * id as zero
> +	 */
> +	if (drvdata->trig_flag_ts)
> +		writel_relaxed(0x0, drvdata->base + TPDA_FPID_CR);
>   }
>   
>   static int tpda_enable_port(struct tpda_drvdata *drvdata, int port)
> @@ -274,6 +302,217 @@ static const struct coresight_ops tpda_cs_ops = {
>   	.link_ops	= &tpda_link_ops,
>   };
>   
> +static ssize_t trig_async_enable_show(struct device *dev,
> +				      struct device_attribute *attr,
> +				      char *buf)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +
> +	return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->trig_async);
> +}
> +
> +static ssize_t trig_async_enable_store(struct device *dev,
> +				       struct device_attribute *attr,
> +				       const char *buf,
> +				       size_t size)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	unsigned long val;
> +
> +	if (kstrtoul(buf, 0, &val))
> +		return -EINVAL;
> +
> +	guard(spinlock)(&drvdata->spinlock);
> +	if (val)
> +		drvdata->trig_async = true;
> +	else
> +		drvdata->trig_async = false;
> +

drvdata->trig_async = !!val

same with all the following ones too

> +	return size;
> +}
> +static DEVICE_ATTR_RW(trig_async_enable);
> +
> +static ssize_t trig_flag_ts_enable_show(struct device *dev,
> +					struct device_attribute *attr,
> +					char *buf)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +
> +	return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->trig_flag_ts);
> +}
> +
> +static ssize_t trig_flag_ts_enable_store(struct device *dev,
> +					 struct device_attribute *attr,
> +					 const char *buf,
> +					 size_t size)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	unsigned long val;
> +
> +	if (kstrtoul(buf, 0, &val))
> +		return -EINVAL;
> +
> +	guard(spinlock)(&drvdata->spinlock);
> +	if (val)
> +		drvdata->trig_flag_ts = true;
> +	else
> +		drvdata->trig_flag_ts = false;
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RW(trig_flag_ts_enable);
> +
> +static ssize_t trig_freq_enable_show(struct device *dev,
> +					  struct device_attribute *attr,
> +					  char *buf)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +
> +	return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->trig_freq);
> +}
> +
> +static ssize_t trig_freq_enable_store(struct device *dev,
> +				      struct device_attribute *attr,
> +				      const char *buf,
> +				      size_t size)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	unsigned long val;
> +
> +	if (kstrtoul(buf, 0, &val))
> +		return -EINVAL;
> +
> +	guard(spinlock)(&drvdata->spinlock);
> +	if (val)
> +		drvdata->trig_freq = true;
> +	else
> +		drvdata->trig_freq = false;
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RW(trig_freq_enable);
> +
> +static ssize_t freq_ts_enable_show(struct device *dev,
> +				   struct device_attribute *attr,
> +				   char *buf)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +
> +	return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->freq_ts);
> +}
> +
> +static ssize_t freq_ts_enable_store(struct device *dev,
> +				    struct device_attribute *attr,
> +				    const char *buf,
> +				    size_t size)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	unsigned long val;
> +
> +	if (kstrtoul(buf, 0, &val))
> +		return -EINVAL;
> +
> +	guard(spinlock)(&drvdata->spinlock);
> +	if (val)
> +		drvdata->freq_ts = true;
> +	else
> +		drvdata->freq_ts = false;
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RW(freq_ts_enable);
> +
> +static ssize_t global_flush_req_show(struct device *dev,
> +				     struct device_attribute *attr,
> +				     char *buf)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	unsigned long val;
> +
> +	guard(spinlock)(&drvdata->spinlock);
> +	if (!drvdata->csdev->refcnt)
> +		return -EPERM;

-EPERM doesn't seem right, maybe EBUSY or EINVAL?

Also don't you need CS_UNLOCK() for reading? I'm not 100% sure but I 
found one example of it in debug_init_arch_data().

> +
> +	val = readl_relaxed(drvdata->base + TPDA_CR);
> +	return sysfs_emit(buf, "%lx\n", val);
> +}
> +
> +static ssize_t global_flush_req_store(struct device *dev,
> +				      struct device_attribute *attr,
> +				      const char *buf,
> +				      size_t size)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	unsigned long val;
> +
> +	if (kstrtoul(buf, 0, &val))
> +		return -EINVAL;
> +

if (!val)
   return size;

Check this first, no point in taking the spinlock or checking the 
refcount if you aren't going to do anything.

> +	guard(spinlock)(&drvdata->spinlock);
> +	if (!drvdata->csdev->refcnt)
> +		return -EPERM;

ditto for -EPERM

> +
> +	if (val) {
> +		CS_UNLOCK(drvdata->base);
> +		val = readl_relaxed(drvdata->base + TPDA_CR);
> +		val = val | BIT(0);
> +		writel_relaxed(val, drvdata->base + TPDA_CR);
> +		CS_LOCK(drvdata->base);
> +	}
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RW(global_flush_req);
> +
> +static ssize_t cmbchan_mode_show(struct device *dev,
> +				 struct device_attribute *attr,
> +				 char *buf)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +
> +	return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->cmbchan_mode);
> +}
> +
> +static ssize_t cmbchan_mode_store(struct device *dev,
> +				  struct device_attribute *attr,
> +				  const char *buf,
> +				  size_t size)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	bool val;
> +
> +	if (kstrtobool(buf, &val))
> +		return -EINVAL;
> +
> +	guard(spinlock)(&drvdata->spinlock);
> +	if (val)
> +		drvdata->cmbchan_mode = true;
> +	else
> +		drvdata->cmbchan_mode = false;
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RW(cmbchan_mode);
> +
> +static struct attribute *tpda_attrs[] = {
> +	&dev_attr_trig_async_enable.attr,
> +	&dev_attr_trig_flag_ts_enable.attr,
> +	&dev_attr_trig_freq_enable.attr,
> +	&dev_attr_freq_ts_enable.attr,
> +	&dev_attr_global_flush_req.attr,
> +	&dev_attr_cmbchan_mode.attr,
> +	NULL,
> +};
> +
> +static struct attribute_group tpda_attr_grp = {
> +	.attrs = tpda_attrs,
> +};
> +
> +static const struct attribute_group *tpda_attr_grps[] = {
> +	&tpda_attr_grp,
> +	NULL,
> +};
> +
>   static int tpda_init_default_data(struct tpda_drvdata *drvdata)
>   {
>   	int atid;
> @@ -289,6 +528,7 @@ static int tpda_init_default_data(struct tpda_drvdata *drvdata)
>   		return atid;
>   
>   	drvdata->atid = atid;
> +	drvdata->freq_ts = true;
>   	return 0;
>   }
>   
> @@ -332,6 +572,7 @@ static int tpda_probe(struct amba_device *adev, const struct amba_id *id)
>   	desc.ops = &tpda_cs_ops;
>   	desc.pdata = adev->dev.platform_data;
>   	desc.dev = &adev->dev;
> +	desc.groups = tpda_attr_grps;
>   	desc.access = CSDEV_ACCESS_IOMEM(base);
>   	drvdata->csdev = coresight_register(&desc);
>   	if (IS_ERR(drvdata->csdev))
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
> index c6af3d2da3ef..b651372d4c88 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.h
> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
> @@ -8,17 +8,34 @@
>   
>   #define TPDA_CR			(0x000)
>   #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
> +#define TPDA_FPID_CR		(0x084)
> +
> +/* Cross trigger FREQ packets timestamp bit */
> +#define TPDA_CR_FREQTS		BIT(2)
> +/* Cross trigger FREQ packet request bit */
> +#define TPDA_CR_FRIE		BIT(3)
> +/* Cross trigger FLAG packet request interface bit */
> +#define TPDA_CR_FLRIE		BIT(4)
> +/* Cross trigger synchronization bit */
> +#define TPDA_CR_SRIE		BIT(5)
> +/* Packetize CMB/MCMB traffic bit */
> +#define TPDA_CR_CMBCHANMODE	BIT(20)
> +
>   /* Aggregator port enable bit */
>   #define TPDA_Pn_CR_ENA		BIT(0)
>   /* Aggregator port CMB data set element size bit */
>   #define TPDA_Pn_CR_CMBSIZE		GENMASK(7, 6)
>   /* Aggregator port DSB data set element size bit */
>   #define TPDA_Pn_CR_DSBSIZE		BIT(8)
> +/* Mode control bit */
> +#define TPDA_MODE_CTRL			BIT(12)
>   
>   #define TPDA_MAX_INPORTS	32
>   
>   /* Bits 6 ~ 12 is for atid value */
>   #define TPDA_CR_ATID		GENMASK(12, 6)
> +/* Bits 13 ~ 19 is for mid value */
> +#define TPDA_CR_MID		GENMASK(19, 13)
>   
>   /**
>    * struct tpda_drvdata - specifics associated to an TPDA component
> @@ -29,6 +46,11 @@
>    * @enable:     enable status of the component.
>    * @dsb_esize   Record the DSB element size.
>    * @cmb_esize   Record the CMB element size.
> + * @trig_async:	Enable/disable cross trigger synchronization sequence interface.
> + * @trig_flag_ts: Enable/disable cross trigger FLAG packet request interface.
> + * @trig_freq:	Enable/disable cross trigger FREQ packet request interface.
> + * @freq_ts:	Enable/disable the timestamp for all FREQ packets.
> + * @cmbchan_mode: Configure the CMB/MCMB channel mode.
>    */
>   struct tpda_drvdata {
>   	void __iomem		*base;
> @@ -38,6 +60,11 @@ struct tpda_drvdata {
>   	u8			atid;
>   	u32			dsb_esize;
>   	u32			cmb_esize;
> +	bool			trig_async;
> +	bool			trig_flag_ts;
> +	bool			trig_freq;
> +	bool			freq_ts;
> +	bool			cmbchan_mode;
>   };
>   
>   #endif  /* _CORESIGHT_CORESIGHT_TPDA_H */


