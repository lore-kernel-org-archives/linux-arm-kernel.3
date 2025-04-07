Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93EF2C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 16:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uMvk5GSSlY6lIH8i4g5HHC2jAyUoBf6HjRkaPB9oNGc=; b=sapqK59GffUnRr7IPN2TDiFUni
	gDwwj2Cq60m6KahtbGnIRVOYO/BjV0piW56iFq0zpkURAGhi9kn65KUnKiQf2gSPu1v9CLsp72hn3
	eDph1K8owb0h1RdnaMSUCYtRQSSuAmNjUNEF40V7ZpykJ+Qt+nicB0oS40ZpKHaZDdzhohpUyJJiE
	gLA4rhuSe5xi2Zyu3etULYa49u8ZXN006e3jxNWvrUe2UCPO5/gK74VWAb+Cqimhuf+zhwiuAhOQi
	C6e1IrKyU2KRxn4YpvdcoV48iYdYNI5NOEFmaExHVEhVYhSAEmXoGjTUTfRnDwr9xRgcJbpjIfzEj
	AtiCV5Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pFQ-000000019eu-2gp8;
	Mon, 07 Apr 2025 16:22:56 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oNd-00000000xQa-0Brc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 15:27:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744039641; x=1775575641;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wzVkiX1WHW1+VEd41zgoCl+IvRzbkG2erhgb/grMY6c=;
  b=KDkweTABnKRrWzNr6Ob3RSO09XarIaNp1DlAebYbttNksP0PgKwlM6Yx
   HTyskV5KxRdChGsoPSeq+ltCSh/4BUHjBNKszyM14p4ADjs9D1nk1C81d
   3o8XHhiF8ls69Hx/2zyoDKSJBcWyVxKZrkYWGl7U/feFuz0C6DCiVbJF7
   UnYqeLZaaQ91G9FDAGxzH+ZgEDBRQWejsd6SbBjf9idwhFmUE5fNF+wkw
   WZtotpUtMOEIShzOlfRKM75UTttZ8/iZAIjzUD/WoH5Q/bdGq5L5K8u2o
   d5H771YKwNBmjymqX4Ls2WrbxCdTqxYzvNNT9sjQQrw9F8H3+XVXKKqNL
   A==;
X-CSE-ConnectionGUID: kHmTDWKyT8KfAzugFhP8qw==
X-CSE-MsgGUID: KR9bGGD8Qj243fTR0IGdag==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56071570"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56071570"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:27:20 -0700
X-CSE-ConnectionGUID: jvFf7bVAQseoAmXxE0FYLw==
X-CSE-MsgGUID: HlBrMmKlQUu/6KGFBwYp/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="128496587"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:27:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u1oNQ-0000000A6q5-0tDQ;
	Mon, 07 Apr 2025 18:27:08 +0300
Date: Mon, 7 Apr 2025 18:27:07 +0300
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
Subject: Re: [PATCH 08/16] i2c: core: Introduce i2c_get_adapter_supplier()
Message-ID: <Z_Puy8eEBc6tubEx@smile.fi.intel.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-9-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407145546.270683-9-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_082721_099197_F1F74C6B 
X-CRM114-Status: GOOD (  19.45  )
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

On Mon, Apr 07, 2025 at 04:55:37PM +0200, Herve Codina wrote:
> The supplier device of an I2C adapter is the device that calls
> i2c_add_adapter() or variants and i2c_del_adapter().
> 
> Most of the time this supplier device is the parent of the adapter dev.
> 
> Exceptions exist with i2c muxes. Indeed, in case of i2c muxes, the
> parent of the adapter dev points to the adapter dev the mux is connected

dev --> device (in both cases)

> to instead of the supplier of this adapter.
> 
> Introduce i2c_get_adapter_supplier() and a new supplier field in the
> adapter structure in order to ease the adapter supplier retrieval.

...

> +/**
> + * i2c_get_adapter_supplier() - Get the supplier of an adapter
> + * @adapter: the adapter to get the supplier from
> + *
> + * return:

Return:

> + * Look up and return the &struct device corresponding to the device supplying
> + * this adapter.

@adapter

> + * The user must call put_device() once done with the supplier returned.
> + */
> +struct device *i2c_get_adapter_supplier(struct i2c_adapter *adapter)
> +{
> +	return get_device(adapter->supplier ?: adapter->dev.parent);

What will be the meaning when both are set? Why dev.parent is not the same
as supplier in this case?  Looking at the commit message example, it seems
like you want to provide a physdev or sysdev (as term supplier seems more
devlink:ish), like it's done elsewhere. And in the same way _always_ initialise
it. In such a case, the ambiguity will be gone.

> +}

-- 
With Best Regards,
Andy Shevchenko



