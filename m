Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E708CFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 14:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l7HMiba4iownNOE0aeInnY78R6Le/MV1zYBiHgALvKU=; b=GLh843FGPaN6N9tlmPZukiCbwO
	8cNWM5O8zDw1A7T24ocEZr2sHE/Rk1zmn6U7ISLzZW4VB0baAIU8fQ04L6hZHm2zGIvZDMqZ8f5RN
	HUUvw1cKolyymLBB5v3YlXKQkjReh7Upmqb7iXE/44BwGQuUIoAAFkUgWWFDSY3VjGN4GxOiaPK5Q
	cTIC8f2ZOL5qOfrtqcrOt4U5PXuHnOdLe3JemH86ISudUo2qwqjNMG3mEeeJ87u6a2tRI3GBn7OIS
	oI2E4b5cVlTBY6/DF2yGi8b1kOtbk/BVtXxd1Dp1uCzS4+sY0x9q9u/h4stPbjdhhSj27sesWp7Jp
	HEmUqvjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNXsO-0000000Bs6L-2D3M;
	Mon, 24 Nov 2025 14:49:12 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNXsL-0000000Bs5r-10Hj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 14:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763995749; x=1795531749;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=LNf4WNIHIFdssBgMpM3fnvo7unwtTh5Go5hNJc/SF7k=;
  b=M2U0TgBOImJCIdtBZwS9GzdLS2cdsVsfgo8gZsnnPIG03AK9QiPfOWTl
   oT3DvRfnsw5I36/IuvSZmk8+CvSMZC0G13j7ZsZfpy1vNWd4CzB2Q/sb6
   BHDiwhW9nqargLeJCvo8lT7UMgB+0nWx3CAFJN2/WDvPQ5fnUBGSKd818
   ywlnSi/MszuDqMuBeE7nTfV5501/qj8/Ua4FxspfT1sqZk7OHLS041t/J
   eBxQY8OemqqNiATvJhHywObu5Cxjwlh7VaCKk5Sy28dqxDJqulq4UDs1F
   QiKnqPpyZL4U7pA3748JG3VCUWyU8sjMx/eTZ/SOmJD78+I3dMpDxUE/+
   w==;
X-CSE-ConnectionGUID: EPOWWeKfSxCM3WCH/nRD+Q==
X-CSE-MsgGUID: yo5F4LR1TEG363LPg8FTWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="64996486"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="64996486"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 06:49:08 -0800
X-CSE-ConnectionGUID: GBdErrPpTACXKcxnLzLfgw==
X-CSE-MsgGUID: Mi0Pd/9wRjyTH3ysTkVOhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="192815282"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.5])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 06:49:03 -0800
Date: Mon, 24 Nov 2025 16:49:00 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>, Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>, Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH v5 02/14] gpio: brcmstb: Use modern PM macros
Message-ID: <aSRwXCfG1RimQZxX@smile.fi.intel.com>
References: <20251124002105.25429-1-jszhang@kernel.org>
 <20251124002105.25429-3-jszhang@kernel.org>
 <CAOiHx==ttP2T=VLsSE9nLr5Cai_D+Khr6ePJVdOEim8ThWSdmA@mail.gmail.com>
 <CAHp75VcRWODpL2DjAiPm0=bhTJfjs6RdNgtroRbvEW7ong3ALg@mail.gmail.com>
 <CAOiHx==5TkW_-3yoqN_MzhdLKbMFvXRj-pWpuS5ahTM_ccVekw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOiHx==5TkW_-3yoqN_MzhdLKbMFvXRj-pWpuS5ahTM_ccVekw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_064909_334881_AE15589E 
X-CRM114-Status: GOOD (  20.03  )
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

On Mon, Nov 24, 2025 at 03:20:00PM +0100, Jonas Gorski wrote:
> On Mon, Nov 24, 2025 at 2:52 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Mon, Nov 24, 2025 at 2:40 PM Jonas Gorski <jonas.gorski@gmail.com> wrote:
> > > On Mon, Nov 24, 2025 at 1:39 AM Jisheng Zhang <jszhang@kernel.org> wrote:

...

> > > >  static const struct dev_pm_ops brcmstb_gpio_pm_ops = {
> > > > -       .suspend_noirq  = brcmstb_gpio_suspend,
> > > > -       .resume_noirq = brcmstb_gpio_resume,
> > > > +       .suspend_noirq = pm_sleep_ptr(brcmstb_gpio_suspend),
> > > > +       .resume_noirq = pm_sleep_ptr(brcmstb_gpio_resume),
> > > >  };

...

> > > > -               .pm = &brcmstb_gpio_pm_ops,
> > > > +               .pm = pm_sleep_ptr(&brcmstb_gpio_pm_ops),
> > >
> > > won't this cause a "brcmstb_gpio_pm_ops is unused" compile warning for
> > > !CONFIG_PM_SLEEP?
> > >
> > > You probably need to add a __maybe_unused to brcmstb_gpio_pm_ops
> > > (which incidentally DEFINE_NOIRQ_DEV_PM_OPS() also doesn't set, but
> > > all other *_DEV_PM_OPS() macros do).

Do they? I mean the modern ones and not that are deprecated.

> > Shouldn't it be covered by the same trick as pm_sleep_ptr() does for functions?
> 
> pm_sleep_ptr() becomes NULL for !CONFIG_PM_SLEEP, so there is no
> reference then anymore to brcmstb_gpio_pm_ops. You would need a
> wrapper for brcmstb_gpio_pm_ops itself to conditionally define it to
> avoid the warning, or add __maybe_unused to it to silence it.

PTR_IF() magic is exactly to make sure compiler will have a visibility while
dropping a dead code. Did I miss anything?

> Note how SIMPLE_DEV_PM_OPS() and UNIVERSAL_DEV_PM_OPS() tag the struct
> with it (for that reason I assume).

Both are deprecated. Not a good orienteer.
None of the new approach uses __maybe_unused. (See DEFINE_*() macros in pm.h.)

-- 
With Best Regards,
Andy Shevchenko



