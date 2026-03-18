Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426851077612
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 20:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=idPJ2z28e+izFRpTlD6N6oeA5AaZ1O7Luio6jxyDQUQ=; b=efKKLOIuR0Cti/
	mQXFE/RQLqylGgqx8t/A+Tek2xbzG2AvQBtMNjV/kzDAEyvv3vBf1rWYSHMQTUj7K8ebNbyePvbIu
	xgdlpzRKwCHBk82yg+M+fpsXzb8wKvvzMCchAtw07ViFBl84N5UzFLNC9hrss8g/M8edeKPNYxvhw
	ZfNSURZvF2kiRy5lsuJlk5RuJD96moZRBmvCVFavhz25JQ6ZaaqrdYCy9WXUJ1l6zmzJ7tZpkOdlE
	UNUJdLPjghWLo3dtVlXbEoj3c39PQTWA5wx+Hi6G1tb3517pISMr9VRNwIRkkXXOh6zoEediYNjsu
	j0avu4skeULGehSP9rLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2xpZ-00000009KWi-1UhV;
	Wed, 18 Mar 2026 20:49:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2xpP-00000009KR7-41Ke
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 20:49:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 982BE1BF7;
	Wed, 18 Mar 2026 13:49:04 -0700 (PDT)
Received: from e134710.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB1413F7BD;
	Wed, 18 Mar 2026 13:49:08 -0700 (PDT)
From: Ahmed Tiba <ahmed.tiba@arm.com>
Subject: [PATCH v3 00/10] cover: ACPI: APEI: share GHES CPER helpers and
 add DT FFH provider
Date: Wed, 18 Mar 2026 20:47:57 +0000
Message-Id: <20260318-topics-ahmtib01-ras_ffh_arm_internal_review-v3-0-48e6a1c249ef@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH4Pu2kC/5WOywrCMBBFf6VkbUpm2prqyv8QKWkedsA+SEpVS
 v/dpCCuXZ4Lc86sLFhPNrBztjJvFwo0DhGKQ8Z0p4a75WQiMxR4FIiCz+NEOnDV9TO1ArhXoXG
 ua5TvGxpm6wf1aJLJPnnrjNHSaalVy6Jx8tbRa69db5E7CvPo33t8gbSmTgUIEgDrssqhhhLgx
 CEFrcljU11iKtdjz5Jiwe/Z/+8tyAUvSukUGllU0P7M27Z9AHYh56MbAQAA
To: linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-cxl@vger.kernel.org
Cc: Ahmed Tiba <ahmed.tiba@arm.com>, Michael.Zhao2@arm.com, robh@kernel.org, 
 linux-arm-kernel@lists.infradead.org, Dmitry.Lamerov@arm.com, 
 rafael@kernel.org, conor@kernel.org, will@kernel.org, bp@alien8.de, 
 catalin.marinas@arm.com, krzk+dt@kernel.org, linux-doc@vger.kernel.org, 
 mchehab+huawei@kernel.org, tony.luck@intel.com
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773866948; l=3635;
 i=ahmed.tiba@arm.com; s=20260219; h=from:subject:message-id;
 bh=8H96j8MpMDHKAiWBBFwEZfm8yfzmLh+gZJABXNxhdnE=;
 b=JTCNw0u4VK3lWeh3j7wcnlPeknCrSNSYJngPUYMeCsJEGtFYOHF/AarjvAxbMEKDU/3mBtRbo
 RbZ0vaNAnciCABFEvLigpypWIk7EeOiJNW/mqZw9zNvhejqZi1HLOmm
X-Developer-Key: i=ahmed.tiba@arm.com; a=ed25519;
 pk=xVOtd+Qklh/4tuM3tB+BEZD4jj5a6W59C3KCNX6v7OE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_134920_103310_A7FD2D77 
X-CRM114-Status: GOOD (  11.88  )
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

This is v3 of the GHES refactor series. The goal is to split the GHES
CPER handling into shared helpers so the same firmware-first CPER flow
can be reused by a DT-based provider, while keeping the early patches as
mechanical moves and addressing the review comments on naming, driver
integration, and build coverage.

Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
---
Changes in v3:
- Fixed the new ghes_cper.h header comment and kept the original
  copyrights.
- Added <linux/bitfield.h> to fix the kernel test robot build failure.
- Renamed the binding/compatible and DT-side naming to ras-cper.
- Switched the DT provider to generic firmware property accessors.
- Replaced atomic source IDs with IDA.
- Updated IRQ/error/resource handling as suggested in review
  (platform_get_irq(), dev_err_probe(), devm platform ioremap
  helpers).
- Removed the ARM64 dependency and fixed Kconfig/build coverage.
- Clarified comments and kept the early move patches mechanical.
- Link to v2: https://lore.kernel.org/r/20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-0-347fa2d7351b@arm.com

Changes in v2:
- Dropped the proposed "estatus core" and kept GHES naming/flow intact
  (per Borislav Petkov).
- Re-sliced the series into smaller mechanical steps (per Mauro Carvalho Chehab).
- Minor DT binding fixes based on Krzysztof Kozlowski's feedback.
- Removed fixmap slot usage from the DT FFH driver (per Will Deacon).

Series structure:
- Patches 1-8 are mechanical moves only and do not change behavior.
- Patch 9 wires the shared helpers back into GHES.
- The DT firmware-first CPER buffer provider is added in the final patches.
- "ACPI: APEI: introduce GHES helper" is internal build glue only
  and does not introduce a new user-visible configuration option.

- Link to v1: https://lore.kernel.org/r/20251217112845.1814119-1-ahmed.tiba@arm.com

---
Ahmed Tiba (10):
      ACPI: APEI: GHES: share macros via a private header
      ACPI: APEI: GHES: move CPER read helpers
      ACPI: APEI: GHES: move GHESv2 ack and alloc helpers
      ACPI: APEI: GHES: move estatus cache helpers
      ACPI: APEI: GHES: move vendor record helpers
      ACPI: APEI: GHES: move CXL CPER helpers
      ACPI: APEI: introduce GHES helper
      ACPI: APEI: share GHES CPER helpers
      dt-bindings: firmware: add arm,ras-cper
      RAS: add firmware-first CPER provider

 Documentation/admin-guide/RAS/main.rst             |   18 +
 .../devicetree/bindings/firmware/arm,ras-cper.yaml |   71 ++
 MAINTAINERS                                        |    6 +
 drivers/Makefile                                   |    1 +
 drivers/acpi/Kconfig                               |    4 +
 drivers/acpi/apei/Kconfig                          |    1 +
 drivers/acpi/apei/apei-internal.h                  |   10 +-
 drivers/acpi/apei/ghes.c                           | 1024 +------------------
 drivers/acpi/apei/ghes_cper.c                      | 1027 ++++++++++++++++++++
 drivers/ras/Kconfig                                |   11 +
 drivers/ras/Makefile                               |    1 +
 drivers/ras/cper-esource.c                         |  257 +++++
 include/acpi/ghes.h                                |   10 +-
 include/acpi/ghes_cper.h                           |  152 +++
 include/cxl/event.h                                |    2 +-
 15 files changed, 1560 insertions(+), 1035 deletions(-)
---
base-commit: 2d1373e4246da3b58e1df058374ed6b101804e07
change-id: 20260220-topics-ahmtib01-ras_ffh_arm_internal_review-bfddc7fc7cab

Best regards,
-- 
Ahmed Tiba <ahmed.tiba@arm.com>


