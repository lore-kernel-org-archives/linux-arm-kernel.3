Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6786EC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 06:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QIg8sFPUOxuVS3Yn9OTeq59LnSdm8k7+PpYVfWbnTLA=; b=FVb5rsqzp6IpTDioahqzHsbSZq
	PRa7KsW+dgWaudFWPOa9WnHBKilEkOAiI9geHue5VnDVFWr2yIrMvBBblg8zR8kRIT9UtSWyOnN+a
	5EonOVIO6Qab/a8VERAOyvFuMD043a4bQwrSh/jAmlhiIX+CgNJv8HBCIBu5R0WQy1iivtltpFkNb
	Q7SNLz1q3Q9we34F8BiNVVD+PPZPLOhyzIP4EB7NTLJDxXlDe0VmESvroeh+dh7bcB3HC2mjD0Dp4
	9UlSVpMHXSh1WGTpkj6nGDxs6RGgS3vlCghWHo0E5vowszonYHSyXOtUUKMfDrUtpdzC0PhjqV5D+
	W/buQYaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YSu-0000000DYUI-0otx;
	Thu, 10 Sep 2026 06:40:56 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YSr-0000000DYTb-2hsZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 06:40:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789022454; x=1820558454;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AU7p2eSR//jayR3C19gBuBIxS69n4oXnhNgdy1B/xtg=;
  b=JOqVa/xdELlQezUdTAlcTAZ1gIuhcmA2q6q6QbpQZhu2karIUUxtpell
   zQxaHBYGR0kgfpRf2YoWv5ZALlAVr6BbFo0wZv5MkZ0YDoGCzuPvNC4XB
   N7pn99246hNuXlM6OfBoaE7m7k7Tpxv+4y3iuGFG13CZdHLURQK0IkwK5
   ajDDF37CvVxbd1MIJTpmo8G51PAVRcGOCqzdQ+hrmuZazfR15bzeqv1h5
   T3afnWdC8rn25RWMN/sME8jluqyxDolhLFVb9MR62/5KbniJRvUYTLDkc
   1KTTtSC6dmzPIfkyt1Vhryfj+sSLt5ggJHG0cVKCBJm0yHTExtrOP+ViG
   Q==;
X-CSE-ConnectionGUID: 3S2IanCyTpSg7D8F3oBmwQ==
X-CSE-MsgGUID: wPehrv39QOWh6MIaUxNTYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89675205"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="89675205"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 23:40:53 -0700
X-CSE-ConnectionGUID: pntFyr5xTUq0BMpGMNtSIg==
X-CSE-MsgGUID: nRXqZGz7RjWBULdZbtd/1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="268279890"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.177])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 23:40:51 -0700
Date: Thu, 10 Sep 2026 09:40:49 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7] i2c: xiic: restore non-managed runtime PM to fix clk
 WARN flood
Message-ID: <aqJQ8Qm_nhBaWR-s@ashevche-desk.local>
References: <20260821-i2c-xiic-restore-runtime-pm-teardown-v7-1-954e06765144@nexthop.ai>
 <DLBBXHXIVHZL.BIOFL7T9OAM7@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLBBXHXIVHZL.BIOFL7T9OAM7@nexthop.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_234053_739836_9D47C598 
X-CRM114-Status: GOOD (  15.73  )
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

On Wed, Sep 09, 2026 at 08:51:33PM -0700, Abdurrahman Hussain wrote:
> On Fri Aug 21, 2026 at 6:12 PM PDT, Abdurrahman Hussain wrote:

> Gentle ping on this one. It has been quiet since v7 went out on Aug 21.
> 
> Andy, v4 onwards switched to request_threaded_irq()/free_irq() with the
> explicit free in the probe error path and in remove(), per your comment on
> v3. Does that address your concern, or is there anything else you would
> like changed?

Seems okay to me.

> Andi, this is a regression fix for 50c63491ff26 (the devres conversion),
> and the WARN fires on every unbind/rmmod of the driver, so it would be
> good to get it into 7.2 or early 7.3 fixes if the patch looks OK to you.

v7.2 is already released, so v7.3-rcX is the best you can get.

> Happy to respin if anything is still open.

-- 
With Best Regards,
Andy Shevchenko



