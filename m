Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EF9CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nWetMrUNt21ovOSJ7w/e/6SZ7KelhnhHlCJJrx1T5yg=; b=fDNdiirmhcFSoVsOQ1UkdboHf0
	HJPmAW34eGy9L9Yp6XplkJHXzl1yt62cMAEYPM0UytnV8dVCw3dZ7S/1HD15QOPNrutP9yDNMK+vd
	+Eop8X99hX0LOFrdCa24+RwgCV06xVQ+sbAH1qR55C/nHSYFcVH4Mh9OlyHfOi4/W4fmZ8ZXcuDbo
	O1CSmeXyxx3H2MxTnqEmCVURHGVcYybYocdM03sfSVKUR25QlZHRV5RnkAW5DzlQzMclmtv5ltX+N
	BHVjI3giiihrHQB5UWLQwnS7GvmE1ba6VmtrVMIhNGqyIX9/Wzd6JacBY/ClmuUMfhMGcRZCd/Vkg
	dxfweEOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw20W-00000008v7k-07Gb;
	Tue, 09 Sep 2025 17:19:52 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvyfG-00000007Uhh-3ikN;
	Tue, 09 Sep 2025 13:45:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757425543; x=1788961543;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=cuvp1jqzP0KmBIeFPlYIHdueAMSWUkXNMbTb2SDREqQ=;
  b=UonzozE+plb8Cdd4HIY75ymdSUXVW4NlJt2uN5xOC/5YGjBCWFoFv/1f
   lFmmP80YSMsI6Xz0FyRVcnepwxnu8TxjVjDfEXYwo8SR2Oc3BDs01hy0Z
   Hk8Ugx4/vaRjvovXvV8PeUJbrtxqLvawUzMsOdHZI21B+Gu0YB4LUUm1b
   xIc14e+4nxXzUjJsqmpCUSPlCi4J/PhSMdodeqRMtY3fOhnsVeRW53Pe4
   Cgo+V0SeFJ4Mrl1PaKk1mpH7nguZZ6NGupXBeDZScJix8tDkp4kA8OIY1
   3t3NcYqDhW8WIzNjucmsqHN3EGKURnrtpqBrgp3lpnSQawnYPbK4YxKU7
   A==;
X-CSE-ConnectionGUID: 1je0Mm8BQJyKXYsM0fzzmQ==
X-CSE-MsgGUID: K8Dy0YV/ROafaNPd93OvHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="77320978"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="77320978"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 06:45:40 -0700
X-CSE-ConnectionGUID: YelEPzAPTVimIapPXZjDQA==
X-CSE-MsgGUID: DSSZAarXTPmifkvXgS2MQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="177436591"
Received: from smile.fi.intel.com ([10.237.72.51])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 06:45:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uvyf5-00000001S9X-2kkM;
	Tue, 09 Sep 2025 16:45:31 +0300
Date: Tue, 9 Sep 2025 16:45:31 +0300
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
Message-ID: <aMAve1MbONmKVjjg@smile.fi.intel.com>
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
 <aMAP9hAWars0T83r@smile.fi.intel.com>
 <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
 <aMAn4MM_Fs8q8qwj@smile.fi.intel.com>
 <CAMRc=Mdr4oW2d7XZ90rRr_fKC7WToz72v=_kW-s8=Urd0g8k3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mdr4oW2d7XZ90rRr_fKC7WToz72v=_kW-s8=Urd0g8k3g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_064542_941355_29B91281 
X-CRM114-Status: GOOD (  29.99  )
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

On Tue, Sep 09, 2025 at 08:24:23AM -0500, Bartosz Golaszewski wrote:
> On Tue, 9 Sep 2025 15:13:04 +0200, Andy Shevchenko
> <andriy.shevchenko@intel.com> said:
> > On Tue, Sep 09, 2025 at 01:35:04PM +0200, Bartosz Golaszewski wrote:
> >> On Tue, Sep 9, 2025 at 1:31 PM Andy Shevchenko
> >> <andriy.shevchenko@intel.com> wrote:
> >> > On Tue, Sep 09, 2025 at 11:15:40AM +0200, Bartosz Golaszewski wrote:

...

> >> > > +     config = (typeof(config)){
> >> >
> >> > This looks unusual. Why can't properly formed compound literal be used as in
> >> > many other places in the kernel?
> >>
> >> It is correct C
> >
> > If it compiles, it doesn't mean it's correct C, it might be non-standard.
> > Have you checked with the standard (note, I read that part in the past,
> > but I may forgot the details, so I don't know the answer to this)?
> 
> It's a GNU extension alright

clang, I suppose, also okay with this?

> but it's supported in the kernel as it evaluates
> to a simple cast.

There is no cast. And that's make a big difference to what the code tries to do.

> >> and checkpatch doesn't raise any warnings.
> >
> > checkpatch is far from being useful in the questions like this.
> > It false positively complains for for_each*() macros all over
> > the kernel, for example.
> >
> >> It's the
> >> same kind of argument as between kmalloc(sizeof(struct foo)) vs
> >> kmalloc(sizeof(f)).
> >
> > Maybe, but it introduces a new style while all other cases use the other,
> > _established_ style. So we have a precedent and the form the code is written
> > in is against the de facto usage of the compound literals.
> 
> It may not be *very* common but it's hardly new style:

I think your statement is incorrect see below why.

> $ git grep -P "\(typeof\(.*\)\) ?\{" | wc
>     108     529    7315

Not correct. The correct output will be closer to

$ git grep -l -P "\(typeof\(.*\)\) ?\{" | wc -l
15

And if you looked at the output carefully, you see the bug in the RE you used.

So, even closer will be this one:

$ git grep -l -P "=[[:space:]]+\(typeof\(.*\)\) ?\{" | wc -l
7

2 out of which are related to libeth, effectively makes this 6.

No, this is completely non-standard and unusual thing in the kernel.

> >> I guess it's personal taste but I like this version better.
> >
> > In kernel we also try to be consistent. This add inconsistency. Am I wrong?
> >
> >> > > +             .dev = &pdev->dev,
> >> > > +             .sz = 4,
> >> > > +             .dat = sd->gpio_pub_base + GPINR,
> >> > > +             .set = sd->gpio_pub_base + GPOUTR,
> >> > > +             .dirout = sd->gpio_pub_base + GPOER,
> >> > > +     };

-- 
With Best Regards,
Andy Shevchenko



