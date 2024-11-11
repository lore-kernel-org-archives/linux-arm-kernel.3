Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC058D2E9CC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 09:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vGDwtaNiccwnw0iNBAQV9T1zdlfF7UPHsFKE6BUa75o=; b=1cB+bGcqOhFrBwDqZVUwy4c1XZ
	BTQ/v+PKDxAfmInthZoq1CoNnipXE2K1armLepYWs3jI8/oXKUda2c1tWCKzWyoa/B2rfAdig+zc4
	G0fTw70+xj+MQv0AvWrPRQOH4tK28UoKDch1Mlb2eRlCUXA2JahX2rPB+l8fFgwre0K+ugpjRg41u
	/LJQvpOnGkGHXT+79Nq/R4CsOtV8p+yASfLxzfXP3cuUkrvrjYGE21fmhwGG5YvJI/NnXD5gdMGY7
	z6W+rWB/6SSfshpTjzHTlxXNh1DsXiMeHfUOjrFAoQjhlifh08aH5s7m3sf+RekDBkqEcWNR5OgGx
	+TYyl8gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQvE-0000000H8q3-0EFm;
	Mon, 11 Nov 2024 09:41:24 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQsK-0000000H8AT-2O5a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 09:38:25 +0000
X-CSE-ConnectionGUID: xY0+/ma2TvexvPAT0NF+KA==
X-CSE-MsgGUID: 3aQEE5nRSsmyG5tlbGOjXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31283517"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31283517"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 01:38:23 -0800
X-CSE-ConnectionGUID: vKgxvLnxSW2eLqkX5QZQww==
X-CSE-MsgGUID: e+5VjbTJS5GlYdx0irgteA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="87640065"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 01:38:20 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1tAQsB-0000000DXr3-2uiO;
	Mon, 11 Nov 2024 11:38:15 +0200
Date: Mon, 11 Nov 2024 11:38:15 +0200
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Aren <aren@peacevolution.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Kaustabh Chakraborty <kauschluss@disroot.org>,
	=?iso-8859-1?B?QmFybmFi4XMgQ3rpbeFu?= <trabarni@gmail.com>,
	Ondrej Jirman <megi@xff.cz>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, Dragan Simic <dsimic@manjaro.org>,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 2/6] iio: light: stk3310: handle all remove logic with
 devm callbacks
Message-ID: <ZzHQh8CV4c2HC4NY@smile.fi.intel.com>
References: <20241102195037.3013934-3-aren@peacevolution.org>
 <20241102195037.3013934-7-aren@peacevolution.org>
 <ZyiGiK6bSd_d0VQ6@smile.fi.intel.com>
 <mlvzaskgxqjfu6yiib2u7m3pczsifsluc4mqnzy6w3xzxblvm6@xrxvvruzftn2>
 <ZzEOqC9dAHCRX5a9@surfacebook.localdomain>
 <qqk4rbx6wxr7vofepk63yvuimavafbiy2srkqx2zvl2kxttlrk@axpphmdxffis>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qqk4rbx6wxr7vofepk63yvuimavafbiy2srkqx2zvl2kxttlrk@axpphmdxffis>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_013824_674431_5DD48505 
X-CRM114-Status: GOOD (  19.67  )
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

On Sun, Nov 10, 2024 at 05:37:56PM -0500, Aren wrote:
> On Sun, Nov 10, 2024 at 09:51:04PM +0200, Andy Shevchenko wrote:
> > Sun, Nov 10, 2024 at 01:38:39PM -0500, Aren kirjoitti:
> > > On Mon, Nov 04, 2024 at 10:32:08AM +0200, Andy Shevchenko wrote:
> > > > On Sat, Nov 02, 2024 at 03:50:37PM -0400, Aren Moynihan wrote:

...

> > > > > +	ret = devm_add_action_or_reset(&client->dev, stk3310_set_state_disable, data);
> > > > 
> > > > Why not simply 'dev' as in below call?
> > > 
> > > I was trying to avoid refactoring the entire function to replace
> > > &client->dev with dev, I'll add a patch for that to the next revision.
> > 
> > I'm not talking about refactoring, I'm talking only about the lines that you
> > have touched / added.
> 
> Ah right, this one makes sense, my comment should have been on the next
> patch in this series which is a little more complex. For that patch it
> seemed inconsistent to use dev only in new code and mix it with calls
> using &client->dev.

It's fine, you can add a new cleanup patch later on.

-- 
With Best Regards,
Andy Shevchenko



