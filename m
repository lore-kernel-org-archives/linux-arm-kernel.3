Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF00E6E80F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 11:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GNmObizV/hegVQH4jRQ5q/gIzT5fq7ym8fuFQbOaxmg=; b=ASpsqCw8obXNQ6NZhH/sXMPECa
	7aqiRueXN9rtb1wlwDy3SvivoGc9hHgRngXzLJFr1iBfeoh5DhzO9VGvYZgaVgA6L+f30jQc5rZNV
	EhlVPWZ+Ua6akBOTcdC7fb2M58flGd2alJQZWOQWlVTX+lONd8AqrTE6Kmsbhtp5sEjQJygZRs+4I
	Ol+HE5OIHvZeIzsG8WqyAySdE6zXmCshU9iUSjaUde1UCyUHVT7F0VxHNl8B9HNjiz2sQV9fqC3Lv
	hQVX+W9w94NhkmXF/9K/qFtlIn1vHGWxGNJpEIS6wSUoTUesd8VxkqGSP96UhQdoEJLxoP9ZS92wo
	3WU4bGLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnELV-00000006Wbi-38LT;
	Tue, 03 Feb 2026 11:13:25 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnELT-00000006WbK-1UWX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 11:13:24 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-430f2ee2f00so3501692f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 03:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770117201; x=1770722001; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GNmObizV/hegVQH4jRQ5q/gIzT5fq7ym8fuFQbOaxmg=;
        b=a5ABFFTvLUuKPbVbsFGXNjV4HD3fOwmYLvzoNUt7sDMxlurWo5YeTseUJH39JUl9vp
         AXulfIO53zjv4vkWCkXBDC+JPcriKCi79LACbNvbCfpTHbejwp5LbbEWgNYkQzr9pU2T
         7tNKUdzHej/9GhD6sW/SRcaHGEp13lrPmxZVinI9d+1qLAcZtffbVh7U9Ed327EYJlTq
         fdoSBBdRqBzOxa9mtDQJq3M3QrV9q8xwqXxivOA3pXlcKUJFm0xWC9UT5U+OVp9u1czV
         apPN/eh1FeE4Frgc7JzkufX14eYKDwjvi3Amkg+4oOQ9/D0N3PuF4ToPYODrewEniagT
         vgPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770117201; x=1770722001;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GNmObizV/hegVQH4jRQ5q/gIzT5fq7ym8fuFQbOaxmg=;
        b=NRMsSHYZHKOktV6lOAUYSnEXpZnwS0+QIkfJK3cjLvY+K3Aou9jxXumIMwIQHp2slf
         8mkRc/cx6ul5p8hMVGbB+GsGKR2GzSgEHxQx0RTfxa4hf5n/WHswHQ7Ec8k/3lxEdhNP
         mKUhK1FHp3Z3E8KmJz7JB/u3hvUvWyz3NenuZWk30bQimHIYu8eJIJt9FcSiRysVsri6
         lceUha/hppT6Rzf99MsbmHls4VeGlp5pQSLVWRg7H7qEfJ2jdNRIIpURIRa7QioppAku
         ZgWy3ouPLo4M4B4G+dkGC0+o43rN5oD6KTKjO26ZulDkm0Skx00949lqNCcTw1C+c4s+
         wi1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUxYh1h555G5Ks7pSNkPCpMjiEZrPOQDdGQeSSYJeB0qgiQEm/1C+XF9uhMFWQtbu88QkZyC7HqTdKit2VDl2t+@lists.infradead.org
X-Gm-Message-State: AOJu0YxRoAv/O4X6F8YiE43OIhZ9SKr8eyeVyPLtanEvl3PYvmnzmBck
	D1IvgKIjBpTAGqSyR5dLs2INQT5LY4q12jsXzOfOQ6mGeoM40WSDItnmDbMX+lQ5XXM=
X-Gm-Gg: AZuq6aIH/nEpnF2z0hshKHKyiRPlmMVEaUpgd7qJSPww/pJ8JigDoqXkaDRQkacJSDV
	rTPOI0QpDRsvGFFYkzhouaqwYJ1SIdG/pymSPX2d92rrqsHiPz/eBT7pnbsahID+XWGAGp7nO4U
	Uf/IqdWtDl2c8jz08GFvtInx9TF8IgbFnFXkHTrMGgvouyXmBbuNmOShNtLmuKeJ6W4YQw9sK5C
	8ptZkqZ7OoluQ8CO6t/oROjXw3In1VDvtkzZb83FqBR+q1H9rW/8NaIgMyR0yQ4vB/5I44p+d8k
	Gfocc8lRGej7r/NGONklmJcXpm59bZOj2LK+QXN68X5X2TXeH0eW9Dth6P7vrbKJ1fjDTsz0qrv
	svPdd4nRIxm0sLbIiJDbh4riw2/Qs/p5x+XzLCcKXWeZ0NlJjBs83Btq/BYO4dshqJIUL7DQIoV
	b2Z8JKETKUhW94iR/9
