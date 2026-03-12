Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F5C1067046
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 15:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4SMksqHLqFjTXIoxEOoZdhBuVtzGcQIEH0rhbXWlRBY=; b=fdF61pDA+LrF+lIsctrfx53eCl
	zQV3aSyNs9MnPSbfrZG2F2RIzpuTBTiAJJsbtev2pvTnRyxqr9G3U0GBoZM4l9IPyxr0MNwRduS4j
	seM+zIxhuSnZOtLhZ+ytar5NCldwiLhq37hRnV7L/nEgr5+1UDhH/LEgAa1kLPDMia0q3ny+eNbO1
	akkppWYYuwwPujwwqffo9IjElcLaviOYOmDLdPGDQ7WVPR1ig1iRMDUZvWNItB3dzaygapxu2QJ8p
	jZBHyqrySJa7sc7HJXhVtlaaLDtMRBe6PCXn/E8I6E2lYcJbLzZVoNlhIxXrUyWzuzAw6jvgG1t4B
	gGjUuysQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0i2x-0000000EOgT-0fj6;
	Thu, 12 Mar 2026 15:33:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0i2w-0000000EOgF-1jE5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 15:33:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 981E06012A;
	Thu, 12 Mar 2026 15:33:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D7BEC4CEF7;
	Thu, 12 Mar 2026 15:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773329637;
	bh=dVSsINl4rZ0yvdCaAErEMIpSKseEOm3DREgLhMbctcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pvh5st06BDwVPuJAvJHJsIQZKSBm+Nsh20mpKGTLvGfZZupguVKKeH8dTz6VWYmW0
	 EXy4wln6jk3fMpcyOapCpcwS8ZQUoiCGJRMl1l5EiF2jJSwjSUJV7/bugtLKQU6k+1
	 vQJkYwja4nnLihddXMveBquC5GcNUfyIXNhWA0EAG00GwarXBsamgN/IjCA97X5BTx
	 Buc9glyyRIPVkgZMZ4zlJLupwsT0M5V6fxouCJrknGB1Lx6NolIoMoRJTNer+9mPc5
	 Rf05NjoiFIUh2b4f8DhOxD6ZwO0H3U1gcJCne3aoVie/YK0SttvuuJmjvNWjSyipuu
	 CwJHLatrT+0Bg==
Date: Thu, 12 Mar 2026 15:33:52 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, philip.radford@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Subject: Re: [PATCH v2 08/13] firmware: arm_scmi: Harden clock protocol
 initialization
Message-ID: <20260312-classy-misty-platypus-5baea1@sudeepholla>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-9-cristian.marussi@arm.com>
 <CAMuHMdUdqrA9kYeDpjwj-y6-4aALkAi2g2Od81Kxh-EVW2e2Nw@mail.gmail.com>
 <abG4VfyB2C-gBa5Q@pluto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abG4VfyB2C-gBa5Q@pluto>
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

On Wed, Mar 11, 2026 at 06:45:41PM +0000, Cristian Marussi wrote:
> On Wed, Mar 11, 2026 at 05:59:43PM +0100, Geert Uytterhoeven wrote:
> > Hi Cristian,
> > 
> > On Tue, 10 Mar 2026 at 19:56, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > Add proper error handling on failure to enumerate clocks features or
> > > rates.
> > >
> > > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> 
> Hi,
> 
> > 
> > Thanks for your patch!
> > 
> > > --- a/drivers/firmware/arm_scmi/clock.c
> > > +++ b/drivers/firmware/arm_scmi/clock.c
> > 
> > > @@ -1143,8 +1149,12 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
> > >         for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
> > >                 cinfo->clkds[clkid].id = clkid;
> > >                 ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> > > -               if (!ret)
> > > -                       scmi_clock_describe_rates_get(ph, clkid, cinfo);
> > > +               if (ret)
> > > +                       return ret;
> > 
> > This change breaks R-Car X5H with SCP FW SDKv4.28.0, as some clocks
> > do not support the SCMI CLOCK_ATTRIBUTES command.
> > Before, these clocks were still instantiated, but were further unusable.
> > After, the whole clock driver fails to initialize, and no SCMI clocks
> > are available at all.
> 
> ...and this is exactly what I feared while doing this sort of hardening :P
> 
> So there are a few possible solutions (beside reverting this straight away)
> 
> The easy fix would be instead change the above in a
> 
> 	if (ret)
> 		continue;
> 
> ...with a bit of annoying accompanying FW_BUG logs, of course, to cause future
> FW releases to fix this :D
> 
> Another option could be leave it as it is, since indeed it is the correct enforced
> behaviour, being CLOCK_ATTRIBUTES a mandatory command, BUT add on top an ad-hoc SCMI
> quirk targeting the affected FW releases...
> 
> This latter option, though, while enforcing the correct behaviour AND
> fixing your R-Car issue, leaves open the door for a number of possible
> failures of other unknowingly buggy Vendors similarly deployed firmwares...
> 
> ...that could be solved with more quirks of course...but...worth it ?
> 
> Thoughts ?
> 
> Let's see also what @Sudeep thinks about this...
> 

I prefer to fix it as a quirk to prevent similar issues on newer platforms if
the firmware baselines are derived from it. In the worst case, we can relax
the hardening until we figure out a proper quirk-based solution.

-- 
Regards,
Sudeep

