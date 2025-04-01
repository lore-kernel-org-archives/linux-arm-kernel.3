Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B88E5C36014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 15:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xu0YC1C5CaCQiLSmb9rmmBEZY/UjVbXA2gVJJQa84+M=; b=LmIriVc2TAXmA53usqFw0sNdS+
	hfNWDz8Bo0pKhHnKktsdNkQLw9xnp+uaHqeEcWUi4dq6faHkNti0JDCCqoxCYdHacCMnHNJl5tIYI
	kKdeVHiarpbulZ8YNAcY7fVxLdt89qpG8Pl4ZHRSU0NjOELoIH1Uub/fP7DBOvUaNOx1GwHxALXNx
	n2yBHeDEXJHWRMmsCSW2YXvMTvRCL7lxkr54Ry7i049g0t0UxWIl2yvIYeHjPcpFnk0VnlDnOVOvy
	/5tVU3Fp7H7AU5QQpa9g7vv8GPjkzvhWH/8yqFNMaKVj1zyUFBY7Fa2mCj0A3v1kay4Glw+GsHWG7
	F87HIT/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzdb3-00000003jC0-3Tcc;
	Tue, 01 Apr 2025 15:32:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzdYl-00000003ioU-3tVY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 15:29:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3248714BF;
	Tue,  1 Apr 2025 08:29:54 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7CED03F694;
	Tue,  1 Apr 2025 08:29:50 -0700 (PDT)
Date: Tue, 1 Apr 2025 16:29:45 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Jie Gan <quic_jiegan@quicinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v1 9/9] coresight: Consolidate clock enabling
Message-ID: <20250401152945.GE115840@e132581.arm.com>
References: <20250327113803.1452108-1-leo.yan@arm.com>
 <20250327113803.1452108-10-leo.yan@arm.com>
 <b9046586-c884-484f-a308-9f256d3d99f5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9046586-c884-484f-a308-9f256d3d99f5@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_082952_054120_D1974085 
X-CRM114-Status: GOOD (  29.84  )
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

On Tue, Apr 01, 2025 at 03:58:42PM +0100, James Clark wrote:

[...]

> >   /*
> > - * Attempt to find and enable "APB clock" for the given device
> > + * Attempt to find and enable programming clock (pclk) and trace clock (atclk)
> > + * for the given device.
> >    *
> > - * Returns:
> > + * The AMBA bus driver will cover the pclk, to avoid duplicate operations,
> > + * skip to get and enable the pclk for an AMBA device.
> >    *
> > - * clk   - Clock is found and enabled
> > - * NULL  - Clock is not needed as it is managed by the AMBA bus driver
> > - * ERROR - Clock is found but failed to enable
> > + * atclk is an optional clock, it will be only enabled when it is existed.
> > + * Otherwise, a NULL pointer will be returned to caller.
> > + *
> > + * Returns: '0' on Success; Error code otherwise.
> >    */
> > -static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
> > +static inline int coresight_get_enable_clocks(struct device *dev,
> > +					      struct clk **pclk,
> > +					      struct clk **atclk)
> 
> This function has grown a bit now, probably best to remove it from the
> header and export it instead.

Sure.  I can move this function into coresight-core.c file.

> >   {
> > -	struct clk *pclk = NULL;
> > +	WARN_ON(!pclk);
> >   	if (!dev_is_amba(dev)) {
> > -		pclk = devm_clk_get_enabled(dev, "apb_pclk");
> > -		if (IS_ERR(pclk))
> > -			pclk = devm_clk_get_enabled(dev, "apb");
> > +		*pclk = devm_clk_get_enabled(dev, "apb_pclk");
> > +		if (IS_ERR(*pclk))
> > +			*pclk = devm_clk_get_enabled(dev, "apb");
> > +		if (IS_ERR(*pclk))
> > +			return PTR_ERR(*pclk);
> > +	} else {
> > +		/* Don't enable pclk for an AMBA device */
> > +		*pclk = NULL;
> 
> Now the "apb" clock won't be enabled for amba devices. I'm assuming that's
> fine if the clock was always called "apb_pclk" for them, but the commit that
> added the new clock name didn't specify any special casing either.

> Can we have a comment that says it's deliberate? But the more I think about
> it the more I'm confused why CTCU needed a different clock name to be
> defined, when all the other Coresight devices use "apb_pclk".

Yes, seems to me, "apb" clock is the same thing with "apb_pclk".  As
CTCU DT binding has been merged, for backward compatible, we cannot
remove it now.

CTCU driver only supports static probe, it is never probed by AMBA bus
driver.  I think this is another reason that "apb_pclk" is not used in
CTCU driver.  I can add a comment like:

  "apb_pclk" is the default clock name used by the AMBA bus driver,
  while "apb" is used only by the CTCU driver.  A CoreSight driver
  should use "apb_pclk" as its programming clock name.

Thanks,
Leo

> >   	}
> > -	return pclk;
> > +	if (atclk) {
> > +		*atclk = devm_clk_get_optional_enabled(dev, "atclk");
> > +		if (IS_ERR(*atclk))
> > +			return PTR_ERR(*atclk);
> > +	}
> > +
> > +	return 0;
> >   }
> >   #define CORESIGHT_PIDRn(i)	(0xFE0 + ((i) * 4))
> 

