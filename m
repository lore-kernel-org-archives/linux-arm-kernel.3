Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C33F532EE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 08:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3/caI1b4Tafgg+1IjbwCi9k8vpuMrUf0bTXLCBCjvtQ=; b=yPhd0EOO1KraEYN5+BGhguBmS0
	f9NxlE6wxdDKMTuQOaDKXDsTG2YaCYjSUI8u+HTlpTO0JXIRqFTfixzJMIH7EhUqimlKxGFieeWXI
	hkkX6BQU0y2ru8wYLM7E1V18dT4ouwBPr3s5dToleJTKpLTkPDZVQsgyyYm1Nl9jbaGSRt4KzpAOg
	7WC/kZ7m8+eI7mgxQSIc+cYDhFKSdvnT/4OiqwUn65vHa4kbAZj0Atwb5aWGkcFF2VZ0E+i/LPp09
	v7HLNgwuCM1/GbIUy+zHAuiGPVw2NdsAyfjY0A56f+BWxLcg3iXAthyd5BWfKlr/INTtcMk8SqxuB
	W/vB3Y4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wyk-00000000z4O-3Xa2;
	Tue, 24 Mar 2026 08:19:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wyh-00000000z3j-3cBs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 08:19:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C40281476;
	Tue, 24 Mar 2026 01:18:58 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 83CE03F63F;
	Tue, 24 Mar 2026 01:19:01 -0700 (PDT)
Date: Tue, 24 Mar 2026 08:18:54 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Jacky Bai <ping.bai@nxp.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] firmware: arm_scmi: clock: Relax check in
 scmi_clock_protocol_init
Message-ID: <acJI7o79lVNMjV_d@pluto>
References: <20260324-scmi-clock-fix-v1-v1-1-65c21935824b@nxp.com>
 <20260324-lean-bobcat-of-reputation-6628b5@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324-lean-bobcat-of-reputation-6628b5@sudeepholla>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_011908_027522_05324CE5 
X-CRM114-Status: GOOD (  27.79  )
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

On Tue, Mar 24, 2026 at 07:49:22AM +0000, Sudeep Holla wrote:
> On Tue, Mar 24, 2026 at 02:24:14PM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> > 

Hi,

> > On i.MX95, the SCMI Clock protocol defines several reserved clock IDs that
> > are not backed by real clock devices
> > (see arch/arm64/boot/dts/freescale/imx95-clock.h).
> > 
> > For these reserved IDs, the SCMI firmware correctly returns NOT_FOUND in
> > response to the CLOCK_ATTRIBUTES command. According to the SCMI Clock
> > specification, NOT_FOUND is expected when a clock_id does not correspond to
> > a valid clock device.
> > 
> > The recent hardening added in scmi_clock_protocol_init() treats any error
> > return as fatal, causing SCMI clock probe to fail and preventing i.MX9
> > platforms from booting.
> > 
> > Relax the check so that -ENOENT is treated as a non-fatal condition.
> > 
> 
> I understand the use-case and the fix here, but still wonder if this
> should be treated as quirk or handle it in the core. I am inclined to
> latter as reserved SCMI clock/resource ID seems to be trend in its usage
> and hard to classify as quirks.
> 
> Cristain, agree or have a different view ?
> 

I was just replying...

Looking at the spec 3.6.2.5 CLOCK_ATTRIBUTES

"This command returns the attributes that are associated with a specific clock. An agent might be allowed access to only
a subset of the clocks available in the system. The platform must thus guarantee that clocks that an agent cannot access
are not visible to it."

...not sure if this sheds some light or it is ambiguos anyway...I'd say that
NOT_FOUND does NOT equate to be invisible...

...BUT at the same time I think that this practice of exposing a non-contiguos
set of resources IDs (a set with holes in it) is the a well-known spec-loophole
used by many vendors to deploy one single FW image across all of their platforms
without having to reconfigure their reosurces IDs ro expose a common set of
contiguos IDs like the spec would suggest...

Having said that, since we unfortunately left this door open in the
implementation, now this loophole has become common practice
apparently...

...I am more concerned about the impact that this COULD have on underlying
resources allocations that at the driver level was certainly conceived
to manage a contiguos set of IDs, even though it was certanly the
usecase until my harden patches...so it could be safe but to be double
checked...

Quirk or core I suppose it depends on how much we want to 'legalize' this
trick for the future (thinking also about other protocols)...

...a middle ground could be to implement it as an always-on quirk that
matches any FW (like the existing out_of_spec_triplet quirk)... as a way
to keep on allowing the existing behaviour but sort of discouraging it...

Not really strong opinions about this, BUT at this point, in general I
would keep all of this series on hold for further testing, given these
issues together the bugs fixed by Geert on iterators and the lack of
clock-MAINTs acks...

...also Geert was investigating the need of a different quirks in these
regards for the Renesas boards...

Thanks,
Cristian

