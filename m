Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C98E68165
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 10:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8JV3OFiVr4uMgRxXUTbVtDkf+7kY1SnermFPvu1fgSU=; b=kRh0+WIRCz1uWW1tJlKlX1I+2N
	LgQ4KP9oz0SBpmHXsMKtA94DyE4usU3S63Yk0Jj5pvqQ/iuLV4cPwRyXLjj74cZDoxU6y6DmVufdx
	IPQEhvQrlWpffuG6ZpO/iDw40dtd/BBZjkKkLapjAJmKhM9o2vSSBmthx8xBPfES0YMJm4eNKTER8
	PocWmBb2nuasjravsA17C59/lHiMrzir19GJC9FhWiW4w6ZOl2mrw36xQSa0r5bwp0JZ6UoHdWNsv
	FMpWecpnQmA5XcQLvai27nGUiolSfYWxYMGUvnLVChjLyH92hgjG88ePGdK50wfqKJzQaduGyGq8I
	kB8N32bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsIcU-000000083Qb-0pmT;
	Tue, 17 Feb 2026 10:47:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsIcL-000000083N1-3w5Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 10:47:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AE7D643B49;
	Tue, 17 Feb 2026 10:47:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C695C19424;
	Tue, 17 Feb 2026 10:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771325264;
	bh=c6GRKyp+ub8bww9RLohGzR3byu56kw5PGCaK0azhERs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=QIq6ay2130TVF3AdaegSvCdbaxbIVwngwbk1gDyDoWm+Iw8qWIT0hMTVUyWQUDr5n
	 ugVj16i+8kF0XXQjIFr0xAJTSSiZtu13Tsz9KU0tAW/zQevyH/HJr7DLw6LjGPOYNL
	 OEe9jSDRMCVbFcpuaOGZBl+YHddaFFflEDxTYWMnjdeN2GiMlZNOXfIdbRtauxrm//
	 xrmPaH/aKx9BmU/COylkAl7M7+izipDGChAsnyc3at7IWx3DtIUyoQY/9iZ65jxb2B
	 m1YGsapuT3MzOyYE0TSGJUa5JxsRCaQz72v1+yUMGbZgbNdVF5471i6IUB5Wi3Wlbs
	 nDtv3ZzCRO4Dg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7476AE68169;
	Tue, 17 Feb 2026 10:47:44 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Subject: [PATCH RESEND v7 0/2] Add Apple Silicon SMC power driver
Date: Tue, 17 Feb 2026 21:47:24 +1100
Message-Id: <20260217-b4-macsmc-power-v7-0-4a4d63664362@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Sebastian Reichel <sre@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Michael Reeves <michael.reeves077@gmail.com>, 
 Hector Martin <marcan@marcan.st>, Joey Gouly <joey.gouly@arm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771325263; l=3764;
 i=michael.reeves077@gmail.com; s=20260105; h=from:subject:message-id;
 bh=c6GRKyp+ub8bww9RLohGzR3byu56kw5PGCaK0azhERs=;
 b=+EKy2InD/QKU0nAyC++hiJNp5qQ1ruDm8oX7fvWp694R1Fa/WEYQrPW8YDVwPVgHloCf46eNm
 IIGwOWA3X27BrR5txas6JdNB6lyOMg9quuFgFbp1WN/96Y8r6P+5Tm1
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=QIrgWBGCm3LG0YYc6MLCDkwuVXLTGGooVBdWX/KhSiU=
X-Endpoint-Received: by B4 Relay for michael.reeves077@gmail.com/20260105
 with auth_id=591
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_024746_023875_2298E146 
X-CRM114-Status: GOOD (  13.78  )
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



