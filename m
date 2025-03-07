Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC48C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 17:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k9Cha+dgi8a38Pik2ENWO+BK+Ri5/Qy44eJcx2dhylo=; b=RFNJS6HDDYWWq6M50Kgb8B9JzM
	aMCrzXc40rM0qeYamDPfXBTkmNcKf4FHmkxV+8R4cUmFMry5P3IWbMvN1bsppINSpcLzNTEplOu9D
	oXPzhm34tRlrzhVop2OFUYLGggxySgaTtFSmga716lDGl/RaYEehCJ8LH9KBQROHJT8R8duN5QSU5
	9zWrAGVm93AYr5j32xu6IIjGPSF4/T/nLtaYb9J4bMz3ehQ0l5BeQxmuPnrVhTDQBb21VOCnEObQE
	6P5jvnbMA21P9JjImK5Osj+4dheMUKJ3wYCLfG+ClGYRLa4ZZ8NQowK6B+L9AhWMgycx1evIErI7r
	2rcPshtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqbMY-0000000F29S-1xfI;
	Fri, 07 Mar 2025 17:19:54 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqbKQ-0000000F1oy-0mjM;
	Fri, 07 Mar 2025 17:17:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741367862; x=1772903862;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ayzf6oEExh0PtPYBdOQ9otAoW9YyMP1K3uyxhu94de4=;
  b=Xb/bw9++mK76UlTOJwJE9FFlhKOcdvgA7bxZkddSf0emvIn2eX8BBIS3
   thKw9xZvLG+2BS6mlAmLt18iMPAl/tH6wqe0M4Dfo8bMUKQgir7XJmyQx
   NPMjbA2J6nAjo1GWq2Swwyo7y+94av/bjkoebNnfDn3k2G7MWM47un/4f
   ufMYVfhCW4CI74/cUWBmjP1oO5ELzNdpJWlxrhyyC0nDyUo/mmEyar+PT
   JXyzI/7XpQMRiwJSwzHrGLe26nIbJqhVsrdXkf0FEddvXsR/m6ry22PDX
   aq5PbSkffQj0O+wqJBe8mJhSQgtOXvbJSKZo9TSe5f8VqGuMxKb8FGNTj
   w==;
X-CSE-ConnectionGUID: eqX38p5nQu+v7H45cEge3Q==
X-CSE-MsgGUID: 3SWehFGkQxKyjstZAayjvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53414615"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="53414615"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 09:17:35 -0800
X-CSE-ConnectionGUID: aQOK4EGdTBuEwbKEaJD8SQ==
X-CSE-MsgGUID: 9gRU9mptSOCxD63e8cCy+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="124402684"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 09:17:31 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tqbKA-00000000T8j-2Fr2;
	Fri, 07 Mar 2025 19:17:26 +0200
Date: Fri, 7 Mar 2025 19:17:26 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Liu Ying <victor.liu@nxp.com>, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] vsprintf: remove redundant and unused %pCn format
 specifier
Message-ID: <Z8sqJhbqEBla_Ch7@smile.fi.intel.com>
References: <20250307-vsprintf-pcn-v1-0-df0b2ccf610f@bootlin.com>
 <20250307-vsprintf-pcn-v1-2-df0b2ccf610f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307-vsprintf-pcn-v1-2-df0b2ccf610f@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_091742_276735_4D5F2355 
X-CRM114-Status: GOOD (  13.58  )
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

On Fri, Mar 07, 2025 at 12:19:08PM +0100, Luca Ceresoli wrote:
> %pC and %pCn print the same string, and commit 900cca294425 ("lib/vsprintf:
> add %pC{,n,r} format specifiers for clocks") introducing them does not
> clarify any intended difference. It can be assumed %pC is a default for
> %pCn as some other specifiers do, but not all are consistent with this
> policy. Moreover there is now no other suffix other than 'n', which makes a
> default not really useful.
> 
> All users in the kernel were using %pC except for one which has been
> converted. So now remove %pCn and all the unnecessary extra code and
> documentation.

You seem forgot to update translation(s) of the documentation.

-- 
With Best Regards,
Andy Shevchenko



