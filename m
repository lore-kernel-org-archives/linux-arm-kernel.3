Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CA7F3380B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 08:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cg592/7ax/ai3vj9+LKz1OiWhoFxMvDSIh8YWquZMBA=; b=gt/iia26w+ZXb5oR9pZNLT+AWE
	/0+jmNCFj/YMT2UsrCW42Xv3wPASB+vninjrLbCyCziqiyEFtsKcpJIA/ynoRbrnNjqMDoijp6UpP
	MvV5QWKveDYW8JeQ+ucMs5oLtYnOL2bk8jqcXSucncOMeXz36NtE+3uSupSZUFnn1nvyzd2pRXT5y
	qGTjB596m6AfVUZpK38tJLSmYqETA6OMWA5CyWebW/VdtQwUvIaQD8l0Y2ihVG6U9Pe9zprhlSAFW
	+Nrqpqbpoinyq1aXiCEKSTu67bgspBHgvqYw7EsxaPMGL5f2BTmGCmr5155P3M3ADkVbBpdz7mFY4
	FL65QLNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2PRI-00000005hA2-0zm1;
	Tue, 17 Mar 2026 08:06:08 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2PRF-00000005h9e-3Mxf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 08:06:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773734766; x=1805270766;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iMURNNM9AIH1rsZHJq+NkuOt1cRxxMqU8WKIAQJWBhY=;
  b=eN/Vw3xFo6L0Ez9LtUIqf1D5kZzucJMPpNuE9c49quSkRiwp3hvUMTkM
   OQ3Wd+uWy61SaY1m0Z/oHWqI9w2yHilgmMWtssQNnOIUDFq0hpdvmc4a1
   U3uiI0wNM8hA2vvvyjaB4DPKHiM4c+ctbAhvax0uL4/0I1ioXL9q4i9Rg
   vqRz0tPoOKSGsaE8zcZmDt7eWJktHfC5sAHThlm0TQnpOh6ehZEDZQDcz
   LrGV2cFt495+Ryl4BF109D2BIIAyyzhHkztBK90b4xMBuGJ8dAY3SCuhE
   E2bbv/nJ3KpFDskz/KdRL/ImefS5EbusHDRdDZkwpAy6PGOT6THx5y2zY
   g==;
X-CSE-ConnectionGUID: hHtTKaudRNKnZ2mpnmuC3w==
X-CSE-MsgGUID: FXuiLtvKTw2koDZJNkibbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="73777645"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="73777645"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 01:06:05 -0700
X-CSE-ConnectionGUID: B6sce5gfS3eYat7KD1IA9A==
X-CSE-MsgGUID: 7EgpgieoQr+l3rFUEy13xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="221425403"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.97])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 01:05:58 -0700
Date: Tue, 17 Mar 2026 10:05:55 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Douglas Anderson <dianders@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, stable@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>, Daniel Scally <djrscally@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>, Len Brown <lenb@kernel.org>,
	Mark Brown <broonie@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	driver-core@lists.linux.dev, imx@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH] device property: Make modifications of fwnode "flags"
 thread safe
Message-ID: <abkLY4AAQuFlTRC7@ashevche-desk.local>
References: <20260316154159.1.I0a4d03104ecd5103df3d76f66c8d21b1d15a2e38@changeid>
 <abkCPU3rxHI49N4_@shikoro>
 <abkD-VLprcbbEbB1@ashevche-desk.local>
 <abkF0GO01sMcOhvb@shikoro>
 <abkLEgrZbdb03VWg@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abkLEgrZbdb03VWg@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_010605_852361_1874F8D7 
X-CRM114-Status: GOOD (  20.60  )
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

On Tue, Mar 17, 2026 at 10:04:43AM +0200, Andy Shevchenko wrote:
> On Tue, Mar 17, 2026 at 08:42:08AM +0100, Wolfram Sang wrote:
> 
> > > > ... this change costs some memory on every system. Maybe it can be
> > > > avoided?
> > > 
> > > How much memory does it cost? On most 64-bit architectures is +4 bytes,
> > > rarely +0 bytes, on m68k it might be +2bytes. On 32-bit it most likely
> > > +0 bytes. I expect that 64-bit machines will cope with this bump.
> > 
> > I am not opposing that the issue should be fixed. If it is not possible
> > to take the lock everywhere, this is a proper solution. But if we don't
> > have to use more memory, then we could save it. Our new SoC easily has
> > 'struct device' in the hundreds.
> 
> What's the alignment for the u8 member in your SoC? 4 bytes or 8 bytes?
> (I assume it's 64-bit SoC.)

FWIW, with the given change it will be still inside 64-byte data structure
which most likely occupies a single cache line (before this patch and after
as well).

-- 
With Best Regards,
Andy Shevchenko



