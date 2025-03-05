Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073B7C282E3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 12:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zbIgnxo33TJwl2XpIuiDYO43qXbswWCH8QpY4+o4tns=; b=yGnrpZByD0iP2a58KaXeTOMgdi
	fOpcSKxPXkGpDy71MW81wf6ugWBxgwP+NnOjfNebfv4cHi2JYOy/vT4QvOkEb6XAHph4J0S4snf/5
	GzNhqyjBEjc2rC9HsIfK0Lm7FRbZWA7djN8lAoHTVTSOVBnNT9V6KW0Gt9Cwy9df5ErdluImjGl+z
	U4MvlQi0VEv7Da2G6ZOWclYT2UuLA7Y5TKirkdSPI1YjLyyknuSB2vx1sSvo+VIVKdcQPDMUB8D+i
	9/pobA0pyibn9/ZWukCZ2DxjoSHZtTl+tmkoFKaUbcCTu5AqR0MBpHOurhlfCXi4SaeTHTe6zqVwV
	yWbl//Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpoB0-000000084La-1yqu;
	Wed, 05 Mar 2025 12:48:42 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpm4a-00000007hWE-3J8r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 10:33:57 +0000
X-CSE-ConnectionGUID: LMaRkxFkTsephXSDiFNXlA==
X-CSE-MsgGUID: Rf/bx/F4QZCnvhxQJwm+rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="44936602"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="44936602"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 02:33:56 -0800
X-CSE-ConnectionGUID: Pmo02+QiRyuCyBTsLyBQKA==
X-CSE-MsgGUID: +3/qaz49Qz6WtsiJJYV/Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="123579370"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 02:33:46 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1tpm4L-0000000HNsf-1gjT;
	Wed, 05 Mar 2025 12:33:41 +0200
Date: Wed, 5 Mar 2025 12:33:41 +0200
From: Andy Shevchenko <andy@kernel.org>
To: George Cherian <george.cherian@marvell.com>
Cc: linux@roeck-us.net, wim@linux-watchdog.org, jwerner@chromium.org,
	evanbenn@chromium.org, kabel@kernel.org, krzk@kernel.org,
	mazziesaccount@gmail.com, thomas.richard@bootlin.com,
	lma@chromium.org, bleung@chromium.org,
	support.opensource@diasemi.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	paul@crapouillou.net, alexander.usyskin@intel.com,
	andreas.werner@men.de, daniel@thingy.jp, romain.perier@gmail.com,
	avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
	venture@google.com, yuenn@google.com, benjaminfair@google.com,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, naveen@kernel.org, mwalle@kernel.org,
	xingyu.wu@starfivetech.com, ziv.xu@starfivetech.com,
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, imx@lists.linux.dev,
	linux-mips@vger.kernel.org, openbmc@lists.ozlabs.org,
	linuxppc-dev@lists.ozlabs.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v4 2/2] drivers: watchdog: Add support for panic notifier
 callback
Message-ID: <Z8gohVIQqlA6QquZ@smile.fi.intel.com>
References: <20250305101025.2279951-1-george.cherian@marvell.com>
 <20250305101025.2279951-3-george.cherian@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305101025.2279951-3-george.cherian@marvell.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_023356_837069_C3F0334E 
X-CRM114-Status: GOOD (  12.45  )
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

On Wed, Mar 05, 2025 at 10:10:25AM +0000, George Cherian wrote:
> Watchdog is not turned off in kernel panic situation.
> In certain systems this might prevent the successful loading
> of kdump kernel. The kdump kernel might hit a watchdog reset
> while it is booting.
> 
> To avoid such scenarios add a panic notifier call back function
> which can stop the watchdog. This provision can be enabled by
> passing watchdog.stop_on_panic=1 via kernel command-line parameter.

...

First of all, do we really need a new module parameter for that? Why can't it
be done automatically if kdump is expected?

> +static bool stop_on_panic;
> +module_param(stop_on_panic, bool, 0444);
> +MODULE_PARM_DESC(stop_on_panic, "Stop watchdogs on panic (0=keep watching, 1=stop)");

+ blank line.

Also I do not see the documentation update. Where is it lost?

>  /*

-- 
With Best Regards,
Andy Shevchenko



