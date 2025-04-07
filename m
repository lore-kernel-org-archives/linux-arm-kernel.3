Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56907C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 16:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k9iJegd5Ia1sf2YYhjnML6Z7o/nrmQGKc6nCIrJDSk0=; b=gELT2/4TEAxWh0wrHKdEhd3vcK
	uAxt6wXpJR8Ygt7YhlriJ3xDzLwY+Jcov3Hg7vacEvX/XIFwO375FgZm5Ba6m99jfQ7AkuBJL/Jdy
	B6AeXWj9htxw90OBA7N6UtwtaB6qn7mV/C9Sqg5nwaCNQDfIpPHNkygsRbyjLgRGq1Y3MLb517Zwi
	6H6i9Exxh4XfwejSQJ/qBMDw1+kc6dbrl1lS0tTy5ZV9lPZKV3ZtRLs3xqHNeHbibo6geVz+Lmiyn
	KrLR7Ru60gKtVdVKEvv/JNM408YlIU68ayzM6pIoarJ6fuG0GS4l6UxHoK6tnomYt7n8K+aKpq0Oz
	jXdcT31g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1p52-000000016mk-3Yy8;
	Mon, 07 Apr 2025 16:12:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oFQ-00000000vko-3HtT
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Apr 2025 15:18:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=k9iJegd5Ia1sf2YYhjnML6Z7o/nrmQGKc6nCIrJDSk0=; b=aAyW2rSGjflxZu/4F+X1KilQFZ
	IinzJSdZF75sIeMUolEJcQhCkoOE667+CXKTeNpPFqurzvq2J736dOtNvCcxqVGiGUSkNqkWnVLpP
	8s4F1GKjJGPlE1NdvFRY8VNkTQ2bCBCVU0Rtd6cSyd0Dnb3umNHDjT5gcUN/T2j9Jctf1PHuQU/MJ
	HvivtlYx5Fg6TOQ7nHQKV8fUwf7juM80vNobP9u5+me+yUQdbvSWekqaSIAuzb+QkvEA5hwWjvNMd
	z1uuenEV6NPGxzu/PTjNJWg3zrOy1YNXmO8r2lD4cfK2Tox8CZdiyqfSc3o/8UeEAJg63znBZ4wTY
	6fVZ6eJw==;
Received: from mgamail.intel.com ([192.198.163.8])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oFN-000000080hi-1Gwa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 15:18:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744039130; x=1775575130;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1NJRt6LbnYr5vWij5ePJd37xgMVsqCx9Jmee3+UErzw=;
  b=VFGWwg13Jd/qm+6mk6CF628mrzFSnTInQBbLK6pZ7Nn+3YS/zL6e5WHB
   wW6f2eB/xwGVOmJLMvQ2pl1nrDSrDLwxQDsfGxM8qREUFfeiDXyDp3iTJ
   ViZJfWk5stS6w6MoMpeBafBUo9irodWeD7E46Hx9PdsBOCAkHQGOF4Xrw
   8nbs0L4qlyxRPvsErkSssJgA7FlQ+gHnQPWfFoKMEd2tVepVW3vsuOaEC
   xAhClfzpoHGvVZp6g1SBNGuB+e0uz1hkN7v5A4N4QLnm/p0euw7SKtYqG
   VbowatSNjvpvh+Xx33zOJ4AN/Fmjjpr9V7WCsYe+QXYUSjp4q0PXVI1d0
   w==;
X-CSE-ConnectionGUID: 5u5MqHeyTKq6dNWdnkh1Ug==
X-CSE-MsgGUID: 6BNGJPU3SUGfRjgbab6w2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="62978218"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="62978218"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:18:43 -0700
X-CSE-ConnectionGUID: IqMU7/H/Rw+TqFJhz588Jw==
X-CSE-MsgGUID: TbsEHfwYSTaH3B2GpUiTew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127866370"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:18:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u1oF4-0000000A6jQ-1MZV;
	Mon, 07 Apr 2025 18:18:30 +0300
Date: Mon, 7 Apr 2025 18:18:30 +0300
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
Subject: Re: [PATCH 03/16] of: dynamic: Fix overlayed devices not probing
 because of fw_devlink
Message-ID: <Z_PsxpQC-I5abp0o@smile.fi.intel.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-4-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407145546.270683-4-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_161849_888799_095DBA3C 
X-CRM114-Status: GOOD (  12.16  )
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

On Mon, Apr 07, 2025 at 04:55:32PM +0200, Herve Codina wrote:
> From: Saravana Kannan <saravanak@google.com>
> 
> From: Saravana Kannan <saravanak@google.com>

Same here.

> When an overlay is applied, if the target device has already probed
> successfully and bound to a device, then some of the fw_devlink logic
> that ran when the device was probed needs to be rerun. This allows newly
> created dangling consumers of the overlayed device tree nodes to be
> moved to become consumers of the target device.

-- 
With Best Regards,
Andy Shevchenko



