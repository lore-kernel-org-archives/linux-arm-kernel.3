Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75AA2C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 09:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qaL7SCOsIWa8OMBTioFs52/xDHCcghmWNV3Dbf4cTi4=; b=zTz7ehUSSO8IkQ
	5Pbr/PXA7mQ/VDY8gRq0x/3k1M9FnMc9mHmx4hJkEg3vqTSvrU+ukLgIV/mTyX6xbdqkpovZ+gPdm
	S2whb7Qbkd36jW7/Yu92bn7rKi4fF5J2WsD6pa2u8g6oWNc1QKJxXYttFdzK4zO4MNG6hxTjH7/Ij
	kmDGwZ/+H5jnxq4a+GfhavHONmpP9WAVs0LzlZyh4rxQnvD38fIR0gZfyYOe7cOGpeUuSiPbw/zHX
	NlbnIA43fRxgi3C9gHz5/moUaVbR1VUtlQBdIFy2UWtmTpjJgQRBTmt28M7Za9TkcymIH9+K3MeZo
	HHQdOayoG4yzmFBeF+7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whO8r-0000000Gfv5-0U5P;
	Wed, 08 Jul 2026 09:00:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whO8o-0000000GfuY-1hix
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 09:00:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6EFF26001A;
	Wed,  8 Jul 2026 09:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 928061F000E9;
	Wed,  8 Jul 2026 09:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783501225;
	bh=qaL7SCOsIWa8OMBTioFs52/xDHCcghmWNV3Dbf4cTi4=;
	h=From:Subject:Date:To:Cc;
	b=i/b0qy3EnvHKIXY5PtMjKwrPTUuWaTMHoB+n8xJdyOuPJnhK1Be9C9bE4Pu3n1Tkt
	 qxECP03purk95xMnJGtMnTJTWvmpNAuqCdAh8+y+OuVx1nhpLqgMcv8K+G4gFXECcn
	 gjYosISKCpmZhaz/yXliTAUn8jAM1Tqk9tY3N6QaGVF3bxkHpNeY1eg6LmMa/NqQv0
	 O+5wsT1BCFAejcUkRhVTREE98Ga1hk9i99jcXDVW3b/tjGNESF5xIFw2MOc7ISsa46
	 3BcR2OSosJ2CofE30Nn8NzxwXsCwo9mgulIIrPv3PjLAPLSBznGIgPCnfqqoKwgOiu
	 gygXHuDbW2dZQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v4 00/16] firmware: arm_scmi: Fix SCMI core cleanup paths
Date: Wed, 08 Jul 2026 09:59:56 +0100
Message-Id: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJARTmoC/2XNTQ6CMBAF4KuYrq1pOxSsK+9hDCllCvUHTItEQ
 7i7BU3UsHyZ974ZSEDvMJDdaiAeexdc28SQrFfE1LqpkLoyZiKYSFkqFA3m6nLTesyte2CgpQZ
 TZhKKBDWJq5vH+RBHh+M7h3txQtNNzNSoXeha/5xf9nzqfXRgC73nlFGrQBiOkisl9mf0DV42r
 a/IxPfiC2SMLwERAW4lbqWUYDNYAPALwBKACMhCo8rSVBfW/AHjOL4Aurp49EMBAAA=
X-Change-ID: 20260629-scmi_core_fixes-da3cd753b4ea
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2
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

This series fixes a set of SCMI core and transport lifetime issues found
around device creation, channel setup failure, notification teardown,
driver binding and malformed firmware descriptions.

Most of these issues were found by Sashiko[1][2] while reviewing the ACPI
SCMI PCC work[3]. They are posted separately because the problems are
independent SCMI core, mailbox and virtio transport cleanup bugs, and do
not depend on the ACPI PCC series.

Since I started fixing the initial set of issues pointed by sashiko, more
issues have been identified and hopefully with v4, it really calms down.
I can only wish 😄 as I said the same for v3.

Fixes tags need to be checked again or even dropped if it is not a stable
material. Just some placeholders that I thought are appropriated are in place.

The fixes tighten ownership and teardown rules for generated SCMI devices,
transport devices and transport channels. They make internal transport
devices reachable by explicit teardown without exposing them to normal SCMI
driver binding, ensure partially initialized channels are unwound on setup
failures, and avoid IDR/device lifetime races during probe failure and
device unbind.

The series also fixes notifier and notification teardown ordering.
Requested device notifiers are unregistered before protocol IDRs are
destroyed, RCU is used around requested-device protocol lookups, transport
callbacks are stopped before notification state is released, and protocol
bind failures now drop any SCMI handle acquired before probe.

The mailbox transport fixes cover both setup failure unwinding and an early
interrupt window: mailbox callbacks can run as soon as mbox_request_channel()
binds the client and starts the controller, so the SCMI mailbox transport
now publishes the channel state before requesting channels.

The virtio transport fix clears virtio-owned channel state when SCMI
channels are freed, so devres-managed SCMI message pointers do not survive
across SCMI driver unbind and rebind.

