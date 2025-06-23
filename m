Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9A3C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 20:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4DTyLuIJ2wI4Cu/lg22MUaJU4KhV1SY3JsAMunSQW3M=; b=y4IpaCgt0f/ER5D7cZLXqoxBJl
	LYCYsJrBeFmw76QEcG5zhUWIvp+huKWyeQXJKcSke4Lq77L6kw2oPmECC7XXyfGEu4167kTBQgeNr
	327DGZHNVW0CX8JG2V+AYVj8tRkGW1VCDeX5xvC903AhtfitKifk2PKjQ2xIg8WnOWb/rKW5xNg5L
	JSntkIEuU1nd1o4Brk0Cy3lBY+KJqpVJ8zLcUrAB1vXhHjSFDn7QSFr+z9wFVlUb8y57zQTkzERf1
	f/Nbljp3vcRpfG2lriq0Ly36c8kz42D+nBrYHPYcXHrr3D5qN2+zSdKdVjgors/MM/I5pzd2wULIw
	vZriWb8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTo4N-00000003xA7-40Ss;
	Mon, 23 Jun 2025 20:47:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTijE-000000039r3-2GMI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 15:05:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4ACC0113E;
	Mon, 23 Jun 2025 08:04:41 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C39EF3F58B;
	Mon, 23 Jun 2025 08:04:57 -0700 (PDT)
Date: Mon, 23 Jun 2025 16:04:55 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Dhruva Gole <d-gole@ti.com>, Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>,
	Chuck Cannon <chuck.cannon@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/2] firmware: arm_scmi: power_control: Set
 SCMI_SYSPOWER_IDLE in pm resume
Message-ID: <aFltF1xqRDnyyngE@pluto>
References: <20250620-scmi-pm-v1-0-c2f02cae5122@nxp.com>
 <20250620-scmi-pm-v1-2-c2f02cae5122@nxp.com>
 <20250623125750.kzwndmcf5yo3siao@lcpd911>
 <20250623142957.GA10415@nxa18884-linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623142957.GA10415@nxa18884-linux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_080500_665910_51204445 
X-CRM114-Status: GOOD (  31.48  )
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

On Mon, Jun 23, 2025 at 10:29:57PM +0800, Peng Fan wrote:
> On Mon, Jun 23, 2025 at 06:27:50PM +0530, Dhruva Gole wrote:
> >On Jun 20, 2025 at 11:37:14 +0800, Peng Fan (OSS) wrote:
> >> From: Peng Fan <peng.fan@nxp.com>
> >> 
> >> When two consecutive suspend message send to the Linux agent, Linux will
> >> suspend and wake up. The exepcted behaviour should be suspend, wake up
> >
> >I am first trying to gather more context of the issue at hand here,
> >Why and who is sending 2 consecutive suspend messages to Linux?
> 
> Currently in my test, it is SCMI platform send two suspend messages.
> But in real cases, other high priviledge agents could send suspend messages
> to linux agent.

Dont really understand this...a high-privileged supervisor agent would
anyway send a suspend/shutdown request to the SCMI server which in turn
should be able to filter out such spurious requests...or such suspend
request from the supervisor to the agent comes through other non-SCMI
means ?

> 
> One agent may wrongly send two suspend messages by user or the agent is hacked.
>

An agent is NOT capable to send direct notification to another agent...
....notifcation are sent via the P2A channels which means that the server is
in charge to send notifs...other agents can cause notifs to be sent NOT
send them directly...so that the server can filter-out any hacked
request... 

> >
> >Just quoting the cover letter:
> >
> >> When testing on i.MX95, two consecutive suspend message send to the Linux
> >> agent, Linux will suspend(by the 1st suspend message) and wake up(by the
> >> 2nd suspend message).
> >> 
> >> The ARM SCMI spec does not allow for filtering of which messages an agent
> >> wants to get on the system power protocol. To i.MX95, as we use mailbox
> >> to receive message, and the mailbox supports wake up, so linux will also
> >> get a repeated suspend message. This will cause Linux to wake (and should
> >> then go back into suspend).
> >
> >When you say mailbox supports wake up you mean the mailbox IP in your
> >SoC actually gets some sort of wake interrupt that triggers a wakeup?
> 
> There is no dedicated wake interrupt  for mailbox.
> 
> The interrupt is the doorbell for processing notification, and this
> interrupt could also wakeup Linux.
> 
> >Is this wakeup sent to the SM then to be processed further and trigger a
> >linux wakeup?
> 
> No. As above, the mailbox received a doorbell notification interrupt.
> 
> >
> ><or> the mailbox directly wakes up linux, ie. triggers a resume flow but
> >then you are saying it was an unintentional wakeup so you want to
> >suspend linux again?
> 
> Right.
> 
> This just seems like the wakeup routing is
> >incorrect and the system is going through a who resume and then suspend
> >cycle without a good reason?
> >
> >Why and when in this flow is linux ending up with a duplicate suspend message is
> >something I still don't follow.
> 
> Other agents could send duplicated suspend messages, right?
> We could not expect other agents always behave correctly.
> 

Absolutely, BUT SCMI is a client/server system and the server is in
charge to filter-out such requests, since each agent has its own dedicated
channel and it is identified by the server as agent_X with capabilities_X
from the channel it speaks from (i.e. an agent cannot spoof its identify)

...and the server is the ultimate judge/aribter of any request so that
it can drop any unreasonable request...we should NOT delegate such
self-protection mechanisms to the agents...

> >
> >Could you point us to any flow diagrams or software sequences that we
> >could review?
> 
> Not sure what kind diagram or sequences you wanna. It is just one agent
> wrongly send duplicate suspend message to Linux agent. And Linux agent
> should suspend again.
> 
> One more example is
> Linux suspended, other agent send reboot linux message, Linux should
> wakeup and reboot itself.

Yes...another privileged agent request a Reboot for agent_X (SYSPOWER_STATE+_SET)
to the server and the server in turn sends a Reboot notification to the
suspended agent_X , which is woken up by the notification and proceeds
with a graceful shutdown/reboot...if this does NOT happen it is
definitely a bug..

> 
> Same to suspend
> Linux suspended, other agent send suspend Linux message, Linux wakeup
> and suspend again.

In theory yes, it should work like this, BUT better if the 2nd message
never come (as explained above)...if this happens, I would say log this
as a warning too because it is not a normal scenario...i.e. if you
receive multuple suspend to the same agent from the same server...
...something is wrong...I agree Linux should survive (and suspend back)
BUT should not be allowed at first (filtered-out) 

Thanks,
Cristian

