Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5620CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 11:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O/dz99+gK//l1EkGFvUCt9D30tq/pPs5JpwFHZxoO44=; b=BlOcJreiHMqs5urAqLFJtiZl3a
	1BhYiNjVddKj12RwfrcscVzsDuQX5VJLdBiDpPgw4SN4jNlqxMru5c930KQ7IO9jDDJ+MSNof6vTr
	rBEV+ctFOiPylnJK7rGgP5e8naBSL6wguvWhnyY5OJvxhyuQY/q02dRARHn5SN9H4Sf7RJlqfHM0l
	wOYUGd4S7fAvmzTcoI9hBq4m7Eq0bRF9qR6L64bNRDk56lmCmv7XXxh+6bOaYfaizYnPQY1/b8y71
	YdGSxyvkIEzCav/U/Yfpwu8fysWVXP9CY2n7K8QEVBwN56yk4kyB8jQv8PpTFnG21OiIY9H7fhAkl
	apekbWLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQ1N-00000005JPp-3RIP;
	Mon, 10 Nov 2025 11:25:17 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQ1K-00000005JNn-26rW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 11:25:15 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-42b32ff5d10so634293f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 03:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762773912; x=1763378712; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O/dz99+gK//l1EkGFvUCt9D30tq/pPs5JpwFHZxoO44=;
        b=n4SN9JkZGRP7UnLtZ+Iq3+jZZXJLvZ90lqflXSQSRSgeAqTKv1fqBvisSU8Pnt5YAM
         9kiMddDhTaYkrepMj/diALkoTxhItZ//IfxdFtPKbUkofs/Q9enxSOX3lIkX57Sbuf1R
         qE44QVtvO3LuVQYUGLVyoaGXKwPYn4sQkGU9B6Skq76ULmCguLB1MjbF9N48SWbIRogn
         q0bhkgp8ezzYC7n7tDvwdzDQ63/Yi/pa3BhhfHAmYbTF4Cxr1/nemfjIJNemJomjhSvi
         hAgOHQIvcVHlaotEn2jCVVQYmi1ideIEY9mgfxgLTGmim4DKG5vJkKufN6bIqnWKnItR
         dflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762773912; x=1763378712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/dz99+gK//l1EkGFvUCt9D30tq/pPs5JpwFHZxoO44=;
        b=Mq+HJ9w8PZLaHxdOoZSViYWuk1AveZrJxfp31vSZK0S8S26vH4QCIayx1q6HafaxtV
         GAaHXv6eMylPlUVLfA0Kh9cZrcmRu1rfsliDHg1S1/Oiq7+SCHUGsEpEDE3yOVF9Wlje
         bRfU3yOgno/BCOR7PzQxDC7Mk7FWZylAVqASuThjBZV2Jt2izOtFlJ4jhfkjfMFxELlD
         GkHLIDYPThIzZriveGbgtn+8t2mHvIAJBppp9LaNkk0stV1T29QAKMUn0f9keJXJ/+3j
         4ab2j1YH4ULDB8zI2JxohXIVtbyct8LfA3vuso3QaDGAaX7C8ZlNOejz+QFPin1/GdFa
         Rh8g==
X-Forwarded-Encrypted: i=1; AJvYcCXUr8VDnmEbikX/zo+UTzdGJHSgui2KeRRf2PynJvMO5de2EONJUEv74gXYsYTmw1LBfw0argPaWZpZOnqzIS/B@lists.infradead.org
X-Gm-Message-State: AOJu0YxId6Gj+5lflIYPVqKMXarCObrwXsmIoSZeHRRT30NuBtxYO879
	cWxee+AhNjqMZFiCHECQvijA6XPw1ZZCCcEPbnxM/7i88uWQH8qzHwdM6ANsvLLxvt/P5YtZ/4O
	gaMD8CVg=
X-Gm-Gg: ASbGnct3GTNd41B9QeWIVJV+Ov7QwwXl4wPvVnJ2DoJwY6cBu36xIMFz8rx6XwzMWnh
	FMgUDJobHC+ItAByVJsBQSXk7vGBdVHhbylLCfPo5dwNs6OalQdRqsSYFn1o5zBwuR7mZ9i1m7b
	eiQRo8wWMFuKTbernlqc3yniQ3mdMfonz4BBGMF0ayh7un2ecLX1jStT6nGfo5eWfxTneTYEu6y
	ScBlTyz8jrEExuUn642+Q9RIw0me5lbe609O8KBmYAwj6WpShxiF/OMMDZFCYvcVWamk4IcgVBM
	g7blXr0NpuBIH3Aaz+Z46NlMyo0rn2az6wXZLCXkwWefpQZcUjeDcDF0OZzp9EQTEMvJdEtMUV7
	/KyO4efupD3TFUSg/sXmFyAczEG5TR6N2NgpH8DVSE7zGMloFZmN9/y+jLpTseptIOa5qDBXgeD
	+qQQisl6uFJ2eiSJyb
