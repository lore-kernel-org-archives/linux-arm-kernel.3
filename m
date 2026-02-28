Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FB5FEE4E8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 10:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dfc6S702kihhkBvjz/rncdMCTp27UqSHaRCk7QoLbA4=; b=vnY9ILZqCXOlp1pZsOepHiUje7
	16iN5kjwplio2a/T16gPMih24K7VYfyWLtoUJHOcoWWvGZIuCieCtn0+fnJKD0h2KEX8bEK+tEsVn
	w/FdzjCQV+t+z3yeW06yv4LA91PWLkMEf/gAM3j5atv37MQQBGas0tJB5wQ+6wZMN3ZQYIaJh2BV6
	RIYyh+hexiSuZ3SL7yiwKaG1Ae9HmvO2aAS/KxwzOe3z1hQI+njd+d6MynS9RE9x/oUmeqB0Hx7AS
	wnrnRlAs/Jl3OoVZj91bzgeKgH3kvkM12aWk/HLTToTGO3Yz9mFvH5EYxgIgRzA+tTB8zZp6DL9hx
	e/bx3weA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwHEp-00000009ije-4AbW;
	Sat, 28 Feb 2026 10:07:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwHEm-00000009ijH-3KkQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 10:07:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6472E1516;
	Sat, 28 Feb 2026 02:07:44 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8012C3F7BD;
	Sat, 28 Feb 2026 02:07:46 -0800 (PST)
Date: Sat, 28 Feb 2026 10:07:42 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, peng.fan@oss.nxp.com,
	michal.simek@amd.com, dan.carpenter@linaro.org,
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com
Subject: Re: [PATCH 01/11] firmware: arm_scmi: Add clock determine_rate
 operation
Message-ID: <aaK-bnBtKXmAjIJQ@pluto>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-2-cristian.marussi@arm.com>
 <20260227165009.000040d6@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227165009.000040d6@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_020752_956194_595C3ABF 
X-CRM114-Status: GOOD (  34.62  )
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

On Fri, Feb 27, 2026 at 04:50:09PM +0000, Jonathan Cameron wrote:
> On Fri, 27 Feb 2026 15:32:15 +0000
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Add a clock operation to help determining the effective rate, closest to
> > the required one, that a specific clock can support.
> > 
> > Calculation is currently performed kernel side and the logic is taken
> > directly from the SCMI Clock driver: embedding the determinate rate logic
> > in the protocol layer enables semplifications in the SCMI Clock protocol
> 
> simplifications
> 
> > interface and  will more easily accommodate further evolutions where such
> > determine_rate logic into is optionally delegated to the platform SCMI
> > server.
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> Hi Cristian,
> 
> Drive by review follows.  It's Friday afternoon an only a few mins to beer
> o'clock :)

Thanks for having a look :P

> 
> > ---
> > Spoiler alert next SCMI spec will most probably include a new
> > CLOCK_DETERMINE_RATE command to delegate to the platform such calculations,
> > so this clock proto_ops will be needed anyway sooner or later
> > ---
> >  drivers/firmware/arm_scmi/clock.c | 42 +++++++++++++++++++++++++++++++
> >  include/linux/scmi_protocol.h     |  6 +++++
> >  2 files changed, 48 insertions(+)
> > 
> > diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
> > index ab36871650a1..54e8b59c3941 100644
> > --- a/drivers/firmware/arm_scmi/clock.c
> > +++ b/drivers/firmware/arm_scmi/clock.c
> > @@ -8,6 +8,7 @@
> >  #include <linux/module.h>
> >  #include <linux/limits.h>
> >  #include <linux/sort.h>
> > +#include <asm/div64.h>
> >  
> >  #include "protocols.h"
> >  #include "notify.h"
> > @@ -624,6 +625,46 @@ static int scmi_clock_rate_set(const struct scmi_protocol_handle *ph,
> >  	return ret;
> >  }
> >  
> > +static int scmi_clock_determine_rate(const struct scmi_protocol_handle *ph,
> > +				     u32 clk_id, unsigned long *rate)
> > +{
> > +	u64 fmin, fmax, ftmp;
> > +	struct scmi_clock_info *clk;
> > +	struct clock_info *ci = ph->get_priv(ph);
> > +
> > +	if (!rate)
> > +		return -EINVAL;
> > +
> > +	clk = scmi_clock_domain_lookup(ci, clk_id);
> > +	if (IS_ERR(clk))
> > +		return PTR_ERR(clk);
> > +
> > +	/*
> > +	 * If we can't figure out what rate it will be, so just return the
> > +	 * rate back to the caller.
> > +	 */
> > +	if (clk->rate_discrete)
> > +		return 0;
> > +
> > +	fmin = clk->range.min_rate;
> > +	fmax = clk->range.max_rate;
> > +	if (*rate <= fmin) {
> 
> Does the rate ever end up different by doing this than it would if you
> just dropped these short cuts? If not I wonder if this code complexity
> is worthwhile vs
> 
> 	*rate = clamp(*rate, clk->range.min_rate, clk->range.max_rate);
> 
> then carry on with the clamping to a step.
> 
> The only case I can immediately spot where it would be different would
> be if (range.max_rate - range.min_rate) % range.step_size != 0
> which smells like an invalid clock and could result in an out of
> range rounding up anyway.

Yes indeed, but this patch aimed really ONLY at moving this logic from the
CLK SCMI driver into the SCMI Clock protocol layer since it then enables
more simplications...I have NOT really look into the logic...I suppose I
could optimize this in a following distinct patch...

> 
> > +		*rate = fmin;
> > +		return 0;
> > +	} else if (*rate >= fmax) {
> > +		*rate = fmax;
> > +		return 0;
> > +	}
> > +
> > +	ftmp = *rate - fmin;
> > +	ftmp += clk->range.step_size - 1; /* to round up */
> > +	do_div(ftmp, clk->range.step_size);
> > +
> > +	*rate = ftmp * clk->range.step_size + fmin;
> > +
> > +	return 0;
> > +}
> 

Thanks,
Cristian

