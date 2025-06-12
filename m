Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C572EC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 09:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PfOgqDVX1TxE2H/PjpJ1yF8E6L0x6UwKYh/UjL4iJ38=; b=frFCXwyClqNsh4j5FxWnobGzWO
	kOlp6DNbqup2rVQnaK0mM9OgEbwd0WPzB0yZXknRsRBYWD2s1KwW5nlb1rzaehLLaEkaTZCdesLth
	a8I2kt03TCZEdyYk9lFTezwVQeYiC9xqjT5dUr5p2/HiwEDhiOoANoBwQnbQ/Fg4dpn2ZMKcSyidM
	Lx5hGMPDQMzdI1my9YbS5hG8RO8B1tH9VMJoGCet3361TS8vMGvVBNbdcQBig2SKohU9HTOivZ4Ke
	MqoqrHhQtfia4Mhmb1CIOIbz2tI/o+Ohwf126d5PicF5bhIKCQyhE9cuGNyMMPnobXZByJ3HbClKL
	gQPX9fyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPehO-0000000CtIe-1jJk;
	Thu, 12 Jun 2025 09:58:18 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdX7-0000000CgBz-3nx8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 08:43:39 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1uPdX3-0005C5-0f; Thu, 12 Jun 2025 10:43:33 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uPdX2-0035mI-2D;
	Thu, 12 Jun 2025 10:43:32 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uPdX2-008pJu-1h;
	Thu, 12 Jun 2025 10:43:32 +0200
Date: Thu, 12 Jun 2025 10:43:32 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: scmi: Fix children encountered before parents
 case
Message-ID: <aEqTNLTp0EzcC2aa@pengutronix.de>
References: <20250612-clk-scmi-children-parent-fix-v2-1-125b26a311f6@pengutronix.de>
 <20250612-eccentric-fresh-bee-e52db4@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-eccentric-fresh-bee-e52db4@sudeepholla>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_014337_941010_6526CE33 
X-CRM114-Status: GOOD (  22.97  )
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

On Thu, Jun 12, 2025 at 09:29:16AM +0100, Sudeep Holla wrote:
> On Thu, Jun 12, 2025 at 09:36:58AM +0200, Sascha Hauer wrote:
> > When it comes to clocks with parents the SCMI clk driver assumes that
> > parents are always initialized before their children which might not
> > always be the case.
> > 
> > During initialization of the parent_data array we have:
> > 
> > 	sclk->parent_data[i].hw = hws[sclk->info->parents[i]];
> > 
> > hws[sclk->info->parents[i]] will not yet be initialized when children
> > are encountered before their possible parents. Solve this by allocating
> > all struct scmi_clk as an array first and populating all hws[] upfront.
> > 
> 
> LGTM. I would like to add a note that we don't free individual scmi_clk
> if for some reason it fails to setup. I can do that when I apply, just
> checking if anyone has any objections. Please shout out if you have.

Feel free to add that note. I should have added this myself since it's
not entirely obvious that the devm_kfree() has to be removed with this
patch.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

