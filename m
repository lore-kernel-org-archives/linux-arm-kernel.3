Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902E6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 08:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4pHi/FEtHCt4ubT3pbTp0q+oOuJdE2tu5cdEdTTzS58=; b=N1VSk33AMmvvpn
	9U8lMJy8dMmHq41Y+aInX+pfEAOp+YGIY9c4vzDCFeP/4dIZj8mEuE5C4wQClEzppD3WaMtFqvVBv
	JQr0QmEIrYBQHMfRhI7ft1noRfOMdC2gZhvThtgdGSwPWfuLuvJKfHSNBJLQCBdKDi9vV1EbMUxMu
	nK3G1xTaDONNjfL3wm8robDntW/z2XFERozajnJ9o6ifTGuSxCOndR2y31i1J5kekNvlqYKpqwUrF
	4axlz2WwyBb18Ry9O9DfShGmnk/K2Y0ulbD6fW9C6QnjvaBPWUznZjX1DuNK8mLBIpx7JcWZ7wOhQ
	rLadHn3aluDw8jY2V45Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkWw-00000001ei8-2nRO;
	Thu, 09 Jul 2026 08:54:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkV9-00000001aWi-3621
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 08:52:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 771CA418FE;
	Thu,  9 Jul 2026 08:52:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C904F1F000E9;
	Thu,  9 Jul 2026 08:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783587179;
	bh=4pHi/FEtHCt4ubT3pbTp0q+oOuJdE2tu5cdEdTTzS58=;
	h=From:Subject:Date:To:Cc;
	b=IryddNTd3bLohHDmkx9Mv3cA1UXMpRpkCGO9zO0y+Me64nCocYWQL3wz/4YePBCWV
	 JC6o44rG7aqiexp1Jo1Cv292jfzMtY9lEu4DlNLDMTT2gozHXGCSe6SDWVEGYJgnl6
	 qB2rBF1hVtDnc39gGqKhlDOyEpA1XXBpLRzJ3+GTh949fP7NDpfi9duUQhXRcGAe9R
	 ZllKfWKiGWUkuhIqxuRuLfkdB0gDH5kaqCqUYaY/NgslvBtWUHwD0oLJ2I5rBxDgyD
	 JNpEk5uu4OFFIIPXpGGSerZEs+OW85xs3zn0AcPrWyf5paO0yQZtzKgzC2gqr34w11
	 u7Cflf1Io2B8w==
From: Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v5 00/16] firmware: arm_scmi: Fix SCMI core cleanup paths
Date: Thu, 09 Jul 2026 09:52:24 +0100
Message-Id: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE5hT2oC/2XO0Y7CIBAF0F8xPC8GmELFJ//DGAN0UFxtDWijM
 f13QTdZDY83M/fMPEjCGDCR5exBIo4hhaHPQf7MiNubfoc0dDkTwYRiSmia3Cls3RBx68MNE+0
 MuK6VYBs0JLfOEV+DXFpv3jld7QHdpTBlYx/SZYj318mRl70/HVilj5wy6jUIx1FyrcXqF2OPx
 /kQd6Two/gHWsZrQGSAe4kLKSX4FioAPgGoAciAtAZ1q5Sx3lVA8wksaqApAPBGuE4xq74/mKb
 pCV7X7TiEAQAA
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

Most of these issues were found by Sashiko[1][2] while reviewing the
ACPI SCMI PCC work[3]. They are posted separately because the problems
are independent SCMI core, mailbox and SMC transport cleanup bugs, and do
not depend on the ACPI PCC series.

The series fixes SCMI core and transport lifetime issues around channel
setup, probe failure, notification teardown, protocol-device creation,
driver binding and malformed firmware descriptions.

The fixes tighten ownership and teardown rules for generated SCMI
devices, internal transport devices and transport channels. Internal
transport devices remain hidden from normal SCMI driver binding but can
be found by explicit teardown paths, partially initialized channels are
unwound on setup failures, and IDR/device lifetime races during probe
failure and device unbind are closed.

The series also fixes notifier and notification teardown ordering.
Requested-device notifiers are unregistered before protocol IDRs are
destroyed, RCU protects requested-device protocol lookups, notification
late-init work is quiesced before transport channels are torn down, and
protocol bind failures now drop any SCMI handle acquired before probe.

The mailbox and SMC transport fixes cover setup-failure unwinding and
early callback windows. Transport callbacks can run as soon as mailbox
channels or optional SMC completion IRQs are requested, so channel state
is now published before those callbacks can fire and cleared again on
setup failure.

Most of these issues were found by Sashiko[1][2] while reviewing the ACPI
SCMI PCC work[3]. They are posted separately because the problems are
independent SCMI core, mailbox and virtio transport cleanup bugs, and do
not depend on the ACPI PCC series.

Since I started fixing the initial set of issues pointed by sashiko, more
issues have been identified and now we are v5.

Summary:

- Publish SCMI channel state before mailbox or SMC callbacks can run.
- Quiesce notification late-init work before tearing down channels.
- Clean up TX/RX channels when SCMI channel setup fails midway.
- Free transport resources when IDR insertion fails after channel setup.
- Avoid modifying an IDR while iterating it during channel cleanup.
- Reject out-of-range DT protocol IDs instead of allowing u8 truncation.
- Use the owning channel ID when tearing down shared transport devices.
- Unregister requested-device notifiers before active protocol IDR teardown.
- Protect requested-device protocol lookup with RCU.
- Drop SCMI handles on protocol bind and device-link failures.
- Clear the SystemPower singleton only for the owning SCMI device.
- Fix OF node reference ownership for generated SCMI devices.
- Unwind mailbox channels on TX receiver and P2A receiver setup failures.
- Fix SCMI device lifetime handling around child lookup and bus ID reuse.
- Allow explicit teardown lookup of internal transport devices.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>

--

Changes in v5:
- Added an explicit quiesce step that blocks late-init work before TX/RX
  channels are destroyed(which got accidentally left out of v4)
- Fixed the build break with bisection.
- Link to v4: https://patch.msgid.link/20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org

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
- Dropped virtio channel cleanup as more work may be needed to fix the issues.
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
 drivers/firmware/arm_scmi/driver.c             |  81 ++++++++++-------
 drivers/firmware/arm_scmi/notify.c             |  32 ++++++-
 drivers/firmware/arm_scmi/notify.h             |   1 +
 drivers/firmware/arm_scmi/transports/mailbox.c |  26 ++++--
 drivers/firmware/arm_scmi/transports/smc.c     |  15 ++--
 7 files changed, 183 insertions(+), 89 deletions(-)
---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260629-scmi_core_fixes-da3cd753b4ea


-- 
Regards,
Sudeep


