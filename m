Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4476C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 11:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lCH295eQ4VRWS4BTz65OVBogCl8PMVGFXLQsMV6DUAs=; b=L+rV29q8zs1A3RMckj1aO7VXEi
	W84ZNVLKfnEVPn2Iw6SbPQf8gPPtblztTd/IHgJsgahAl3E+4GmjvP8wgZ2vUPE3pR3/ZymD+5uJ+
	ngcEQfayho48VEGt/MghIpbDFEFfk0/5LLG8mseBAhHZFZGk7Qj81K4ykY4hQyR5cpmDGZF3ze7ca
	O3COqtVk/LlSP4S9f0eP47kbax0RyFHzxtmtE5kLXJnYrN8Q2AVrGXpF7WGK+4EGYxls7TBQggs4h
	OL+AbkUKzPdkz6nunZtGzOzY6MSCoBloyBk47bKzcHg3ekFswhbPJMkkrcKRNFZeuw2bmnhxnXNwo
	umMOjC2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGwm-0000000BpGi-2nsj;
	Tue, 06 May 2025 11:58:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCERu-0000000BKe5-0M7i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 09:18:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 004D9113E;
	Tue,  6 May 2025 02:18:38 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 427983F5A1;
	Tue,  6 May 2025 02:18:47 -0700 (PDT)
Date: Tue, 6 May 2025 10:18:41 +0100
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
Subject: Re: [PATCH v2 6/9] coresight: Avoid enable programming clock
 duplicately
Message-ID: <20250506091841.GA177796@e132581.arm.com>
References: <20250423151726.372561-1-leo.yan@arm.com>
 <20250423151726.372561-7-leo.yan@arm.com>
 <063577a4-1530-4658-9838-934b0606e8e0@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <063577a4-1530-4658-9838-934b0606e8e0@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_021850_209281_8C373475 
X-CRM114-Status: GOOD (  25.82  )
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

Hi Anshuman,

On Fri, May 02, 2025 at 12:08:55PM +0530, Anshuman Khandual wrote:
> On 4/23/25 20:47, Leo Yan wrote:
> > The programming clock is enabled by AMBA bus driver before a dynamic
> > probe.  As a result, a CoreSight driver may redundantly enable the same
> > clock.
> 
> Are you sure AMBA bus driver always enables such clocks in all scenarios ?

Yes.  I confirmed that AMBA bus driver enables the programming clock
prior to calling CoreSight device's probes (see amba_probe()).

I checked other AMBA device drivers (e.g., drivers/dma/amba-pl08x.c)
never touch APB programming clock and the clock by default is covered
by AMAB bus driver.

> Even if that is true - why cannot coresight_get_enable_apb_pclk() ensured
> to be called only for the platform drivers cases via code re-organization,
> rather than changing the coresight_get_enable_apb_pclk() helper itself.

The purpose is to unify the clock enabling for both static probe and
dynamic (AMBA) probe.

Let us take funnel driver as an example.  With the change in this patch,
the clock operations will be consolidated in a central place
(e.g., funnel_probe()).  Therefore, we can avoid to spread the drvdata
allocation and clock operations into dynamic probe and static (platform)
probe separately.

  funnel_probe()
  {
      drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);

      drvdata->pclk = coresight_get_enable_apb_pclk();
  }

  dynamic_funnel_probe()
  {
      funnel_probe();
  }

  funnel_platform_probe()
  {
      funnel_probe();
  }

Thanks,
Leo

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

