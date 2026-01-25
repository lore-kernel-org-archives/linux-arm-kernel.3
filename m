Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E433E63CA2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 13:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WYM2/tyDJvkU9oRMFup2XMiP29fwaZMSMV7+h2o4xyM=; b=V8lodgM4D/6YVH14MDdmDx5eB9
	tXn7PczXZegbm97Kbq8ylvHrMa0cP9e53xqlWBDwv95i+uQELkxKOMdolfFnFS4f7vVw12u5kmc54
	jxTXFpZCuDsEGqqgEyHNHlD1+w1+NkO8q/IreRpVvv1D67GFy88bRb3Ck2P98uqaOdcFkAqKGbxom
	PAN2BRUyj428kEHj0b5Pm/zKKHRivA+HMSWRcESBF0+m4lB2of7iMXKpnCL7DDsCHYPq3/rPY5cQ0
	SKnRKlrOl8yGyv2EBCFstmHU5H/GlM7SNMeLOsKnZoc50Eu0zvootWHBW1E56XWhcxsuPaDPP2zq/
	fZhMlXeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjzwb-0000000BBmv-0uii;
	Sun, 25 Jan 2026 13:14:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjzwY-0000000BBm2-15Y8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 13:14:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 53482600C3;
	Sun, 25 Jan 2026 13:14:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1BCDC4CEF1;
	Sun, 25 Jan 2026 13:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769346857;
	bh=JgxmdDWn5iWIrp1gT9mGTXjqUcTFbbNWhNSXuLV/Edc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=It2xrISjtGIVITTpHP9upS2IZpJ2aIOlT0EKaQQnyvAS6Gc1lzP5MVMign7QbD/DE
	 xa0464kzqi33uGCB/8eUYFPkfzuyVg9cS9JTmLAx5CxLwXvGhmdpYXd7WM+fX1UT4x
	 V+syBK9urUWMr8RwnuC87tf8j9IvGLS4Z3Ls6OXTYukMTehhdMKih8gUg4hzw1IHTw
	 lr/BZS6eI7/uUJFeQ0c7DR762VbPtMPXIRRCsiDgzcoxXfvkOX3FzI2vrvt9CkiNsm
	 SilW/4a8zIVVUexwVygqsmhCBawFR5Hrwu7MFJXdfhSoQxVNZRpw7uVTHPTvjTVUqS
	 vMYPi/ZTQ+SJw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E87DEE63CA2;
	Sun, 25 Jan 2026 13:14:16 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Subject: [PATCH v5 0/2] Add Apple Silicon SMC power driver
Date: Mon, 26 Jan 2026 00:14:10 +1100
Message-Id: <20260126-b4-macsmc-power-v5-0-302462673b18@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACMXdmkC/2WNQQ6CMBBFr0Jm7ZhSaIOuvIdhMdQBJrGUtAY1h
 LtbSVy5fC/576+QOAonOBcrRF4kSZgymEMBbqRpYJRbZtBKW1Vqg12NnlzyDufw5IhdV6mqObE
 yfQl5NUfu5bUXr23mUdIjxPd+sNRf+2vZv9ZSo0IiTbbRjqxRl8GT3I8ueGi3bfsAcw/EFK4AA
 AA=
X-Change-ID: 20260125-b4-macsmc-power-bb30389e05f1
To: Sebastian Reichel <sre@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Michael Reeves <michael.reeves077@gmail.com>, 
 Hector Martin <marcan@marcan.st>, Joey Gouly <joey.gouly@arm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769346855; l=3412;
 i=michael.reeves077@gmail.com; s=20260105; h=from:subject:message-id;
 bh=JgxmdDWn5iWIrp1gT9mGTXjqUcTFbbNWhNSXuLV/Edc=;
 b=yS64ZpLJAb/0AiUKJMZBUywrNUrPEEujJVRC9JJq7W97Mvzr4p4qqJh8Na9oefnGtAKicSQLu
 U/71E7LI0KHAw7RCkR9TsabO/3z0vBoDyjZR0unceYMSGNxz5TaX8Aq
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=QIrgWBGCm3LG0YYc6MLCDkwuVXLTGGooVBdWX/KhSiU=
X-Endpoint-Received: by B4 Relay for michael.reeves077@gmail.com/20260105
 with auth_id=591
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
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
Reply-To: michael.reeves077@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This series adds a power supply driver for the Apple SMC found on
Apple Silicon devices. This allows the kernel to report AC status,
battery charging status, and power metrics, and modify the charging
behaviour.

