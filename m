Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93E0C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 16:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0xx+g753FyL+gxCZCefRyjSMUrTwhHu2H0Fa5MABofY=; b=o/sAuehtD7Tzn+c5byK0BQuex7
	MJo7dBhZ1c9rnk3vfe3r/f2c1R/gQY1lvpyJp2Ss1whuiwBfuFDUeQ689/uEE3pyMuqrMHpauwpsI
	aCqKr6Csh7uFjlg2Aa7Np7KHK7S8ePE6hEbJZxHj9NcojS9wc+KN6VlVRdPXSLHSqk4Wzwb701Em8
	BFQwCuOTYvc4xyi4vLpQXPLheMVGwUjDRP4OemhngJ/6IYbRdDOnJvDv3E4Sv7lgo///IJxkT+Cw5
	1AVPdHXYAuUH0oWRoE4zNDQZGMIYFkKxKFkJByAHGraSXNWVylFNvmhom88WQCCikKL7HKAC2F0uW
	IdhZL5EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1p6m-000000017PP-0cdY;
	Mon, 07 Apr 2025 16:14:00 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oGi-00000000vzF-0ePq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 15:20:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744039212; x=1775575212;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dX1ZFgHNg5lDyS784SIlmHAz22dZyAAbob2jUM2Ek90=;
  b=K/cufWRQ7m9Cs10VAmr4ycvMw8eIm1kLlDthEHQvkxPpGPnbkbKxjJCr
   IsQGjbl5X+yJrxAAIEjW9yo+uRqW0u4fIwfH/DNDoYgWItPtRFRXUyGTk
   pcg8FUJ3zfgJ40qgqQTq3SnrhIkMLfjys7tWBYoilqqDDJde5ScQgZWdo
   CUf9ygIeOElRzBjg023jECpcmtRtqdxvPQs1shToAVXsB4Wb2cTyyOB7Y
   dqQXTt40+88QHuursTkjjIbE3Fp8dbz5MLkOlKlejR4yjRjqGwDaUDjI4
   dEw0cADisMQKd5njoVqBcWY2FirxDIs5GfHeikQClLdXpF5ogehD5D1yv
   A==;
X-CSE-ConnectionGUID: JNL0e3yIQxu/GkBsdQqHcQ==
X-CSE-MsgGUID: ewS7TqugT/K3tyIchQSDYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45600513"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45600513"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:20:11 -0700
X-CSE-ConnectionGUID: MwgiB73sS7uhuB6NDR48/g==
X-CSE-MsgGUID: a1sZoUvtTligUrhNsq7h8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="132712384"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:20:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u1oGV-0000000A6kZ-3EWX;
	Mon, 07 Apr 2025 18:19:59 +0300
Date: Mon, 7 Apr 2025 18:19:59 +0300
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
Subject: Re: [PATCH 02/16] driver core: Rename get_dev_from_fwnode() wrapper
 to get_device_from_fwnode()
Message-ID: <Z_PtH45Zt1P_r35z@smile.fi.intel.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-3-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407145546.270683-3-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_082012_205507_4DBC9730 
X-CRM114-Status: GOOD (  10.45  )
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

On Mon, Apr 07, 2025 at 04:55:31PM +0200, Herve Codina wrote:
> get_dev_from_fwnode() calls get_device() and so it acquires a reference
> on the device returned.
> 
> In order to be more obvious that this wrapper is a get_device() variant,
> rename it to get_device_from_fwnode().

+1 to the change.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



