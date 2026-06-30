Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352A4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 09:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/MYeLos3b+bdqSNtCHAINAEd4dnwVk65exzwxfrp7cE=; b=yb58xWRSoUjKWF
	5rVZFYRja+O1zifxFqqu3T8aYQc8lj5HEGCnziv/SfT+pqAQ6DteVES6gkD2HxtavJiQyih9IWjut
	wzZ3vEjYt8Zu0MsDADTErT2E8rIVnZ2wLQlAfuubN3BwYUArSMIyFfXWU3NgDi85S+D5q4HDQ8wjH
	xRHfTSq+wDffRWhljObFoDSFoROhcC4dTKxHQokYXApMcBiyktjBIuy2+80hnXafQ7iLpzyC6OOMg
	vjQ1H4tvTADQ9pyrJFQ2E+TTdpetmqtP9cgcdOJGhLNqF6NSpgCsHEU8hwvryuWEvWhqKkXkMFRUZ
	DbLvl72jxB+hWiWAqvTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUQS-0000000GLB2-0BoA;
	Tue, 30 Jun 2026 09:06:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUQP-0000000GL9o-2KXR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 09:06:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F092243C3F;
	Tue, 30 Jun 2026 09:06:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 032A11F000E9;
	Tue, 30 Jun 2026 09:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782810396;
	bh=/MYeLos3b+bdqSNtCHAINAEd4dnwVk65exzwxfrp7cE=;
	h=From:Subject:Date:To:Cc;
	b=VmaDzfee8n6+IOjvcGhUjci2utK8kIaKaXDFyPy/O6GEB7DSJA+wUeD5VuLq71PjP
	 8MSl04l6PJLhaOFOQtfm+CyA/DE1DeNhalulRAyfPl5T11RG89CO8IHBnYkaodu1C/
	 er2pmw6j/oZC0LkZWjLU904hg9AS9xaZcFPN6pzwGlhsNsUwzXkhq7r5FSYs6t3ssB
	 oZyfGRcC6nGFrs5Gq+LDRUtk65RzPCVsKfYS7eAMQPMzoXZjeN08l9qkScd2pvokQn
	 ScIBJls9P9+VgpootFSd6J2M9X3B4/LLXxUrDXDOIzDMhz+u4B49GDe24zJ6fULISU
	 qhOljQo1/20Xw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH 0/9] firmware: arm_scmi: Fix SCMI core cleanup paths
Date: Tue, 30 Jun 2026 10:05:56 +0100
Message-Id: <20260630-scmi_core_fixes-v1-0-f932c1e51992@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPiGQ2oC/yXMUQqDMBCE4avIPhuwiVraq4hI3Ex1C9WS1VIQ7
 25qHz+GfzZSRIHSPdso4iMq85RwyTPi0U8DjIRksoWti9rejPJLOp4juod8oSZ4x+Faub6Ep1S
 9I84hRU37t679E7z8bmjfD14RXyBzAAAA
X-Change-ID: 20260629-scmi_core_fixes-da3cd753b4ea
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>, Sashiko <sashiko-bot@kernel.org>
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
found around device creation, channel setup failure and teardown paths.
They were mostly found by Sashiko[1] when reviewing some other series.
Posting these separately as the issues or the fixes are not related to [2]

Here is the attempt to fix them, some of them can be dropped if it is too
theoretical. I have addressed all the issues that made sense to me at the
time of reading the report.

The fixes tighten ownership of OF node references, make transport devices
reachable by explicit teardown without exposing them to normal SCMI driver
binding, and ensure partially initialized channels are unwound consistently on
probe/setup failures. The series also fixes races around requested-device
notifier teardown and RCU-protected protocol lookups.

The mailbox transport fixes are split by the feature that introduced the
leaking channel: one for unidirectional mailbox channels and one for P2A
completion channels.

Summary:

- Fix OF node reference ownership for generated SCMI devices.
- Allow explicit teardown lookup of internal transport devices.
- Clean up TX/RX channels when SCMI channel setup fails midway.
- Fix SCMI device lifetime handling around child lookup and bus ID reuse.
- Free transport resources when IDR insertion fails after channel setup.
- Unregister requested-device notifier before active protocol IDR teardown.
- Unwind mailbox channels on TX receiver and P2A receiver setup failures.
- Protect requested-device protocol lookup with RCU.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

[1] https://sashiko.dev/#/patchset/20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com
[2] https://patch.msgid.link/20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com

---
Sudeep Holla (9):
      firmware: arm_scmi: Fix OF node reference handling
      firmware: arm_scmi: Fix transport device teardown lookup
      firmware: arm_scmi: Clean up channels on setup failure
      firmware: arm_scmi: Fix SCMI device destroy lifetimes
      firmware: arm_scmi: Free transport channel on IDR failure
      firmware: arm_scmi: Unregister device notifier before IDR teardown
      firmware: arm_scmi: Unwind TX receiver mailbox setup failure
      firmware: arm_scmi: Unwind P2A receiver mailbox setup failure
      firmware: arm_scmi: Protect device request lookup with RCU

 drivers/firmware/arm_scmi/bus.c                | 50 +++++++++++++++++---------
 drivers/firmware/arm_scmi/common.h             |  2 ++
 drivers/firmware/arm_scmi/driver.c             | 21 ++++++-----
 drivers/firmware/arm_scmi/transports/mailbox.c | 12 +++++--
 4 files changed, 57 insertions(+), 28 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260629-scmi_core_fixes-da3cd753b4ea


-- 
Regards,
Sudeep


