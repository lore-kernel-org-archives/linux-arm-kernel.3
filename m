Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FB0C71155
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 12:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8IDxGJfxDDR0O3L82RtvGUGRWDpahPdsTSWhyCPeiC8=; b=hAMJrarO8xdzssGkBUtE6oLD8I
	nGR4PWwqZQ4agS2+vSsazNn8aNUFNOcmAgG8DbZp5xEOYux2nxfz0WgW7yIwc2216l+z3RPfDENca
	MM/7PSjMNpH9seGJRiAM4foXpW9cVH0xbce82YQKZbbDYo09w2QMg3TB3sXRMe8jeCW7CQPn6M0Y3
	PK5w6tPkLL6GPqKfdZIIv9a4iwW/jznPR3TxmI77V0c7A8cJX6LqU/nq81SGxpILv4u4VUczYFgRS
	h0aBg4NZPAdydz5I4P8JZT+do/LNeA4LJJdEe+x1CnRB6osb4dJN+cl5w9r/ln3im9xqjWrAWmHbo
	zQm4R51g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR99b-00000004OvX-2IIj;
	Mon, 16 Jun 2025 12:41:35 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR89z-00000004DuH-1aMJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 11:37:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750073875; x=1781609875;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fLvwmw7HfsZKXm1HnRSW1wbqeq9h4sVoqCvM+tJ5kAw=;
  b=deDkh3qpGc8Xk3bWy03bz/lplELoPHnx5e5xGRiAUX0pGm9jq2t+Ef+t
   h27svb0Uiv2g1D4u/IqS91lexCM5oemgiYgthOZFGWbnd5PJ8WBHGYuLI
   s1uHvER07hOQFjaUyjOlXLOsJuHN9DXNLfPE1JEFrvXEkfd9dsiepq3JM
   BLTjvcbRgh1hiYgUwoGkkkot6GQfbk6NHEAenKKr2UofHhqT8WFGOGI1U
   lsSqbufArCrHP+j7+IGQamkG8mq8hdbrtZa92xITCd0hXYOF2h2MhTend
   B3AHbwOyOFlaS0a3IGBXN+QxuyjXLkNzHfZ9pCSAWJUt52a2+bEHgzsq1
   Q==;
X-CSE-ConnectionGUID: nLsQzbcOSKieq3b1QBw15Q==
X-CSE-MsgGUID: oqlhKorGSqKJ3yo7dlQeaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="56015610"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="56015610"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 04:37:52 -0700
X-CSE-ConnectionGUID: uu/dMdKmTy6C/CMQq8oAyQ==
X-CSE-MsgGUID: vmFt6vaaS4WB85EZl06xXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="148347549"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 04:37:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uR89j-000000073o4-2D5Z;
	Mon, 16 Jun 2025 14:37:39 +0300
Date: Mon, 16 Jun 2025 14:37:39 +0300
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
Subject: Re: [PATCH v3 08/28] pinctrl: cs42l43: Use fw_devlink_set_device()
Message-ID: <aFACAwTAyIh2HtNm@smile.fi.intel.com>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
 <20250613134817.681832-9-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613134817.681832-9-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_043755_462332_E6A982B2 
X-CRM114-Status: UNSURE (   8.85  )
X-CRM114-Notice: Please train this message.
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

On Fri, Jun 13, 2025 at 03:47:48PM +0200, Herve Codina wrote:
> The code set directly fwnode->dev field.
> 
> Use the dedicated fw_devlink_set_device() helper to perform this
> operation.

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



