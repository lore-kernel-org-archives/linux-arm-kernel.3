Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5EACC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 09:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TIk6wkVcJ7XTX4DdA1hQhV8UgQaO+zknvaQMzsVFXdQ=; b=g5el7NTokwhRVJU1aX1J8QPmMJ
	5OkCa2POwUa3JAmavgBZnqikdm2GF2B4xHRZoFC2jXnc3uFKVQRfJxf1cVOaDMuNCl4gFLoY5ZFnN
	nZmOdQSpLqOfpvNJS5K5U8SLjyMj270Vba+1+JzP9jCxZQpamFrmc357ekGdsGc12Kz1+DzrQQV1k
	jUQNbhYVNh6cWgkoMKDw2y0w7oOaOtEyLiKACGhqA02dbgxBJqaJjQRFFQ1Pv5idvkrPzXiP7kevY
	9GDQaVPal/F7XAR6ajLNEfdZL9pvOnHkFZPIy5H6c1DXcjELta8qOqaw9W55qZkDYSL3lHH56BQSQ
	Uy2dMSRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoFB-00000002Noi-0U4g;
	Fri, 14 Aug 2026 09:30:29 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoF9-00000002NnK-1CpI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 09:30:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786699827; x=1818235827;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Pmxz/X63qocUfI4qWYyUiBkC++1SDPoWGpV0SJppfAo=;
  b=NrRW+91P8+nW44b7jf4pgbwDqCzlRZTqRocDdjW0LPQdeV9MVb9EhWAu
   aarhaL2H7kO0rNdV6uRvhIXw0tOQcXsOXZ7y4WnabCoZgSD23Wu48nRKZ
   0AuvNriNugFzXMsU7VupvoExnudtF/hF1vGbv/go99vmx1iqbFu8he88O
   Zk5byKQmZulcaku/gVoeyw7T/J4m1vspE0JGOXrUld/PifTJHeDqkGXUe
   YcRWNVktdagPrcEz9I6zo4e3JZJP+6iP25y8neoS1M2Y0D86ThFJuZ8Yc
   bHB9Bx+UbZH3bNSZV2MOaEjVgzznXcCXLmjBLlrhIiU1G5k3yzZLsUNnA
   w==;
X-CSE-ConnectionGUID: sYbykbuTQtCA3Is1nVN4wA==
X-CSE-MsgGUID: oMshEShuSE6Lr7wkZYwjxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="97870025"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="97870025"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 02:30:26 -0700
X-CSE-ConnectionGUID: 6u2kxSleTwC5SyizR6B1iQ==
X-CSE-MsgGUID: ehOKJ2Q2QiCg6HZHAlpHgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="287657898"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.134])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 02:30:24 -0700
Date: Fri, 14 Aug 2026 12:30:21 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: xiic: restore runtime PM teardown in remove to fix
 clk WARN flood
Message-ID: <an7gLYzltJgjIUNQ@ashevche-desk.local>
References: <20260813-i2c-xiic-restore-runtime-pm-teardown-v1-1-0e7dfb206790@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813-i2c-xiic-restore-runtime-pm-teardown-v1-1-0e7dfb206790@nexthop.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_023027_345577_C4D13948 
X-CRM114-Status: GOOD (  10.54  )
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

On Thu, Aug 13, 2026 at 02:06:40PM -0700, Abdurrahman Hussain wrote:
> The devres conversion dropped the remove-time runtime PM trailer
> (pm_runtime_disable + pm_runtime_set_suspended +
> pm_runtime_dont_use_autosuspend). devm_pm_runtime_enable's release
> action then calls pm_runtime_dont_use_autosuspend() while runtime PM
> is still enabled, triggering an immediate runtime suspend: the suspend
> callback clk_disable()s the clock that the devm_clk_get_enabled()
> release is about to clk_disable_unprepare(), and every device teardown
> WARNs in clk_core_disable() ("clkN already disabled").
> 
> Restore the trailer: with runtime PM disabled and the state forced to
> suspended before devres runs, the suspend callback cannot fire and the
> clock enable count stays balanced.
> 
> Fixes: 50c63491ff26 ("i2c: xiic: switch to devres managed APIs")
> ---

^^^ Something went wrong. The SoB must be part of the official commit message.
Putting it under the cutter '---' line makes it disappear.

-- 
With Best Regards,
Andy Shevchenko



