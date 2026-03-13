Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656E1105F783
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 09:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iLetjawiUkbkoPfXTWjNEHzB3qGIAl5KG2o7MoEJffw=; b=xbE4uP8vtsQhYmawaPQ4MT7Em0
	0BXD2AjCKJl3pOyYav4DasxxRPZDme7k2tuNrF/E11NXTFv3Md3EAlXOIi6MGinJziKiqtKCP09Ui
	b7NJ97535tipese4wYgYnKvtni4KaQwdX0znpEgA8Ke8tkNSWZ+yjBWE6HGVjCJKde54ZCshE/kc4
	RcHdptcFfjR2iEeROc+PVhyBJcQxficQA6kb5TSsAYGdxH25r6ciih2cFqb9C+QWpVjCZp0RARYXU
	oon7YcLfP0XtrGHbNuaCghPNWilFsKFEE8d/UQOhNcZgq+BraZgtbwo2JI34r14wIy9HbyZYb9u0t
	1cUGm0bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yiZ-0000000HN7S-1Ljn;
	Fri, 13 Mar 2026 09:22:03 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yiX-0000000HN6s-18xY;
	Fri, 13 Mar 2026 09:22:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773393722; x=1804929722;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F3bmbqYoIxEx5/mFO0XhVEBu9pifGbmaMSxr7pbLiZQ=;
  b=HwlRRjBtCTV889VPPAiqRxYs8+VfqXh+MkNA9lAgwqE0mXGIz7TOM1I9
   Tgzs9+TcZrCgbmgYxWJkSrXwtfoy5VqcBBWoDPvJyL7fBE4TAxHv4UpXN
   Swyg3uxKTT2Zhw4FuWmRdT3wDvc6bwcIciZiynAahXPJSZygIaRBYO1cc
   hCQ2P4E+z8pqe/A8W4LskPbIpPQjhnt7IKxPMkAHGlMn2xRKDrFRKadID
   tPzRT6gvPsyjs7fRJm6qGQZC8WhZ0lJDNS6q+2whxgf1RAGHCl6k6ZHEX
   zfgmj3snppSIc8xl0jX/D9GYMxhr05MWZAZe9Jagw6ltM0GyPG/S1/yk3
   Q==;
X-CSE-ConnectionGUID: 19zh+KFFSqe8kB3dbdLYHA==
X-CSE-MsgGUID: rYaO0X7GTu2Q1W+In0xDQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74380016"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="74380016"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 02:22:00 -0700
X-CSE-ConnectionGUID: wsNnL3UaREmNTQuM5o/pPA==
X-CSE-MsgGUID: DICY7SCeSk2RaIPRoYR4+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="221059581"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.246])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 02:21:55 -0700
Date: Fri, 13 Mar 2026 11:21:52 +0200
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
Subject: Re: [PATCH v5 0/4] input: add GPIO-based charlieplex keypad
Message-ID: <abPXMCU-mg_nQ0y6@ashevche-desk.local>
References: <20260312180304.3865850-1-hugo@hugovil.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312180304.3865850-1-hugo@hugovil.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_022201_358780_D7FFDC6B 
X-CRM114-Status: GOOD (  13.14  )
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

On Thu, Mar 12, 2026 at 02:00:54PM -0400, Hugo Villeneuve wrote:

> Hello, this patch series add a new GPIO charlieplex keypad driver.
> 
> The first two patches simply commonize two properties that are present in
> a few bindings, so that the actual patches for the charlieplex keypad driver
> can reuse them instead of also redefining them.
> 
> I have tested the driver on a custom board with a Solidrun RZ/G2LC SOM
> with three charlieplex keyboards, all connected thru a single PCAL6416 I2C GPIO
> expander.

Based on the review of this series I have a question to Dmitry.

Are we going to have Documentation/process/maintainer-input.rst with the
preferences of input subsystem in style and other undocumented things? When?

-- 
With Best Regards,
Andy Shevchenko



