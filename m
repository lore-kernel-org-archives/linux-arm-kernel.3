Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608D6D12D7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 07:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ib1hGNaowYk7Ob+EBk47vzMZp1lsctT6tcTifYvE+B4=; b=x89ZQ/P+SrcT4ySP7lk7rad1i8
	6UQrwGMJWkrSJuz0N9I8LYzbjtEQk1dGGpKYuZ7eWt5cJga5zaOFvXlW1zB52oNKKIlZHjBcSRdhr
	6JxXIRLVm518hfsBjgWcMzGI2hvZRPbQGxXTpgmuPUpkkpavpo2KR96eKVVBD5t7MKch04LY2WyEJ
	jTqwTglqf8uY9Cr0Dhb6bTbb9Qf10cyLd1WijIjnzht57kUTP8J4hRtQaLi7k6MXYHwgUPuK3hhUr
	aeWKdspbiPaLYsHkH5CbRTcUYH5KU36UBKfsPx2EyC93QZSXFYV+JAjHZZxNcFMhC2vFheZvTwcCY
	zJyPWEsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOvb-0000000GgXD-3fnH;
	Mon, 11 Nov 2024 07:33:39 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOtp-0000000GgN6-38s0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 07:31:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731310310; x=1762846310;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=SXzhXfPE+Qx72rA8T0X23owjGP3zy9X4bJ0lEmi/M3Q=;
  b=YkhB7pQL/oW5nNWwfpByLWK2cHB4V0OtZZVGZA+jyseicxBiDX6e2upv
   Unut33vT58/46Z/VIcYUfStuFJahJzcHvd1QzaOzdewV2NuWNWpk2cbCB
   VMYwZ5msxgtdvD5pTvJb9kU0/xm9Lj5GCUrUxWTzmfgR1al6eEKna9Uhw
   CMIz3JFMnFrehNrhYcGDesUFRwgFiv9cUdHAYf62H+yC7kyHZvBpQvoom
   P5zdxUPqY5rRfHnK9vNQdkkuuZy+7QZ7xOjWSrBeDdu4hP80wG904NQ6B
   KoZ2uShHwqmN74B5oEWfxEWgOakPWPSMePvlSWHexglKH3JQen1YXd2w6
   A==;
X-CSE-ConnectionGUID: tV5fVhyQQumlw1h8Gt+zYQ==
X-CSE-MsgGUID: 9iV1Eq7kTni6S6rZQzM1NA==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="41719577"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="41719577"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2024 23:31:47 -0800
X-CSE-ConnectionGUID: 1wF9bTkqS6ep9vgbqng2bg==
X-CSE-MsgGUID: EoccRMIkS2OIbniMG4nl0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="86538133"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2024 23:31:42 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tAOte-0000000DVuj-3MD3;
	Mon, 11 Nov 2024 09:31:38 +0200
Date: Mon, 11 Nov 2024 09:31:38 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 4/6] pcmcia: soc_common: Avoid using GPIOF_ACTIVE_LOW
Message-ID: <ZzGy2huB-l4PYNUV@smile.fi.intel.com>
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
 <20241104093609.156059-5-andriy.shevchenko@linux.intel.com>
 <CACRpkdYF-_6vb3SsJ9EHh1mCbqeW5=qoYkLF7Re+XyGq36OJSg@mail.gmail.com>
 <Zy3NXXFFw4l-vfvr@smile.fi.intel.com>
 <Zy8Dz7v2cGdGOPLj@shine.dominikbrodowski.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zy8Dz7v2cGdGOPLj@shine.dominikbrodowski.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_233149_863372_A6B9FA3A 
X-CRM114-Status: GOOD (  20.16  )
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

On Sat, Nov 09, 2024 at 07:40:15AM +0100, Dominik Brodowski wrote:
> Am Fri, Nov 08, 2024 at 10:35:41AM +0200 schrieb Andy Shevchenko:
> > On Fri, Nov 08, 2024 at 09:28:19AM +0100, Linus Walleij wrote:
> > > On Mon, Nov 4, 2024 at 10:36 AM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > 
> > > > Avoid using GPIOF_ACTIVE_LOW as it's deprecated and subject to remove.
> > > >
> > > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > 
> > > Looks right to me, some testing would be even better
> > > because I never trust these flags to get right.
> > 
> > I also would like to have this, but seems the only odd fixer was active ca.
> > 2023 last time, I'm not sure we may hear from Dominik in time, otherwise the
> > series will be postponed for unknown period of time, which I do not prefer,
> > rather I will fix any regressions later (but I doubt there are here).
> 
> As I don't have such hardware, I cannot help with testing, but from the
> PCMCIA point of view:
> 
> 	Acked-by: Dominik Brodowski <linux@dominikbrodowski.net>

Thanks for chiming in!

-- 
With Best Regards,
Andy Shevchenko



