Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382C5FEE4EA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 10:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=899D3xU+VmRrNKV7Q5+J3Me5Q/GZn5rTx06sv43M3rI=; b=RH/dV+ZAQSru+SQxLGZlOxhZQL
	TBwc8bGv4uLkcT5Rot0A+paVeecguc5zOH8szhywyVKRmOCdA2COyAavlOzYZg+hnF/lTMgZzBNnQ
	QsbIbGBVMNC3+VI+FI63gHsQrEZCn70t/jQU7SimKL0JqsiGwO/jOmXZshobJTdwBvhPhP/nL9Q2/
	zxTCssguDqsd0ECvzeu9XES70CB8HHRPINhFqDPiRkReFsCuh7+J34h0+ysc2ZBJwVCF40p0kwtb7
	SpNWEmIX3sHdVZtukQ/9V010nTBOe1rbShrE9zRs1wVubO6gG0mmMm1uWMXtJLsuxcMCBY1AHkTJF
	zr9RxKcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwHnc-00000009kXe-0C8O;
	Sat, 28 Feb 2026 10:43:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwHnZ-00000009kXG-0GOi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 10:43:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D3C21516;
	Sat, 28 Feb 2026 02:43:42 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 027DD3F7BD;
	Sat, 28 Feb 2026 02:43:43 -0800 (PST)
Date: Sat, 28 Feb 2026 10:43:40 +0000
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
Subject: Re: [PATCH 10/11] firmware: arm_scmi: Use bound iterators to
 minimize discovered rates
Message-ID: <aaLG3H432RQKENzY@pluto>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-11-cristian.marussi@arm.com>
 <20260227165339.000023f7@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227165339.000023f7@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_024350_234551_028D8627 
X-CRM114-Status: GOOD (  15.11  )
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

On Fri, Feb 27, 2026 at 04:53:39PM +0000, Jonathan Cameron wrote:
> On Fri, 27 Feb 2026 15:32:24 +0000
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Clock rates are guaranteed to be returned in ascending order for SCMI clock
> > protocol versions greater than 1.0: in such a case, use bounded iterators
> > to minimize the number of message exchanges needed to discover min and max
> > rate.
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> 
> > +
> > +static int
> > +scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph,
> > +			      u32 clk_id, struct clock_info *cinfo)
> > +{
> > +	struct scmi_clock_desc *clkd = &cinfo->clkds[clk_id];
> > +	int ret;
> > +
> > +	/*
> > +	 * Since only after SCMI Clock v1.0 the returned rates are guaranteed to
> > +	 * be discovered in ascending order, lazy enumeration cannot be use for
> > +	 * SCMI Clock v1.0 protocol.
> > +	 */
> > +	if (PROTOCOL_REV_MAJOR(ph->version) > 0x1)
> > +		ret = scmi_clock_describe_rates_get_lazy(ph, clkd);
> > +	else
> > +		ret = scmi_clock_describe_rates_get_full(ph, clkd);
> > +
> > +	if (ret)
> > +		return ret;
> > +
> > +	clkd->info.min_rate = clkd->rates[RATE_MIN];
> >  	if (!clkd->rate_discrete) {
> >  		clkd->info.max_rate = clkd->rates[RATE_MAX];
> >  		dev_dbg(ph->dev, "Min %llu Max %llu Step %llu Hz\n",
> >  			clkd->rates[RATE_MIN], clkd->rates[RATE_MAX],
> >  			clkd->rates[RATE_STEP]);
> >  	} else {
> > -		sort(clkd->rates, clkd->num_rates,
> > -		     sizeof(clkd->rates[0]), rate_cmp_func, NULL);
> >  		clkd->info.max_rate = clkd->rates[clkd->num_rates - 1];
> > +		dev_dbg(ph->dev, "Clock:%s DISCRETE:%d -> Min %llu Max %llu\n",
> > +			clkd->info.name, clkd->rate_discrete,
> > +			clkd->info.min_rate, clkd->info.max_rate);
> >  	}
> > -	clkd->info.min_rate = clkd->rates[RATE_MIN];
> >  
> > -	return 0;
> > +	return ret;
> Why?  Far as I can see it's still always zero if you get here.

...well...simply bad refactoring late evening near beer o'clock time :P

I will fix.

Thanks,
Cristian

