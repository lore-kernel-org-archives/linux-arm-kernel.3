Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D65C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 09:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aIOs4RJPLVfo05RoQZB320baE7NU/3fmfnl7KCa6RGw=; b=z0A0cq6y8Mppc27+3FziIiImRY
	iFwTvjGrTZYySGoUucwkJQLUCgPzR1fN/SqrC/BQowmWVwVgyN3qnwHjKKWXRDoT/WQEx+rayww4U
	UZMJwD3inIbUyAiQ7PlvsBrXMMlE8fJi/mNCcOcwDxWzfZdaipGpQO8SqTn0g+vwAQgrWuoJHLBw6
	hNIFSkrUSXaxlPL2FnDOKkKOvk29Al+JzD06i4JHAcqfDmNT1a9AUFiW7nlEH1dUqTg+6nLwpVMoi
	NlNDo3dpEfSKYYTlqxRLe316HtCoVwcOAi/pLEiN+0XcNSmbpto/IwDkXC0ImQmY9qXizCtyhRK6K
	pP2gAb6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4bAD-0000000Du5U-2lfj;
	Thu, 10 Sep 2026 09:33:49 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4bAB-0000000Du53-2x0x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 09:33:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789032827; x=1820568827;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1em9aq9gzUl+zPgBvcxhxZd9TdbDXSqR40mgmMVYAMA=;
  b=a36xHx5/Ty8eIPvgd8+/VSY9WCRJ0xx/3ekBginnroJbKlfEVtTRVCyk
   wWNvo+uVXuAiNxnSPgzfmsq1DuBWwgctZnGAJMH5o21QzXY3/lzZWUJUe
   p9pyMfj0vyoc8m6iwbmHid+RbUZ+a1AacD3zG8ub6S6QhoaXbd4RXsCLD
   Pg6WztGfQH4XEGUqslw0juoTpSim0hIJHsxVXqmCntZLTT4ugCMw5k1JK
   XoK4IXPbKiu2on7CUcYWh8jCaojsnqlA91d1bFXzadbJCWDMLtZehiSwV
   4ygdB5B9geTkbVG19bF64yTT7wzrxhMff5wxi2m9uYU3EZX42zEUullFQ
   A==;
X-CSE-ConnectionGUID: OwrO9KUSSDCbqw+m3r9h0w==
X-CSE-MsgGUID: KbtvmXBqQxSuQuEwkbyAMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="91992597"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="91992597"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 02:33:47 -0700
X-CSE-ConnectionGUID: FZK/4208RgGo59/IgLKZMw==
X-CSE-MsgGUID: T3eFll+kTeyXwnB5iRtisw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="275733812"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.177])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 02:33:44 -0700
Date: Thu, 10 Sep 2026 12:33:42 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mark Brown <broonie@debian.org>
Cc: Lukas Wunner <lukas@wunner.de>,
	"Shih-Yuan Lee (FourDollars)" <fourdollars@debian.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v16 5/7] spi: pxa2xx: disable DMA for Apple MacBook8,1
Message-ID: <aqJ5dqLKht5ezDw1@ashevche-desk.local>
References: <CAAT15mPuO71WbbS2ZpWjceCVj3FUTqHLi3wbbeV7B33JHbPRsQ@mail.gmail.com>
 <CAAT15mPrwAqLmFVF730G+iJugzNzaT=HDj_7G5-wXbhBNU7ANg@mail.gmail.com>
 <f7449a69-98e3-41c0-b535-847b8c520e10@sirena.org.uk>
 <CAAT15mNppZ6nPQ9a8Hp54XK4BXndfv+G24n4VeQ1X8GOk6fSyQ@mail.gmail.com>
 <CAAT15mMc73=cnqx7jvPXWjVUuzr-E54qh5+BR3d_G6m3NoXrng@mail.gmail.com>
 <al_ZlTkEUHj-X1YS@ashevche-desk.local>
 <CAAT15mMaZWdkp9YRKvRDRw-WCA-4nWGGo8gge=D7oBKUr1yysw@mail.gmail.com>
 <amYya_hiHM6lrxTX@wunner.de>
 <ampdJY4LcP6Qc1de@wunner.de>
 <c05bb236-5aa2-4050-a030-8caed6d47a40@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c05bb236-5aa2-4050-a030-8caed6d47a40@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_023347_750785_C4DD8C28 
X-CRM114-Status: GOOD (  23.11  )
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

On Wed, Jul 29, 2026 at 09:21:41PM +0100, Mark Brown wrote:
> On Wed, Jul 29, 2026 at 10:05:57PM +0200, Lukas Wunner wrote:
> > On Sun, Jul 26, 2026 at 06:14:35PM +0200, Lukas Wunner wrote:
> 
> > > I'm not sure why Apple chose to keep the DMA controller in reset,
> > > but have you explored enabling it on boot?
> 
> > Thinking about this some more and after taking a look at
> > drivers/input/keyboards/applespi.c, I realize messages exchanged via SPI
> > are always 256 bytes in size.  That's not a whole lot, and of course
> > messages are only exchanged when a key is pressed or the trackpad is
> > used.  So perhaps Apple determined that sending this in PIO mode is
> > ultimately more efficient than keeping a DMA engine powered on all the
> > time.  The CPU load saved through offloading the SPI transfer is offset
> > by having to program the DMA engine for each transfer.
> 
> > So perhaps usage of PIO mode was indeed an intentional choice by Apple
> > and need not be second-guessed.  I'm not sure.
> 
> DMA can also add extra latency with interrupt handling, it's possible
> someone decided to trade some CPU time for minimal latency (though you
> could probably arrange for shorter messages...).

Okay, so let's go with the disabled DMA approach, but this will need
a good commit message and a big comment in the code explaining all findings
and some kind of summary of this discussion(s).

-- 
With Best Regards,
Andy Shevchenko



