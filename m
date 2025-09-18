Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C6BCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 18:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t4/cCa5+Es3PK/YLYFtiDyhJrzARI0WStMwJlXvT8cw=; b=y8DHB4o57DJu2AisG0u/IVq6R0
	onUO9NHpQjs8e8vhApDhmhYw4LKWlNSmRXZ3kDIsWT3ILD5gQZUI3Cu7HUx2HM9Cojvo44ih6CQJC
	M1FIgGktXBZYn24OMJJ9uaVEIeHSVP2q1ZMQlVF03k7n7H7d8uO0pdDYlfE6Do8EoOyvgbaqaXhob
	6E1D/jgtPiBtZlWM3eF6NTdTB/VEY+rT5QY1AkENgS8FjCD2UzIAwrJOnuGVLR0Ri2f+R5SHY0+/O
	GdyzdZAJfz1vU1/s1tKIeJAMZO00Ei4Meec/OMQ1EhDjdz/IU7AFmCDiWbPbs3dqLSGm469UZ1bTT
	kBvHRn2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzIyt-00000000pi0-0JtT;
	Thu, 18 Sep 2025 18:03:43 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzIyq-00000000phd-3efM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 18:03:42 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58II3JWD065125;
	Thu, 18 Sep 2025 13:03:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758218599;
	bh=t4/cCa5+Es3PK/YLYFtiDyhJrzARI0WStMwJlXvT8cw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=r6kG6ZGg/ftlCggJnQ2jFUaA93cbiozpp4y5+kEMJ4pzrj78W3ZiPUtuS+pD61doL
	 0gGfb8CNDDqIxpCpmvTZBobGnNwrl4zExEOebcL5sAhzVcp6VvfAIwMo7anYcYDA4a
	 f9RzW5MQ/5+obpjSjsJ2R3n5YP0A2z85goCW0ww4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58II3Ilj1732106
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 18 Sep 2025 13:03:18 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 18
 Sep 2025 13:03:18 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Sep 2025 13:03:18 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58II3HEI1277187;
	Thu, 18 Sep 2025 13:03:17 -0500
Date: Thu, 18 Sep 2025 23:33:16 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Michael Walle <mwalle@kernel.org>
CC: Kevin Hilman <khilman@kernel.org>, Frank Binns <frank.binns@imgtec.com>,
        Matt Coster <matt.coster@imgtec.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth
 Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo
	<kristo@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Michael
 Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Andrew
 Davis <afd@ti.com>,
        <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 2/3] clk: keystone: don't cache clock rate
Message-ID: <20250918180316.nze5ak3m5pde44uz@lcpd911>
References: <20250915143440.2362812-1-mwalle@kernel.org>
 <20250915143440.2362812-3-mwalle@kernel.org>
 <7hv7lhp0e8.fsf@baylibre.com>
 <DCVTYCVUCXWH.LAMARC8K4UNU@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DCVTYCVUCXWH.LAMARC8K4UNU@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_110341_000352_B69849BE 
X-CRM114-Status: GOOD (  46.13  )
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

Hi Michael,

On Sep 18, 2025 at 11:48:34 +0200, Michael Walle wrote:
> On Wed Sep 17, 2025 at 5:24 PM CEST, Kevin Hilman wrote:
> > Michael Walle <mwalle@kernel.org> writes:
> >
> > > The TISCI firmware will return 0 if the clock or consumer is not
> > > enabled although there is a stored value in the firmware. IOW a call to
> > > set rate will work but at get rate will always return 0 if the clock is
> > > disabled.
> > > The clk framework will try to cache the clock rate when it's requested
> > > by a consumer. If the clock or consumer is not enabled at that point,
> > > the cached value is 0, which is wrong.
> >
> > Hmm, it also seems wrong to me that the clock framework would cache a
> > clock rate when it's disabled.  On platforms with clocks that may have
> > shared management (eg. TISCI or other platforms using SCMI) it's
> > entirely possible that when Linux has disabled a clock, some other
> > entity may have changed it.
> >
> > Could another solution here be to have the clk framework only cache when
> > clocks are enabled?
> 
> It's not just the clock which has to be enabled, but also it's
> consumer. I.e. for this case, the GPU has to be enabled, until that
> is the case the get_rate always returns 0. The clk framework already
> has support for the runtime power management of the clock itself,
> see for example clk_recalc().

Why did we move away from the earlier approach [1] again?
[1] https://lore.kernel.org/all/20250716134717.4085567-3-mwalle@kernel.org/


> 
> > > Thus, disable the cache altogether.
> > >
> > > Signed-off-by: Michael Walle <mwalle@kernel.org>
> > > ---
> > > I guess to make it work correctly with the caching of the linux
> > > subsystem a new flag to query the real clock rate is needed. That
> > > way, one could also query the default value without having to turn
> > > the clock and consumer on first. That can be retrofitted later and
> > > the driver could query the firmware capabilities.
> > >
> > > Regarding a Fixes: tag. I didn't include one because it might have a
> > > slight performance impact because the firmware has to be queried
> > > every time now and it doesn't have been a problem for now. OTOH I've
> > > enabled tracing during boot and there were just a handful
> > > clock_{get/set}_rate() calls.
> >
> > The performance hit is not just about boot time, it's for *every*
> > [get|set]_rate call.  Since TISCI is relatively slow (involves RPC,
> > mailbox, etc. to remote core), this may have a performance impact
> > elsewhere too.
> 
> Yes of course. I have just looked what happened during boot and
> (short) after the boot. I haven't had any real application running,
> though, so that's not representative.

I am not sure what cpufreq governor you had running, but depending on the governor,
filesystem, etc. cpufreq can end up potentially doing a lot more of
the clk_get|set_rates which could have some series performance degradation
is what I'm worried about. Earlier maybe the clk_get_rate part was
returning the cached CPU freqs, but now it will each time go query the
firmware for it (unnecessarily)

I currently don't have any solid data to say how much of an impact
for sure but I can run some tests locally and find out...

> 
> > That being said, I'm hoping it's unlikely that
> > [get|set]_rate calls are in the fast path.
> >
> > All of that being said, I think the impacts of this patch are pretty
> > minimal, so I don't have any real objections.
> >
> > Reviewed-by: Kevin Hilman <khilman@baylibre.com>
> 
> Thanks!
> 
> -michael



-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

