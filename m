Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF27C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 17:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wy9GsvBiCR9VYpKPQzs6DkxJ0W1NPw2sflr1OlXHf9o=; b=cFKL+Ku3M0qC4obXnW4uIQtVWS
	OcDnNkhavYjS/PSQoHAUED4Ofv948kKeFQ3qiIf6LRkBSTmDQCF99ZTuBij3Jcf3tg7BkoAwm9CwF
	+KMb8bVHv0mJmOxT4AFCVJj6YKnfpAJ5GOaa+07QWxVMhA9RKjueHl9HLeqHVB1eW/Jit0GCybTPD
	Z/vZbdWbwLjW4zGLi41oavWRyNPz10e0d0qBKjQSLYxZANPrUOjC1es9JGqpAU+tx0CgLnQsin94y
	LC1vV/8Hno3UlWQibxS11NV4ACWm7omzWN/63Ej0JGt2/sfEIekAaktsq2kiNPm3UrHB8ZSSkKemV
	2yaOyliw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVD3j-0000000FQZC-1MO8;
	Fri, 27 Jun 2025 17:40:19 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVC1V-0000000FI0f-0d7b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 16:33:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751042037; x=1782578037;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y2MaEeceKNbv4yiFNLVL6EuLylExKPZ4w7oafZAoUjc=;
  b=Fs2Ad+ugEnW8qSsWArq7KVp/lsBNdKr6NrF7KParsLYBR7T+yEk/tJaU
   dyJPDQmYz4KYZ6Su5/F793XJ0LVHZv5x4RKaroLfBoCkROG6Ygnjr7ygv
   Rowen59uXo/Ceoz/Bx0T675mCWUlY85IT+yQh3gWEVpQ0S1Z+d9xWyIqR
   DiG59v7XJ/QOfNdmCCIvyzGsZ1ai7wd1kJ3ECMn+h/Nh8c1CmbFdy2Hwh
   YdW8uiMPCnRuGzYhQYU7ZMShL/imkbJm+EoSxZp9qWL1yzewGX/yKik6J
   +dnhKUOCC6BxPOaMZjTaDXUe3BSz+TNDA7Spespo1jEHMrac/0b+ufLVT
   Q==;
X-CSE-ConnectionGUID: GddzkJHbQVickcp1lvnd9w==
X-CSE-MsgGUID: l4Ur1wmoRkGfB812TZmL7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53079642"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="53079642"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 09:33:56 -0700
X-CSE-ConnectionGUID: 1C2IXb2STTuL8X3DDhbOyQ==
X-CSE-MsgGUID: danC++UFS6ObVuVtA6jiVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="157388500"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 09:33:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uVC1D-0000000AXHz-2uXB;
	Fri, 27 Jun 2025 19:33:39 +0300
Date: Fri, 27 Jun 2025 19:33:39 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Rob Herring <robh@kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>, Andrew Lunn <andrew@lunn.ch>,
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
	Arnd Bergmann <arnd@arndb.de>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 18/28] of: property: Allow fw_devlink device-tree on
 x86 when PCI device-tree node creation is enabled
Message-ID: <aF7H4-toeb7Ouz3d@smile.fi.intel.com>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
 <20250613134817.681832-19-herve.codina@bootlin.com>
 <20250627162245.GA3513535-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627162245.GA3513535-robh@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_093357_242349_60D10849 
X-CRM114-Status: GOOD (  18.92  )
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

On Fri, Jun 27, 2025 at 11:22:45AM -0500, Rob Herring wrote:
> On Fri, Jun 13, 2025 at 03:47:58PM +0200, Herve Codina wrote:

...

> > -	if (IS_ENABLED(CONFIG_X86))
> > +	if (IS_ENABLED(CONFIG_X86) && !IS_ENABLED(CONFIG_PCI_DYNAMIC_OF_NODES))
> 
> I really want CONFIG_PCI_DYNAMIC_OF_NODES to go away at some point, not 
> add more users. 
> 
> I think this should instead check for specific platforms not with 
> kconfig symbols but DT properties. For ce4100, you can just check the 
> root compatible string. For OLPC, there isn't a root compatible (in the 
> DT I have). You could check for /architecture == OLPC instead. There's 
> some virtualization guests using DT now too. I would think their DT's 
> are simple enough to avoid any fw_devlink issues. 

I don't think this is good approach. The above check is more reliable in my
opinion.

> Alternatively, we could perhaps make x86 fw_devlink default off

For my (little) knowledge I believe this is not feasible anymore.
Some x86 code (drivers) relies on fw_devlink nowadays. But take
this with grain of salt, I may be way mistaken.

> and then enable it only when you create nodes. Maybe it has to be restricted
> a sub tree of the DT to avoid any later interactions if devices are unbound
> and rebound. Not a fully fleshed out idea...

-- 
With Best Regards,
Andy Shevchenko



