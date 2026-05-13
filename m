Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39E6CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 21:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VZc3x1onPlaeGznTxMN1bb6JXc6Uk+UXj7ekUJ2LC04=; b=dLHh2zL5tS9Tpa0ICt0IA6oz/C
	Stsu1GxItqs1/pKlM0lWHmNFty1ERQJSeTDSq57+gcsolJuQY4XjgwOF1IvmsWN/jxhwghWGbRqvP
	kop+jhKnUB87oTFAelcBEu7DfqeBvkCY8aWEWvh9fLa2+dsZdQJ8A5zSG3gtPhDtGfkQgcNhlKGc8
	dRX3bfgMA3BGX5yX8hAi+Oia94Pk1L0slmAH4pAhQRg2CEDYeOOUL0B8KuGXX4UVK/T3jzxjJ8KHQ
	RupJ6Do1CzQQ9Q1Ul7Xroa0k+8lSHD5imobJ/cLHPdduYwSNxZrQEFEwu56xBo9Er02L3thHexk/0
	PeMjEKqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNHE2-00000003ptw-3dtR;
	Wed, 13 May 2026 21:34:42 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNHE0-00000003psv-15Ic
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 21:34:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778708080; x=1810244080;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=kZcChJqREVkQQHEf+Cv+4DLUKpU/qmqpFtGEeNeoxC8=;
  b=KIOo5nBXZvoaSHI1oNjSuDatwn2iHnw1oa+0zi7h15sPPohlH4j+bbEv
   uZE/R6TrHdSfSHD5Qd3X5ABIIq73GQDmsF8jfGT5io3zCzZd15pzMBA1H
   25ph0gZnRKw685afoxd1ElXAX/2P9r5eD4OjFh5FUi7oDoPxvo/K6yt0Q
   917m7aoUdV97pLjlvBeqC3AdvkDqUKEqq0OO1x6vRpvRP2GSl7s5zVoLm
   S5GHFukt0Lh9W+52gQtp6o3C7o7qLHlncU2PLsdGFHRZ5dbY+mwLT6znV
   JtFhXdCSDTjKPydoRTHQe0nm0s5WDAC/SEGV56msiKQ8KmrCqG2OG3n3i
   w==;
X-CSE-ConnectionGUID: 45/Tqm/pR4Op21aVYeec0w==
X-CSE-MsgGUID: bPmHc6RZRXe+cbQnz26DHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="97072920"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="97072920"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 14:34:39 -0700
X-CSE-ConnectionGUID: EhQxfke0QaawRfntB0aqog==
X-CSE-MsgGUID: rwJD+o+LR4G92b/NypN8/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="233751257"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.106])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 14:34:34 -0700
Date: Thu, 14 May 2026 00:34:32 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Sanjay Chitroda <sanjayembeddedse@gmail.com>,
	Michal Piekos <michal.piekos@mmpsystems.pl>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maksim Kiselev <bigunclemax@gmail.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] iio: adc: sun20i-gpadc: add A523 gpadc support
Message-ID: <agTuaAjtpIRBAo6N@ashevche-desk.local>
References: <20260513-sunxi-a523-gpadc-v2-0-d5efde151dac@mmpsystems.pl>
 <20260513-sunxi-a523-gpadc-v2-2-d5efde151dac@mmpsystems.pl>
 <A7772824-E704-4BFD-A796-BCD81197E5A2@gmail.com>
 <4248ac7e-3cce-4db8-a2c1-710f2c903490@arm.com>
 <agTbFbicv9yzTQb9@ashevche-desk.local>
 <20260513231901.05dc9a82@ryzen.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260513231901.05dc9a82@ryzen.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_143440_347060_8BF71D2A 
X-CRM114-Status: GOOD (  25.95  )
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

On Wed, May 13, 2026 at 11:19:01PM +0200, Andre Przywara wrote:
> On Wed, 13 May 2026 23:12:05 +0300
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> > On Wed, May 13, 2026 at 01:53:49PM +0200, Andre Przywara wrote:
> > > On 5/13/26 13:44, Sanjay Chitroda wrote:  
> > > > On 13 May 2026 10:29:43 am IST, Michal Piekos <michal.piekos@mmpsystems.pl> wrote:  

...

> > > > > +	if (ret <= 0)  
> > > > 
> > > > Thank you Michal for the change.
> > > > 
> > > > Have you validated the changes ?
> > > > It looks while success ret would be 0 and it would give return error.
> 
> No, it doesn't. Returning 0 means no clocks found:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/clk-devres.c#n300
> 
> > Good catch!
> > 
> > > But devm_clk_bulk_get_all_enabled() returns the number of clocks found and
> > > enabled. And since we need at least one, I think this is correct, and the
> > > error message below reflects that.
> > > 
> > > To me that change looks good:
> > > 
> > > Reviewed-by: Andre Przywara <andre.przywara@arm.com>  
> > 
> > == 0 ???
> > Doesn't look like correct code.
> 
> Not sure I follow:
> devm_clk_bulk_get_all_enabled() returns the number of clocks in that
> node, or a negative error value. If it returns 0, that means no clocks
> have been found,

Not in this code. Here it will be resent to the caller as success.

> which is an error in our case, since we expect at
> least one clock. This is what the second part of the error message
> refers to.

But not the error code itself! There will be no error message, IIRC the
implementation of dev_err_probe().

> So we want one or two as the return value, with the current bindings,
> but really anything greater than 0 is fine, from the driver's
> perspective, since we don't care about the clocks beyond them being
> enabled.
> 
> So am I missing something?

Yes!

You returned that to the caller, meaning everything is fine. There is a success
that is returned. The code is buggy (okay, not that, it rather will behave not
as intended).

TL;DR:
You should have something like
	if (ret < 0)
		return dev_err_probe(ret);
	if (ret == 0)
		return dev_err_probe(-Exxx, "Needs at least one clock!\n");

-- 
With Best Regards,
Andy Shevchenko



