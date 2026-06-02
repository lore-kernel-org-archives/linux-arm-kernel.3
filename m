Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3BCCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 18:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Qi4hctMgmNqW61/GKd2dv/NNcatPMu/m/6W8sA+a8M=; b=dp7qpcqF7kD22ROhpOVLCi25cs
	zb7eGKyJMosahhlc4Xh/hjs1bftfbdw4b3JI8k5qwlZ06ckONUpq0XXh8ru0hge77IwxJg4JcLeR9
	gU2Z6600V2oFHBqILt09B4n6B2CuNHue7oH/+lHCqMzHlHS6ASZNopwcsDeW/4t1dLLdZDzgZ2iWL
	igGBv2V8+d14bkbM2cxbKr3aS1bTU7wGUs79wJ2zPT6RulzJdEQwKvxhr7t0uhtWkL6XE98rUMXTX
	9PmIUIw+IRmRO9P3sn0JkYtV0RZ/q7y/K1sI7l9kCMN739Zq5PwOD0GD5j5bx9leHO8P1qnL8HVqH
	fbP/ta3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUTqD-0000000DdnC-3eqh;
	Tue, 02 Jun 2026 18:27:53 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUTqB-0000000Ddmq-3rtD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 18:27:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780424872; x=1811960872;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=JAKACGblmVp0qOtTpZKUe7ENVsK0mSqAwKq+52Y/t/s=;
  b=V/6m9eMqhQhUBe5ipYuYN/xLB8aEie+jT3v4YknfBO5z3ZiBmpPsfk0k
   H7QQQEwf43xopyiDEEhn4/fJMCaRJ1hjMJjaxBN6hSWdkwQd0bDbJQ2j8
   Fe/LSVj5lk859iEfKg1cfvA0FdOxFR5ru3uiGcGKhLTRe+3u05anGCqq+
   qtlCNVXN8dz6RB8Qzv4qlKnUn2A9/ofmdbHrHbnUpeE6RhGVeq07vtK+G
   XuCCm2k3qPs/UsrJJyWH/knmIAPNFjr8hpwf4dniE9p2kuKz37Y1xuXwS
   ome5jQTZTnej80UIHx2k1zACCdnzmYfrHTcOCS0yrTgaWOmJ7ZZ+NLsMO
   w==;
X-CSE-ConnectionGUID: d/ufY6gYTQC09oY8mpLlog==
X-CSE-MsgGUID: tbX3boshReC2dPvWRWZcoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81348609"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="81348609"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 11:27:49 -0700
X-CSE-ConnectionGUID: X7dJPcHIRBuGkxCgZ6zc6A==
X-CSE-MsgGUID: f3PWSRppTeGC+zCSm+pprg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="237634600"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.229])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 11:27:46 -0700
Date: Tue, 2 Jun 2026 21:27:43 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Angelo Dureghello <adureghello@baylibre.com>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>,
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH v2 11/11] iio: dac: add mcf54415 DAC
Message-ID: <ah8gn3g3_-cY1kbQ@ashevche-desk.local>
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
 <20260513-wip-stmark2-dac-v2-11-fcdae50cf51a@baylibre.com>
 <agTe7vZ94DnmD4Ed@ashevche-desk.local>
 <CALSJ-wBbjwrhTEpfKm-JHox7-E1YRQ=kTj1JN+KyiucTTu7c3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALSJ-wBbjwrhTEpfKm-JHox7-E1YRQ=kTj1JN+KyiucTTu7c3A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_112751_995775_BD5D811E 
X-CRM114-Status: GOOD (  19.26  )
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

On Thu, May 21, 2026 at 05:14:07AM -0700, Angelo Dureghello wrote:
> On Wed, May 13, 2026 at 11:28:30PM +0300, Andy Shevchenko wrote:
> > On Wed, May 13, 2026 at 11:14:35AM +0200, Angelo Dureghello wrote:

...

> > > +struct mcf54415_dac {
> > > +	struct clk *clk;
> > > +	struct regmap *map;
> >
> > I believe that regmap pointer is used more often, can you check with
> > bloat-o-meter that swapping these two (by the order) gives any benefit in
> > object size?
> >
> 
> checking size in ColdFire arch with last kernel.org gcc had no benefit,
> anyway put regmap before

Thanks for checking.

> > > +};

...

> > > +		return dev_err_probe(dev, PTR_ERR(regs),
> > > +				     "failed to get io regs\n");
> >
> > One line.
> 
> i decided to stay inside 80 in all the file, is it ok ?

It's fine, but for trailing string literals like this the limit was lifted more
than ten years ago. I leave it to the maintainer.

...

> > > +		return dev_err_probe(dev, PTR_ERR(info->clk),
> > > +				     "failed getting clock\n");
> >
> > Also can be a single line, but this one a bit longer than above, gives
> > 88 characters.
> 
> same as above

Ditto.

-- 
With Best Regards,
Andy Shevchenko



