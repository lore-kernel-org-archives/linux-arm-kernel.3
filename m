Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBB1C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 19:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HlYEfLCvaW+klDExc5A0sYVrMAc4nFxQDGOcqzZj8aI=; b=WzlThkpq+GqOCqm0i2GkdcN/bu
	Mg+wnYtuem8J7hwl06MbSPJeV84wGGPF1nK99rEN0jP2d6HpPsuzoRMLfv8W4JkhociATdyV6IKWu
	R1IzC51a2VN0ad9QFbMX12KJf7kyJq7onFBEWLSaG5tl2bfJJIIu5QiAvNgnogHcmgppDcXxhAT//
	auBVh9Xedj/yeAUOFoSqRRNM8Gan3qqjB54122ugYBbrAj2tdyzd8qw2OvQOZypOha7qiYkDIn9jM
	agQQhimh41z187HUW0lDXfrbTuAWB2gAFEucdy3gMUhxKzhFu02DpVw/XhKP9fTVi31ynsf79arQp
	iOg1SOQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD6qb-00000001e7h-0YN6;
	Thu, 08 May 2025 19:23:57 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD6oc-00000001dpW-3qOg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 19:21:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746732115; x=1778268115;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gNfji5PFl+h0m2cHgjtJ540HGm+2fhAcZWawBcQGVj4=;
  b=jfigPfvj3nB7HmeTMkEmuswCCvb+leEUCgean4zCenBFYrokFYF6XVsU
   O2IW5Bxy7A0c8g73eBgyTqJdvNwUX4WeA4L/PStfbgwh0bzpyztAMUnL8
   qV/mnxx2DUyF5aMRZJ6THQgqjwPv0N2v5/ZIyMmmmlLvJyGkfHQs/F4/t
   7OpkSNRYcbasrvfcI/GLOEXXbQg7NbnhcY9RkcGQaEI4Hb5NYBKnDJJqn
   XDrSKReP/Q5aR4zvCulh44JlCEuJP2wHhOui6oGb+Z8qqzGsUprhMWl29
   eFltvbZPL9owysow6MHw3denhzFkt+O5e+6bUPExChxv38rHQKYstzHl3
   w==;
X-CSE-ConnectionGUID: BUGs0zUSRdelwx3HbvFmhg==
X-CSE-MsgGUID: 4wxXOLC6Q8iHyPOEu6yA8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="73916366"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="73916366"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 12:21:54 -0700
X-CSE-ConnectionGUID: 6K8qyxJ8Sp2SFtC4BMHSMA==
X-CSE-MsgGUID: LP/93AoySMKUKm+Bf0N0HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="141348693"
Received: from smile.fi.intel.com ([10.237.72.55])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 12:21:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uD6oP-00000004D8c-2ujt;
	Thu, 08 May 2025 22:21:41 +0300
Date: Thu, 8 May 2025 22:21:41 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Subject: Re: [PATCH v2 23/26] misc: lan966x_pci: Introduce board specific data
Message-ID: <aB0ERYKdRreDe7Wt@smile.fi.intel.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
 <20250507071315.394857-24-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507071315.394857-24-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_122154_970523_08313F0A 
X-CRM114-Status: GOOD (  14.75  )
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

On Wed, May 07, 2025 at 09:13:05AM +0200, Herve Codina wrote:
> Only one device-tree overlay (lan966x_evb_lan9662_nic.dtbo) is handled
> and this overlay is directly referenced in lan966x_pci_load_overlay().
> 
> This avoid to use the code for an other board.
> 
> In order to be more generic and to allow support for other boards (PCI
> Vendor/Device IDs), introduce the lan966x_pci_info structure and attach
> it to PCI Vendor/Device IDs handled by the driver.
> 
> This structure contains information related to the PCI board such as
> information related to the dtbo describing the board we have to load.

...

>  static struct pci_device_id lan966x_pci_ids[] = {
> -	{ PCI_DEVICE(PCI_VENDOR_ID_EFAR, 0x9660) },
> +	{ PCI_VDEVICE(EFAR, 0x9660), (kernel_ulong_t)&evb_lan9662_nic_info },

PCI_DEVICE_DATA() ?

>  	{ }
>  };

-- 
With Best Regards,
Andy Shevchenko



