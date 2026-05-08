Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E298CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 08:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rwE7BJvWtahw54nz5IvQHifhD+k5SwKsx8/B0OTIwHo=; b=IWfDgpeWAEoRdpBQsq11l8bwXe
	vGZWuU4LATTrt2JetQHdrTpdlaRrv6aS4QYbOcthOWqR4synwMKP0MgJ90sxiLb5myVwenPapoGEi
	HU/CO6LSE9FA9QEslT3lD+l37dRiMeeCIYQs7Fn7SFVBP/xk2VO13THqBtL4pR22f75pbaw35G0Qp
	ngpq08tvE14IMeQcr+aOT6+urvXMdnvfhA+8Ab5jOrZahVhBlH2LqG4cDsRSE2XBZ/YD/V8nGojA9
	jeRRdNrNFW88kMuShC3+FIBoiQ94io5FRRGKP6U6wtHrBjdrSCIQA2GS+PnzX3QXBc1tY0ROnSpbl
	qoZlz3EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLGWG-00000005zM1-3Jwy;
	Fri, 08 May 2026 08:25:12 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLGWD-00000005zLB-18pF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 08:25:11 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-453903ee4adso1204866f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 01:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778228707; x=1778833507; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rwE7BJvWtahw54nz5IvQHifhD+k5SwKsx8/B0OTIwHo=;
        b=grshOkMHihhXeyC0WiQVqasCRxgK6eknjDBwSAPvxD5o9fdAJh04C0yO0vJZ9kFCxH
         0lcpxunqwhUwZ0SmAjA0ng1YBFTwcKdfdChk7dUZFjvWqPA8H2Sn3jNwTErBkyGHvyFm
         b/yTPQVM+ZpXZdYrPSnBOnYQXzxm2Ms1B17vUUyAEyFa06uiAa4bZVwvkxIsI0xm4Ipw
         DwTeHSG66BJ+H4dWPCY4jPLfDNnkiyiv0hCGDjRcFKc4T8Ww9U33841FyM1XITrDfPiF
         sloY4133QIT/IDEZIpQ3HycS+R3UQ/jhpNCFeAQhJVDeAGgVMpYMX4l647l6jmh6EbkV
         ta4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778228707; x=1778833507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rwE7BJvWtahw54nz5IvQHifhD+k5SwKsx8/B0OTIwHo=;
        b=UzL67eNOJCikVsh9To3xc9JbmhVX3nLUYrtreOjUpIqL7bXyAn3JhiYiDgRGQaQu2F
         Radm5tMddyvx/YSczP394ZrtZFcHo+dVK35jlJRbUzX+nrEPo97WvOnIsTK3n4RO5p7N
         rAyZrHvs8PZSpg1/ZBIL/irbZLkcxjEx9IPJjYKsX9fzqeO5dUqUmD3JzS6UdQgjVXwv
         QbmsMqhwIApQ7KCNDutFvwpEShcwKrojdUSlP0285dQWbx7tCWLsATjYGyQkzXqH22GS
         n1dOx63MBmZvruoWaGad01Dux5bFd2ArBp0XvFHAM7MXgwHAq2p140yTY41pA2CIWAAm
         v+xg==
X-Forwarded-Encrypted: i=1; AFNElJ/PvzVXQFbgNdthMGYxyI7aIDtMjAF7G4qev8CuzwnhziTeSJLrNn5Asgg8Og7N6KAcgNre9YTol3XLzkGvgNSq@lists.infradead.org
X-Gm-Message-State: AOJu0YyOXUF/ACBxrfvkNFUCETl2zQsTAc0WCa6Tg4zps2DDDCUg2uli
	teeu5WC3jEbiLDvb1L4z9qSRNG0t5RPMMUmZ0XOO9CgdllHB1QL6+1d0mRHUnJ6WGqo=
