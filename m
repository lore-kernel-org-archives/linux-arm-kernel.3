Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367CDCA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 21:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1K9cFaiA4WeVIvdyYVARYkF7eOkO9wkC9WMcKkqHRg=; b=m8DH1qlwbwUfPLJQL4lEXl2Hyj
	C/uzEpT+RM4bG3raQpe9qMAiXyX997ZHohN/Y4hrB8X30UtaRPwDee4cfC1tG7StWZeMXXu/UVCBo
	oExGnhs++6qVjU069uEmiqVgIESj/F7BqirJ0/bkJz+gCUYej9v5V3fy52y6vUkP2CjZX904wZ5F8
	knNMne+LQi/cf800NX+zMhxZce8cNMAJgW07osF//F0pa8MiV8ZRhh63NWsIB33pBN39KZfhWpxoo
	Rc9FQMxVc1AIfSjQ2wx4iYK/zfrnlxqE2zCqc53lizMYESJh9PXBdtQzPyZEuqV+vmoaQeRL8b4tm
	Fg08fUwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGNB0-0000000BWD3-1266;
	Mon, 12 Oct 2026 21:03:18 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGNAx-0000000BWCh-0hUU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 21:03:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791838995; x=1823374995;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RSFsJAtlDvmcdluKq98Yyik3AX0ndCZVuFsLEkW0ECI=;
  b=PMArgGV/fYRmQaWDKyrTPjXh1RqgNWPqUoT8wos6i+0KCItx1W7QfwlG
   31Slmwok8SyVDEaiT73oPsHc18gFP984LjsK8DwHPkjRRs+rS3hxlbou3
   zVzGOXG9GcXEivN6nO3mB61fxfp9Si09YvSQZAeaBo0kYrwbApJHtQW4x
   xGt8uEy44h7zrjlISuk0H37DDSKpczCF+4jmdXN8naIXIw4K/2Koint98
   4oHTwxFNti7FKe/Ej71wAMIqjDIOoALiXrnxVYgVaOY1pDLQseRxw3yhP
   Gv4ChB3VWtEVUVMp3xIESUn8IDPlX7aRPhdrV+hc/Ba8IrRS3BGeTswYs
   g==;
X-CSE-ConnectionGUID: 6CPCbf5vQweOy+7ZkD7Wvg==
X-CSE-MsgGUID: xiQJokhTRYq/VxspPInw+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="453687"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="453687"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 14:03:11 -0700
X-CSE-ConnectionGUID: RztuPPXFQ3a0Yapghe5rPQ==
X-CSE-MsgGUID: 0OqWiq0uRrSFu+ieXpcVng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="964159"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.179])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 14:03:07 -0700
Date: Tue, 13 Oct 2026 00:03:04 +0300
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
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Marek Vasut <marex@nabladev.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 05/15] iio: adc: stm32-adc: rework internal channels
 data
Message-ID: <as1LCL3y2MN204OB@ashevche-desk.local>
References: <20261006-adc-stm32mp25-v1-v4-0-d31ec75aecf3@foss.st.com>
 <20261006-adc-stm32mp25-v1-v4-5-d31ec75aecf3@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006-adc-stm32mp25-v1-v4-5-d31ec75aecf3@foss.st.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_140315_250411_95510640 
X-CRM114-Status: GOOD (  15.09  )
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

On Tue, Oct 06, 2026 at 09:57:36AM +0200, Fabrice Gasnier wrote:
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

...

> static int stm32_adc_populate_int_ch(struct iio_dev *indio_dev, const char *ch_n

>  	int i, ret;
>  
>  	for (i = 0; i < STM32_ADC_INT_CH_NB; i++) {
> -		if (!strncmp(stm32_adc_ic[i].name, ch_name, STM32_ADC_CH_SZ)) {
> +		if (!strncmp(stm32_adc_ic[i], ch_name, STM32_ADC_CH_SZ)) {

So, now this can be converted to use match_string() I believe. However, if you
are going to do that, it might be a separate patch. OTOH, this is not fix
anyway, so might be also integrated (but makes a huge change). Up to you.

-- 
With Best Regards,
Andy Shevchenko



