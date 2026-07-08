Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08124C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 19:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dtnFbKqySdvbfj21ioTTpBMD7eQEco0l84i2I1V+fvs=; b=vEE2oikg0DLxerZOk15WW/zLdJ
	i9QbLvEF8mY4zP0BA09fAVz+R/4AwDzH0l9DYZJYj3LtqWzYrpxDcvFz2H+x8rLWMbkcVseuevjR6
	AW/hkPhsCdrvuNts/EwE04JMVpiP9Cle/sVnEC1hYFO66yh+L5vEA1YadMltCGTFonkK4Imu2o3F8
	VyCJgoMfj7vCgyEvc9msa5VMY4wy3PbTAYUTsvhRNQgzXVj3QNsSKB9hk253vB7wb+zhoHxYbc1c5
	xpkIB+kjKrfWxuLbyyGutYPLsQi/8yg6/aOIJ2BF3+1S6ZQq8rxA6r+GmCrzkvmDO1NH2eG8oj1zp
	jt/nlwOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whY5C-00000000H9n-1RPs;
	Wed, 08 Jul 2026 19:37:22 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whY5A-00000000H9R-01yV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 19:37:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783539440; x=1815075440;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vy0hljr9IlKplzOF7YFnwyGpNmOwQ9rIA6BOUnYi+94=;
  b=PvglZMf2Xbj6suquxBavoxiJIklSftDDmzgbdkUe05ApQA9h7OQzGOjb
   trJxZKFvjbFwwrubmCV8cB9F68mCA17E+z/rbdiTLq7H8CYYaLY4Vrqmh
   Xr9H7znJssyeVySQmXWe3UTkDGOp1YzjEzQk989xvRdsryviNPbxSpw6j
   ToTRjs5ZcEPQA5BbLgdrq/4Wrh281RwFW/IKwaUAQRYyj5aV+ICLK35Mi
   6CeFC+kFE94hoH2vdYj+5yp0pQ7QyCQ9HiIAQW0j8RTRX9eZcpviPjNFw
   TdKYJrkyO22jHOTX252h8M1AWXpvDKe8FDmroaJC6pgj6Kob2N2QuUqlr
   A==;
X-CSE-ConnectionGUID: 81q+3OLwQZq6RB73VHgxsA==
X-CSE-MsgGUID: 66e+anGERgSBwyjNDMV/Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84234728"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84234728"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 12:37:19 -0700
X-CSE-ConnectionGUID: q0VdNDk+S1G66pycizUskg==
X-CSE-MsgGUID: sjHt9dcISqKhxWkEm/hGGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="254478245"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.100])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 12:37:16 -0700
Date: Wed, 8 Jul 2026 22:37:14 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Peter Rosin <peda@lysator.liu.se>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v10 0/7] I2C Mux per channel bus speed
Message-ID: <ak6m6srzX8dd6_nT@ashevche-desk.local>
References: <20260708-i2c-mux-v10-0-09dca03c8a15@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-i2c-mux-v10-0-09dca03c8a15@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_123720_084548_A590A88E 
X-CRM114-Status: GOOD (  23.11  )
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

On Wed, Jul 08, 2026 at 02:16:12PM +0200, Marcus Folkesson wrote:
> This was a RFC on how to implement a feature to have different bus
> speeds on different channels with an I2C multiplexer/switch.
> As no major complaints on the design came up during the review, I
> decided to submit the series without the RFC tag.
> 
> The benefit with this feature is that you may group devices after
> the fastest bus speed they can handle.
> A real-world example is that you could have e.g. a display running @400kHz
> and a smart battery running @100kHz using the same I2C controller.
> 
> There are many corner cases where this may cause a problem for some
> hardware topologies. I've tried to describe those I could think of
> in the documentation, see Patch #5.
> 
> E.g. one risk is that if the mux driver does not disconnect channels
> when Idle, this may cause a higher frequency to "leak" through to
> devices that are supposed to run at lower bus speed.
> This is not only a "problem" for changing bus speed but could also be
> an issue for potential address conflicts.
> 
> This patchset has been used and tested heavily the last months
> on a custom board based on a da850 (DaVinci) platform.

...

> Changes in v10:
> 
> - Fix gramatics in documentation
> - Move {__,}i2c_adapter_set_clk_freq() to i2c-mux.c

Can you point to the discussion where it was suggested, please?
It was like ages ago (too many patches to review) and I probably
missed and/or forgot the rationale for that. Also if we move
to i2c-mux, why do we leave it in the adapter namespace?

> - Make set_clk_freq() return actual frequency
> - Reimplement idle_state (from earlier version)
> - Implement example on idle_state for ltc4306
> - Link to v9: https://lore.kernel.org/r/20260324-i2c-mux-v9-0-5292b0608243@gmail.com

FWIW, I briefly read the v9 discussion and haven't got the above move,
seems wasn't discussed there?

-- 
With Best Regards,
Andy Shevchenko



