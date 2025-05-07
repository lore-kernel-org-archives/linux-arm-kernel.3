Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AAFC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 16:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AzDi1EOV/IcqgZL26v3KAdXz/T9T1klqvVEPllnXfa0=; b=e4UDG+dA1wiSVVzw/0axORDWPJ
	6xdFtduHN1r4yYCs69E8Xx2gP3E1bMl3Bckj8YMWtEGjw0iCv4uCCp5o7welHgz/CpD2+DjX3q5br
	/3eggTSCaDFBFN7Hjm4htbcYcs99Mm6qgkS0M/Y9fqiqkRqT8t/YNBKbgBC07gz6Ys0sfLbH1u3d5
	orif4tynnIpX+6QM4b7vd4w4z0j2fl858pGfC0IABBRiX1P0vO43Fxwpe4czdphFWMetQts7NndGB
	lZ7XQpXoE1KNiDcIM50yY1eKnhflj/6qcI/LwaM17mjfjgfycQ46Pylg7EXiTha4e3TD/V1SZtMSp
	6mAbP9jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uChGY-0000000G5mF-3vKm;
	Wed, 07 May 2025 16:05:02 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgIQ-0000000Fsue-3OnC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 15:02:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746630175; x=1778166175;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vtUHYngmcvy8/hID4LtvlRBZCfZROB/R+TjQOTME2Bg=;
  b=hFkFaMoVPDeZwlQkBf9nAxgHk3FnX2hqj2MM305TMlU1VQ5fAeuQrxY9
   8LOV1J6mhS1rkIOsxAIK1AqKBrGMHvNmr5fDYdoAusqX3jhjXuyrOa/EP
   IeNNAbRzS8o8ua+tqQa5SMIx0vBLWitwyXILQBXDg5QOPX2QFDn0tsuL3
   i3Lm1En9rkQcA2kSNanXrhJLRXUXB+tlFqKcCFx5GcJTbAgJwQ4YRj1Sf
   RauDgL7QUrfJ79UdVTqH11ppCd8GievMRKu6jpnC65kjdtaxcrl5Vqj7g
   nNPAMH1wRDUIOGU5gB4Zzj/8hAH8TFJfbnLDrJZZQFez+DcPi37NCaJXk
   A==;
X-CSE-ConnectionGUID: W3NMC4qwQReNRtxoN94q5Q==
X-CSE-MsgGUID: WDBuJL1sQkmC+rzwKDr2UA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="52020392"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="52020392"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 08:02:54 -0700
X-CSE-ConnectionGUID: lRvf7inWQZi1tpGGkpwiJA==
X-CSE-MsgGUID: n7eeEJ6hSiWvPOaKwLixag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="166908528"
Received: from smile.fi.intel.com ([10.237.72.55])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 08:02:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uCgID-00000003lNr-0NGr;
	Wed, 07 May 2025 18:02:41 +0300
Date: Wed, 7 May 2025 18:02:40 +0300
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
Subject: Re: [PATCH v2 06/26] driver core: fw_devlink: Introduce
 fw_devlink_set_device()
Message-ID: <aBt2EHYf6j6Ulthb@smile.fi.intel.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
 <20250507071315.394857-7-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507071315.394857-7-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_080254_908100_07291E12 
X-CRM114-Status: GOOD (  10.36  )
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

On Wed, May 07, 2025 at 09:12:48AM +0200, Herve Codina wrote:
> Setting fwnode->dev is specific to fw_devlink.
> 
> In order to avoid having a direct 'fwnode->dev = dev;' in several
> place in the kernel, introduce fw_devlink_set_device() helper to perform
> this operation.

Makes sense, can you also mark that field as __private? So sparse can catch
the abusers up.

-- 
With Best Regards,
Andy Shevchenko



