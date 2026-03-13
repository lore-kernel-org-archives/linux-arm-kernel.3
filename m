Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35484105F784
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 09:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6hkohxCO/ytpPdaDg0zksBr2z8ASgevlBWMrR5Z9phU=; b=OO2zXBR9Mohfjy5L1KxDdg7HHn
	yhy3zK6drVIw9W5IZAgX9ogHz4HFL9IAT/lcTy69H+ZvkQEL5L6/vs9VAqF6Cji9q9JtD4k7cthHd
	KyjXarpA9YkB4AUVD/vkBSR61oNlRYMwe0fFXGLTczb5flLCTnWrIHVKHtk7mAmP0mNTFyXb1Puxr
	bR1fQGRbktqxfkbuAxhulKILqjuVUJZNmPpqCilEvN7vkoO3rex1awDpuPUur4mHfeIIe8EXdPXZ0
	u4qd752xS47Q6rFBaHi0RkJ8gM2ZR+in0RwPdD21D9x/GeLzARjAk93T7U85XZM8zUQnT0OVANG7d
	E8B5o1nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yjI-0000000HNF2-48eP;
	Fri, 13 Mar 2026 09:22:49 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yjG-0000000HNEY-1ZUG;
	Fri, 13 Mar 2026 09:22:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773393767; x=1804929767;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iWPfnSUIcQh2r/4xOFGM1kwIjo5t36uxHeaHCPe0Lak=;
  b=QKUrh1nUf5r8a6G6rdlwGKfEicOxPBZIYQ+yKu9YRpY/RqZNkL79R/Hr
   3ch08gVGTrELj6ntfDXupxABLFkjoQRETF5SEESaOFxnvMhbH3nLcIvt/
   Kpmw1K0oFhbPM/g4jo2yGzp1gaENhJ791MLbNZR4XAl8mOjPCobZ9yBtL
   Jp5l5O4k5q2dH2m2ROSrzpVDDZIdN9QoAl/sTFYUqK9emMZ8Qw5eJvxVu
   Xo3qV5WPW9U04f4dPbS0K+3HGaGsPYPKRSMNk2xznYt/gnKxx4v3AzzR0
   FNN6/LFw17SzgttRBt19Gm/PgAKk8AP/nw9xRqNgbmWKb2+RW3pW/e1JP
   w==;
X-CSE-ConnectionGUID: gkgKE0CkTriLsAS4qFhk3Q==
X-CSE-MsgGUID: hWLVuKc9TOyIUDyPGhb4Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74686951"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="74686951"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 02:22:46 -0700
X-CSE-ConnectionGUID: feumLp8MRSSSUjNa0zQJNA==
X-CSE-MsgGUID: hsqv2FpmRcmQlwBdfCq1/g==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.246])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 02:22:41 -0700
Date: Fri, 13 Mar 2026 11:22:39 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: robin@protonic.nl, andy@kernel.org, geert@linux-m68k.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dmitry.torokhov@gmail.com, hvilleneuve@dimonoff.com,
	mkorpershoek@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, lee@kernel.org,
	alexander.sverdlin@gmail.com, marek.vasut@gmail.com, akurz@blala.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 4/4] Input: charlieplex_keypad: add GPIO charlieplex
 keypad
Message-ID: <abPXX1eWoq7C7J1R@ashevche-desk.local>
References: <20260312180304.3865850-1-hugo@hugovil.com>
 <20260312180304.3865850-5-hugo@hugovil.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312180304.3865850-5-hugo@hugovil.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_022246_453395_FBD31246 
X-CRM114-Status: UNSURE (   7.28  )
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

On Thu, Mar 12, 2026 at 02:00:58PM -0400, Hugo Villeneuve wrote:
> 
> Add support for GPIO-based charlieplex keypad, allowing to control
> N^2-N keys using N GPIO lines.
> 
> Reuse matrix keypad keymap to simplify, even if there is no concept
> of rows and columns in this type of keyboard.

LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



