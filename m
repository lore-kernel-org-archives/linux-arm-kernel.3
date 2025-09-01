Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103A9CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 19:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pU9Q7u89ZaGGuzsA6KHuUYbPIiLfSbyA47+EG+no5dA=; b=mys+M2MFnJ5NlUvLjJb7M9U/yt
	swsUjB7m4aVRNAYwr8PtZ0ArOsARls2X1QhL0Mg/RZtR3lORUhNRuMKlvNlm+PmCufJeu+qfAJzd8
	T6HsdhaAHbpMCVIKaj8HpLXGSfoHCi6DO+W46MxacQtGZ0KWT87xn+gryhslQxjuQGQL2ECa5j6mO
	RW5z8NDyTXKVNSpWzSW7Oco9U0c3Pg4PQy4cbK4LFOKBV1nNXtn0K5Izre+Fm5LSZNMgInH+okwWI
	IHACW/Xq1G2GQAFWl+fFrlchLXKAh7A5JnljTl4m8vpWHb8oyo6LbfL3RlEvqyxvRER7x7O2HzhMg
	k5XZiFjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utAXr-0000000Dh6z-1FEm;
	Mon, 01 Sep 2025 19:50:27 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut6hU-0000000D9y0-06F6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 15:44:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756741448; x=1788277448;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=pBIzLCGLfnpkMS5ifv2IuIlkVRJcyJWgB32zpPidkuo=;
  b=jMDn1RzCEJ5oIPGJfd6hqCgeyoUC5jBJUxzxQfycaQn6WFEJUfvkZCPG
   D2+ZsdzNXgMAcVk6Ah37fNqAn8EdzzCEVrwjMSNyoGk2l31ZwkhHsRoo0
   KjsYt2nN9ncvktyiHe/LVIv/3nq0AXZqTelc87/5aXBudu5wGSyl9NTUy
   nDuT9XAG51tB8SU8UH91qFg6QGTYaB0WlHa2LSz0SMzBI+TkOB2S3Derp
   10o5q1o0ylrQ3ErBH0hxXwBmST5Durzij97ww054hHcR4kiXyu7GRA2LS
   OcYA/7/hUzXr14cp8IwHgzrup8FCl9qt6NU3++N6n7IFitx1iyoDveMtz
   A==;
X-CSE-ConnectionGUID: uVEEZO3KRMiBxkWD8DXWxA==
X-CSE-MsgGUID: r4HRe640ReOHHnaeBu9fHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="76601045"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="76601045"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 08:44:04 -0700
X-CSE-ConnectionGUID: lp/qH+0RSKSUDXdMvDjWIA==
X-CSE-MsgGUID: r5kQ9S/OTMaUiKdn8829mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="170328349"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 08:44:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ut6hI-0000000ASbS-2NaZ;
	Mon, 01 Sep 2025 18:43:56 +0300
Date: Mon, 1 Sep 2025 18:43:56 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>, Hanna Hawa <hhhawa@amazon.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>
Subject: Re: [PATCH v3 0/2] i2c: pxa: fix I2C communication on Armada 3700
Message-ID: <aLW_PGzTSFFhJOus@smile.fi.intel.com>
References: <20250827-i2c-pxa-fix-i2c-communication-v3-0-052c9b1966a2@gmail.com>
 <aLVle-fEMXlQlDR-@smile.fi.intel.com>
 <587f46d8-598e-4509-bc19-1e6d1b61a624@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <587f46d8-598e-4509-bc19-1e6d1b61a624@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_084408_072317_F4444A0A 
X-CRM114-Status: GOOD (  20.65  )
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

On Mon, Sep 01, 2025 at 04:49:20PM +0200, Gabor Juhos wrote:
> 2025. 09. 01. 11:20 keltezéssel, Andy Shevchenko írta:
> > On Wed, Aug 27, 2025 at 07:13:57PM +0200, Gabor Juhos wrote:
> >> There is a long standing bug which causes I2C communication not to
> >> work on the Armada 3700 based boards. The first patch in the series
> >> fixes that regression. The second patch improves recovery to make it
> >> more robust which helps to avoid communication problems with certain
> >> SFP modules.
> > 
> >> Changes in v3:
> >>   - rebase on tip of i2c/for-current
> > 
> > Hmm... Why not the i2c/i2c-host branch? (It's Andi's tree)
> 
> Simply, because the previous versions of the series were based on that since
> they contained a patch for the I2C core code. Additionally, I did not notice
> that there is a separate tree for host driver patches.
> 
> Although, I could send a new version, but that seems pointless since the i2c-pxa
> driver code is the same in both trees currently.

Yep, no need for a new version (I haven't implied that need). Just asking...

-- 
With Best Regards,
Andy Shevchenko



