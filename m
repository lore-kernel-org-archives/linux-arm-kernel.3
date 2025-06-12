Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20247C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 10:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OTdk/W8JCQtrmQJ01xeotuP1J4QJ3C3dS07xj7859k8=; b=PtdQXnn+Danva04/88fVQmjHzw
	HJrVl0xQg/f7JpBN1ElLeYCWhwsoxWcZBkOyFYjWnF6gqUwdqWH2nZ26z0m4uYy26TT1b8ITnjdef
	otGKvsziivhphnA7IvRyTJmRTDlO6xly9+6hONn/wy6adv8xaVLIkjxSqeGlszpYI+M+WhK7KxVqz
	tBaSsHEZhliP+Cskpw2MXj698N25evpWTfcZ3t+6dIERfxZQ/3xLhFA6wK8BVs3WT2KiXn81VD5Nz
	DT5u1h/2lpxT41bT6/zrROYDG9ZQ8+X5sEXITOce9Nd7V6Za683DdUftDFd46J1ShnzUkQPbBUzye
	6IjfbRdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPfOC-0000000D1XT-0I1J;
	Thu, 12 Jun 2025 10:42:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPeLo-0000000CpY5-0JP5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 09:36:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4A4314BF;
	Thu, 12 Jun 2025 02:35:37 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5133E3F66E;
	Thu, 12 Jun 2025 02:35:56 -0700 (PDT)
Date: Thu, 12 Jun 2025 10:35:53 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	<arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] clk: scmi: Fix children encountered before parents
 case
Message-ID: <20250612-vivacious-bipedal-beetle-b04714@sudeepholla>
References: <20250612-clk-scmi-children-parent-fix-v2-1-125b26a311f6@pengutronix.de>
 <20250612-eccentric-fresh-bee-e52db4@sudeepholla>
 <aEqTNLTp0EzcC2aa@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEqTNLTp0EzcC2aa@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_023600_154741_5DD31019 
X-CRM114-Status: GOOD (  24.02  )
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

On Thu, Jun 12, 2025 at 10:43:32AM +0200, Sascha Hauer wrote:
> On Thu, Jun 12, 2025 at 09:29:16AM +0100, Sudeep Holla wrote:
> > On Thu, Jun 12, 2025 at 09:36:58AM +0200, Sascha Hauer wrote:
> > > When it comes to clocks with parents the SCMI clk driver assumes that
> > > parents are always initialized before their children which might not
> > > always be the case.
> > > 
> > > During initialization of the parent_data array we have:
> > > 
> > > 	sclk->parent_data[i].hw = hws[sclk->info->parents[i]];
> > > 
> > > hws[sclk->info->parents[i]] will not yet be initialized when children
> > > are encountered before their possible parents. Solve this by allocating
> > > all struct scmi_clk as an array first and populating all hws[] upfront.
> > > 
> > 
> > LGTM. I would like to add a note that we don't free individual scmi_clk
> > if for some reason it fails to setup. I can do that when I apply, just
> > checking if anyone has any objections. Please shout out if you have.
> 
> Feel free to add that note. I should have added this myself since it's
> not entirely obvious that the devm_kfree() has to be removed with this
> patch.
> 

I did that and realised only bit later that I usually route SCMI clk driver
changes via clk tree.

Please repost with

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

I am sharing below the commit message update I did when I applied.

Regards,
Sudeep

-->8

clk: scmi: Handle case where child clocks are initialized before their parents

The SCMI clock driver currently assumes that parent clocks are always
initialized before their children. However, this assumption can fail if
a child clock is encountered before its parent during probe.

This leads to an issue during initialization of the parent_data array:

    sclk->parent_data[i].hw = hws[sclk->info->parents[i]];

If the parent clock's hardware structure has not been initialized yet,
this assignment results in invalid data.

To resolve this, allocate all struct scmi_clk instances as a contiguous
array at the beginning of the probe and populate the hws[] array upfront.
This ensures that any parent referenced later is already initialized,
regardless of the order in which clocks are processed.

Note that we can no longer free individual scmi_clk instances if
scmi_clk_ops_init() fails which shouldn't be a problem if the SCMI
platform has proper per-agent clock discovery.

