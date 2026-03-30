Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A614FF4953
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 06:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OpCetiyBauYYAJ8SysJ96ijPY9Mk7kbQLyBHdlccLBI=; b=eemxBFlQ8bkzek
	xOqpQGciEb63OPPJJxVggJjHCBguiLsEXu2ML1JpoiluFtLO3QuCPt3s1ZShHSoqn5MBzveo5GGPw
	+b7vdvfYyREMqDAU86RSdaHWCNehl1ONJcn2C57ixhsYtyCFXHSVvp7c09DH/ReBRF0+LUZdHurnx
	5kNPDqvCsWjUYnuF7kXq8h3syHvDQFM9UwWVoF/bTPBrYuhxq4veqBml4q9XDKnPUnx0p0qPQ3Ztz
	VaCXLp+dmYqW1DwN5JOECYRa3IVgFggxCPGPHrRTRP+ZQoU2qcYVsh7QLzqauFM0W0RjmlnCuPnC9
	GWlcgKGEn9XXSgOMjFsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w76Ak-0000000Ah6Z-2z67;
	Mon, 30 Mar 2026 06:32:26 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w76Ah-0000000Ah5s-2DyN;
	Mon, 30 Mar 2026 06:32:25 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 30 Mar
 2026 14:32:10 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 30 Mar 2026 14:32:10 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: [PATCH v4 0/4] AST2700-A2 interrupt controller hierarchy and route
 support
Date: Mon, 30 Mar 2026 14:32:09 +0800
Message-ID: <20260330-irqchip-v4-0-3c0f1620cc06@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOkYymkC/23MQQ6DIBCF4as0rEszgIJ21Xs0XSAOhUXVgiFtj
 HcvutHELt9kvn8iEYPHSK6niQRMPvq+y6M4n4hxunsi9W3ehAOXwKGkPryN8wNVqNEKqYoWa5K
 /h4DWf9bS/ZG383Hsw3cNJ7Zcj43EKNAGBAMEaaBSNx0HxHZE4y6mf5EllPiGBcgN84xtVTJuo
 G5Qir9Y7DDfYZGxkFKJ2pZKG3vA8zz/AChwD+EdAQAA
X-Change-ID: 20260205-irqchip-7eaef3674de9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Paul Walmsley <pjw@kernel.org>,
	"Palmer Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Alexandre Ghiti" <alex@ghiti.fr>, Thomas Gleixner <tglx@kernel.org>, Thomas
 Gleixner <tglx@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, Ryan Chen <ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774852330; l=5545;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=2YRtrcIEpOWrAdhNl8A+m416MZj9b+AOfhV4PMTCzGI=;
 b=leRN0msFH+xIpM4fUICSbtFYte3oLzDxzhAtPEcwoTq4GYx9ofeYmNq1hqsiK8ncZKawLKdXR
 PO4jDW9dHmlAR3HstgEdBKZWeixlFBiNRPhzwAzRydugWrpCWAniR8O
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_233223_610365_A684E09A 
X-CRM114-Status: GOOD (  15.19  )
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

The AST2700 SoC has undergone multiple silicon revisions (A0, A1, A2)
prior to mass production.

A0 laid the ground-work with a split controller design (INTC0 and
INTC1) used for early development and bring-up. The interrupt
architecture was substantially reworked in the A1 to introduce an
explicit routing model and clearer hierarchy, though the split
controllers remained. The A1 interrupt architecture is unchanged in A2.

A2 is the production design. A0 and A1 are pre-production silicon and
are no longer intended for deployment outside of ASPEED.

The existing binding and driver were written against A0 prior to the A1
rework. The A0 design directly wired INTC1 instances to INTC0, and
INTC0 to the GIC of the Primary Service Processor (PSP, a Cortex-A35).
The A0 binding and driver therefore do not account for the alternative
destinations of the Secondary and Tertiary Service Processors (SSP,
TSP) and BootMCU, or the necessary route selection logic present in the
production design.

With the above context, this series replaces the existing binding and
driver.

It is not necessary for projects to maintain support for A0 due to its
pre-production nature, and between Linux, U-Boot and Zephyr there are
no upstream devicetree users of the current binding.

The new binding uses localised interrupt numbers and models the
hardware connectivity between interrupt controllers using the
aspeed,interrupt-ranges property. It is introduced in a new file before
the existing binding is removed in order to keep the diff readable.

