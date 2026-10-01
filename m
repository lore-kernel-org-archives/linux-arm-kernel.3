Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93104CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 19:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VTnvXNahnXSvTxjaA5xNy9fm6F0x3d1GZvSMC1ai1ko=; b=VP8a8vDyC7K9mm4NQxwkmvGQZW
	zN6TjfQmkiRtpKbhlDZPvMbo0PwruSp80HdUdcDpx69jmzUmqEbct87lbNLMu29m5gSSjJSnIsNmL
	HWdRCDefHdvSwryph1BB2OSWVJXzIOGF7v3e8VdtgrNYmBa3alO9sS2VkdKBRyxJkqbeR6X1l6Byo
	IU0V+OpJF83un4UdYZ2QqnEUse5kcabT75v01DecOi/r414ISD/4DYSJ/qi2G/mhrH/qDjQoHVmB4
	2BdCVtAFP2Nu14RbpzWc/OmIc1KTZl1kl7ptBtO/zCmgom3OvTciDEIbbJCabZf66OwC3pvL0N8kd
	iWXZO3JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCMDd-0000000A3yh-1lNi;
	Thu, 01 Oct 2026 19:13:25 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCMDb-0000000A3xz-0wjU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 19:13:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790882003; x=1822418003;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Vr4V/gCzPPo+UnjwMdgsC+wmyLcsr9HE+lOJEU++tgo=;
  b=DG9IDWUSgJwXM0eYJGBTN++n/IFZV98oTnHbSxEl5DF8c/dLWhaS9Joz
   O10MdUdUmqpo3qus7QKyM/4u4Zt0CpaxeW7cSYZIi5jG2x6aqRFhPZFam
   15wB3l0mpx+VVdS38m49zNNmgLw1cQLl46Vy7dfEjvXHobRpxcYMPDNUf
   zSaxDbRcjF6kvXKKze9ErDDiHEbU2Ty0NVB2hKKsb+JPJsthsCTC3RBKd
   3eowXXpsAuG7Mu8fPaHs+E0fI8nOK9e6Tfpz3wpMiTQibfb8payEJTRk0
   sxYfAygbsnNSodUMTV197y7hiHdUtOhxRZeDGTkX/6z+MkUE3Mj604zS1
   A==;
X-CSE-ConnectionGUID: o6dgqM9xS/qKDL5xBdlT1Q==
X-CSE-MsgGUID: 8W3X1q5ATXu0LlBOKy3QQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="117180997"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="117180997"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 12:13:20 -0700
X-CSE-ConnectionGUID: 18tymik5T7qQu8HwzKvanA==
X-CSE-MsgGUID: S0AQYo3oQXCtbS4+WZHidA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="279834236"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.27])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 12:13:17 -0700
Date: Thu, 1 Oct 2026 22:13:14 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 2/3] iio: adc: add stm32 mdf support
Message-ID: <ar6wypoRS-5j9iM7@ashevche-desk.local>
References: <20261001145702.2628429-1-olivier.moysan@foss.st.com>
 <20261001145702.2628429-3-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001145702.2628429-3-olivier.moysan@foss.st.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_121323_316932_E1962D0A 
X-CRM114-Status: GOOD (  11.96  )
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

On Thu, Oct 01, 2026 at 04:56:46PM +0200, Olivier Moysan wrote:
> Add the STM32 Multi-function Digital Filter (MDF) core, serial interface
> and digital filter drivers. The MDF converts bitstreams from sigma-delta
> modulators or digital microphones into samples exposed through IIO.
> 
> Audio: capture PDM microphones via cyclic DMA for an ASoC consumer.
> Support CIC scaling and filtering, synchronized and interleaving modes.
> Audio use case requires a DMIC filter, and a separate ASoC DAI.
> 
> Analog: expose sigma-delta modulators as IIO voltage channels with
> direct reads or DMA buffering mode. STM32 timer triggers can be used as
> clock source.
> Analog use case requires an IIO backend for the SD modulator.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>  drivers/iio/adc/Kconfig               |   27 +
>  drivers/iio/adc/Makefile              |    3 +
>  drivers/iio/adc/stm32-mdf-adc.c       | 2078 +++++++++++++++++++++++++
>  drivers/iio/adc/stm32-mdf-core.c      |  857 ++++++++++
>  drivers/iio/adc/stm32-mdf-serial.c    |  309 ++++
>  drivers/iio/adc/stm32-mdf.h           |  312 ++++
>  include/linux/iio/adc/stm32-mdf-adc.h |   19 +
>  7 files changed, 3605 insertions(+)

Unreviewable. Make sure the single patch is ~750 lines.


-- 
With Best Regards,
Andy Shevchenko



