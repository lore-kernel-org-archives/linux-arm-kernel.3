Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA9CCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 16:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ghy3poxUFxpb58jZ44x2Q0s5cMFNVcJSCa1tOG90fLk=; b=wCe3iO5fmiqarP9YOYtY25yjs3
	xUDx/loxyisa9rl89cI1oHAO/Kosgmvmw4dJPIGDzJ+lk9KKLJPDT6550e4qLQg/rmmJiOxwwVuYw
	wYsPMbMU9S8lF3V83AgzgbECXBHAchsljPE0TeJ7jGBGcC8g02vEixcCaBr/XCOV3yQ2mevjZ3xYu
	8DDLCIUbUbRUghtwP0kAO28WV0IQCZZIrQt2qPzsc0MZ5HsT4S7ySvYoFq5rt+7PA8rnwO+odAFo8
	C/kSQNqklr5NXgZq9m0M0S8RLhT0oe7f2JPUNYO/IDadnPnKWRP1xFbAeebnCdxpnTc7y+Be6DW64
	B4087OUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM6fM-0000000B77T-3okq;
	Sun, 10 May 2026 16:06:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM6fJ-0000000B766-2AZL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 16:06:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5F7D26AC;
	Sun, 10 May 2026 09:05:51 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 704E13F836;
	Sun, 10 May 2026 09:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778429156; bh=myTaqAtC7/L1Xq3s01EGR42VOFZpWLVRSjMnBYulHi0=;
	h=From:To:Cc:Subject:Date:From;
	b=NBuya4IrypJzViUSWTnthUpvVcxQm9ocZE0mU4ihSCs9sp93ljx3DG8hpUS/B+apm
	 oiOusT6xqNPLddYFGzv5QSE6/Dbgn8Tu3ggzDhyWoGcA5GkNJ7AePAXwbiuJ5ctWU1
	 0Y6HkLxg29DjOflaPETcGJ1FTDv9PFfoFMgbOyKU=
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
	gatien.chevallier@foss.st.com,
	u.kleine-koenig@baylibre.com,
	dakr@kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v2 0/4] Rework SCMI transport drivers probing sequence
Date: Sun, 10 May 2026 17:05:23 +0100
Message-ID: <20260510160527.3537474-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_090601_809100_EDE6E342 
X-CRM114-Status: GOOD (  19.50  )
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
   have been still needed by the SCMI core driver to be parsed)

The tricky part came around with some transport driver like virtio and
optee since they are, in turn, upfront dependent on an external distinct
kernel subsystem; IOW these have first to undergo their own subsystem
specific probe/initialization to become fully operational as transports:
this kind of initialization sequencing of course must deal with the
possibility of probe deferrals BUT at that time we avoided this by using
the trick in virtio/optee transports to register the next stage drivers
ONLY at the end of the subsystem specific probe routine, from within the
probe itself.

This register_while_probing behaviour is ugly and has 2 main issues:

 - it is frowned upon and can lead to hangs in the driver core whenever
   some core locking is changed as exposed in [2][3]

 - it limits these transport drivers to a single instance probing since of
   course you cannot register the same driver more than once

Note also that such dependencies are NOT explicitly represented in any way
within the firmware description tables: i.e. we cannot play the fw_devlink
card and enjoy correct sequencing out of the box.

With this series we remove the ugly register_while_probing trick and
introduce some basic mechanism to allow the probe to be deferred until the
underlying transport has probed and it is fully operational so as that can
be used as a supplier device. This is obtained by:

 - moving the problematic platform driver registration away from the probe
   into its own module_init/exit

 - adding a few common well-known optional helpers that can be invoked
   to retrieve the supplier reference, if ready, OR defer the probe when
   neeeded.

Instead, we do NOT introduce in this series (as we attempted in the RFC)
a mechanism to support multiple instance probing also for optee and virtio
transports, because there is currently NO possible way to bind such probed
transport driver instances to the related SCMI instances, so that this
would narrow down the applicability of this multiple instance scenario to
the case in which each underlying SCMI server instance is setup in exactly
the same way. (same protocols for each instance node)

Based on v7.1-rc2

Tested on:
 - an emulated environment against a mock SCMI Server (virtio)
 - a QEMU based setup against SCP-based server running in OPTEE (optee)
 - JUNO with the standard SCP reference firmware (mailbox)
 - RADXA ROCK_5B with Rockchip fw (smc) 

Thanks,
Cristian

[1]: https://lore.kernel.org/arm-scmi/20240812173340.3912830-1-cristian.marussi@arm.com/
[2]: https://lore.kernel.org/lkml/aaA6t-J2gRy3dE1_@pluto/
[3]: https://lore.kernel.org/all/ad9cglZCwtsVsGmq@monoceros/

---
v1 -> v2
 - fixed __MUTEX_INITILIAZER() usage
 - reworked supplier state machine
 - introduce common transport_supplier logic
 - get rid of init/cleanup wrappers
 - use common generic supplier definitions in virtio/optee
 - optee: use proper barrier on scmi_optee_agent
 - virtio: fixed possible race between supplier made available
   and scmi_dev made visible
 - virtio: restored initial virtio_device_ready() logic
 - virtio: issue a proper reset device on probe failure

Cristian Marussi (4):
  firmware: arm_scmi: Add transport instance handles
  firmware: arm_scmi: Add a generic transport supplier
  firmware: arm_scmi: virtio: Rework transport probe sequence
  firmware: arm_scmi: optee: Rework transport probe sequence

 drivers/firmware/arm_scmi/common.h            | 163 +++++++++++++++++-
 drivers/firmware/arm_scmi/transports/optee.c  |  46 +++--
 drivers/firmware/arm_scmi/transports/virtio.c |  52 +++++-
 3 files changed, 238 insertions(+), 23 deletions(-)

-- 
2.53.0


