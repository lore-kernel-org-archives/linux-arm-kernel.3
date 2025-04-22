Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2330AC369D7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 09:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oP81h3mEU1jXqKUo5wieFFmn3nbU0ue96FcUwghU3P8=; b=dp0CNxHBv/wN5CRbIMUTiDyFSy
	CZwFgcMp8h4KtmZ9jc4CSPTl+9us4ZocCyZu03gDE6+96CmlOv+a+VAQ2uoQ+6r9p8DffIuzT0Tur
	EGHzC5zN7QW4kV2ZNp2cYFWnwVzB7T5Ls3+E7bg5fLfSqSt0RIY9ln8S5J+mXwVKtc+gosbm7jv/i
	lCCqa/zwSP6stD/LcHauYc+Wg+N+dC8CCHqXF65bos8EfEauePZjiWKOs9a4wGVN9o018CkB5zQGL
	dPCoyuskX0by7Mn58/9RI2emc34RtoNqRNBKGoD9GH01gtICkgaQ/HghBN+mBZgB+s7eeU8+CwpY5
	GWexjQhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u79VO-00000006TAF-3CXe;
	Tue, 22 Apr 2025 09:01:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u78sW-00000006HM2-0qwM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 08:21:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94764152B;
	Tue, 22 Apr 2025 01:21:09 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6740C3F66E;
	Tue, 22 Apr 2025 01:21:13 -0700 (PDT)
Date: Tue, 22 Apr 2025 09:21:08 +0100
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
Subject: Re: [PATCH v1 1/9] coresight: tmc: Support atclk
Message-ID: <20250422082108.GB28953@e132581.arm.com>
References: <20250327113803.1452108-1-leo.yan@arm.com>
 <20250327113803.1452108-2-leo.yan@arm.com>
 <b409c701-f126-4e07-ba14-75280529689b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b409c701-f126-4e07-ba14-75280529689b@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_012116_283632_4A54626E 
X-CRM114-Status: GOOD (  18.78  )
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

On Thu, Apr 03, 2025 at 11:20:38AM +0530, Anshuman Khandual wrote:
> On 3/27/25 17:07, Leo Yan wrote:
> > The atclk is an optional clock for the CoreSight TMC, but the driver
> > misses to initialize it.  In most cases, the TMC shares the same atclk
> 
> TMC shares the atclk or pclk clock with other coresight components ?

I will refine the commit log for this.

[...]

> > --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> > @@ -789,6 +789,10 @@ static int __tmc_probe(struct device *dev, struct resource *res)
> >  	struct coresight_desc desc = { 0 };
> >  	struct coresight_dev_list *dev_list = NULL;
> >  
> > +	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
> > +	if (IS_ERR(drvdata->atclk))
> > +		return PTR_ERR(drvdata->atclk);
> > +
> 
> Adding this check here in __tmc_probe() ensures that it gets called
> both during AMBA and platform probe methods.

Yes.

> >  /**
> >   * struct tmc_drvdata - specifics associated to an TMC component
> > + * @atclk:	optional clock for the core parts of the TMC.
> >   * @pclk:	APB clock if present, otherwise NULL
> >   * @base:	memory mapped base address for this component.
> >   * @csdev:	component vitals needed by the framework.
> > @@ -244,6 +245,7 @@ struct tmc_resrv_buf {
> >   *		 Used by ETR/ETF.
> >   */
> >  struct tmc_drvdata {
> > +	struct clk		*atclk;
> >  	struct clk		*pclk;
> >  	void __iomem		*base;
> >  	struct coresight_device	*csdev;
> 
> Otherwise, LGTM.
> 
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

Thanks for reviewing!

Leo

