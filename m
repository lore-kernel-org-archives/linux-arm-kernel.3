Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5CF6CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 11:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=04QchQpzuRx7IFA0zjXS5iJy5lGlY6/pxSqsHjb1jj8=; b=Pu4gjYZZjMS9H5f4atzyEYAGDx
	tL0ws53gmViZxINkOwuDypgS0fCd3+CayUx+aSo+IRt6idxCGTZB7Jf+H/H7NYn/rciO3wmKvnvSb
	+7uPMwd7ORnFAxLmd7c+1ABKzEnD5qlMsGqn3AGX4vE9qlxB5gweLQq23ywi4G5LT1CbxZkE3H8RF
	hSltJnYfI6JmddfnEUElHVWeeOswrUkI+EwB4MDOvXLAbK91T66VM22e0tAj4E58JPx4kr7a2w/yJ
	o8sIXIxCJrno2k8/XO+fNprlv0UKZhj38/X6PWhba3RKDyVLy2yIAX/Rm1BE03rZcfo7t/oZCgs8N
	/yerqT5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPmi-00000005Guf-2zQI;
	Mon, 10 Nov 2025 11:10:09 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPmb-00000005GtF-0ERD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 11:10:07 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-477632d9326so21985645e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 03:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762772999; x=1763377799; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=04QchQpzuRx7IFA0zjXS5iJy5lGlY6/pxSqsHjb1jj8=;
        b=EJ7OsLP1EFygldb9apF6cVDslRzbuuTScDdd8YCYJ0d45n0dOobGpq+ZaHU726Xvqh
         haPLOGDfqSgVRaBk4g5Ro4hKacukpoEli9bOonHUJLwFehMrSS1fag+ojlieDEp453tt
         SPkJQFZ3E5jbT317re/QCIdYmx6GD9lWqgTAwaz9To0JrpcvmcaXcdKSW7P0RGRszZMQ
         ASsfvwsyWp3KAWSgGUJGILeuz7SkpdAmBbXQOGnMSYmSUSq+WnxwSTqDCIoI58oEgEoj
         IkmKNr1JBMKFSdS/TfHSzN+L8K5XMMQG/80GWnkbWENqFLP/Im/7a/TL2H2aJ7a3n0Lo
         rFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762772999; x=1763377799;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=04QchQpzuRx7IFA0zjXS5iJy5lGlY6/pxSqsHjb1jj8=;
        b=ANx0szbJCTNUyUmxZ0LDbFRYlEdMSLqGuJ6Z7ZjQhYLbLthYQBR/M2etAuayTCFeSC
         I4FoN7i8eivfMtGBCyia1fvkxCmPCB9m630X2YmTAWZCnWWkaWyyU+/bFZnfQcmNx9aC
         Y/2+/Kgk+TbDmNfrtT7HQ2gk9aLb65fxvxZhY8/TIHFXYDMzPIPOC5IlW0bSOeB+iOIp
         +aGJM8C6iNaiH6ORL6buSmXnpaF8dNamdN1+8X+gYMWaSh/J5mOPiP26Cw8hS9tQkxq/
         Ywnk+CZwGlJv47WQC4miQdYieg6RBEUqndqEKllwzfK5CY71LPpqbwoC8glJ6PEIrojt
         AAlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHyd8z+KYHmZho3oTwvFURRzIrgTDlk3e+VowKFxnvqg2MFXhEX6oJR9HLmnKdQnJtyijLlOXVm0laaVXycGMK@lists.infradead.org
X-Gm-Message-State: AOJu0YwBkNJW4pbsO0TF0nEjDhXTHKs9JOy/b1ieAR75tPn1nRAHwX96
	vE0hM90mPkxCDTgjAMIHQJKfiOWEdChPRUyeNVeBvoDxxqULRlojP+3VjgVdzQhTcVc=
X-Gm-Gg: ASbGncsekJnn5QA02xZLpvLh8Y8RGNVLujv3QvwOGebuk4Dw4WHKDqPWVeuuBK4zUbq
	5cGpPwRcjSSAoAEJTuy4xQriW7T/i00mBLBpOFH1namTawp9iLrE4s+ANV9iHbSrMj55PSYEr5W
	AA60J1D/46/qYHQSH0dDRLTtYgRejfoAF6V5sW1PWPBxWJIXk54G4/L5DSS7gDeNTL7lf0uLHJO
	vlfSoLb2mrTlbZpJGPesPC7i33+kvIdbjWWS53eBhZMUhNWlxa0kqyaPFFgICkdIXyPPN2X+d7U
	Pjrvs+Wm/Ys0lIYCsRp9WASiqX5N2lV1dpg7NEK8wiX4OkNJiE4kkvDdMsQ/lcEfHX3lAXMUUN+
	ZpzhQC89QiX4aftnCIB2H8OljZMrtNh1XE7wFaOctGbbCaRHj4fM2VLx9UowV1HEegePBWZR3kC
	IX5iDlzJNOzw4UcLzP
