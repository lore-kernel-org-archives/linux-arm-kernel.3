Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A96D2E9D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 10:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2T/WB+XZhBPXTKintlx+zeP0K3ORqyaASmQWf4CsSFY=; b=zekVpE/zagHtbJyTmyIQ1C8XDZ
	nGHOqh165Lttmz8zsMl6fwda+HseNiEsATlEvFBnWnsWW4umDyJznUnuysuir6luWwOk0Ki5eixBO
	exU+am82WpLo3eWU50FcUPm7Lt4vK0nRlQqDBsWjqjaWNxgYhIZbIMWmUt11Iwmux6afTUb6a7jwn
	xiQaNW955bQ41yhvrIiX6fBbSDo3bsNfyW2Zi4EPHNkEiBX/ZRl7k5vDN3cF86LuFebZDS0wMzdGC
	DSGQ97QorlUYsm0FCf0XQQDKnee0gz9ZNDIrdjCKmRIdW5wuaO1/IpDWzv7ug81Ab3/bb7AHGqsAN
	8RoLqPDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tARJz-0000000HE3T-0Ido;
	Mon, 11 Nov 2024 10:06:59 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tARAI-0000000HBxI-13gw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 09:56:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731319018; x=1762855018;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=2GK5P7SlkHJ5glis3DlufjM73mrDrFvZT6cGKqNJrkA=;
  b=NbnWku3IzQBxhHuK7WxAcNIeW0DK0VkknwDUsi/ro6Qfgvuf1pLzXdFV
   IRpt1rup3QuVwZ2oSmAwSN44K2BaA8d8CsN28hdCvN+oiyW4y69Ba3BEe
   CyaKGIT9dx0fT1DdwxWo0lYaPUrkgj9lwbUrh343BsjRe5Xj9ng99JJot
   B6kspaRB6Kz24Q/p1yszV8VZCmHuzRJQixZQtvjYkFhsomOjgmnGpaHoW
   eDq3ktyry0+5P3yxgWFS8oYbQ5FEDP0POxlXCqjBA7Mz8F7QAJ8zUnBbk
   azUHg726sSCugD2mAAc6axLHD4NL9+K7ob884w4t8yxlSVUvy8LOLC6mg
   A==;
X-CSE-ConnectionGUID: 5OK9y7koTHi1cl0N5Gdliw==
X-CSE-MsgGUID: crNEELNLRyy9pUWoLfigCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="30532380"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="30532380"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 01:56:57 -0800
X-CSE-ConnectionGUID: WMCZLN+uRM6Tq56sdPrgOA==
X-CSE-MsgGUID: duWXw3rnTBmNKkmytjfRPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="86787521"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 01:56:53 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tARA9-0000000DYBD-2fgv;
	Mon, 11 Nov 2024 11:56:49 +0200
Date: Mon, 11 Nov 2024 11:56:49 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 3/6] leds: gpio: Avoid using GPIOF_ACTIVE_LOW
Message-ID: <ZzHU4absCxcA1FBG@smile.fi.intel.com>
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
 <20241104093609.156059-4-andriy.shevchenko@linux.intel.com>
 <CAMuHMdXx6hYsdKo-5sw+-vH7GOJYWn_de=wSvhj1QVVpbwCN7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXx6hYsdKo-5sw+-vH7GOJYWn_de=wSvhj1QVVpbwCN7Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_015658_329634_80C5670D 
X-CRM114-Status: GOOD (  18.33  )
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

On Mon, Nov 11, 2024 at 10:45:13AM +0100, Geert Uytterhoeven wrote:
> On Mon, Nov 4, 2024 at 10:37 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:

...

> > -       if (template->active_low)
> > -               flags |= GPIOF_ACTIVE_LOW;
> > -
> > -       ret = devm_gpio_request_one(dev, template->gpio, flags,
> > +       ret = devm_gpio_request_one(dev, template->gpio, GPIOF_OUT_INIT_LOW,
> >                                     template->name);
> 
> Just wondering, as I am not 100% sure: can this change change the
> initial state of the GPIO?

You probably wonder how ACTIVE_LOW affects the OUT_INIT_LOW given above.
I have an answer to you, however I might be mistaken as well, but I spent some
time to investigate.

The above mentioned call ends up in the gpiod_direction_output_raw_commit() which
uses the value (low in this case) as an absolute value. It does not include the
ACTIVE_LOW in the value calculations. Hence, setting ACTIVE_LOW before or afterwards
has no effect on the existing flow.

If you notice a mistake, please elaborate this, so I can fix the approach!

> >         if (ret < 0)
> >                 return ERR_PTR(ret);

...

> > +       if (template->active_low ^ gpiod_is_active_low(gpiod))
> > +               gpiod_toggle_active_low(gpiod);
> > +

-- 
With Best Regards,
Andy Shevchenko



