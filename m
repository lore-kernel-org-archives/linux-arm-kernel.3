Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D1CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 17:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eNphthjgVvbUd0LwSkmhg8t4XbYVlflbuljAnr/3qUI=; b=3v0q9aiONauYOeWrOTulC+JUNK
	9lEfJjrmSDazLD8r+ZmUXiHy4U8hX+J12XShuPxHlELr88Y6GkAKGCmJKvn/FGYD/cV09ZrSgAe/f
	neKJ3h52a7ErdseCui0AVJFDCZGNojI7wyY2uo/KICcTdBIZtGnbDINJBa1zEP/GgKPf+7pnt+HWE
	z4nzEZeuPjzptPmceyEETFVIc0QeQvpTF3xRwr2Bl0DRwMcZbfvr66H20dym54K1Y4optA4LYi9/y
	6diRikCsr+ma/jS/AWYtSnI/yu35IxhmFDui8jEwvdm/zi7jXH60RjgCzScO4Sst3IUwY9pR/Wuue
	POrZsG6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdAIV-0000000BhLM-3gp8;
	Fri, 26 Jun 2026 17:24:59 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdAIT-0000000BhBx-2Lj0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 17:24:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782494697; x=1814030697;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sxRw18zkQathnyRUCjykUrB0bBzcjMDPv4SrED00VSc=;
  b=c3tERzkXB7goh3h5Uf4aX4WNwoCQdJDw2qPE8s8vMeF61RbmbYo9Nw92
   rv2+y0qvWcUg1nQwePkxeF2ialk8NZjQ8iH/npVEHkj8+RkYCcVSwMVVq
   zrUUNUHRd7uC9Q++4fxTw7Gq6NpJiBnLttB1g7YL/j2j/nePZfx0wZimq
   LPJXt3cAbbrvPR2GS2XVB2aHwxhykOAfTBHqC28R43lfP5c0YzDC7jyom
   ZHI+m01g2AxzDLuW+7QOOrMa532HHUvB+rLbMJFcgeckegc2D4hNojaKh
   0ML2JHDli2URwgke199Jr+aaC4FAGhi5altdf9yfueyQgU0P8BYTgiokt
   Q==;
X-CSE-ConnectionGUID: xMH76DPJRuylBqjNfhQlFg==
X-CSE-MsgGUID: sDWPLniwSN+NmbfIheYcqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="83347106"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="83347106"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 10:22:56 -0700
X-CSE-ConnectionGUID: MRPAZPY+SNOnmi7n9ZUeKg==
X-CSE-MsgGUID: +6Q51wUpQw2Gf1GiK2hyQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="246908176"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmviesa006.fm.intel.com with ESMTP; 26 Jun 2026 10:22:54 -0700
Date: Sat, 27 Jun 2026 01:22:53 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: "Pandey, Radhey Shyam" <radheys@amd.com>
Cc: Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org,
	monstr@monstr.eu, git@amd.com, Moritz Fischer <mdf@kernel.org>,
	Tom Rix <trix@redhat.com>, Xu Yilun <yilun.xu@intel.com>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:FPGA MANAGER FRAMEWORK" <linux-fpga@vger.kernel.org>
Subject: Re: [PATCH] fpga: xilinx-pr-decoupler: Use devm_clk_get_prepared()
Message-ID: <aj61bRnqxDEDx9en@yilunxu-OptiPlex-7050>
References: <8ca8ee5ba720b608a41f842d2b743302e5500ad0.1782205286.git.michal.simek@amd.com>
 <5bd0f7db-7ec0-4390-b6ea-1edca46e1ca7@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5bd0f7db-7ec0-4390-b6ea-1edca46e1ca7@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_102457_612787_F863B196 
X-CRM114-Status: GOOD (  12.22  )
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

On Tue, Jun 23, 2026 at 04:31:28PM +0530, Pandey, Radhey Shyam wrote:
> > The driver keeps the "aclk" clock prepared but disabled in its idle
> > state, toggling only the atomic clk_enable()/clk_disable() around
> > register accesses in the bridge enable_set/enable_show callbacks.
> > 
> > At probe time this was open-coded as clk_prepare_enable() immediately
> > followed by clk_disable(), leaving the clock prepared, with a matching
> > clk_unprepare() in the error path and in remove().
> > 
> > devm_clk_get_prepared() expresses exactly this: it gets and prepares the
> > clock and unprepares it automatically on driver detach.
> > 
> > Use it to drop the manual prepare/disable dance, the error-path
> > unprepare, and the now-empty clock teardown in remove().
> > 
> > Signed-off-by: Michal Simek <michal.simek@amd.com>
> 
> Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>

Reviewed-by: Xu Yilun <yilun.xu@intel.com>

Will apply to for-next when 7.2-rc1 comes.

