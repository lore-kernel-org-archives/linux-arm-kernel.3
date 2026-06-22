Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC0B0CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 10:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x7ELfe5wHrOkKLlGGW3w5nXtPBmCLhrby1KSBUh1Obs=; b=WKxbErktEkTpKiYOdZy7ojrIlX
	+3JC0FfM77b2IqTq9UbWlhJc+hj3/4TZ0t6R7BnvKtBdQzXN9T4LNDzDWBu1nZmUaT1599cs4BBR8
	ZIXJVwkOHv8UrYMx3WwF/2YErSx4YWEwvqasftEAKK8kw2M7jkMt5HJT3jBeR8XKarCbPfTBg6Z4w
	bDIzmQ0BxFjwiEiXottGTdjyb9rc9bmb7VpKJARhx8g5ZT1RTTO7PSEEGzyynNJuyitgs7Pq9kZtZ
	qmaibAkmVPhBHSFKlsNLOUt0GoOtgGMEiIWknWNrIE3rzisXwec3GwJo5bWU/ioeChQwOxK9SbpQ4
	7xHE4maw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbc1s-00000004qMT-2lpx;
	Mon, 22 Jun 2026 10:37:24 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbc1p-00000004qAB-3wPl;
	Mon, 22 Jun 2026 10:37:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782124642; x=1813660642;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=nKS4zwQM+VFl+KcVzgjEHYMtbkj7E74mVR7te08Yyu8=;
  b=btM65QUQuLOpb/uQcvhZhLZVO1I6rTNu5U02yfk1TUp3Nka9+SbaI3rn
   9YGts4jmyIHPTmOREp4dFEWj4gaibPiLlHzu8F+k0GiHDcEbTdDchBxkE
   gFoy+PyXvWH262i41GaXBdwFRLbtQL4OPdyNAPmdzBv75zxcIt7Xb1Cg7
   k9WHM6PU9BxiX2T4ZFMzHjtMnOFtKAd4ANegCFUK21BFcq8XooqA99lLi
   zt7RxIMlbH13xKCC3S24bZl0Zhdy9A5cXhJ2z980BL5oHSTkHxIanO6ie
   Wi4nO9Sk0V6QQl1aXcM07Qxb3N0FXHDQ2SJLaF7vRcrHnCX9cyvp4xFO3
   A==;
X-CSE-ConnectionGUID: V816DB/hSISJ+Fem8sPVHA==
X-CSE-MsgGUID: ygIPiztHQpuHc6MZzaJE3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="70365450"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="70365450"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 03:35:21 -0700
X-CSE-ConnectionGUID: NiAuEHaXRFyoiUSZMBV95Q==
X-CSE-MsgGUID: pwp5A8wfRVaZLysDxupkNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="248046762"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.152])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 03:35:15 -0700
Date: Mon, 22 Jun 2026 13:35:12 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"afaerber@suse.com" <afaerber@suse.com>,
	"wbg@kernel.org" <wbg@kernel.org>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
	"lars@metafoo.de" <lars@metafoo.de>,
	"Michael.Hennerich@analog.com" <Michael.Hennerich@analog.com>,
	"jic23@kernel.org" <jic23@kernel.org>,
	"nuno.sa@analog.com" <nuno.sa@analog.com>,
	"andy@kernel.org" <andy@kernel.org>,
	"dlechner@baylibre.com" <dlechner@baylibre.com>,
	=?utf-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org" <linux-realtek-soc@lists.infradead.org>,
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
	=?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
	Stanley =?utf-8?B?Q2hhbmdb5piM6IKy5b63XQ==?= <stanley_chang@realtek.com>,
	James Tai =?utf-8?B?W+aItOW/l+WzsF0=?= <james.tai@realtek.com>,
	Yu-Chun Lin =?utf-8?B?W+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
Subject: Re: [PATCH v3 2/7] gpio: regmap: add gpio_regmap_get_gpiochip()
 accessor
Message-ID: <ajkP4DHN4JPjr6yb@ashevche-desk.local>
References: <20260512033317.1602537-1-eleanor.lin@realtek.com>
 <20260512033317.1602537-3-eleanor.lin@realtek.com>
 <agMM9soiqpG-TRSb@ashevche-desk.local>
 <adff3a2d21a64d3ea3b408d62157ee1e@realtek.com>
 <ah92oEavMu4QRn8y@ashevche-desk.local>
 <CAMRc=MdA24z-tB_D8CTw68Di8e4OVQJ1QH4+rDskFzq=xjJ5BQ@mail.gmail.com>
 <DJ3QVMZ6XLW9.1M9W541O92QWJ@kernel.org>
 <CAD++jLncD2ZjH3aedOkGNYP3FyZ=i7Pb0OcKKZKuMOPGNjM_nQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLncD2ZjH3aedOkGNYP3FyZ=i7Pb0OcKKZKuMOPGNjM_nQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_033722_037451_12A7B81A 
X-CRM114-Status: GOOD (  13.53  )
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

On Fri, Jun 19, 2026 at 11:08:30PM +0200, Linus Walleij wrote:
> On Mon, Jun 8, 2026 at 4:41 PM Michael Walle <mwalle@kernel.org> wrote:
> 
> > >>> Without an accessor like gpio_regmap_get_gpiochip(), we cannot retrieve the
> > >>> gpio_chip instantiated inside gpio-regmap.c to fulfill these requirements in our
> > >>> map() function.
> >
> > Why is gpiochip_irq_reqres() called in the first place? Isn't that
> > only called if the irq handling is set up via gc->irq.chip and not
> > via gpiochip_irqchip_add_domain() like in gpio-regmap?
> 
> Not really, the gpiochip_irq_reqres() is called to mark that a
> GPIO line is used for IRQ, so the gpiolib cannot turn this
> GPIO into an output line, gpiod_direction_out() will fail
> on lines used for IRQ. So it's a failsafe.
> 
> You can live without it of course, but then you don't get
> this failsafe.

So, when we instantiate our own domain in regmap GPIO, we should have those
callbacks be defined somewhere?

-- 
With Best Regards,
Andy Shevchenko



