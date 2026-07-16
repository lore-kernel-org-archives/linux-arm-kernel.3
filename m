Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A40DC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 09:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WfW1a9sdNG5oVmmekRHeZX1WU4IqAbblME+A4meJQW4=; b=u27dyBQjA6M5LEQVWaHs08EtEJ
	cgwz8tpltlc7qqLy2RxPJ8vPw3ftfjcjHARyWpZ6wWxC3YjpNrbQKFyt6QeF0967GS6M8LND5AWsf
	bSHUakWqu/ha2GVd48eAqPcbr8SR+/i8GhIZWj6fmYLgWKYOHtTK2XV11mFIt9ffOD+EIoKYlUgvh
	xVQQVtYBygKsT+YAmCSszPStGgYsDbWtpngnnEbyMX6ejyGGEwz03jA6YD5X8L5hhIdJGFl+YLvOe
	nQSR6roZdLZuRzhaclMgaOXob8abck1UECuhrfTH7o1Ve9vMEFD5b11QTsFJujLX/S9Rde/SyLGf2
	xZ9hICqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIZr-0000000GuQD-0EEa;
	Thu, 16 Jul 2026 09:40:23 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIZp-0000000GuPG-1LIH;
	Thu, 16 Jul 2026 09:40:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784194821; x=1815730821;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AjNabPt8KbtTKqTuT9NoOhSbqcJ/OKIChvyCnG26SUc=;
  b=Tl38FiyxDzGGVDSIQGKoHR+WEtesjrsmMDYU8o7pvdETmiUgwmxhQcAD
   mDA+DH22I30AU0f4ABU/dD5hcVzn2pug3Q1j9AgxlakRINdD0nbEQvfeC
   Z7PnThRBTiz1qU23+DOtrJbeoomYDWkHLWHxXahU/4maqQPGw8iut4aRO
   WHC/HQyCH1vWzhp2dP+2tNrFMnbk198ybEp9Ii3fPPsmIl9uCDtX2SC7x
   l/xJ3FDWSdqOToNkrTO8FM2QeVkGPnQ4ewT+hZytfJDQntottGc6jwZh/
   dXizACqYuBkcP63oYjg/4nXcuK37gBl8dSXurN1LsBTAaNYc3EauKJaSL
   A==;
X-CSE-ConnectionGUID: 71qjWqtQQ42lV7Xx6ffdcw==
X-CSE-MsgGUID: TYnTGK58QOePxe1HL2zEsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84963040"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="84963040"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 02:40:20 -0700
X-CSE-ConnectionGUID: IbA0Hh1qRaKPeq90gKjMig==
X-CSE-MsgGUID: bmffYRkeTyaR1Xcw/JN6WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="254696847"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.26])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 02:40:15 -0700
Date: Thu, 16 Jul 2026 12:40:12 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Michael Walle <mwalle@kernel.org>
Cc: Yu-Chun Lin <eleanor.lin@realtek.com>, Michael.Hennerich@analog.com,
	afaerber@suse.com, andy@kernel.org, brgl@kernel.org,
	conor+dt@kernel.org, cy.huang@realtek.com,
	devicetree@vger.kernel.org, dlechner@baylibre.com,
	james.tai@realtek.com, jic23@kernel.org, krzk+dt@kernel.org,
	lars@metafoo.de, linus.walleij@linaro.org, linusw@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-realtek-soc@lists.infradead.org,
	mathieu.dubois-briand@bootlin.com, nuno.sa@analog.com,
	robh@kernel.org, stanley_chang@realtek.com, tychang@realtek.com,
	wbg@kernel.org
Subject: Re: [PATCH v3 3/7] gpio: regmap: Add gpio_regmap_operation and
 write-enable support
Message-ID: <alim_HGTD5RCupav@ashevche-desk.local>
References: <d301ba0cd45d49d59e6a014188306ec9@realtek.com>
 <20260716062614.1507243-1-eleanor.lin@realtek.com>
 <aliV4u6_xzx9D9Aq@ashevche-desk.local>
 <DJZVLZ4LLD9E.3MPLYYXT1VQ9R@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJZVLZ4LLD9E.3MPLYYXT1VQ9R@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_024021_372284_EF119FF4 
X-CRM114-Status: GOOD (  18.63  )
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

On Thu, Jul 16, 2026 at 11:08:55AM +0200, Michael Walle wrote:
> On Thu Jul 16, 2026 at 10:27 AM CEST, Andy Shevchenko wrote:
> > On Thu, Jul 16, 2026 at 02:26:14PM +0800, Yu-Chun Lin wrote:

...

> > From the above list I tend to the approach 2, but this might require to have
> > GPIO regmap level of locking. I'm a bit lost in the context, though. I assume
> > we need a fresh start, id est issue a v6 with approach 2 or 3 in place and
> > summarize the choices in the cover letter, so we can understand what has been
> > considered.
> 
> I don't really like approach 3. You'd need to check if the regs of
> both xlate calls are the same. With the sample code above, you
> silently drop the first xlate'd reg.

If I rank the proposals, the worst is #1, the best is #2.

> And honestly, it really seems like a one-off. What controllers, are
> there that need a write enable bit. The real problem seems to be
> the assumption that we operate on just one bit. IOW we either set
> mask or don't set mask in gpio_regmap_set().

Yes, we should KISS.

> For a more generic solution, we should be able to control the
> written value. We could add another .value_xlate().

Maybe not now? As per IPs, Synopsys IPs (not exactly GPIO) likes to
have that kind of "protection". So, from HW perspective it's kinda
pattern, and it might be possible to see more IPs (including GPIO)
that follow it in some cases.

-- 
With Best Regards,
Andy Shevchenko



