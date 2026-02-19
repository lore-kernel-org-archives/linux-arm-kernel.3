Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19773E9A050
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 16:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IW3jBurWWiSVBgp9ow/AJfZsWMAiwx6/MeVyFpniDvo=; b=FlJNUmZPrzfkuutdFryUq+RNDV
	72ufseYQuWvsF57yiiVHzK4SmNFyUZIpoisACsJLlTyG7mkGsfPgGyHzQjt/gQn8rlMTUdWmkoaV+
	dgvdCXzCC1bRH1fAvx2kIJb7IwZHXO8HYK4aUYkzHV1dgfPLQWhFNwc8bA6mGHQTyfNL9P6i4qlEE
	6bsv+zsfjqYYFT61S260IcOV5h/8zRcgx6uBy+WxBVfLUtYdv0V/zmaqBtXsqpt8ALRoQcHoqkK72
	fk1xIsdH/wiw24gwbuPNAXFBH8NnsiAXXu5it8pgGWbvKrReh/dJXVvsDCrlSSMTx9Irgpafhgiwg
	1CbTwLRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt77h-0000000BeAq-2Xt0;
	Thu, 19 Feb 2026 16:43:29 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt77f-0000000BeA6-1O28
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 16:43:28 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-48336a6e932so8048005e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 08:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771519405; x=1772124205; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IW3jBurWWiSVBgp9ow/AJfZsWMAiwx6/MeVyFpniDvo=;
        b=ptMlrfjcQOtb9iQq4PdMVI652ARJ6wu/yedTzUtUHp+Di3vMXukbb8EImXOdE/1rPH
         NG5E79F+tDNCG1p43ExoSKiqrb5Yg7inB7Q2oWy+gRwELbWhA/0Rnsi9OERiCi0Ln9uL
         hrxdoB3h/d9ruG63FFoCK/d1RZFUCyK95AyDbeShps2gQ4GUgowac265mpjm1WAnbYzL
         7N7YbGLhefD/z/hbyzbuxqrvhO+pJq8V7SDWX49FEdXYa8jKDA/+AWKAIxpBcs3AI4CS
         2tatdybEu6nmZKqcs3jAHC6Arj7RpsDHhOD6qcWNaZopcbIKwS51gbB/606hn6kNchCJ
         5d+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771519405; x=1772124205;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IW3jBurWWiSVBgp9ow/AJfZsWMAiwx6/MeVyFpniDvo=;
        b=eJD9LQmqvfDOZjZ69jbowR7mbPBlpJmyS3KAgpNP6ehDp4zLXuBeBUwelEFfSvjLOq
         lXAxamU76901NZQNsVfIh4V7v8OvbYBsPDIXdkvMcg2AWhGia8YroxWobhbpREJcIW3a
         XmWlhO7KiTaAca6XHDXuGfJLJyHmK/A6c5DD4GIUqta1UMigG3aNp7ErMECbe8stvm4I
         OsaWCw5W+TQDAf3EolqRw8SCPjKSGNzgTYr/ejEylrF9FADJVm6DDG8uv5IbrYD9lHiZ
         oI0U8O3vQo759xD/MYlhZxOTcYZ+GAvUEV9gpNdmOIlfPVIjrMrVcZa60xseZgAORa0z
         Hp+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXElBUMaqNkG/68Nr9ILlOHd9I92n/vmBlSNRomwgIoyiZsHfDD3cwAY3WYFgke86kmrg3EjCd5AfIMHGVieM1I@lists.infradead.org
X-Gm-Message-State: AOJu0Yx83L3MExHGn4C1rYU/HBJk1n+vDigJ8GRMt4VQ4FALMNzhw40r
	tRBLhx01cU4s1+U9iLaE42h2qEr1slLgFMS7FsNqOBJb9nfuZbpN1C6xcpwPtcw9rCr2ngvBnHp
	q3NUALcQ=
X-Gm-Gg: AZuq6aLKZuSA++NmV7EupX9+zsIZm8PXDJTAh5MAOSSBnQI62Wmbg9S7u5UlpzfjeCz
	JwnbKxFWTvKxVcggPvCSr3V0nmT3nhFeUPJlSpMQTHKwpgpRxk18Q5IQQNEx20YxhJHoqvksAKn
	LX5Knd2LWOjGGkKC1RLOl8yqUxem/U27ZDjkVnevTYz8zEcEqhuk904sPqAtuRiQLzTTYpVelBq
	it169LteoHjGpsASw2uGhfnIqls0Km4Gu6YtiwKRM6jxVjfMvsp5f8DV6pu6y2vk58KYrgPk86W
	jA+zHsilcy4H3DR8mOhH0LFKrcfHaRwrb8as7ukQe4jkPo7QiuFhbr/lPEaGEU70UeBYotWR8in
	95kxKf5ZfOXjybRA+6l15no5lHSIcaecV7FL4L/F4PLCIyl4ctEBEW8mVUbNezVsuj2QSSRCnGL
	sxg9wjlMychzLdM6o9eq1I2xtdj/JNzJhgG2yDZ+w=
X-Received: by 2002:a05:600c:468b:b0:47e:e20e:bbb2 with SMTP id 5b1f17b1804b1-48379b93583mr304822705e9.7.1771519404895;
        Thu, 19 Feb 2026 08:43:24 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839ea1e7e1sm22080125e9.2.2026.02.19.08.43.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 08:43:24 -0800 (PST)
Message-ID: <ca4e55e0-d0cb-4079-9f88-36d64624049a@linaro.org>
Date: Thu, 19 Feb 2026 16:43:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: ctcu: fix the spin_bug
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20260219-fix-spin-lock-issue-v1-1-557f7d513d7e@oss.qualcomm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260219-fix-spin-lock-issue-v1-1-557f7d513d7e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_084327_392956_30420CF0 
X-CRM114-Status: GOOD (  13.79  )
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



On 19/02/2026 2:46 pm, Jie Gan wrote:
> Acquiring an uninitialized raw_spin_lock is invalid and may trigger
> unexpected behavior or spin_bug.
> 
> Fixes: f78d206f3d73 ("Coresight: Add Coresight TMC Control Unit driver")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-ctcu-core.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> index abed15eb72b4..a505b90c09e3 100644
> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> @@ -228,6 +228,7 @@ static int ctcu_probe(struct platform_device *pdev)
>   	desc.dev = dev;
>   	desc.ops = &ctcu_ops;
>   	desc.access = CSDEV_ACCESS_IOMEM(base);
> +	raw_spin_lock_init(&drvdata->spin_lock);
>   
>   	drvdata->csdev = coresight_register(&desc);
>   	if (IS_ERR(drvdata->csdev))
> 
> ---
> base-commit: 44982d352c33767cd8d19f8044e7e1161a587ff7
> change-id: 20260219-fix-spin-lock-issue-c563c32c5441
> 
> Best regards,

Reviewed-by: James Clark <james.clark@linaro.org>

I checked the other ones and they're all initialized, this was the only 
missing one.


