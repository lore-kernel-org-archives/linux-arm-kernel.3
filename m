Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A586C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 20:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fIw3uqbvbb2nJSbtZzvBr/6+qyGOgla1B5KGTG3CXQs=; b=HZr4ku9qQlhIH07TIySMTw4ybM
	+h1+2w23YhQrEjfnuP7WZ3YLW50qsUwu3OmBNiH9xs9oxhj8FDNmBUqTUDYQScebzWAe/5Ye8EBGg
	slOKr5fFKTg2FpomVQ4LGbghDGDV4iR7SrulU4fxsanKnEpbSLiXS2rQlpGQpc7+QPk5/RVAeGhLV
	rs5FHF61Pb4BIsbWlvjg2JLUZBC+BItVAdp/Xsk5oxmmD76FGj9QhX57evKHHRLd82TsYFLzNql8t
	Y/TA9P9MPeSvcdD8cL2y5Ql/CaSVXfAXprkonOCgBPnEajqwg+DcAn4wOeSGKdJumoKnrxn+5iOna
	RkHc7XKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9qRV-0000000CAer-0y4F;
	Thu, 24 Sep 2026 20:53:21 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9qRS-0000000CAeO-47Ra
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 20:53:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790283199; x=1821819199;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q7f2yxHXOO+EhXNPemNFyuYM9CjLPx5BB5xiwbdY6OM=;
  b=N2v3iC/kPWGOYGnxk5wErxEO94V0MKFTq5e18I8RrnUo0X5zy+LWxWxw
   NcDeZ0F3I1lH0Fb32/jSVXOV7SpgJgcq1/lhqazmR7AAtXttchtrFXfE4
   73fIFk5qHB88TnUQy2nP1WKpklFPvWMNoHRISycWspRHyh2eyl4/TwlLf
   6uYbTKKP4ipany/LGa3WB2HzpTFpehvzG83k9eGknXajUcK0IpZ0iyV3L
   V62FXztG+iUP0ahKuUQrybYCsRpJ7nqeIswcCHUhVvZ1/3377MxNpPFu7
   2J8mDVDCsTXvS0eDi98Rt+0tsaiJqMJJfwRT/Xh/LXjSsxUWh8HWuAqwK
   A==;
X-CSE-ConnectionGUID: UGoeHi8uSsifyPfINpv4IA==
X-CSE-MsgGUID: OL4z/wqPSRqI2sVh2rlRRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="89931407"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="89931407"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 13:53:18 -0700
X-CSE-ConnectionGUID: EySsJcHbR/KjdDu1GwigVQ==
X-CSE-MsgGUID: D0+HtdKLSYm1S8nJAIwBVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="270620671"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.199])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 13:53:14 -0700
Date: Thu, 24 Sep 2026 23:53:12 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Marek Vasut <marex@nabladev.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/14] iio: adc: stm32-adc: rework internal channels
 data
Message-ID: <arWNuD9apkeeT2Rd@ashevche-desk.local>
References: <20260923-adc-stm32mp25-v1-v2-0-46bc019537c6@foss.st.com>
 <20260923-adc-stm32mp25-v1-v2-5-46bc019537c6@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-adc-stm32mp25-v1-v2-5-46bc019537c6@foss.st.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_135319_060808_49644D8F 
X-CRM114-Status: GOOD (  14.60  )
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

On Wed, Sep 23, 2026 at 05:39:08PM +0200, Fabrice Gasnier wrote:
> Diversity in internal channels data array lead to have zeroed data.
> To facilitate addition of new internal channels, without touching
> all array initializers, only focus on exiting channels on each
> supported ADC variant (e.g. each SoC).
> 
> This also allows to get rid of static_assert() checks.
> 
> No functional change intended.
> Cosmetic update: remove comma on STM32_ADC_INT_CH_NB as it should
> always be the last element.

Yes, but...

> -static const unsigned int stm32_adc_min_ts_h7[] = { 0, 0, 0, 4300, 9000 };
> -static_assert(ARRAY_SIZE(stm32_adc_min_ts_h7) == STM32_ADC_INT_CH_NB);
> +static const unsigned int stm32_adc_min_ts_h7[STM32_ADC_INT_CH_NB] = {
> +	[STM32_ADC_INT_CH_VREFINT] = 4300,
> +	[STM32_ADC_INT_CH_VBAT] = 9000

...you should have it when it's not a terminator entry. Here is the case when
it's not a terminator, neither in other similar cases below.

> +};

-- 
With Best Regards,
Andy Shevchenko



