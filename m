Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417ECE6BF22
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 03:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8JV3OFiVr4uMgRxXUTbVtDkf+7kY1SnermFPvu1fgSU=; b=ab2ZzVV8n36LcbpcPy+y5xr/0t
	CNOQZ4z2xlrLQjrYikeF64QZ/YO++3X+YIZ/Tx927jllavhEpZv11Ar5d43KfS6K5Uy2sOP6TE3Jp
	xxWZbvat+mvL3XalQFXt6a5dF7Kz6dHGKSM1orsIuPhXPkBdxWaQbI7UxIYqEOXZJi3c3J3JZRRK/
	2Xj3dE7xBTz+u/dBEWaoTjVGRagKm4p0RB+kMsVHSLtgf3s8rLyfIHT0BgzKLxEemXbLAOSNhoqp4
	y816L4f147hizHFe9lf1HH5el/Z2HOLFN95x05nRv1LJWoE7QU/Z4CkBnrFaiuq3vqwdyktbsAPhd
	/R4iSI0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm1z1-00000002Hcw-3Wq5;
	Sat, 31 Jan 2026 03:49:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm1ys-00000002Hac-170O
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 03:49:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0965140615;
	Sat, 31 Jan 2026 03:49:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1B4AC4CEF1;
	Sat, 31 Jan 2026 03:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769831341;
	bh=ZnVtjaB+DXtgm+WtfVOKX4mVzGawj6NsVWf0IaeHm+Y=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=tawcTe5CkmmWKMMG/5NHyMli2y7uKRmSSwt8LSwaT5KE4DcZfD4TAYlbcgvdqZrFX
	 eL02l9mUKM0CvJmEmkFRiOLLgDkjZsP8VMqcgKFuWNmx9L0Vprd10uigHJ42rWR0OR
	 8NuvIOkYqwQt/odg7Hm6fZB0gFALllIKrhQHtNjcil1PtJUBqqGxy2W2sIFriMH681
	 UtoL98hJDV0aIvxXw0qK8x7FE8ZdzCVWBI9FlTYScFpzuGKr+5PdrHq/gNuJUoicsa
	 y3+I+IczdDTz6whgWHlgcRhFBVqU/Ab7s+0oqn7U3JFrwSkuYicgZ42/fyzQXwF+LC
	 mpY4NHqJDJuOw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF8C4E6BF22;
	Sat, 31 Jan 2026 03:49:01 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Subject: [PATCH v7 0/2] Add Apple Silicon SMC power driver
Date: Sat, 31 Jan 2026 14:48:55 +1100
Message-Id: <20260131-b4-macsmc-power-v7-0-0e3a2da69948@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKh7fWkC/4XN0QqCMBTG8VeRXbc4zu04u+o9oottTh2kky2sE
 N+9KQRRF15+B37/M5Nog7ORnLKZBDu56PyQRnnIiOnU0Frq6rQJA4aQM0E1p70ysTd09A8bqNY
 FFLKyIJqcJDUG27jnVrxc0+5cvPvw2h5MfL1+WvjXmjgFqhRTKJlRKODc9srdjsb3ZG1NYseL5
 AtgHBmWhc7lr8cdj8lXEvOaQwlNxb79sixvIMRzZC4BAAA=
X-Change-ID: 20260125-b4-macsmc-power-bb30389e05f1
To: Sebastian Reichel <sre@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Michael Reeves <michael.reeves077@gmail.com>, 
 Hector Martin <marcan@marcan.st>, Joey Gouly <joey.gouly@arm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769831340; l=3765;
 i=michael.reeves077@gmail.com; s=20260105; h=from:subject:message-id;
 bh=ZnVtjaB+DXtgm+WtfVOKX4mVzGawj6NsVWf0IaeHm+Y=;
 b=y3e/Gh23VNbZ5wtCBNwx9OB/ZNdpir9z25o8Qdz5G2V+AcDIYCVWC9+a2WQLe+YmwZvtcjsUh
 Q2OFRUTcDyVAf9aZ0evT/iqz2DbxPg7oY0oSu9XzouHEfCOlv5cQAgT
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=QIrgWBGCm3LG0YYc6MLCDkwuVXLTGGooVBdWX/KhSiU=
X-Endpoint-Received: by B4 Relay for michael.reeves077@gmail.com/20260105
 with auth_id=591
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_194906_370199_9CCB76CD 
X-CRM114-Status: GOOD (  13.76  )
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
Changes in v7:
- Replace emergency_sync() with hw_protection_trigger() to enable use as a module
- Link to v6: https://lore.kernel.org/r/20260126-b4-macsmc-power-v6-0-9861d4070f92@gmail.com

Changes in v6:
- Add FS header include for emergency_sync()
- Link to v5: https://lore.kernel.org/r/20260126-b4-macsmc-power-v5-0-302462673b18@gmail.com

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
 drivers/power/supply/macsmc-power.c | 855 ++++++++++++++++++++++++++++++++++++
 5 files changed, 869 insertions(+)
---
base-commit: ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
change-id: 20260125-b4-macsmc-power-bb30389e05f1

Best regards,
-- 
Michael Reeves <michael.reeves077@gmail.com>



