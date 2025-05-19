Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DB6C54754
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 16:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lcehxp6u1E0CShe+sJts81sH4YHaRpECD5CXS00XTM4=; b=RLmjSHOzCTInYvOamaV4Pt7NEV
	ys8y1QU2WfIw5Tteb7kUfJBbqveJQPXMTpRPjJDWYFv+PYLVZjdOBo3zfBzO5AAWvpJgcfbEwqiSl
	/9JSjTb8uOZft//xrOtck9hx+dWYaDmNSHT3rHUPq5+1uYeqXTRN6lsIVO+AwQfY77vBCApiFrsq5
	Vw1Os/7QUnz614RhjIh6mLHrZVFw0ZgL0Lc0+1h/AfuB7f/JszCO9qrk2+2EE2MHoCmoF6pwgzKEz
	EPL1P6cd2r4r+7++l0QDPlAoLnz+tLiyAW+PXRMsvoVvQPOKzbDWn+wycUhdYIbgH8rJyco7JffKm
	URQmeNsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH3bp-00000009r5y-3SyE;
	Mon, 19 May 2025 16:45:01 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH2fE-00000009esf-2xR7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 15:44:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747669469; x=1779205469;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ucbRC+By9t6hiwEjSnTGEwM8Sp7zd3PXSGJLq749aGA=;
  b=gOMWImanockod7A/QxMhBip60hxhwDqRMjfZuqjMPulix1cJgkOeSY9G
   uVp4Yfeopxznj7KPDWdx8aDdTANeeh0rx/ejfIZCzjkxiti+WqL+PmzFf
   o1nKoJkAzHClGxWTcgXkZnlKwp4AhiTlkj+901XhieoRlr1OeDhQ1GuCe
   ztEM0zzEnZyGd/e813Xl1dy35NKQ6y1kG+fb5ugBZeRgcOZQ0s42OGZaB
   h6DRoK8EOBiuZzWHD4AbfQO1MQw0rWE+a5DeGvFSD1A2mdz0gEuP4HjH3
   3stFLGelmUzcOHA/rhR55DG/iKyxCkWH6ilFRwL5H5rubH2wuP/0bcbzZ
   w==;
X-CSE-ConnectionGUID: Sq/+Ec8hSXmYObjJ0FCzZg==
X-CSE-MsgGUID: gV9Sq0JrS/qIZopAABbioQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60966645"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="60966645"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 08:44:28 -0700
X-CSE-ConnectionGUID: D9nnBx4yRm2U9Gb6be0UuQ==
X-CSE-MsgGUID: O7jOjWPERG2e6Txxz393/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="176513494"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 08:44:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uH2f0-000000034rN-2cA2;
	Mon, 19 May 2025 18:44:14 +0300
Date: Mon, 19 May 2025 18:44:14 +0300
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
Message-ID: <aCtRzm6nPk61WtRj@smile.fi.intel.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
 <20250507071315.394857-24-herve.codina@bootlin.com>
 <aB0ERYKdRreDe7Wt@smile.fi.intel.com>
 <20250519170004.631d99af@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519170004.631d99af@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_084428_779396_D85AD642 
X-CRM114-Status: GOOD (  19.16  )
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

On Mon, May 19, 2025 at 05:00:04PM +0200, Herve Codina wrote:
> On Thu, 8 May 2025 22:21:41 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Wed, May 07, 2025 at 09:13:05AM +0200, Herve Codina wrote:

...

> > >  static struct pci_device_id lan966x_pci_ids[] = {
> > > -	{ PCI_DEVICE(PCI_VENDOR_ID_EFAR, 0x9660) },
> > > +	{ PCI_VDEVICE(EFAR, 0x9660), (kernel_ulong_t)&evb_lan9662_nic_info },  
> > 
> > PCI_DEVICE_DATA() ?
> 
> PCI_DEVICE_DATA() need the device ID defined using a #define in the form
> PCI_DEVICE_ID_##vend##_##dev
> 
> PCI_VDEVICE() allows the device ID value passed as an integer in the same
> way as for PCI_DEVICE().
> 
> Also, according to its kdoc, it allows the next field to follow as the
> device private data.
> 
> IMHO, I think PCI_VDEVICE() use is correct here and I will keep it.

It's correct, no doubts, but using PCI_DEVICE_DATA() makes sense when you need
to supply driver_data. In particular it will take care of needed castings and
also as you noticed asks users to apply the regular pattern for PCI ID
definitions.

Moreover, the 0x9660 is used in two drivers and it's a good candidate to be in
pci_ids.h. (Note drivers/pci/quirks.c:6286)

-- 
With Best Regards,
Andy Shevchenko



