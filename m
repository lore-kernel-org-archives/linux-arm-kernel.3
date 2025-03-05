Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225E4C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 11:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1QcG68X2dThxXn08oi0mv/sMSvoU2vw3JRxKH+1IpVA=; b=G0wv5IftlwXRCgxtNiNpbxLiSG
	qRhaCtwuj+9z+SSG5abSGyFxVcaeleS+d5rjjJ493n6+oIspTT1r3VypcfRSrMORZ+q3T9+mPooYz
	TJI/Ga+iV3xbIt3cytUBo0kFEAIYW/hUywDIC9S7jrfA8Qmr40jkLMrUZLbWASes/qZSs3/f6i7X4
	nE+akdDOgj8zQemZ6/CgtWBci8irdayOjfHGXHvU2y20z6X7LV8epNBMpsfd50daFh19F7YDBWAvz
	J0761853PnS8vwg1iVSMwa3N5jVxS6zRIbSH7S9u4x0b3AqTpWGdRN/NI+gJ4fTvKHJjZHUd8nnM+
	YxpOGnwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmvc-00000007rT9-3cOr;
	Wed, 05 Mar 2025 11:28:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpm1Y-00000007gh6-1ivg
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 10:30:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1QcG68X2dThxXn08oi0mv/sMSvoU2vw3JRxKH+1IpVA=; b=pkr2HK9TuboRBbNtEMX+TCd+B8
	0yNPjDNlILOkDBVSq7PiRJo1OmuZsEcSm7EVbUEDM7oblAhbpkTJ6u5tIExbjXIIATwyaOfT+lESI
	9ZJIOskkPCL5S36gPpzY2JvF9uJt03oZuGS/dxXWzdhJKKpE5CPv5LFrUX3TX2qyfFQapebLXfARv
	OyBE4fCuE+OK2OxW8MfeeirRikO37IP4Pep2Y+4nwxGKhl5Akz2sLxmfNFGlSxZBkwoXEf1HZS0z2
	SBokxZ2ug0x2X1BGb7i1Y5QCd5zzlCfyWXTokHNWoWa220MTIIZYigqar/NF5Z0HUjHwyA6o3Z/Db
	AqOEutJA==;
Received: from mgamail.intel.com ([198.175.65.9])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpm1T-00000000TD1-3RYr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 10:30:47 +0000
X-CSE-ConnectionGUID: cHV4GDjQQnGcPzLrL1uu5w==
X-CSE-MsgGUID: GTAARaLfRFGKyZkLm9VPow==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="64567009"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="64567009"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 02:30:36 -0800
X-CSE-ConnectionGUID: WDkYJmSHT0OrYH3RzlgbQw==
X-CSE-MsgGUID: ttOP2cH/SDKXIxbe3IsO4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122783306"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 02:30:26 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1tpm18-0000000HNpF-00A7;
	Wed, 05 Mar 2025 12:30:22 +0200
Date: Wed, 5 Mar 2025 12:30:21 +0200
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
Subject: Re: [PATCH v4 1/2] watchdog: Add a new flag WDIOF_STOP_MAYSLEEP
Message-ID: <Z8gnvXQ9OMXoq9Fz@smile.fi.intel.com>
References: <20250305101025.2279951-1-george.cherian@marvell.com>
 <20250305101025.2279951-2-george.cherian@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305101025.2279951-2-george.cherian@marvell.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_103044_237724_05B6BB83 
X-CRM114-Status: GOOD (  11.06  )
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

On Wed, Mar 05, 2025 at 10:10:24AM +0000, George Cherian wrote:
> A new option flag is added to watchdog_info. This helps the watchdog
> core to check whether stop functions would sleep or not.
> The option flags of individual drivers are also updated accordingly.

...

>  	.options =	WDIOF_SETTIMEOUT |
>  			WDIOF_MAGICCLOSE |
> -			WDIOF_KEEPALIVEPING,
> +			WDIOF_KEEPALIVEPING |
> +			WDIOF_STOP_MAYSLEEP,

You may heavily reduce this change if you squeeze the new option just before
the last one. Currently it's a lot of unneeded churn that makes review a bit
harder (each needs to be carefully checked for the correctness).

-- 
With Best Regards,
Andy Shevchenko



