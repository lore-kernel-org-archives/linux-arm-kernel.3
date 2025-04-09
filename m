Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1B4C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 15:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mr+/FJNZ1uFO5r0fBg14/46aYctln4I08+NEsSgQhxs=; b=e4Id4pp4J2EhJLJPnbJ7UxqGoO
	dVBeFhxO7VMGl1uXdlXLkf6NINSxZqXimWb8yIcTLjQ8gSw8O13jdyOJ+elk/cAwkMy0T0beTxasp
	JcBV2oee5t4EXOLC0OyMPF/71cMWyzxptzTyxERgx9PqfGQK80rFQ2IVTRDqE6MLT0tufpAKL/VIU
	UWqNQR6/atocSRBII39CADkVsN66nxZnTwFLLol5LVNfgXcbz6H0BvXbKC2Sb9Lo5vnUg1NHeTpr6
	3tJnM8wd0oZcyZyupDXBm9Mvcm91YQwDvJsa+Mox1VtUhONBuJ/9FuOeRskbRsvqbE0BPWNWQcb4/
	8ToB/6Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2XSL-00000007i1P-3Kdn;
	Wed, 09 Apr 2025 15:35:13 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2XQX-00000007hcO-3X3g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 15:33:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744212802; x=1775748802;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mErJO8k3cpuBPBmJcDHzl2+V5zvBB5RozSbgoAix5w4=;
  b=FZo9teaGJkxPaEiVsT4BfSjJMFK6MSuY3RtK/d1aeA9xrBD3d/DOVEpS
   2a4yfZ2/9amjjvwpCXjepGFt0kz5UaKEpgkCbN3bz8TbX9Rbs7VXnK4mS
   WHf7jioaKznua+i2RXNv/2TeT9skJP0TLDY0oJsPs839PdginhkUsr7c+
   HWALEAH6VQ81qqMRpmNH/1R2h+3tcTVkgGZfTEm+WBJuMHRGB99uSIH7d
   uYkWBC0STkw55rGWGqfN6WuyxRO4Vsj5oTkOxHh1pSK1qt4qCqHFKjOvW
   n0o1TwoXuUrEHvNfONgXwvBUjyQLC+/zVdBHr9A1K6VovEJRuXpSXFIs8
   w==;
X-CSE-ConnectionGUID: XGKvYiggTICHS2UbTGIZaQ==
X-CSE-MsgGUID: tnuLo3C3RsCyUVqFZ8OVZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="45582296"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="45582296"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 08:33:21 -0700
X-CSE-ConnectionGUID: Fpvn1roRQguN0PtW+NjSfA==
X-CSE-MsgGUID: hp7hC+GATASRmDoW92HvTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="128354896"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 08:33:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u2XQQ-0000000AmNz-0KQG;
	Wed, 09 Apr 2025 18:33:14 +0300
Date: Wed, 9 Apr 2025 18:33:13 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Oliver Graute <oliver.graute@kococonnector.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Yu Jiaoliang <yujiaoliang@vivo.com>, linux-input@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/10] [v2] Input: stmpe-ts - use module alias instead of
 device table
Message-ID: <Z_aTOUUmyXpWnt57@smile.fi.intel.com>
References: <20250409122131.2766719-1-arnd@kernel.org>
 <20250409122314.2848028-1-arnd@kernel.org>
 <20250409122314.2848028-3-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409122314.2848028-3-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_083321_918853_081C5AFE 
X-CRM114-Status: GOOD (  15.86  )
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

On Wed, Apr 09, 2025 at 02:22:55PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When compile tested with W=1 on x86_64 with driver as built-in:
> 
>   stmpe-ts.c:371:34: error: unused variable 'stmpe_ts_ids' [-Werror,-Wunused-const-variable]
> 
> Ideally this would be referenced from the platform_driver, but since
> the compatible string is already matched by the mfd driver for its
> parent device, that would break probing.
> 
> In this case, the of_device_id table just serves as a module alias
> for loading the driver, while the device itself is probed using
> the platform device name.
> 
> Remove the table and instead use a module alias that reflects how
> the driver is actually probed.

...

> +MODULE_ALIAS("platform:stmpe-ts");

Isn't the preferable way to have platform device ID table instead?
Krzysztof?

-- 
With Best Regards,
Andy Shevchenko



