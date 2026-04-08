Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 631A51073CB0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 13:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zNxMD4ebSTuVdeWGIOG/Mq97ZFOA7XKvnQijNMuyPBw=; b=3BX8uDRyZ1zm+e7CJJOtMHw7DH
	WX6BsLwJfxDNRJASShWpcoZoCkH1dTzYlHQ5oNpEGxlN+wt3HNo4dNagtYbhOkYSCLfk+buMBT3hK
	Tej32BtifZgYIsxjxG33DkdcK5TorFaRzu8zAAzQwidW/Rc2tQao1fqZZX3ot3dWKjbkHyGCrD2Rf
	TcRIoHWcm28cLs5mUHHrhHEMaEApkrcPA+sEWh3VTPNoPZdwgU3nDdJAO6rk4qAnrByU4Dig0cdQ9
	q3UmVG98GjEb1lUBL0NyY9NWpIT9OW3qoLvrZab/31GYI/+Iux3qQkqihxg/q/FeLR7a0yLjS5+jn
	OYRb2aLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wASwq-00000008udx-1WqF;
	Wed, 08 Apr 2026 13:28:00 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wASwo-00000008udc-0yrO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 13:27:59 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-43b87970468so4821803f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 06:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775654876; x=1776259676; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zNxMD4ebSTuVdeWGIOG/Mq97ZFOA7XKvnQijNMuyPBw=;
        b=qMxvpDtVGDYXFtTqltQ1IMKVSOOhX6vLOgTitij4Ilr609E6CNEbcE/hI+UcFCvJRu
         A5N1ncv+ahD4BVI4d3Ulci2rtdscPwc3mvEvRnxCSvsSEczfK2yxVE0TWZbNYLXuCMrO
         ayHY+G044/EcWccY3jEpT4ECQwDN/jyofKXEvnSx1uz91YJBaC1pamwsqIBzucxO7MN5
         Lv4pwoqZYUNHsyeiiYFR2uL5BiXIlVSss3H8CMmRWs4QHLuJn4rmVO09EJY5eT/D7wWJ
         hN0fvBXxtpnl56nmIP7bF2Jwg6XP+ZQmWCxkjiNcHUF2CqOp6UWajajv+/plVIVLqtKU
         CgOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775654876; x=1776259676;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zNxMD4ebSTuVdeWGIOG/Mq97ZFOA7XKvnQijNMuyPBw=;
        b=BjrMjWa23uN7HWwFjRY4TEGb5gEiverpzGsVkxuXeBCy8WkzjCHLcL3FmzvoqXaXIi
         gOAOqV5c9DXRgo0KwwWWlsTnEEiR9j1pf1Eu5BDghDEO0i7S3myiYqKYaOG5bQArwXiC
         nPYWc46A84gX0mrzZLS42Xx6S+HdS4S2dTUXf6zN8EuuUkXgAV3Lzd7HBXajM4+OKo6J
         tuzGK+4T6iwyGAZ6a3p7vpO2fWBHt30EKGe5xWRvLo1vjYXW75dz2GJr8/fuB8TGAuJU
         x4q1J0fDj31GZ1m+eG2mpICIA6YAY76oiB57VMkejY2uZVlgTMDi1UtKVggWAxkxHQNf
         BvEw==
X-Forwarded-Encrypted: i=1; AJvYcCXleqzx6DUgAA20lLH5ulrZZVcQQ3ece9sE3d1oIbm8AF+V+MWU2nurV7LZlK/VvRJVECgSqsg7USD0QrUlnKuB@lists.infradead.org
X-Gm-Message-State: AOJu0YxyvrQPsKu59DoNPTUWygn4wVh2gCRPuS6p//d99uw0dx19+gKn
	fBXY0BXcIDP0xvwgC5BBNKRfCr3nGc6C8Y7GfLIGb7OyAlHaih7ZXOMVUl3JG+h8KNI=
X-Gm-Gg: AeBDievDjC263Uq59MJYMm+V/Tpx6XgCX7jP+3Q5GCIdIkp2k8VcQppLwQ5B1lM0OxD
	CyaLLGoPCjfig6uKU50Fg0e46wC95h79DwE5Dho0uWMcN2nLOMalX4DAcCzmQ5WvnIRaokdOLV0
	i2kWCaGL/XM/yxvTH5JDYd7yg2FpKW+vH4zkRObN8bBxNZIKsWSeXuIocInT2EYHR63LEzk9UFx
	BY+YFgAx0N8vBYR1FvC9E+vEHsrDjGxUTawPqdurq9+oNRdvCPYi3qdhYxCy6A75Z5HwELTBDld
	x9E+KW2Vm7UoqHsKFv0N6vmLkzMlvUeTAAqqqGeB6/ljsarx4OktVyaTV6JNmf3CJy7zIpOEefL
	cqfXwKYDCSUq8lSFa1ql1tOX7lpCUR+csbqzmI3Zd7HFwei84SLFm7yY9tj6R3Yf2A1xN9S8UTx
	ct5X3rlUMDQu5718tDDpQknKNSY8AO
X-Received: by 2002:a05:6000:400a:b0:43c:f764:6256 with SMTP id ffacd0b85a97d-43d292dbb67mr31327840f8f.37.1775654875832;
        Wed, 08 Apr 2026 06:27:55 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f1a99sm62321846f8f.32.2026.04.08.06.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 06:27:55 -0700 (PDT)
