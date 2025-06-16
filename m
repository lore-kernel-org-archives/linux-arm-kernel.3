Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8ECC71155
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 12:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J8OeEZclDj0ktzzDu8Ah+NctxvkY1GNz5XTPYgHxIVY=; b=qrghkJFs/dQ/kgYd2KkfhDIdoa
	K8dXY5FiZpQoym7byRVG8pYCjeEeVtYdAj0L6sH1nJtQE24k81m8yTWjMuuU78LqLkcJ8/eSCQyuC
	beFdVm6BdeFhhkgDYaRxDh1JdXRj1OtMKhE4YTq07V16h/RGBW4jsLc+bzcKNhlc+JPe3SyqVHCLX
	Hn/oLyHkXEu4f2ALCJYp37wla2w7pER0AxHz4v/EfY8wJgwP06fyG6bwBUaBr3WmxGWzzD/n3Esxg
	PkjsZL5EJtmrDVbY1UQQlnl5jq7bbLQ4bVYm9+jT6SS+/yOuPXBHmCwyflivY//f46TMp9SHAzxyb
	XCVMEXdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9Dy-00000004Pma-3EjJ;
	Mon, 16 Jun 2025 12:46:06 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR8B2-00000004E6b-0ccn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 11:39:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750073940; x=1781609940;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/8TbTg+Rq7g+nI2tGAfe3AOGwuVcjXQE+KjkEaEhDZM=;
  b=mKXrRLV+KxhMIUcPw1VnzwIFVrmfDVUD+k4XzDaf3IbqwEuoUmoRZFJW
   lKsUFmJKV1CBY32uv//pZrbig3/M3x6/QE00xDgoy4tN8bR8dhTz1Ew3r
   zpKUaQTxxSV0aJLSQPHLBkCApw19CRA+HlnZk685mkpTsp/WgZrJwNOzv
   HbW/ovOEuufSMDl0I1x3bcE0zbWsGqb7M37wgaDGDhxE0V6eEnmx5L4xH
   d2uheBDlqZmvB4Qhf7i0UXpGxQ8esmMNMiyw3l1frKz1ErX93bsUNweb9
   n/kLYZMxXn86+3lwO90SYcfya8aNiLg+iimtDHHJmFm1isTuHbCtFnNlH
   A==;
X-CSE-ConnectionGUID: QZN3cXX/Tp6cNVSkgDphKw==
X-CSE-MsgGUID: bhnE6l2fT5y2pALy21/kTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="39821623"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="39821623"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 04:38:59 -0700
X-CSE-ConnectionGUID: QHF3MIx1Sbm3cPmZqxp25Q==
X-CSE-MsgGUID: 2KQYlUUgQY6oxpvI+njcjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="149345151"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 04:38:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uR8An-000000073ou-0Cpl;
	Mon, 16 Jun 2025 14:38:45 +0300
Date: Mon, 16 Jun 2025 14:38:44 +0300
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
Subject: Re: [PATCH v3 12/28] driver core: fw_devlink: Tag the fwnode dev
 member as private
Message-ID: <aFACRPNCxYfZZp9i@smile.fi.intel.com>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
 <20250613134817.681832-13-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613134817.681832-13-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_043900_198045_5C65CB42 
X-CRM114-Status: GOOD (  11.17  )
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

On Fri, Jun 13, 2025 at 03:47:52PM +0200, Herve Codina wrote:
> The dev member in the fwnode structure should be accessed only by the
> fwnode core. The fw_devlink_set_device() helper has been introduced to
> avoid users to set this member directly. All users have been converted
> and use fw_devlink_set_device() to set the field.
> 
> To avoid future abusers who might set the field directly and allow
> sparse to detect them, tag the dev field as a private field.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



