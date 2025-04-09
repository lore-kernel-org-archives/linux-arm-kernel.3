Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0B1C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 17:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UM4m3Mde9o4vidOLzyc1GO4s3Gjx0tsMS/RFuPy221Q=; b=jQU/qAB35GPJGp8WxkDgJ0CUlP
	SX2Io79IKwy+vjO7+GsKz+PwAN28dLLG3MeySlzzOHs4i1js/xK96gTAMfQAp7s3GAQ4Jjfrm17Pb
	jgyONzry54OAthbNUvzm80IOn14U6+pKtjPLLCjtVd6MjFq897sMzvlctQyu9RRuOFfVB1jvptjwG
	V7WyvXOV9XlT/3Z6EDipa7T1UNkDFBdAlAwcVFQt1kb6hqd9en4JS+WZ/7JAjYBOCohUE6rYQktXD
	xd+H0PPhXTFzEmftIL3d+YhjssLTga9fzkH9oY9R3Fsp9EF5urL5RLB0NegW/0W5u34YvUKxNd8oo
	28g4qqGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Yx8-0000000807B-3tiB;
	Wed, 09 Apr 2025 17:11:07 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2YhH-00000007x7E-2MUE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 16:54:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744217683; x=1775753683;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CkdD8WTawyvkMWA0pApt7fupfnySbd1tQnhqBqLJ26E=;
  b=e48ndtjeNHNlSB6MWXWPfvijft3KGTjk9a81YpCse9iFBFqQ26uY3ATI
   CZIguJlUyt0EKlzmnqwJjbUsq01sgNprgNdGKKJ2o3cZxNhD3Y67G8Sxa
   aQ/D9HGvxeW7m7feWAo4Ig8VKrStG67Q8qftd55hDIsKUXpHZpixqcrsu
   5p9u/zTiLqCyb/c41Kshbik6vd1Z3LQ0pdEk/shGpGSi/44KhpPoY/U9r
   NUTJqk4CDndQk8SiqG7jrP4WcO6pC/AkXMyoxf54ssP5ao+7k0+6sPN05
   pUjcivIddPby0vEW3RN4LZ1xZvnlBf+1Z6IzxtHxx9FOxsA5O8sP0/WnK
   g==;
X-CSE-ConnectionGUID: gdMq0S7ZRrq1VQ96BKgtSw==
X-CSE-MsgGUID: n6AJUOioTN2/9iqFv0alyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="45720632"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="45720632"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 09:54:42 -0700
X-CSE-ConnectionGUID: yGzfegqHS0aj8hVI6JO4zg==
X-CSE-MsgGUID: EwcFTrDiRBushl/Lyvubkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="133623790"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 09:54:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u2YhC-0000000Anhq-0o0A;
	Wed, 09 Apr 2025 19:54:38 +0300
Date: Wed, 9 Apr 2025 19:54:37 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/10] [RESEND] ARM: fixmap: make
 __end_of_early_ioremap_region an enum value
Message-ID: <Z_amTf35QzLdHirV@smile.fi.intel.com>
References: <20250409122131.2766719-1-arnd@kernel.org>
 <20250409122314.2848028-1-arnd@kernel.org>
 <20250409122314.2848028-7-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409122314.2848028-7-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_095443_664074_224538D6 
X-CRM114-Status: GOOD (  12.15  )
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

On Wed, Apr 09, 2025 at 02:22:59PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Building with W=1 shows warnings for the __end_of_fixed_addresses
> definition:
> 
>     In file included from mm/early_ioremap.c:18:
>     arch/arm/include/asm/fixmap.h:39:35: error: '__end_of_fixed_addresses' defined but not used [-Werror=unused-const-variable=]
> 
> Move the calculation slightly up in the file into the enum that
> contains __end_of_fixmap_region and __end_of_early_ioremap_region.

...


Maybe format it

> +	__end_of_fixed_addresses = __end_of_fixmap_region > __end_of_early_ioremap_region ?
> +				   __end_of_fixmap_region : __end_of_early_ioremap_region,

as

	__end_of_fixed_addresses =
		__end_of_fixmap_region > __end_of_early_ioremap_region ?
		__end_of_fixmap_region : __end_of_early_ioremap_region,

?

-- 
With Best Regards,
Andy Shevchenko



