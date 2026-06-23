Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA08CDB470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 18:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ne+PABqulf4+8LyZm6tO8XLKjY+tG4aCd2IcTfG97IM=; b=lDtdqpDl2QVHUzV6tSCQejPmNY
	tOp+K65SPkMUeHVWWQmbBe8dw1xuFZhAujW3iBmRIRnGzjG880NypZf525rMkX5R45ENFoS3j8UuP
	HrnlUlEuR3vQK/uwZfxs0fG3KTieeuB8wxNDX1YviP7X2hlDnHVsi+eHRXO0p1rCPkBbHugZ+xOwB
	pI4tnZShg/C2kT0U3c+IlJD2a66edrvlicOlGM9X0HTPJm7YEhvtg125AX9rxPWXHeMoeljn3R5m7
	MlzzK7W/iOxP/AOb59+/gFIWLD8XXhpd65TK4jaTlIEAFvCT7mzoWsylRKmJidQ+0HghOsk6x2jyZ
	5yaduyAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc5lY-00000006klm-3hGO;
	Tue, 23 Jun 2026 18:22:32 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc5lW-00000006klP-1vJ4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 18:22:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782238950; x=1813774950;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rJMSYYrCaMpJacpqs3ZlWI5z9WqednwOmECXbXYYrQw=;
  b=QHwXJtqvQa/YXi9SdBYYGRdHLqHvhAzSj/+v1gpiDNlmHTkPFeKNhrzQ
   cejRuAq7DudsnqPV7Bxnlh7Ak+RnGutt4Z3LNybbO/OYtdSN2CgGYOTq8
   3TBrOYJLgSqkUpqyxDb8y2rg203E947oCx/VeOsKlH2IjJmtOEHaCz311
   jAuWgKeBoHXpaXEPj686VnIXryExUxX55g3OSWiAZkXsVsqpMdphy4FCA
   HaKBDlE88rSu0iNoQL09CA9XayWGlVIkWAlkrZ53RiP5TlYDAHoO+waQM
   M6m0MQumgY4gG7KzxQV9Kzl0jOj0IixUbaj/oScyXqWCfR/gSwQeED7WX
   Q==;
X-CSE-ConnectionGUID: DRVJ9w4pSIyYrl0B8mHsnA==
X-CSE-MsgGUID: Y5ubPolESq+70yggiYkmkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="93352942"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="93352942"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 11:22:29 -0700
X-CSE-ConnectionGUID: HSSgHo1OSDS2vf9tHpx5KQ==
X-CSE-MsgGUID: MnJibf1HS9mcTXJZCy+dyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="273657308"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.7])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 11:22:25 -0700
Date: Tue, 23 Jun 2026 21:22:23 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: ehristev@kernel.org, jic23@kernel.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, srini@kernel.org,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/12] iio: adc: at91-sama5d2_adc: adapt the driver
 for sama7d65
Message-ID: <ajrO3-buCfS0vx1L@ashevche-desk.local>
References: <20260623105944.128840-1-varshini.rajendran@microchip.com>
 <20260623105944.128840-4-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623105944.128840-4-varshini.rajendran@microchip.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_112230_565876_B187C0E1 
X-CRM114-Status: UNSURE (   8.62  )
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

On Tue, Jun 23, 2026 at 04:29:35PM +0530, Varshini Rajendran wrote:
> Add support for sama7d65 ADC. The differences are highlighted with the
> compatible. The calibration data layout is the main difference.

Do you need to update a Kconfig help text?

-- 
With Best Regards,
Andy Shevchenko



