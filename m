Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBD2C43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m/vPmW68Mm8MPJoTFcuWd7T+2p/M42dSAOH2+LtBZ50=; b=JQRU/JEJ/73nJd
	KdnxDISzzv7FBS3QtIELclnFS75RdVApJDT1HdictoKvJ5lMvh3a6VB7BCwI/lHFl1Cng2jl2YwvL
	/0qrMUfu62qMhG2j8Nzim8U5an4K066hYFQLQ127FafpkGucieWng8bvk8E+uvoZdfpd8ctSNYbel
	yuQAaTbCWYu5iBgipL0KoUCmjZTVRXBjbh+KjvJCjiWBzUiYSywIupfqD8+kJ5dB2SD9Iucg90DZJ
	7Peyw42a7EMJ/tplhsZQxhpgnXgcvNDt/CK16dsxWfSWUQLGj06gBRnznjnT+mVH6HQKcQMOUNiXx
	bsF0nrnoMjvqB3kXq9SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyBc-00000002azH-1RvV;
	Wed, 01 Jul 2026 16:53:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyBb-00000002ayR-1qRC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 16:53:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0CCDB6001D;
	Wed,  1 Jul 2026 16:53:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F6D51F00A3A;
	Wed,  1 Jul 2026 16:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782924796;
	bh=m/vPmW68Mm8MPJoTFcuWd7T+2p/M42dSAOH2+LtBZ50=;
	h=From:Subject:Date:To:Cc;
	b=hemTOLvyTMTjX88+Kyxz+N/FOpuM18KkrpTebVErJJV9slXoEWfrOmTihZpxIdbPp
	 mTo6/S6qaieGRcpqslJu+NpD8gfEzlLXKgfOgu8ekJeUFvd0hN6y3I/FxFXcU1h2B/
	 WhC0Hf+ZWsUCI9hs0AsKlM0xpGTJSIH96zOk7hj70zLT4zCXzR7wJa85iESNfVcmWl
	 cX83m9U8Qx0h3OtAN7knYvaUYveDuAldLaKCG4OzfyEDlJqwc6ksHQs5RfQjEQxCm+
	 ndo2HaY6lqq+LfTsZmVseTh5fySCmjmzNUgI1fh1YjnZLvk/xvi6VyJStjlwImLONq
	 PGghmIo0D7aSw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v2 00/14] firmware: arm_scmi: Fix SCMI core cleanup paths
Date: Wed, 01 Jul 2026 17:52:21 +0100
Message-Id: <20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMpFRWoC/2WNzQ6CMBCEX4Xs2Zr+CKaefA9DCJQFqkLNLhIN4
 d0t6M3jl5n5ZgZG8shwSmYgnDz7METQuwRcVw4tCl9HBi11JjNtBbveFy4QFo1/IYu6NK4+pqY
 6YAlx9SDcgji65F/mZ3VFN66atdF5HgO9t8tJrb2f3cg/+6SEFI012ilMlbX6fEMa8L4P1EK+L
 MsHk1W+o8EAAAA=
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

This series fixes a set of SCMI core and mailbox transport lifetime issues
found around device creation, channel setup failure, notification teardown
and malformed firmware descriptions.

Most of these issues were found by Sashiko[1][2] while reviewing the ACPI SCMI
PCC work[3]. They are posted separately because the problems are independent
SCMI core and mailbox transport cleanup bugs, and do not depend on the ACPI
PCC series.

Here is the attempt to fix them, some of them can be dropped if it is too
theoretical. I have addressed all the issues that made sense to me at the
time of reading the report.

The fixes tighten ownership and teardown rules for generated SCMI devices,
transport devices and transport channels. They make internal transport
devices reachable by explicit teardown without exposing them to normal SCMI
driver binding, ensure partially initialized channels are unwound on setup
failures, and avoid IDR/device lifetime races during probe failure and device
unbind.

The series also fixes notifier and notification teardown ordering. Requested
device notifiers are unregistered before protocol IDRs are destroyed, RCU is
used around requested-device protocol lookups, and transport callbacks are
stopped before notification state is released.

The mailbox transport fixes cover both setup failure unwinding and an early
interrupt window: mailbox callbacks can run as soon as mbox_request_channel()
binds the client and starts the controller, so the SCMI mailbox transport now
publishes its cinfo before requesting channels.

Fixes tags need to be checked again or even dropped if it is not a stable
material. Just some placeholders that I thought are appropriated are in place.

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
- Publish mailbox cinfo before requesting mailbox channels.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>

[1] https://sashiko.dev/#/patchset/20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com
[2] https://sashiko.dev/#/patchset/20260630-scmi_core_fixes-v1-0-f932c1e51992@kernel.org
[3] https://patch.msgid.link/20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com

---
Changes in v2:
(Mostly addressing the additional issues found by Sashiko)
- Added fixes for IDR mutation during channel cleanup.
- Added SystemPower singleton flag unwind on device creation failure.
- Added validation to skip out-of-range DT protocol IDs.
- Moved notification teardown after transport channel cleanup.
- Published mailbox cinfo before mbox_request_channel() can enable callbacks.
- Link to v1: https://patch.msgid.link/20260630-scmi_core_fixes-v1-0-f932c1e51992@kernel.org

---
Sudeep Holla (14):
      firmware: arm_scmi: Fix OF node reference handling
      firmware: arm_scmi: Fix transport device teardown lookup
      firmware: arm_scmi: Clean up channels on setup failure
      firmware: arm_scmi: Fix SCMI device destroy lifetimes
      firmware: arm_scmi: Free transport channel on IDR failure
      firmware: arm_scmi: Unregister device notifier before IDR teardown
      firmware: arm_scmi: Unwind TX receiver mailbox setup failure
      firmware: arm_scmi: Unwind P2A receiver mailbox setup failure
      firmware: arm_scmi: Protect device request lookup with RCU
      firmware: arm_scmi: Avoid IDR updates while cleaning channels
      firmware: arm_scmi: Clear SystemPower flag on create failure
      firmware: arm_scmi: Reject out of range DT protocol IDs
      firmware: arm_scmi: Stop channels before notification teardown
      firmware: arm_scmi: Publish mailbox cinfo before channel request

 drivers/firmware/arm_scmi/bus.c                | 72 ++++++++++++++++----------
 drivers/firmware/arm_scmi/common.h             |  2 +
 drivers/firmware/arm_scmi/driver.c             | 44 +++++++++-------
 drivers/firmware/arm_scmi/transports/mailbox.c | 26 +++++++---
 4 files changed, 90 insertions(+), 54 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260629-scmi_core_fixes-da3cd753b4ea


-- 
Regards,
Sudeep


