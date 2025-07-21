Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0B2C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 11:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4wQsUSF34x7aot1sElNjzy3g37v/3VUcwunuzv0HHdc=; b=byNx6SxCtZXL8p6FDK+AQfyrWh
	83P2GAcopEs6KuW3j4+W7MJgw+QCGFHT/YIA9FW8NVOnOAEwarh9r5gEYf30nM8wa81BS0aTwWBuS
	e0XrZOr1gtOetlfYUaDhKB+aAWriDuolFmbVTlGQVe90tfWDoRDQTRtSN3xaqZew9vHlQG4Cne1pw
	FE64yCZlo72V/4U4nrLxKj1BAu1APvFNlE7IhxVhGaAGezDVmVXzaufNAm/+MSlinZbewQ167iWpD
	Nehdqas3vg1YMGpmUGXDqVfNYbNaxVlqCx1Lj2HR9pNGZ75lGgAKD1Zcj2B6leFiaO4hsOEWIu49s
	Fa2uZ29g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udorO-0000000H7FM-3NaB;
	Mon, 21 Jul 2025 11:39:10 +0000
Received: from mail.fris.de ([2a01:4f8:c2c:390b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udnRm-0000000Guob-3GAi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 10:08:39 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A6E40C75F8;
	Mon, 21 Jul 2025 12:08:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1753092506; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=4wQsUSF34x7aot1sElNjzy3g37v/3VUcwunuzv0HHdc=;
	b=1XbQZC15gvy/KqcMus1Nt1rlueqbgzD8Ds2iHTBPWAh5j6pYh+24xqpNd2YTlERkhvr+nX
	MhIKVOulkPRHychu6uiXA+WoyAhb3agZUGtqeqHeldPEKodK5DaTXICN2Gdu6JHZxxaGu0
	4rj/Gp60AlcRp4SIghFi0/DZ94TkLXHMo/nwJhHR4x70lQ5hdII1RDVC2KxgqK670E70UL
	s4XhuWZxBFE0mnzc9RJL97Rwz+IF/sfVzdA5okmxpIS2XMWCsPkvZ5NET2T6RTnK8hBWM1
	H2lL64E9x8DuSzyuabAlHy1xK0yrWpm25inlnt3kjkwGWtY0ypR7znD4Swi87g==
From: Frieder Schrempf <frieder@fris.de>
To: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andrej Picej <andrej.picej@norik.com>,
	Annette Kobou <annette.kobou@kontron.de>,
	Eberhard Stoll <eberhard.stoll@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Liu Ying <victor.liu@nxp.com>,
	Oualid Derouiche <oualid.derouiche@kontron.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Teresa Remmet <t.remmet@phytec.de>,
	Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH v2 00/12] Misc fixups and changes for Kontron i.MX8M and i.MX93 DTs
Date: Mon, 21 Jul 2025 12:05:34 +0200
Message-ID: <20250721100701.115548-1-frieder@fris.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_030838_980650_1F92538F 
X-CRM114-Status: UNSURE (   9.08  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

This is a collection of changes for several Kontron ARM64
board devicetrees. Some are related to hardware changes,
some are bugfixes and some are improvements.

Changes for v2:
* fix touchscreen node name
* add touchscreen labels
* fix commit message for RTC interrupt patch

Annette Kobou (3):
  arm64: dts: imx8mm-kontron: Add overlay for LTE extension board
  arm64: dts: imx8mp-kontron: Fix CAN_ADDR0 and CAN_ADDR1 GPIOs
  arm64: dts: imx93-kontron: Fix GPIO for panel regulator

Eberhard Stoll (1):
  arm64: dts: imx8mm-kontron: Use GPIO for RS485 transceiver control

Frieder Schrempf (7):
  arm64: dts: imx8mm-kontron: Remove unused regulator
  arm64: dts: imx8mm-kontron: Sort reg nodes alphabetically
  arm64: dts: imx8mm-kontron: Name USB regulators according to OSM
    scheme
  arm64: dts: imx8mp-kontron: Fix GPIO labels for latest BL board
  arm64: dts: imx8mp-kontron: Fix USB hub reset
  arm64: dts: imx93-kontron: Add RTC interrupt signal
  arm64: dts: imx93-kontron: Fix USB port assignment

Oualid Derouiche (1):
  arm64: dts: imx8mm-kontron: Add Sitronix touch controller in DL
    devicetree

 arch/arm64/boot/dts/freescale/Makefile        |   2 +
 .../dts/freescale/imx8mm-kontron-bl-lte.dtso  | 186 ++++++++++++++++++
 .../dts/freescale/imx8mm-kontron-bl-osm-s.dts |   8 -
 .../boot/dts/freescale/imx8mm-kontron-bl.dts  |  12 +-
 .../boot/dts/freescale/imx8mm-kontron-dl.dtso |  13 +-
 .../dts/freescale/imx8mm-kontron-osm-s.dtsi   |  50 ++---
 .../dts/freescale/imx8mp-kontron-bl-osm-s.dts |  59 +++---
 .../dts/freescale/imx93-kontron-bl-osm-s.dts  |  32 +--
 .../dts/freescale/imx93-kontron-osm-s.dtsi    |   9 +
 9 files changed, 301 insertions(+), 70 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-lte.dtso

-- 
2.50.1


