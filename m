Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13341061B07
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 14:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kkL2TAQ2zVx+xhdN+T+r4owbwTSWJg58fFnUOF+33ks=; b=4C0Rhyr3k0a5lsMZOGuRZsnZua
	owx2iPeX0T+ffhoG9eOJXK83zL767RONYGzKA0fgVKklQiY7wRixo/4IiElNcKuAw2TDA+kSDacvd
	XSL7BYRAwAW5EBiVOwQ3x5n5kKitpRwg5OmsRpkegmnXA+YC5+lWS5AzavLcoBaAx1GlXExT5PK8L
	BhYlVqfNJ61i+y3SaDFuTBTGsvBQ6+C/uuJr8WOiNJ1ixdzXwPtsKCfcfE6ZlKl6kxmGRSBKNPO2c
	4PU0swBZ6KEqKi764AV3yutlxVmURkvyWijPLw7SMNbgENDYls3AwdDBAYFyc9Nv+HsyFNZtZ7WRz
	DBgqhKqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7E2A-0000000BWb0-2Kb1;
	Mon, 30 Mar 2026 14:56:06 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7E27-0000000BWaY-3nkk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 14:56:05 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-48374014a77so55701975e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 07:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774882561; x=1775487361; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kkL2TAQ2zVx+xhdN+T+r4owbwTSWJg58fFnUOF+33ks=;
        b=Iu6xKynXnA9rv96jJHcplRGIpclOLlqtLVVeuGSdqBmxxxDC6RTs/f0DWg31v2d6Bq
         EGWCpmSWQlzFg6g8UmX9OqwuTaFo6lVSt0EJQUqk0aRNITRR3LUfR8++FB5V3Dle+wbv
         1/YDnFq+dQNcNKqIJAbsTpunJNylxU1qmthKFvWrWiBKIpu+Ex1+8vWLNDqKNkAuh9PR
         AJh2XogOIzUmNRwC+pP6+D+c84Bvh0cDkXaA6Zt4n1eSqaHtZKBGDZmJOInN/1ehQNQZ
         DrNzhgeC+Pw8sLU3R4D080gBayuioWXKIqQ3vDNJbnyU8pZvu2KpUYPQuz+fBVYCU2Kb
         /6ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774882561; x=1775487361;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kkL2TAQ2zVx+xhdN+T+r4owbwTSWJg58fFnUOF+33ks=;
        b=VltMHvu+qLgfiyN12u2UUMiyN5Fl89gwvNs7w51trdowmBa6ZYZfCi4Gys6F6V5RKF
         wxsGoKU2ZAwdJG9yXqQ1Zb9l+FlMWEHSLJ4u6oF+cdEO4ZLI18pcIF8oNrrDbB35AFbq
         jRhZEo4I9H5+YWrINSsZefrP301UTC9qNChUiVVwxqanC9ZVt3quthw/fDO6IrJapsrc
         WRqFIywhjX7oktARHFwYhaG62Ag620YzxDl8MP6/XJ3gXsEpes5EwlzZ/uFMh9Tdec4T
         itc5SyOq5Fp7pTMCqXMm7oihp3GAcLhvAFgGf6Vlct2/VfzSzstYlXUUcBf6gfHTDy5u
         6tDA==
X-Forwarded-Encrypted: i=1; AJvYcCXam7eh1kNbT+/kiinsmLUHtFS9b/TmjLuDaCUzUiuBFL7F7nv6VzL2R1sKvaHAaErD6GP1gSLxwDf8hdIjnUB1@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5WJXDxWo9brx2Guj945FW277OwQo5+0joal6/s5fnMtS1/xlO
	u6Wfc/Hr01tVO2wiLH1XwZ7YdsDAGclNhQt0b2XQ/ZAgqXM8tWRYkRiGJibj0Y9yrH8=
X-Gm-Gg: ATEYQzzJttDTyDGSHmHS8I3zE6syqVleFfVRSocEBHZkFCvgwlhQVzdCPnFJx+bCuYw
	HITJEpo3R+x3g87Mru04k1maWEN5mb7Tsm0tSk+pLSsNfwgcFYibwOPzBKxr72m7aqdBPyOarzr
	BmQYiJf53KPqKS99O+ejk1YMkuSwDPvTpUEqK6UyNWe2eRpVc4mN+6I71MpQnPE6kp4sBKB20Q2
	PvZnkrtQXDZsi5vCL0izHU1XLEWYYcx9miKew+lg4cAOjg1eD+PPatcIe2qBm3ZdjN5G5zbsSxu
	8QQTz2SUk42S9H9kzYI3i8ClrsF+JerLTrDV6SNSwh386rOLwf9BMO6Y5uBMP+8w+0xGAgP/QkB
	7o9itPCFANkwoRiJuFAQ7Y51OrkmY6YlTPJc7DyMQAWPUDXuJa6ro3FO9Tp6pZdEeUXvvjK0VTn
	aA9pxHt3YUx2bNDgEPIMXUNW8Uirel
