Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA559CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 12:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XSl8Akbc8ju7bSuG6a54qKU5axag+OpUNIo5wk28PYw=; b=JmJTbH87YuLgxK226MzJNrM0uD
	NuIFrxP7UCyYLOl4mDBZFnBVpmauaCtIMjeWeY/qy0bNKHaMMx1iQbOxpG5sA5GY7f1hvuf63OxFc
	G63UBxqevSvau/Axvlf9S3I4hjlxEYLb3vMJGYxbqA9OywXBxcAtCPYSn8XPX0ufsXeeoEcBgGOn+
	Bv9JvExxts8aaPjJbtRe60GFasyGaB8hEA7SrPzKv+9IASln/otuclqWSDPlwZHkf3CWmAyMS91ii
	qn31/XYQj8R6HGBH81Z9HXfoDuXOFu7JAPXHCmTLCNDuryvZtFm8juYY1PIEEo2hRF9a07KeuGg39
	/+makArQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIR1W-00000005PMC-0PVZ;
	Mon, 10 Nov 2025 12:29:30 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIR1T-00000005PLk-3FEW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 12:29:28 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-42b3c965df5so371241f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 04:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762777766; x=1763382566; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XSl8Akbc8ju7bSuG6a54qKU5axag+OpUNIo5wk28PYw=;
        b=rHivdJiHTO8fn8i6dXvBfZEqrgbgP9hB5qs0HeyT+3Pt+emJb+/x+C07Ez4XpN1GFX
         G7FtB5cG36bGpi2/6DLwQKLAjlHkK9QXWSTf1CxlpQIppzQN/oncVrCC3HuFJtSfE1Jm
         EtK5jZz0CLiMDNIrj8XR1uOlknptGlxWPZDd1Lh9TZ6fsIhV71N12sF0F9jIKEDqZHj2
         lOX5v0NpWR4awAg5uhrK9bBOzflxaLWDR5ZhFXMWllU99mVYtR0zcg+TpPlD8QBLHOwv
         CJcSVCL8ovxNw1PeUy48FfGSD+HUKuA6OCU83HsN8tbelCHUtiH4ZExi1Vvn6gnuT60r
         2bfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762777766; x=1763382566;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XSl8Akbc8ju7bSuG6a54qKU5axag+OpUNIo5wk28PYw=;
        b=M5rkvMiTAfdSKfHOKgjamEzNPkQ4JouTUgN5refSs5RtVSLTDuylBPK1WvUmo973sO
         mwqp1TUPp1AKdHkpyqvdZBrWF5Jd3pYB2apspE6Tzh8/QTFwEKv9Pis0NNFLmFg+mqPy
         r/czyXTlkdG/3thyr+xsW7B6JaeCYMEfwtp7ef8qxB/i1lgtxQZc31p4bH1RKAotixo1
         /Nsw/sk84s/ObL8ASbXyYB16sK18UMKCEcNkN26hodNb3k7AuWZIM+PCAqW5ZXBm0+yl
         b18isbSrKEnWg6Yr97mVe4urPUiR9Ji6DWajCk/UF/KTNq6RzRh68zQN1cpGSl+ob7c1
         siJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUajzFNt+Jp15IER7j7eZ5Qx7EdMrK9U1Z5FbEHUKt8W6XpJiRkH3E6nnwUBM6hHl/4v2DrGtfoMzk9eRNZUmTs@lists.infradead.org
X-Gm-Message-State: AOJu0YyoRBrovdlJdm2sIOv7HNIzQ8vd35GuOpNjjqTqLtoZwiVs9fOc
	UCrGK8Rph7rE9mEC6d0QPlFUgChme7ei2h391UIzGStr99mpImm7fHZcjgV3LurROFg=
X-Gm-Gg: ASbGncvhoFEJMekUwWdpDedhf3FUNqjbPntGwe1N2Q17wGUxI2mj818T8lTNFSq46WQ
	03TONxQqth6LA14a8Y1DAsApJm/+YNTsJoC1NrJRguWAeSw6uq+fKq0KuevAP+GW9apHcXfv+bc
	RLL238zRTH8oSzm7yYx2H7pGEgY2Fr6/Y0wPBOhKHdjV9jt4ullcKjaVt5Kmj5Oc1R0ees6zuc2
	rpR20w4wqGuOqGNX5ntMIwqQeTm4HKYs79dPkwfesJvmmeDxkxFl0GpEovDpNZR+v/Bv7OOWtzQ
	CxdAJ57Ks2UvwFtbwboysOs9063+zHSHM+3w45LZaqvWX9gWB5BZyw/Hj2MLuzIYLFixUY+3n1l
	DM3P2n5jgaBzGTLM8KzuwLRsZeGZ+WKHkmYVlhhUrtZGg6YvQmyWs2sPNsZJLN9vtFAxqw6Tzfs
	LzY4Pupw==
