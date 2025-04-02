Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C3BC36017
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 15:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gd7bGYs43YAFBd8jf8IF6jWLUoHc7ZzOIIuXb6PbR3A=; b=I2LgF0IHdHu6kSqHnROMqN3qJV
	qwzM+pi8cEy763S5LI3NZEiy1g9WbUCu5ms32/mutpL3CAyxgNr7p+2uAi0CyHJSxcUlqLRlewBFt
	gdGsfBAiwHe2Jchr5o0vVbL5INHgy3SCLJ06SohCktQ4umQzUjpZW85ysARen/WhjRiVY5pfKyOm0
	5rBRIuL7llwgQqJ0Ij9Xv8WwinLj3Hr1UDUq7QG6xKuTJpq6c6/pmi2vcMEg1WybRjoL5gbqIluJk
	/YNtjRtGJcv6ZJ/zeKWqwPUqwGLaddV3E+HxQ6eqXnGK9W2p4CFF1FuuBzvPYl0PoF5q4mejVbawZ
	LmEUS1qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzan-00000006RmM-0HFS;
	Wed, 02 Apr 2025 15:01:25 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzZ0-00000006RFp-2kC0;
	Wed, 02 Apr 2025 14:59:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743605974; x=1775141974;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=dlLqY1u1t6/c8205XqJOIrRCz/YhzQT9F0ssufJpEow=;
  b=g6BfGtMuT5rG+Zdm/D41b54zdPbiAfAhMWumr+REC213UESj1OqkLkGK
   6aPnjQGI8a58xuJAQfTD/kxuByG7C+YrNWY1AyO4zVFfBNYu8OLKqe0lG
   ecc1e2muyBwAGW0RcZdHOhPYZBXSm+IGukqGaKbbz0QuEi/cZKIxSp0GS
   zqIjRcvHSqRIYiFYHhVvbh404jqZjRX7EuvgPeDL3OhkPk/7MgEZ7AIKm
   n90s4gXPkaHmXQh9qc8CQQUT8w+KcpbYJlCAHpni8c9nqOEUAFrYWcetr
   Pd+I2YY7d2YV6JGsZrrimrTxL6RUA9a2TN3/u4w1BNC1mxiuKf36YkRpv
   g==;
X-CSE-ConnectionGUID: yvfOnpchQ5yUjn2LgN+4ug==
X-CSE-MsgGUID: mMOwWSPzRF+BomVuqpHUaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44232463"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="44232463"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 07:59:29 -0700
X-CSE-ConnectionGUID: UlGiov7MSou8TYTSDLOb1Q==
X-CSE-MsgGUID: AlQg4rPaTtq3pa3PjFbrBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="131848576"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 02 Apr 2025 07:59:26 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B3A6426D; Wed, 02 Apr 2025 17:59:25 +0300 (EEST)
Date: Wed, 2 Apr 2025 17:59:25 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	"open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] spi: bcm2835: Do not call gpiod_put() on invalid
 descriptor
Message-ID: <Z-1QzesPs7A3_FQY@black.fi.intel.com>
References: <20250401224238.2854256-1-florian.fainelli@broadcom.com>
 <CAMRc=Mefks5RMDkO-w-WT1279rKKyz8Up9UbuNdcF+WpsOxioA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mefks5RMDkO-w-WT1279rKKyz8Up9UbuNdcF+WpsOxioA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_075934_701660_47B9E0E8 
X-CRM114-Status: GOOD (  15.18  )
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

On Wed, Apr 02, 2025 at 01:36:28PM +0200, Bartosz Golaszewski wrote:
> On Wed, Apr 2, 2025 at 12:43 AM Florian Fainelli
> <florian.fainelli@broadcom.com> wrote:
> >
> > If we are unable to lookup the chip-select GPIO, the error path will
> > call bcm2835_spi_cleanup() which unconditionally calls gpiod_put() on
> > the cs->gpio variable which we just determined was invalid.

...

> > -       gpiod_put(bs->cs_gpio);
> > +       if (!IS_ERR(bs->cs_gpio))
> > +               gpiod_put(bs->cs_gpio);

> We could also just set it to NULL on error in bcm2835_spi_setup() but
> I'm fine either way.

I think this patch papers over the real issue:
1) the cleanup call does everything and not split to have the exact reversed order of the setup;
2) the GPIO here as far as I understand is not optional and on errors may contain an error pointer
but gpiod_put() ignores that.

TL;DR: I think the proper fix is to make gpio_put() to accept an error pointer as NULL. I.o.w.
if (desc) --> if (!IS_ERR_OR_NULL(desc)) in all conditionals related to gpiod*put*() calls.

-- 
With Best Regards,
Andy Shevchenko



