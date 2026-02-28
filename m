Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D6FFEE4E2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 10:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mFg2G95XMmwLJrNH4K8fKYMaazgcQEySW0oDy186VH4=; b=mBMmhFTyHHIucUAPL1rIGJMSFQ
	A1Pj83itelzIkI5a6FZqYWBczblVWEQLIMd/plWfsym2LR3zbLOpAWPCQ9F8jcj6rfqOpMswJHN9o
	JWclim78vocTbSHbJx5d4/NpjECa9RcOznLFxsD4rF3bhXSDBWS5u9KmqQ8Pacb/k6BhpyyjFzOBv
	r50Ls2P0jSnHTBkTc7hqZ0Ls3gLF4kQgpO2b96hpYjCoQORsvfwYSlOHLCXNNsYISxDPE/+CR2zGk
	pB+mLN7HvJtLOS9q9w2qKl5IRV23pczfSiA4fJ9HcptK53FGcPVPRttd9Qprx9Ejr+yQq163uLw9D
	0YsJVB8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwHUU-00000009jQo-3u47;
	Sat, 28 Feb 2026 10:24:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwHUS-00000009jQM-1LDS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 10:24:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B62B1516;
	Sat, 28 Feb 2026 02:23:56 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C8EC33F7BD;
	Sat, 28 Feb 2026 02:23:57 -0800 (PST)
Date: Sat, 28 Feb 2026 10:23:54 +0000
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
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com,
	Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 02/11] clk: scmi: Use new determine_rate clock operation
Message-ID: <aaLCOstT89XQEP6P@pluto>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-3-cristian.marussi@arm.com>
 <aaI9JBwWaMmfBbd/@shlinux89>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaI9JBwWaMmfBbd/@shlinux89>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_022404_494893_94D68C78 
X-CRM114-Status: GOOD (  27.77  )
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

On Sat, Feb 28, 2026 at 08:56:04AM +0800, Peng Fan wrote:
> On Fri, Feb 27, 2026 at 03:32:16PM +0000, Cristian Marussi wrote:
> >Use the Clock protocol layer determine_rate logic to calculate the closest
> >rate that can be supported by a specific clock.
> >
> >No functional change.
> >
> >Cc: Brian Masney <bmasney@redhat.com>
> >Cc: Michael Turquette <mturquette@baylibre.com>
> >Cc: Stephen Boyd <sboyd@kernel.org>
> >Cc: linux-clk@vger.kernel.org
> >Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> >---
> >Note that the calculation logic in the protocol layer is exactly the same
> >as it wes here.
> >
> >@Brian I suppose once your CLK_ROUNDING_FW_MANAGED sereis is merged I can flag
> >such SCMI clocks.
> 
> Per my reading of Brain's thread, if ->determine_rate exists,
> ->determine_rate() will be used.
> 
>  	} else if (core->ops->determine_rate) {
>  		return core->ops->determine_rate(core->hw, req);
> +	} else if (clk_is_rounding_fw_managed(core)) {
> +		return 0;
> 
> So unless update scmi_clk_determine_rate() to something:
> --------
> if (clk & CLK_ROUNDING_FW_MANAGED)
> 	return 0;
> 
> return scmi_proto_clk_ops->determine_rate(clk->ph, clk->id, &req->rate);
> --------
> 
> It maybe better to update Brain's patch to move clk_is_rounding_fw_managed()
> above the check of core->ops->determine_rate().

Indeed, I may have not fully understood Brian patch, since it appeared
while I was already reworking this...

I suppose I could also refrain from registering a determine_rate and
use the new flag when I know the rate will be rounded by FW...in the
future simply there will be the possibility to ask the firmware first
for a final 'clock rate determination' upfront in some of the cases in
which now we rely on FW rounding..

> 
> >---
> > drivers/clk/clk-scmi.c | 31 ++++++-------------------------
> > 1 file changed, 6 insertions(+), 25 deletions(-)
> >
> >diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
> >index 6b286ea6f121..c223e4ef1dd1 100644
> >--- a/drivers/clk/clk-scmi.c
> >+++ b/drivers/clk/clk-scmi.c
> >@@ -12,7 +12,6 @@
> > #include <linux/of.h>
> > #include <linux/module.h>
> > #include <linux/scmi_protocol.h>
> >-#include <asm/div64.h>
> > 
> > #define NOT_ATOMIC	false
> > #define ATOMIC		true
> >@@ -57,35 +56,17 @@ static unsigned long scmi_clk_recalc_rate(struct clk_hw *hw,
> > static int scmi_clk_determine_rate(struct clk_hw *hw,
> > 				   struct clk_rate_request *req)
> > {
> >-	u64 fmin, fmax, ftmp;
> >+	int ret;
> > 	struct scmi_clk *clk = to_scmi_clk(hw);
> > 
> > 	/*
> >-	 * We can't figure out what rate it will be, so just return the
> >-	 * rate back to the caller. scmi_clk_recalc_rate() will be called
> >-	 * after the rate is set and we'll know what rate the clock is
> >+	 * If we could not get a better rate scmi_clk_recalc_rate() will be
> >+	 * called after the rate is set and we'll know what rate the clock is
> > 	 * running at then.
> > 	 */
> >-	if (clk->info->rate_discrete)
> >-		return 0;
> >-
> >-	fmin = clk->info->range.min_rate;
> >-	fmax = clk->info->range.max_rate;
> >-	if (req->rate <= fmin) {
> >-		req->rate = fmin;
> >-
> >-		return 0;
> >-	} else if (req->rate >= fmax) {
> >-		req->rate = fmax;
> >-
> >-		return 0;
> >-	}
> >-
> >-	ftmp = req->rate - fmin;
> >-	ftmp += clk->info->range.step_size - 1; /* to round up */
> >-	do_div(ftmp, clk->info->range.step_size);
> >-
> >-	req->rate = ftmp * clk->info->range.step_size + fmin;
> >+	ret = scmi_proto_clk_ops->determine_rate(clk->ph, clk->id, &req->rate);
> >+	if (ret)
> >+		return ret;
> 
> nit:
> "return scmi_proto_clk_ops->determine_rate(clk->ph, clk->id, &req->rate);"

..oh yes...
> 
> Otherwise:
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> 

Thanks,
Cristian

