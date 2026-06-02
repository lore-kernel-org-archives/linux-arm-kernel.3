Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BE5CD6E64
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 09:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+WLorXbZ4o8fZGK8UKxbD3vCYdd4HGXM53dEe2fZfIQ=; b=iSM/OYd3BRHw8EydypYZ42J6bt
	5xpAZxYGnjkqSg30PniOVfENr6m75rjsx3gFwh7aRoXT/NXMsbN1y73ajdxc6n7pgpZJTtnFvwSJg
	B0mNAkFG6ZJlCezlEOQ7BVSo47fQa8Eb6xFzJJQVmogb58OYHLfsNDSySYjtgJQFH02zK4mdq8xRB
	2MsC2EnrBgeb6mXObyHllJtf22iucKGQaCwKEbmD/Gmg056wcEtz4MmHLvDD8BOqDounkDsyKme6z
	D7tnNpd9uv0xBfdPPtTaWOyC8+zVORBUabU4C25ReL08S1bWAetOhiOBb0ngYh7hQfJI7IBm9EIvn
	nbS9Ma2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULPK-0000000CewM-37FC;
	Tue, 02 Jun 2026 09:27:34 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULPI-0000000Cevp-20AK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 09:27:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780392452; x=1811928452;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ItblxYpNb+2Ay97S4QWuJOOupifreuKenS9xKDaH38Q=;
  b=I7Qq0PIprKsX460df0GaMUY4tE/9iHYYZENL/BMlW3DskozOBsdtz6RK
   EziX1HrD/4a3ha9g8YaonGZSOEVdxoV0G+c2fEq75cLNLUi0+pCI3QnPU
   xZ7W8sxAkW7LEsobptSsf46M/p+tXQD5TIAx1tj6iKMXqd6uN0CkGRHSD
   sxYaNyJESwbSF+JD248cmTjMkV9TVhb0tcK/7kJa1O2h2qBdEFgnRzY/i
   hFXkWrl+vBmI0+lfbS0Rg5mmt8vMgl98+X7hBPGZ7dzyMzx0EjCQbzrT9
   kUAPiOsi0mzhY7Nl/Kh1Xw+PNGJdHuhNwWQauVl3Y/kymC/gN27hNw+Nr
   Q==;
X-CSE-ConnectionGUID: IsYaFQPpQNauI9PkmQ615w==
X-CSE-MsgGUID: O5LWMRFZQmurGj3prbM0tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81072424"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="81072424"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 02:27:31 -0700
X-CSE-ConnectionGUID: LFPp70urSQm5UUL05sBrfA==
X-CSE-MsgGUID: 6O4Zj6lvSPe1U7nQPoyqcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="239414468"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.229])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 02:27:27 -0700
Date: Tue, 2 Jun 2026 12:27:25 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Angelo Dureghello <adureghello@baylibre.com>
Cc: Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>,
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH v4 09/11] m68k: stmark2: add mcf5441x DAC platform devices
Message-ID: <ah6h_XW2wvgEYXKd@ashevche-desk.local>
References: <20260531-wip-stmark2-dac-v4-0-7e65ab4215dd@baylibre.com>
 <20260531-wip-stmark2-dac-v4-9-7e65ab4215dd@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260531-wip-stmark2-dac-v4-9-7e65ab4215dd@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_022732_558425_F46B9D1F 
X-CRM114-Status: GOOD (  10.90  )
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

On Sun, May 31, 2026 at 05:26:02PM +0200, Angelo Dureghello wrote:

> Add mcf5441x DAC platform devices.

...

> --- a/arch/m68k/coldfire/stmark2.c
> +++ b/arch/m68k/coldfire/stmark2.c
> @@ -8,6 +8,7 @@
>   * for more details.
>   */
>  
> +#include <linux/ioport.h>

If I'm not mistaken this part has to be done in the previous patch?

-- 
With Best Regards,
Andy Shevchenko



