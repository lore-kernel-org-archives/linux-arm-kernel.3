Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42730C3ABDE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 12:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q8OI1ZU7AHmHhbA3+QuG7FVXXKsV9VE0DWdSjUFONw4=; b=aZ03mLFMF2j/AEG+L1xofeESpB
	c8arNu8EcIWLTKEPr85ekr4xQ7ue3cnQxIBvv1OKy6vZQlOJXI3IaU0lvmkgk8AyX9DEal6OSPNb7
	HsT1c5ej3qDJvrSDaOSZLNYSo2lMegRvafHIyASoEUnsFHdcW7xHRCa0kIeX1OpGSEGo8bJ+IXQVO
	NLJqRdnKFRGHOcjX+9Yc4y85E7Exkpi6y0y3v13nfbzFVIExV/S6w+5fJSEZWqYmzRK2+64sJp781
	Oig2n/Q3251BQG6A/h45jD/QInakXakyMk1LjvMrSbOGaeDzpJO2nUX1ya4b8Op59B6gZdPxhl6t7
	NHJIeqHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB3f-0000000F01I-1ktE;
	Wed, 14 May 2025 12:17:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF83G-0000000Ebl3-0eYj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 09:05:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC237169C;
	Wed, 14 May 2025 02:05:07 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 82E663F5A1;
	Wed, 14 May 2025 02:05:18 -0700 (PDT)
Date: Wed, 14 May 2025 10:05:13 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: suzuki.poulose@arm.com, mike.leach@linaro.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] coresight/etm4: fix missing disable active config
Message-ID: <20250514090513.GC26114@e132581.arm.com>
References: <20250513170622.3071637-1-yeoreum.yun@arm.com>
 <20250513170622.3071637-2-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513170622.3071637-2-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_020522_234257_E510861E 
X-CRM114-Status: GOOD (  13.48  )
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

On Tue, May 13, 2025 at 06:06:20PM +0100, Yeoreum Yun wrote:
> When etm4 device is disabled via sysfs, it should disable its active
> count.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>

With adding fix tag:

Fixes: 7ebd0ec6cf94 ("coresight: configfs: Allow configfs to activate configuration")

Reviewed-by: Leo Yan <leo.yan@arm.com>

> ---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 2b8f10463840..f008f87f0801 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1020,6 +1020,9 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
>  	smp_call_function_single(drvdata->cpu, etm4_disable_hw, drvdata, 1);
>  
>  	raw_spin_unlock(&drvdata->spinlock);
> +
> +	cscfg_csdev_disable_active_config(csdev);
> +
>  	cpus_read_unlock();
>  
>  	/*
> -- 
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
> 

