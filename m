Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D42C71141
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 09:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9FsfCgew5su4RjIWBIEQUjvTHIuCl0Pyuh8thO8jg/I=; b=qAxyBKOAdyuPqy/bO3PmeaYoeW
	1Jnbhse9UnKUD5fVTVVaifNmSJtZvGGcedlN8Zu4RWFh4V59Ii+F90kPUK/9HLc90iH2U2XWyBH+8
	heIvmh+ScRDWR/lV67wNh4G1cR9Wpy3breKjR/spa5jRQJX42yDQpt+qCe0lWN5gxWODJh1epy5ZC
	JE3OocdyvlnBw31GzaFxsdzbr01ctyT741bYE556ZJiUXVbzw7MStyBwTXswCCuT1AN6dehp00Hte
	0JeSOG7bGTccJJZYbehKOS2CvqXt10/nIS/Uh3tb6xkM01fceJ04MdzW/Fb9kSxPYXvKMHmlavAIq
	JgGjY+cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPedB-0000000CsN4-074L;
	Thu, 12 Jun 2025 09:53:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdJK-0000000Ccvk-3zHy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 08:29:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5782339;
	Thu, 12 Jun 2025 01:29:00 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 104273F59E;
	Thu, 12 Jun 2025 01:29:18 -0700 (PDT)
Date: Thu, 12 Jun 2025 09:29:16 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	<arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] clk: scmi: Fix children encountered before parents
 case
Message-ID: <20250612-eccentric-fresh-bee-e52db4@sudeepholla>
References: <20250612-clk-scmi-children-parent-fix-v2-1-125b26a311f6@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-clk-scmi-children-parent-fix-v2-1-125b26a311f6@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_012923_027869_BA440B81 
X-CRM114-Status: GOOD (  13.72  )
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

On Thu, Jun 12, 2025 at 09:36:58AM +0200, Sascha Hauer wrote:
> When it comes to clocks with parents the SCMI clk driver assumes that
> parents are always initialized before their children which might not
> always be the case.
> 
> During initialization of the parent_data array we have:
> 
> 	sclk->parent_data[i].hw = hws[sclk->info->parents[i]];
> 
> hws[sclk->info->parents[i]] will not yet be initialized when children
> are encountered before their possible parents. Solve this by allocating
> all struct scmi_clk as an array first and populating all hws[] upfront.
> 

LGTM. I would like to add a note that we don't free individual scmi_clk
if for some reason it fails to setup. I can do that when I apply, just
checking if anyone has any objections. Please shout out if you have.

-- 
Regards,
Sudeep

