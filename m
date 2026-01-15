Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4C0D3CCB6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 07:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DTNcX8w5inkglG7AASONBCS3XNs15W7e3MYLcoMxg84=; b=RAxcGRffsf8zU/yqEWiYz9fr34
	Pcq6ZLDqdAjG1GCcoVdJyOOMEFYYinYkVhT1o9qV/DxOLTjAF4kwLewvkKMmruuaqUtswn+soqgIu
	RxIx8+wtOo/kXMF+3WSGlHPm3p5nvkjNniJGQBykNW+XaqVe+gEhEzDthGQMENo0g3ewWnTlPHauj
	vLZ3a8SM7roGivpiX0GTw2LL3Dkd9IE8jNL78izFuP0Dawep5tN+aeILMZVv4l5RJ6cDFwWhne6wR
	gXHGUKESAqbyii4RjbXgKVzAsEt1gZw53jm8S1oM58dkSEMuNgLOtIIhTY7ncNOLW8dtzU00FNjzG
	V9nazrlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgHT5-0000000BuIA-1cqm;
	Thu, 15 Jan 2026 07:08:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgHT0-0000000BuGG-2apN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 07:08:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DC66544216;
	Thu, 15 Jan 2026 07:08:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B037AC116D0;
	Thu, 15 Jan 2026 07:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768460904;
	bh=7ZuDFsWT2gxxq3ujMvtSzPih5aeosnU4qUGhtGU18+o=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=VaOmKxh4tymfaveut3u1VL1+fxvpwKNADofSqFce1tmityltUDF+IAEg7cs88785q
	 zNf/bQF682yFAU7WV3jWlFBkgTjagT9F91E1UJnk56iAtzFdeEhDZuUX94hoWqJXIy
	 r0yK0y9NDAxJ/zWKFjAtZx4tX/rPhrmKXKXPjZpcf+fv/QkyYqhItc126ZLgakNdmV
	 Vp+J1a5eb0H9zr2TwMnHSEI9i9fsH38uiMUv8UiQY/x2cPXq11+P5pzbOrRTFaO/kO
	 w5IUrjgtTQ/HVxT+0tLqoKLyMDBdzFNy7Aj0VhCQKO83oUBKqwNYWrXamnFx17M58J
	 ErUgRjRltH5YA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1FEAD3CC8A;
	Thu, 15 Jan 2026 07:08:24 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Subject: [PATCH v3 0/2] Add Apple Silicon SMC power driver
Date: Thu, 15 Jan 2026 18:08:14 +1100
Message-Id: <20260115-b4-macsmc-power-v3-0-c236e09874be@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF+SaGkC/3WNyw6CMBBFf4V0bU07UF4r/8O4qMMATSwlrakaw
 r9bWJEYl+cm59yFBfKGAmuzhXmKJhg3JchPGcNRTwNx0yVmIKAUUih+L7jVGCzy2b3I807ICrH
 qVa6RJWv21Jv3XrzeEo8mPJ3/7AdRbuv/VpRc8BIaVWABWil1Gaw2jzM6y7ZWhKPf/PqQ/CavZ
 d1LqroSjv66rl8n4xcR7gAAAA==
X-Change-ID: 20260105-b4-macsmc-power-d017cc7f53ac
To: Sebastian Reichel <sre@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Michael Reeves <michael.reeves077@gmail.com>, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768460903; l=2212;
 i=michael.reeves077@gmail.com; s=20260105; h=from:subject:message-id;
 bh=7ZuDFsWT2gxxq3ujMvtSzPih5aeosnU4qUGhtGU18+o=;
 b=ZqocKdTEOkpTOndAfW3elALKsRlonSok214dv4pvVbnLBEpl//qZUsBW7DJ3g8mvf1YbcDtEF
 6pBqk5v+n0sAmAuvweaEXSglpBwNgYtXbypJpVc8UzHA7hiE0FzDIOr
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=QIrgWBGCm3LG0YYc6MLCDkwuVXLTGGooVBdWX/KhSiU=
X-Endpoint-Received: by B4 Relay for michael.reeves077@gmail.com/20260105
 with auth_id=591
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_230826_699511_A4A5281B 
X-CRM114-Status: GOOD (  13.29  )
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
Hector Martin. It has been refactored for upstream inclusion, 
including support for newer SMC firmwares, devices without batteries,
dynamic property detection and improved state management.

Tested on: Apple M3 (MacBook Air, J613)

Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
---
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
Michael Reeves (2):
      power: supply: Add macsmc-power driver for Apple Silicon
      mfd: macsmc: Wire up Apple SMC power driver

 MAINTAINERS                         |   1 +
 drivers/mfd/macsmc.c                |   1 +
 drivers/power/supply/Kconfig        |  11 +
 drivers/power/supply/Makefile       |   1 +
 drivers/power/supply/macsmc-power.c | 834 ++++++++++++++++++++++++++++++++++++
 5 files changed, 848 insertions(+)
---
base-commit: b775e489bec70895b7ef6b66927886bbac79598f
change-id: 20260105-b4-macsmc-power-d017cc7f53ac

Best regards,
-- 
Michael Reeves <michael.reeves077@gmail.com>



