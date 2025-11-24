Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFE3CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 15:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lzXuO2TRkX2WaA9HxBGa/59lCXCvjEgTD5n/DbFArrY=; b=1p+4uLFfRIxCFO3vceBLX25ywo
	LfjQfmTiTNaWnqCQNvFc0ImwmvtGSWZDx6CGRuw8Fzu0Tqlv8EfhUtMj1vJjmitws4xJn+05XydPW
	Q54wc8JAZqUy8iLCd4tALOI5qd6U9Qx2qZb9naWJ+FLPa+3uCUvKDoeKA/2h/MFahXCMgRKArOHYZ
	AyWTf9hupsXsf1ovXUI4+GNuY7QJB+yW7wRsdjTYz0L+PKkMBMCWdeVcgFpqx5h4R8CvDUUX/rfuk
	2EHzVU9yaV9BJP+dQi6L415sClOiJlvoCWHTS6RaBmEP+dX7QbV54fW+4A0zjp4w8G4hbhFkignEy
	sXi9TeUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNYJr-0000000Bu0n-2b3N;
	Mon, 24 Nov 2025 15:17:35 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNYJn-0000000Bu04-46B2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 15:17:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763997452; x=1795533452;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=x0uOwhcgX62MgVEbKMaR1GMOYL/hXhDCZZRQClzW0lo=;
  b=Ui+1JsryRAhhSP7AdEtiaprPKk9Ko+IIYHEJs6zO+/T/34aUEX2vKQ2X
   xrRII4UYZcv1/3QmY0qxM5GZN2gGD3PuPOUaIYC73ULOE8KjKv6bEw4Mc
   xSguHm4suSOELiy0flskWL6DsE01Jugr51wZ0tOsb7aamCiIZqvoMJ092
   KvZpuZI+FUfV/uEtSZ09I7UOprn8xXP1FLiilv38F45HmJ+GkVDvLEsQ5
   Dw0ceAQCYzFQCCye62ohdvsAcjBsqtSAJ4uSgNY/tZQ0iP8k5mmjvJui4
   FpSLdc/KvEqle93G0dZPTTUjuE43Swh9FLVk6lB9rPuHsEaGV++ymKMvt
   A==;
X-CSE-ConnectionGUID: ptyAKxsZSfCbjV89PD7x5g==
X-CSE-MsgGUID: Y6W6UH2zQ5OevnRDc795FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65948993"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="65948993"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 07:17:32 -0800
X-CSE-ConnectionGUID: QCjIeMmcS0C86okVtibT9w==
X-CSE-MsgGUID: G19QPtMhR6GW1RhWgN4a/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="193147709"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.5])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 07:17:25 -0800
Date: Mon, 24 Nov 2025 17:17:23 +0200
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
Message-ID: <aSR3AwjQnB6EH7Nv@smile.fi.intel.com>
References: <20251124002105.25429-1-jszhang@kernel.org>
 <20251124002105.25429-3-jszhang@kernel.org>
 <CAOiHx==ttP2T=VLsSE9nLr5Cai_D+Khr6ePJVdOEim8ThWSdmA@mail.gmail.com>
 <CAHp75VcRWODpL2DjAiPm0=bhTJfjs6RdNgtroRbvEW7ong3ALg@mail.gmail.com>
 <CAOiHx==5TkW_-3yoqN_MzhdLKbMFvXRj-pWpuS5ahTM_ccVekw@mail.gmail.com>
 <aSRwXCfG1RimQZxX@smile.fi.intel.com>
 <CAOiHx==4NSMNVdW163nE-vYf_FtDjS5aHfj5chPr3n6D2Mt9Nw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOiHx==4NSMNVdW163nE-vYf_FtDjS5aHfj5chPr3n6D2Mt9Nw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_071732_059714_0E65DCF7 
X-CRM114-Status: GOOD (  28.23  )
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

On Mon, Nov 24, 2025 at 04:05:29PM +0100, Jonas Gorski wrote:
> On Mon, Nov 24, 2025 at 3:49 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Mon, Nov 24, 2025 at 03:20:00PM +0100, Jonas Gorski wrote:
> > > On Mon, Nov 24, 2025 at 2:52 PM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > > > On Mon, Nov 24, 2025 at 2:40 PM Jonas Gorski <jonas.gorski@gmail.com> wrote:
> > > > > On Mon, Nov 24, 2025 at 1:39 AM Jisheng Zhang <jszhang@kernel.org> wrote:

...

> > > > > >  static const struct dev_pm_ops brcmstb_gpio_pm_ops = {
> > > > > > -       .suspend_noirq  = brcmstb_gpio_suspend,
> > > > > > -       .resume_noirq = brcmstb_gpio_resume,
> > > > > > +       .suspend_noirq = pm_sleep_ptr(brcmstb_gpio_suspend),
> > > > > > +       .resume_noirq = pm_sleep_ptr(brcmstb_gpio_resume),
> > > > > >  };

...

> > > > > > -               .pm = &brcmstb_gpio_pm_ops,
> > > > > > +               .pm = pm_sleep_ptr(&brcmstb_gpio_pm_ops),
> > > > >
> > > > > won't this cause a "brcmstb_gpio_pm_ops is unused" compile warning for
> > > > > !CONFIG_PM_SLEEP?
> > > > >
> > > > > You probably need to add a __maybe_unused to brcmstb_gpio_pm_ops
> > > > > (which incidentally DEFINE_NOIRQ_DEV_PM_OPS() also doesn't set, but
> > > > > all other *_DEV_PM_OPS() macros do).
> >
> > Do they? I mean the modern ones and not that are deprecated.
> >
> > > > Shouldn't it be covered by the same trick as pm_sleep_ptr() does for functions?
> > >
> > > pm_sleep_ptr() becomes NULL for !CONFIG_PM_SLEEP, so there is no
> > > reference then anymore to brcmstb_gpio_pm_ops. You would need a
> > > wrapper for brcmstb_gpio_pm_ops itself to conditionally define it to
> > > avoid the warning, or add __maybe_unused to it to silence it.
> >
> > PTR_IF() magic is exactly to make sure compiler will have a visibility while
> > dropping a dead code. Did I miss anything?
> 
> No, I just was working with old assumptions, so my bad. I faintly
> remember that they used to work that way, but maybe I also
> misremember. TIL. So disregard my comment.

NP. I'm glad everything is clear now about them.

> > > Note how SIMPLE_DEV_PM_OPS() and UNIVERSAL_DEV_PM_OPS() tag the struct
> > > with it (for that reason I assume).
> >
> > Both are deprecated. Not a good orienteer.
> > None of the new approach uses __maybe_unused. (See DEFINE_*() macros in pm.h.)
> 
> Maybe that some were using it was confusing me into thinking it is required.

-- 
With Best Regards,
Andy Shevchenko



