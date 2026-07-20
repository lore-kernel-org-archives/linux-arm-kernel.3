Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B859C44529
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 19:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Z6+HPtmV/BfQXloC80fg6xlK0MoEmIkz7XapzOzHOk=; b=bsxKzbXh2VGh2UYfzJleTq0Xp5
	ySfkx2KMocLQpnhe+SOKYgmmlUB/88JHW0UhatQE7ad6WWJpYUHeE14MmOMIpOA29vVNpMA0LXDJb
	I+v8t2f0Gbzn/oW28fN9/OLqrm1IffAdV9e7wvigXGaFNTCQHL4ZiJpGylKnJsCElKgWSDKQcWJBb
	L6clraOAu9OdTdmDz8cZwZg/2YjrTXl3kFenSLTZjgtfusr6SlBCz4zTsvrNtYuYMX8Tbd9AsgVaN
	pknGDFrKEWEptOx7wZEIQ3OfJBi5Tsnr5b0PicSqEc5YJuOzLBDDC4Mdg+nIQ998fFHpRrYLfkfxb
	0T2Uw7HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlu5Q-00000007oCH-03O8;
	Mon, 20 Jul 2026 19:55:36 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlu5L-00000007oBf-2FHz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 19:55:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784577332; x=1816113332;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y2jNi5/edQtJsWbYoQEOskTGNBe48nPyiAMLKqrHdqQ=;
  b=DH42jXhp/8rX3hsSLfvHgPf74vHn8mRq22sP0RpiKG0Oo08I9IkqSyQv
   9AJdCOlRfxuv9rQhu3SP+y1Eibtgpy2DquWBzRGH6XxInO3W7qUWwnqFm
   u9ZFCsmRJSxDGmo6ivZA94jg+rvXpd27RHGpfHW6k0MIrA4DrFzU6l8dX
   g5QBPmkrarR7zO6ixLPp5ooS5yDrVCXxzEcq9udhMQiMT9CeZf5jb+iBB
   2hYvgDEkSCqiuBqCWDhvEgJ0uKLLg6mbNf9C1UkOvCXpBji2M+Scd14Ql
   QL1P8F8yVknoAF2Pnwgh8Yhvj7uWG5iXXdQg/wwIAElVGPBaIf92T19Gy
   Q==;
X-CSE-ConnectionGUID: 5cCUiMBiT6iHKR6mCrsWGw==
X-CSE-MsgGUID: NHfVPMWxQS2PIxIwfHig2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="89062551"
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; 
   d="scan'208";a="89062551"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 12:55:31 -0700
X-CSE-ConnectionGUID: bW4DzkLbQP2DiVio1b4+2g==
X-CSE-MsgGUID: tLBOvaQAT2Ob2/o6gq5SnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; 
   d="scan'208";a="262498510"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.175])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 12:55:28 -0700
Date: Mon, 20 Jul 2026 22:55:26 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Shih-Yuan Lee <fourdollars@debian.org>
Cc: Mark Brown <broonie@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v16 4/7] spi: pxa2xx: lock out runtime autosuspend for
 Intel LPSS SPI in PIO mode
Message-ID: <al59LnVJQhiZq9yR@ashevche-desk.local>
References: <20260720162117.32304-1-fourdollars@debian.org>
 <20260720162117.32304-5-fourdollars@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720162117.32304-5-fourdollars@debian.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_125531_614182_CE0DB6A6 
X-CRM114-Status: GOOD (  14.79  )
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

On Tue, Jul 21, 2026 at 12:21:13AM +0800, Shih-Yuan Lee wrote:
> When operating in PIO mode on Intel LPSS SPI controllers, runtime PM
> autosuspend clock-gates the hardware block when idle. On subsequent
> transfers, MMIO accesses to trigger resume are performed before the runtime
> PM state machine can wake the controller, causing PCIe Completion Timeouts.
> This issue does not affect DMA mode, where the DMA engine holds the required
> resources, nor does it affect non-LPSS controllers.
> 
> Lock out runtime PM autosuspend for LPSS SPI controllers specifically
> when operating in PIO mode.
> 
> Acquire a runtime PM reference via pm_runtime_get_noresume() in
> pxa2xx_spi_probe() after registration, and release it via
> pm_runtime_put_noidle() in pxa2xx_spi_remove() before hardware teardown to
> ensure the runtime PM reference held in probe is released without invoking
> runtime_suspend on already-unclocked hardware.

.runtime_suspend()

// this is how we refer to the callbacks.


...

> +	/* Release the PM reference held in probe for LPSS PIO mode before
> +	 * hardware teardown so the PM core does not invoke runtime_suspend
> +	 * on already-unclocked hardware.
> +	 */

/*
 * Keep the comment style as per SPI and many other subsystems
 * and as in this example.
 */

-- 
With Best Regards,
Andy Shevchenko



