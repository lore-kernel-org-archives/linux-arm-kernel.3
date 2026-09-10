Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762E6C79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 15:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=grO+vlskE89YpiXuyF5nypStwXXQYdebXzjI4gldbPg=; b=nNa8Tb+m4S9JXqDsMhoB/Up9AP
	ByImgQY/kgrXt3Pcfo2WKGlyYnammuFojupvQ1kPkCoLXLhrBHd4yj4DGYzqEemVvgE3Qtfs28UdY
	Z6BbFXzgC0p2CTmJI7HURHyMd16wWT4KK63d0hoQD4Wo/tR01jdEVivXmVS2iRC8EpbdblYW5u7r7
	nyJAOYIGzbJ7MaOUu0iETxC6hEos5nokYnfunVTBG8FLdli8XuAvj0RT/cUVvV8ycCuQAbfEKgQaf
	vgsKx4lF1fVgFoQtRZ/FWzV+GXNQ6aI/E5ZCbMevwgwlo/Mi+c5dmXDKpmsDHqDA5SeK0s9FdpoPR
	n1rEWQnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gsV-0000000EpPf-2l7O;
	Thu, 10 Sep 2026 15:39:57 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gsT-0000000EpOv-19Y3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 15:39:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789054793; x=1820590793;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=UpL9Fn4FfEESsjV6cdJwzM2nTUnP2+hidnKRviHWIBQ=;
  b=KhSBJmbS7SkjbNjq59aRBDNkPtFWNcETFnRllKVx81Df8QsfNtQ4n8xV
   bBMjF44hGZgOtyq+ezgWwqmxaa0BN/Zu9Wmam3UFn2R3q/+lMFh0NbNCJ
   gNmhbjqLESPxd0HrUHbmfTA331uaDf0YNRLQPiQy6P7F7lwVNhe359wfL
   Ne8JbJ3oEH799lqMubfbEyVc+xU1tvHjysHg0BcV2czXDvo3ADoFFXMV4
   cGZlZ9k7J8JX4xy3HZ692ZRjsQLDWFOUp3b+D7VOlTBA2Yy5ZvFFqF1ve
   BQd7fKKw8VCE8NqhUpiWun92PfRTMmDewJuiX4XWjCpU1nKo+HaO7wGES
   g==;
X-CSE-ConnectionGUID: +GjJMY74S2qXd43W227FIQ==
X-CSE-MsgGUID: l3QZRgpnT3iAsgkBqIVTUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89271664"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89271664"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:39:52 -0700
X-CSE-ConnectionGUID: pwE6b1uxSfylZKhdjLrIUQ==
X-CSE-MsgGUID: o7PHWUCcTUm2vIiLKEoEig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="267395256"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.177])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:39:46 -0700
Date: Thu, 10 Sep 2026 18:39:43 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: zl020895 <zl020895@163.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	longzhao@ambarella.com, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-serial <linux-serial@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: Re: Re: [PATCH v6 11/13] serial: 8250_dw: add Ambarella CV75
 quirks
Message-ID: <aqLPP35Y7zmDuyP5@ashevche-desk.local>
References: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com>
 <20260904-cv75-v5-v6-11-e918514cb3b1@ambarella.com>
 <aqJrSnr0rwv4BOJ3@ashevche-desk.local>
 <122573f8.8232.1a08a9765fc.Coremail.zl020895@163.com>
 <aqJ35vMBiBZo2iUE@ashevche-desk.local>
 <b199eb38-b1a2-4db6-81d8-37bab09a75b7@linux.intel.com>
 <55b27872.8ed9.1a08ab55a52.Coremail.zl020895@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <55b27872.8ed9.1a08ab55a52.Coremail.zl020895@163.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_083953_346477_0529DBDE 
X-CRM114-Status: GOOD (  20.55  )
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

On Thu, Sep 10, 2026 at 05:45:36PM +0800, zl020895 wrote:
> Hi Ilpo, Andy,
> 
> I'll go with the simple comment:
> 	/*
> 	 * Ambarella keeps variant IER bits (e.g. ETOI) set for correct RX
> 	 * timeout behaviour.
> 	 */
> 	up->ier |= d->pdata->ier_mask;


Works for me.

> At 2026-09-10 17:33:38, "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com> wrote:
> >On Thu, 10 Sep 2026, Andy Shevchenko wrote:
> >> On Thu, Sep 10, 2026 at 05:12:52PM +0800, zl020895 wrote:
> >> 
> >> > > Wondering if we should undo this in the port's .shutdown() callback.
> >> > I saw the shutdown path already covers it: dw8250_shutdown() calls
> >> > serial8250_do_shutdown(), which does
> >> > 	up->ier = 0;
> >> > 	serial_port_out(port, UART_IER, 0);
> >> > so both the IER shadow and hardware IER are cleared, including ETOI.
> >> 
> >> Depending on the answer to Ilpo the enabling may need an updated comment
> >> summarising the above.
> >
> >I'd prefer removing the entire "Force them ..." sentence, it feels really 
> >basic detail about how ->ier works. I believe that would resolve your 
> >concern if relates to what shutdown does for the flag (clears it while 
> >the comment as is says nothing is supposed to clear it).
> >
> >> > At 2026-09-10 16:33:14, "Andy Shevchenko" <andriy.shevchenko@linux.intel.com> wrote:
> >> > >On Fri, Sep 04, 2026 at 02:38:18PM +0800, Long Zhao via B4 Relay wrote:

...

> >> > >> +	/*
> >> > >> +	 * Ambarella keeps variant IER bits (e.g. ETOI) set for correct RX
> >> > >> +	 * timeout behaviour. Force them into the 8250 IER shadow so later
> >> > >> +	 * generic IER updates do not clear them.
> >> > >> +	 */
> >> > >
> >> > >Wondering if we should undo this in the port's .shutdown() callback.

-- 
With Best Regards,
Andy Shevchenko



