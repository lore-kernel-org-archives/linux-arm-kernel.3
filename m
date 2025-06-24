Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07A0C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 10:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QGiqnya5CKN7SOV9eloTC3RUuocvh9ixUSHlaVvuZ6Q=; b=3xOMhnXbRXkpdf0TXvZrZrOo3b
	IPHCMwGzYtetahP2A2T7W/E9dFvikI/lU3yfxauv44ZxR97/mO0lkKLbfSdwudYLHaBFe/O+nwQti
	rJxYs7CRMx5Wcw7txgXXCJcVhVNwzHRLg7NGAzVmMdePTEHxbK8Q+scqhvWv13l9dnb9fVfa9lt2M
	Y5aBp9lm5EbO3zNBA4aK2/ipGqVwBECsiaIapaW6G9UvYuFSpbJnoxqrG0KdMrtp1cZFdmvY2XtpT
	VJE13ZW+oR/1mPAfo5uY+9NjSuoir0uR0wb8EyVqUEhIHlv67mBK68H98m9DHwcKhJiLhvVpOoqJM
	8rEjgdxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU0cp-00000005GRh-3wAc;
	Tue, 24 Jun 2025 10:11:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU0aP-00000005GJF-0OCA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 10:09:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AD48106F;
	Tue, 24 Jun 2025 03:08:44 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C08E03F63F;
	Tue, 24 Jun 2025 03:09:01 -0700 (PDT)
Date: Tue, 24 Jun 2025 11:08:59 +0100
From: Leo Yan <leo.yan@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 7/9] coresight: Consolidate clock enabling
Message-ID: <20250624100859.GM794930@e132581.arm.com>
References: <20250609-arm_cs_fix_clock_v3_public-v3-0-423b3f1f241d@arm.com>
 <20250609-arm_cs_fix_clock_v3_public-v3-7-423b3f1f241d@arm.com>
 <bb0a5725-36d0-4809-b17d-6ead7ba8d520@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb0a5725-36d0-4809-b17d-6ead7ba8d520@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_030905_228522_4EDFA269 
X-CRM114-Status: GOOD (  34.28  )
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

On Tue, Jun 24, 2025 at 11:14:17AM +0530, Anshuman Khandual wrote:

[...]

> > CoreSight drivers are refined so that clocks are initialized in one go.
> > As a result, driver data no longer needs to be allocated separately in
> > the static and dynamic probes.  Moved the allocation into a low-level
> > function to avoid code duplication.
> 
> But why should this change be included here in this patch that
> consolidates pclk and atclk clock initialization ? Should this
> be done in a separate patch instead ?

Good point. It indeed we can divide into two smaller patches, one is
for clock consolidations, and another patch is for refining driver data
allocation.

I will do this in next spin.

> > +/*
> > + * Attempt to find and enable programming clock (pclk) and trace clock (atclk)
> > + * for the given device.
> > + *
> > + * The AMBA bus driver will cover the pclk, to avoid duplicate operations,
> > + * skip to get and enable the pclk for an AMBA device.
> > + *
> > + * atclk is an optional clock, it will be only enabled when it is existed.
> > + * Otherwise, a NULL pointer will be returned to caller.
> > + *
> > + * Returns: '0' on Success; Error code otherwise.
> > + */
> > +int coresight_get_enable_clocks(struct device *dev, struct clk **pclk,
> > +				struct clk **atclk)
> Moving this helper function here does make sense.
> 
> > +{
> > +	WARN_ON(!pclk);
> 
> That is because pclk will be populated in all possible scenarios
> including the one assigned as NULL - hence it needs to have been
> allocated.
>  > +
> > +	if (dev_is_amba(dev)) {
> > +		/* Don't enable pclk for an AMBA device */
> > +		*pclk = NULL;
> > +	} else {
> > +		/*
> > +		 * "apb_pclk" is the default clock name for an Arm Primecell
> > +		 * peripheral, while "apb" is used only by the CTCU driver.
> > +		 *
> > +		 * For easier maintenance, CoreSight drivers should use
> > +		 * "apb_pclk" as the programming clock name.
> > +		 */
> > +		*pclk = devm_clk_get_enabled(dev, "apb_pclk");
> > +		if (IS_ERR(*pclk))
> > +			*pclk = devm_clk_get_enabled(dev, "apb");
> > +		if (IS_ERR(*pclk))
> > +			return PTR_ERR(*pclk);
> > +	}
> > +
> > +	if (atclk) {
> 
> But an allocated atclk indicates need for atclk clock init instead.

To be clear, we strictly follow up DT binding doc, atclk clock is
always optional. For a atclk pointer:

- If atclk is NULL: the driver does not require atclk at all.
- If atclk is not NULL: the driver requires atclk optional.

> Probably a 'which all clocks' flag based approach might been better ?
> But I guess this proposal will create less code churn.

So far, CoreSight driver has a fixed requirement for clocks.

- APB clock (pclk): it is mandatory. It can be either controlled by
  AMBA bus driver or CoreSight driver.

- atclk: It is not required (CTCU) or it is optional.

Given the pattern is fixed, I don't think an extra flag would be helpful
at here. But I understand the code is not very strightforward, I will
add comments for easier understanding.

> > +		*atclk = devm_clk_get_optional_enabled(dev, "atclk");
> > +		if (IS_ERR(*atclk))
> > +			return PTR_ERR(*atclk);
> > +	}
> 
> atclk when requested - either will have a valid clock or an error
> pointer but never a NULL pointer unlike the pclk clock ?

As mentioned, atclk can be a NULL pointer - it is optional and may be
absent in the device tree binding. This is why we use the optional
variant of the clock API to initialize it. If it returns a NULL
pointer, it is tolerated by IS_ERR(*atclk), and this is considered a
successful case.

Thanks,
Leo

