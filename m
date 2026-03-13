Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F7C105F787
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 10:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=swohX3WwzkGFerzDSyUCwpC9K0sjW9sQSN9/bItQrsU=; b=zIr+uM1u+jhOYJVan/lpI6vsLd
	pmh9qucCRTu02PnBIPC0EhBpQL3hJaDUfYTKfLlhw3ip+ThswzpWtv28WHGqRT7+FMeSjZ3C6CAdD
	RWjh1rACdCAgtwkAElpJaA7mq7mL6ygeje1qnT4rcqm/yA7RthtI3o6oE0sLMbaKecqQDEsaZwoUH
	CmTGfgCnfuguGjWSeIizZx27vTI/xoybUq458nD9k9vCdZBZKKDUItmpH7KzPWYJIwVM/lpuobBHz
	uFG9jyb3cgwClKdOTk4BlLPp+DDwsVP3gFhVjs9nSnxpg/96A1+RDHbhkgBj7cXlL4qDfnEbrrppF
	CqVfN5MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zRr-0000000HTxn-1PSz;
	Fri, 13 Mar 2026 10:08:51 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zRk-0000000HTrj-3HUS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 10:08:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773396525; x=1804932525;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b2hRF1Ae+cNYOQ+zp+3vzd0GVOF9OpTvByNvMFv9yNo=;
  b=XH29b+rvfYqKLwmECkGna1N/22GgN8GfdQCm8Q7Hxd+yPB9ISR19Ve9l
   Hy5mBZ4Ynzh5Nwxo6RBLJKjcXvC3H8gm3QmHl6ib6mD5mumfkI8nhP5SE
   Ucx4vctfNGEdNGqgEibO91Vh6iIOBBMqyoBwWq1c96c0E3i6opOCQGihm
   Jm5Tf/HfaNKQ+ljepZcxS1pF1XCg5j3FxQKS06ZNEpwWB2IXXwm0TndoK
   x7pCASHp1SZ7bv/IoiVMWu5bR+aHeOvM2dalW6kBLiBvkqAWym0jlupii
   i/Wvg1bAwXvSGISOilmvt4yGcdJp1zmEaBxxpfneUUpkcrnRNSDtDAeYA
   w==;
X-CSE-ConnectionGUID: 1oOoRD7ERiiz5Lcmh6W8wg==
X-CSE-MsgGUID: wpa2UHJCQQGfyEBn5T/DrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="85202704"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="85202704"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 03:08:42 -0700
X-CSE-ConnectionGUID: 8yQHrP2UTTKqM/tDC1MDPg==
X-CSE-MsgGUID: 8udDjgPLSba2N4bP7KJYrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="226077796"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.246])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 03:08:40 -0700
Date: Fri, 13 Mar 2026 12:08:36 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	morris_mao@aspeedtech.com
Subject: Re: [PATCH] iio: adc: aspeed: Reserve battery sensing channel for
 on-demand use
Message-ID: <abPiJEOL40C5eR1k@ashevche-desk.local>
References: <20260313-adc-v1-1-7a2edb4e5664@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-adc-v1-1-7a2edb4e5664@aspeedtech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_030844_841312_B5F09B05 
X-CRM114-Status: GOOD (  12.23  )
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

On Fri, Mar 13, 2026 at 06:02:16PM +0800, Billy Tsai wrote:
> For controllers with battery sensing capability (AST2600/AST2700), the last
> channel uses a different circuit design optimized for battery voltage
> measurement. This channel should not be enabled by default along with other
> channels to avoid potential interference and power efficiency issues.
> 
> Changes made:
> - Introduce aspeed_adc_get_active_channels() to return the number of
>   channels that should be enabled by default
> - For battery sensing capable controllers, exclude the last channel
>   from the default channel enable mask
> - Enable the battery sensing channel only when explicitly accessed
>   via read_raw()
> - Replace hardcoded channel numbers with ASPEED_ADC_BATTERY_CHANNEL macro
> - Add helper functions for cleaner channel management

Why not series of patches each for the change made?

> This ensures optimal power efficiency for normal ADC operations while
> maintaining full functionality when battery sensing is needed.

-- 
With Best Regards,
Andy Shevchenko



