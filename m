Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4804EE9D3E3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 14:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZRkSVHNpzOWos0p70B9GfeIC0B5jxdoE/PqIicWDybg=; b=Eqzj1BJ2KQ/GrC969aYdWf2x9c
	9SHh+/U/vEvokjoBN+JwlTK16nc8Lq+EoPYHpioizzn/7pmP9agtvCZ+f1vcWRy7FHRqWHjYawl41
	tdGfVrP7WwwC6r/GrYP76D5DvlHwg/NPKD2w+mT7oUcJ0B8WO+n22KluU6TaOYh3cOuhArkSfsDCw
	aWKOyyJFd9honrTMMeWNUUV7o5H5PS3DJZ+zpsnhiWQIyEjJbP6TVLgvVoxHAyJHlYHu69J/ST958
	Hgi15niXa2G06+XI7Cju4zO4c9CREFdM8JgotxNjnZH68vK9Zn2QTMglGPmutuJWv3+lWo8iSobsD
	2d0pBCZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vndmO-00000008aKj-27D7;
	Wed, 04 Feb 2026 14:22:52 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vndmM-00000008aKF-15cg;
	Wed, 04 Feb 2026 14:22:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770214970; x=1801750970;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=IrNP9aPjvILwnwoEewPVQMmwUR+z+tWND+goKGd2lig=;
  b=T31ws/Jl02C73iVcAE1o8C/fh4NVAPtVUV4pHiGUHXErFbbOP+uAuldt
   /Nr3O9oW7AvWwbMqA18cZZGUAfNiM9oWMcc6HSQK9oVbYFw2AP16ldWMu
   +vP3zokTX93ojZs/+1zx9qLtdQhwy6nRsKq698EAootrucRsXzRturvNM
   zDeUpGr5qPa+Pq4d50/f8Dp8hDh+LsEUWJBWwDNks90fYQXCIKLxAAfYT
   6B0f+OnDTQEiM3KzV+koQk5ng1bro63n37q60jg8SLipdHDR0Krx1HBkJ
   sxU4mK62CenQe8Q+F0tBfLs6fqB76THsCz7OVcjtNorIN3O2rZBf9Z9eQ
   w==;
X-CSE-ConnectionGUID: ALUTqpi+Tzm7Aq05bxOQvw==
X-CSE-MsgGUID: mHfJIYWMTrialP++ki3pGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="75252951"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="75252951"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 06:22:47 -0800
X-CSE-ConnectionGUID: S2N85vwdSnaWdLO1IP1BCw==
X-CSE-MsgGUID: 7foP+xnfTiWmLWigJKydsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="214350282"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.188])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 06:22:45 -0800
Date: Wed, 4 Feb 2026 16:22:42 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC] pinctrl: pinconf-generic: move ..dt_node_to_map_pinmux()
 to amlogic-am4 driver
Message-ID: <aYNWMndBWxxoPABG@smile.fi.intel.com>
References: <20260203-craftsman-battered-3491ff68f462@spud>
 <CAD++jLn8WOobPaoSrMLitFgFZc_6CH9BQbRy_Gdqq3BLhDXWQg@mail.gmail.com>
 <aYL9zgEyCarrluvP@black.igk.intel.com>
 <20260204-crawlers-nacho-d7c9021cdb6f@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260204-crawlers-nacho-d7c9021cdb6f@spud>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_062250_363979_1BBFAFAA 
X-CRM114-Status: GOOD (  11.80  )
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

On Wed, Feb 04, 2026 at 02:15:10PM +0000, Conor Dooley wrote:
> On Wed, Feb 04, 2026 at 09:05:34AM +0100, Andy Shevchenko wrote:
> > On Wed, Feb 04, 2026 at 12:34:36AM +0100, Linus Walleij wrote:
> > > On Tue, Feb 3, 2026 at 5:17 PM Conor Dooley <conor@kernel.org> wrote:

...

> > Note, please, remove extra '.' (dot) in the Subject.o
> 
> fwiw, the .. was intentional cos I was truncating the pinconf_generic
> from the function since the subject was really long, not referring to
> a member of an ops struct.

Yes, and that's how we refer to the callbacks — with a single dot and parentheses:

	.my_cool_cb()

Alternatively

	->my_cool_cb()

but it one character longer and TBH it slightly less readable (I personally
used the latter and then switched to the former in the recent years).

-- 
With Best Regards,
Andy Shevchenko



