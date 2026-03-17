Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B328FED9EB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 16:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UoNam4sqgUGQyMzbPbzMuhPIf7oSVgSn7bo6IZCkSsk=; b=pt9EUGQi6MI21yeyLBsnHwWKVH
	Gpwilc4GegABssX2wME4la9X1MUBYNntVuuChhWVO7+lFF8YtRnQpZ7sV2wcPKggUjl/fJkK/Wr1z
	UuACHk2tmBMQ6fzKPzgS2SqJ0d0Fhs5p4GzZaAxsHL2j9sGhKmd6rJox6UMszxt1GaV83wHrSnbjg
	SHBwQyg4xYWz6PDQ/rnFte/FQdWjnUgqGi7qUIspJ/iWn6T4mJ+vyc+iQ1ZWVJV7TGHrHtMTzdO6n
	KTnaXcvniX7t30mMTtqzxvvTeTxVVqAXDvh2cWNTI649MGo4J2vwlp/OUwV9mKFjivW30W9jvBVWC
	nOgNAg3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2XkZ-00000006s87-0YAL;
	Tue, 17 Mar 2026 16:58:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2XkV-00000006s6k-4654
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 16:58:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 919CA1477;
	Tue, 17 Mar 2026 09:58:19 -0700 (PDT)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 176D23F7BD;
	Tue, 17 Mar 2026 09:58:22 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	philip.radford@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	dan.carpenter@linaro.org,
	gatien.chevallier@foss.st.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [RFC PATCH 0/4] Rework SCMI transport drivers probing sequence
Date: Tue, 17 Mar 2026 16:58:07 +0000
Message-ID: <20260317165811.3352752-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_095832_132517_A6D8B750 
X-CRM114-Status: GOOD (  18.02  )
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

Hi,

when the SCMI transports were split out into standalone drivers [1] the
probe sequence was laid out in such a way that:

 - the transport drivers would have probed first, triggered by the firmware
   driven discovery process (DT/ACPI)

 - afterwards the control would have been passed to the core SCMI stack
   driver via the creation of a dedicated device that would have inherited
   the original firmware descriptor (since that same DT/ACPI node would
   have still needed by the SCMI core driver to be parsed)

The tricky part came around with some transport driver like virtio and
optee since they are, in turn, upfront dependent on an external distinct
kernel subsystem; IOW these have first to undergo their own subsystem
specific probe/initialization to become fully operational as transports:
this kind of initialization sequencing of course must deal with the
possibility of probe deferrals BUT at that time we avoid this by using the
trick in virtio/optee transports to register the next stage transport
drivers ONLY at the end of the subsystem specific probe routine, from
within the probe itself.

This behaviour has 2 issues:

 - it is frowned upon and can lead to hangs in the driver core whenever
   some core locking is changed as exposed in [2]
 - it limits these transport drivers to a single instance probing since of
   course you cannot register the same driver more than once

All of this was tolerable because optee/virtio are generally only employed
in a single SCMI instance scenario AND because no hang where triggered in
the core driver subsystem... (not saying that was perfectly fine :P)

This RFC series aims to solve both of the above issue by:

 - moving the problematic platform driver registation away from the probe
   into its own module_init/exit

 - introducing an optional mechanism for the transport drivers to provide
   to the SCMI core some sort of transport specific handle so that multiple
   instances can be supported and multiple probed transports instances can
   be registered and identified by the core. (who is who)
   Note that at the same time this optional handle-mechanism is used to
   synchronize the drivers probing sequences and possibly trigger, when
   needed, the probe deferrals, if the transport driver has still to
   undergo its own subsystem initialization and as such is still NOT fully
   operational.

Most of the above mechanism is provided in 1/4 and 2/4 while patches 3 and
4 take care to port virtio and optee to the new probe schema.

Note that optee required some additional way (an xarray) to match properly
the tee_client_device with the agent on the TEE removal phase, now that
multiple instances are an option: but I could have missed a simpler
solution given my TEE-ignorance.

Please be aware that all of this has been tested as a builtin or as modules
on an emulated setup BUT ONLY with the virtio transport as of now.
Optee is only built tested.

Based on v7.0-rc4

Being an RFC I am NOT completely sure of the final code layout (we may make
most of this transparent really), I am mostly interested of course in
gathering some feedback above the whole mechanism.

Thanks,
Cristian
----
[1]: https://lore.kernel.org/arm-scmi/20240812173340.3912830-1-cristian.marussi@arm.com/
[2]: https://lore.kernel.org/lkml/aaA6t-J2gRy3dE1_@pluto/

Cristian Marussi (4):
  firmware: arm_scmi: Add transport instance handle
  firmware: arm_scmi: Propagate transport instance handle
  firmware: arm_scmi: virtio: Rework transport probe sequence
  firmware: arm_scmi: optee: Rework transport probe sequence

 drivers/firmware/arm_scmi/common.h            |  46 +++++-
 drivers/firmware/arm_scmi/driver.c            |  15 +-
 .../firmware/arm_scmi/transports/mailbox.c    |   5 +-
 drivers/firmware/arm_scmi/transports/optee.c  | 143 ++++++++++--------
 drivers/firmware/arm_scmi/transports/smc.c    |   4 +-
 drivers/firmware/arm_scmi/transports/virtio.c |  99 +++++++-----
 6 files changed, 202 insertions(+), 110 deletions(-)

-- 
2.53.0


