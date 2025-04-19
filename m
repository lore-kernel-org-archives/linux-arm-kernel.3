Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3396EC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 15:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ysDu9eF8Eh897/ioHX0hcuYeCiy+ssb61wS3Sg/rCWU=; b=h90IKP+397LcxOV8umo3MvyiPa
	C/p/TwdYB+6uKIz18Xi+c9+lVz8nLxCR1QBL+SggYfGpG61XNOjNeHXyQUdJsr8/LBn86knyjB8gC
	Jwx1zGns9bTR/BLroWKmFK91Lvwx3ICnYrPkROCS2UVpRAYmgW6WOj2eX6uAc/HLxiRC7DLjoOYGG
	uhCLWrnyT9SEO+5JoOnxSW+XXsKrkBLqnK4Q6Wyj65oDM7Cl74dRe7X1q6qLszWIWuoCNs1OCldfa
	icHSo61ObIGvf5IC8cJvKgeOSMIP31P2LAJhwtG8LVeca2OC1V47pEkz6MicleJfZEgph0X5g4JCd
	ywODi2zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6ABS-00000001TMn-3CxC;
	Sat, 19 Apr 2025 15:32:46 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6A9a-00000001TG5-40vN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 15:30:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745076651; x=1776612651;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=EJY6VnbO/oorT+t/r51LBHIJCvd7pfE+OXcRXcdWp/Y=;
  b=SrUtxw/VrGfDO35SuUl9JP/R5aEeHLwEB7GGTafArT1TJZoNJFjNZyN7
   OcjNM0y9m6eqFsCz6wpt6GtfV39ECLvMVYmMKrbMD/kETaAiJdotvJ9O1
   iC8pRAaksMbv5ODtkL/Xv11t5jat1uEwJxeAkwXSkWPPzQObG4R4oRi0y
   T5BoV6Sb2FSLz3Ub+nAtOI/U11c8opWbgFAPtxXUeQJh9ug+P54hIDUg0
   zzfdWyksOup/AbAMX7zR9xRdSblZWLT9QmMyj+mKIDFkyaqhGo9+K+dcZ
   4EE8KROYMfqzHx6KXmFTsgL1bTjTxm4Gia8Waf6EmPNO3U4+gF0FVMp9A
   A==;
X-CSE-ConnectionGUID: r4TQJksFRsSiDu6hiKO9MA==
X-CSE-MsgGUID: Nnnifr/9TZeuLciXrw08mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="46806649"
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="46806649"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 08:30:44 -0700
X-CSE-ConnectionGUID: CuoieLxUT1K3ksC/Kut48Q==
X-CSE-MsgGUID: ZSJTu6nsQF+IEiTNRnHGnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="154517506"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 08:30:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u6A9I-0000000DqsB-0AwJ;
	Sat, 19 Apr 2025 18:30:32 +0300
Date: Sat, 19 Apr 2025 18:30:31 +0300
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
Message-ID: <aAPBl7qdbUizMQko@smile.fi.intel.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-12-herve.codina@bootlin.com>
 <Z_Pw_MoPpVNwiEhc@smile.fi.intel.com>
 <20250408154925.5653d506@bootlin.com>
 <Z_U0DkSemHK0lrJW@smile.fi.intel.com>
 <20250418151036.719f982b@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250418151036.719f982b@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_083051_040013_1635085D 
X-CRM114-Status: GOOD (  45.56  )
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

On Fri, Apr 18, 2025 at 03:10:36PM +0200, Herve Codina wrote:
> On Tue, 8 Apr 2025 17:34:54 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Apr 08, 2025 at 03:49:25PM +0200, Herve Codina wrote:
> > > On Mon, 7 Apr 2025 18:36:28 +0300
> > > Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:  
> > > > On Mon, Apr 07, 2025 at 04:55:40PM +0200, Herve Codina wrote:  

...

> > > > This is incorrect, they never had ACPI to begin with. Also there is third
> > > > platform that are using DT on x86 core — SpreadTrum based phones.  
> > > 
> > > I will rework the commit log to avoid 'mixing ACPI and device-tree'
> > > 
> > > For "SpreadTrum based phones", do you have an idea about the Kconfig symbol
> > > I could use to filter our this x86 systems?  
> > 
> > Hmm... good question. I don't think it was anything. The Airmont core just
> > works and doesn't require anything special to be set. And platform is x86 with
> > the devices that are established on ARM, so nothing special in device tree
> > either, I suppose. Basically any x86 platform with OF should be excluded,
> > rather think of what should be included. But I see that as opposite
> > requirements to the same function. I have no idea how to solve this. Perhaps
> > find that SpreadTrum Intel Atom-based device? Would be really hard, I believe.
> > Especially if we want to install a custom kernel there...
> > 
> > > Anything I find upstream related to SpreadTrum seems base on ARM cpus.
> > > I probably miss something.  
> > 
> > There were two SoCs that were Intel Atom based [1]. And some patches [2] to x86
> > DT code were made to support those cases.
> > 
> > > > And not sure about AMD stuff (Geode?).  
> > > 
> > > Same here, if some AMD devices need to be filtered out, is there a specific
> > > Kconfig symbol I can use ?  
> > 
> > This is question to AMD people. I have no clue.
> > 
> > [1]: https://www.anandtech.com/show/11196/mwc-2017-spreadtrum-launches-8core-intel-airmontbased-soc-with-cat-7-lte-for-smartphones
> > 
> > [2]: 4e07db9c8db8 ("x86/devicetree: Use CPU description from Device Tree")
> > and co. `git log --no-merges 4e07db9c8db8 -- arch/x86/kernel/devicetree.c
> 
> I have tried to find a solution for this topic.
> 
> Indeed, this patch enables fw_devlink based on device-tree on all x86
> platform except OLPC and CE4100.
> 
> You have mentioned some other x86 based system that could have issues with
> fw_devlink and it seems to be hard to have a complete list of systems for
> which we should not enable fw_devlink (potential issues and so regression
> against current kernel behavior).
> 
> As you also proposed, we can thing on the opposite direction and enable
> fw_devlink on x86 systems that need it.
> 
> We need it because we need the device-tree description over PCI device feature
> (CONFIG_PCI_DYNAMIC_OF_NODES) on x86 in order to support the LAN966x use case.
> 
> What do you think about the following condition?
> 
> 	if (IS_ENABLED(CONFIG_X86) && !IS_ENABLED(CONFIG_PCI_DYNAMIC_OF_NODES))
>  		return 0; /* Not enabled */
> 
> CONFIG_PCI_DYNAMIC_OF_NODES has already to set explicitly by the user.
> 
> Do you think it makes sense and could be a good alternative instead of
> filtering out a list of x86 systems ?

At least this won't break old platforms that won't set that configuration
option. Ideally, of course, it would be nice to have some kind of detection
at run-time...

-- 
With Best Regards,
Andy Shevchenko



