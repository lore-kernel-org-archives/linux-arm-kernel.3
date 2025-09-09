Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BEE7CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=606ZEhsEIpV3HLtv66kQeZpLS/fqhfv1YzwlY7HKwHQ=; b=VSvXURexGvh8NEF1Px2Bz7Wt6r
	M7TYku/Oi5n5q1ZMjCnXurMOvs3UJiPYph6q0y78W5GwBKqbrTSg4bWkGgJHR4iOhDqJ53+xGkWKc
	X9pLIZRi6uiZD5Tg9KB+F6v4pD6a19bkV2C8wu6gjfyAB79gTf0Ktwb+fzP5QrVyOCe1IJBGLEwmD
	IcfWQ4/hgTcgvOdS+HHbWCB2DiPmIqUx703GNAi8M6+KGswVFsKql4jIwAk+xzItCwt+oVa6b6MKr
	qwe4YTtCemGp3Ghy1OSWqxSWSYIhmoeHoxge70/TpE0SRZ1Vs+2faTX6ub1cKdyLQ4p9C+Kf+KxBK
	rjj2iSbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1yx-00000008sdD-3MZ9;
	Tue, 09 Sep 2025 17:18:15 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvy9u-00000007IhW-1BMk;
	Tue, 09 Sep 2025 13:13:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757423598; x=1788959598;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=L6CwOVwYJN4Y/x7PmC4SNNIsn1PcLQu+MvjuP9uomWU=;
  b=Z0TmpKDOWbawgXSfCmjAUFZLSBZ7l2PexLCjA2MLvHm4mUbnlrWFAJHw
   dEcKkVK3rWv9pwPt89Rf8CzKXFiV5+Z/T1hIOPYlzyn+S8k31G32T9x5Q
   AyA8YtrmeDeuSXIMUKAVX0hKRuFuKVABsQT3np7LzZv2ZbQFYNGePGeJe
   I7Zac8JA0wDMF/UEdeiwoTDqfMl5V7tu+HvFkWkGJRoWDfojT4MnwYjtC
   TCXm6sKdtu6hMNAHIxiaFCduE3UzzDUf2QB0FTmuac0W0Pm45NQeTUVIy
   JldNusRbmw4oPazgP5u5XzmIP8FXYbF6hefPvUfYPhy1L7urhnzPQ7UOL
   A==;
X-CSE-ConnectionGUID: 2BNCrMKFStu/Ten28RN6/A==
X-CSE-MsgGUID: i/WPkKfEQ0CwkdVItr+Yrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="82295498"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="82295498"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 06:13:13 -0700
X-CSE-ConnectionGUID: uvql51LsTAqr3Q78sqHnqg==
X-CSE-MsgGUID: bZMIDd5nSnSWd1c35O6zLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="210237526"
Received: from smile.fi.intel.com ([10.237.72.51])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 06:13:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uvy9g-00000001Rlg-2b48;
	Tue, 09 Sep 2025 16:13:04 +0300
Date: Tue, 9 Sep 2025 16:13:04 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 13/15] gpio: sodaville: use new generic GPIO chip API
Message-ID: <aMAn4MM_Fs8q8qwj@smile.fi.intel.com>
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
 <aMAP9hAWars0T83r@smile.fi.intel.com>
 <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_061318_392355_25ED6F1C 
X-CRM114-Status: GOOD (  18.10  )
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

On Tue, Sep 09, 2025 at 01:35:04PM +0200, Bartosz Golaszewski wrote:
> On Tue, Sep 9, 2025 at 1:31 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Tue, Sep 09, 2025 at 11:15:40AM +0200, Bartosz Golaszewski wrote:

...

> > > +     config = (typeof(config)){
> >
> > This looks unusual. Why can't properly formed compound literal be used as in
> > many other places in the kernel?
> 
> It is correct C

If it compiles, it doesn't mean it's correct C, it might be non-standard.
Have you checked with the standard (note, I read that part in the past,
but I may forgot the details, so I don't know the answer to this)?

> and checkpatch doesn't raise any warnings.

checkpatch is far from being useful in the questions like this.
It false positively complains for for_each*() macros all over
the kernel, for example.

> It's the
> same kind of argument as between kmalloc(sizeof(struct foo)) vs
> kmalloc(sizeof(f)).

Maybe, but it introduces a new style while all other cases use the other,
_established_ style. So we have a precedent and the form the code is written
in is against the de facto usage of the compound literals.

> I guess it's personal taste but I like this version better.

In kernel we also try to be consistent. This add inconsistency. Am I wrong?

> > > +             .dev = &pdev->dev,
> > > +             .sz = 4,
> > > +             .dat = sd->gpio_pub_base + GPINR,
> > > +             .set = sd->gpio_pub_base + GPOUTR,
> > > +             .dirout = sd->gpio_pub_base + GPOER,
> > > +     };

-- 
With Best Regards,
Andy Shevchenko



