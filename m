Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4382D5E145
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 08:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cmBIrTX5aSJyvAHObHqxmsBssMm2JWilvRliUSWHc9c=; b=SAhSqXFZSaK6Le+KE/8jA1Pq/U
	bwL4nOCYbxcq2+CMfclbqKGo13wMjZItMd/toveIDdbb30YkgojRbbKVC0RzrQ7cT+ipSqLlZ8CPu
	ZmLJYYZ3DTU/jtveuDKIGJFeERbjLp/1p1SQGo/5eEvr8Xv1vYSUYO+VMYuad87glj/w3XUNou4lW
	DsBqWTMDnkMs67rj4xQ409Y5ptO9hJggFbnP8BIW+Av59VVisJrEMCIa0XAoPn35lpmqW/84iMi84
	oDTveqYDW7OtFLq6LX4u5EgTjsJ1tihYwzO84JpFLrB6KHSQsB0eLe1racEZJNhlc9yOYbhpA60kP
	AB3m0xjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Ke4-00000009pbi-12CU;
	Fri, 08 Nov 2024 08:47:08 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KT9-00000009nhJ-1kp0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 08:35:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731054951; x=1762590951;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=9UA99/45VPMOgVasNo9nRRbOr9t2v7Wo/0I1uXKF4qo=;
  b=j5vmFnaO26JW2KUXPmvIdQahsHDaA+RzHSGpzgB8XE2bkJwQKKmD86uO
   sgXa5eSj60+jQVIdspD7BdMLwYRtLuhRaqU74eXzQIV4SQ4s1b8nF1f7x
   nuPs0TIA7aKpdvwLuzwaTaFcYNl9oti0rr++u4A6nRDEAV5KsumWTQS7Q
   R6zpJK+6SpenHMepg9swayoJP1bqyNNeRfMALwIJXxQf9uVaqH1LkIqiA
   NqrMeSB9y+jn/+dRe7qGoOTmDYQ1jxrW6P3y+fWLK4nYVncCleeb0mNyG
   /8WCyTuXKkagGIqi7XIUHZMKQFvwcUAKawgwT6Grk9sJm1VD/OnWt3IN/
   A==;
X-CSE-ConnectionGUID: CpnLEFm3SFuUEh2L9FZuFQ==
X-CSE-MsgGUID: 2HRSkLk2TSGf2veleYTggQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48390351"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="48390351"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 00:35:48 -0800
X-CSE-ConnectionGUID: nptTQUc8R1+KrtE0Py8XKw==
X-CSE-MsgGUID: oiAvJIL7Rhm2hlOVPkYvxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="86267023"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 00:35:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t9KSz-0000000CXOf-1fEb;
	Fri, 08 Nov 2024 10:35:41 +0200
Date: Fri, 8 Nov 2024 10:35:41 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 4/6] pcmcia: soc_common: Avoid using GPIOF_ACTIVE_LOW
Message-ID: <Zy3NXXFFw4l-vfvr@smile.fi.intel.com>
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
 <20241104093609.156059-5-andriy.shevchenko@linux.intel.com>
 <CACRpkdYF-_6vb3SsJ9EHh1mCbqeW5=qoYkLF7Re+XyGq36OJSg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYF-_6vb3SsJ9EHh1mCbqeW5=qoYkLF7Re+XyGq36OJSg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_003551_553146_9606725C 
X-CRM114-Status: GOOD (  13.25  )
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

On Fri, Nov 08, 2024 at 09:28:19AM +0100, Linus Walleij wrote:
> On Mon, Nov 4, 2024 at 10:36 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Avoid using GPIOF_ACTIVE_LOW as it's deprecated and subject to remove.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Looks right to me, some testing would be even better
> because I never trust these flags to get right.

I also would like to have this, but seems the only odd fixer was active ca.
2023 last time, I'm not sure we may hear from Dominik in time, otherwise the
series will be postponed for unknown period of time, which I do not prefer,
rather I will fix any regressions later (but I doubt there are here).

-- 
With Best Regards,
Andy Shevchenko



