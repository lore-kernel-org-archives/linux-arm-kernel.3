Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B0CD116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 10:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AOnEw3BZnfclp4gqXFuh5EU5EE3a2Dn8SHSXTdmn3IQ=; b=SMIg590pl5TgoGwettvFPqVa79
	bV0YQo6LoscNGFH0c9In8v/87e3/R985aTb0/oBFK0PzNXQMdYMc+7PC1Dlqfs6vWHmPo1srBOhR3
	qEkYdcYO4L7TLZLpB9J91thVU9XQw6PwmmQ/xbgxxo6TWIooI+tuv2slHxJhOOCu0GokRxESPBKK6
	Ca5xh5lqEBbedrEsRoL7RtPeq7zjARFQzNKSKfVWi5cDyAw6U520KIUqfiQdvPGVXeEbtL8EZIRJu
	CSy1/Z7+Ar+9QSNCdrZlzoUbJvC687G8t3pvbYUkG7JRZG5uqg4gOTCaoCqVxtoYPlkazFsK5Y/tY
	y5ei+DGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ164-00000003K6r-0Hxl;
	Mon, 01 Dec 2025 10:25:32 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ161-00000003K6T-0woD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 10:25:30 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-47774d3536dso31904945e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 02:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764584727; x=1765189527; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AOnEw3BZnfclp4gqXFuh5EU5EE3a2Dn8SHSXTdmn3IQ=;
        b=p/cpDUPbDdcfaGp1fy50K0rIFneqpKeW2zgBV0Ih7Y28pOp5s10/cRtbXa6YI9i/jr
         fGrQS3+SEuRtwTw7jDCBWpgwHVbByOVMbMCiav/HobcWcZJ6MxgmU/7AUpWEZ6Owzwis
         khljVkYm4tX07yM8xNnhdD8zfNAEPfUT2Go/kdUv/m+xRo6KhURqQsI2LkzPfDK/pMu2
         WgY5mmbbQce9V1LzQz+xQVUiPGuKKZAUIRJPcLw/Mk5BHZ9DQ+tmXEEQFxfblN4MGn+J
         ijNHsd3pJ+B1xWh4sxHP+gYBodyJEpxGgKuNOooAL4/qDPFR3PWHr8Q0gJ6YBO3p5n0N
         O7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764584727; x=1765189527;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AOnEw3BZnfclp4gqXFuh5EU5EE3a2Dn8SHSXTdmn3IQ=;
        b=cVh+Lg2OjsIFf/Oxg5/qceqgcN3bbBwnB2T5Zed/Ts+4OpATiFQ5VvUEpmjmdHSj9f
         Ei7MiXvzKugtoL3d8UWoGKZ1V3vCDcq240FdAHuDTq0diZtyXclaGVlxi5KrJ/n/uyKS
         BO94pKMsRutPs5uYb5IemYu7FPex+LDQP408G8iZjMFO3yiz98nT+MD3wLm6fD+gkmdG
         ziPlbLipImQN+mtlF5agPy7ZB8zCMqB72x3MMPxaYWB88ETtW9xbuImgn2OGVIN7VFbh
         2xFXZ4JWmpshNl7M4f3VmLWY6t90DNd8eEHxOqSSQ0dDnWxGIBuGbjHrjTAjHRQTeste
         wToA==
X-Forwarded-Encrypted: i=1; AJvYcCUlr7Ly98Xm5wYr2Z/UiddG6Z7A050xGqy57pnFz2KO+hlGNkb9sgFzfJDMpCBPbI0lnL/KBUZkPdOtWiUa7ILr@lists.infradead.org
X-Gm-Message-State: AOJu0YzUrSHxwDJhM7DuTnCPWv32JVJtLWbOAJ09W0LY9a783/ANGT7U
	SUl8BAaJPPGUEdZ8MiC+zD0Nc2g0luDF7KTs0WqGItf1XMWXyBR1NWbpYUxPIkntACA=
X-Gm-Gg: ASbGncu5Oz+flGZD3G4g/GPnBQlH7oSo7XZajeNpEyT1seKSUL/0oW8jvUFV6TYpGWf
	GO0yIVDlF+cRGj8rVnKIfyRg+cxqXHo+2dIlsuboHP72bz/QJj7LO9DL5SAoeFXIkCG8adK/FUv
	lS71N5YibkfU49T9vUxoamT1ucIg2i15WUS+y1pQNV7lFWTEPGpSVFGxPLaDZCXTZushiViKOfH
	jedNdfQvnV8ENjrEMeHH/yWXZmQ+bZr3kx58MX/1BqrFK4V4K7WkzWbiUkJV54C+2PA8o49QjCj
	wZEs0bJTVrIT9f8eTGoAtswZmyIDlMVDzz9bGQlav21QhA5Yc5YRRiRwYlD4mc1Deky2LReOP2f
	IaI2E1CD0IaFtXPfRbOxV0vqL+RxDspWxlhaSclFAeQlfbvwy8ljz9ziFRBldbnEO3LLfwwhgFh
	YxeYI6xBE+1DqdXacX
