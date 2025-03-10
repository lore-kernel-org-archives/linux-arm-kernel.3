Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C49C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 08:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1k+qpF2ToCBLiYVaADg/73Nh+1zu62QwrIVU9vMhJQ=; b=r4L6M7hemySg+hBVzZreOjQM5a
	IQmTtNszq9oJT7TQ9FnRcCucjOqIYJUIOgx2mSNswKsEp/YyUxUTRVtKME4DDd9srnH0sw8+SyUN4
	/c02TvV+sCoqvbgROSyk9UQ0UnMCmiql5wjdnp9KRlwlPpqghU5tO7ekih2GjhSNQu/sjc3A4PJ+9
	Az6HTRk3pzomZJFAVK+Tvdm/XCjqu6wkB9kaq/bTpaJeGpOX61aZ6X7CmnlFDNHiFcOjFw13RXHvA
	xHmxbsxb5ydc6M9tAl5Sf56RR5asHHuH7L/QlCBPqENHF0LByvlWqB7EZgvzEkU05igbOhAoMJL42
	SvAc2pPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trYLs-00000001sM9-0Fq8;
	Mon, 10 Mar 2025 08:19:08 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trYKE-00000001s6s-314n;
	Mon, 10 Mar 2025 08:17:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741594646; x=1773130646;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uawa4JN2MXUgGhBTnOMJGYIztDfknKCASvvEPmNYWpo=;
  b=KvfkUixRSsGEIvmvWz7Z1XCsjka8IykcCVhwkfXp9lH6z/uwkA7s62ok
   MYutpzr+9cC3Re09eSqL4T0b1DeJHIkT00dyuumX1RJ83MQr152QfXwld
   8XDiHKQZvDCtqJsQptZwh3iOLhvnSzlCL8kzBzs1QTAmsuq3WlZvBn8rL
   NuRuuQd7zuTQZlOGNnwBuKpC1szEC17wsmuGgN+UmoI76ToCwlKvfrDr4
   64/PI9Z6N+b9oPVxG7ecfd0rC+KrhPlou8ewyLLXQqpiGWEFT67s+tAEd
   mSZ5WxA5um8m82w7TPWfEaKtXGrZEKrzcO9YgV1QoP3mYkRFrETLrIm54
   Q==;
X-CSE-ConnectionGUID: IU6GuJYYRLO5YYt779C0jQ==
X-CSE-MsgGUID: 3rg3U7ERTa+AqeYWGj7Puw==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="42451121"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="42451121"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 01:17:24 -0700
X-CSE-ConnectionGUID: qKaGnuGGTxG/yni8i6DnRg==
X-CSE-MsgGUID: qMrffTLPRlytlCS9ZfCoQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="124916130"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 01:17:19 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1trYK2-00000001BlI-3H1A;
	Mon, 10 Mar 2025 10:17:14 +0200
Date: Mon, 10 Mar 2025 10:17:14 +0200
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
Message-ID: <Z86gCjzuC5UFZBIL@smile.fi.intel.com>
References: <20250307-vsprintf-pcn-v1-0-df0b2ccf610f@bootlin.com>
 <20250307-vsprintf-pcn-v1-2-df0b2ccf610f@bootlin.com>
 <Z8sqJhbqEBla_Ch7@smile.fi.intel.com>
 <20250308003425.7b89bfb6@booty>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250308003425.7b89bfb6@booty>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_011726_784426_82FC47F6 
X-CRM114-Status: GOOD (  22.09  )
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

On Sat, Mar 08, 2025 at 12:34:25AM +0100, Luca Ceresoli wrote:
> On Fri, 7 Mar 2025 19:17:26 +0200
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Fri, Mar 07, 2025 at 12:19:08PM +0100, Luca Ceresoli wrote:
> > > %pC and %pCn print the same string, and commit 900cca294425 ("lib/vsprintf:
> > > add %pC{,n,r} format specifiers for clocks") introducing them does not
> > > clarify any intended difference. It can be assumed %pC is a default for
> > > %pCn as some other specifiers do, but not all are consistent with this
> > > policy. Moreover there is now no other suffix other than 'n', which makes a
> > > default not really useful.
> > > 
> > > All users in the kernel were using %pC except for one which has been
> > > converted. So now remove %pCn and all the unnecessary extra code and
> > > documentation.  
> > 
> > You seem forgot to update translation(s) of the documentation.
> 
> I'm afraid I don't speak Chinese. :-)

At bare minimum we can drop the same line in the list.
Also in such a case we may ask a Chinese speaking person to review / correct /
suggest the changes. I would not leave a leftover as it will be forgotten so
easily and documentation becomes not in sync.

> For this specific change I think I could come up with an approximation
> of it, but the both the docs and git log suggest this is not expected.


-- 
With Best Regards,
Andy Shevchenko