X-Received: by 2002:adf:cc87:0:b0:436:cea:6165 with SMTP id ffacd0b85a97d-4360cea6188mr5522685f8f.6.1770117201362;
        Tue, 03 Feb 2026 03:13:21 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436143d81desm3147732f8f.42.2026.02.03.03.13.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 03:13:21 -0800 (PST)
Message-ID: <38866ed3-f726-434b-af78-6dc30547f3df@linaro.org>
Date: Tue, 3 Feb 2026 11:13:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] coresight: Fix device registration and
 unregistration
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Mao Jinlong <quic_jinlmao@quicinc.com>
References: <20260202-arm_coresight_refactor_dev_register-v3-0-03292470c48c@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260202-arm_coresight_refactor_dev_register-v3-0-03292470c48c@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_031323_431859_79B53027 
X-CRM114-Status: GOOD (  19.69  )
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



On 02/02/2026 9:33 am, Leo Yan wrote:
> This series is to fix and refactor CoreSight device registration and
> unregistration, it can be divided into three small parts:
> 
>    Patches 01-03: Three fixes for memory leak, device reference and mutex
>                   protection.
>    Patches 04-05: Move connection cleanup operations into
>                   coresight_remove_conns().
>    Patches 06-08: Refactor error handling in coresight_register().
> 
> This series is verified on Juno board with kmemleak detector.
> 
> For kmemleak verifying:
> 
>    echo clear > /sys/kernel/debug/kmemleak
>    insmod coresight modules
>    rmmod coresight modules
>    echo scan > /sys/kernel/debug/kmemleak
> 
> The result shows no memory leak during a cycle of device registration
> and unregistration.
> 
> ---
> Changes in v3:
> - Updated patch 01 to use coesight core layer for device index list
>    (Suzuki).
> - Link to v2: https://lore.kernel.org/r/20260126-arm_coresight_refactor_dev_register-v2-0-b5a3c0441c15@arm.com
> 
> Changes in v2:
> - Refined the commit log in patch 06 (Suzuki).
> - Unified to call coresight_unregister() for error handling (Suzuki).
> - Refactor connection and sysfs group release.
> - Link to v1: https://lore.kernel.org/linux-arm-kernel/20250512154108.23920-1-leo.yan@arm.com/
> 
> To: Suzuki K Poulose <suzuki.poulose@arm.com>
> To: Mike Leach <mike.leach@arm.com>
> To: James Clark <james.clark@linaro.org>
> To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> To: Mathieu Poirier <mathieu.poirier@linaro.org>
> To: Mao Jinlong <quic_jinlmao@quicinc.com>
> Cc: coresight@lists.linaro.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> 
> ---
> Leo Yan (8):
>        coresight: Fix memory leak in coresight_alloc_device_name()
>        coresight: Get parent device reference after sink ID map allocation
>        coresight: Protect unregistration with mutex
>        coresight: Refactor output connection sysfs link cleanup
>        coresight: Refactor sysfs connection group cleanup
>        coresight: Move sink validation into etm_perf_add_symlink_sink()
>        coresight: Do not mix success path with failure handling
>        coresight: Unify error handling in coresight_register()
> 
>   drivers/hwtracing/coresight/coresight-catu.c       |   4 +-
>   drivers/hwtracing/coresight/coresight-core.c       | 230 +++++++++++++--------
>   drivers/hwtracing/coresight/coresight-ctcu-core.c  |   4 +-
>   drivers/hwtracing/coresight/coresight-cti-core.c   |  19 +-
>   drivers/hwtracing/coresight/coresight-dummy.c      |   7 +-
>   drivers/hwtracing/coresight/coresight-etb10.c      |   4 +-
>   drivers/hwtracing/coresight/coresight-etm-perf.c   |   5 +-
>   drivers/hwtracing/coresight/coresight-funnel.c     |   4 +-
>   drivers/hwtracing/coresight/coresight-platform.c   |   2 +-
>   drivers/hwtracing/coresight/coresight-priv.h       |   3 +-
>   drivers/hwtracing/coresight/coresight-replicator.c |   4 +-
>   drivers/hwtracing/coresight/coresight-stm.c        |   4 +-
>   drivers/hwtracing/coresight/coresight-tmc-core.c   |  12 +-
>   drivers/hwtracing/coresight/coresight-tnoc.c       |   4 +-
>   drivers/hwtracing/coresight/coresight-tpda.c       |   4 +-
>   drivers/hwtracing/coresight/coresight-tpdm.c       |   4 +-
>   drivers/hwtracing/coresight/coresight-tpiu.c       |   4 +-
>   drivers/hwtracing/coresight/ultrasoc-smb.c         |   4 +-
>   include/linux/coresight.h                          |  14 +-
>   19 files changed, 175 insertions(+), 161 deletions(-)
> ---
> base-commit: eebe8dbd8630f51cf70b1f68a440cd3d7f7a914d
> change-id: 20260120-arm_coresight_refactor_dev_register-f16c069db41d
> 
> Best regards,

Reviewed-by: James Clark <james.clark@linaro.org>


