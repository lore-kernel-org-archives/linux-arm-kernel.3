Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E7FCFD376
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 09:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zydHyiqAC3ZHYIZdC05XqLM2WAuCVhDvuFCoJaMA1lo=; b=Kei+T2SZIdax5f3ns6F2QMBfrk
	OIX+NAhtXGIPos9HAoYSPNMrcOi7chsOkMGI+ii7X6KEQ4VpXxUolVeQEGUqGaTzgewu1RHq7uQz8
	iGB+zprgBYgbYOmpFxjKLYcF1xeUgaFiuaRdN+z02vpn+9dRXLBPt+c2o/Xg1CiA7tgzmASRUIv1V
	HqeTquY6dJODKB+pnP6N16qoOvbsZNa69GE85Bvp3lX9i3cIJnmMge1NLwag4XnE4JDJsRiQ5bIpo
	rebneX0FowKH6zzVq0jUvCblLyS/AFlRkXZ3uBYPh9naUIKXwCcUISx0dho0cyQu8zsI4Ogb5BOmN
	dqvdvjKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMeQ-000000056Rb-3O3G;
	Tue, 02 Dec 2025 09:26:26 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMeN-000000056RG-10it
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 09:26:25 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4775ae5684fso24288005e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 01:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764667581; x=1765272381; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zydHyiqAC3ZHYIZdC05XqLM2WAuCVhDvuFCoJaMA1lo=;
        b=oR7xUxROW+Zm6HvOytPcAjsO9tYF0JPZSbgYPf1Cs3YhtB/J73dVbDo+zTThV0TImM
         2V78+l+/oCqSMxBD2I7CJBmbkUp1ve5j6C60fl8b/rqxI6vUQPi/RduG2JjUXW7FiTC/
         O0FZedCL0UMBqv5Aaf7ywTi9GvCbj41qNI3N07GZh2+QLEsQUFpbrKtuVZj9tkVbnHyf
         mvu8yX32hhkvEDp8F9F4In8XG+TAaYxwohIG8Lyiig5mQRMhjacuiQBNndeWqGxIG1UL
         i8vCI/cdxmPw7S+XFpkigwQjbCDgFKtMm8ovkOagXQT703Rwkr3JD2XaLiLRY3KfSka4
         4bbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764667581; x=1765272381;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zydHyiqAC3ZHYIZdC05XqLM2WAuCVhDvuFCoJaMA1lo=;
        b=o8JjHPWNaoIUAKMYu82TLWr66knClnSuzCIOaGPKCpPUf1XU8xhko7OhX1ol2k6gJn
         PMB9w/R/Vd2Oa/Bh/HHE/7czr3Hh9ltS+VtZw+YEwEt+1/SHbF8743ktwkDpE63LzVbr
         17RJytIpydUkzjH6P003hgl2FusHgYHrx8BzFOEhIi/veWK+c6MOifKSTg0Uk0x0Z8Cs
         apYdmjoUjZM1inTCfHsht61ceWKp9EA6DK1XZQ6CguatepoDuCWQQeCeKCg6xQZ1tkqr
         NY8mJJ0UcBRRT2RRjVspMd17GaUaIbrdWVCyP3jExaJNMN1BUpIwQWG5fFZhBUigLmSy
         VU4g==
X-Forwarded-Encrypted: i=1; AJvYcCVZWu2JKZnC1MEq6JG6Evv4e40xIqA9MSL/tBYs3yJLpQICB/Y8F2qOVPy+zXbOT367QO5GV5J4ThMglgiX+bsl@lists.infradead.org
X-Gm-Message-State: AOJu0YywOcG/U65wbsXS+ErTitMDTp8VuVQ7RjO/8wgu8BmnW/85E0ax
	w3AHzvBNXR/a/C6urFzCKxpK+VI2M+XsLUFfE3oZ/xqxglWgFl0k4XuLHP+xrZgn24Y=
X-Gm-Gg: ASbGncsbjT9WmkxJ4XYISsRrEEEdjy0F/3k5O6RcIzR7LraVbdv1vA/Nc0zrM6clT7o
	YyvDz4j5DnBOrL5+jxbCantOmycgimFYMLzpMWCKDIt3ycdYQFFOGhczc3vExCaRFXyucx97Pe7
	vwqCLV13pzfGadm6h5HUHg5zHnlhDejZEXpTDml54l/mFYeDxTyVYCOwm2BcrH1F5VDHVMn/BRE
	GuxgbcVEkUWqbQO87FBz7Gjr5UY7ikrJA0sH/bm6FzX+Tb/RhcRFcTASCqHqSPoSmOwgAyTW+ki
	l9Z+PIbTSOrYzWqHMLK2/kWnHaXxz7kTfq5JbISRphMuh1vRLUZGA4++kQ+Qoxrh10XVLQSciy6
	vE5sARczSCEmpRkRO0qVfjZ7mX9ot8DB40G8M98Ui05n+vAbgmUeOq2jk3J5gqbox4ps146Fcjh
	HqGsalY9ubpFL28KWK
X-Google-Smtp-Source: AGHT+IE8k+HW7Nso1FCZIlB9mBQaNvvaXUAUAi2gwo61pv1tszj/rx1Sal4ecT4VI29+FHM/ydZiPA==
X-Received: by 2002:a05:600c:4f06:b0:471:9da:5248 with SMTP id 5b1f17b1804b1-477c114ef3dmr458806355e9.26.1764667581352;
        Tue, 02 Dec 2025 01:26:21 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca1a3f1sm32008361f8f.28.2025.12.02.01.26.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 01:26:20 -0800 (PST)
Message-ID: <3bec7ceb-61a8-4b38-a794-02ee2fc9e68c@linaro.org>
Date: Tue, 2 Dec 2025 09:26:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] coresight: etm3x: Fix cntr_val_show() to match
 cntr_val_store() behavior
To: Kuan-Wei Chiu <visitorckw@gmail.com>, suzuki.poulose@arm.com
Cc: mike.leach@linaro.org, alexander.shishkin@linux.intel.com,
 gregkh@linuxfoundation.org, mathieu.poirier@linaro.org, leo.yan@arm.com,
 Al.Grant@arm.com, jserv@ccns.ncku.edu.tw, marscheng@google.com,
 ericchancf@google.com, milesjiang@google.com, nickpan@google.com,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20251202082613.3265761-1-visitorckw@gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251202082613.3265761-1-visitorckw@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_012623_328731_48337744 
X-CRM114-Status: GOOD (  21.80  )
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



On 02/12/2025 8:26 am, Kuan-Wei Chiu wrote:
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
> Cc: stable@vger.kernel.org
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
> Build test only.
> 
> Changes in v3:
> - Switch format specifier to %#x to include the 0x prefix.
> - Add Cc stable
> 
> v2: https://lore.kernel.org/lkml/20251201095228.1905489-1-visitorckw@gmail.com/
> 
>   .../hwtracing/coresight/coresight-etm3x-sysfs.c   | 15 ++++-----------
>   1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> index 762109307b86..b3c67e96a82a 100644
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
> +	return sysfs_emit(buf, "%#x\n", val);
>   }
>   
>   static ssize_t cntr_val_store(struct device *dev,

Reviewed-by: James Clark <james.clark@linaro.org>