X-Gm-Gg: Acq92OEQkC90oKUEe6qto4G+9bY9LyRbNLrmXpOGXLxwKFy/S6OOw3M9KN/Gtork64K
	Fd7IiDxSQGKboYotS+7XUxz6tTCM77AQ9t7Sq4TytoYmEUBFkzhllG2QHw4yb+tsKcVzd4aWK0Y
	WvDcjKXfgejEHfdjDBcxvrWKITeNsDq3/xPZJhdJpF0isoVf2ocL2Ncp1kvmPOn8rLPhOgy9Y/C
	phMnp2ZxI6umsTecAOg221wTbX444nrw3GzLdRJOCn2zKRvaHcqv89vevHKPu301BkDRrCziCtS
	hcLF6baLh8kdZeWI6ricB7thVXuVJvbY/Rxiwjw6xZe2vU3lZmXH13tj9sB2/UNsmKJZN+2pNOe
	MUa48oealp5tLr2JymfsgvF5oSbQ9ReYWjbtrUkPEC/JWZd/oxatwQcotrECIzbSs3cWGzP0Ahx
	uuXeY0QRkIFD5d+RI2pr56prHVJkA4
X-Received: by 2002:a05:6000:1281:b0:451:c239:d3a2 with SMTP id ffacd0b85a97d-451c239d401mr11763043f8f.3.1778228702242;
        Fri, 08 May 2026 01:25:02 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a5b65sm2493295f8f.8.2026.05.08.01.25.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 01:25:01 -0700 (PDT)
Message-ID: <c4828e79-ca07-420a-96d8-069489658cdd@linaro.org>
Date: Fri, 8 May 2026 09:25:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: fix missing error code when trace ID is
 invalid
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20260508-fix-trace-id-error-v1-1-5f11a5456fdf@oss.qualcomm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260508-fix-trace-id-error-v1-1-5f11a5456fdf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_012509_408205_695B4793 
X-CRM114-Status: GOOD (  21.97  )
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



On 08/05/2026 6:45 am, Jie Gan wrote:
> When coresight_path_assign_trace_id() fails to allocate a valid trace
> ID, the code jumps to err_path without setting ret to an error value.
> This causes coresight_enable_sysfs() to return 0 (success) to the
> caller even though no trace session was started.
> 
> Set ret = -EINVAL before the goto so that callers receive a proper
> error code.
> 
> Fixes: d87d76d823d1 ("Coresight: Allocate trace ID after building the path")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-sysfs.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
> index d2a6ed8bcc74..c9338c783540 100644
> --- a/drivers/hwtracing/coresight/coresight-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
> @@ -195,42 +195,44 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
>   		 */
>   		if (subtype == CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE)
>   			csdev->refcnt++;
>   		goto out;
>   	}
>   
>   	sink = coresight_find_activated_sysfs_sink(csdev);
>   	if (!sink) {
>   		ret = -EINVAL;
>   		goto out;
>   	}
>   
>   	path = coresight_build_path(csdev, sink);
>   	if (IS_ERR(path)) {
>   		pr_err("building path(s) failed\n");
>   		ret = PTR_ERR(path);
>   		goto out;
>   	}
>   
>   	coresight_path_assign_trace_id(path, CS_MODE_SYSFS);
> -	if (!IS_VALID_CS_TRACE_ID(path->trace_id))
> +	if (!IS_VALID_CS_TRACE_ID(path->trace_id)) {
> +		ret = -EINVAL;
>   		goto err_path;
> +	}
>   
>   	ret = coresight_enable_path(path, CS_MODE_SYSFS);
>   	if (ret)
>   		goto err_path;
>   
>   	ret = coresight_enable_source_sysfs(csdev, CS_MODE_SYSFS, path);
>   	if (ret)
>   		goto err_source;
>   
>   	switch (subtype) {
>   	case CORESIGHT_DEV_SUBTYPE_SOURCE_PROC:
>   		/*
>   		 * When working from sysFS it is important to keep track
>   		 * of the paths that were created so that they can be
>   		 * undone in 'coresight_disable()'.  Since there can only
>   		 * be a single session per tracer (when working from sysFS)
>   		 * a per-cpu variable will do just fine.
>   		 */
>   		cpu = source_ops(csdev)->cpu_id(csdev);
>   		per_cpu(tracer_path, cpu) = path;
> 
> ---
> base-commit: 17c7841d09ee7d33557fd075562d9289b6018c90
> change-id: 20260508-fix-trace-id-error-dbfdd4d8f2d1
> 
> Best regards,

Reviewed-by: James Clark <james.clark@linaro.org>