X-Google-Smtp-Source: AGHT+IHq7I9yv194bdI2sCzej+O60FYqAUuRdl4pRaNBPVTMI4xQviRVl/5KIpcmHW3GNuxNUFTcJQ==
X-Received: by 2002:a05:6000:2085:b0:42b:4177:7136 with SMTP id ffacd0b85a97d-42b4177740cmr627853f8f.32.1762777765698;
        Mon, 10 Nov 2025 04:29:25 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b30dd4d86sm13392954f8f.26.2025.11.10.04.29.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 04:29:25 -0800 (PST)
Message-ID: <2ee36396-d399-4aa7-b045-2ccc34be87b2@linaro.org>
Date: Mon, 10 Nov 2025 12:29:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/15] coresight: Save activated path into source
 device
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
References: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
 <20251104-arm_coresight_path_power_management_improvement-v4-9-3d4bba674709@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251104-arm_coresight_path_power_management_improvement-v4-9-3d4bba674709@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_042927_856298_B70469FA 
X-CRM114-Status: GOOD (  30.36  )
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



On 04/11/2025 3:21 pm, Leo Yan wrote:
> Save activated path into the source device's coresight_device structure.
> The path pointer will be used by later changes for controlling the path
> during CPU idle.
> 
> The path pointer is assigned before setting the source device mode to
> active, and it is cleared after the device is changed to an inactive
> mode. So safe access to path pointers is guaranteed when the device is
> in an active mode.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c | 39 +++++++++++++++++++++++++++-
>   include/linux/coresight.h                    |  2 ++
>   2 files changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index c28f3d255b0e19b3d982de95b8e34d0fc2954b95..3ea31ed121f7b59d7822fba4df4c43efb1c76fe7 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -399,13 +399,50 @@ int coresight_enable_source(struct coresight_device *csdev,
>   			    struct perf_event *event, enum cs_mode mode,
>   			    struct coresight_path *path)
>   {
> -	return source_ops(csdev)->enable(csdev, event, mode, path);
> +	int ret;
> +
> +	/*
> +	 * Record the path in the source device. The path pointer is first
> +	 * assigned, followed by transitioning from DISABLED mode to an enabled
> +	 * state on the target CPU. Conversely, during the disable flow, the
> +	 * device mode is set to DISABLED before the path pointer is cleared.
> +	 *
> +	 * This ordering ensures the path pointer to be safely access under the
> +	 * following race condition:
> +	 *
> +	 *  CPU(a)                          CPU(b)
> +	 *
> +	 *  coresight_enable_source()
> +	 *    STORE source->path;
> +	 *    smp_mb();
> +	 *    source_ops(csdev)->enable();
> +	 *                              `-> etm4_enable_sysfs_smp_call()
> +	 *                                    STORE source->mode;
> +	 *
> +	 * This sequence ensures that accessing the path pointer is safe when
> +	 * the device is in enabled mode.
> +	 */
> +	csdev->path = path;
> +
> +	/* Synchronization between csdev->path and csdev->mode */
> +	smp_mb();
> +
> +	ret = source_ops(csdev)->enable(csdev, event, mode, path);
> +	if (ret)
> +		csdev->path = NULL;
> +
> +	return ret;
>   }
>   EXPORT_SYMBOL_GPL(coresight_enable_source);
>   
>   void coresight_disable_source(struct coresight_device *csdev, void *data)
>   {
>   	source_ops(csdev)->disable(csdev, data);
> +
> +	/* Synchronization between csdev->path and csdev->mode */
> +	smp_mb();
> +	csdev->path = NULL;
> +
>   	coresight_disable_helpers(csdev, NULL);
>   }
>   EXPORT_SYMBOL_GPL(coresight_disable_source);
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 3d59be214dd25dfa7ad9148a6688628e0d1a98dd..58484c225e58a68dd74739a48c08a409ce9ddd73 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -264,6 +264,7 @@ struct coresight_trace_id_map {
>    *		spinlock.
>    * @orphan:	true if the component has connections that haven't been linked.
>    * @cpu:	The CPU this component is affined to (-1 for not CPU bound).
> + * @path:	Activated path pointer (only used for source device).

Isn't it only needed for per-cpu sources specifically? Rather than all 
sources?

That's why I still think it should be a new global per-cpu variable in 
coresight-core.c, rather than a generic thing that needs to be used very 
carefully. Sysfs mode also already has a global map and per-cpu store of 
its paths to sources. This makes it a bit confusing because it 
duplicates some of that functionality.

Do we even need that storage in sysfs mode anymore if the path is here? 
We should pick one way and stick with it.

>    * @sysfs_sink_activated: 'true' when a sink has been selected for use via sysfs
>    *		by writing a 1 to the 'enable_sink' file.  A sink can be
>    *		activated but not yet enabled.  Enabling for a _sink_ happens
> @@ -291,6 +292,7 @@ struct coresight_device {
>   	int refcnt;
>   	bool orphan;
>   	int cpu;
> +	struct coresight_path *path;
>   	/* sink specific fields */
>   	bool sysfs_sink_activated;
>   	struct dev_ext_attribute *ea;
> 


