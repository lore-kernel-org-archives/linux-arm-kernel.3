Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 267D8CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 13:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hKmOlPSktlGX0vlPM/jwBIk+YRmwCATKxv0L5kV+TGc=; b=AuLX3yBtaUaYK0O7PECC0M/Gwp
	zzNVxFotcTpaEX9JH5bxT2Gl/St0CZG+h9FdnUMLU+eOSSEM+R3RRfZfs4wBBpP0XNSsm2bT78bcn
	EoGG32UWWGIWtGuFLEinSUj4vvQhre8TfJjLusBuz+G2dYyHOerdG/gTjfJAeKlknt73TjVtxUvI+
	Y1xofeO1R/j92hTntnj2AoYNXqDj7TiyfPEGXXIEHG7AtcZxF3bTgWpSqfoygohv2k2PRZggG8B21
	Q6u+OVUUAySb+R+UGW65blpk7bfwR5cyhaknWNhP3DxPBE1upBdlPXUlKWuWUs63/gkaTMnRiQDLN
	gQRW8Bcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYOc2-0000000CKf5-3uAn;
	Sat, 13 Jun 2026 13:41:26 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYOc0-0000000CKWD-3wUh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 13:41:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781358085; x=1812894085;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OI66FUDTDYvCeY10NqbQgLoYEhrOPd1Kya/AaT9RDHA=;
  b=mJX9cqU/xqHIUjhsINwg8F7eCgrf5KQppYEnjr2aWZk/rMiGcgYnU6D8
   kGKgseKfUZeKEn7yFphKugjW4DJVxdnNtOrO4tbGjxEIoCInDWtVjIPpL
   4+66YTrD06wXwJAcXPb/l8RzsN3dc+EG9LR/Kd86m7Re0X3x3ObQKqSor
   y/FzbXmLP6rctusUbR4uxR+EppChCY0ZXEbRbMx/d6T6ptk5PnLHiTK/+
   26x6f/rUM83LTpB04QxOBWSG0C1nMrKTjI3Rh+qRRTsr7bmhFdbQd+Tr+
   AQGrWb/+jv1LeMSlC9CWSrV1oeNKQE31wYwIeEO1M1ec8Ehz9mSiODoBo
   Q==;
X-CSE-ConnectionGUID: US5Tf2IOQKasfveasDBYSg==
X-CSE-MsgGUID: YtsxIogtTW6tgPudtC0EOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="93660875"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="93660875"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 06:39:22 -0700
X-CSE-ConnectionGUID: DZu2Tr2UQe2k7vVP5XQbcw==
X-CSE-MsgGUID: uswYLJDqTHKcATAC74pTNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="277251883"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.184])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 06:39:19 -0700
Date: Sat, 13 Jun 2026 16:39:16 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: stm32-dfsdm: Treat flags as booleans
Message-ID: <ai1dhJWb9vKqxEEe@ashevche-desk.local>
References: <20260612215151.1886851-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612215151.1886851-1-robh@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_064125_045249_552502CD 
X-CRM114-Status: GOOD (  13.73  )
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

On Fri, Jun 12, 2026 at 04:51:50PM -0500, Rob Herring (Arm) wrote:
> The "st,adc-alt-channel" and "st,filter0-sync" properties are
> documented as boolean flags. The legacy parser read them as integer
> cells, unlike the child-node parser which already checks only for
> presence.
> 
> Use presence and boolean helpers so both parsers follow the binding and
> the property type checker no longer reports the flags.

For the patch
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

However one interesting remark below.

...

> -	ret = of_property_read_u32_index(indio_dev->dev.of_node,
> -					 "st,adc-alt-channel", chan_idx,
> -					 &df_ch->alt_si);

> +	df_ch->alt_si = of_property_present(indio_dev->dev.of_node,

I believe it still has another (serious?) issue. We usually don't use indio_dev
for device properties. It's not a device that is described in DT.
It seems the only driver in IIO that does that. Note, I haven't conducted any
deeper research, it might be (however I'm quite in doubt) that this is correct
use and one device registers a few indio_dev:s.

> +					    "st,adc-alt-channel");

-- 
With Best Regards,
Andy Shevchenko



