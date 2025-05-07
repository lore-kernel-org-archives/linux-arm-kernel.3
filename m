Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 898E0C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 15:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8NPFA4w+Mh9ZqpmHMPWqiaAz5PB7Kc28UN2A9G8+pI=; b=U+QFsqohcx/nNfTEFEzt0SCfzk
	/MqvonjXDQTQ2S7f3cfz1Urm0BK/41hAoPaLm0Bz/6n9XSP7qRxTqB5bwPDmxxaE9vWnOFctmNn7w
	Y0xWaFq7+pMKqu6p7rztAhjVfZ1KTcWd6yj9BuxiHRmALryXCJbBhDLErLud/JPABU33h3r8g5abl
	3/r8Ud6DOfQKeOBtniQtHzWq8SF/bStFeU3u2wHLv6cYJLoWORxMJhHn65j4VoOAtGqxFjI+FrwzB
	we5IxZPz9QBjet8IX0zyZq/I6Qbv3+GO1Hw45EGKdoXoI0MUZZT2LIF18gzZz2y1Bx+quDitkSaRp
	ESokop5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCh32-0000000G2uq-3teT;
	Wed, 07 May 2025 15:51:04 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgUx-0000000Fvlr-1LKn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 15:15:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746630951; x=1778166951;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yO+CLLJleqQCOJ1P7Cw9+o2RW0jsGz/mD7j9rcWCyFk=;
  b=G78/cVG39CLwmxJotRJhgotgZ2oOsfTDPmsJUmOCExbP43pe0IxKzTtr
   YPeVloM9S/AcED5gjZ38tN6RHqWq2I+B94j/0h/YhKdHS6crUqvA0S6UC
   vCaTTaOR0iNrdK/RB1DPwXemwglpvP32ryauebMhH4td6NrYkRpW9/u5d
   fPidgsDzOFwYfPzqti849iQQ0bo/Pv1ArCU3R8MnKouzo+HwonvtF1wl0
   xuu9GNw669OK+51/jm2GQzDSunIE3OJJyTI83x9GAhiWOk/ETQlgOnEPs
   acyY4gVCOliDGZIBTvo3cr/aeFE40U/td8pBCZooEGnIUkk1twA0+oS+b
   A==;
X-CSE-ConnectionGUID: pNVTEejJTmSOJThH9Fw8NA==
X-CSE-MsgGUID: ow5JYdDNShKzlyds9D/E6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48480567"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48480567"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 08:15:47 -0700
X-CSE-ConnectionGUID: OcLle1K7QPmnpTiiYJJHXQ==
X-CSE-MsgGUID: jQAKSpd0R9iEv0m2vr7j7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="135906012"
Received: from smile.fi.intel.com ([10.237.72.55])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 08:15:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uCgUg-00000003lXp-2GW9;
	Wed, 07 May 2025 18:15:34 +0300
Date: Wed, 7 May 2025 18:15:34 +0300
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
Subject: Re: [PATCH v2 04/26] driver core: Avoid warning when removing a
 device while its supplier is unbinding
Message-ID: <aBt5FvZ95S1Y_Mba@smile.fi.intel.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
 <20250507071315.394857-5-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507071315.394857-5-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_081551_371233_BE4DEB81 
X-CRM114-Status: GOOD (  22.06  )
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

