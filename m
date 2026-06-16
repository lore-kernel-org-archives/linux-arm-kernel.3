Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97B5CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 07:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tiX/tBE0NIPdu0NHT51hkmOUcnq/CtwNXQ7DSWMxsho=; b=orLPwkB0AbfPHVXsTHAgtPyAnU
	tJzfW/t8csZDvo6IPLM79bdBUdLexURxAQS/g0+WHcbpfyaojPBlDyXaf4MkaQRakje5I/Nx+hS6Y
	0FrZckdGZUqYEb9XX/EU8mp5lA79lw2bK7uiuug99RN7OWOZfggcaA1hpZQUUUVTMOYjIUJYYQmIe
	s8Tn9LozIhMqxYTI6VILjdq9eiNldAaYSdVdWCQu80cH94fUmpNoZA5sImIYQViIGqL8S8FZ2cB4U
	hs4dgiaa/jhg37luhO6LrtVhsvYjyehuqUB3eKfOggzs3i/8v/oCTuwsD4REn1KZLX+q8lK6Ym0xp
	fevB37hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZO3r-0000000FMtr-3zrx;
	Tue, 16 Jun 2026 07:18:15 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZO3p-0000000FMtQ-0wqf;
	Tue, 16 Jun 2026 07:18:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781594293; x=1813130293;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=htRrDwRMI7BFnk9AXL334KnIn2BLLC062bhjqfsj9W8=;
  b=kdVsy0+Oo+qZ100iAtcRO8A0JRK1VsuFeurdk0Ac9U9IOpkiFBD3GJpH
   Dce134yqWwl6wXAaJpQ/ZQaE0QgiIzayMFmPA4e+u7s9yruG4ZIaulCCT
   W8XviK98buSK39OwLLJbvrwUGBVxEw7LsAHKLz8NqW5MBSPEiJwC+LQNa
   NXNbq7L7g7dDzLTUplXTiWvGIsZyfwipj9iGBbNtxYpx1sj65B5KDDuEz
   iIbJVakFx/+X/AdI2vjnFkBQWs0QMbiUw8AutTHv0YLcWe480c6PO0zPV
   0olWGmwMGVe/kySm8ZPNKmOu4DmlLIkuzTu+/65nI153uh0gFF9ZERzc6
   w==;
X-CSE-ConnectionGUID: TPZ9iId2S0WtKst+R312pg==
X-CSE-MsgGUID: 5msEZDu+RJWzVUS0hdUSrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="92668526"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="92668526"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 00:18:12 -0700
X-CSE-ConnectionGUID: ohjXJDAJQBSmGxLxtHRHWQ==
X-CSE-MsgGUID: najrIRwISSyv8t0/41PZgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="245300296"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.153])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 00:18:08 -0700
Date: Tue, 16 Jun 2026 10:18:06 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Lee Jones <lee@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH 3/4] mfd: mt6397-core: add mt6323 AUXADC support
Message-ID: <ajD4rp1EEe-xEMm5@ashevche-desk.local>
References: <20260602-mt6323-adc-v1-0-68ec737508ee@protonmail.com>
 <20260602-mt6323-adc-v1-3-68ec737508ee@protonmail.com>
 <20260611163748.GB1212816@google.com>
 <ycj3k-vV_tQv6u9OfCTP9G9kkeeE-_dbzg_oeHPXn2pb1oZe_Sa1BH6GUGuSd_gD6uPSJiTX7tz6MTlFcqGdWX-f3GMfyW2sLgAOCw6YeNE=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ycj3k-vV_tQv6u9OfCTP9G9kkeeE-_dbzg_oeHPXn2pb1oZe_Sa1BH6GUGuSd_gD6uPSJiTX7tz6MTlFcqGdWX-f3GMfyW2sLgAOCw6YeNE=@protonmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_001813_954775_97C219E0 
X-CRM114-Status: GOOD (  18.20  )
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

On Mon, Jun 15, 2026 at 11:10:20PM +0000, Roman Vivchar wrote:
> On Thursday, June 11th, 2026 at 7:37 PM, Lee Jones <lee@kernel.org> wrote:
> > On Tue, 02 Jun 2026, Roman Vivchar via B4 Relay wrote:

...

> > > +		.of_compatible = "mediatek,mt6323-auxadc",
> > 
> > [Severity: High]
> > Does adding this compatible string expose an unhandled edge case in the
> > auxadc driver?
> > 
> > If this device is instantiated directly from a Device Tree without an MFD
> > parent (e.g., at the DT root), dev->parent could be the platform bus
> > (which has a NULL parent) or NULL itself.
> > 
> > Looking at mt6323_auxadc_probe() in drivers/iio/adc/mt6323-auxadc.c:
> > 
> >     regmap = dev_get_regmap(dev->parent->parent, NULL);
> > 
> > Could blindly dereferencing dev->parent->parent here, or passing a NULL
> > device to dev_get_regmap() (which calls devres_find()), result in a
> > kernel oops if probed as a root node?
> 
> This is intended behavior, ADC always should be probed as a child of
> the mt6323 MFD because it doesn't have own MMIO space. Otherwise the
> devicetree is malformed. Recent mt6359 ADC driver has same thing with
> dev->parent->parent regmap.

I think Sashiko is overprotective here, but if changing, the whole lot of MFD
drivers should be changed (like Rafael recently has done for driver_override
issue in ACPI related drivers).

-- 
With Best Regards,
Andy Shevchenko



