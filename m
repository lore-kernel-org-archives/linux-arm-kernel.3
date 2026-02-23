Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B42EA4FC7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 14:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+HOXAX8OsIEDsTUKdo4U7awZ7o+LrKuyPfNAgdSz6hw=; b=f/bL+697qj8q10RWZWyO1dZ4jZ
	uIA0mnMdBFEWZkHYhWcvvw5J06UtqTyFBvvMrAgbXlJmi6tc9kueulUoMImGOlVvkMBZLua9up76H
	45OXKMAkNFVIvhtaN8jRJMYliacjAAQ2Cf7ZZW7u+ZvvOFlq9cqAxRmJpmcxl+yyq+Npi3NUqKzNB
	wylYL41Hk3a1J9kC1hIurPGTVeGovOrsQtNubnZnEJ5ZXZ2ZapeMMt/YralryUc9kA9tXi/PoYk6+
	UkTT6KDsKkQXcpVrOk+px2suTfrpqpDXcEWfYl4Xmb7pW2YFauNta+8f3ttweScjWnoofsVI5UfFU
	herz87jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLb-00000000VsK-3vd8;
	Mon, 23 Feb 2026 14:55:43 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLZ-00000000VnC-1ITW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 14:55:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771858541; x=1803394541;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WM183hACJaD3Rb+fx+g4iGlrxeXPl34ZFLsoh/Or5D4=;
  b=d3g+fX2yC1YIzIQqJJay/YFL9AmJOtHPsPTlLoNJRECNq0Glyk/Q+apE
   CFZmbW7AP+bXmPHHaHi8RhipirE2q5oxSIkDi/OpHA+OkxbmTisYnMC79
   f8ZksCwi6kgkwTPNhTka0DMpfQaK1YKIRmFycaZx6cVROzUvmwUtzjpXx
   4amM5vugh8+Thp2P7U+GVg6HXJOLYgjEYdyQEaRYZ2aavbW6IKR9m0CDX
   gAAxUDKGxKLeR1FGdkWrgcpIsO+udyJLRPlizqVL9PGe9XGnxoyPbkF3f
   2wcGmMSj89Dvc0aeigWta696kWJ+mQ9jtSD+oTWdIh9pJgmSZXgIp3q5U
   g==;
X-CSE-ConnectionGUID: /v8ZDoE8Sa2iVLWqiUlz4w==
X-CSE-MsgGUID: CKNGpGsAQ0KGrkuWem9N/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="84214934"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="84214934"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 06:55:40 -0800
X-CSE-ConnectionGUID: Dz70m+RIQ3Od/kORcNfEtA==
X-CSE-MsgGUID: ZFIO4c/qQo+zK4iLVPGtvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="213517895"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.222])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 06:55:38 -0800
Date: Mon, 23 Feb 2026 16:55:36 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 1/5] i2c: core: add callback to change bus frequency
Message-ID: <aZxqaGxsUuD8vxQL@smile.fi.intel.com>
References: <20260223-i2c-mux-v7-0-ec75b214718a@gmail.com>
 <20260223-i2c-mux-v7-1-ec75b214718a@gmail.com>
 <aZxqBOaFId-9WfnR@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZxqBOaFId-9WfnR@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_065541_366208_95163CC2 
X-CRM114-Status: GOOD (  14.82  )
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

On Mon, Feb 23, 2026 at 04:54:01PM +0200, Andy Shevchenko wrote:
> On Mon, Feb 23, 2026 at 03:33:50PM +0100, Marcus Folkesson wrote:

...

> > +	/*
> > +	 * If the adapter is a root adapter without set_clk_freq implemented, this feature is not

.set_clk_freq()

> > +	 * supported

Please, also respect English grammar and punctuation: Missed period here.

> > +	 */
> > +	if (!i2c_parent_is_i2c_adapter(adapter))
> > +		return -EOPNOTSUPP;
> > +
> > +	/* Update the clock_hz for non-root adapters, even if set_clk_freq is not implemented,

.set_clk_freq()

> > +	 * to allow * the clock frequency to be propagated to root adapters that do support it.
> > +	 */
> 
> /*
>  * Please, keep the style of multi-line comment consistent
>  * and as per above.

...including one thing ^^^

>  */
> 
> > +	adapter->clock_hz = clock_hz;
> > +	return 0;

-- 
With Best Regards,
Andy Shevchenko