X-Google-Smtp-Source: AGHT+IGqN47TqQgE3W2/IvK3HzwKJr3Fu8oiKkh2wb31imC8aKtsl+rRxsn5mYsKl7E7agf7UAaT6A==
X-Received: by 2002:a05:600c:4eca:b0:46f:a2ba:581f with SMTP id 5b1f17b1804b1-477c0540a68mr422574995e9.16.1764584726968;
        Mon, 01 Dec 2025 02:25:26 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479040b3092sm153686955e9.1.2025.12.01.02.25.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 02:25:26 -0800 (PST)
Message-ID: <d7c17bc4-a7dd-42fa-8dd3-16a404a6d713@linaro.org>
Date: Mon, 1 Dec 2025 10:25:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] coresight: etm3x: Fix cntr_val_show() to match
 cntr_val_store() behavior
To: Kuan-Wei Chiu <visitorckw@gmail.com>, suzuki.poulose@arm.com
Cc: mike.leach@linaro.org, alexander.shishkin@linux.intel.com,
 gregkh@linuxfoundation.org, mathieu.poirier@linaro.org, leo.yan@arm.com,
 Al.Grant@arm.com, jserv@ccns.ncku.edu.tw, marscheng@google.com,
 ericchancf@google.com, milesjiang@google.com, nickpan@google.com,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251201095228.1905489-1-visitorckw@gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251201095228.1905489-1-visitorckw@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_022529_310888_818F6F93 
X-CRM114-Status: GOOD (  24.30  )
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



On 01/12/2025 9:52 am, Kuan-Wei Chiu wrote:
> The cntr_val_show() function was intended to print the values of all
> counters using a loop. However, due to a buffer overwrite issue with
> sprintf(), it effectively only displayed the value of the last counter.
> 
> The companion function, cntr_val_store(), allows users to modify a
> specific counter selected by 'cntr_idx'. To maintain consistency
> between read and write operations and to align with the ETM4x driver
> behavior, modify cntr_val_show() to report only the value of the
> currently selected counter.
> 
> This change removes the loop and the "counter %d:" prefix, printing
> only the hexadecimal value. It also adopts sysfs_emit() for standard
> sysfs output formatting.
> 
> Fixes: a939fc5a71ad ("coresight-etm: add CoreSight ETM/PTM driver")
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
> Build test only.
> 
> Changes in v2:
> - Redesigned the fix to match cntr_val_store() logic (display only the
>    currently selected counter) instead of attempting to list all
>    counters.
> - Removed the loop and the "counter %d:" prefix.
> - Switched from sprintf() to sysfs_emit().
> - Refactored control flow to use a single return point.
> 
> v1: https://lore.kernel.org/lkml/20251121002350.1166758-1-visitorckw@gmail.com/
> 
>   .../hwtracing/coresight/coresight-etm3x-sysfs.c   | 15 ++++-----------
>   1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> index 762109307b86..a6a650331196 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> @@ -717,26 +717,19 @@ static DEVICE_ATTR_RW(cntr_rld_event);
>   static ssize_t cntr_val_show(struct device *dev,
>   			     struct device_attribute *attr, char *buf)
>   {
> -	int i, ret = 0;
>   	u32 val;
>   	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   	struct etm_config *config = &drvdata->config;
>   
>   	if (!coresight_get_mode(drvdata->csdev)) {
>   		spin_lock(&drvdata->spinlock);
> -		for (i = 0; i < drvdata->nr_cntr; i++)
> -			ret += sprintf(buf, "counter %d: %x\n",
> -				       i, config->cntr_val[i]);
> +		val = config->cntr_val[config->cntr_idx];
>   		spin_unlock(&drvdata->spinlock);
> -		return ret;
> -	}
> -
> -	for (i = 0; i < drvdata->nr_cntr; i++) {
> -		val = etm_readl(drvdata, ETMCNTVRn(i));
> -		ret += sprintf(buf, "counter %d: %x\n", i, val);
> +	} else {
> +		val = etm_readl(drvdata, ETMCNTVRn(config->cntr_idx));
>   	}
>   
> -	return ret;
> +	return sysfs_emit(buf, "%x\n", val);

Sorry I missed this on the previous version, but this should be %#x to 
add the "0x" prefix. All the other ones in this file have it. Otherwise 
you can't tell the difference between decimal and hex.

>   }
>   
>   static ssize_t cntr_val_store(struct device *dev,


