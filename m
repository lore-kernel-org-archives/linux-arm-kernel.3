Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F22C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 16:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vrALdPoLpJLxw/uGBfJ0v3RJvIxBGmQxgCinSpZhuVg=; b=gl2yhby1epIj8HY+E8seq46Q0m
	29tSYpZ7ioS42WYU6eBuPGqpeMlV78xoZ8TTAkPZgugl1yOom/txbF8jDZXf+EuglvwW5m3Q2Getu
	cq7GU4D3+XxlkAhyr55Xr5+QP7GaY0YuP81lCFhLey8bbfUswFqmhzwMMY5/v+EGEQT0vxHUwTON/
	eNIwGQTOhLFEBwmUZ9ggBzq3sDWh5UKhpSLspEFJZGInGv6Z/DwJlPiyYNnP62s0+3Rs5+l79tUav
	TZNnmUA3b6KouErcuR4NOjI4SbaypYCGMV60/zPiPtKRfDnfdOyHMZ2hzquS2vqWMPR3DpStQaVDI
	J+SbTI7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtaz-00000000Boq-0diT;
	Mon, 21 Jul 2025 16:42:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udr3h-0000000HRxS-2PaN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 14:00:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D99DC153B;
	Mon, 21 Jul 2025 06:59:54 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CA5A3F66E;
	Mon, 21 Jul 2025 07:00:00 -0700 (PDT)
Date: Mon, 21 Jul 2025 14:59:58 +0100
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 04/10] coresight: Appropriately disable programming
 clocks
Message-ID: <20250721135958.GE3137075@e132581.arm.com>
References: <20250627-arm_cs_fix_clock_v4-v4-0-0ce0009c38f8@arm.com>
 <20250627-arm_cs_fix_clock_v4-v4-4-0ce0009c38f8@arm.com>
 <5a5f1355-563d-498a-9dec-3479a257b3e6@arm.com>
 <20250721104834.GC3137075@e132581.arm.com>
 <607c03a2-267c-46e6-a7fa-e733c1970e60@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <607c03a2-267c-46e6-a7fa-e733c1970e60@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_070001_663012_DC2C4E1A 
X-CRM114-Status: GOOD (  19.07  )
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

On Mon, Jul 21, 2025 at 12:40:38PM +0100, Suzuki Kuruppassery Poulose wrote:
> On 21/07/2025 11:48, Leo Yan wrote:
> > On Mon, Jul 21, 2025 at 10:15:22AM +0100, Suzuki Kuruppassery Poulose wrote:
> > 
> > [...]
> > 
> > > > diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> > > > index 4ac65c68bbf44b98db22c3dad2d83a224ce5278e..dd2b4cc7a2b70cf060a3207548fe80e3824c489f 100644
> > > > --- a/include/linux/coresight.h
> > > > +++ b/include/linux/coresight.h
> > > > @@ -480,26 +480,16 @@ static inline bool is_coresight_device(void __iomem *base)
> > > >     * Returns:
> > > >     *
> > > >     * clk   - Clock is found and enabled
> > > > - * NULL  - clock is not found
> > > 
> > > This is still valid, right ?
> > 
> > No. Since this patch uses devm_clk_get_enabled() to get a clock, if the
> > pclk is not found, it returns -ENOENT (see of_parse_clkspec()).
> > 
> > Only the optional clock APIs (e.g., devm_clk_get_optional_enabled())
> > return a NULL pointer instead of -ENOENT when the clock is not found.
> 
> This will break ACPI based systems, as we may not have a "pclk" described
> for them. We should be able to tolerate "no pclk"

Get it. How about change the code like below?

  static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
  {
      struct clk *pclk;

      pclk = devm_clk_get_enabled(dev, "apb_pclk");
      if (IS_ERR(pclk))
          pclk = devm_clk_get_enabled(dev, "apb");

      /* Tolerate no pclk for ACPI device */
      if ((pclk == ERR_PTR(-ENOENT)) && has_acpi_companion(dev))
          return NULL;

      return pclk;
  }

