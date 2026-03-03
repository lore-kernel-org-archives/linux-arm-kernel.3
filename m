Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CC7EC1430
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 12:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H5ODPGutuU+rsn4sIZ1lLnJQx0+8eE82Ydk9HyH3hS4=; b=EU2L2G3SbyT84hZhCer5DN0PFV
	O2LsHKlrrfOOPTqna4tZ19pn5xgLUA7Qf9n4IIQPIGXzjTLUCeXAiL8yyhk3hGQ+V6lgWVlwWT4TJ
	Hm/MCH9NmjWsvBy0z6LPV7W5LeNfgh5LW4iyg1ZnOdKmXPxRU26Z2dk3cEWS7l+QVY0lPVh8uA/n0
	GQIBka+8epbfd5QR92dMdfWZDB4rp2/gXZrggazo/qvz5tMssftAPdLDed7YhSuBKBTQD5551ofqM
	2sWGgu4Xpni62QPkiMqJ1PL2j5aSLPiBPjhozBbLENmudDSwUQLbPEVASTEg/knTErjZ2SW5Gg+/y
	YrWFsssA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxPAX-0000000FAzY-23Ox;
	Tue, 03 Mar 2026 12:48:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxPAV-0000000FAz8-2yhd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 12:48:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33056497;
	Tue,  3 Mar 2026 04:48:00 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 004193F7BD;
	Tue,  3 Mar 2026 04:48:01 -0800 (PST)
Date: Tue, 3 Mar 2026 12:47:58 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 02/11] clk: scmi: Use new determine_rate clock operation
Message-ID: <aabYfgvXh2QtPDWR@pluto>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-3-cristian.marussi@arm.com>
 <aaI9JBwWaMmfBbd/@shlinux89>
 <aaXEtNilpRYhwmYc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaXEtNilpRYhwmYc@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_044807_785893_BA6BF399 
X-CRM114-Status: GOOD (  21.52  )
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

On Mon, Mar 02, 2026 at 12:11:16PM -0500, Brian Masney wrote:
> On Sat, Feb 28, 2026 at 08:56:04AM +0800, Peng Fan wrote:
> > On Fri, Feb 27, 2026 at 03:32:16PM +0000, Cristian Marussi wrote:
> > >Use the Clock protocol layer determine_rate logic to calculate the closest
> > >rate that can be supported by a specific clock.
> > >
> > >No functional change.
> > >
> > >Cc: Brian Masney <bmasney@redhat.com>
> > >Cc: Michael Turquette <mturquette@baylibre.com>
> > >Cc: Stephen Boyd <sboyd@kernel.org>
> > >Cc: linux-clk@vger.kernel.org
> > >Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > >---
> > >Note that the calculation logic in the protocol layer is exactly the same
> > >as it wes here.
> > >
> > >@Brian I suppose once your CLK_ROUNDING_FW_MANAGED sereis is merged I can flag
> > >such SCMI clocks.
> > 
> > Per my reading of Brain's thread, if ->determine_rate exists,
> > ->determine_rate() will be used.
> > 
> >  	} else if (core->ops->determine_rate) {
> >  		return core->ops->determine_rate(core->hw, req);
> > +	} else if (clk_is_rounding_fw_managed(core)) {
> > +		return 0;
> > 
> > So unless update scmi_clk_determine_rate() to something:
> > --------
> > if (clk & CLK_ROUNDING_FW_MANAGED)
> > 	return 0;
> > 
> > return scmi_proto_clk_ops->determine_rate(clk->ph, clk->id, &req->rate);
> > --------
> > 
> > It maybe better to update Brain's patch to move clk_is_rounding_fw_managed()
> > above the check of core->ops->determine_rate().
> 
> The clk framework has some basic sanity checks in place that are called
> during device probe to ensure that various ops are configured properly. I
> could add a check that if CLK_ROUNDING_FW_MANAGED [*] is set, and a
> determine_rate() op is set, then it gives an error.
> 
> [*] Note: I am tentatively planning to rename that to CLK_ROUNDING_NOOP
> in v2 in about a week.

Ok, I will track yor series to decide how to better handle this on my
side.

Thanks,
Cristian

