Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28558C3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 15:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dTmc5K+L+XaGXC/+ELCi8ZVOEDRCxuCIgqKjwFeroUA=; b=XT0hjNfSmZmgl0YLfz6VjUajsM
	JNrhPjhP5qG+jdn3yamatyWyBOKCTPef7a5kzN7Ch0WH5lw3KZRWikvig9FlTlN/SxTNFoxU68K/A
	b+qDwDfeiVDpW+cHez6sjJjeEzZk2u7N7tKVjdFhw9E06SUvQZGKtg8mbPC2+sXRCJTWtHUiWbDWD
	/mXxSmUwIcUU/HZhs/FiVgdnID3+c3Nbsd9jiskzErjnaya4Y4u3x+1cXtH1bKstn0CFXstjtJbkN
	GpCuikAPZ46Jn8JM1yv/H2xfzXPZRYTXQ2PdbTPlaQ33EKZPXJR8X5hf3a302P6a7elYZ47hl8z2p
	lSiU87Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgx3-0000000G1SZ-17sC;
	Wed, 07 May 2025 15:44:53 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgQA-0000000FuIi-2foV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 15:10:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746630654; x=1778166654;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1xPQQ8cgSsnUdxWhhTMgGFgv6gyyo/ahFyXwkkVFqhg=;
  b=cX6+TqKU7RQGNVxclZExECRgjj1qxucMa//puAi3K+1dxZEau90FSejs
   U57OnZLDO2OvxfzSxUvWRrxSGJ3JIQavgEwmdgt/TigGDJsymOLddWSLz
   PXdgUsx0/DllTzuSzy6lx2mfyHxyBmK1EInwqy08Ydhv747DEKTqd8fhL
   elC0tr4tr+uS2aE4n7ZNaWkFdVcyrTFZzTaBeoU7/9EryXiEAMSiz249J
   0inEZuKxRktoF7/9LDgfgPm14VSpZ+Ny2wPgmMCy+/1PsFJV6cLPXcN8Y
   Ulh7XL5lV5YAdOwXThhzzNAALpEZZgiP90EIMlfda3+5dLmgNZKiIDlXl
   Q==;
X-CSE-ConnectionGUID: frecgAFeTeSL4qlClMn7Cw==
X-CSE-MsgGUID: w3KNw9klQ2aDN5b2N8+6IA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48385048"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48385048"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 08:10:53 -0700
X-CSE-ConnectionGUID: 8ZDu9uRDQC+SvUB3OKws0Q==
X-CSE-MsgGUID: PnZJEGOxR4WhtEqGsijYkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="141107107"
Received: from smile.fi.intel.com ([10.237.72.55])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 08:10:44 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uCgPw-00000003lUL-1quq;
	Wed, 07 May 2025 18:10:40 +0300
Date: Wed, 7 May 2025 18:10:40 +0300
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
Subject: Re: [PATCH v2 09/26] cxl/test: Use device_set_node()
Message-ID: <aBt38JR-YGD5nnC4@smile.fi.intel.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
 <20250507071315.394857-10-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507071315.394857-10-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_081054_739840_5F1B27CA 
X-CRM114-Status: GOOD (  11.96  )
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

On Wed, May 07, 2025 at 09:12:51AM +0200, Herve Codina wrote:
> The code set directly dev->fwnode.
> 
> Use the dedicated helper to perform this operation.

...

> @@ -1046,7 +1046,7 @@ static void mock_companion(struct acpi_device *adev, struct device *dev)
>  {
>  	device_initialize(&adev->dev);
>  	fwnode_init(&adev->fwnode, NULL);
> -	dev->fwnode = &adev->fwnode;
> +	device_set_node(dev, &adev->fwnode);
>  	adev->fwnode.dev = dev;
>  }

This code is questionable to begin with. Can the original author explain what
is the motivation behind this as the only callers of fwnode_init() are deep
core pieces _and_ this only module. Why?!

-- 
With Best Regards,
Andy Shevchenko



