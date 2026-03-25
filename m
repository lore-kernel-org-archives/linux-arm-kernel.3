Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E65106B50C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 12:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7EfS6qiUrvBDX3EGBXMaXOnvXO/6NZCqJUlVv2LTr4I=; b=AodJgRMCYyyNcteMMYgm1/0+KD
	ehbeCibVQlI8jP5paA7voVr/CChH9NP30FwRMmHk6KZ1LfysvNJMPBEW39qnC/K1Q+S9sX/C9xo9D
	nQ1cM6KiuW61vZF1qRzuS7H0G4GTs2gu9ioMznDV89aaURCi+ecVn0rdf/HjjxUajHkKZbiBf/cDU
	fDvKsDl3rkk/kurtFT7Fu0y2WixKQ/Zl/jpOpmmKlMH27TTOE/BC7FX4iQNwUjg16+A7qgRy81kLI
	MBqJelf549bFdCUEeQQCambgkEtyjqWBxcoLmg0/KtH250kew4EH0uqdMqV8fBrNVWthKQMzH9AHg
	5znPr0fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5N0A-00000003Le9-29V2;
	Wed, 25 Mar 2026 12:06:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5N08-00000003Ldl-2uo9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 12:06:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A338240200;
	Wed, 25 Mar 2026 12:06:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D738C2BC9E;
	Wed, 25 Mar 2026 12:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774440379;
	bh=GLFCeOJiFLT5z6XuUp/haZuUWke7Kk3EIhUX4sc5SiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oytF71REZveCJZgrtlhlQ1Ax5N+yZFQ+GRvmFgX6TXhAOLGJ7tDExr3J2fYmrdi71
	 NVLYE5IJVD0iCLLMdjo2PqUP5YQ/yvzmRToC+rMf3WtIlG4Zlm66GJ98pLwo67jdL4
	 Wbr4INcFhFVuspC93PS6sm6c4DYooDqzN6iL/6xWB49qMKaCBTi6ycieHwbyELrtd0
	 Xt45aw3m+AUT5eYAZX5F9brGeFeksamm8hXUqmDYP00nzeLwr38lITgi7KhoE0LD2a
	 SQsWelR2dLB2iFl+ydUTXkuUmhY85PEC9QQcMmCTBiyea0VIHfvlCo6H3L/+atalIN
	 WhkF7+MD3z1hg==
Date: Wed, 25 Mar 2026 12:06:15 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Jacky Bai <ping.bai@nxp.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] firmware: arm_scmi: clock: Relax check in
 scmi_clock_protocol_init
Message-ID: <20260325-spiffy-analytic-sloth-eabfea@sudeepholla>
References: <20260324-scmi-clock-fix-v1-v1-1-65c21935824b@nxp.com>
 <20260324-lean-bobcat-of-reputation-6628b5@sudeepholla>
 <acJI7o79lVNMjV_d@pluto>
 <CAMuHMdVcE439Cyn-TCoioLZXP-YpqObZ0UF8F2NvMCZ41eO6QQ@mail.gmail.com>
 <acKhJ8Z9WDvHEnYL@pluto>
 <CAMuHMdW==oMpCS==L8ADexPC=4uczNwK5UD6DequBjGOKQfOZw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW==oMpCS==L8ADexPC=4uczNwK5UD6DequBjGOKQfOZw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_050620_772968_2EE3ECEF 
X-CRM114-Status: GOOD (  37.20  )
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

On Tue, Mar 24, 2026 at 04:32:55PM +0100, Geert Uytterhoeven wrote:
> Hi Cristian,
> 
> On Tue, 24 Mar 2026 at 15:35, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > On Tue, Mar 24, 2026 at 02:15:36PM +0100, Geert Uytterhoeven wrote:
> > > On Tue, 24 Mar 2026 at 09:41, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > > Looking at the spec 3.6.2.5 CLOCK_ATTRIBUTES
> > > >
> > > > "This command returns the attributes that are associated with a specific clock. An agent might be allowed access to only
> > > > a subset of the clocks available in the system. The platform must thus guarantee that clocks that an agent cannot access
> > > > are not visible to it."
> > > >
> > > > ...not sure if this sheds some light or it is ambiguos anyway...I'd say that
> > > > NOT_FOUND does NOT equate to be invisible...
> > > >
> > > > ...BUT at the same time I think that this practice of exposing a non-contiguos
> > > > set of resources IDs (a set with holes in it) is the a well-known spec-loophole
> > > > used by many vendors to deploy one single FW image across all of their platforms
> > > > without having to reconfigure their reosurces IDs ro expose a common set of
> > > > contiguos IDs like the spec would suggest...
> > > >
> > > > Having said that, since we unfortunately left this door open in the
> > > > implementation, now this loophole has become common practice
> > > > apparently...
> > >
> > > When I first read that paragraph, I was also confused.
> > > What does "not visible" mean?
> > >   - Not present in the clock ID space exposed to that client of
> > >     the system?
> > >     Yeah, multiple different sequences of contiguous IDs, depending
> > >     on client!
> >
> > Yes that is the most spec-compliant interpretation usually; in general
> > across all protocols the SCMI server, through customized enumeration
> > results, should provide a per-agent view of the system: this should help
> > handling shared or virtualized resources, since the agent always see
> > only the 'illusion' provided by the server...
> >
> > ...under this assumption if you dont even need a resource at all (not
> > RW nor RO) you should NOT even be able to see it...this in turn of
> > course means that in order to expose a contiguous set of IDs you should
> > be able to properly configure at build time the FW resources on a per
> > platform basis...
> >
> > >   - Return failure on CLOCK_ATTRIBUTES?
> > >     Which is what implementations seem to do.
> >
> > Yes this is what is done leveraging the gap in the implementation...I am
> > not sure that the non-contiguous set of IDs is supported if not by
> > chance as of now :P (especially in other protocols)
> >
> > > The next step in the fun is when the system actually needs to know the
> > > clock rate of such a clock...
> >
> > Well...that seems a bit of wishful thinking ...
> 
> Unfortunately it is real... [cliffhanger, to be continued... :-]
> 

I am late to the discussion. Based on all the discussion so far, I don't
want to rush the clk changes from Cristian that adds the hardening yet.
I won't make it part of my SCMI v7.1 PR. However is it good idea to keep
it in the next so that we can converge towards some solution in v7.2 ?

So, the question is if I add the fixes from Geert[1] to my queue, will it
be a good baseline for all these changes and discussions ?

-- 
Regards,
Sudeep

