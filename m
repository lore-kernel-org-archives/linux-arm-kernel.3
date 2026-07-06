Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BFDBC43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 17:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yJdgqDKy9noAujFzI15XGvq1vv/PVTlDEePaTlGp2bc=; b=uufQbEh+fR1Mga2cK+1RGFWUuW
	DTfzcNObo8c23jLGBjQzV0qk3TBmqKaYPLi3/KVqKCBCub0voIWdnpY3WjtLTflvMy5kPf7EVmpYi
	VPg+C3qVHhL11tfKwuNAWxc7aUwA4SmT9SDpXHGPZvxmUa6YLelDm1YcPgkY8LmcBFLR5iv6JS0+Z
	xgceP+GoBl+EgKQJXdNHR/NkK2JVKIuv4M3116s5JmgShtedqfaCOWJNGuZ7BOCzdkc21LHBrrjKa
	M6eZU4WAH+eKvq4hSm5Vv3ZDkg/ZSKwqNzmTtIEYbJ98OcDopFI8froLQBKiJ2b1+H0eC94jxuXUh
	qcfg5JeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgn1D-0000000DBcE-2mbZ;
	Mon, 06 Jul 2026 17:22:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgn1B-0000000DBbq-2Osl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 17:22:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06E25202C;
	Mon,  6 Jul 2026 10:21:58 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E69B33F7B4;
	Mon,  6 Jul 2026 10:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783358522; bh=nyXnpvP+SrFs+sXW8UI4Gim+ItFWKgXrvSGiRoFfJI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XANEA5IPRVjLaDVcD1WSSxBvlGsiecrmqiQDqh+hiHHQjqy9QEZYkHMIgxKXYIeCV
	 WgzbvUFNRxo9SaaZWIoVE26rJZzefTc7S1/q808i42nGkw9yM0+qsIqx0qQXDRJAMG
	 NShlEomXFYzkpYk6u99FVSZsP2we0UH7ywNfwqhU=
Date: Mon, 6 Jul 2026 18:21:59 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v8 08/13] coresight: etm4x: fix inconsistencies with
 sysfs configuration
Message-ID: <20260706172159.GA1024232@e132581.arm.com>
References: <20260629090007.1718746-1-yeoreum.yun@arm.com>
 <20260629090007.1718746-9-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629090007.1718746-9-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_102205_659892_5FA5D25D 
X-CRM114-Status: GOOD (  14.78  )
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

On Mon, Jun 29, 2026 at 10:00:01AM +0100, Yeoreum Yun wrote:

[...]

> @@ -619,27 +622,52 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>  static void etm4_enable_sysfs_smp_call(void *info)
>  {
>  	struct etm4_enable_arg *arg = info;
> +	struct etmv4_drvdata *drvdata;
>  	struct coresight_device *csdev;
> +	unsigned long cfg_hash;
> +	int preset;
>  
>  	if (WARN_ON(!arg))
>  		return;
>  
> -	csdev = arg->drvdata->csdev;
> +	drvdata = arg->drvdata;
> +	csdev = drvdata->csdev;
>  	if (!coresight_take_mode(csdev, CS_MODE_SYSFS)) {
>  		/* Someone is already using the tracer */
>  		arg->rc = -EBUSY;
>  		return;
>  	}
>  
> -	arg->rc = etm4_enable_hw(arg->drvdata);
> +	drvdata->active_config = arg->config;
>  
> -	/* The tracer didn't start */
> +	/* enable any config activated by configfs */
> +	cscfg_config_sysfs_get_active_cfg(&cfg_hash, &preset);
> +	if (cfg_hash) {
> +		arg->rc = cscfg_csdev_enable_active_config(csdev,
> +							   cfg_hash,
> +							   preset);
> +		if (arg->rc)
> +			goto err;
> +	}


I try best to not paste any non-sense AI reviews, record one from
Sashiko [1]:

 | If a user writes to a sysfs attribute like pe_sel_store(), it acquires
 | drvdata->spinlock without disabling interrupts. If an IPI is then handled
 | on the same CPU, etm4_enable_sysfs_smp_call() will call
 | cscfg_csdev_enable_active_config() which attempts to acquire the exact
 | same spinlock, hanging the CPU."

The flow for acquiring drvdata->spinlock in SMP call is:

  etm4_enable_sysfs_smp_call()
    `> cscfg_csdev_enable_active_config()
         `> cscfg_csdev_enable_config()
              `> cscfg_prog_config()
                   `> cscfg_set_on_enable()
                        `> raw_spin_lock_irqsave(feat_csdev->drv_spinlock, flags);

We might expect the complaint from LOCKDEP with this patch.

To be clear, I am not object to this patch, just record in case we will
handle it later.

[1] https://sashiko.dev/#/patchset/20260629090007.1718746-1-yeoreum.yun%40arm.com

