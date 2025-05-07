Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E28C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 16:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uy1obk0A6v34OA2BgeGB29Wxb5ZnLaaxMwlecsML1yM=; b=N4i/2rMo05dG/zAl1775jjwTL7
	asesyZ7oFOCxaXhUZiLvHVaIr07XnDSsUi0h/vyXWrXrzOipA2aDg2Oje5rronlFuRUnX6ILALUKX
	1S2F9OkIeeqRQZHl60tJKf28NejrlmfDBhbPWhKjyvSGJs1BbSo4BmEcjR0rRIqHNVdiuXhwxVjmh
	wkzeiNKuAhBfDHEZe6GNSu0MWF8yIh4LQCZTLQIBNGaWOc4+OuCH7lV2ivTGUTE2BzbFnx9i6Mc3u
	qDsaJjb+k2VE6FlsmVW9l/PKTcEZe+c9QsaqtFXyhhrPHO2OlmGpx3MnBB2tbSXSIq4EVIbG1bzrD
	vOpkP1Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uChML-0000000G6tN-1aaL;
	Wed, 07 May 2025 16:11:01 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgLh-0000000Ftee-2PWV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 15:06:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746630377; x=1778166377;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y/WUVh0ev6M+r+m9bgj7h8JDEj1XP6+S3ee84YZotzA=;
  b=hJiGIWPg/G9N4WvBldoO/Y2e03XAxZrVsEy7QekzNM65YlyvwHuDW/kD
   ox2GHu00B3nXkw/yFJDFcXC7LA3k8CGhJBRBh29n7yTe6Z8P/XzQ330xC
   eJXiEB+hTjd2Fq91aDTsQT1CuVwpJnMX9Kpegw3KDHI63uxdIAuc93esO
   9QFGEXsTosU0WTc6204DD74jkg4FcnaKsGW2ak6BdV7jFrs86ImCnXJsl
   YsFfTNtwAwab2sqCHkRtRv5I5BcGArRSCjr+/TF1/RCS/+AtAvWZdry7F
   HHG6Y9iZUV6AL33CsnoejLdhEkbIoRnRLo+/EMNspfQYHwj5z4khkt8vY
   A==;
X-CSE-ConnectionGUID: 18vCzMTcQou9G4p6/Exlaw==
X-CSE-MsgGUID: 8KJtvMjLR2yWVqjJv6L6vA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="52183817"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="52183817"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 08:06:16 -0700
X-CSE-ConnectionGUID: Z/H6YXNKTMeyF9mW6VqssQ==
X-CSE-MsgGUID: d/50a7xkRzuk5pzTD8W5Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="136502215"
Received: from smile.fi.intel.com ([10.237.72.55])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 08:06:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uCgLS-00000003lQ1-4BdZ;
	Wed, 07 May 2025 18:06:03 +0300
Date: Wed, 7 May 2025 18:06:02 +0300
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
Subject: Re: [PATCH v2 08/26] pinctrl: cs42l43: Use fw_devlink_set_device()
Message-ID: <aBt22olAebSy8Xx3@smile.fi.intel.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
 <20250507071315.394857-9-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507071315.394857-9-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_080617_626766_57C4C52F 
X-CRM114-Status: GOOD (  12.30  )
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

On Wed, May 07, 2025 at 09:12:50AM +0200, Herve Codina wrote:
> The code set directly fwnode->dev field.
> 
> Use the dedicated fw_devlink_set_device() helper to perform this
> operation.

...

>  		fwnode = fwnode_get_named_child_node(fwnode, "pinctrl");
>  

>  		if (fwnode && !fwnode->dev)

Why do we bother checking the fwnode->dev here?
Just wondering... Hopefully the original author of the code can explain what is
going on here.

> -			fwnode->dev = priv->dev;
> +			fw_devlink_set_device(fwnode, priv->dev);
>  	}

-- 
With Best Regards,
Andy Shevchenko



