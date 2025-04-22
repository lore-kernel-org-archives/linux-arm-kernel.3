Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353E8C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 10:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ECL1+W8v0VLBBAA33g64NcRBD+uYkQvhvdRsDdok2Fk=; b=eX6yJ6nuOadL+ixg3+f+3teSfL
	T/erzkr7lBAwqwpzAri+pYSCDRs99tJc2UNQ/r0VcPZXNuLxisjQgKTBocJTDk9BPvbyleSbwkXNp
	cBlA1dnSyMNq6HrCwd5qska3R04dq14rPtFlHliDghieOZ/Y+JxoBMNlzpXKqVojDtBlMaPm4fRuo
	EZzTQhDoWA6hua1sG/xI0LqJN96yGwXtm4bsX2NtF2Y+g1uWwWUWS5t57dtolpWT7AwrZcXC+cw0B
	eCQ1yIpXojaWjXci/uxD9hl18qRskGe1c+KeQ2BfL0mngE1/4G4PFxlxnbIhI65AHJyVSe+9yoIYi
	RMIjPohQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BAi-00000006pVE-3V83;
	Tue, 22 Apr 2025 10:48:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u79oY-00000006XNX-0VsM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 09:21:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E99BC152B;
	Tue, 22 Apr 2025 02:21:08 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C22443F5A1;
	Tue, 22 Apr 2025 02:21:12 -0700 (PDT)
Date: Tue, 22 Apr 2025 10:21:07 +0100
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
Subject: Re: [PATCH v1 7/9] coresight: Make clock sequence consistent
Message-ID: <20250422092107.GC28953@e132581.arm.com>
References: <20250327113803.1452108-1-leo.yan@arm.com>
 <20250327113803.1452108-8-leo.yan@arm.com>
 <d94c6f97-4ca8-4a3a-ae8a-8e872eaa8d3b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d94c6f97-4ca8-4a3a-ae8a-8e872eaa8d3b@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_022114_209030_4064BEF9 
X-CRM114-Status: GOOD (  21.64  )
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

On Thu, Apr 03, 2025 at 12:40:39PM +0530, Anshuman Khandual wrote:
> On 3/27/25 17:08, Leo Yan wrote:
> > Since atclk is enabled after pclk during the probe phase, this commit
> > maintains the same sequence for the runtime resume flow.
> > 
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
> > ---
> >  drivers/hwtracing/coresight/coresight-funnel.c     | 6 +++---
> >  drivers/hwtracing/coresight/coresight-replicator.c | 6 +++---
> >  drivers/hwtracing/coresight/coresight-stm.c        | 6 +++---
> >  drivers/hwtracing/coresight/coresight-tpiu.c       | 6 +++---
> >  4 files changed, 12 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
> > index ec6d3e656548..e378c2fffca9 100644
> > --- a/drivers/hwtracing/coresight/coresight-funnel.c
> > +++ b/drivers/hwtracing/coresight/coresight-funnel.c
> > @@ -299,11 +299,11 @@ static int funnel_runtime_resume(struct device *dev)
> >  {
> >  	struct funnel_drvdata *drvdata = dev_get_drvdata(dev);
> >  
> > -	if (drvdata && !IS_ERR(drvdata->atclk))
> > -		clk_prepare_enable(drvdata->atclk);
> > -
> >  	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> >  		clk_prepare_enable(drvdata->pclk);
> > +
> > +	if (drvdata && !IS_ERR(drvdata->atclk))
> > +		clk_prepare_enable(drvdata->atclk);
> >  	return 0;
> >  }
> 
> funnel_probe() enables pclk after atclk though - which needs to be
> reversed as well ?

Good point!

The key point is a dynamic probe enables pclk clock in AMBA bus driver,
which is anyway prior to enable atclk.

We need to keep consistent flow for all flows (static probe, dynamic
probe, runtime PM resume).  The patch 09 consolidates clock enabling for
static and dynamic probe, and this patch is for runtime PM.

For a better organization, I will place this patch after the patch 09
in the next spin.

[...]

> I assume this patch is trying to have the same clock sequence enablement
> during original probe and resume path and then just the reverse sequence
> during suspend path.

Correct.  As said, the patch 09 is for clock enabling sequence in
probe, and this patch is for the resume path.

Thanks,
Leo

