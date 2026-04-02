Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A78CD6AAE9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 16:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F6zudsg/FaWJTtchGylMN3DA2Pd/yzfUiOuKlZYwqsY=; b=EpJO5fRHctD4wenhseV30PDWv3
	VRPjcbEtJbR0KBVEIK3FblLJhcRca18KN8wxYZ+nfocXNd6V1P/9sJKF+Ou0JL8er7DhT0cV7qDIZ
	oiPxNR//n/c4OwoR/nPgPlgm8cYZISXDqM/Raom+x4jFSXRFtGzoHqwMRIJmv/BZqRgZx+XB/XwRB
	h1MbDIWvSkVROLRgVG52g68+24y6CTrcFejde3+VMaK65QV2anMZ0QTKRP0laHDSRUejlIvxs8tye
	fAyeL/HJvUViNT8MlZ2CrkOj5Zt0S8TubN43/O3aBt9FFUW0+fOVf12gmHdyoTtb8eDUTp1Axjca7
	MI0FzwTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8KlT-00000000VFv-2cNE;
	Thu, 02 Apr 2026 16:19:27 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8KlQ-00000000VFY-2ja9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 16:19:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775146765; x=1806682765;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pMXoH8+Kug+/vbCPmyo9oaefuNRMEW94bMJANJcG2vk=;
  b=bWvYlewxAnpjBs+QdUD3qD9o9y/QILcxW4VnpXWJmq3Ff6TZ3rVTmxoR
   on3xG7p6XW+CgsQabPeX3HSeG1G8rxYYCQJ2D0xFpg3dpTrUaHmoFKrbA
   7Ky0VF+nDWhCGF8qhw5UaYdl/2ftbEyPlpmOmJnLYW+vq/bWagsGDyeh1
   ML7BSB7en70VL8NbE+6JbeaTrhCWD2VGzp0SLuhlQ2QND/RfJK1BqDFNx
   gcllMlj3zYgETdBmeVDZsfgJBOYfHBNu526MPUxSkGPwdnDimtLD+dLkJ
   gJkUXqNS39kVdNA4J0Xna1CImeBpTikubnZVtDs3fFs23wlGEyWJMfKa8
   A==;
X-CSE-ConnectionGUID: QuKg7W8KSbq+SEZ41p7IZw==
X-CSE-MsgGUID: Yw/r/sZdSqGtD6R5EHWEvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="87664168"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="87664168"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 09:19:22 -0700
X-CSE-ConnectionGUID: 2wUYM1L9QBefu6w5SVTnpQ==
X-CSE-MsgGUID: zCxDvFP/R+qWsY+u2IcbhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="220369184"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.31])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 09:19:17 -0700
Date: Thu, 2 Apr 2026 19:19:15 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
	brgl@kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v5 2/4] software node: remove software_node_exit()
Message-ID: <ac6XAyjxTct_WCEI@ashevche-desk.local>
References: <20260402-nokia770-gpio-swnodes-v5-0-d730db3dd299@oss.qualcomm.com>
 <20260402-nokia770-gpio-swnodes-v5-2-d730db3dd299@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402-nokia770-gpio-swnodes-v5-2-d730db3dd299@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_091925_804368_C71BC957 
X-CRM114-Status: UNSURE (   8.02  )
X-CRM114-Notice: Please train this message.
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

On Thu, Apr 02, 2026 at 04:15:03PM +0200, Bartosz Golaszewski wrote:
> software_node_exit() is an __exitcall() in a built-in compilation unit
> so effectively dead code. Remove it.

a dead code

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



