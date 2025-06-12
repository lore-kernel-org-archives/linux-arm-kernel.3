Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 364C2C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 07:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JGpE21FrM42Bs+KszC9e8Y10pM1cswEbcJTesyB39f4=; b=KPt6MX+vnBDSe5phs5Pep3mWWg
	bG2PHP+8OA54IiA9CJem7TOP63y62RPOFHiWKw9hZ8sQH+L/Sx+a2PcDtut0+yqmIL3gbBG9k9igC
	/cLgTPrVGTL7qZ1QEKm+ZJPPCExPWJZYaCaWf7ZiaVTypePigsSlYRj8sj4ANGzVAs3U57MpG/ATS
	U3NF5zmUK1+ElC/pK/Dxz3xclHmIe5qotTCHVMjpC1m9XHFskEwN9akfvd4G+7rhVb2GpYklat0KI
	PBPRZ1E6hZuMBKfOhevv3zvGHwjsAapxHfWsy7OAeblj3KgWBEEt1Q0LkG73ngMrFYfLmhWKI/k7D
	ieVNAIPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcnm-0000000CWry-1QaK;
	Thu, 12 Jun 2025 07:56:46 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcOU-0000000CS4Z-0TAu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 07:30:39 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1uPcON-0001dv-QA; Thu, 12 Jun 2025 09:30:31 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uPcON-0035AV-1C;
	Thu, 12 Jun 2025 09:30:31 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uPcON-008nuf-0r;
	Thu, 12 Jun 2025 09:30:31 +0200
Date: Thu, 12 Jun 2025 09:30:31 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: scmi: Fix children encountered before parents case
Message-ID: <aEqCF-xV04VIKCfg@pengutronix.de>
References: <20250604-clk-scmi-children-parent-fix-v1-1-be206954d866@pengutronix.de>
 <20250612034723.GB7552@nxa18884-linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612034723.GB7552@nxa18884-linux>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_003038_149769_A6701306 
X-CRM114-Status: GOOD (  19.23  )
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

On Thu, Jun 12, 2025 at 11:47:23AM +0800, Peng Fan wrote:
> On Wed, Jun 04, 2025 at 01:00:30PM +0200, Sascha Hauer wrote:
> >When it comes to clocks with parents the SCMI clk driver assumes that
> >parents are always initialized before their children which might not
> >always be the case.
> >
> >During initialization of the parent_data array we have:
> >
> >	sclk->parent_data[i].hw = hws[sclk->info->parents[i]];
> >
> >hws[sclk->info->parents[i]] will not yet be initialized when children
> >are encountered before their possible parents. Solve this by allocating
> >all struct scmi_clk as an array first and populating all hws[] upfront.
> >
> >Fixes: 65a8a3dd3b95f ("clk: scmi: Add support for clock {set,get}_parent")
> >Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> 
> Thanks for the fix. To i.MX, the index of child clk is always after
> parent clk per current SM design. Not sure you met real issue, anyway
> this patch itself is correct.

I had issues on TI AM62L (not yet upstream).

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

