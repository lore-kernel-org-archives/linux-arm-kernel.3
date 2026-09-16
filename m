Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7F6C982C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 14:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kmDqQIff/5oYJAGtJK9uI+caNNZiUk0Mjotz9S71NDg=; b=aORcSdL0loO7NuNG86+SECcVJb
	ApWy2Irj5685ktCzmoG0uH75e4tXO2/RSQJ9MZnUKK00BKIV7bmK5c0HGSrp/RiMIlQuIag59SDtl
	15D0D9IOlrgsQc76lRAKsJvcHRfTINMOFeDa7FmaY42C3+JCnfPW8VpBSpLUS2K+dFrorikEDf9dC
	P1Yun0cLt1K75Io04eZOQBn7aS3IHEkLe11P1XMK68hU60de8jdU6m2a7LS2phB2KauJj+Ue4ub7x
	e2nQd+hbvszeJ4aL+tkb/NHee51beBCrfofYnZfniBY6sRki5AZk9XX77FUcfigqmtYRwAIEpzL47
	VbcHgvQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qq4-00000009SPt-3BOM;
	Wed, 16 Sep 2026 14:42:20 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qq2-00000009SPY-2QT6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 14:42:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789569738; x=1821105738;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cbIbcN2NjFJuDqfTD/XK1wViyDpDBpXaPgRkFuFpLJU=;
  b=Q285DGulAVa0qJumuYcx8yg4oNxbJGC/Q71ST7CLPYF4OmF2yR/lasmN
   CuDsAj5U9Xx02qciyAvlBdex6XUcskvcqODjJuTDTwu0+0QKf1VUnoPpY
   NHo/Y5XLtzDvbsTssc4TWu7oYkRFj1KYv3HCJ24BmuP2B6Nk1OJRajB4/
   VnKrWh7ZQgCuHoyb0SLD2nmdqB0K0Zpw2Vk0sNU9UH2841e/X/lscE969
   /yuz1wGBCNbmqhvGSo/9MQIfdrjzOQU5Rc5vfdSgf7sQjI02B/xFlkz59
   30s8Qw1jmrTjenDn0IOa+WdYxNjzUheehh+Bq3/HZqzcGJEUxqCwFOU++
   A==;
X-CSE-ConnectionGUID: TWYW+npVRA23OIjBWTL4Dg==
X-CSE-MsgGUID: PMZL/dk4RK2HZYxkkU8PYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93772598"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93772598"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 07:42:18 -0700
X-CSE-ConnectionGUID: KQrFpFo2QC+AYMHhteg1DA==
X-CSE-MsgGUID: ZrzcNjOASNGVSByuCdYPoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271905206"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.145])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 07:42:15 -0700
Date: Wed, 16 Sep 2026 17:42:12 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2] iio: adc: stm32-adc: fix check on internal channel
 availability
Message-ID: <aqqqxMakUVzXM9te@ashevche-desk.local>
References: <20260916-adc-fix-intchan-v1-v2-1-ef70baecd082@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-adc-fix-intchan-v1-v2-1-ef70baecd082@foss.st.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_074218_654322_67511937 
X-CRM114-Status: GOOD (  13.64  )
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

On Wed, Sep 16, 2026 at 04:13:23PM +0200, Fabrice Gasnier wrote:
> If an unsupported internal channel like vddgpu is requested, the driver
> prints a warning but falls through and assigns it a valid int_ch below.
> 
> This causes a problem later during setup:
> stm32_adc_int_ch_enable() {
>     ...
>     case STM32_ADC_INT_CH_VDDGPU:
>         stm32_adc_set_bits(adc, adc->cfg->regs->or_vddgpu.reg,
>                            adc->cfg->regs->or_vddgpu.mask);
>     ...
> }
> 
> Because the register offset is uninitialized (0), this performs a
> read-modify-write on offset 0, which corresponds to the ISR register.
> 
> Fix this by returning before a valid int_ch is assigned. Choice is
> made to keep current driver behavior to warn about the channel name.
> 
> Fixes: cf0fb80ae167 ("iio: adc: stm32-adc: add stm32mp13 support")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/all/20260911162602.D323F1F000FF@smtp.kernel.org/

Closes: ^^^

> Cc: stable@vger.kernel.org
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
> Changes in v2:
> - Review comments from Andy: use bool flag closer to the channel
>   availabilty checks. Add a default case.
> - Link to v1: https://patch.msgid.link/20260915-adc-fix-intchan-v1-v1-1-761a1b35001b@foss.st.com

With the above amendment,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



