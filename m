Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B756F106B50C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 12:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A8cyyJB9ebKqvPnKCP5Rw/2byvyIwxg2rgTmgI+FIBA=; b=WX2sQo9itlIR8cxhlWaJXyoOPO
	pZfmkxRRsANlIsWAW4/S8exTTFZpvWVVMksTCAB40N04kX7GRb490BAek0/PeptACsYIuGjucaUjI
	0dcHpsszb0xnc0DQUtfNxVyKJX2kVEkbsT4PKlWKBGnm64cs9xbNHoa8hjLB49lv9GbMYMuLaS6Gk
	oHK9ciqIwdB6H4qW2xip5QxywepXJZElRy3ySF54zEoaloaWQLXNOcTLj9IqpIJ2bnZpF7+b/Lonx
	NijPVLMJwjzxLABr2c/x7mwuik5DY0t84gDnL6tCaeLRRZEa+Rdr1ih2oINUpSndcu1nkuiSpweOP
	8OFqj1dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5N8K-00000003MA0-0NaJ;
	Wed, 25 Mar 2026 12:14:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5N8H-00000003M9k-3VKH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 12:14:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 00B1760132;
	Wed, 25 Mar 2026 12:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F32FC2BCB0;
	Wed, 25 Mar 2026 12:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774440884;
	bh=ddmo43ydD3DzDMQ4kgM7JV/r98vLaJXcKhiK8DEbdhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ux8Cj21pNOzMC7o/XaAZAEfVbpqDqYGxtvUt+BSUapBGnOVUi4FLduFkxxoJ7pFzJ
	 hj7B1UE87Oasj3Cb9dAbamKn46FKcFuD/Bj0qRCG3PbRnZgCPZpYP6dzf4+wgj4psB
	 ovpwrqouF9crN9y+ut5APZUl0zwt+mT8Dh83Dmtz+m87tBLnkglCVZYENJ7Xjbgiuv
	 gGoivSbtropAF/n4IhThf2WnZHQAC7nlZfjYS9gi7u70hr5cci26WTcCORZzIkL60c
	 dLormc1nmp22Ss6kUox5m2Y82twYnvMfxSClOyztKOwn0mFAPGs/xHCh1Bv3pv7KOB
	 ZE8m5gVv8ByWw==
Date: Wed, 25 Mar 2026 12:14:40 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] firmware: arm_scmi: clock: Relax check in
 scmi_clock_protocol_init
Message-ID: <20260325-dainty-hilarious-rhino-affa78@sudeepholla>
References: <20260324-scmi-clock-fix-v1-v1-1-65c21935824b@nxp.com>
 <20260324-lean-bobcat-of-reputation-6628b5@sudeepholla>
 <acJI7o79lVNMjV_d@pluto>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acJI7o79lVNMjV_d@pluto>
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

On Tue, Mar 24, 2026 at 08:18:54AM +0000, Cristian Marussi wrote:
> On Tue, Mar 24, 2026 at 07:49:22AM +0000, Sudeep Holla wrote:
> > On Tue, Mar 24, 2026 at 02:24:14PM +0800, Peng Fan (OSS) wrote:
> > > From: Peng Fan <peng.fan@nxp.com>
> > > 
> 
> Hi,
> 
> > > On i.MX95, the SCMI Clock protocol defines several reserved clock IDs that
> > > are not backed by real clock devices
> > > (see arch/arm64/boot/dts/freescale/imx95-clock.h).
> > > 
> > > For these reserved IDs, the SCMI firmware correctly returns NOT_FOUND in
> > > response to the CLOCK_ATTRIBUTES command. According to the SCMI Clock
> > > specification, NOT_FOUND is expected when a clock_id does not correspond to
> > > a valid clock device.
> > > 
> > > The recent hardening added in scmi_clock_protocol_init() treats any error
> > > return as fatal, causing SCMI clock probe to fail and preventing i.MX9
> > > platforms from booting.
> > > 
> > > Relax the check so that -ENOENT is treated as a non-fatal condition.
> > > 
> > 
> > I understand the use-case and the fix here, but still wonder if this
> > should be treated as quirk or handle it in the core. I am inclined to
> > latter as reserved SCMI clock/resource ID seems to be trend in its usage
> > and hard to classify as quirks.
> > 
> > Cristain, agree or have a different view ?
> > 
> 
> I was just replying...
> 
> Looking at the spec 3.6.2.5 CLOCK_ATTRIBUTES
> 
> "This command returns the attributes that are associated with a specific
> clock. An agent might be allowed access to only a subset of the clocks
> available in the system. The platform must thus guarantee that clocks that
> an agent cannot access are not visible to it."
> 
> ...not sure if this sheds some light or it is ambiguos anyway...I'd say that
> NOT_FOUND does NOT equate to be invisible...
> 
> ...BUT at the same time I think that this practice of exposing a non-contiguos
> set of resources IDs (a set with holes in it) is the a well-known spec-loophole
> used by many vendors to deploy one single FW image across all of their platforms
> without having to reconfigure their reosurces IDs ro expose a common set of
> contiguos IDs like the spec would suggest...
> 
> Having said that, since we unfortunately left this door open in the
> implementation, now this loophole has become common practice
> apparently...
> 

Indeed, I agree. I wasn't fully convinced to relax and this discussion
seem to strive towards right direction IMO.

> ...I am more concerned about the impact that this COULD have on underlying
> resources allocations that at the driver level was certainly conceived
> to manage a contiguos set of IDs, even though it was certanly the
> usecase until my harden patches...so it could be safe but to be double
> checked...
> 
> Quirk or core I suppose it depends on how much we want to 'legalize' this
> trick for the future (thinking also about other protocols)...
> 

Agreed. I am more nervous about legalising it. Let us see what are the
issues with the firmware in the wild before we can decide. That's one reason
I would like keep your changes in -next even though I have now dropped the
idea of pushing in for v7.1

> ...a middle ground could be to implement it as an always-on quirk that
> matches any FW (like the existing out_of_spec_triplet quirk)... as a way
> to keep on allowing the existing behaviour but sort of discouraging it...
> 

Fair enough, worth an attempt at the least.

> Not really strong opinions about this, BUT at this point, in general I
> would keep all of this series on hold for further testing, given these
> issues together the bugs fixed by Geert on iterators and the lack of
> clock-MAINTs acks...
> 

Agreed.

> ...also Geert was investigating the need of a different quirks in these
> regards for the Renesas boards...
> 

Yes still waiting for the outcome from the cliffhanger Geert left us 😉.
Just kidding take your time Geert, no rush.

-- 
Regards,
Sudeep

