Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B65D6554E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 11:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T33uFQ5vvO7RkLHxMfMFW2Kp+Ru5P76/3XTJ/uL2Beo=; b=2XEH1R5GzGAqPYGKrs9ShwFijV
	ppHcFMSU3m66vpw5H5+9hX3/1x1NQ3ZohVLAIqgY3bgWdG7J+fXtZN1/OHnkYVZtS4fTSRsSdSlYx
	/VDKrerM82jQbQMvB/t+PYW86Sy7XCojph9B31cszxx4hcvD9CYyLPPZhK+hgdioZXp5qfKOSTyv3
	4Fe+zHsoSaIChJY1lEAs2qRLosyevZ+cRqXSz1sa5sjt/06TzBtZ+oSS06M+u0ZuhpUFJ0qs9oMRe
	8QQp8jWoDFhOzM+o9wZQfESrlvjlfBKd5ruclV6BCNNqdxnMF3kQEFkZOo2hxN4s63v801JBtEFhm
	R2anp4KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVpiG-00000006iNi-2jFM;
	Wed, 17 Dec 2025 11:29:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVpiD-00000006iN8-2Ofc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 11:28:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9033114BF;
	Wed, 17 Dec 2025 03:28:46 -0800 (PST)
Received: from e134710.manchester.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D8F0A3F73B;
	Wed, 17 Dec 2025 03:28:51 -0800 (PST)
From: Ahmed Tiba <ahmed.tiba@arm.com>
To: linux-acpi@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: tony.luck@intel.com,
	bp@alien8.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rafael@kernel.org,
	linux-doc@vger.kernel.org,
	Dmitry.Lamerov@arm.com,
	Michael.Zhao2@arm.com,
	ahmed.tiba@arm.com
Subject: [PATCH 00/12] ras: share firmware-first estatus handling
Date: Wed, 17 Dec 2025 11:28:33 +0000
Message-ID: <20251217112845.1814119-1-ahmed.tiba@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_032857_657203_2A775EDE 
X-CRM114-Status: UNSURE (   7.81  )
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

Platforms that rely on firmware-first RAS today only get the full Linux
handling pipeline when the records arrive through ACPI/APEI GHES. This
series lifts the generic parts of GHES into a reusable estatus core, wires
GHES up to that core, and adds a DeviceTree-facing provider so non-ACPI
systems can route CPER records through the same logic. The final patches
document the binding and the admin-guide flow.

The end result is a single estatus implementation that covers vendor record
notifier support, memory error queueing, IRQ/NMI handling and the CXL/PCIe.
GHES and DT users now simply provide transport-specific ops.

This is based on v6.19-rc1

Ahmed Tiba (12):
  ras: add estatus core interfaces
  ras: add estatus core implementation
  ras: add estatus vendor handling and processing
  ras: add estatus queuing and IRQ/NMI handling
  ras: flesh out estatus processing core
  efi/cper: adopt estatus iteration helpers
  ghes: prepare estatus hooks for shared handling
  ghes: add estatus provider ops
  ghes: route error handling through shared estatus core
  dt-bindings: ras: document estatus provider
  ras: add DeviceTree estatus provider driver
  doc: ras: describe firmware-first estatus flow

 Documentation/admin-guide/RAS/main.rst        |   24 +
 .../devicetree/bindings/ras/arm,ras-ffh.yaml  |   95 ++
 MAINTAINERS                                   |    8 +
 arch/arm64/include/asm/fixmap.h               |    5 +
 drivers/acpi/apei/Kconfig                     |    1 +
 drivers/acpi/apei/ghes.c                      | 1292 +++--------------
 drivers/firmware/efi/Kconfig                  |   11 +
 drivers/firmware/efi/Makefile                 |    1 +
 drivers/firmware/efi/cper.c                   |   29 +-
 drivers/firmware/efi/estatus.c                | 1056 ++++++++++++++
 drivers/ras/Kconfig                           |   14 +
 drivers/ras/Makefile                          |    1 +
 drivers/ras/estatus-dt.c                      |  318 ++++
 include/acpi/ghes.h                           |   58 +-
 include/linux/estatus.h                       |  267 ++++
 15 files changed, 2001 insertions(+), 1179 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/ras/arm,ras-ffh.yaml
 create mode 100644 drivers/firmware/efi/estatus.c
 create mode 100644 drivers/ras/estatus-dt.c
 create mode 100644 include/linux/estatus.h

-- 
2.43.0


