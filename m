Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70A9C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 16:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zahSKBXddKLBmeInYtmH27DWFhtGn9K88ZeCCjgkweU=; b=b/75tntjDaToeeDS9aBDwEqm5J
	gqSciLWhaO756WNstMO+wItcjTUbTs4JQx1vSeMk5nmzysVytiwveC+R3w5R8gKO3u2yN2gauFMv4
	2skicFxKCrRLJN8HFDZhJ8P95s68O5t9IK9LSfG7xLQ/aw8RaAIbBLvL/4nGg526WF1uL9mLhLO+C
	ak+ttzA3m07VvcLF0tBMYJ1d8VQbh8Ys5esDKFO0LZajFrLkVlDyHE8hK8+NT2B7oJu5HCCKq4Z+9
	isGy+feNbqMOP4Ekfe6VqbgaPhZY0Bvgf4eCMpkeE/rOb63qMajMgG7o/O9dcBdmGm+rrIJC4/K1k
	uVv7EvJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txTCw-00000008wGc-2t1i;
	Wed, 26 Mar 2025 16:02:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txSnv-00000008sev-37ve
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 15:36:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1743003391; x=1774539391;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=336TRgbLvYKh+AeFJ4NUZBlcZovnPjauRJIcAFMcWLk=;
  b=lTd3K4gDh4lBsdv2UyADPFIoCt5LRKehgViHBgVkpE+sXx+erfKXTFj4
   jNniFMopNXFdNb0ZQfqi9sE37HKTmRqPNxP/zcwFEg26pUhF9fWOUBEa+
   lORKLwGDlZwg/ZNZeMG7AMNIUss3ESodB3PTEtcBTLqGBbbMBmW6EcQi4
   dNLyQ1wsmZPwo26pC0SKcxWQohGEye9jIwz6gY9gD64ZUjJR8hMZjivRP
   R2kQ4iOrq47bDwmGwd5H+HGWX2Kr65o7vfPU9Fwqj0CWoML+vkyIf5tjT
   jajXOvWgrR9vq7WNRZ4o00g7syOoQe7VPfTCLlctxdcFv6GWJ4CijQtMv
   A==;
X-CSE-ConnectionGUID: NRxSiTFnT3ucBnaYj7CaZg==
X-CSE-MsgGUID: vHwFJPuuR/W4/UZnO2jmAw==
X-IronPort-AV: E=Sophos;i="6.14,278,1736838000"; 
   d="scan'208";a="44096094"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Mar 2025 08:36:28 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 26 Mar 2025 08:35:50 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Wed, 26 Mar 2025 08:35:50 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <lee@kernel.org>, <sre@kernel.org>,
	<p.zabel@pengutronix.de>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH v4 00/11] Enable Power Modes Support for SAMA7D65 SoC
Date: Wed, 26 Mar 2025 08:35:33 -0700
Message-ID: <cover.1742936082.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_083631_866466_D888ECC1 
X-CRM114-Status: GOOD (  17.31  )
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

v1) https://lore.kernel.org/linux-arm-kernel/cover.1738257860.git.Ryan.Wanner@microchip.com/
v2) https://lore.kernel.org/linux-arm-kernel/cover.1739221064.git.Ryan.Wanner@microchip.com/
v3) https://lore.kernel.org/linux-arm-kernel/cover.1740671156.git.Ryan.Wanner@microchip.com/T/#m576233e7af84d68559afb286884c2b9294e7bc1d 

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