Summary:

- Fix OF node reference ownership for generated SCMI devices.
- Allow explicit teardown lookup of internal transport devices.
- Clean up TX/RX channels when SCMI channel setup fails midway.
- Fix SCMI device lifetime handling around child lookup and bus ID reuse.
- Free transport resources when IDR insertion fails after channel setup.
- Unregister requested-device notifier before active protocol IDR teardown.
- Unwind mailbox channels on TX receiver and P2A receiver setup failures.
- Protect requested-device protocol lookup with RCU.
- Avoid modifying an IDR while iterating it during channel cleanup.
- Clear the SystemPower singleton flag on SCMI device creation failure.
- Reject out-of-range DT protocol IDs instead of allowing u8 truncation.
- Stop transport callbacks before releasing notification state.
- Publish mailbox channel state before requesting mailbox channels.
- Use the owning channel ID when tearing down shared transport devices.
- Drop SCMI handles on protocol bind and device-link failures.
- Clear virtio channel lists when freeing SCMI virtio channels.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>

--

Changes in v4:
- Replaced the SystemPower atomic flag with pointer-based ownership using
  cmpxchg(), preventing delayed release of an old device from clearing a
  newer SystemPower reservation.
- Cancelled pending SCMI notification late-init work before releasing
  notification resources.
- Published SMC transport channel state before requesting the optional
  completion IRQ.
- Added mailbox setup-failure cleanup for early-published transport state and
  devres allocations.
- Dropped virtio channel cleanup as more work may be needed to fix the issues
- Re-ordered the patches to simplify backporting hopefully, not 100% sure yet.
- Link to v3: https://patch.msgid.link/20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org

Changes in v3:
- Added SCMI bus resource release helper so bus IDs are released from
  destroy, register-failure and final-release paths, and cleared after
  release to avoid later double-free.
- Moved SystemPower singleton cleanup into the same resource helper so
  direct driver-core child release also clears the flag.
- Removed the unused mailbox P2A unwind label.
- Published cinfo->handle before transport chan_setup() so early mailbox
  callbacks have a valid SCMI handle.
- Added fix to destroy shared transport devices using cinfo->id instead of
  the IDR iterator key.
- Added SCMI handle cleanup on device_link_add() failure and
  BUS_NOTIFY_DRIVER_NOT_BOUND.
- Added virtio channel cleanup to detach unused virtqueue buffers and clear
  local channel lists across SCMI unbind/rebind.
- Link to v2: https://patch.msgid.link/20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org

Changes in v2:
(Mostly addressing the additional issues found by Sashiko)
- Added fixes for IDR mutation during channel cleanup.
- Added SystemPower singleton flag unwind on device creation failure.
- Added validation to skip out-of-range DT protocol IDs.
- Moved notification teardown after transport channel cleanup.
- Published mailbox cinfo before mbox_request_channel() can enable callbacks.
- Link to v1: https://patch.msgid.link/20260630-scmi_core_fixes-v1-0-f932c1e51992@kernel.org

[1] https://sashiko.dev/#/patchset/20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com
[2] https://sashiko.dev/#/patchset/20260630-scmi_core_fixes-v1-0-f932c1e51992@kernel.org
[3] https://patch.msgid.link/20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com

---
Sudeep Holla (16):
      firmware: arm_scmi: Publish channel state before callbacks
      firmware: arm_scmi: Quiesce notifications before teardown
      firmware: arm_scmi: Clean up channels on setup failure
      firmware: arm_scmi: Free transport channel on IDR failure
      firmware: arm_scmi: Avoid IDR updates while cleaning channels
      firmware: arm_scmi: Reject out of range DT protocol IDs
      firmware: arm_scmi: Use channel ID for transport teardown
      firmware: arm_scmi: Unregister device notifier before IDR teardown
      firmware: arm_scmi: Protect device request lookup with RCU
      firmware: arm_scmi: Drop handle on protocol bind failures
      firmware: arm_scmi: Clear SystemPower flag on create failure
      firmware: arm_scmi: Fix OF node reference handling
      firmware: arm_scmi: Unwind TX receiver mailbox setup failure
      firmware: arm_scmi: Unwind P2A receiver mailbox setup failure
      firmware: arm_scmi: Fix SCMI device destroy lifetimes
      firmware: arm_scmi: Fix transport device teardown lookup

 drivers/firmware/arm_scmi/bus.c                | 115 +++++++++++++++----------
 drivers/firmware/arm_scmi/common.h             |   2 +
 drivers/firmware/arm_scmi/driver.c             |  79 ++++++++++-------
 drivers/firmware/arm_scmi/notify.c             |   2 +
 drivers/firmware/arm_scmi/transports/mailbox.c |  26 ++++--
 drivers/firmware/arm_scmi/transports/smc.c     |  15 ++--
 6 files changed, 151 insertions(+), 88 deletions(-)
---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260629-scmi_core_fixes-da3cd753b4ea


-- 
Regards,
Sudeep


