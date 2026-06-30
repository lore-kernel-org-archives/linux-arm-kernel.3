Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A6EC43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 12:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QH4CGcHXNBmFngO/ExCQQw5Ov2BJP074AhE1cKCVPCA=; b=qBgVexKFBeWGnigrHv84r0IwKZ
	0cjVfpjSXn/OoWirZkftv3M4WFLwiE1hgtcBi/qMNrgx6sj8Dl4T/gM0/mJnYv6bdiW3pqgIQY/DE
	cpbxehT6+0uIz7fKIiDA9/iJhtLsoCycjN+YfTZAPdsNZKVAQJ9iMaWuail8ZWCZaCpsIZHn/ioe6
	jLsh1a7ytEWBwdr+179bT9G63BPSR4jKIL+xCxrLk+U75hklBZ8znfDfWKny6U1fJeqVkaRZJMSw1
	Trz9l7sub8EK8zsiXBJY1vQ2XUnJ2XA1sLi3l9Oc6XaVKuYG51C+x7SFW5uOHV3z8m2hQEjJZ1iOQ
	a/1TRHUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXK8-0000000GwpV-2gif;
	Tue, 30 Jun 2026 12:12:21 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXK6-0000000Gwn3-0Qx0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 12:12:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782821539; x=1814357539;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1L1Wf90eUreqxVia02nbtpsp46qa1tSbDPiKkspanxE=;
  b=alOTqUJQctZQznojtSgR4ntg9iBdFAitC2swC3atmxoJIrc5ndJq0qbs
   sRw8lflltAUAtRVT7yYRW4ZcqqXWo+18zaYldE2WubjNVPe1QEvOo5Ziq
   jLNLQ5nSbEYhoAyPQgn3If2SzyC8c82/rF53O4ESEEXa+f4b4ZdkkkGo8
   yrG3LXXyxdfPn9DG5tAoU8nUTVGmoL+lmlX6SG+eUbsZgcBYPZu4Gk8c2
   mfEfhYIsGqYGe+XWLacUw45GHwJkZfro4HamSof3JJxoec2i7TkxwZ7Qh
   MEnNHW8jVM6vw9067+OQM32T/5tXl5mGUuCwG9GqWbFIineCQPrB83vIv
   g==;
X-CSE-ConnectionGUID: dDkAfDJbRQKuebgwjDcheA==
X-CSE-MsgGUID: 4zB+5TqtR0ia0ukdHmBlmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="87215142"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="87215142"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 05:12:18 -0700
X-CSE-ConnectionGUID: e9Lq9jYXS82f6jnbPm0cww==
X-CSE-MsgGUID: XZ09lzFXT/CFBp5EHYEUUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="290376670"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.96])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 05:12:12 -0700
Date: Tue, 30 Jun 2026 15:12:09 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: ehristev@kernel.org, jic23@kernel.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, srini@kernel.org,
	marcelo.schmitt@analog.com, jorge.marques@analog.com,
	mazziesaccount@gmail.com, Jonathan.Santos@analog.com,
	jishnu.prakash@oss.qualcomm.com, antoniu.miclaus@analog.com,
	duje@dujemihanovic.xyz, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 02/13] iio: adc: at91-sama5d2_adc: use cleanup.h for
 NVMEM buffer
Message-ID: <akOymRWOi5xOsrog@ashevche-desk.local>
References: <20260630093603.38663-1-varshini.rajendran@microchip.com>
 <20260630093603.38663-3-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630093603.38663-3-varshini.rajendran@microchip.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_051218_199935_B6BBD1FD 
X-CRM114-Status: UNSURE (   8.29  )
X-CRM114-Notice: Please train this message.
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

On Tue, Jun 30, 2026 at 03:05:52PM +0530, Varshini Rajendran wrote:
> Use __free(kfree) cleanup helper for the NVMEM data buffer in
> at91_adc_temp_sensor_init() to simplify error handling paths.
> 
> Since __free(kfree) requires a valid kfree-able pointer (not an
> ERR_PTR), store nvmem_cell_read() result in a temporary void pointer
> first, check for errors, then assign to the managed buffer.

LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



