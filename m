Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F7B9FEE4E2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 10:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G+gnw1GwcjeoV5gspgDImNvBV6P4RCkn7yaYBK7nILA=; b=bDJCN5jb8wz8VxbfMpnUKJeB48
	htavtIDfKm7FmPLt+ZrnyNOF2nUlah4HskYi2w+n12yjCvblX7Ngj918vcwlidCG/uDyYiCNTF7lg
	GKObGeDAcQv1V+6/0iaNph+lHsS70RVB75x8vpDQVmrCBmCmgm6IGGQib3sgrcmCXf3gAwVZexggy
	nt85HktSrIcJEnk+w9zrPp8OPCSK1ljTipef2TDE0T6XdJI5E7sc7k0gx+GvT/vRUIF49R/R0LY8X
	Id4XS9vNWuYkOQtpqZIvcK7FBcrRM/rAEqnTagrCz1aAM3SiwJGOCnoO4XttMSHdyZw/itJmm+255
	21lGr7Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwHgx-00000009k6f-0QBz;
	Sat, 28 Feb 2026 10:36:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwHgt-00000009k6J-4BbS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 10:36:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD8711516;
	Sat, 28 Feb 2026 02:36:47 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2EB233F7BD;
	Sat, 28 Feb 2026 02:36:50 -0800 (PST)
Date: Sat, 28 Feb 2026 10:36:46 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Subject: Re: [PATCH 06/11] firmware: arm_scmi: Make clock rates allocation
 dynamic
Message-ID: <aaLFPgB6Nb77FI63@pluto>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-7-cristian.marussi@arm.com>
 <aaJS9x5lZ9xSEu1V@shlinux89>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaJS9x5lZ9xSEu1V@shlinux89>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_023656_073827_DAC838C8 
X-CRM114-Status: GOOD (  15.60  )
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

On Sat, Feb 28, 2026 at 10:29:11AM +0800, Peng Fan wrote:
> On Fri, Feb 27, 2026 at 03:32:20PM +0000, Cristian Marussi wrote:
> >Leveraging SCMI Clock protocol dynamic discovery capabilities, move away
> >from the static per-clock rates allocation model in favour of a dynamic
> >runtime allocation based on effectively discovered resources.
> >
> >No functional change.
> >
> >Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> >---
> > drivers/firmware/arm_scmi/clock.c | 19 ++++++++++++++++---
> > include/linux/scmi_protocol.h     |  1 -
> > 2 files changed, 16 insertions(+), 4 deletions(-)
> >
> >diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
> >index f5d1c608f85a..d0fb5affb5cf 100644
> >--- a/drivers/firmware/arm_scmi/clock.c
> >+++ b/drivers/firmware/arm_scmi/clock.c
> >@@ -161,7 +161,7 @@ struct scmi_clock_desc {
> > 	u32 id;
> > 	bool rate_discrete;
> > 	unsigned int num_rates;
> >-	u64 rates[SCMI_MAX_NUM_RATES];
> >+	u64 *rates;
> > #define	RATE_MIN	0
> > #define	RATE_MAX	1
> > #define	RATE_STEP	2
> >@@ -480,6 +480,18 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
> > 			   QUIRK_OUT_OF_SPEC_TRIPLET);
> > 	}
> > 
> >+	if (!st->max_resources) {
> >+		int num_rates = st->num_returned + st->num_remaining;
> >+
> >+		p->clkd->rates = devm_kcalloc(p->dev, num_rates,
> >+					      sizeof(*p->clkd->rates), GFP_KERNEL);
> >+		if (!p->clkd->rates)
> >+			return -ENOMEM;
> 
> It may be not related to this patch,
> I see scmi_clock_describe_rates_get() does not have return value check
> when being called in scmi_clock_protocol_init().
> 
> So if devm_kcalloc() fails, there maybe issue without a sanity check
> to return value of scmi_clock_describe_rates_get().
> 

Yes I think I saw that...wanted to fix too..and forgot :D 

I will add a fix in V2.

Thanks,
Cristian