The first patch adds the driver itself, and the second patch wires it
up to the MFD core.

The driver is based on an original out-of-tree implementation by
Hector Martin. It has been refactored by myself for upstream inclusion, 
including support for newer SMC firmwares, devices without batteries,
dynamic property detection and improved state management, among other
things.

This series is based ontop of the current linux-next at time of writing,
the exact commit hash is listed below.

Tested on: Apple M3 (MacBook Air, J613)

Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
---
Changes in v5:
- Readd cover subject that mistakenly got dropped, apologies.
- Link to v4: https://lore.kernel.org/r/20260126-b4-macsmc-power-v4-0-aa2a682ca650@gmail.com

Changes in v4:
- Restore Hector Martin as primary author for the series.
- Restore downstream Co-developed-by and Signed-off-by tags.
- Add Reviewed-by: Sven Peter <sven@kernel.org>.
- Simplify MFD patch authorship and remove redundant tags.
- Fix probe return value being overwritten by devm_work_autocancel.
- Return -ENODEV in probe if neither battery nor AC adapter are found.
- Add bounds check for nprops against MACSMC_MAX_BATT_PROPS.
- Refactor macsmc_battery_set_charge_behaviour to remove unnecessary resets.
- Improve critical_work shutdown flags and remove return.
- Add comments explaining SMC key firmware history and flag meanings.
- Clarify event ID descriptions and restore BSFC flag comments.
- Remove redundant dev_dbg logs for missing battery or AC.
- Link to v3: https://lore.kernel.org/r/20260115-b4-macsmc-power-v3-0-c236e09874be@gmail.com

Changes in v3:
- Rebase on top of latest linux-next
- Drop charge control threshold properties.
- Switch to devm_work_autocancel() for critical work.
- Add platform ID table and remove MODULE_ALIAS.
- Simplify property array management in struct macsmc_power.
- Improve probe error handling and device pointer usage.
- Minor style and indentation fixes.
- Link to v2: https://lore.kernel.org/r/20260109-b4-macsmc-power-v2-0-93818f1e7d62@gmail.com

Changes in v2:
- Added Reviewed-by: Neal Gompa <neal@gompa.dev> to all patches.
- Fixed Makefile alignment by using tabs for the macsmc-power entry.
- Upgraded physical battery exhaustion log level to EMERG.
- Downgraded software-triggered orderly poweroff log level to CRIT.
- Added check for CHIS key to skip AC registration on desktop models.
- Link to v1: https://lore.kernel.org/r/20260105-b4-macsmc-power-v1-0-62954c42a555@gmail.com

---
Hector Martin (2):
      power: supply: Add macsmc-power driver for Apple Silicon
      mfd: macsmc: Wire up Apple SMC power driver

 MAINTAINERS                         |   1 +
 drivers/mfd/macsmc.c                |   1 +
 drivers/power/supply/Kconfig        |  11 +
 drivers/power/supply/Makefile       |   1 +
 drivers/power/supply/macsmc-power.c | 851 ++++++++++++++++++++++++++++++++++++
 5 files changed, 865 insertions(+)
---
base-commit: ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
change-id: 20260125-b4-macsmc-power-bb30389e05f1

Best regards,
-- 
Michael Reeves <michael.reeves077@gmail.com>



