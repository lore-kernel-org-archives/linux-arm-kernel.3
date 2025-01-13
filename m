Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1EBAC02183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 19:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/NU9ZyEiDBIAR3Kkfgc1gxjh1OQ/edA9cRtomivcM8E=; b=nlcVA0jSh8xHvijFDVrLaEhoLS
	x6mPviCbX46+v/NFAnOPLo8Ve7lcbh3Lq3zsdtCB8GSdZ3EZ3siFxHOt6dnfO8AHlqKWZrNC0HNvE
	0AhFKHJ1AzvVn9r33DnD9ZRRzqPUMy2TIBD0HjW0fO2aUzG8DL1H2+ipPOjbI+LgXnh6F17+s3bZ7
	Fst8RWdC6eaGGuOZxtRiCO9xujD3mtLzFacvOVASBl3nuV1I5Qux8+1DCsMYeTHGfU1wv7okUePqO
	uEKQbu6zKot8+vJ4Osra7wC9yUucPDJ6fCkRY4iGN6NAmBvOYkMhWv7NfQSY5mpRtIlp5GX0ilN2y
	lpux8TCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQEp-00000006Pay-1RFg;
	Mon, 13 Jan 2025 19:36:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQBv-00000006OoK-1DMT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 19:33:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 657B712FC;
	Mon, 13 Jan 2025 11:34:05 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E2473F66E;
	Mon, 13 Jan 2025 11:33:34 -0800 (PST)
Date: Mon, 13 Jan 2025 19:33:17 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Peng Fan <peng.fan@nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	"cristian.marussi@arm.com" <cristian.marussi@arm.com>,
	"ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
Subject: Re: [PATCH] pmdomain: arm: scmi_pm_domain: Initialize state as off
Message-ID: <Z4VqcQuY0VhXDg6g@pluto>
References: <20250110061346.2440772-1-peng.fan@oss.nxp.com>
 <Z4TreQ5bA9qiMTgC@bogus>
 <PAXPR04MB8459F33BCC84CCA8F49F3B60881F2@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z4UZ2Au7KSFMibDW@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4UZ2Au7KSFMibDW@bogus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_113339_416064_04D2D0A1 
X-CRM114-Status: GOOD (  30.62  )
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

On Mon, Jan 13, 2025 at 01:49:12PM +0000, Sudeep Holla wrote:
> On Mon, Jan 13, 2025 at 11:37:23AM +0000, Peng Fan wrote:
> > > Subject: Re: [PATCH] pmdomain: arm: scmi_pm_domain: Initialize
> > > state as off
> > >
> > > On Fri, Jan 10, 2025 at 02:13:46PM +0800, Peng Fan (OSS) wrote:
> > > > From: Peng Fan <peng.fan@nxp.com>
> > > >
> > > > Per ARM SCMI Spec DEN0056E, page 16, "The platform may disable a
> > > > resource if no agent has requested to use that resource."
> > > >

Hi,

not really a short mail this one...

> > >
> > > True, but ...
> > >
> > > > Linux Kernel should not rely on a state that it has not requested, so
> > > > make state as off during initialization.
> > > >
> > >
> > > IIUC, this was done to avoid any transitions if the bootloader like U-
> > > Boot has turned on the resource and OS can just rely on that stay.
> >
> > But if it is not U-Boot turned it on?
> 
> Not sure if I understand what exactly you mean by that.
> 
> > Or U-Boot is in a separate agent?
> >
> 
> No, it will be same as OS for the SCMI platform/agent as they use/share the
> same transport. It is hard to distinguish between them.
> 

Exactly, if U-Boot is SCMI capable, its requests will have been accounted,
lets say, as Agent_X, but when the Kernel springs to life it will take over
the role and the SAME channel used by the defunct UBoot, so as to appear as
being effectively the same Agent_X to the platform...

...the tricky part is what happens when, instead, UBoot is NOT an SCMI agent
and it does leave some resources ON (say some regulator needed while setting up
the screen...) with the intent of NOT having those turned off by the Kernel ?
(BUT with such actions not tracked by the platform, not being an SCMI agent)

To make the matter worse, all of this sort of "resource-state-alignment-issue"
between bootloader, Kernel or other independent agents, greatly depends on how
the state-get operations were implemented.

IOW, since some resources could be shared between agents (clocks, PDs), a
set-state on such resources is supposed to be "harmonized" by the platform,
so that, say, res_X will be enabled physically only when the first agent
acquires it, and res_X will be finally disabled only when the last agent
relinquishes it...

....you certainly dont want that after agent_A have issued a set_ON(res_X),
another agent_B issuing a set_OFF(res_X) can cause that same shared res_X to
be effectively switched off while still used by agent_A...in such a case agent_B
should receive an OK but res_X should anyway effectively stay ON until also
agent_A has relinquished it too...

...now the question is...what state would you expect to read-back from a
get_state operation on such shared resources ? the real/physical one OR the
virtual/per_agent state ?

...IOW in the above example, after agent_B successfully issued a set_OFF(res_X),
on the shared res_X (which indeed did NOT really caused sharted res_X to be
turned OFF) what will agent_B should read back from a get_state(res_X):

	OFF (virtual-view) ? ... or ON (physical view) ?

This platform "states-view" behaviour was long debated and at the end
AFAICR it has been left by the spec as IMPDEF, so each platform can
decide what to return...physical vs virtual state...and that means that,
whatever we do, Kernel side we should cope with 4 possible scenarios

- Uboot NON-SCMI / physical GET_STATE platform-impl
- Uboot NON-SCMI / virtual GET_STATE platform-impl
- Uboot SCMI / physical GET_STATE platform-impl
- Uboot SCMI / virtual GET_STATE platform-impl

...and in all of these scenarios we should additionally consider what
happens when the kernel wants or want-not to keep a resource in the state,
that it has found it (as queried with a get_state (physical or virtual))

IOW, as an example, what if:

I have an UBOOT/NON_SCMI that leaves res_X OFF from its point-of-view at
the end of its life, BUT res_X is also claimed as ON by another SCMI agent_Z
at the same time, and the platform implements physical-real-views, so that
Kernel will see anyway res_X as ON....what should happen, in this context,
if the Kernel wants to keep res_X ON ?

OR what if:

I have an UBOOT/SCMI agent_X that leaves res_X ON from its point-of-view at
the end of its life, BUT res_X is also claimed as ON by another SCMI agent_Z
at the same time, and the platform implements virtual-per-agent-views,
so that Kernel will see res_X as ON....what will happen, in this
context, if the Kernel wants to turn res_X OFF ? AND what happens
instead if, in this scenario, we have additionally the currently proposed patch
applied (that forcibly would makke the Kernel think that res_X is OFF) ?

All of these scenario should be considered, and I have indeed an even
longer (:P) mail currently brewing on my side to try to layout all
possibilities...

...next days once it is more refined I will post it.... you've been warned ! :P

Thanks
Cristian

