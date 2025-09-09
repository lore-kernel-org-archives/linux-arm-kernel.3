Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE19CAC58C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LeXGodOjl34EuisiTL55yimx7MElgSd/hA0MnWOCJNw=; b=4dHgBQswleODentD84mNObxzC0
	DheQ8YOhLNZoUUrSt3xfPyTuTCCk/RY7EW0rHF8wEKesGuy2EZbUQ5XN3HcqT69NrlPmPlXHKUV0G
	cEFlIvks5D+95HNoYLcJ5icHhTyQIlvPBPmPmOjvIdRJ9V+1U9EJ+ZH95plCdKDy/nXvA/wZ2VgAf
	7wKTgtCdXVG9eDGhuaSn4OPMEmCpVnGIIuC+8DrwOv+ud5tPDkPEDK54wzhAQIkWW9iTuZSwXCgnG
	Dh32vyM2SVxhDPRtNvD8eYAaxawon+8Ihq6FT8lS3CeIMiFwUIv+ANztul9gHNAZRaiqq4UheNwCT
	n/Kdyxwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw20n-00000008vZU-02u2;
	Tue, 09 Sep 2025 17:20:09 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvygo-00000007V7J-466I;
	Tue, 09 Sep 2025 13:47:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757425639; x=1788961639;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=SgpPAjADQzC6Aebwe3Gl5hrmCduvtTFHZe4sNN8KxNA=;
  b=afi/oQteyENWif8VddaYBfQQyFACWn05DsDvJmxyt7CdOUFG5woOIaQ7
   CsCKJKQHappCtoEsttNlN5cw1MXj+ukewN0YPkH5rOdMw4vbCxdWhcfla
   Wy5JcYuSTYKzl8BIk+6bSbfH8R8LubdNPEzmfKTGGcEFKEEaGs7HMxNj9
   ZEVdhRKYZ6npQvSZArj6c6BeXZJBY4Tw3R9aXT2llsUux4YKJLODKhgft
   tf5HV5wWl9/r3Lvxbuodf1lXFPY5gfST9PTPCS16wl1Lwalxa5oDzK84H
   Y1Y7azDCTFKrYoqCQhO7yBgbw6257/FTsz3fzgJLJkh8Vyu8yxMDGHyPC
   w==;
X-CSE-ConnectionGUID: KTFuYRbmQRGQGKw/KFwHvg==
X-CSE-MsgGUID: xuktrs+lTpaR7E3N8HgeFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="85156561"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="85156561"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 06:47:18 -0700
X-CSE-ConnectionGUID: aQJ5SNjrRiC9oY5or5hmCw==
X-CSE-MsgGUID: IvhvaCp3Shak7FgkN3F39Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="173207838"
Received: from smile.fi.intel.com ([10.237.72.51])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 06:47:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uvygf-00000001SBf-44Rc;
	Tue, 09 Sep 2025 16:47:09 +0300
Date: Tue, 9 Sep 2025 16:47:09 +0300
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
Message-ID: <aMAv3STeZUdSQ14p@smile.fi.intel.com>
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
 <aMAP9hAWars0T83r@smile.fi.intel.com>
 <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
 <aMAn4MM_Fs8q8qwj@smile.fi.intel.com>
 <CAMRc=Mdr4oW2d7XZ90rRr_fKC7WToz72v=_kW-s8=Urd0g8k3g@mail.gmail.com>
 <aMAve1MbONmKVjjg@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aMAve1MbONmKVjjg@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_064719_029837_94B93E80 
X-CRM114-Status: GOOD (  35.53  )
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

On Tue, Sep 09, 2025 at 04:45:31PM +0300, Andy Shevchenko wrote:
> On Tue, Sep 09, 2025 at 08:24:23AM -0500, Bartosz Golaszewski wrote:
> > On Tue, 9 Sep 2025 15:13:04 +0200, Andy Shevchenko
> > <andriy.shevchenko@intel.com> said:
> > > On Tue, Sep 09, 2025 at 01:35:04PM +0200, Bartosz Golaszewski wrote:
> > >> On Tue, Sep 9, 2025 at 1:31 PM Andy Shevchenko
> > >> <andriy.shevchenko@intel.com> wrote:
> > >> > On Tue, Sep 09, 2025 at 11:15:40AM +0200, Bartosz Golaszewski wrote:

...

> > >> > > +     config = (typeof(config)){
> > >> >
> > >> > This looks unusual. Why can't properly formed compound literal be used as in
> > >> > many other places in the kernel?
> > >>
> > >> It is correct C
> > >
> > > If it compiles, it doesn't mean it's correct C, it might be non-standard.
> > > Have you checked with the standard (note, I read that part in the past,
> > > but I may forgot the details, so I don't know the answer to this)?
> > 
> > It's a GNU extension alright
> 
> clang, I suppose, also okay with this?
> 
> > but it's supported in the kernel as it evaluates
> > to a simple cast.
> 
> There is no cast. And that's make a big difference to what the code tries to do.
> 
> > >> and checkpatch doesn't raise any warnings.
> > >
> > > checkpatch is far from being useful in the questions like this.
> > > It false positively complains for for_each*() macros all over
> > > the kernel, for example.
> > >
> > >> It's the
> > >> same kind of argument as between kmalloc(sizeof(struct foo)) vs
> > >> kmalloc(sizeof(f)).
> > >
> > > Maybe, but it introduces a new style while all other cases use the other,
> > > _established_ style. So we have a precedent and the form the code is written
> > > in is against the de facto usage of the compound literals.
> > 
> > It may not be *very* common but it's hardly new style:
> 
> I think your statement is incorrect see below why.
> 
> > $ git grep -P "\(typeof\(.*\)\) ?\{" | wc
> >     108     529    7315
> 
> Not correct. The correct output will be closer to
> 
> $ git grep -l -P "\(typeof\(.*\)\) ?\{" | wc -l
> 15
> 
> And if you looked at the output carefully, you see the bug in the RE you used.
> 
> So, even closer will be this one:
> 
> $ git grep -l -P "=[[:space:]]+\(typeof\(.*\)\) ?\{" | wc -l
> 7
> 
> 2 out of which are related to libeth, effectively makes this 6.

TBH, I think those 6 all made the same mistake, i.e. thinking of the compound
literal as a cast. Which is not!

> No, this is completely non-standard and unusual thing in the kernel.
> 
> > >> I guess it's personal taste but I like this version better.
> > >
> > > In kernel we also try to be consistent. This add inconsistency. Am I wrong?
> > >
> > >> > > +             .dev = &pdev->dev,
> > >> > > +             .sz = 4,
> > >> > > +             .dat = sd->gpio_pub_base + GPINR,
> > >> > > +             .set = sd->gpio_pub_base + GPOUTR,
> > >> > > +             .dirout = sd->gpio_pub_base + GPOER,
> > >> > > +     };

-- 
With Best Regards,
Andy Shevchenko



