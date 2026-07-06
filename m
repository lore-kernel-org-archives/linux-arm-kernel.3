Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCBF8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 18:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s5ezrvVU8ZiJy0AIqpmxBR6kzO9pDpGe5ilBWa6k5+4=; b=xrCneWqqNkOKhvFSNv07p4pY7Z
	66EexQWUsONVjtjfuW3BOMH67VZ1VNlcq78G2kZw0Ngs44D2qiJNfs4DRVvKoGW76zZEsVVMbZl2R
	0qtxwZvEBiCW1+5DpUGGvt3CHSjeZDevMQL9gLI0NSSJhd8Ly7/NjbnE7BSpgNzoWh9x4bDyWBxJN
	p5PoyJ7/VqWh8r2isx4Tw8I1cqW8j+RpDQ7sJXegB8xfiLQZWZZULNxj0O/sUK1Oz2FANz/Z98N6M
	0hWIGGDfW4Iazxg33N/gb1OsKmRiR4jL60Z6hALrFVSokePiScTuMDcHcvQUr0qNng10PwfOmr78K
	PND7FnuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnsB-0000000DJyP-1x4v;
	Mon, 06 Jul 2026 18:16:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgns9-0000000DJx7-1duk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 18:16:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 726BA1756;
	Mon,  6 Jul 2026 11:16:42 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 65F133F905;
	Mon,  6 Jul 2026 11:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783361806; bh=3sVK4y13JlgfB9hgXB3M941FZ0eD1FDI0MxT/6Nr71Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Is6tvHJExjwUdWhqiSia/hirSmhDfQXN/z56qupMbqyEMS2HTFcHQ4qoRBcgI6OsV
	 ofPhbKjv+moDgH5nzPXv7yqz+R9TTbpwg1JFMqIKbyKNeCmn5xZPgnR76N41rPcWBe
	 E+y15+09kUD4u7iSw/p4+eW0W5f4wBt+EhZSyNvo=
Date: Mon, 6 Jul 2026 19:16:42 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v8 08/13] coresight: etm4x: fix inconsistencies with
 sysfs configuration
Message-ID: <akvxCqDgkElhCuH5@e129823.arm.com>
References: <20260629090007.1718746-1-yeoreum.yun@arm.com>
 <20260629090007.1718746-9-yeoreum.yun@arm.com>
 <20260706172159.GA1024232@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706172159.GA1024232@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_111649_521676_13A4CE49 
X-CRM114-Status: GOOD (  21.53  )
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

Hi Leo,
> On Mon, Jun 29, 2026 at 10:00:01AM +0100, Yeoreum Yun wrote:
> 
> [...]
> 
> > @@ -619,27 +622,52 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
> >  static void etm4_enable_sysfs_smp_call(void *info)
> >  {
> >  	struct etm4_enable_arg *arg = info;
> > +	struct etmv4_drvdata *drvdata;
> >  	struct coresight_device *csdev;
> > +	unsigned long cfg_hash;
> > +	int preset;
> >  
> >  	if (WARN_ON(!arg))
> >  		return;
> >  
> > -	csdev = arg->drvdata->csdev;
> > +	drvdata = arg->drvdata;
> > +	csdev = drvdata->csdev;
> >  	if (!coresight_take_mode(csdev, CS_MODE_SYSFS)) {
> >  		/* Someone is already using the tracer */
> >  		arg->rc = -EBUSY;
> >  		return;
> >  	}
> >  
> > -	arg->rc = etm4_enable_hw(arg->drvdata);
> > +	drvdata->active_config = arg->config;
> >  
> > -	/* The tracer didn't start */
> > +	/* enable any config activated by configfs */
> > +	cscfg_config_sysfs_get_active_cfg(&cfg_hash, &preset);
> > +	if (cfg_hash) {
> > +		arg->rc = cscfg_csdev_enable_active_config(csdev,
> > +							   cfg_hash,
> > +							   preset);
> > +		if (arg->rc)
> > +			goto err;
> > +	}
> 
> 
> I try best to not paste any non-sense AI reviews, record one from
> Sashiko [1]:
> 
>  | If a user writes to a sysfs attribute like pe_sel_store(), it acquires
>  | drvdata->spinlock without disabling interrupts. If an IPI is then handled
>  | on the same CPU, etm4_enable_sysfs_smp_call() will call
>  | cscfg_csdev_enable_active_config() which attempts to acquire the exact
>  | same spinlock, hanging the CPU."
> 
> The flow for acquiring drvdata->spinlock in SMP call is:
> 
>   etm4_enable_sysfs_smp_call()
>     `> cscfg_csdev_enable_active_config()
>          `> cscfg_csdev_enable_config()
>               `> cscfg_prog_config()
>                    `> cscfg_set_on_enable()
>                         `> raw_spin_lock_irqsave(feat_csdev->drv_spinlock, flags);
> 
> We might expect the complaint from LOCKDEP with this patch.

Hmm. I miss the this point and there is two solution:

  1. Remove "feat_csdev->drv_spinlock"

    Before this patch, the "feat_csdev->drv_spinlock" is for
    synchronizing with the "drvdata->config". However,
    After this patch, the the configfs only show the "active" config
    and the active config can be used only after taking the "mode".

    Furthermore, the sysfs only uses the "config" not "active config",
    there is no race between the sysfs and the configfs.

    When I check the, "feat_csdev->drv_spinlock" is for the
    active/deactive the configfs config, so I seems safe to remove.

  2. sysfs with _irqsave?

    However, this make a latency for the sysfs.

I think the (1) seems good.

Any comments? @Suzuki and @Leo?

-- 
Sincerely,
Yeoreum Yun

