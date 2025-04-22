Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61C1C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 13:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ZfpVlkTaUhq1CPcCXCbouKoE51GLAilAiE6/rT4mVo=; b=s2V4pxbmsMpA/mcK1n2Rmef9ue
	FjbB4kQlt1BuAGu1DOEZoc39vEhAxqkYVtpJHjMudEumWBoOvgV86j7BnvsfKgs4DiRF49am6ybDA
	ONcVLc/TxqsNToq4P/RNNj4AkLkgdU2vbQpfNLys09XPO6mzkHPk0bVdsf4avqkVcKw2jJhEkkpg9
	M1Zvs3r0kThZ0XqRs9QGv0iKlta/7Nq2eY92BOX6JYyg2I2sfDx1/pchc0Npu1gOuxvspVhNtMUvg
	AYf4u72HTR/wNbOFzXJ7i+kfL1z3XPE6MONrRUuWBlMeXHPOssSKdQEWIYo4k3OLS1ZluLrMxn2J5
	cBiNY27g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Dm0-00000007Jy9-0bZL;
	Tue, 22 Apr 2025 13:34:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Cfk-000000075ic-20aB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 12:24:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91281152B;
	Tue, 22 Apr 2025 05:24:15 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 747503F66E;
	Tue, 22 Apr 2025 05:24:19 -0700 (PDT)
Date: Tue, 22 Apr 2025 13:24:14 +0100
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
Subject: Re: [PATCH v1 5/9] coresight: Avoid enable programming clock
 duplicately
Message-ID: <20250422122414.GE28953@e132581.arm.com>
References: <20250327113803.1452108-1-leo.yan@arm.com>
 <20250327113803.1452108-6-leo.yan@arm.com>
 <5a8aaa17-cc36-4e03-95b3-24c3a16dd987@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a8aaa17-cc36-4e03-95b3-24c3a16dd987@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_052420_608843_1BB0FA5B 
X-CRM114-Status: GOOD (  25.00  )
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

On Thu, Apr 03, 2025 at 12:18:56PM +0530, Anshuman Khandual wrote:
> On 3/27/25 17:07, Leo Yan wrote:
> > The programming clock is enabled by AMBA bus driver before a dynamic
> > probe.  As a result, a CoreSight driver may redundantly enable the same
> > clock.
> > 
> > To avoid this, add a check for device type and skip enabling the
> > programming clock for AMBA devices.  The returned NULL pointer will be
> > tolerated by the drivers.
> > 
> > Fixes: 73d779a03a76 ("coresight: etm4x: Change etm4_platform_driver driver for MMIO devices")
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
> > ---
> >  include/linux/coresight.h | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> > 
> > diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> > index b888f6ed59b2..26eb4a61b992 100644
> > --- a/include/linux/coresight.h
> > +++ b/include/linux/coresight.h
> > @@ -476,15 +476,18 @@ static inline bool is_coresight_device(void __iomem *base)
> >   * Returns:
> >   *
> >   * clk   - Clock is found and enabled
> > + * NULL  - Clock is not needed as it is managed by the AMBA bus driver
> >   * ERROR - Clock is found but failed to enable
> >   */
> >  static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
> >  {
> > -	struct clk *pclk;
> > +	struct clk *pclk = NULL;
> >  
> > -	pclk = devm_clk_get_enabled(dev, "apb_pclk");
> > -	if (IS_ERR(pclk))
> > -		pclk = devm_clk_get_enabled(dev, "apb");
> > +	if (!dev_is_amba(dev)) {
> > +		pclk = devm_clk_get_enabled(dev, "apb_pclk");
> > +		if (IS_ERR(pclk))
> > +			pclk = devm_clk_get_enabled(dev, "apb");
> > +	}
> >  
> >  	return pclk;
> >  }
> 
> coresight_get_enable_apb_pclk() mostly gets called in the platform driver
> probe paths but they are also present in some AMBA probe paths. Hence why
> cannot the callers in AMBA probe paths get fixed instead ?

With this approach, clocking operations are different in static probe
and dynamic probe.  This causes complexity for CoreSight drivers.

After consideration, we decided to use a central place for clock
initialization.  Patch 09 follows the idea to encapsulate pclk and atclk
operations in the coresight_get_enable_clocks() function.

> Besides return
> value never gets checked for NULL, which would have to be changed as well
> if coresight_get_enable_apb_pclk() starts returning NULL values for AMBA
> devices.
> 
> 	drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev);
> 	if (IS_ERR(drvdata->pclk))
> 		return -ENODEV;

I confirmed CoreSight drivers have used this condition, so it is safe
to return NULL pointer from coresight_get_enable_apb_pclk().

Thanks,
Leo