On Wed, May 07, 2025 at 09:12:46AM +0200, Herve Codina wrote:
> During driver removal, the following warning can appear:
>    WARNING: CPU: 1 PID: 139 at drivers/base/core.c:1497 __device_links_no_driver+0xcc/0xfc
>    ...
>    Call trace:
>      __device_links_no_driver+0xcc/0xfc (P)
>      device_links_driver_cleanup+0xa8/0xf0
>      device_release_driver_internal+0x208/0x23c
>      device_links_unbind_consumers+0xe0/0x108
>      device_release_driver_internal+0xec/0x23c
>      device_links_unbind_consumers+0xe0/0x108
>      device_release_driver_internal+0xec/0x23c
>      device_links_unbind_consumers+0xe0/0x108
>      device_release_driver_internal+0xec/0x23c
>      driver_detach+0xa0/0x12c
>      bus_remove_driver+0x6c/0xbc
>      driver_unregister+0x30/0x60
>      pci_unregister_driver+0x20/0x9c
>      lan966x_pci_driver_exit+0x18/0xa90 [lan966x_pci]
> 
> This warning is triggered when a consumer is removed because the links
> status of its supplier is not DL_DEV_DRIVER_BOUND and the link flag
> DL_FLAG_SYNC_STATE_ONLY is not set.
> 
> The topology in terms of consumers/suppliers used was the following
> (consumer ---> supplier):
> 
>       i2c -----------> OIC ----> PCI device
>        |                ^
>        |                |
>        +---> pinctrl ---+
> 
> When the PCI device is removed, the OIC (interrupt controller) has to be
> removed. In order to remove the OIC, pinctrl and i2c need to be removed
> and to remove pinctrl, i2c need to be removed. The removal order is:
>   1) i2c
>   2) pinctrl
>   3) OIC
>   4) PCI device
> 
> In details, the removal sequence is the following (with 0000:01:00.0 the
> PCI device):
>   driver_detach: call device_release_driver_internal(0000:01:00.0)...
>     device_links_busy(0000:01:00.0):
>       links->status = DL_DEV_UNBINDING
>     device_links_unbind_consumers(0000:01:00.0):
>       0000:01:00.0--oic link->status = DL_STATE_SUPPLIER_UNBIND
>       call device_release_driver_internal(oic)...
>         device_links_busy(oic):
>           links->status = DL_DEV_UNBINDING
>         device_links_unbind_consumers(oic):
>           oic--pinctrl link->status = DL_STATE_SUPPLIER_UNBIND
>           call device_release_driver_internal(pinctrl)...
>             device_links_busy(pinctrl):
>               links->status = DL_DEV_UNBINDING
>             device_links_unbind_consumers(pinctrl):
>               pinctrl--i2c link->status = DL_STATE_SUPPLIER_UNBIND
>               call device_release_driver_internal(i2c)...
>                 device_links_busy(i2c): links->status = DL_DEV_UNBINDING
>                 __device_links_no_driver(i2c)...
>                   pinctrl--i2c link->status is DL_STATE_SUPPLIER_UNBIND
>                   oic--i2c link->status is DL_STATE_ACTIVE
>                   oic--i2c link->supplier->links.status is DL_DEV_UNBINDING
> 
> The warning is triggered by the i2c removal because the OIC (supplier)
> links status is not DL_DEV_DRIVER_BOUND. Its links status is indeed set
> to DL_DEV_UNBINDING.
> 
> It is perfectly legit to have the links status set to DL_DEV_UNBINDING
> in that case. Indeed we had started to unbind the OIC which triggered
> the consumer unbinding and didn't finish yet when the i2c is unbound.
> 
> Avoid the warning when the supplier links status is set to
> DL_DEV_UNBINDING and thus support this removal sequence without any
> warnings.

...

>  		if (link->supplier->links.status == DL_DEV_DRIVER_BOUND) {
>  			WRITE_ONCE(link->status, DL_STATE_AVAILABLE);
>  		} else {
> -			WARN_ON(!(link->flags & DL_FLAG_SYNC_STATE_ONLY));
> +			if (link->supplier->links.status != DL_DEV_UNBINDING)
> +				WARN_ON(!(link->flags & DL_FLAG_SYNC_STATE_ONLY));

Why not

			WARN_ON(link->supplier->links.status != DL_DEV_UNBINDING &&
			        !(link->flags & DL_FLAG_SYNC_STATE_ONLY));

>  			WRITE_ONCE(link->status, DL_STATE_DORMANT);
>  		}

-- 
With Best Regards,
Andy Shevchenko



