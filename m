Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDD3CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 11:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZzr8k4DWgvdPplU6PE+YGB+t0YnS/j5Rj03egNiGg0=; b=a3Dg1H0VF2Xnv2QLDUkBUa+gQK
	1V//sI2EuYMj1dLWFswMP0m/6Cx3St/PZ5jz+zTZu7jZ2WPtCKmq0nYUW4Q2OxLdRqLpi86ktuSWR
	0qZfG/Oz/7ngA/ssDSQjBf/8nB9Qn+xeuhvbKw7M+HBwnr/s3zosEPssmkRemvdN8bt386NkwOJSU
	xr9RsQIbhjbLDriFDL2BUEIF7hwLShRhdRvhII3llNQkb6cY+kbfsFRucOilb0coJFZ49gEOjGLwb
	poFP63ESjI4vNcjkiqeLYtn4h4Jw05omCb5Nn19uKWTj4MSg1OvByl2i46sRkM+H16IYP8hAjGFpI
	Mt89Llyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPuU-00000005I5n-2293;
	Mon, 10 Nov 2025 11:18:10 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPuQ-00000005I4g-0Uyy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 11:18:08 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-47117f92e32so25219885e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 03:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762773484; x=1763378284; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WZzr8k4DWgvdPplU6PE+YGB+t0YnS/j5Rj03egNiGg0=;
        b=oPvwMU89NmDzbTdvGwUZSaQbukYAbQWUuEme3USGr/rr6b/tqsS70YlSOmbbMBZr2Q
         ncqF4k9lpgd5Sz9WpLm3eX6O+6JjTEvLwbqXe4guEohTusbBcBFttp12lxK2qC3qyvNl
         zS+oUIxW5f8/Vk36KuOb/kaTXgk1BoOMmSC4bZSF2MMBVaOKCAo6L9eAEdtSbaO2J0pV
         aM9EboNfLF1+LgjvPqWeEc+7lTBBfLO7a2Q0U7DYSzbhT8kTT2BOjmaSTMRDT9YA3qku
         le8JpxP/7/a82BUmzpTFtKtxgFHOP/lEWEX/KyOXLFB9wFE3eplPK+4e+7y+EVGaevg4
         lR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762773484; x=1763378284;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WZzr8k4DWgvdPplU6PE+YGB+t0YnS/j5Rj03egNiGg0=;
        b=CFUtpKZKZl5BfI7S1paA+j+0CgJX9RtFssY41WgOp0J3EFRPMJlhkBhi5yoKeZrZMl
         pXpTd0pPIF+m1T9HKd6wpZhjj/e6Ge/AWBwitmiE3+ukMrDszOVUmLKSfLWTCuppig7a
         FgxQM6XKHizh83zZ7F9kD+WG3bX3d6OBnjWBEHF3JVMNfZ2HANj+lb6DeB+kjWzpkF2D
         KduqKBTufJiIaMhI+vTu5VVAtiYkL6iQb93dwQb24zJhQKJp3Szj8czoGDnZwn6gknX9
         2vp783v4Aik+uDMXFjJ0KMciy/xDTqhGQZ/9lJOcRucgaLtkvZT+jx7zQzd8ABfev5ht
         mZtA==
X-Forwarded-Encrypted: i=1; AJvYcCUoih0KoIwYm0nVSICjSr0SrVLim69GhrcehVvOszLrpLE6/YjVqWctrNZHZvPoJ3G+ZJf6LhutcyUjXdyvHHJB@lists.infradead.org
X-Gm-Message-State: AOJu0YwF86ySLLojZB37HNzUN/dYSf8A0IvH5Tj7euxtqpuBcGFLRLf7
	aLx5vKsrbI3YQI48tZVYxl0aL9wOj6ES9Y/2QH3mvKGtJhAgWbZhoJ+LZTfkcYm3xw0=
X-Gm-Gg: ASbGncu+mAgS/j+y7TNF+TZX8atfGKoC/vamhF2cnLJrs09u02hooNHAwHZSq1VgVf3
	186HhWsoZ2Rk+v6qrzX8PPUNXPNd5FmYl7tJQ8GFb+M7SHxDwcDYb5PvZteIfPrm/u1Tkf2kziO
	t2mn9MeTtxSC6Ueqnah9aVylWXhXuMFvQ4H95Wq1L7JGFQWAgTTlpz9V7Ud70Z1fV8WurXJuF1n
	WBbtl7qbJVGzqtrRhHEbDy/obnP00hwNpez6AsRlNUww60a8Ql//QWP8SyfQgIDHHXkZONpXcUv
	o/EpiQtiJAu4e+vvZ8LoYb9oowCyhpb/ug13BSo+o/EOfp1fuqves79L8+HNXLAg/ouWQZQ85zb
	PCGRQpyebhOdsHvsBeplKVeSlpvITxVTI3ySJWSenNuyasJLzpXqrgG3c2nl9zi2wMhQ/gshHMx
	fSqvrmtaCYBspJ22AC
X-Google-Smtp-Source: AGHT+IF7kZ5xVQLiCniXssb13ZBQXAr4/niBhQ5nctvE1hMmXrE/pMUrlMmbM+k97/M6+JP0zfVbFQ==
X-Received: by 2002:a05:600c:35c6:b0:477:7b16:5f77 with SMTP id 5b1f17b1804b1-4777b16632emr31537555e9.3.1762773484002;
        Mon, 10 Nov 2025 03:18:04 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775ce20ee3sm313769435e9.9.2025.11.10.03.18.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 03:18:03 -0800 (PST)
Message-ID: <7bc3f703-aeca-4e51-a171-c8870f1a14dc@linaro.org>
Date: Mon, 10 Nov 2025 11:18:02 +0000
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
X-CRM114-CacheID: sfid-20251110_031806_219781_16049517 
X-CRM114-Status: GOOD (  30.28  )
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

Doesn't that only work if you meticulously use READ_ONCE() for accessing 
path on the read side? Which doesn't look like it has been done.

I'm not sure why path is special though, there are plenty of variables 
in csdev that are accessed while the device is active. Shouldn't path be 
covered by the existing locks in the same way? It would be much safer 
and easier to understand if it was.

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