X-Google-Smtp-Source: AGHT+IEyMxN5hNXtvcnEvIPJEYwLWzxof+oEovZDRUyDvZG7szntOzDVxWRi2cjGI63lqgaHtIizbA==
X-Received: by 2002:a05:6000:2809:b0:42b:3701:c4dc with SMTP id ffacd0b85a97d-42b3701c6b6mr2697598f8f.31.1762773912414;
        Mon, 10 Nov 2025 03:25:12 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b2dd927d5sm14919996f8f.24.2025.11.10.03.25.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 03:25:11 -0800 (PST)
Message-ID: <2ed517c5-b434-4a51-9843-dd7ab6229bec@linaro.org>
Date: Mon, 10 Nov 2025 11:25:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/15] coresight: Add 'in_idle' argument to
 enable/disable path functions
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
References: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
 <20251104-arm_coresight_path_power_management_improvement-v4-10-3d4bba674709@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251104-arm_coresight_path_power_management_improvement-v4-10-3d4bba674709@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_032514_593643_39470181 
X-CRM114-Status: GOOD (  25.27  )
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
> Introduce an 'in_idle' argument to the path enable and disable
> functions. When set to true for idle flow, it skips to touch the sink
> device to avoid long latency caused by the sink operations.
> 
> This is a preparation for managing the path during CPU idle.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c | 35 +++++++++++++++++++++-------
>   1 file changed, 26 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 3ea31ed121f7b59d7822fba4df4c43efb1c76fe7..6c12692efb51c63f3aa9da6f65a349eae1926f4d 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -475,7 +475,8 @@ EXPORT_SYMBOL_GPL(coresight_resume_source);
>    * disabled.
>    */
>   static void coresight_disable_path_from(struct coresight_path *path,
> -					struct coresight_node *nd)
> +					struct coresight_node *nd,
> +					bool in_idle)
>   {
>   	u32 type;
>   	struct coresight_device *csdev, *parent, *child;
> @@ -498,6 +499,10 @@ static void coresight_disable_path_from(struct coresight_path *path,
>   						CORESIGHT_DEV_TYPE_SINK :
>   						CORESIGHT_DEV_TYPE_LINK;
>   
> +		/* To reduce latency, CPU idle does not touch the sink */
> +		if (in_idle && type == CORESIGHT_DEV_TYPE_SINK)
> +			continue;
> +
>   		switch (type) {
>   		case CORESIGHT_DEV_TYPE_SINK:
>   			coresight_disable_sink(csdev);
> @@ -527,7 +532,7 @@ static void coresight_disable_path_from(struct coresight_path *path,
>   
>   void coresight_disable_path(struct coresight_path *path)
>   {
> -	coresight_disable_path_from(path, NULL);
> +	coresight_disable_path_from(path, NULL, false);

Something like a 'reason' enum would be more readable than a boolean. We 
might have more than two options in the future anyway.

>   }
>   EXPORT_SYMBOL_GPL(coresight_disable_path);
>   
> @@ -550,8 +555,9 @@ static int coresight_enable_helpers(struct coresight_device *csdev,
>   	return 0;
>   }
>   
> -int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
> -			  void *sink_data)
> +static int coresight_enable_path_internal(struct coresight_path *path,
> +					  enum cs_mode mode, void *sink_data,
> +					  bool in_idle)
>   {
>   	int ret = 0;
>   	u32 type;
> @@ -564,10 +570,6 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
>   		csdev = nd->csdev;
>   		type = csdev->type;
>   
> -		/* Enable all helpers adjacent to the path first */
> -		ret = coresight_enable_helpers(csdev, mode, path);
> -		if (ret)
> -			goto err_disable_path;
>   		/*
>   		 * ETF devices are tricky... They can be a link or a sink,
>   		 * depending on how they are configured.  If an ETF has been
> @@ -579,6 +581,15 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
>   						CORESIGHT_DEV_TYPE_SINK :
>   						CORESIGHT_DEV_TYPE_LINK;
>   
> +		/* To reduce latency, CPU idle does not touch the sink */
> +		if (in_idle && type == CORESIGHT_DEV_TYPE_SINK)
> +			continue;

I can imagine that not being wanted for all sink types in the future, so 
we could let the sink decide this. But it's probably fine to leave in 
the core for now and it would be easy to change later.

> +
> +		/* Enable all helpers adjacent to the path first */
> +		ret = coresight_enable_helpers(csdev, mode, path);
> +		if (ret)
> +			goto err_disable_path;
> +
>   		switch (type) {
>   		case CORESIGHT_DEV_TYPE_SINK:
>   			ret = coresight_enable_sink(csdev, mode, sink_data);
> @@ -614,10 +625,16 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
>   err_disable_helpers:
>   	coresight_disable_helpers(csdev, path);
>   err_disable_path:
> -	coresight_disable_path_from(path, nd);
> +	coresight_disable_path_from(path, nd, in_idle);
>   	goto out;
>   }
>   
> +int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
> +			  void *sink_data)
> +{
> +	return coresight_enable_path_internal(path, mode, sink_data, false);
> +}
> +
>   struct coresight_device *coresight_get_sink(struct coresight_path *path)
>   {
>   	struct coresight_device *csdev;
> 


