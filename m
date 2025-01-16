Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3634CC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 16:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NXwKgfYfBCTaHAuVM3RwosO58FlQMP+zROi+IXHwVN0=; b=SBr/ZNIwtwE2hWddixIHW7Dkwe
	HcoVFZvaHzXhw4NHa1iqsJTNByP3iDa8T+izfjw4i7CQ9qEu+APxAbDSdy0UXNASrr9t+sB7/G72b
	orROrCpsFHI8cRn6YS4NcUoK48JMRqWqq9kpNIcq4RkD5QDlILQxFZl1Vvg2SSKuh64EPYdyFG2nz
	EHFgOmsi5eYq3qyyq+h1wmSNvcgB8JEeKuZ+AaNhiWQf9fvl15kC+TWOqR2jeR0A+TDML7CfVq2j1
	3PSz4jYO2OMQiKj0VnvepqgTB/INa2/shBzHr8royrM94NXX9QjD6UNRIC7mXT2Zn8YLRizvNPTBa
	EoNNovKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYSbL-0000000FUv3-3Sy6;
	Thu, 16 Jan 2025 16:20:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYSa5-0000000FUjP-2xXk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 16:18:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21FE41007;
	Thu, 16 Jan 2025 08:19:19 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F0813F673;
	Thu, 16 Jan 2025 08:18:49 -0800 (PST)
Date: Thu, 16 Jan 2025 16:18:42 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Peng Fan <peng.fan@nxp.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	"ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [EXT] Re: [PATCH] pmdomain: arm: scmi_pm_domain: Initialize
 state as off
Message-ID: <Z4kxYvR9XxldCpk-@pluto>
References: <Z4TreQ5bA9qiMTgC@bogus>
 <PAXPR04MB8459F33BCC84CCA8F49F3B60881F2@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z4UZ2Au7KSFMibDW@bogus>
 <PA4PR04MB94855052830C8F4874237BA6921F2@PA4PR04MB9485.eurprd04.prod.outlook.com>
 <Z4VLZgAWR7ugDl7W@bogus>
 <PA4PR04MB9485E9C126E48A088D7E399B921F2@PA4PR04MB9485.eurprd04.prod.outlook.com>
 <Z4aBkezSWOPCXcUh@bogus>
 <PA4PR04MB9485507CCC21354B5ED55C3792182@PA4PR04MB9485.eurprd04.prod.outlook.com>
 <Z4d8nrJy-h9EwzsJ@pluto>
 <PA4PR04MB9485CC9D9925BB5D23EA629092192@PA4PR04MB9485.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PA4PR04MB9485CC9D9925BB5D23EA629092192@PA4PR04MB9485.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_081853_837691_426D77B4 
X-CRM114-Status: GOOD (  49.95  )
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