X-Google-Smtp-Source: AGHT+IHBAO4NRwVKBNWJkeYNSNN1HJQ5iaTeJZbvUTX+qm5bYiIy7iR5W/3hPDRyh5PkLDTWG6LoLQ==
X-Received: by 2002:a05:600c:4f4c:b0:477:7a87:48d1 with SMTP id 5b1f17b1804b1-4777a874db1mr43256235e9.30.1762772999079;
        Mon, 10 Nov 2025 03:09:59 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776bcd51dfsm198106405e9.5.2025.11.10.03.09.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 03:09:58 -0800 (PST)
Message-ID: <4b9c2dc0-20f5-4384-b106-0def0891493f@linaro.org>
Date: Mon, 10 Nov 2025 11:09:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/15] coresight: Introduce coresight_enable_source()
 helper
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Yabin Cui <yabinc@google.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>
References: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
 <20251104-arm_coresight_path_power_management_improvement-v4-8-3d4bba674709@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251104-arm_coresight_path_power_management_improvement-v4-8-3d4bba674709@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_031001_128648_C93BCBA6 
X-CRM114-Status: GOOD (  23.37  )
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
> Introduce the coresight_enable_source() helper for enabling source
> device, refine the comment for the imbalance between enable and disable
> pair functions.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: James Clark <james.clark@linaro.org>

> ---
>   drivers/hwtracing/coresight/coresight-core.c     | 15 ++++++++++++---
>   drivers/hwtracing/coresight/coresight-etm-perf.c |  2 +-
>   drivers/hwtracing/coresight/coresight-priv.h     |  3 +++
>   drivers/hwtracing/coresight/coresight-sysfs.c    |  2 +-
>   4 files changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 0d4e935094297023b8a7786ff4b1b3783164016b..c28f3d255b0e19b3d982de95b8e34d0fc2954b95 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -385,15 +385,24 @@ static void coresight_disable_helpers(struct coresight_device *csdev, void *data
>   }
>   
>   /*
> - * Helper function to call source_ops(csdev)->disable and also disable the
> - * helpers.
> + * coresight_enable_source() only enables the source but does nothing for the
> + * associated helpers. In contrast, coresight_disable_source() calls
> + * source_ops(csdev)->disable() and also disables the helpers.
>    *
>    * There is an imbalance between coresight_enable_path() and
>    * coresight_disable_path(). Enabling also enables the source's helpers as part
>    * of the path, but disabling always skips the first item in the path (which is
>    * the source), so sources and their helpers don't get disabled as part of that
> - * function and we need the extra step here.
> + * function and we need the extra step in coresight_disable_source().
>    */
> +int coresight_enable_source(struct coresight_device *csdev,
> +			    struct perf_event *event, enum cs_mode mode,
> +			    struct coresight_path *path)
> +{
> +	return source_ops(csdev)->enable(csdev, event, mode, path);
> +}
> +EXPORT_SYMBOL_GPL(coresight_enable_source);
> +
>   void coresight_disable_source(struct coresight_device *csdev, void *data)
>   {
>   	source_ops(csdev)->disable(csdev, data);
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index f677c08233ba1a28b277674662c6e6db904873dd..dd1968dd173d608fb72835343cd647818c0bad1a 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -530,7 +530,7 @@ static void etm_event_start(struct perf_event *event, int flags)
>   		goto fail_end_stop;
>   
>   	/* Finally enable the tracer */
> -	if (source_ops(csdev)->enable(csdev, event, CS_MODE_PERF, path))
> +	if (coresight_enable_source(csdev, event, CS_MODE_PERF, path))
>   		goto fail_disable_path;
>   
>   	/*
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index 33e22b1ba043264ad50acac69ece1ea6de25893b..8b978528cb49af43ef56d034f7ecc520f80f60df 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -250,6 +250,9 @@ void coresight_add_helper(struct coresight_device *csdev,
>   
>   void coresight_set_percpu_sink(int cpu, struct coresight_device *csdev);
>   struct coresight_device *coresight_get_percpu_sink(int cpu);
> +int coresight_enable_source(struct coresight_device *csdev,
> +			    struct perf_event *event, enum cs_mode mode,
> +			    struct coresight_path *path);
>   void coresight_disable_source(struct coresight_device *csdev, void *data);
>   void coresight_pause_source(struct coresight_device *csdev);
>   int coresight_resume_source(struct coresight_device *csdev);
> diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
> index cb02f1bfaf068ec3f50f997bcb94f7d5215ccea8..72e9607fc6aea4663abf7d1f7f03f247ea060b83 100644
> --- a/drivers/hwtracing/coresight/coresight-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
> @@ -66,7 +66,7 @@ static int coresight_enable_source_sysfs(struct coresight_device *csdev,
>   	 */
>   	lockdep_assert_held(&coresight_mutex);
>   	if (coresight_get_mode(csdev) != CS_MODE_SYSFS) {
> -		ret = source_ops(csdev)->enable(csdev, NULL, mode, path);
> +		ret = coresight_enable_source(csdev, NULL, mode, path);
>   		if (ret)
>   			return ret;
>   	}
> 


