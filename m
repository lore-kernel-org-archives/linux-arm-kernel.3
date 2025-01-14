Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BE9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 15:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//CcpbPza7N9vgAbhqgFiwyl+uPQhxrQ9mz1hZI00l4=; b=Jj0CA6GVFbgi+IA5D4Hp8OqJiJ
	Rm5YZgJolyqD47NqlOfE8Rgi/GcGvYFEGtl3l0xJhrAxaa09sgIPFpk8dVzyisagmwJ2F5K9HRsfO
	BKzY47NOQN6SDXh/B70GtnMOInG3ZzpAfCkxx+tJmaDXmtGI8DH8+Sj0O1qfel6b6NwLRp3xCk39y
	/T8bLKjxPfMZC+vaI7loP6wlXSYzpwnha8KB2CgtvJyTcSTnIIuSxHUg/oRM04NWfWJyRcJeMC4io
	Lo+AjTp/1vCZIHPropzLwUMX5Ex8lpAOEaBrjpexV5ZnZNz0Vv9e6d6ul8Y95xlMsvrlc7Efp0Xr7
	Lnfo5L4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXinD-00000008qSo-1OYn;
	Tue, 14 Jan 2025 15:25:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXily-00000008qFA-0Hxb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 15:24:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A120611FB;
	Tue, 14 Jan 2025 07:24:33 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C4FE73F673;
	Tue, 14 Jan 2025 07:24:03 -0800 (PST)
Date: Tue, 14 Jan 2025 15:24:01 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	"cristian.marussi@arm.com" <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [EXT] Re: [PATCH] pmdomain: arm: scmi_pm_domain: Initialize
 state as off
Message-ID: <Z4aBkezSWOPCXcUh@bogus>
References: <20250110061346.2440772-1-peng.fan@oss.nxp.com>
 <Z4TreQ5bA9qiMTgC@bogus>
 <PAXPR04MB8459F33BCC84CCA8F49F3B60881F2@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z4UZ2Au7KSFMibDW@bogus>
 <PA4PR04MB94855052830C8F4874237BA6921F2@PA4PR04MB9485.eurprd04.prod.outlook.com>
 <Z4VLZgAWR7ugDl7W@bogus>
 <PA4PR04MB9485E9C126E48A088D7E399B921F2@PA4PR04MB9485.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PA4PR04MB9485E9C126E48A088D7E399B921F2@PA4PR04MB9485.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_072406_200074_ABAD5345 
X-CRM114-Status: GOOD (  27.87  )
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

Hi Ranjani,

On Mon, Jan 13, 2025 at 07:54:06PM +0000, Ranjani Vaidyanathan wrote:
> Hello Sudeep,
>
> Will try to explain the situation we are facing.
> 1. We have multiple agents running, Agent-A is booted up first before Linux
> is booted and powers up a shared power domain PD-X.
> 2. Linux boots and gets the power state of PD-X. And its already ON. And
> then PD -X is initialized with a default ON state.
> 3. When the driver that needs PD-X  is probed, Linux sees that the power
> domain status is ON and never makes an SCMI call to power up the PD-X for
> Linux Agent.
> 4. Agent-A now is shutdown/suspends. Linux will crash because the platform
> disables PD-X because it has no other requests for PD-X.
>

Thanks for the detailed explanation. I understand the issue now.

I would like to discuss if the below alternative approach works for you.
We can debate the pros and cons. I see with the approach in this patch
proposed by Peng we would avoid querying and setting genpd all together
during the genpd initialisation which is good. But if there are any genpd
left on by the platform or bootloader(same agent), it will not get turned
off when Linux tries to turn off the unused genpds(IIRC this could be the
reason for the current state of code). While your platform may find sending
those commands unnecessary, there was some usecase where SCMI platform kept
all resources ON by default for faster boot and expects OSPM to turn off
unused resources. So we need to support both the cases. I hope my below
patch should suffice.

Regards,
Sudeep

---->8

From dc755fa02d351e71c727da1c396e2d346b496096 Mon Sep 17 00:00:00 2001
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Tue, 14 Jan 2025 15:08:44 +0000
Subject: [PATCH] pmdomain: arm: scmi_pm_domain: Send an explicit request to
 set the current state

On a system with multiple active SCMI agents, one agent(other than OSPM/
Linux or bootloader) would request to turn on a shared power domain
before the Linux boots/initialise the genpds. So when the Linux boots
and gets the power state as already ON, it just registers the genpd with
a default ON state.

However, when the driver that needs this shared power domain is probed
genpd sees that the power domain status is ON and never makes any SCMI
call to power it up which is correct. But, since Linux didn't make an
explicit request to turn on the shared power domain, the SCMI platform
firmware will not know if the OSPM agent is actively using it.

Suppose the other agent that requested the shared power domain to be
powered ON requests to power it OFF as it no longer needs it, the SCMI
platform firmware needs to turn it off if there are no active users of
it which in the above scenaro is the case.

As a result of SCMI platform firmware turning off the resource, OSPM/
Linux will crash the moment as it expects the shared power domain to be
powered ON.

Send an explicit request to set the current state when setting up the
genpd power domains. The other option is to not read the state and set
the genpds as default OFF, but it can't handle the scenario on certain
platforms where SCMI platform keeps all the power domains turned ON by
default for faster boot and expect the OSPM to turn off the unused
domains if power saving is required.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/pmdomain/arm/scmi_pm_domain.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
index a7784a8bb5db..255c8c36a15c 100644
--- a/drivers/pmdomain/arm/scmi_pm_domain.c
+++ b/drivers/pmdomain/arm/scmi_pm_domain.c
@@ -96,6 +96,8 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
 			continue;
 		}

+		power_ops->state_set(ph, i, state);
+
 		scmi_pd->domain = i;
 		scmi_pd->ph = ph;
 		scmi_pd->name = power_ops->name_get(ph, i);
--
2.34.1


