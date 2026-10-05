Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7425CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 09:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SlhXGKnnb8pkhO4y+zbXadXuhtCrpqlVnwCc1gI5uHM=; b=QVpAOIlUeDpykW
	P3tvnw9/TuD5y0tegspTolvFhGBFT+O4JX9+2AIPjR6Dga/2r86XBeHEvL7peUsoad+2lLy5dvN6S
	O1jIB10rjQTeDFw+6WpId1fo6fUPSzxIEb3x4zwUg1Xzrqpu/bDCNVdj+5s/6dZ4GZjR7O7R8+sQF
	dUYImo4eNHdzIwUoP5OkZBW1U7jvbxAmq0nGw1lVcIfv+X1jxVi476HfxyCGYpAbHCedZ237zsI6h
	u/bx+3TfhGQHXPCDOKRgsAXWtlbEsgrD5cKDqTdHjRunMrJpf67rc/F5IN5BZYr/3wmmEqg2GT6+/
	KW7GzXTsijkV+tJE4COQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDees-0000000Fvm2-1lL1;
	Mon, 05 Oct 2026 09:06:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDeer-0000000Fvlq-2rBw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 09:06:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1DEF644038;
	Mon,  5 Oct 2026 09:06:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E2461F0089A;
	Mon,  5 Oct 2026 09:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791191213;
	bh=SlhXGKnnb8pkhO4y+zbXadXuhtCrpqlVnwCc1gI5uHM=;
	h=From:Subject:Date:To:Cc;
	b=Tow8CwkUFBMBAh7+TdtIPzcALsDlLwpqGDEcsyyNKPPeUcv+v1BsgAX3FPPgQ/Pne
	 ZzENzdRiY5O1FU7YaFcVheh9ts7OuNKOEaHIHzHMUTV56HVuH0V/KCHpVFYlReePlD
	 rhT/cPgFsdUwGHbP6H0fdHgVOBZEEpV+jQ/HsxBLAppWJjU0UFPlZFpWB+LD1WoxWz
	 7viAKx3sl7ADYHY/BFW67vCOe5xMX+32+m8oUimkKzg7A3O4VxjjW+5oMJU/LdS9cp
	 spvrc3KCgfcu+Oy1Nk3FFgs4eKotnoCKCZAYjEU+/gSGIrFR2m14x4BNQUeZrId18/
	 Xz/naMtFszbGg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v2 0/4] firmware: arm_scmi: Some fixes to address conflicts
 with fw_devlink
Date: Mon, 05 Oct 2026 10:04:31 +0100
Message-Id: <20261005-scmi_bus_fixes-v2-0-34a51338875a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACFow2oC/3WNwQ6CMBBEf4Xs2Zq2RARP/ochhJYFVgVMF4iG9
 N9t8ezxZebNbMDoCBkuyQYOV2KaxgD6kIDt67FDQU1g0FJnSkot2A5UmYWrlt7IQhWmxbxJbY4
 agvRyuAfBuZU/5sXc0c5xJTZ64nlyn/1xVbH3d3xVQoo8K07W1CZt8Xx9oBvxeZxcB6X3/gthT
 gd8vwAAAA==
X-Change-ID: 20261002-scmi_bus_fixes-19bfe8d3c8e2
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, Peng Fan <peng.fan@nxp.com>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, imx@lists.linux.dev, 
 linux-gpio@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
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

Peng’s [1] identified the problem of multiple SCMI devices sharing one
protocol fwnode. His [2] shows the consequence: the first device owns
the fwnode but does not bind, so fw_devlink can leave consumers deferred
even when another device binds successfully.

This four-patch series reduces those cases within SCMI. It prevents
protocol device creation in exclusive raw mode, stops treating core
created standard devices as driver owned requests, and makes the i.MX
pinctrl driver match the standard `pinctrl` device instead of creating
a second device for the same fwnode. It also omits the `perf` device
when the firmware node does not describe a performance domain provider,
without changing `cpufreq` device creation. IIO/HWMON don't have any
fw_devlink dependency and having two devices shouldn't be an issue.

These changes address the SCMI cases above; they do not provide a
general driver core solution for devices that share a fwnode.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>

[1] https://lore.kernel.org/all/20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com
[2] https://lore.kernel.org/all/20260928-driver-core-v1-1-0846bb8e0f32@nxp.com

---
Changes in v2:
- Dropped "pinctrl-imx" from scmi_std_id_table array correctly this time.
- Updated the trailers received so far(Thanks Peng Fan and Hans de Goede)
- Link to v1: https://patch.msgid.link/20261002-scmi_bus_fixes-v1-0-8695cbab3fe7@kernel.org

---
Sudeep Holla (4):
      firmware: arm_scmi: Avoid protocol devices in exclusive raw mode
      firmware: arm_scmi: Skip requests for standard protocol devices
      pinctrl: imx: Match the standard SCMI pinctrl device
      firmware: arm_scmi: Skip unused performance-domain devices

 drivers/firmware/arm_scmi/bus.c              | 106 +++++++++++++++++----------
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c |   2 +-
 2 files changed, 67 insertions(+), 41 deletions(-)
---
base-commit: aac4e67d6eb93118cfa70c6562b5f9c81a7042ef
change-id: 20261002-scmi_bus_fixes-19bfe8d3c8e2


-- 
Regards,
Sudeep