The INTC0 driver creates a hierarchical irqdomain under the selected
upstream interrupt controller and implements route resolution logic.
INTC1 driver instances defer route selection to INTC0 and expose a
linear interrupt namespace to their parent.

A brief history of related submissions
--------------------------------------

Some modifications to the existing binding were sent to the lists in
the past. Due to process choices the revisions were difficult to track.
They are listed below.

The approaches took several forms but ended in the minor adjustment in
v6 being applied. This enabled use of the A1 design but requires
assumptions about platform route configuration defined in firmware.
These assumptions are removed by this current series.

* [PATCH] dt-bindings: interrupt-controller: aspeed: Refine AST2700 binding description and example
  https://lore.kernel.org/all/20250714071753.2653620-1-ryan_chen@aspeedtech.com/

* [PATCH v2] dt-bindings: interrupt-controller: aspeed: Add parent node compatibles and refine documentation
  https://lore.kernel.org/all/20250715024258.2304665-1-ryan_chen@aspeedtech.com/

* [PATCH v3 0/2] irqchip: aspeed: Add AST2700 INTC debugfs support and yaml update
  https://lore.kernel.org/all/20250722095156.1672873-1-ryan_chen@aspeedtech.com/

* [PATCH v4 0/2] irqchip/ast2700-intc: Add AST2700 INTC debugfs support and yaml update
  https://lore.kernel.org/all/20250812100830.145578-1-ryan_chen@aspeedtech.com/

* [PATCH v5 0/3] AST2700 interrupt controller hierarchy support
  https://lore.kernel.org/all/20251022065507.1152071-1-ryan_chen@aspeedtech.com/

* [PATCH v6 0/1] Update correct AST2700 interrupt controller binding
  https://lore.kernel.org/all/20251030060155.2342604-1-ryan_chen@aspeedtech.com/

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
Changes in v4:
- 3/4 fix warning: the frame size of 1296 bytes is larger than 1280 bytes
- Link to v3: https://lore.kernel.org/r/20260326-irqchip-v3-0-366739f57acf@aspeedtech.com

Changes in v3:
- 1/4 Squash patch 5/5 and 1/5.
- 1/4 modify wrap lines at 80 char.
- 1/4 modify maintainers name and email.
- 1/4 modify typo Sevice-> Service
- Link to v2: https://lore.kernel.org/r/20260306-irqchip-v2-0-f8512c09be63@aspeedtech.com

Changes in v2:
- Change suject to "AST2700-A2 interrupt controller hierarchy and route
  support".
- Describe timeline for (pre-)production design evolution and
  binding development to support the break in compatibility.
- fix "make dt_binding_check" compatible string consistance with
  example.
- Split KUnit coverage out of the main driver patch.
- Link to v1: https://lore.kernel.org/r/20260205-irqchip-v1-0-b0310e06c087@aspeedtech.com

---
Ryan Chen (4):
      dt-bindings: interrupt-controller: Describe AST2700-A2 hardware instead of A0
      irqchip/ast2700-intc: Add AST2700-A2 support
      irqchip/ast2700-intc: Add KUnit tests for route resolution
      irqchip/aspeed-intc: Remove AST2700-A0 support

 .../interrupt-controller/aspeed,ast2700-intc.yaml  |  90 ----
 .../aspeed,ast2700-interrupt.yaml                  | 188 +++++++
 drivers/irqchip/.kunitconfig                       |   5 +
 drivers/irqchip/Kconfig                            |  23 +
 drivers/irqchip/Makefile                           |   3 +-
 drivers/irqchip/irq-aspeed-intc.c                  | 139 -----
 drivers/irqchip/irq-ast2700-intc0-test.c           | 473 +++++++++++++++++
 drivers/irqchip/irq-ast2700-intc0.c                | 584 +++++++++++++++++++++
 drivers/irqchip/irq-ast2700-intc1.c                | 282 ++++++++++
 drivers/irqchip/irq-ast2700.c                      | 106 ++++
 drivers/irqchip/irq-ast2700.h                      |  47 ++
 11 files changed, 1710 insertions(+), 230 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260205-irqchip-7eaef3674de9

Best regards,
-- 
Ryan Chen <ryan_chen@aspeedtech.com>


