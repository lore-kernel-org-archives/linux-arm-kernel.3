Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA18C71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 13:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kVUOxiMG28/lyCa9DqFU7+pIhEmM8PXDAmpM5fCxa3Q=; b=jzSEGG9Prf9hy2075zyPm4QRRm
	rvBNJ0Z0DN8UDdM+AahkIq3i91A5dSc98wDOri33nmFxcc1fYx0sOrxPkiX0l/8bEQUWE40inEUjF
	zwfVpBuKdamQXWoJRq7e0O7CGj1OKglbG9uH8fjXWxvMP3aHfPo1SoNnU/g6nJKwzh+mgqDeXIcBB
	cSfgue1lbaxjLTrbAdGYEbiSCa6cQxw82E16G+1SVUxaBMJmfIKjZTFoAFelsLxBK2aNGxGoDoPFT
	KWbn5Y8+S5XC1b5F6mj5Q8t4thjuI093vrSnO2L835MFSu9wlDQvcQ3esZ4XGHGau1lE1bHGC9Wh+
	n41y/RdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ4ro-0000000Ga1L-0nNd;
	Fri, 13 Jun 2025 13:54:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ4h4-0000000GWOz-2p0a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 13:43:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC8F62B;
	Fri, 13 Jun 2025 06:43:19 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 722613F59E;
	Fri, 13 Jun 2025 06:43:38 -0700 (PDT)
Date: Fri, 13 Jun 2025 14:43:35 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	<arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] clk: scmi: Handle case where child clocks are
 initialized before their parents
Message-ID: <20250613-congenial-tamarin-of-experience-cb2598@sudeepholla>
References: <20250612-clk-scmi-children-parent-fix-v3-1-7de52a27593d@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-clk-scmi-children-parent-fix-v3-1-7de52a27593d@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_064342_754682_FDF04453 
X-CRM114-Status: GOOD (  15.47  )
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

On Thu, Jun 12, 2025 at 02:56:57PM +0200, Sascha Hauer wrote:
> The SCMI clock driver currently assumes that parent clocks are always
> initialized before their children. However, this assumption can fail if
> a child clock is encountered before its parent during probe.
> 
> This leads to an issue during initialization of the parent_data array:
> 
>     sclk->parent_data[i].hw = hws[sclk->info->parents[i]];
> 
> If the parent clock's hardware structure has not been initialized yet,
> this assignment results in invalid data.
> 
> To resolve this, allocate all struct scmi_clk instances as a contiguous
> array at the beginning of the probe and populate the hws[] array
> upfront. This ensures that any parent referenced later is already
> initialized, regardless of the order in which clocks are processed.
> 
> Note that we can no longer free individual scmi_clk instances if
> scmi_clk_ops_init() fails which shouldn't be a problem if the SCMI
> platform has proper per-agent clock discovery.
> 
> Fixes: 65a8a3dd3b95f ("clk: scmi: Add support for clock {set,get}_parent")
> Reviewed-by: peng.fan@nxp.com
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

Mike/Stephen,

Please pick this up in your next round of fixes.

-- 
Regards,
Sudeep

