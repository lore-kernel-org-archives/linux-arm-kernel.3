Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037F1105F78B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 10:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p/yfsVGqBSlh/KpcWWFFe7HwV9EjPFyV9HQe5IbEftw=; b=mrpshsEEhPM4hd
	8gkB1I0QBmwEecMdnIKImKWJmyA04nHZkKQg6MNox6TU7AEb5PrGudeBYO+uPijt1OmrzpxFjZBsk
	3x9YOYSqajTHceUIg5eDT1SRU+frV0cqRDQPyitummXQgk7IcXtHK8dEylWmGPN8pUQatDXITixTX
	vbItF8VTfZxeZfz3iYWmmDlRk1+/PXdM6qEx7u++UrHR1jg3LgH54+mfw+3GGiwR4e6y2VagFBpnJ
	erMO8sXwX1mugRgqXVFcEDcjwM0Z7b6Ccsulc/lZAIfdUd/qETpCZWk+5KD+fEqpBDUA/h7nZmNlC
	Hz2Z86d/+TEE6VhJNO1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zRK-0000000HTce-1cFv;
	Fri, 13 Mar 2026 10:08:18 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zRI-0000000HTbv-0UJn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 10:08:17 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 13 Mar
 2026 18:08:12 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 13 Mar 2026 18:08:12 +0800
From: aspeedyh <yh_chung@aspeedtech.com>
Subject: [PATCH 0/7] soc: aspeed: Add AST2600 eSPI controller support
Date: Fri, 13 Mar 2026 18:07:35 +0800
Message-ID: <20260313-upstream_espi-v1-0-9504428e1f43@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOjhs2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0Nj3dKC4pKi1MTc+NTigkzdFMu01EQzsxRDc3MjJaCegqLUtMwKsHn
 RsbW1AP7qydNfAAAA
X-Change-ID: 20260313-upstream_espi-d9fea66d1772
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <maciej.lawniczak@intel.com>, aspeedyh
	<yh_chung@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773396491; l=2464;
 i=yh_chung@aspeedtech.com; s=20260313; h=from:subject:message-id;
 bh=dv5zwPulTbWutjwEBbvd8aN2CQwO1vLki17npHgF3/4=;
 b=nUOuJPbhuALmHWWELdAretyV2JAWTCsPDyW/E3eLvLC97y+ASQ1g235rMs0BGU4fJxvyKdVgL
 cwCz7v+X4mJCXLF8vRruR+wjYb9b/KSTnmlsNy2EvAUjaSWkG6Uk8LW
X-Developer-Key: i=yh_chung@aspeedtech.com; a=ed25519;
 pk=o71dz0J8lpN+v0f3Mk4gT9PfVngADPC1Pex4aK6VigM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_030816_160419_153F0CB0 
X-CRM114-Status: UNSURE (   7.64  )
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

This series adds initial support for the eSPI controller found on ASPEED
AST2600 BMC SoCs.

The series introduces a eSPI controller framework for ASPEED SoCs under
drivers/soc/aspeed/, adds AST2600-specific controller support for
peripheral and flash channels, defines the corresponding devicetree 
binding, and adds the AST2600 eSPI controller node to the SoC dtsi.

The driver is intended to support host-BMC communication over the BMC-side
eSPI slave controller present on AST2600 systems.

Patch summary:
1. dt-bindings: soc: aspeed: Add AST2600 eSPI controller
2. soc: aspeed: Introduce core eSPI controller support
3. soc: aspeed: Add AST2600 peripheral channel port I/O support
4. soc: aspeed: Add eSPI TAFS backend support
5. soc: aspeed: Add espi flash channel support
6. soc: aspeed: Add sysfs controls for flash LUN selection
7. arm: dts: aspeed: Add eSPI node for AST2600

This series has been tested on AST2600 platform with Intel's host eSPI
controller.

Signed-off-by: aspeedyh <yh_chung@aspeedtech.com>
---
aspeedyh (7):
      dt-bindings: soc: aspeed: Add AST2600 eSPI controller
      soc: aspeed: Introduce core eSPI controller support
      soc: aspeed: Add AST2600 peripheral channel port I/O support
      soc: aspeed: Add eSPI TAFS backend support
      soc: aspeed: Add eSPI flash channel support
      soc: aspeed: Add sysfs controls for flash backend selection
      arm: dts: aspeed: Add eSPI node for AST2600

 .../bindings/soc/aspeed/aspeed,ast2600-espi.yaml   |  74 +++
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi            |  11 +
 drivers/soc/aspeed/Kconfig                         |   7 +
 drivers/soc/aspeed/Makefile                        |   1 +
 drivers/soc/aspeed/espi/Makefile                   |   1 +
 drivers/soc/aspeed/espi/aspeed-espi-comm.h         |  62 +++
 drivers/soc/aspeed/espi/aspeed-espi.c              | 618 +++++++++++++++++++++
 drivers/soc/aspeed/espi/aspeed-espi.h              |  63 +++
 drivers/soc/aspeed/espi/ast2600-espi.c             | 304 ++++++++++
 drivers/soc/aspeed/espi/ast2600-espi.h             | 302 ++++++++++
 drivers/soc/aspeed/espi/espi_storage.c             | 322 +++++++++++
 drivers/soc/aspeed/espi/espi_storage.h             |  32 ++
 12 files changed, 1797 insertions(+)
---
base-commit: 0257f64bdac7fdca30fa3cae0df8b9ecbec7733a
change-id: 20260313-upstream_espi-d9fea66d1772

Best regards,
-- 
aspeedyh <yh_chung@aspeedtech.com>


