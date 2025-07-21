Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C1FC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 13:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RpTvEEcDHDO7ac8oLcy7D/fHoGVLaBDoEyzGnJRc+2U=; b=HzGScHHAbgihP5RY+kMqpQ9/QY
	IS+vge3wDQdaa1Hhk4oxXR3y6jXQAkEw2aIuuqoysjnUIsofkIg2KYSO2J6mToL4FRaiiMW7Y8azc
	ncmCNqLqg+GacBxk+mq1736+/6UJXp9bez0EWxuZGD2+Rbb1JaZO7GkXvJ4xwbdjDnaPON+pbeY5h
	LXIBcjvKTSzHUII5pqvQzoZv7gSKgzOw7jdPXH9fo5MWmxrJhbLNwNRb7yQxb1Jb2ilcRs3P31Eu1
	75OANl+n63rD882i7drpEJ2hNYjDkCsGLoLOAwojrdFWcCZqXR4H71Niherq9L7A3Vm/uWW8BuZWs
	4H1E9r+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udq7c-0000000HJum-1JZ5;
	Mon, 21 Jul 2025 13:00:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udoVc-0000000H3lw-245H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 11:16:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0D41153B;
	Mon, 21 Jul 2025 04:16:31 -0700 (PDT)
Received: from [10.163.95.2] (unknown [10.163.95.2])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE1F43F6A8;
	Mon, 21 Jul 2025 04:16:33 -0700 (PDT)
Message-ID: <6fecd7d0-a5a5-4973-94ce-c63a3dff6bc7@arm.com>
Date: Mon, 21 Jul 2025 16:46:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] coresight: Fix a NULL vs IS_ERR() bug in probe
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Leo Yan <leo.yan@arm.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <7bd9fae8-a15f-412a-8800-ce47acf0b5ce@sabinyo.mountain>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <7bd9fae8-a15f-412a-8800-ce47acf0b5ce@sabinyo.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_041640_578581_89BCC422 
X-CRM114-Status: GOOD (  13.81  )
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



On 17/07/25 1:08 AM, Dan Carpenter wrote:
> The devm_ioremap_resource() function returns error pointers on error.
> It never returns NULL.  Update the error checking to match.
> 
> Fixes: 26e20622a8ae ("coresight: add coresight Trace Network On Chip driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-tnoc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
> index 0e4164707eea..d542df46ea39 100644
> --- a/drivers/hwtracing/coresight/coresight-tnoc.c
> +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
> @@ -183,8 +183,8 @@ static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
>  	dev_set_drvdata(dev, drvdata);
>  
>  	drvdata->base = devm_ioremap_resource(dev, &adev->res);
> -	if (!drvdata->base)
> -		return -ENOMEM;
> +	if (IS_ERR(drvdata->base))
> +		return PTR_ERR(drvdata->base);
>  
>  	spin_lock_init(&drvdata->spinlock);
>  

Do we still have more similar instances in coresight ?


