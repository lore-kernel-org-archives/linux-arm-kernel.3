Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5E2CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RqxBp5GqUYy1vuvyW4xHhGZiROziN1Tf6UuwRZIay/o=; b=4x2mLR8zr38vepk52HiAWRuWmH
	tLYtOSaToc6qv6e22SwMy5pf2oTi6sEEqGZSc/17dZkx+eZ1ssg68BTceLsW8j1EJoOlg1nmrw6N8
	gnQHy1Eo1usZ3COFYT+GkcziTCnVzYUxoPPKKVGNK4gTi/+PIVhwekY31rk7CkywVsINPiFB8KK3W
	TZw7mjoMoDFKIemXA8hfy6DAVjzJq0e7+PNDfRjNj1SwYYGhevlU0p8Deikx2bhQrnygk6hNMbJRu
	n06ChuiJVjeS9s0TK9JORV9iO2K4XxOohCPhUD0R2v6alg7yEYUwN9u2ria2RcAbQ+QXEW7H5A/uZ
	dbUJd03w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw20q-00000008vhq-2QoB;
	Tue, 09 Sep 2025 17:20:12 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvypc-00000007YZw-2CNu;
	Tue, 09 Sep 2025 13:56:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757426185; x=1788962185;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=g/QqtRMuBql/lAp+Wpk1UAHBNS5otc0roGKqOnIPLHk=;
  b=Bd6brfpgte5USq04G7FKZeMq7ZNLex4b8+9D3MQOwTdNEw1Ln0adlycr
   oMAtN1YSDQbDy9FGLP+g6Z74QB4iSI5/u6aGWTTUDNzvy511W/V+tw4tc
   x7m2lv5fSJr/voSDsN1wrDwJEbIxl7NXYdslSLP9nCtWDgmZW30zDc9pP
   U08dY1EaJISWWZZu8N7PfLzXrl3OedUxq0xn0ScfP8edguGpPP11+p7C4
   VflN9fbtCiaS1oN/MZP23ezVyp/+dQKw7pUDxvWrLtMEX5du3C3tTefIb
   AWCbLe8t2a4h+0nJ6hwykkshhmx4vEjf4IFr+Egw0p+weCFbbl+k9gllU
   A==;
X-CSE-ConnectionGUID: 1BXFm5xRQnOg6LDboHm2Xg==
X-CSE-MsgGUID: M8Pt/czLRoy+AcnbYNw3Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="69964137"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="69964137"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 06:56:21 -0700
X-CSE-ConnectionGUID: ks5yNBpNSuKS3BFnVbhH5w==
X-CSE-MsgGUID: P7SuEn8mRlSdRZ+kBu7loA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="172963735"
Received: from smile.fi.intel.com ([10.237.72.51])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 06:56:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uvypQ-00000001UyO-2aQ3;
	Tue, 09 Sep 2025 16:56:12 +0300
Date: Tue, 9 Sep 2025 16:56:12 +0300
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
Message-ID: <aMAx_EwwBteiI9K6@smile.fi.intel.com>
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
 <aMAP9hAWars0T83r@smile.fi.intel.com>
 <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
 <aMAn4MM_Fs8q8qwj@smile.fi.intel.com>
 <CAMRc=Mdr4oW2d7XZ90rRr_fKC7WToz72v=_kW-s8=Urd0g8k3g@mail.gmail.com>
 <aMAve1MbONmKVjjg@smile.fi.intel.com>
 <aMAv3STeZUdSQ14p@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aMAv3STeZUdSQ14p@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_065624_601175_B11A51D6 
X-CRM114-Status: GOOD (  35.55  )
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

On Tue, Sep 09, 2025 at 04:47:09PM +0300, Andy Shevchenko wrote:
> On Tue, Sep 09, 2025 at 04:45:31PM +0300, Andy Shevchenko wrote:
> > On Tue, Sep 09, 2025 at 08:24:23AM -0500, Bartosz Golaszewski wrote:
> > > On Tue, 9 Sep 2025 15:13:04 +0200, Andy Shevchenko
> > > <andriy.shevchenko@intel.com> said:
> > > > On Tue, Sep 09, 2025 at 01:35:04PM +0200, Bartosz Golaszewski wrote:
> > > >> On Tue, Sep 9, 2025 at 1:31 PM Andy Shevchenko
> > > >> <andriy.shevchenko@intel.com> wrote:
> > > >> > On Tue, Sep 09, 2025 at 11:15:40AM +0200, Bartosz Golaszewski wrote:

...

> > > >> > > +     config = (typeof(config)){
> > > >> >
> > > >> > This looks unusual. Why can't properly formed compound literal be used as in
> > > >> > many other places in the kernel?
> > > >>
> > > >> It is correct C
> > > >
> > > > If it compiles, it doesn't mean it's correct C, it might be non-standard.
> > > > Have you checked with the standard (note, I read that part in the past,
> > > > but I may forgot the details, so I don't know the answer to this)?
> > > 
> > > It's a GNU extension alright
> > 
> > clang, I suppose, also okay with this?
> > 
> > > but it's supported in the kernel as it evaluates
> > > to a simple cast.
> > 
> > There is no cast. And that's make a big difference to what the code tries to do.
> > 
> > > >> and checkpatch doesn't raise any warnings.
> > > >
> > > > checkpatch is far from being useful in the questions like this.
> > > > It false positively complains for for_each*() macros all over
> > > > the kernel, for example.
> > > >
> > > >> It's the
> > > >> same kind of argument as between kmalloc(sizeof(struct foo)) vs
> > > >> kmalloc(sizeof(f)).
> > > >
> > > > Maybe, but it introduces a new style while all other cases use the other,
> > > > _established_ style. So we have a precedent and the form the code is written
> > > > in is against the de facto usage of the compound literals.
> > > 
> > > It may not be *very* common but it's hardly new style:
> > 
> > I think your statement is incorrect see below why.
> > 
> > > $ git grep -P "\(typeof\(.*\)\) ?\{" | wc
> > >     108     529    7315
> > 
> > Not correct. The correct output will be closer to
> > 
> > $ git grep -l -P "\(typeof\(.*\)\) ?\{" | wc -l
> > 15
> > 
> > And if you looked at the output carefully, you see the bug in the RE you used.
> > 
> > So, even closer will be this one:
> > 
> > $ git grep -l -P "=[[:space:]]+\(typeof\(.*\)\) ?\{" | wc -l
> > 7
> > 
> > 2 out of which are related to libeth, effectively makes this 6.

And for of fullness the picture:
$ git grep -l -P "=[[:space:]]+\(struct [^[:space:]]*\) ?\{" | wc -l
501

So, it's 1:100 ratio.

> TBH, I think those 6 all made the same mistake, i.e. thinking of the compound
> literal as a cast. Which is not!
> 
> > No, this is completely non-standard and unusual thing in the kernel.
> > 
> > > >> I guess it's personal taste but I like this version better.
> > > >
> > > > In kernel we also try to be consistent. This add inconsistency. Am I wrong?
> > > >
> > > >> > > +             .dev = &pdev->dev,
> > > >> > > +             .sz = 4,
> > > >> > > +             .dat = sd->gpio_pub_base + GPINR,
> > > >> > > +             .set = sd->gpio_pub_base + GPOUTR,
> > > >> > > +             .dirout = sd->gpio_pub_base + GPOER,
> > > >> > > +     };

-- 
With Best Regards,
Andy Shevchenko



