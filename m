Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372A81125866
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 18:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XAu+BmUZJ7E3VDzrG0SngQJMH9WKusejc8OjrJ/RKM4=; b=HRk8zWhRLCPlmSHFWVJ+EILbtP
	agFgfFH5ZT0IwG+ShkYawxrAWELu4J+7vrdug7xlsDooNwvKruyzmtSzco14jKVWakGYQe9WRqyWz
	MwcggRSvwN0HP2D74cSkeqV3Yski7aJ/uJqdCZ/TpzmbAV+wA5Gq9VgOqX3BJW4Ddl8wlz/dBhtys
	eKAhAiBKfbV7iJOK9V0xde3oDcZDFlB9NyijP9HHCq+NEUwRBksKF80P1U97aEq6ifmNKnRTLt+lc
	GJG/pUIT2rI5j6o5JB33Mz9Go4BI5O/6o6KBYybMXPFpKEwT7f1FMgb+PmRtOCcP3/3IYPtu70bKw
	qpBXs+7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0OZ7-0000000CE0U-1JcG;
	Wed, 11 Mar 2026 18:45:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0OZ5-0000000CDzi-2gZm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 18:45:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62FF61682;
	Wed, 11 Mar 2026 11:45:42 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA51B3F73B;
	Wed, 11 Mar 2026 11:45:44 -0700 (PDT)
Date: Wed, 11 Mar 2026 18:45:41 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
Subject: Re: [PATCH v2 08/13] firmware: arm_scmi: Harden clock protocol
 initialization
Message-ID: <abG4VfyB2C-gBa5Q@pluto>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-9-cristian.marussi@arm.com>
 <CAMuHMdUdqrA9kYeDpjwj-y6-4aALkAi2g2Od81Kxh-EVW2e2Nw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUdqrA9kYeDpjwj-y6-4aALkAi2g2Od81Kxh-EVW2e2Nw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_114551_720673_A3BBC277 
X-CRM114-Status: GOOD (  19.44  )
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

On Wed, Mar 11, 2026 at 05:59:43PM +0100, Geert Uytterhoeven wrote:
> Hi Cristian,
> 
> On Tue, 10 Mar 2026 at 19:56, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > Add proper error handling on failure to enumerate clocks features or
> > rates.
> >
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Hi,

> 
> Thanks for your patch!
> 
> > --- a/drivers/firmware/arm_scmi/clock.c
> > +++ b/drivers/firmware/arm_scmi/clock.c
> 
> > @@ -1143,8 +1149,12 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
> >         for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
> >                 cinfo->clkds[clkid].id = clkid;
> >                 ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> > -               if (!ret)
> > -                       scmi_clock_describe_rates_get(ph, clkid, cinfo);
> > +               if (ret)
> > +                       return ret;
> 
> This change breaks R-Car X5H with SCP FW SDKv4.28.0, as some clocks
> do not support the SCMI CLOCK_ATTRIBUTES command.
> Before, these clocks were still instantiated, but were further unusable.
> After, the whole clock driver fails to initialize, and no SCMI clocks
> are available at all.

...and this is exactly what I feared while doing this sort of hardening :P

So there are a few possible solutions (beside reverting this straight away)

The easy fix would be instead change the above in a

	if (ret)
		continue;

...with a bit of annoying accompanying FW_BUG logs, of course, to cause future
FW releases to fix this :D

Another option could be leave it as it is, since indeed it is the correct enforced
behaviour, being CLOCK_ATTRIBUTES a mandatory command, BUT add on top an ad-hoc SCMI
quirk targeting the affected FW releases...

This latter option, though, while enforcing the correct behaviour AND
fixing your R-Car issue, leaves open the door for a number of possible
failures of other unknowingly buggy Vendors similarly deployed firmwares...

...that could be solved with more quirks of course...but...worth it ?

Thoughts ?

Let's see also what @Sudeep thinks about this...

Thanks for testing !

Cristian


