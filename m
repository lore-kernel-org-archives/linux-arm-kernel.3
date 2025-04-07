Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C746CC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 16:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGonsTSDnkPeTC0UiouOAkCsF3WpMS6BNsB42UKzrJc=; b=lkCeY0XosSugQp0pROLJXyYmzM
	O6al6JTZegvkSwx91xDhNMep437HHRFr2k+UAAXgLZcUC6e81zV1h6OKfSw8pxfW4guCV59Qm126Z
	FwLQbLem3jiwcm6I8ptqrqAJGa8L5YLd5kS7+vlSkt018Aj9hexYzKWio3C+pzIwhgBgX0GYX2t2h
	Nx+M/Sfjw96hlx4lmYfAyLuc9dZBl1M4S4ClPUcqY6XdOXxLO+8Ih15L+ba+nMhbaM8KzAuNxhfZZ
	5LRdPI4XV3GS1jrb0s5uhisjL31uSsTCyIoLDJglZTTSvHoIfOd3nAisH3yJVYer6Pa93II/WA0l4
	HYnx9A1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1p3J-000000016Je-0eim;
	Mon, 07 Apr 2025 16:10:25 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oEF-00000000vXx-2suB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 15:17:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744039060; x=1775575060;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PslDmB+xXRuJt9oVyCJAThWQ5Sbb1YZU0r34pKry31k=;
  b=nC9z776l8lhPFLQlfstJ6KIBa9Zm8YZNUOO2gbwqUa5JjCRFxmjULZxJ
   iJwC2bsiqVvENn8A1mzDNSpDJ4Am4P2+ABeApHeo7Fe8xkviFoG1AcmV4
   p5LpLPESKGmZpLcgx69dSiq0ZuGnWU0oKpl4rnP4KL1E6fOZOIkkEvk9T
   HDEv4namLek8Xv/gOz9ZSTGV2gQZAEWe26QH3MKlQR03AGuAVCJTccc4N
   lGwmcve6rUiaE90BRK2QP1KPZcq78MUxDqfoj3XGC22b5wONHTgXdDLyu
   TpRHBfIdnCXBii8J3OWIUVi1DErkIJp5/GFPhnC1ntZA+oozlWYSkCk+a
   A==;
X-CSE-ConnectionGUID: cMbgcCnuSgK/tMgY5vvAyQ==
X-CSE-MsgGUID: WQzcNGm/TcSPGmVHugFsYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56069872"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56069872"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:17:37 -0700
X-CSE-ConnectionGUID: Q9eEfbCtQner0+TLJmb8Tg==
X-CSE-MsgGUID: /e5hd6FESmOlGWRlOu5MBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="158973456"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:17:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u1oE0-0000000A6hm-3YVn;
	Mon, 07 Apr 2025 18:17:24 +0300
Date: Mon, 7 Apr 2025 18:17:24 +0300
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
Subject: Re: [PATCH 01/16] Revert "treewide: Fix probing of devices in DT
 overlays"
Message-ID: <Z_PshFwFJQ0z8JOU@smile.fi.intel.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-2-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407145546.270683-2-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_081739_739763_94DE8FE8 
X-CRM114-Status: GOOD (  11.14  )
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

On Mon, Apr 07, 2025 at 04:55:30PM +0200, Herve Codina wrote:
> From: Saravana Kannan <saravanak@google.com>
> 
> From: Saravana Kannan <saravanak@google.com>

No need to have this in the commit message.

> This reverts commit 1a50d9403fb90cbe4dea0ec9fd0351d2ecbd8924.
> 
> While the commit fixed fw_devlink overlay handling for one case, it
> broke it for another case. So revert it and redo the fix in a separate
> patch.

-- 
With Best Regards,
Andy Shevchenko



