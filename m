Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6023AC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 21:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ktDOsJVYaKgVONZC7zET8bI7Q/d95m6itQMMSn2vcBI=; b=eGJoxDM3vPWHP75/BP0de+Syuf
	t+ThSwjEGjBIQcW3WXvIOsjp/Co/bacK3O+Ft3dBh9XIFySjN9de0QqJVcYtSyRtKhdM6lZtqtB9f
	2LrE7W6mZFPoi0eEUdWh051l7EBqMCJ3SMSilK5IH287gF7EzygokY804R9kkV9wiSY4RWHImLryX
	C7RkboP6cQldsveRggmVrlsXhW3HwGggLVmf/zOW9Y8y7bLqCiUmWHyHzXhNbPNr0zJ1buzY+CRe4
	9c1ASM33qNomrEUThaPyLxx0BiBR6YkTP0iNe6UaF33ivLlp14/xpoNah8TvmHSn5ymalYutYowsX
	IdCi9/nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ReE-00000003bgk-1Fpo;
	Mon, 14 Apr 2025 21:47:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4RYz-00000003aew-46b4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 21:42:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1744666917; x=1776202917;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tLt2eP72kLFIOGeY1xWW7M7uOV9URzcP5sXZZ5GRu38=;
  b=EuJLMtRxRH5++RQUkd2Z131rOygBBvZWQEXwMDCvz01TYbs++T7zK3WC
   0kjQDe0K7Z/MbLpOqi6jDxMcLdHaQ1Z/GttTWS8/pnb7MMAcTnwtVJvtN
   P2K0aRJY/+s4gqhns6NXmzcyUDrUdFpy0eZrInlVTdWX9Kh1RBuuqwTaz
   dHQWX9hhDIX0/HV6/NGC1fgC8fSUjHQXgs8IW9nRme2gV4diAJrExdO1v
   eieLcKOP3DPopK6zvOVVCnAZbmx7xEHv7f5gXv2l75DM4CL1OOp0p4C/M
   BimyLdB83GcoWovsU4a4B9lEt7d5+iuJuTlmyI7b1Eu7Cp2GBwVQI2u8T
   Q==;
X-CSE-ConnectionGUID: jf75aQsXSneWELgtntpGWQ==
X-CSE-MsgGUID: nFPUg5ewTjG1kq33dFZTtQ==
X-IronPort-AV: E=Sophos;i="6.15,212,1739862000"; 
   d="scan'208";a="40006664"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Apr 2025 14:41:54 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 14 Apr 2025 14:41:04 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 14 Apr 2025 14:41:04 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <lee@kernel.org>, <sre@kernel.org>,
	<p.zabel@pengutronix.de>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH v5 00/11] Enable Power Modes Support for SAMA7D65 SoC
Date: Mon, 14 Apr 2025 14:41:17 -0700
Message-ID: <cover.1744666011.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_144158_267138_279E8898 
X-CRM114-Status: GOOD (  16.97  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

This patch set adds support for low power modes for the SAMA7D65 SoC and
the required components and changes for low power modes.

The series includes changes in the asm code to account for the addtional
clocks that are in this SoC.

The Device tree additions are to enable all the components needed to
keep the SoC in low power mode.

There are some DTB check warnings but that is due to the dt-binding not
in the correct .yaml file format.

Changes v1 -> v2:
- Add missing compatible for ddr3phy, it is now in both syscon sets.
- Fix alphabetical ordering for sama7d65.
- Remove the incorrect reorganizing patch.
- Remove sama7g5-rtt as a compatible for sama7d65-rtt and add
  sama7d65-rtt as a compatible wake up source in the pm driver.

Changes from v2 -> v3:
- Correct mistake in v2 sfrbu dt-binding patch.
- Correct incorrect dt-binding addition and formatting for rtc and rtt bindings.
- Add missing SoB tag.
- Cleaned up commit message for Backup mode to describe SHDWC is status
  register is cleared for this SoC.
- Cleaned up variable naming and usage for mcks. Changed the mcks number
  to the correct number of clocks needed to be saved and corrected the
  ASM code accordingly.
- Removed the SHDWC from ULP0 wake-up source as it is not configured as
  a valid wake-up source for ULP0.
- Separated all the DTSI and DTS changes into individual patches.

Changes from v3 -> v4:
- Add sama7d65-gpbr to the dt-binding.
- Converted the sama5d2-secumod binding into yaml format.
- Add sama7d65-secumod to the new dt binding.
- Collect and remove applied and accpeted pathces from the set.

Changes from v4 -> v5:
- Use generic naming for dt-binding yaml example.
- Adjust DTSI SECUMOD node to match generic naming.
- Collect Acked and Reviewed tags. 

v1) https://lore.kernel.org/linux-arm-kernel/cover.1738257860.git.Ryan.Wanner@microchip.com/
v2) https://lore.kernel.org/linux-arm-kernel/cover.1739221064.git.Ryan.Wanner@microchip.com/
v3) https://lore.kernel.org/linux-arm-kernel/cover.1740671156.git.Ryan.Wanner@microchip.com/T/#m576233e7af84d68559afb286884c2b9294e7bc1d 
v4) https://lore.kernel.org/linux-arm-kernel/cover.1742936082.git.Ryan.Wanner@microchip.com/

Ryan Wanner (11):
  dt-bindings: sram: Add microchip,sama7d65-sram
  dt-bindings: power: reset: atmel,sama5d2-shdwc: Add
    microchip,sama7d65-shdwc
  dt-bindings: reset: atmel,at91sam9260-reset: add
    microchip,sama7d65-rstc
  dt-bindings: rtc: at91rm9200: add microchip,sama7d65-rtc
  dt-bindings: at91rm9260-rtt: add microchip,sama7d65-rtt
  dt-bindings: mfd: atmel: Add microchip,sama7d65-gpbr
  dt-bindings: mfd: syscon: atmel,sama5d2-secumod: convert to yaml
  dt-bindings: mfd: syscon: add microchip,sama7d65-secumod
  ARM: dts: microchip: sama7d65: Add SRAM and DRAM components support
  ARM: dts: microchip: sama7d65: Add RTT and GPBR Support for sama7d65
    SoC
  ARM: dts: microchip: sama7d65: Add RTT timer to curiosity board

 .../bindings/arm/atmel,sama5d2-secumod.yaml   | 49 +++++++++++++++++++
 .../devicetree/bindings/arm/atmel-sysregs.txt | 25 ----------
 .../bindings/mfd/atmel,at91sam9260-gpbr.yaml  |  1 +
 .../power/reset/atmel,sama5d2-shdwc.yaml      |  5 ++
 .../reset/atmel,at91sam9260-reset.yaml        |  3 ++
 .../bindings/rtc/atmel,at91rm9200-rtc.yaml    |  4 +-
 .../bindings/rtc/atmel,at91sam9260-rtt.yaml   |  1 +
 .../devicetree/bindings/sram/sram.yaml        |  1 +
 .../dts/microchip/at91-sama7d65_curiosity.dts |  4 ++
 arch/arm/boot/dts/microchip/sama7d65.dtsi     | 47 ++++++++++++++++++
 10 files changed, 114 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/atmel,sama5d2-secumod.yaml

-- 
2.43.0


