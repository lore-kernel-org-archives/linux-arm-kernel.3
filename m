Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB3EDC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 18:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/GB+Zu/4YsQGzQqYpcdxTnnCftfJaIeSWkLl4+CKVYE=; b=1UtwyPPGIoz14aUGqDnvmkiBAh
	4k2Y2zpMjP8bHTENr7M/mYFoH1ppq+MhnUU5mO6iP95VnC+3yZmGH6lQs2Cb3VToL72Q7K7wEZxvz
	kvXdwfco12d6zxPGFu03znOjHaVXJQq4XMSlGtqB0WSVkYLSi41Hri/xa3XYG8JkJT3y0epqpsHIP
	Qio9IET+sC5nM5GZAfV0n4QmORg3E+kGYNlwdx2hgP9oiXZ8vJT3I03qkZ2VUSee6X7alf1pLmEi3
	zryfxwHhihlhqKwNelps0VtkukwI3+Dahje5Ft0gT7ha+h0O+pkQwckzb+i4wldZdoObPG9/ix1fF
	rmb0Zmvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD6EA-00000001ZnG-2E6o;
	Thu, 08 May 2025 18:44:14 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD625-00000001YCF-2siq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 18:31:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746729106; x=1778265106;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lmW0Dg0L5hEpYSQrGyyAU2RGWEg1vYLosLy8p05Df9E=;
  b=kbVWD+89TsaU5YN6EeJnLmwbUupdjkow/0bxOu/0lZXHnNbx6RQsEAMP
   PcB1Zk0B1fIc/OI47O5I+ZtgGe1dyM0dEDCU7FGYnjuKtU7oA9vylHufi
   JMBOd3EUX3y4iUck3Zf8aQsb/OG9QKrX9ZhC6KvWq++apEz9Jwd4KhI77
   6bK12Q/shFFXesKqSqD6xhnzmIWe0RdQ3Q89vomA1Ep0uVEUqL7BHcxrO
   ebXWClVt9Xa/z/hYRYwIjX5wHoWZWufgBwzMiniBk7g0Egm+rl9k2tjkj
   qyEZoZJq9V7VxQ+r4uCDtl87wvsl5sGRQYQnWIsaq4MAOASvSbIiSHf31
   g==;
X-CSE-ConnectionGUID: mbP+9KmDQtWZWQ1G+gM13g==
X-CSE-MsgGUID: 1NnReXwMTLmOzu6msAaIYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="52185440"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="52185440"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 11:31:45 -0700
X-CSE-ConnectionGUID: XR1rcrq6RLiCNe1U0w4udg==
X-CSE-MsgGUID: lI5CdtKsTd+NqPODxBCj3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="136774458"
Received: from smile.fi.intel.com ([10.237.72.55])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 11:31:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uD61r-00000004C9z-45LZ;
	Thu, 08 May 2025 21:31:31 +0300
Date: Thu, 8 May 2025 21:31:31 +0300
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
Subject: Re: [PATCH v2 12/26] PCI: of: Set fwnode device of newly created PCI
 device nodes
Message-ID: <aBz4gxUlnSgEtHn8@smile.fi.intel.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
 <20250507071315.394857-13-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507071315.394857-13-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_113145_802543_336C54A0 
X-CRM114-Status: GOOD (  16.54  )
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

On Wed, May 07, 2025 at 09:12:54AM +0200, Herve Codina wrote:
> Device-tree node can be created when CONFIG_PCI_DYNAMIC_OF_NODES. Those
> node are created and filled based on PCI core information but the
> fwnode device field is not set.
> 
> When later an overlay is applied, this consuses fw_devlink. Indeed,

consuses?

> without any device attached to the node, fw_devlink considers that this
> node will never become a device. When this node is pointed as a
> supplier, devlink looks at its ancestors in order to find a node with a
> device that could be used as the supplier.
> 
> In the PCI use case, this leads to links that wrongly use the PCI root
> bridge device as the supplier instead of the expected PCI device.
> 
> Setting the fwnode device to the device of the PCI device allows devlink
> to use this device as a supplier and so, correct links are created.

-- 
With Best Regards,
Andy Shevchenko



