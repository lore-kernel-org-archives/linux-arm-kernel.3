Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F9F7FEE4E2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 10:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vTwC2OgP8Z+2zXJyCDWGdv1x8oCdVt0S0rT13j70Yws=; b=VLKMet4NGzxZLyAbIQOD8hFvYe
	+PTpkTqE/GYe9nK7BUf7z24vG/TSv1/KUGj4dDsyYBuKzxbIg3w033k6a4YcOum9XUoyqpCqz7yY2
	kEmtQ7FdQ7PUMUNAOXj/raBq5YvKTk++EogAPuBhNK26QdvxFuogfq34nuf7y1W/QLkYZXmf9J5X2
	mDJlU7o2LY1GgJV5JFPur+XFSi7PSCLPLKY3o446URTFNV5xzwxtPz/YrH/18oaP15d7bngfrhnwo
	elwptaNSRaTLCkoRaeSlaroVRl3EgLV9RBhl0oDTbckWnxzgMZ1TnPsikUS7idp5D+iBdRmQ034LV
	dJYebuQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwHi3-00000009kDI-2Dyu;
	Sat, 28 Feb 2026 10:38:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwHi1-00000009kCp-0iNM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 10:38:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96BC41516;
	Sat, 28 Feb 2026 02:37:57 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE2463F7BD;
	Sat, 28 Feb 2026 02:37:58 -0800 (PST)
Date: Sat, 28 Feb 2026 10:37:55 +0000
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
Subject: Re: [PATCH 07/11] firmware: arm_scmi: Harden clock parents discovery
Message-ID: <aaLFg7LAC8-dtwv_@pluto>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-8-cristian.marussi@arm.com>
 <aaJVf6q9r4F1RKzu@shlinux89>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaJVf6q9r4F1RKzu@shlinux89>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_023805_246525_B72D77F9 
X-CRM114-Status: GOOD (  17.36  )
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

On Sat, Feb 28, 2026 at 10:39:59AM +0800, Peng Fan wrote:
> On Fri, Feb 27, 2026 at 03:32:21PM +0000, Cristian Marussi wrote:
> >Fix clock parents enumeration to account only for effectively discovered
> >parents during enumeration, avoiding to trust the total number of parents
> >declared upfront by the platform.
> >
> >Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> >---
> > drivers/firmware/arm_scmi/clock.c | 18 ++++++++++--------
> > 1 file changed, 10 insertions(+), 8 deletions(-)
> >
> >diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
> >index d0fb5affb5cf..15faa79abed4 100644
> >--- a/drivers/firmware/arm_scmi/clock.c
> >+++ b/drivers/firmware/arm_scmi/clock.c
> >@@ -270,15 +270,15 @@ static int iter_clk_possible_parents_update_state(struct scmi_iterator_state *st
> > 	 * assume it's returned+remaining on first call.
> > 	 */
> > 	if (!st->max_resources) {
> >-		p->clkd->info.num_parents = st->num_returned + st->num_remaining;
> >-		p->clkd->info.parents = devm_kcalloc(p->dev,
> >-						     p->clkd->info.num_parents,
> >+		int num_parents = st->num_returned + st->num_remaining;
> >+
> >+		p->clkd->info.parents = devm_kcalloc(p->dev, num_parents,
> > 						     sizeof(*p->clkd->info.parents),
> > 						     GFP_KERNEL);
> >-		if (!p->clkd->info.parents) {
> >-			p->clkd->info.num_parents = 0;
> >+		if (!p->clkd->info.parents)
> > 			return -ENOMEM;
> >-		}
> >+
> >+		/* max_resources is used by the iterators to control bounds */
> > 		st->max_resources = st->num_returned + st->num_remaining;
> > 	}
> > 
> >@@ -293,9 +293,11 @@ static int iter_clk_possible_parents_process_response(const struct scmi_protocol
> > 	const struct scmi_msg_resp_clock_possible_parents *r = response;
> > 	struct scmi_clk_ipriv *p = priv;
> > 
> >-	u32 *parent = &p->clkd->info.parents[st->desc_index + st->loop_idx];
> >+	p->clkd->info.parents[st->desc_index + st->loop_idx] =
> >+		le32_to_cpu(r->possible_parents[st->loop_idx]);
> > 
> >-	*parent = le32_to_cpu(r->possible_parents[st->loop_idx]);
> >+	/* Count only effectively discovered parents */
> >+	p->clkd->info.num_parents++;
> 
> It maybe good to give a warning, if mismatch between 
> number of effectively discovered parents and "st->num_returned + st->num_remaining"
> 

Indeed there could be sign of something off fw-side...

> Anyway this patch LGTM:
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
>

Thanks,
Cristian

