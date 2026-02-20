Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5487C54FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 13:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gfBGP7WDhjO0ROFjNpDp3IFD8CXpwc03jAV0Phdbunc=; b=STZSDw9lEYBk1E
	8SL8i6HMi2HFrn/Fxr1FsB/zirNx/z+wdCounVKIjEXZLk6V558TZUHM6LF8ct8ruKy6m7y+uMXbr
	Py5ZLgpceu/Lh3AtP7mDtbDUnKem3MCATj+7rFkHEJ/tgLuyHEeIrc1/mSVFexqnuvD1yqm/NxqsB
	Toq8+I/R8rfvPy1REAzb1LdqK3GkxTxVlaqM4DxxkuNHxj6eZlCYtPHLU4u1BHrQkSr6ATrbGIFl0
	LYIgUNJ/dfDJdeTEVlbyUzWN8pF+PzEW2F0Tjy4Oj5JKoMoAQ3o3oANnE00xqODUrbvLLcQUiF2L1
	OEIf64dh+KD62xseApaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtQmY-0000000EYrc-047y;
	Fri, 20 Feb 2026 13:42:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtQmU-0000000EYqU-3gYk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 13:42:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0B01339;
	Fri, 20 Feb 2026 05:42:45 -0800 (PST)
Received: from e134710.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 35F8A3F7D8;
	Fri, 20 Feb 2026 05:42:50 -0800 (PST)
From: Ahmed Tiba <ahmed.tiba@arm.com>
Subject: [PATCH v2 00/11] ACPI: APEI: share GHES CPER helpers and add DT
 FFH provider
Date: Fri, 20 Feb 2026 13:42:18 +0000
Message-Id: <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-0-347fa2d7351b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALpkmGkC/x3NSw6DIBSF4a0YxsVwiVbbUffRGII8yk0qGCC2j
 XHvBYf/GZxvJ8lENIncm51Es2HC4EvwS0OUk/5lKOrShDN+ZZwzmsOKKlHplowzAxplEtY6IeM
 i0GcTvXyL+mQ+dLZaq8GqQcmZlMc1GovfU3tOpR2mHOLvxDeoa3V64DAA8LHrWxihA7hRqKDRb
 THlo1CtCguZjuP4A6lGMrbBAAAA
To: devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
Cc: Ahmed Tiba <ahmed.tiba@arm.com>, Dmitry.Lamerov@arm.com, 
 catalin.marinas@arm.com, bp@alien8.de, robh@kernel.org, rafael@kernel.org, 
 will@kernel.org, conor@kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, krzk+dt@kernel.org, Michael.Zhao2@arm.com, 
 tony.luck@intel.com
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771594970; l=2888;
 i=ahmed.tiba@arm.com; s=20260219; h=from:subject:message-id;
 bh=982hEo3jsh9UnLCSzsX35G+l2P3VUEY+ReOy8VBkpNY=;
 b=cLJYGPUzLiW1gXsUelnqwCZMg4kD59OC630t667vlkxrKGG4uv/t6ou1g1meUp+dyy9N4go6C
 ZKzNSrjg4ZNB2Ox3i8urPqYhkfTwgB0fltGYDiGtN7TSDXwFzgWmNhl
X-Developer-Key: i=ahmed.tiba@arm.com; a=ed25519;
 pk=xVOtd+Qklh/4tuM3tB+BEZD4jj5a6W59C3KCNX6v7OE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_054255_061368_1E84E644 
X-CRM114-Status: UNSURE (   9.14  )
X-CRM114-Notice: Please train this message.
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

This is v2 of the GHES refactor series. The goal is to reuse existing
GHES CPER handling for non-ACPI platforms without changing the GHES
flow or naming, and add a DT firmware-first CPER provider, while
keeping the changes mechanical and reviewable.

Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
---
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
Ahmed Tiba (11):
      ACPI: APEI: GHES: share macros via a private header
      ACPI: APEI: GHES: add ghes_cper.o stub
      ACPI: APEI: GHES: move CPER read helpers
      ACPI: APEI: GHES: move GHESv2 ack and alloc helpers
      ACPI: APEI: GHES: move estatus cache helpers
      ACPI: APEI: GHES: move vendor record helpers
      ACPI: APEI: GHES: move CXL CPER helpers
      ACPI: APEI: introduce GHES helper
      ACPI: APEI: share GHES CPER helpers
      dt-bindings: firmware: add arm,ras-ffh
      RAS: add DeviceTree firmware-first CPER provider

 Documentation/admin-guide/RAS/main.rst             |   18 +
 .../devicetree/bindings/firmware/arm,ras-ffh.yaml  |   71 ++
 MAINTAINERS                                        |    6 +
 drivers/Makefile                                   |    1 +
 drivers/acpi/Kconfig                               |    4 +
 drivers/acpi/apei/Kconfig                          |    1 +
 drivers/acpi/apei/apei-internal.h                  |   10 +-
 drivers/acpi/apei/ghes.c                           | 1024 +------------------
 drivers/acpi/apei/ghes_cper.c                      | 1026 ++++++++++++++++++++
 drivers/ras/Kconfig                                |   12 +
 drivers/ras/Makefile                               |    1 +
 drivers/ras/esource-dt.c                           |  264 +++++
 include/acpi/ghes.h                                |   10 +-
 include/acpi/ghes_cper.h                           |  143 +++
 include/cxl/event.h                                |    2 +-
 15 files changed, 1558 insertions(+), 1035 deletions(-)
---
base-commit: 8bf22c33e7a172fbc72464f4cc484d23a6b412ba
change-id: 20260220-topics-ahmtib01-ras_ffh_arm_internal_review-bfddc7fc7cab

Best regards,
-- 
Ahmed Tiba <ahmed.tiba@arm.com>


