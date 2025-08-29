Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B56DCA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 12:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nd/T4IBgQe3j5oxvQS2Qe/N5JZrVO48MhbCqGSSnzFc=; b=gKYLaUbm4BJ1XvcYG6xwH3UgJf
	1Pt44LAws6JOAQoOpuuHyv+4oWxcJI11HXvzHk4m5rZyWctjqpr2o6LeORJuEyqbkEQlBXDCeFVDm
	3HFG0243nagvO8t2Vr7XZ1e2an0kjpl4LjT1htFtjtp9HFmqZrjZY0qWlaBSofGIWa+9MQ7lbDbMJ
	Rpx+5pqptPz6oUgG6TkW/OF5gXj06YYP4XvqIfQWbNrfZNOp2T+puTWXk/qBSi/61flTk3mwZ9RBw
	y0m0Hu0sep/G4ivI3T/pldHhROuVkD+TZNENegef464yC1hFmp9H6OOkk8t3DXatRRvNo6ZV9CncR
	IyoBzc3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uryAs-00000005dmy-2vsi;
	Fri, 29 Aug 2025 12:25:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urvtA-00000005EAj-2zsB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 09:59:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6509C15A1;
	Fri, 29 Aug 2025 02:59:11 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D38FB3F694;
	Fri, 29 Aug 2025 02:59:17 -0700 (PDT)
Date: Fri, 29 Aug 2025 10:59:15 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Brian Masney <bmasney@redhat.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, <arm-scmi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] clk: scmi: migrate round_rate() to determine_rate()
Message-ID: <20250829-fine-tacky-sturgeon-0ba3c4@sudeepholla>
References: <20250827-clk-scmi-round-rate-v2-1-3782a50835ed@redhat.com>
 <20250829100903.GB16625@nxa18884-linux.ap.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829100903.GB16625@nxa18884-linux.ap.freescale.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_025920_796437_AD1B02DC 
X-CRM114-Status: GOOD (  13.83  )
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

On Fri, Aug 29, 2025 at 06:09:03PM +0800, Peng Fan wrote:
> On Wed, Aug 27, 2025 at 01:12:07PM -0400, Brian Masney wrote:
> >This driver implements both the determine_rate() and round_rate() clk
> >ops, and the round_rate() clk ops is deprecated. When both are defined,
> >clk_core_determine_round_nolock() from the clk core will only use the
> >determine_rate() clk ops.
> >
> >The existing scmi_clk_determine_rate() is a noop implementation that
> >lets the firmware round the rate as appropriate. Drop the existing
> >determine_rate implementation and convert the existing round_rate()
> >implementation over to determine_rate().
> >
> >scmi_clk_determine_rate() was added recently when the clock parent
> >support was added, so it's not expected that this change will regress
> >anything.
> >
> >Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

Peng,

It would be great if you can test it with parent clock support on i.MX
platforms just to be sure this doesn't regress anything.

-- 
Regards,
Sudeep