On Wed, Jan 15, 2025 at 06:42:46PM +0000, Ranjani Vaidyanathan wrote:
> Hi Cristian,
> 
> Regards,
> Ranjani Vaidyanathan
> 
> -----Original Message-----
> From: Cristian Marussi [mailto:cristian.marussi@arm.com] 
> Sent: Wednesday, January 15, 2025 3:15 AM
> To: Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
> Cc: Sudeep Holla <sudeep.holla@arm.com>; Peng Fan <peng.fan@nxp.com>; Peng Fan (OSS) <peng.fan@oss.nxp.com>; cristian.marussi@arm.com; ulf.hansson@linaro.org; arm-scmi@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-pm@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [EXT] Re: [PATCH] pmdomain: arm: scmi_pm_domain: Initialize state as off
> 
> Caution: This is an external email. Please take care when clicking links or opening attachments. When in doubt, report the message using the 'Report this email' button
> 
> 
> On Tue, Jan 14, 2025 at 04:09:13PM +0000, Ranjani Vaidyanathan wrote:
> > Hello Sudeep,
> >
> > Comments below.
> >
> > Regards,
> > Ranjani Vaidyanathan
> >
> > -----Original Message-----
> > From: Sudeep Holla [mailto:sudeep.holla@arm.com]
> > Sent: Tuesday, January 14, 2025 9:24 AM
> > To: Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
> > Cc: Peng Fan <peng.fan@nxp.com>; Peng Fan (OSS) 
> > <peng.fan@oss.nxp.com>; cristian.marussi@arm.com; Sudeep Holla 
> > <sudeep.holla@arm.com>; ulf.hansson@linaro.org; 
> > arm-scmi@vger.kernel.org; linux-arm-kernel@lists.infradead.org; 
> > linux-pm@vger.kernel.org; linux-kernel@vger.kernel.org
> > Subject: Re: [EXT] Re: [PATCH] pmdomain: arm: scmi_pm_domain: 
> > Initialize state as off
> >
> > Caution: This is an external email. Please take care when clicking 
> > links or opening attachments. When in doubt, report the message using 
> > the 'Report this email' button
> >
> >
> > Hi Ranjani,
> >
> > On Mon, Jan 13, 2025 at 07:54:06PM +0000, Ranjani Vaidyanathan wrote:
> > > Hello Sudeep,
> > >
> > > Will try to explain the situation we are facing.
> > > 1. We have multiple agents running, Agent-A is booted up first 
> > > before Linux is booted and powers up a shared power domain PD-X.
> > > 2. Linux boots and gets the power state of PD-X. And its already ON.
> > > And then PD -X is initialized with a default ON state.
> > > 3. When the driver that needs PD-X  is probed, Linux sees that the 
> > > power domain status is ON and never makes an SCMI call to power up 
> > > the PD-X for Linux Agent.
> > > 4. Agent-A now is shutdown/suspends. Linux will crash because the 
> > > platform disables PD-X because it has no other requests for PD-X.
> > >
> >
> > Thanks for the detailed explanation. I understand the issue now.
> >
> > I would like to discuss if the below alternative approach works for you.
> > We can debate the pros and cons. I see with the approach in this patch proposed by Peng we would avoid querying and setting genpd all together during the genpd initialisation which is good. But if there are any genpd left on by the platform or bootloader(same agent), it will not get turned off when Linux tries to turn off the unused genpds(IIRC this could be the reason for the current state of code). While your platform may find sending those commands unnecessary, there was some usecase where SCMI platform kept all resources ON by default for faster boot and expects OSPM to turn off unused resources. So we need to support both the cases. I hope my below patch should suffice.
> >
> > [RV] Linux can still make the call to disable unused power domains, even if it never explicitly made a request to power it on. The platform will aggregate the request from all agents and will power off the resource if no other agent has enabled it. From Linux point of view it has disabled all unused power domains.
> > Your patch below may also work, but feels like a workaround to artificially (for lack of a better word) enable a resource. And also makes unnecessary SCMI calls (expensive) for every resource immaterial of it power state (maybe can be improved by a conditional check).
> >
> 
> ...sincerely, both of these solutions seem to me hacks/workarounds to counteract the fundamental issue that derives from having allowed (IMPDEF) to implement the get operations to return the real physical state of a resource instead of its virtual per-agent state as maintained by the platform, while, at the same time, having allowed to implement the set-operations to operate in a 'virtual-fashion'...
> 
> ...so, when Peng's patch forcibly set the state to OFF on genpd init, you are indeed artificially forcing the kernel internal state to align with what would have been the virtual-per-agent state of the resource in your specific particular configuration....
> [RV] Perhaps it's a hack. But at boot the state should look like OFF, the agent should explicitly request those it needs to be ON. 
> 

Yes it is what I am saying, it should see it OFF in this system config, and
that would be the case on a platform that returns virtual per-agent states:
forcing GENPD to see as it as off just mimics the same, but breaks other
cases as I mentioned.

> ...on the other side Sudeep's proposed patch tries really to play the same trick, just on the other way around, by instead forcibly/artificially aligning the state on the platform side by issuing a redundant ON request to bump the refcount and take hold of that resource from the Kernel agent point of view...
> 
> ... but Peng's proposed patch will broke immediately the moment you have instead a system with an SCMI-capable bootloader that instead left the resource ON for the Kernel to inherit, since the kernel will now forcibly see this anyway as OFF, and so you wont be ever be able to switch that resource REALLY OFF in the future, if ever needed, because the bootloader/Kernel agent will never see it as ON in genPD, since, at least in the genPD case, AFAICS correct me if wrong, there is no callback to peek at the real state later on:
> so, after the initialization value has been chosen at genpd_init time, genPd subsystem maintains the PD state on its own based on the issued ON/OFF genPD requests, so your forced-initial-OFF-state will be, in this specific alternative scenario, wrong and forever.
> [
> [RV] SCMI-capable bootloader and Linux should be the same logical machine (different agents). And the platform maintains the state per logical machine. So if Linux tries to power off a state that was left powered ON by the bootloader it should bbe able to.

In the SCMI world there are agents, i.e. clients issuing requests to the
platform AND the platform identifies such agents from the channel they
speak from. Not sure what you mean by logical machine.

In the case of an SCMI-aware bootloader like UBoot, that dies and relinquishes
all the resources to the Kernel during the boot, that means that the Kernel
should be configured to simply re-use the same SCMI channels as UBoot, so that
it will be seen as the same agent (transparently) from the platform: in such a
scenario the Kernel will transparently inherit all the per-agent current
interrnal state...

...IOW if an SCMI/Uboot was holding res_X, the Kernel will result as holding the
same res_X "by inheritance" from the platform point of view, since the Kernel
would have assumed the role of the UBoot agent from the platfom point of
view, since it is using the same channels as UBoot.

Why you should consider Uboot a diffrent agent, if it runs in NS-world
too and does not survive the Kernel boot ?

This, at least, is my understannding after bunch of past talk with ATG.

And this is the scenario that I fear would fail with Peng's patch.

Thanks,
Cristian

