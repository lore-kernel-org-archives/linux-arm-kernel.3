Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9325DD7237C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 23:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VjW571ELP7/NDzHe9sCaZ2rgVahPJki75XgrUi41GVk=; b=lY2OdM77Wh1Ytc/r4gkY/paL8s
	YPcuMKMOheKxZB+XSg7ExOK2IGGnHDCT+TV98KJ9YB6+7Y8eD4iCzOR8bI99hM/F83JdLzmzVJomP
	Vdc/+FdZ5qTKw3XTtukbjx+kP+dBJ+uAYwSlommn13pPhRttsJz4mfy61A5zDzPinp74rwXLh2Ky7
	LPwAcktB9lbJprPh5IVC14PCkyaBCFiF1p1V/xr7h03H9UM5KZYzpJVR7SxxGJOCK++duRvW1yL+a
	RYo1RIiQMZvvCv0E+uKMCiA3U//WD+o/zjRZuKF9frVK6GPd8ji/07D7im/OMar5S/hJtQCWtFpnX
	nKHzkAqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk9Lq-0000000BfUE-3k5g;
	Sun, 25 Jan 2026 23:17:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk9Ln-0000000BfTf-3Rx3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 23:17:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F0C4B406A6;
	Sun, 25 Jan 2026 23:16:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6694C4CEF1;
	Sun, 25 Jan 2026 23:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769383018;
	bh=xGdA9FNu7g2hehmu1Y6kvytIzbxTCM/CF+5TVtvEPsw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=kRAIIKf8F7+Hf/Oyc7W7OWFEPuXVwC9bbZCP6AlF9z7h/oszpR6UYU59U5YW2tcFz
	 GXAScgBnMm2UIOvEqGWe739nDLzPxyj2U8sA9NNgTQxRYUuZE1DAZq2MN+VZXgFfCW
	 ZwN6WJr37qOTekUu2IXbD+2ZMTYHfqitC0Ch6TZ0BjyLtRCtVKtRRiNw1pKzdr66rU
	 WgJ+la+t6S9tUWt+efthvofs0E1SHWcS0irkg1QLiplMbk51h7u5HQ7G9EHOHmuJ0W
	 Bfb2RZToAta2z1/0nSD55jnBhcmKPzjv6UaiwIN0luBUjoy04RRt24opZJJelr3itM
	 hsHL+n6VC8YFA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB48CE63CA8;
	Sun, 25 Jan 2026 23:16:58 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Subject: [PATCH v6 0/2] Add Apple Silicon SMC power driver
Date: Mon, 26 Jan 2026 10:16:55 +1100
Message-Id: <20260126-b4-macsmc-power-v6-0-9861d4070f92@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGekdmkC/4WNywrCMBQFf6VkbSS9eVi78j/ERRLT9oJpSiJRK
 f1304IguHA5B2bOTJKL6BJpq5lElzFhGAuoXUXsoMfeUbwWJsBAsRokNYJ6bZO3dAoPF6kxnPH
 m6JjsalKsKboOn1vxfCk8YLqH+NoOsljXT0v9tLKgjGoNWjVgtZLs1HuNt70NnqytLP/4svicg
 VCgDtzUzbe/LMsbD/WZLu4AAAA=
X-Change-ID: 20260125-b4-macsmc-power-bb30389e05f1
To: Sebastian Reichel <sre@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Michael Reeves <michael.reeves077@gmail.com>, 
 Hector Martin <marcan@marcan.st>, Joey Gouly <joey.gouly@arm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769383017; l=3570;
 i=michael.reeves077@gmail.com; s=20260105; h=from:subject:message-id;
 bh=xGdA9FNu7g2hehmu1Y6kvytIzbxTCM/CF+5TVtvEPsw=;
 b=k+GhSxjeWGPBPurpla2kQgixNOH1PggMJrkTx/SBwo2oE017phmkRmbn4Il1yGZuUmFL0TmSi
 XWINHl9Jow8DwCYt3T6ChPXTmXFDAx46zpkrjsDjQFPkjy1l+YkN957
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=QIrgWBGCm3LG0YYc6MLCDkwuVXLTGGooVBdWX/KhSiU=
X-Endpoint-Received: by B4 Relay for michael.reeves077@gmail.com/20260105
 with auth_id=591
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_151659_947116_381FFBC4 
X-CRM114-Status: GOOD (  14.44  )
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
 drivers/power/supply/macsmc-power.c | 852 ++++++++++++++++++++++++++++++++++++
 5 files changed, 866 insertions(+)
---
base-commit: ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
change-id: 20260125-b4-macsmc-power-bb30389e05f1

Best regards,
-- 
Michael Reeves <michael.reeves077@gmail.com>



