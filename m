Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3630C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 11:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=krXA+RxSqsM6Bl4oRfMsy0nYEzJhA3uHWVrgVKdSwX4=; b=cfkisjYOInk1XJDQ7spAraEj79
	/SY69jCkvmHa1dTBKPSqiQ/ZmfgmxLdri5Z2qqBWxZ4q57+zA1ixHw+iGzR6YEQjwx+fhGPSCmOb+
	Q7f5KmV9p+PoPJx/aHKWrLmVAyuowksIvmVqPzcGRVYN+gyblap8BDnOPKPEP/BrOG/RNcSFg2gyD
	oiv59msDi9VkyMsuIwGhOwnIGiYLsPSaVCMg6ZPAjonwjSLEtSp2tctocwR0ioqM1fWAlaYltDa8y
	gCSuuozGfoLrspo2jJorPUs/stNjkolDMC+MxaFVzK/KQi1LGSjJB0xcmRR0J92YyScYCa7BI2xdA
	NpSJ/0uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGbo-0000000Blcz-0CGa;
	Tue, 06 May 2025 11:37:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCF0T-0000000BTKc-2JgF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 09:54:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C1E6113E;
	Tue,  6 May 2025 02:54:23 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B10C63F5A1;
	Tue,  6 May 2025 02:54:32 -0700 (PDT)
Date: Tue, 6 May 2025 10:54:28 +0100
From: Leo Yan <leo.yan@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 4/9] coresight: Disable programming clock properly
Message-ID: <20250506095428.GB177796@e132581.arm.com>
References: <20250423151726.372561-1-leo.yan@arm.com>
 <20250423151726.372561-5-leo.yan@arm.com>
 <f56a73a4-ae63-4a46-a493-322c4806b3a2@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f56a73a4-ae63-4a46-a493-322c4806b3a2@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_025433_674797_1CDAB4DB 
X-CRM114-Status: GOOD (  18.90  )
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

On Fri, May 02, 2025 at 11:40:31AM +0530, Anshuman Khandual wrote:
> Even though this might seem to be being bike shedding, the subject
> line above could be re-organized something like the following for
> better clarity.
> 
>  coresight: Properly/Appropriately disable programming clocks

Sure.  I will change the subject to this.

[...]

> > @@ -725,8 +723,6 @@ static void debug_platform_remove(struct platform_device *pdev)
> >  
> >  	__debug_remove(&pdev->dev);
> >  	pm_runtime_disable(&pdev->dev);
> > -	if (!IS_ERR_OR_NULL(drvdata->pclk))
> > -		clk_put(drvdata->pclk);
> >  }
> Should not these IS_ERR_OR_NULL() here be changed to IS_ERR() ?

For the case above, after changed to devm_clk_get_enabled() for the
enabling programming clocks, we don't need any special handling and
leave the clock disabling and releasing to the device model layer.

> Because now there could not be a NULL return value.
>
> drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev)
> 
> #ifdef CONFIG_PM
> static int debug_runtime_suspend(struct device *dev)
> {
>         struct debug_drvdata *drvdata = dev_get_drvdata(dev);
> 
>         if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>                 clk_disable_unprepare(drvdata->pclk);
>         return 0;
> }
> 
> static int debug_runtime_resume(struct device *dev)
> {
>         struct debug_drvdata *drvdata = dev_get_drvdata(dev);
> 
>         if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>                 clk_prepare_enable(drvdata->pclk);
>         return 0;
> }
> #endif

> There might more instances like these as well.
> 	
> git grep IS_ERR_OR_NULL drivers/hwtracing/coresight/ | grep "drvdata->pclk"
> drivers/hwtracing/coresight/coresight-cpu-debug.c:      if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> drivers/hwtracing/coresight/coresight-cpu-debug.c:      if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> drivers/hwtracing/coresight/coresight-funnel.c: if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> drivers/hwtracing/coresight/coresight-funnel.c: if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> drivers/hwtracing/coresight/coresight-replicator.c:     if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> drivers/hwtracing/coresight/coresight-replicator.c:     if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> drivers/hwtracing/coresight/coresight-stm.c:    if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> drivers/hwtracing/coresight/coresight-stm.c:    if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> drivers/hwtracing/coresight/coresight-tpiu.c:   if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> drivers/hwtracing/coresight/coresight-tpiu.c:   if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))

I would like the current patch to focus on the issue of disabling /
releasing the programming clocks.

Though the IS_ERR_OR_NULL() check is redundant, it does not cause
issue or regression.  The refactoring is left in patch 09 for removing
IS_ERR_OR_NULL() checks.

Does this make sense?

Thanks
Leo

