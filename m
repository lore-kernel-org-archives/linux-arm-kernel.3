Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29B0C02183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 17:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8t4PmpW1xAxaZBSiQ+U5aJRZbcC7Oj+dB2snQB8pfj4=; b=HHHpQnHnjTgkLdkyWAP1qCcEzd
	e3h+5r17QwJahA16GiSIGI/uw/OxSMzTZxgkIxTdK26y/RN9xoYBGOHr09Jt1zduLdutFVRJgTPtA
	U+0G0/HLewXShCglh1pF2MAx5V9STWF2A3mnTsGRJWKl6IBHeQ77KJlY218UNn/NU81R9jzVMRizN
	0lMGaBJVLtPiZv0oIoPjUD/zccJMigY30A4thEPuuMaliLEZNMW5bk2twDFZ/bYoT93CQC8tYMt9s
	D0E3pxMzPm+futeGKCHl/dutYNTYklrBfg5uVaSk2z1Cm8ACqm7P/bfmYt65IqRDWuUDPq1DJE197
	wbyhywFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXOf3-000000067av-3wiE;
	Mon, 13 Jan 2025 17:55:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXOdo-000000067F2-0yrQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 17:54:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8609A12FC;
	Mon, 13 Jan 2025 09:54:44 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 459913F66E;
	Mon, 13 Jan 2025 09:54:14 -0800 (PST)
Date: Mon, 13 Jan 2025 17:54:03 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	"cristian.marussi@arm.com" <cristian.marussi@arm.com>,
	"ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [EXT] Re: [PATCH] pmdomain: arm: scmi_pm_domain: Initialize
 state as off
Message-ID: <Z4VTO9mowkMfpZiI@pluto>
References: <20250110061346.2440772-1-peng.fan@oss.nxp.com>
 <Z4TreQ5bA9qiMTgC@bogus>
 <PAXPR04MB8459F33BCC84CCA8F49F3B60881F2@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z4UZ2Au7KSFMibDW@bogus>
 <PA4PR04MB94855052830C8F4874237BA6921F2@PA4PR04MB9485.eurprd04.prod.outlook.com>
 <Z4VLZgAWR7ugDl7W@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4VLZgAWR7ugDl7W@bogus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_095420_354836_D55BA715 
X-CRM114-Status: GOOD (  36.89  )
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

On Mon, Jan 13, 2025 at 05:20:38PM +0000, Sudeep Holla wrote:
> On Mon, Jan 13, 2025 at 03:30:58PM +0000, Ranjani Vaidyanathan wrote:
> > -----Original Message-----
> > From: Sudeep Holla [mailto:sudeep.holla@arm.com]
> > Sent: Monday, January 13, 2025 7:49 AM
> > To: Peng Fan <peng.fan@nxp.com>
> > Cc: Peng Fan (OSS) <peng.fan@oss.nxp.com>; cristian.marussi@arm.com; Sudeep Holla <sudeep.holla@arm.com>; ulf.hansson@linaro.org; arm-scmi@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-pm@vger.kernel.org; linux-kernel@vger.kernel.org; Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
> > Subject: [EXT] Re: [PATCH] pmdomain: arm: scmi_pm_domain: Initialize state as off
> >
> > On Mon, Jan 13, 2025 at 11:37:23AM +0000, Peng Fan wrote:
> > > > Subject: Re: [PATCH] pmdomain: arm: scmi_pm_domain: Initialize state
> > > > as off
> > > >
> > > > On Fri, Jan 10, 2025 at 02:13:46PM +0800, Peng Fan (OSS) wrote:
> > > > > From: Peng Fan <peng.fan@nxp.com>
> > > > >
> > > > > Per ARM SCMI Spec DEN0056E, page 16, "The platform may disable a
> > > > > resource if no agent has requested to use that resource."
> > > > >
> > > >
> > > > True, but ...
> > > >
> > > > > Linux Kernel should not rely on a state that it has not requested,
> > > > > so make state as off during initialization.
> > > > >
> > > >
> > > > IIUC, this was done to avoid any transitions if the bootloader like
> > > > U- Boot has turned on the resource and OS can just rely on that stay.
> > >
> > > But if it is not U-Boot turned it on?

Hi Sudeep, Ranjani,

> >
> > Not sure if I understand what exactly you mean by that.
> > [RV] Its possible that some other agent (M33/M7 running OS) in the system
> > turned on the power domain. Resources in the same power domain can shared
> > across agents.  That being said, uboot provides mechanism to clean up any
> > power domains/clocks that it enabled. And our implementation of uboot does
> > disable any power domain it powered up for downloading of images or anything
> > else (display is a unique case if splash screen is enabled).
> >
> 

So, RV,  you are saying that the your UBoot is cleanly releasing/turning_OFF all
the resources that it claimed during its life before giving control to
Linux (sicne no more needed) BUT some other agent in the system has requested
that resource to be ON, so when Linux query the status of the resources it sees
it as ON since it sees the physical real status of the resource ?

If this is the case, I suspected this was the issue, and I will address these
scenario in a separate mail on this thread that I was already in the middle of
writing....

> Right I was referring to the display as one of the example when I referred
> to the case where bootloader turns on the resource.
> 
> > >
> > > Because the power domain is ON, kernel will not issue SCMI to platform
> > > to request it ON when kernel needs this power domain on.
> > >
> >
> > Yes, but the agent(via bootloader) has already requested the SCMI platform,
> > so it should be fine. No ?
> > [RV] As mentioned above, it need not be the bootloader. And secondly how to
> > handle this power domain during suspend/resume? It's possible that the agent
> > that turned on the power domain initially will have different wakeup
> > requirements. IMO Linux should completely be responsible for the power
> > domains that the drivers need.
> >
> 
> May be I am still missing something. The genpd framework does issue power
> down of all the PD that are not used once we boot. Is that not sufficient.
> We are just not changing the pd state when initialising the genpds.
> Is that causing the issue ? I was under the impression that it shouldn't
> matter if the driver manages the genpds they consume and all unused ones
> get turned off eventually.

I think GenPD turns off unused PD domains ONLY if pd_ignore_unused
kernel-param is false, BUT it is true by default AFAICS.

Thanks,
Cristian

