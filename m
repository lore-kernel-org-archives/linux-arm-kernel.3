Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1692CF3380C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 07:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ovos5ZgwjwedhdOR93lPLFH4Q9AxTbpu756HtPKvsUo=; b=aUOWhMPHKrpxJWVj2wD2rwVo2j
	facO2DYbHcmLNv1bRhtgc/U42mP54+QnP0a0w3SHuaXFqLQKNvsKLfO/0lqbwmXNJuE+WrmlolCCh
	AVkolXtDhiaUG63N1qIcKx+olT933s7o1iFkHkCqUoeTbUJZKsht9tGfp1PlSPVZ3N90ZdotEVjUw
	Q//bP00iqKrGirC3bPp50UsMoXPlvn22KWfc+uhOF3VChfqFAYSyqKmma58UIzgCYDNtBwaL9uLWq
	NcVTrg2A0ftZ67O/yaXHbPbnbG6vPyT4HyiYIcYUlFNwDa95/xEdTLN6qgE9cxwjL76SjS2/TpRFw
	k4NMk6MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Owj-00000005a8F-1yZQ;
	Tue, 17 Mar 2026 07:34:33 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Owg-00000005a7R-2sbF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 07:34:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773732869; x=1805268869;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1OJtUNEamh5vO3iFIrEXYFak4q7SIt7T2aherzADZ/g=;
  b=Nkdm9SyOViFWsr8bc/7hJpvoF7SB48Z2qkSaYCaeJ1Elc8yfWVlQMxhF
   NsNf9W7ooGCJbeCFjrqJAkgVHFKDEW1J2sf0mnGThIWR5kuM791lL7f9y
   8xroVo2+5QlsgGnahCbhydi7pvH/HZfO3ywfXMToL68NPo4cwUcFB5Vdx
   dY9qDFg6lc+xPITVhn0hbrANOtQQt+R4rrQJfyn9bxgSfR1gaJ55d+mEd
   W3dnjljelu6sVSNF0fYVyKnXlky/WJSPAzdXYG57SfSq06PxsQKChHKjt
   WlhXa7XT788roGX84Ra+sTJ18SI/nijW443Ayvc/AjYUcaNu64p6jx8WS
   w==;
X-CSE-ConnectionGUID: bGlpCNEZSxGCHDHoDJEESA==
X-CSE-MsgGUID: P5hKE3FGS1WeXqUWu3xH9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74835522"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74835522"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 00:34:27 -0700
X-CSE-ConnectionGUID: l6i/QyKCQ2+Qh0zbsAMaDQ==
X-CSE-MsgGUID: E2hgBnOgTvOTItdc81+GLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226306582"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.97])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 00:34:20 -0700
Date: Tue, 17 Mar 2026 09:34:17 +0200
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
Message-ID: <abkD-VLprcbbEbB1@ashevche-desk.local>
References: <20260316154159.1.I0a4d03104ecd5103df3d76f66c8d21b1d15a2e38@changeid>
 <abkCPU3rxHI49N4_@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abkCPU3rxHI49N4_@shikoro>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_003430_742097_5A567E0A 
X-CRM114-Status: GOOD (  16.55  )
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

On Tue, Mar 17, 2026 at 08:26:53AM +0100, Wolfram Sang wrote:

...

> Thanks for tackling this issue! I agree it should be fixed, just
> wondered about one thing:
> 
> > While flags are often modified while under the "fwnode_link_lock",
> > this is not universally true.
> 
> Is it a possibility to use the lock in all code paths instead?
> Because...
> 
> >  	struct list_head consumers;
> > -	u8 flags;
> > +	unsigned long flags;
> 
> ... this change costs some memory on every system. Maybe it can be
> avoided?

How much memory does it cost? On most 64-bit architectures is +4 bytes,
rarely +0 bytes, on m68k it might be +2bytes. On 32-bit it most likely
+0 bytes. I expect that 64-bit machines will cope with this bump.

-- 
With Best Regards,
Andy Shevchenko



