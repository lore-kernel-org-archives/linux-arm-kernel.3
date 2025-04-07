Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16DCC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 16:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ktP+UEopnsVypxyLQyMlsf/5GS4AjfeLHLZl6NC/hbY=; b=VSxGo435nvO+hgxDNQwkm0NDI8
	KYlfQAN4pHJ8/B3/iQANIFP/fcXcYCp9ApBa273CQ3/kbDfmNW/y+ryHGONjcRJYaHakeg2Tky0Li
	JdNX046msH40AP2IrxYGptxoyHqbu1o6bUHbKTBrei9IDMaVicuflEW0oliCJ2k2dTPfXVxNV3OLG
	WEA2IdsGr0fDL8Cyu90UsACXqLxS2Te49hq/v6RG5SkMewtXyW8LzJsFSuFcY8iT5+6O6vi4RK2DI
	mqI6lKcIcSHyT4QFb11esxI00ShmpAF5PE0NU8mYwSOtsAN6qdFg7krxn9qGp19Kb9me8kdmiSKCN
	nvmw83LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pXJ-00000001FOl-18lD;
	Mon, 07 Apr 2025 16:41:25 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1odr-000000010E7-2fev
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 15:44:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744040647; x=1775576647;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qdp7S8zYZK2tNWGM182FxMV42Ekv5vQIbw5ek6+RIF8=;
  b=Otk29duKpLlHFMBHnSSx6958AXmaC81/e7K8jWEV9nbX9wvYVDHIC2Ox
   bgErx3Yim0xy/a8QJIjZ20g4GRKmSDJE4xKegxCxhEmAsbSfTK0QRvUuO
   ycDdxe4VrSMAcPcD0pp2JsPIDcHqvGJLXgFRd/UyytPpwID6YnVX5TVOI
   dPtJPogi3LNazjeAt+2mxIRvznt6nCcz19/HLQybCeUlYn8cJHQASMaWm
   P9rxajTXRcv3CrzWMC6dd6X6YEH7v161VR2rZSpz2N0xs2szQ8B091ey2
   ypONOpjOIr+0ujrif6HJLejy4X9LmQobv57Spm3Ns8uj+XxXwbjfLO0S5
   g==;
X-CSE-ConnectionGUID: nP39CaroQlWOfrUGqn+1EA==
X-CSE-MsgGUID: Rmjj9KrGT8Gi2j4wNhp6cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="44579331"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="44579331"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:44:00 -0700
X-CSE-ConnectionGUID: aDcNRujzQ4iOgfKhELhzfw==
X-CSE-MsgGUID: a8eRIMDVTc+cxIlKZ8rSMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="128327640"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:43:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u1odY-0000000A76j-0Bhp;
	Mon, 07 Apr 2025 18:43:48 +0300
Date: Mon, 7 Apr 2025 18:43:47 +0300
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
Subject: Re: [PATCH 16/16] misc: lan966x_pci: Add drivers needed to support
 SFPs in Kconfig help
Message-ID: <Z_Pysw4apeyWtHrT@smile.fi.intel.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-17-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407145546.270683-17-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_084407_686607_F096B0E8 
X-CRM114-Status: GOOD (  13.46  )
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

On Mon, Apr 07, 2025 at 04:55:45PM +0200, Herve Codina wrote:
> Recently, new device-tree nodes were added in the overlay to add support
> for SFPs on LAN966x PCI device.
> 
> The LAN966X Kconfig help section mentions drivers related to devices
> added based on the overlay description.
> 
> Add drivers related to devices described by those new nodes in the
> already existing driver list.

...

>  	    - lan966x-serdes (PHY_LAN966X_SERDES)
>  	    - lan966x-miim (MDIO_MSCC_MIIM)
>  	    - lan966x-switch (LAN966X_SWITCH)
> +	    - lan966x-gck (COMMON_CLK_LAN966X)

> +	    - i2c-mux-pinctrl (I2C_MUX_PINCTRL)

Perhaps keep it alphabetically ordered?

> +	    - sama5d2-flexcom (MFD_ATMEL_FLEXCOM)
> +	    - sam9x60-i2c (I2C_AT91)
> +	    - sfp (SFP)

-- 
With Best Regards,
Andy Shevchenko



