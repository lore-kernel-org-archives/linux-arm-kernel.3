Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0545FEE4EA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 10:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eK8fe1IwLW0HJSq16ooWgVgnXupWAQ2d4GSX1CCBGx0=; b=vxej/GsG0GuYzzZzk4YIcTtmRF
	cdTGvuCw0pHAFeADXiM9UyDdtIq0WfWH2HOP1sEyELKZbtzHC5bsikopbgKmX+wIZ+XJlf8I12rYV
	zfT+SQ/lydFDp+2jwrHoUChAwhETVb4rmNg+3EYALkC6nV0lhpY0GQlga846TSQa2LWG8G6gSxexq
	nzQSWjVI2Thd/NdYJ0i9BxJoa5v3O6pKMYiJqF2dbU4NHV+tClsJpjvF/m7sR/YVLSZ6CidjndHdm
	q9Qsu25y+CF1DvgghC9SACk9/XljrI2GCQUkdF8za1kHu00UuioMNmqm5OBPrm5hjs+rgqtk9LSeg
	091cmMsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwHeq-00000009jz5-2Z5F;
	Sat, 28 Feb 2026 10:34:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwHeo-00000009jyL-04Cz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 10:34:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B2221516;
	Sat, 28 Feb 2026 02:34:38 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7D393F7BD;
	Sat, 28 Feb 2026 02:34:40 -0800 (PST)
Date: Sat, 28 Feb 2026 10:34:37 +0000
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
Subject: Re: [PATCH 03/11] firmware: arm_scmi: Simplify clock rates exposed
 interface
Message-ID: <aaLEvewQkqt9MkwL@pluto>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-4-cristian.marussi@arm.com>
 <aaJN4BSVB2RhICWK@shlinux89>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaJN4BSVB2RhICWK@shlinux89>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_023446_184082_C1C6E90E 
X-CRM114-Status: GOOD (  19.24  )
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

On Sat, Feb 28, 2026 at 10:07:28AM +0800, Peng Fan wrote:
> On Fri, Feb 27, 2026 at 03:32:17PM +0000, Cristian Marussi wrote:
> >Move needlessly exposed fields away from scmi_clock_info into the new
> >internal struct scmi_clock_desc while keeping exposed only the two new
> >min_rate and max_rate fields for each clock.
> >
> >No functional change.
> >
> >Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> >---
> > drivers/firmware/arm_scmi/clock.c | 145 +++++++++++++++---------------
> > include/linux/scmi_protocol.h     |   2 +
> > 2 files changed, 74 insertions(+), 73 deletions(-)
> >
> >diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
> >index 54e8b59c3941..f5d1c608f85a 100644
> >--- a/drivers/firmware/arm_scmi/clock.c
> >+++ b/drivers/firmware/arm_scmi/clock.c
> >@@ -157,13 +157,27 @@ struct scmi_clock_rate_notify_payld {
> > 	__le32 rate_high;
> > };
> > 
> >+struct scmi_clock_desc {
> >+	u32 id;
> >+	bool rate_discrete;
> >+	unsigned int num_rates;
> >+	u64 rates[SCMI_MAX_NUM_RATES];
> >+#define	RATE_MIN	0
> >+#define	RATE_MAX	1
> >+#define	RATE_STEP	2
> >+	struct scmi_clock_info info;
> >+};
> >+
> >+#define to_desc(p)	(container_of((p), struct scmi_clock_desc, info))
> 
> Nit:
> no need parentheses
> 

ok...

> >+
> > struct clock_info {
> > 	int num_clocks;
> > 	int max_async_req;
> > 	bool notify_rate_changed_cmd;
> > 	bool notify_rate_change_requested_cmd;
> > 	atomic_t cur_async_req;
> >-	struct scmi_clock_info *clk;
> >+	struct scmi_clock_desc *clkds;
> >+#define CLOCK_INFO(c, i)	(&(((c)->clkds + (i))->info))
> 
> Ditto.

ok

> 
> > 	int (*clock_config_set)(const struct scmi_protocol_handle *ph,
> > 				u32 clk_id, enum clk_state state,
> > 				enum scmi_clock_oem_config oem_type,
> >@@ -185,7 +199,7 @@ scmi_clock_domain_lookup(struct clock_info *ci, u32 clk_id)
> > 	if (clk_id >= ci->num_clocks)
> > 		return ERR_PTR(-EINVAL);
> > 
> >-	return ci->clk + clk_id;
> >+	return CLOCK_INFO(ci, clk_id);
> > }

[snip] 

> > 
> >@@ -536,16 +526,23 @@ scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph, u32 clk_id,
> > 	if (ret)
> > 		return ret;
> > 
> >-	if (!clk->rate_discrete) {
> >+	/* empty set ? */
> >+	if (!clkd->num_rates)
> >+		return 0;
> >+
> >+	if (!clkd->rate_discrete) {
> >+		clkd->info.max_rate = clkd->rates[RATE_MAX];
> 
> Not related to this patch. Just have a question,
> if a broken firmware returns RATE_MIN, but no RATE_MAX and RATE_STEP,
> should some sanity checking being added?
>

I think we already have consistency check around this, while parsing
with the iterators

	https://elixir.bootlin.com/linux/v6.19.3/source/drivers/firmware/arm_scmi/clock.c#L464

...and a related quirk because some platform really reported the right
number of rates BUT failed to express that in the message AND the
introduced additional checks broke some platforms in the wild..

	https://elixir.bootlin.com/linux/v6.19.3/source/drivers/firmware/arm_scmi/clock.c#L433

Do you see still some opportunity for misbehave with the above ?

Thanks,
Cristian

