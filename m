Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888CEC369A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 18:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oi/73gB9MRwWE6hbcPzMmYk7k/NXHWGM1TFYyzZ+QAI=; b=U/XJ9QT4GTQa3nUf1HhRISjCqI
	tpNHMLESeWiZ9L0pPvzf9/UOl5qMBzeg4cQ4s3hYHdCh2oesvvo94UwFO8nV+sBWLZ/yic0TrUPB+
	P2TKhlXp8ISmlbqSam0cFo/HfMVJwoVUOyEX70gcqinfbgJxUHPLtY959MYXEC+qCcEwYPxTEUyJS
	aR0NG0tV+kn+OK/uli2JIculYz1VKXDmqtrIxerTFhQqZjEJujRguKuhXriFinbi2kyKCdjsPiYcF
	ORDYtpleXwbdF560XkVuEksC8sdD1bn6AHrotC3U8DoUclM0f73u3AIq5A9GT4qj5QhPKK+zZi8t+
	CLQFaOWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1r1R-00000001VBY-2opB;
	Mon, 07 Apr 2025 18:16:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oYk-00000000zKW-182j
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Apr 2025 15:38:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Oi/73gB9MRwWE6hbcPzMmYk7k/NXHWGM1TFYyzZ+QAI=; b=TIgropGpuFhCs48p/NsB2KV2mH
	5feitVwb+9UjksCn6tbDl15k87Vja7WkJF49WhzoVoPHCJPMn2ZI0flTWjaCerxlnlzWGYDuqu+6K
	PtRoelMtXZamSROoAjFKvSH6haJBQSy7YCp46C3jIXeG9gaXNvA0k5NR7Ir8DRfD5KNAlpODb2Tvv
	a+sTfwKq57gD+ngsoFqbd2Ykp7xzYL5d5aOJFGG5RR7+oWVoNpKweZTI+975juKRD2qjf54fT2dzw
	voVeOSUlvZw3b1qvDHXioQkkgoHURFojyPsFcoSWPUxGOmuOpIqQj85DCHMwyETBQtMdgvPHRPLB7
	7SXFC/KA==;
Received: from mgamail.intel.com ([192.198.163.9])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oYg-000000081kd-0g9M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 15:38:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744040326; x=1775576326;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LKcgqnfETeD5E25/OJgmgcuHbrOXdpZ82Zu7gUGorQM=;
  b=bmfB2HtCLMnoOW+bgFO7Ze5AkN2ZGs/aCBvmu7Ci7uOcdbCClfo6oQIh
   CXZmrYWH/maO1iS9w6j1+KMfmTuLHkD0NFsjDlKYoCOLQjw0Y4dFJEPEN
   QAmjWQA2xC3D+4U1CbRoPZ1veRiQPm/tFp+GZ5Gbg8e7wwz9jDGExsZNX
   smZu8JyFJyxPhaTlIeBC1z84n25sGl42ARAwBa3kE4QWI5QzuIn6XiCNu
   sXI6ZZkggoFo0eTkpFVI16pFgC5FPs38e4OdV9dJws1jhmQv5DmqaPrJI
   9UniJFJ7n5gcUMZnhmf1XdmzZS4lWKObwDhCAs3sQmACMNoDRk3d4Dws2
   A==;
X-CSE-ConnectionGUID: FYuhRxV2QSiOQjrWy4cytw==
X-CSE-MsgGUID: Rbl4LtShQgK7bGZbn/k6ZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56073773"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56073773"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:38:42 -0700
X-CSE-ConnectionGUID: ZaM6breCTEu2fVcXhk221g==
X-CSE-MsgGUID: SW7yuP2sS1iNa9uO/jM7Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="128498972"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:38:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u1oYQ-0000000A71t-3Nnw;
	Mon, 07 Apr 2025 18:38:30 +0300
Date: Mon, 7 Apr 2025 18:38:30 +0300
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
Subject: Re: [PATCH 12/16] clk: lan966x: Add MCHP_LAN966X_PCI dependency
Message-ID: <Z_PxdmKbBGlhpQpr@smile.fi.intel.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-13-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407145546.270683-13-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_163846_603937_FD20196B 
X-CRM114-Status: GOOD (  12.86  )
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

On Mon, Apr 07, 2025 at 04:55:41PM +0200, Herve Codina wrote:
> The lan966x clock controller depends on the LAN969x architecture or the
> LAN966x SoC.
> 
> This clock controller can be used by the LAN966x PCI device and so it
> needs to be available when the LAN966x PCI device is enabled.

...

>  	depends on HAS_IOMEM
>  	depends on OF
> -	depends on SOC_LAN966 || ARCH_LAN969X || COMPILE_TEST
> +	depends on SOC_LAN966 || ARCH_LAN969X || MCHP_LAN966X_PCI || COMPILE_TEST

This doesn't seem to scale. Why not simply

	depends on HAS_IOMEM
	depends on OF || COMPILE_TEST

?

-- 
With Best Regards,
Andy Shevchenko



