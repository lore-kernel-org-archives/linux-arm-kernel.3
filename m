Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0509ACA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 13:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yST2b7wD2arSD76lVcjJyJHchsSv2Uz5YStSaS0YJzY=; b=2RnqC0QuQskanxAu17AVCtR444
	TnUFiZLoLamj++tLkT1ppyEdnrzvabyrblnrXHfGE+Svi5p/n73FAiNQ6eMleb7FO/D16fPQ5iYk8
	T6ReDeee044z1GjeSYmc3gGAhCJxCcJQVB2XFeZK8M3zMzO2BSeWyvJ/ctBGqeoGRKX9brkSatRKR
	2dAmgkrQtBWByR1jo4fTgyDkaVnYebidv9yOpaolIw716BNFF7SBEOSpX31emNk1uZZozKxkV8PAV
	s+twTCcPO4OxqT3anhXXE3PZTvjKq0SpFeKOd5yiuGHi/wZqyP0yOzXBNgR8VPMICAB1b0k/s6xMC
	xPCRT98A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umBem-0000000DmgJ-0NUO;
	Wed, 13 Aug 2025 13:36:44 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umBBd-0000000DiRs-3ZIT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 13:06:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755090398; x=1786626398;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=cRZd5t149Cj/63+HodENGqLUU8711RdMcrqet0Uojk0=;
  b=L9Hiyi55cnI4KJACG4OPZvhN3g6ePubzLSGM/srSfjUwoLjM/Ru3xuSU
   NFcLQHObjcw7VUt20N78FqHBwHnomdLFTaMZY6VzcrDp0qci5TIqVfFGM
   +KUDjwrxezjuckz1tNZEOiEtzinelfaH/eZ+lBd7rYKDhIlF3DfEGf9Dn
   v7sGWg5vTRUm8GG5Mv7H4l+rvsr2DoWnI52V0V2L3C1ofsLwTUkB2gN9y
   Kh5XFmVibr/GIC94Gf4TpoTmAHlZn+wVyfiR3AaJsPs+Xe6rucwZzJM3w
   zG/M6szzp/CEBqUY3E22k3+Z3PjZqCR5eoeVyQXlE9zOnpUdSy/OoiEJs
   A==;
X-CSE-ConnectionGUID: KJ9LrGzaR8i8Umpf4dY/AA==
X-CSE-MsgGUID: jAj0payGTKaYBaXQWF7NFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="74959656"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="74959656"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 06:06:37 -0700
X-CSE-ConnectionGUID: FWTQedAvQjCEPjDDCDuanQ==
X-CSE-MsgGUID: /zQqES/kR5idr7cSacS7sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="170673829"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 06:06:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1umBBX-00000005RN2-0SOW;
	Wed, 13 Aug 2025 16:06:31 +0300
Date: Wed, 13 Aug 2025 16:06:30 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>, Hanna Hawa <hhhawa@amazon.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Imre Kaloz <kaloz@openwrt.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] i2c: add init_recovery() callback
Message-ID: <aJyN1uX60BJQYDHj@smile.fi.intel.com>
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
 <20250811-i2c-pxa-fix-i2c-communication-v2-1-ca42ea818dc9@gmail.com>
 <aJpP5eABTYnQRV82@smile.fi.intel.com>
 <27cc9ae5-1c13-4ec9-ab10-ae95d6339116@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <27cc9ae5-1c13-4ec9-ab10-ae95d6339116@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_060637_898708_152B7916 
X-CRM114-Status: GOOD (  29.59  )
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

On Wed, Aug 13, 2025 at 12:24:22PM +0200, Gabor Juhos wrote:
> 2025. 08. 11. 22:17 keltezéssel, Andy Shevchenko írta:
> > On Mon, Aug 11, 2025 at 09:49:55PM +0200, Gabor Juhos wrote:

...

> >> This is needed for the 'i2c-pxa' driver in order to be able to fix
> >> a long standing bug for which the fix will be implemented in a

The above left for some context for the below discussion.

...

> > The first traditional question is why the generic recovery is not working.
> 
> The details are in the driver specific patches. Should I write it all down here too?

Instead of the above paragraph, give a summary of your use case to answer 'why'
it can not be done differently.

...

> >> -	if (i2c_gpio_init_recovery(adap) == -EPROBE_DEFER)
> >> +	if (bri->init_recovery) {
> >> +		ret = bri->init_recovery(adap);
> >> +		if (ret)
> >> +			return ret;
> > 
> >> +	} else if (i2c_gpio_init_recovery(adap) == -EPROBE_DEFER) {
> >>  		return -EPROBE_DEFER;
> >> +	}
> > 
> > If the above stays, I think we would drop the last and always have
> > init_recovery to be assigned.
> 
> In that case we would have something like this:
> 
>     if (!bri->init_recovery)
>         bri->init_recovery = i2c_gpio_init_recovery;
> 
>     ret = bri->init_recovery(adap);
>     if (ret)
>         return ret;
> 
> Since the callback is used only once, and within the same fuction where it is
> assigned, I don't really see the advantage of the assignment. Although it
> definitely looks cleaner as far as error handling is concerned.
> 
> Originally, I have used the following solution:
> 
>     if (bri->init_recovery)
>         ret = bri->init_recovery(adap);
>     else
>         ret = i2c_gpio_init_recovery(adap);

> 

Without this blank line...

>     if (ret)
>         return ret;

...this looks like the best compromise among proposed implementations.

> However the existing code ignores errors from i2c_gpio_init_recovery() except
> EPROBE_DEFER, so I changed this to the code proposed in the patch in order to
> keep the existing behaviour.

-- 
With Best Regards,
Andy Shevchenko



