Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190EFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 17:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9uBedfQnt54K3ZMGv2Ss49+XG5FadQKRRqu0gaUuWt0=; b=tyRoXm/bxeqKsI23sX/lfa0UAJ
	vSHC+KtsTSl1pIerjBqBWIESx1Rr+uwg3fFOvpgUIR0/Jykh0eT1EifmUL9tJVY3pVi7ciult69cf
	hhhurNCVuqTZxMTkHHjGq5dzqP4kITuzO9G0PdBcb28CxEJUyIvBL1XImDij5IY7oC7uBwLShuD2l
	kWpD0to+QHcVMoZJ0UZpTD+Z2j0F6LKxlq9J4W1CUl4t3VtXceiZFbTh7bby37dl7rfwloBJOvcmg
	Z7wQ7JImV0sb9WOKSlGjo7bWFq98yKVPeIlEzvhIUgm4fUYvulvJzICs0xfBrxN9QAjhXFuaSelSN
	ACgDkmVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnIL-0000000DDwH-3gUi;
	Mon, 06 Jul 2026 17:39:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnIG-0000000DDtr-0X6a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 17:39:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F31EF1713;
	Mon,  6 Jul 2026 10:39:38 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CFC553F7B4;
	Mon,  6 Jul 2026 10:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783359583; bh=MBHDaVGsVT42vMuQT2poxN3PmStbNC+U0bdHG1zQRAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZvT1HN0o81jEnYn9V3MXwMiZuVTPkj6Fc2819z233/FpG6TlTrtnUI8qs+bKW6NyU
	 kg3Q/rygvNqYmzOVsr9WS4p75wH9B7TovzQ3wq2DtFZptYkR6ROVqjZs5NyDo1ZRzW
	 skwyPFHTzs2KmaMzIoD4QAobC4lIdRmssfiThccg=
Date: Mon, 6 Jul 2026 18:39:40 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v8 08/13] coresight: etm4x: fix inconsistencies with
 sysfs configuration
Message-ID: <20260706173940.GB1024232@e132581.arm.com>
References: <20260629090007.1718746-1-yeoreum.yun@arm.com>
 <20260629090007.1718746-9-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629090007.1718746-9-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_103944_291613_EA0D59D0 
X-CRM114-Status: GOOD (  13.51  )
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

> @@ -922,25 +950,7 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
>  {
>  	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>  	struct etm4_enable_arg arg = { };
> -	unsigned long cfg_hash;
> -	int ret, preset;
> -
> -	/* enable any config activated by configfs */
> -	cscfg_config_sysfs_get_active_cfg(&cfg_hash, &preset);
> -	if (cfg_hash) {
> -		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
> -		if (ret) {
> -			etm4_release_trace_id(drvdata);
> -			return ret;
> -		}
> -	}
> -
> -	raw_spin_lock(&drvdata->spinlock);
> -
> -	drvdata->trcid = path->trace_id;
> -
> -	/* Tracer will never be paused in sysfs mode */
> -	drvdata->paused = false;
> +	int ret;
>  
>  	/*
>  	 * Executing etm4_enable_hw on the cpu whose ETM is being enabled
> @@ -948,20 +958,20 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
>  	 */
>  	arg.drvdata = drvdata;
>  	arg.path = path;
> +
> +	raw_spin_lock(&drvdata->spinlock);
> +	arg.config = drvdata->config;
> +	raw_spin_unlock(&drvdata->spinlock);
> +
>  	ret = smp_call_function_single(drvdata->cpu,
>  				       etm4_enable_sysfs_smp_call, &arg, 1);
>  	if (!ret)
>  		ret = arg.rc;
>  	if (!ret)
> -		drvdata->sticky_enable = true;
> -
> -	if (ret)
> +		dev_dbg(&csdev->dev, "ETM tracing enabled\n");
> +	else
>  		etm4_release_trace_id(drvdata);
>  
> -	raw_spin_unlock(&drvdata->spinlock);
> -
> -	if (!ret)
> -		dev_dbg(&csdev->dev, "ETM tracing enabled\n");
>  	return ret;
>  }

This is most valuable change for me, as now we will have much clear
scope for what is protected ("drvdata->config").

However, a corner case was mentioned by Sashiko:

 | It appears etm4_enable_hw() modifies drvdata->ss_status while executing
 | via IPI, but sshot_ctrl_store() can modify the same array concurrently
 | from process context since the lock is no longer held across the
 | smp_call_function_single() call.

"drvdata->ss_status" is a race condition between SMP call and sysfs
knobs. Should we change to spinlock_irqsave/irqrestore when access
drvdata->ss_status?

Thanks,
Leo

