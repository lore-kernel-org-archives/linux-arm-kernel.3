Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B6DC369A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 14:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JrtwMZwdMFUn/RxMCTZ/yE/8GvmpWzqqTkUyxvT8IsY=; b=xBI9DlKSeeLtstiz6CrU2YYnJq
	McBku5LC5Sg71kYC6Ks0gq9xbuKJK5Nuf7m+UhQ0jSV4DONwx7gR13INXvME0c7C3MEswRIXVFvDS
	x2ZsXf0V7r7pVn/xRfhJV6cYVY2vF5yfmPoKFDI8Q1xxYjG5u6wAJiqpKfksQAp1u3z1UJL3DblVY
	AZFedegAy2uhxAoLXKy25P0y0il8DhC6Hs1XU3m3To+lORNDubrcm/FEgfAUTwDLh+wWffzChOJWT
	jlMoBe1oXHxfAcrBhxYIEZj9wJBXPOzcFM4fn96xgmNe5zxz7U6ZsmwXPR3ZIJ0pBrE/J+ajqTkpx
	Px1Z3ALA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2A4V-00000004PlK-0iBT;
	Tue, 08 Apr 2025 14:37:03 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2A2h-00000004PBy-2yfi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 14:35:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744122912; x=1775658912;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=D/18wlxlU1B/qYk8djU+F/aya0mKw/WZV9bFlV1sC2g=;
  b=JUzIW3X8loPFTczKUR0rizhh+kDZsGJXpPLfdqrTCcrWN7uQYuT+OOPm
   fIWrPH6vhy42r0UITcG82ZGw6BnPJeyoyjdrefm+NHqyeb/R+1r7ruI1S
   vWPEvBrvJk34aOPccnpNhKPemGk2KjvSbLqzEEISHxJZ2bajrympDytWW
   62y3jERCD68exWq4zOE9DSunIc3MI7SOo0oauJ9qdyD1djMv4nMiPeX9S
   89zOX7z/FlGsz0nrumrD1FmYkUWAm6UOeJftvB9N26nKjPr5ukJs+itqD
   ZwiAyETtgOWhuo71iSnOrRwjBCaTq3H5vbty0bwTe3bGPdjzyfKMgG0qv
   A==;
X-CSE-ConnectionGUID: r6xIJ0ebSXCFcQslKjRuSQ==
X-CSE-MsgGUID: JoN6KoS5SwOikAmrDxaDSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56928757"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="56928757"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 07:35:08 -0700
X-CSE-ConnectionGUID: g/7RqbvqSSWX44qJ468Qmg==
X-CSE-MsgGUID: VxgsdQCfS0C/Kcx96bBDtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="128020784"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 07:34:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u2A2Q-0000000AQj9-2ym4;
	Tue, 08 Apr 2025 17:34:54 +0300
Date: Tue, 8 Apr 2025 17:34:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 11/16] of: property: Allow fw_devlink device-tree support
 for x86
Message-ID: <Z_U0DkSemHK0lrJW@smile.fi.intel.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-12-herve.codina@bootlin.com>
 <Z_Pw_MoPpVNwiEhc@smile.fi.intel.com>
 <20250408154925.5653d506@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250408154925.5653d506@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_073511_786541_9366AB90 
X-CRM114-Status: GOOD (  22.13  )
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

On Tue, Apr 08, 2025 at 03:49:25PM +0200, Herve Codina wrote:
> On Mon, 7 Apr 2025 18:36:28 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Apr 07, 2025 at 04:55:40PM +0200, Herve Codina wrote:

...

> > This is incorrect, they never had ACPI to begin with. Also there is third
> > platform that are using DT on x86 core — SpreadTrum based phones.
> 
> I will rework the commit log to avoid 'mixing ACPI and device-tree'
> 
> For "SpreadTrum based phones", do you have an idea about the Kconfig symbol
> I could use to filter our this x86 systems?

Hmm... good question. I don't think it was anything. The Airmont core just
works and doesn't require anything special to be set. And platform is x86 with
the devices that are established on ARM, so nothing special in device tree
either, I suppose. Basically any x86 platform with OF should be excluded,
rather think of what should be included. But I see that as opposite
requirements to the same function. I have no idea how to solve this. Perhaps
find that SpreadTrum Intel Atom-based device? Would be really hard, I believe.
Especially if we want to install a custom kernel there...

> Anything I find upstream related to SpreadTrum seems base on ARM cpus.
> I probably miss something.

There were two SoCs that were Intel Atom based [1]. And some patches [2] to x86
DT code were made to support those cases.

> > And not sure about AMD stuff (Geode?).
> 
> Same here, if some AMD devices need to be filtered out, is there a specific
> Kconfig symbol I can use ?

This is question to AMD people. I have no clue.

[1]: https://www.anandtech.com/show/11196/mwc-2017-spreadtrum-launches-8core-intel-airmontbased-soc-with-cat-7-lte-for-smartphones

[2]: 4e07db9c8db8 ("x86/devicetree: Use CPU description from Device Tree")
and co. `git log --no-merges 4e07db9c8db8 -- arch/x86/kernel/devicetree.c

-- 
With Best Regards,
Andy Shevchenko