X-Received: by 2002:a05:600c:c8f:b0:487:21c7:2885 with SMTP id 5b1f17b1804b1-48727d45a8emr218972355e9.5.1774882561306;
        Mon, 30 Mar 2026 07:56:01 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2471ee2sm18669382f8f.29.2026.03.30.07.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 07:56:00 -0700 (PDT)
Message-ID: <95610981-ad68-4a31-a776-27894b7bca59@linaro.org>
Date: Mon, 30 Mar 2026 15:55:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] coresight: tpdm: add traceid_show for checking traceid
To: Jie Gan <jie.gan@oss.qualcomm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mike Leach <mike.leach@arm.com>,
 Leo Yan <leo.yan@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20260325-add-traceid-show-for-tpdm-v3-1-0eb836d4ec30@oss.qualcomm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260325-add-traceid-show-for-tpdm-v3-1-0eb836d4ec30@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_075603_982557_39525823 
X-CRM114-Status: GOOD (  29.94  )
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



On 25/03/2026 3:10 am, Jie Gan wrote:
> Save the trace ID in drvdata during TPDM enablement and expose it
> to userspace to support trace data parsing.
> 
> The TPDM device’s trace ID corresponds to the trace ID allocated
> to the connected TPDA device.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
> Changes in v3:
> 1. Only allow user to read the traceid while the TPDM device is enabled.
> - Link to v2: https://lore.kernel.org/r/20260316-add-traceid-show-for-tpdm-v2-1-1dec2a67e4ed@oss.qualcomm.com
> 
> Changes in V2:
> 1. Use sysfs_emit instead of sprintf.
> Link to V1 - https://lore.kernel.org/all/20260306-add-traceid-show-for-tpdm-v1-1-0658a8edb972@oss.qualcomm.com/
> ---
>   drivers/hwtracing/coresight/coresight-tpdm.c | 34 +++++++++++++++++++++++++++-
>   drivers/hwtracing/coresight/coresight-tpdm.h |  2 ++
>   2 files changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
> index da77bdaad0a4..c8339b973bfc 100644
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
> @@ -693,6 +694,29 @@ static struct attribute_group tpdm_attr_grp = {
>   	.attrs = tpdm_attrs,
>   };
>   
> +static ssize_t traceid_show(struct device *dev,
> +			    struct device_attribute *attr, char *buf)
> +{
> +	unsigned long val;
> +	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +
> +	if (coresight_get_mode(drvdata->csdev) == CS_MODE_DISABLED)
> +		return -EINVAL;
> +
> +	val = drvdata->traceid;

You probably need to take the coresight_mutex here otherwise you could 
still return an invalid or stale value despite checking the mode.

There might also be some value in it returning the last used trace ID 
even if the mode isn't enabled anymore. Because you can still read out 
of the sink after disabling, so it makes more sense for a script to read 
it at that point rather than when it's enabled. Also, you probably don't 
want to be doing other things in your script in the point between 
enabling and disabling.

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
> @@ -1367,6 +1391,12 @@ static const struct attribute_group *tpdm_attr_grps[] = {
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
> @@ -1425,6 +1455,8 @@ static int tpdm_probe(struct device *dev, struct resource *res)
>   	desc.access = CSDEV_ACCESS_IOMEM(base);
>   	if (res)
>   		desc.groups = tpdm_attr_grps;
> +	else
> +		desc.groups = static_tpdm_attr_grps;
>   	drvdata->csdev = coresight_register(&desc);
>   	if (IS_ERR(drvdata->csdev))
>   		return PTR_ERR(drvdata->csdev);
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
> index 2867f3ab8186..11da64e1ade8 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.h
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.h
> @@ -300,6 +300,7 @@ struct cmb_dataset {
>    * @cmb         Specifics associated to TPDM CMB.
>    * @dsb_msr_num Number of MSR supported by DSB TPDM
>    * @cmb_msr_num Number of MSR supported by CMB TPDM
> + * @traceid	Trace ID of the path.
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


