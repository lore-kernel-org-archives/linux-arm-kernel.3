Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85361C36018
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 18:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kWH51YeJ9+XhpqyffNQcHhua3EX3/BxHFAGNBPH3Fyw=; b=aaW5fXedVwF9Ktu8x0nUMm+SEy
	3e0AHPPzsPhWaQ4gqZIAgGj2cnjR7dKD6JyORvMwrISxuDCXAQIwreJ/OQgXbXooLYWt9u7oGZdHD
	nVuBbkt6bK+OrO9xZ+dNn9IcAhnQVtoCTn46olO/SFV06ZQ7ALD9sBUN6Sze+EMcfpdCChWLcbmZJ
	YCDm7wKgfKI8HkmtQKp4M3edmOakX6eKQEdF57SJPj8iohzrUlmNFk2KG6P/RKE9OYPzjT8HFRfsn
	+NG6g25A+H8UlOM7nUT92G7VWJLn62yDMXzMVJYsxbnlmVdkv/yIjtXq5l8GH/UC0jP2Ir/oGq6Hc
	kVwN5BPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1r1T-00000001VDg-1c9B;
	Mon, 07 Apr 2025 18:16:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1od0-000000010AG-3y1f
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Apr 2025 15:43:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kWH51YeJ9+XhpqyffNQcHhua3EX3/BxHFAGNBPH3Fyw=; b=A+vhpVeGzxvuo2PZEY7FAnO4DH
	H4TbYbQUHM7wCf7OQqNO+UVWzc1OREXh1FsV+QTQOjD5Qh/U7fRii6UoNQoq/Ln5605nouZwERkdm
	mk8auqI1PBC2bteY5pJm48kW1C2jGkmLU+WBoS0Y1HvxXrJhOXjA1C/noDp6wFTcR6xLMb1WhFLom
	NN9/OGkSIj/CSyKzRzgMr6lzHwq6O12ms0qZpIrbfVw+aWs3nC9et00n/F+IbLZr0B5S/4SjXtcgc
	yAwEwEvB+DjDAKdGsfjmjxIVbVtvE9sL7w/XMoocERLUvWNALE7D/EtVY3QJyXRuKOypiToFqOklK
	tAGcSyOA==;
Received: from mgamail.intel.com ([192.198.163.11])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ocx-000000081tT-1WrQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 15:43:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744040591; x=1775576591;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+bfBlrTODZYu3pKVpWowUt5ekRSxDmvofhdH7JASR9A=;
  b=Ff7Nk1cyFApMkmTgdOvj6dPANxMPu2n3FHsMDV9u864xyf3SDDHt+oAb
   K0M7GikBrbwLBKK1x+hlEYQpXmKvkaHOgeXKDGRlgBieqTorbDgsFbjsW
   d3aTYkTV0jCEK2pxoJ2xhJzHsDw+x6IU3k5q0IneqovVed9vMeynl37RC
   f3ROlq2ZgLBngr47pyD4DnfWE4VfbgDrnZ+dvAJn25uIgrtZuunpWV6Jt
   XwUqDXlnNWk3J86CUPzP9A2mWCdQIjHkgf2xAa/UHKz89zHgwNC7QZUOF
   hQMXbgz3/Zn6Wjy/5IZ12IOBmjl3Uf/9se+JtTITCq3ufkh+V8yxBGehd
   g==;
X-CSE-ConnectionGUID: 8l+6i+wISDamQTgu6BonCw==
X-CSE-MsgGUID: ZqTlH3PJT06F88lJ++PWQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56096633"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56096633"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:43:08 -0700
X-CSE-ConnectionGUID: z2HD4fT+SiaRoL9kWQVDJQ==
X-CSE-MsgGUID: +KOv1CCeSF2YtmEZIw2xfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="133195403"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:42:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u1och-0000000A75j-0ycM;
	Mon, 07 Apr 2025 18:42:55 +0300
Date: Mon, 7 Apr 2025 18:42:55 +0300
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
Subject: Re: [PATCH 13/16] i2c: busses: at91: Add MCHP_LAN966X_PCI dependency
Message-ID: <Z_PyfyBq5cDeIQwS@smile.fi.intel.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-14-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407145546.270683-14-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_164311_780646_73C053B6 
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

On Mon, Apr 07, 2025 at 04:55:42PM +0200, Herve Codina wrote:
> The AT91 I2C driver depends on ARCH_AT91.
> 
> This I2C controller can be used by the LAN966x PCI device and so
> it needs to be available when the LAN966x PCI device is enabled.

...

>  config I2C_AT91
>  	tristate "Atmel AT91 I2C Two-Wire interface (TWI)"
> -	depends on ARCH_AT91 || COMPILE_TEST
> +	depends on ARCH_AT91 || MCHP_LAN966X_PCI || COMPILE_TEST

I would drop it altogether in similar way as suggested for the clock driver.

-- 
With Best Regards,
Andy Shevchenko



