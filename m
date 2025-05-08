Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCDFC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 15:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LxkIfdPAW9Q20BDq/mi3qMUCnVgKFNaHsNsRZQQxttc=; b=YNDsPMU1crtoVF9lOP325EAjia
	TdJRiwqe82VR8jaLiKMc9al5+uyhcIPfy1q4bJHYtNZDcbbMovkwkLZZ29MmsBOox0Winj5JVp1Ef
	PYJJbYFJy8hQTRU6D7esDJuADmWeNMMvNh19appvmU2lm1Etr8r/H8tysSBaAogYVn1EMJxJdDLBw
	svpTaLBYUb7UCm3yjQk4Ew8+8nxrrMMA+KVPsp6rZlTmltcPEQVp8jvYsBfBlztfhqoEWcPebkjcI
	4EjD7QxBOlkSVlonS2ZWZ8PGxpVwKL/pqcVM4QYg7Td4Lg0X013Jc4nVHlfV53oHteogAyj8UcJcS
	v6h8zr/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD3Ub-00000001Bl7-40XW;
	Thu, 08 May 2025 15:49:01 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2EK-00000000v58-2Ri0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 14:28:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746714489; x=1778250489;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IY3VG/gRbQesJTL7PGEn0YX+FszGyoQR0i1Wr/j85Qc=;
  b=i70ls6+Tn7yvDvq2T3McTEscfVbJMnfaB0RWlVbqds+7kBwifScUPzHz
   UAQtVCuavO6xzdDes4AEpRlvn9eXTZJt4VVUBPxgfyWvsn5oC0s5tZ/7W
   w0uczTSgfd5FcWFu3c4izJK2klBiMBqSRDhUUoxGkTl2Jh43hvQ9Up97Y
   Zza0OiYKtFubTEOSENoJAbJ6VpXhEmrRchZ881cz/9UtVEMmL+sSypkeH
   zm/ud7v+ltHWoAqmxZMNLEOG+6OV80mHfq5ojciPQ0x+WI7Cfe8IGmW61
   U/xWJQsbx+MZ7AjGgvfAi4nV/rb4z8iNRNmzsalwb1h7iGhjUACSIstAK
   w==;
X-CSE-ConnectionGUID: nPnZGevMRC6LbLqwzdn8ZA==
X-CSE-MsgGUID: iz5VX6emQwSndCfclr17rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59496606"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="59496606"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 07:28:06 -0700
X-CSE-ConnectionGUID: rdEp9pKSQSOxGK7lJDtSyw==
X-CSE-MsgGUID: uy6WKA9hT6e5NY9UIu6Ijw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="136320287"
Received: from smile.fi.intel.com ([10.237.72.55])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 07:27:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uD2E4-000000048Ph-1tm1;
	Thu, 08 May 2025 17:27:52 +0300
Date: Thu, 8 May 2025 17:27:52 +0300
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
Subject: Re: [PATCH v2 05/26] bus: simple-pm-bus: Populate child nodes at
 probe
Message-ID: <aBy_aBkC7NpicXho@smile.fi.intel.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
 <20250507071315.394857-6-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507071315.394857-6-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_072808_694300_4323DAE4 
X-CRM114-Status: GOOD (  22.97  )
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

On Wed, May 07, 2025 at 09:12:47AM +0200, Herve Codina wrote:
> The simple-pm-bus drivers handles several simple bus. When it is used

bus --> busses ?

> with busses other than a compatible "simple-pm-bus", it don't populate
> its child devices during its probe.
> 
> This confuses fw_devlink and results in wrong or missing devlinks.
> 
> Once a driver is bound to a device and the probe() has been called,
> device_links_driver_bound() is called.
> 
> This function performs operation based on the following assumption:
>     If a child firmware node of the bound device is not added as a
>     device, it will never be added.
> 
> Among operations done on fw_devlinks of those "never be added" devices,
> device_links_driver_bound() changes their supplier.
> 
> With devices attached to a simple-bus compatible device, this change
> leads to wrong devlinks where supplier of devices points to the device
> parent (i.e. simple-bus compatible device) instead of the device itself
> (i.e. simple-bus child).
> 
> When the device attached to the simple-bus is removed, because devlinks
> are not correct, its consumers are not removed first.
> 
> In order to have correct devlinks created, make the simple-pm-bus driver
> compliant with the devlink assumption and create its child devices
> during its probe.

...

>  	if (match && match->data) {
>  		if (of_property_match_string(np, "compatible", match->compatible) == 0)

Side note, there is an fwnode_is_device_compatible() API for such cases. And IIRC
there is also OF variant of it.

> -			return 0;
> +			goto populate;
>  		else
>  			return -ENODEV;
>  	}

...

> +	if (pdev->dev.of_node)

Why do you need this check? AFAICS it dups the one the call has already in it.

> +		of_platform_depopulate(&pdev->dev);

-- 
With Best Regards,
Andy Shevchenko