Message-ID: <511c0ae1-6ad4-4607-92b5-4ea2be2ee04d@linaro.org>
Date: Wed, 8 Apr 2026 14:27:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: tpda: fix race between refcnt check and
 register access
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Tao Zhang <tao.zhang@oss.qualcomm.com>
References: <20260408-fix-race-condition-issue-v1-1-9a148d07e08f@oss.qualcomm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260408-fix-race-condition-issue-v1-1-9a148d07e08f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_062758_312234_7986E3A4 
X-CRM114-Status: GOOD (  18.81  )
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



On 08/04/2026 2:23 pm, Jie Gan wrote:
> Several sysfs show/store handlers check csdev->refcnt before acquiring
> the spinlock, then access hardware registers inside the lock.  This is
> a race: between the check and the lock acquisition, the following can
> occur on another CPU:
> 
>    CPU 0 (sysfs reader)              CPU 1 (disable path)
>    ─────────────────────────────     ──────────────────────────────────
>    refcnt == 1, check passes
>    [waiting for spinlock]            tpda_disable(): refcnt → 0
>                                      debug clock disabled
>    spinlock acquired
>    readl_relaxed()  ← FAULT/hang
> 
> tpda_disable() decrements csdev->refcnt under the same spinlock, so
> moving the refcnt check inside the lock closes the race.
> 
> Fix all six affected sysfs handlers: global_flush_req_show/store,
> syncr_mode_show, syncr_count_show, and port_flush_req_show/store.
> 
> Fixes: 8e1c358a3b0e ("coresight: tpda: add global_flush_req sysfs node")
> Fixes: 33f04ead7c49 ("coresight: tpda: add logic to configure TPDA_SYNCR register")
> Fixes: a089d585a7f4 ("coresight: tpda: add sysfs node to flush specific port")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

Reviewed-by: James Clark <james.clark@linaro.org>

> ---
>   drivers/hwtracing/coresight/coresight-tpda.c | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> index 89c8f71f0aff..63a979312463 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -360,10 +360,10 @@ static ssize_t global_flush_req_show(struct device *dev,
>   	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   	unsigned long val;
>   
> +	guard(spinlock)(&drvdata->spinlock);
>   	if (!drvdata->csdev->refcnt)
>   		return -EINVAL;
>   
> -	guard(spinlock)(&drvdata->spinlock);
>   	val = readl_relaxed(drvdata->base + TPDA_CR);
>   	/* read global_flush_req bit */
>   	val &= TPDA_CR_FLREQ;
> @@ -382,10 +382,13 @@ static ssize_t global_flush_req_store(struct device *dev,
>   	if (kstrtoul(buf, 0, &val))
>   		return -EINVAL;
>   
> -	if (!drvdata->csdev->refcnt || !val)
> +	if (!val)
>   		return -EINVAL;
>   
>   	guard(spinlock)(&drvdata->spinlock);
> +	if (!drvdata->csdev->refcnt)
> +		return -EINVAL;
> +
>   	val = readl_relaxed(drvdata->base + TPDA_CR);
>   	/* set global_flush_req bit */
>   	val |= TPDA_CR_FLREQ;
> @@ -404,10 +407,10 @@ static ssize_t syncr_mode_show(struct device *dev,
>   	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   	unsigned long val, syncr_val;
>   
> +	guard(spinlock)(&drvdata->spinlock);
>   	if (!drvdata->csdev->refcnt)
>   		return -EINVAL;
>   
> -	guard(spinlock)(&drvdata->spinlock);
>   	syncr_val = readl_relaxed(drvdata->base + TPDA_SYNCR);
>   	val = FIELD_GET(TPDA_SYNCR_MODE_CTRL_MASK, syncr_val);
>   
> @@ -440,10 +443,10 @@ static ssize_t syncr_count_show(struct device *dev,
>   	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   	unsigned long val;
>   
> +	guard(spinlock)(&drvdata->spinlock);
>   	if (!drvdata->csdev->refcnt)
>   		return -EINVAL;
>   
> -	guard(spinlock)(&drvdata->spinlock);
>   	val = readl_relaxed(drvdata->base + TPDA_SYNCR);
>   	val &= TPDA_SYNCR_COUNT_MASK;
>   
> @@ -478,10 +481,10 @@ static ssize_t port_flush_req_show(struct device *dev,
>   	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   	unsigned long val;
>   
> +	guard(spinlock)(&drvdata->spinlock);
>   	if (!drvdata->csdev->refcnt)
>   		return -EINVAL;
>   
> -	guard(spinlock)(&drvdata->spinlock);
>   	val = readl_relaxed(drvdata->base + TPDA_FLUSH_CR);
>   
>   	return sysfs_emit(buf, "0x%lx\n", val);
> @@ -498,10 +501,13 @@ static ssize_t port_flush_req_store(struct device *dev,
>   	if (kstrtou32(buf, 0, &val))
>   		return -EINVAL;
>   
> -	if (!drvdata->csdev->refcnt || !val)
> +	if (!val)
>   		return -EINVAL;
>   
>   	guard(spinlock)(&drvdata->spinlock);
> +	if (!drvdata->csdev->refcnt)
> +		return -EINVAL;
> +
>   	CS_UNLOCK(drvdata->base);
>   	writel_relaxed(val, drvdata->base + TPDA_FLUSH_CR);
>   	CS_LOCK(drvdata->base);
> 
> ---
> base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
> change-id: 20260408-fix-race-condition-issue-d44203254b87
> 
> Best regards,


