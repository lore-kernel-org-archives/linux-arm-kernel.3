Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A567C43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 15:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QHHQmFDOSKnD4YpRfcLyNv6UBGspgJLpj/tD/xD0v50=; b=Z0k5aKxSccZTUhhzeSzo6hwJNE
	ShHmc26wiKIK0pwsPOjxkupgbz7WtLDZaIlWU/2fFcpWCHk4By31+930ZptJ8HrdCG7Y41cgKK60f
	dObTZ0wVpFIC4KWFm+60QuBfMwmpD49HEm1DIEnrrUuc+mJVkMOOpnuF5tDAMWyav3uaZKjwsI8Vx
	2i6g4VUCyFc5p4NCe9ZuKBn4LVshI1fwUSOm9b1A3M2kOIpO+stGcf12obkajMeyKI8wSx7S4+tO9
	owGyB2nSTufeeB5iq2SQwvgsKJgKE1VFsfc7tFucjrD92YJxfDqfZowygPfbB1kH7mAlIplbbN5N5
	YLjQvw5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDpb-0000000F3PN-1yDh;
	Mon, 29 Jun 2026 15:23:31 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDpY-0000000F3Oi-2wHD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 15:23:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782746609; x=1814282609;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ikG8LyC1XcdBJf6tJzF7Bt/BQgmZRgtL19n+WxN3KCI=;
  b=YsVczWe2FVG2TJt82CU8DmlAZ2H7OrA+nsuVq8cpniRdcgsbfwbCFaIq
   h5j5UbJSbmB7vdHlEXQbVow7UhuZ9SfL2D3Fj0L+KKAR2kwdUWtJvBjMi
   B+dbIpxu7VFKRHAZTjnus7utp/Vu2+RJtUSjsjJaHXfCOU6HaWLlCvhyI
   krHIS7RZYhJ+ojGhz58E/xp4W7+YsoEVZlZ8mG8xLDphq3UpCgT1gXUJw
   dMuEcLem64DWTEsPR1TZUhIdEiO58jR2g7eNDAY5GPxRPmanML68u4Q+D
   y7mXtqTah/Zm0HHztKp64bMAxhEXSKAVR0d2dyuelNow/XLnf1TSh/qPW
   g==;
X-CSE-ConnectionGUID: HANNaLnBRYGLXNTtIrlG4A==
X-CSE-MsgGUID: KLMIeSiYSmGN3B6ga4hLBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="94023541"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="94023541"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 08:23:26 -0700
X-CSE-ConnectionGUID: 7N2MW441QaazjVGcO5Si8w==
X-CSE-MsgGUID: QtCGyfNORrCYVEX/UtpPDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="245635032"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 08:23:22 -0700
Date: Mon, 29 Jun 2026 18:23:19 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Marcel Holtmann <marcel@holtmann.org>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ulf Hansson <ulfh@kernel.org>, linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] [RFC] gpiolib: introduce gpio_name() helper
Message-ID: <akKN59lv55CXS3HU@ashevche-desk.local>
References: <20260629135917.1308621-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629135917.1308621-1-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_082328_766350_23633C73 
X-CRM114-Status: GOOD (  14.28  )
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

On Mon, Jun 29, 2026 at 03:56:29PM +0200, Arnd Bergmann wrote:

> Most remaining users of desc_to_gpio() only call it for printing debug
> information.
> 
> Replace this with a new gpiod_name() helper that returns the
> gpio_desc->name string after checking the gpio_desc pointer.

Oh, that's nice!

...

> +/**
> + * gpiod_name() - get a name to print for a gpio descriptor
> + * @desc: gpio or NULL pointer to query
> + *
> + * Returns:
> + * The desc->name field or a dummy string for unknown GPIOs.
> + */
> +const char *gpiod_name(const struct gpio_desc *desc)
> +{
> +	return desc ? desc->name : "(no gpio)";

Can we get into here with wrong (error pointer descriptor)? Shouldn't you call
one of validate_desc() / VALIDATE_DESC()?

Also not sure if "(no gpio)" is a good choice. "not requested"? "not provided"?

> +}

...

> +static inline const char *gpiod_name(const struct gpio_desc *desc)
> +{
> +	WARN_ON(desc);
> +	return "(no gpio)";

Hmm... This will be a second copy with a slight potential of going apart from
the other case. Perhaps a #define? (Yes, yes, I understand that there are pros
and cons, in particular readability with define is questionable.)

> +}

-- 
With Best Regards,
Andy Shevchenko



