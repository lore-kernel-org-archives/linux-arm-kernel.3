Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D8DF9D0DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 16:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4QPfZJEHwOdOf10WomVLuYg1vNbC8q99wI51Y6jPn+U=; b=iZupbg9n5aFn4ZDYi6ZtPDmWIp
	VkLp5DApcE8zPXXsKK4GmYfzO9r6ZlGScCQjDi4IqkFPmRDfcti4oRyIoFjA6kXDG7jD10uSTrfNd
	rtjgWin+RbJDrMpVVPs0n4WdsUsRo9KP7eLL7KAIQPuPKmwBY+cjAhNNpYcWRaK0uT/itvGseDJY3
	4ro3OKbODOlPyGF77WvNgg1SIlS0sMgAsMO03OMBjRqyBExjhXj5IaEyjL81o5pTF587g/2z/VZGf
	nvHXPKb7/sRLN31LTZrGcwfz6tgvfBRSJF+RYy5FifLFYER+ZABYyjDw71+dtQ8RVKurzrYqkxrH4
	zhnmsfew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCggd-0000000015l-2Cqi;
	Tue, 14 Apr 2026 16:32:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCggb-0000000015E-41ZS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 16:32:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA5E7337D;
	Tue, 14 Apr 2026 09:32:17 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2DC43F641;
	Tue, 14 Apr 2026 09:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776184343; bh=P55B9TXscDbVPBMMKx0AgxGjHZwwqjld9LQAZsfoyBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ANAWK0gOifUE0it1gUj/LI3u2kAkBzDhVDGBIhFo8SowLqqwfGXZlDHaFbj8NpY1D
	 hFSg6BWJ724D4/rI8MDY1oQqlgOyOlZg8qarIdr0ymgjbOLvBKORRzkLYXs5u45qDD
	 Tg3s2Mn1k3YhogmTOS12aAk+uduU6h5APN8AxOqA=
Date: Tue, 14 Apr 2026 17:32:21 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v4 3/9] coresight: etm4x: fix leaked trace id
Message-ID: <20260414163221.GG356832@e132581.arm.com>
References: <20260413142003.3549310-1-yeoreum.yun@arm.com>
 <20260413142003.3549310-4-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413142003.3549310-4-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_093226_057799_56A89CFD 
X-CRM114-Status: GOOD (  19.51  )
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

On Mon, Apr 13, 2026 at 03:19:56PM +0100, Yeoreum Yun wrote:
> If etm4_enable_sysfs() fails in cscfg_csdev_enable_active_config(),
> the trace ID may be leaked because it is not released.
> 
> To address this, call etm4_release_trace_id() when etm4_enable_sysfs()
> fails in cscfg_csdev_enable_active_config().
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 8ebfd3924143..1bc9f13e33f7 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -918,8 +918,10 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
>  	cscfg_config_sysfs_get_active_cfg(&cfg_hash, &preset);
>  	if (cfg_hash) {
>  		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
> -		if (ret)
> +		if (ret) {
> +			etm4_release_trace_id(drvdata);

I am not familiar with the trace ID, seems to me, it just allocate a ID
for each tracer from the ID map and then always use this cached ID for
the tracers.

If so, even an ID is reserved for failures, and the ID map is big enough
for each CPU, we don't need to worry memory leak or ID used out issue ?

Thanks,
Leo

>  			return ret;
> +		}
>  	}
>  
>  	raw_spin_lock(&drvdata->spinlock);
> -- 
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
> 

