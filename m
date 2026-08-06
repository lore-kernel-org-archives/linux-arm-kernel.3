Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0D6C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 08:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8hijovbAFnss7Yyadpw60D5hqHw+OG1acDxHEX64xrU=; b=0Rzf/j95IXB/thWM/SC5ZCFET8
	IfuMxhkMmVhgG2yHSLh83xGufPwZzGIL5rI2UAIIADeunDog0dPe9dtXpSuwmnhFv4sRuT29nu4OL
	Ol10pvm0kLl08vnooN/iYkqbib9yZZIOgEhP/Pw+rB1HeR5IHR7Jxyw4OTFHd3VpOiYKqwLrcGPY2
	2/oXXmeBCA1OnhQEmjnTUeprJ8xE+DW/exW480fDYqiBNW8w5rY5araryW6K0A0xXSA1/Ri+xdsmt
	l5vIvyDefRUB3dN83W9HRJSh4DtcbWuvn1t447TcXfmBetjXddZGh7p8PckyltkIGHL2ms8Wny7jK
	wPlG5fEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtkW-00000005HGX-44SA;
	Thu, 06 Aug 2026 08:46:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtkT-00000005HFv-3zFH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 08:46:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1786006006; x=1817542006;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=M7trVMqOss0CKTWdPfqLkrWNZSFKd0kI14xCgu/yMRg=;
  b=ZjigekFMB93vm+iEN3h7SWFGfOTRD7HABbV34gM3Ll1EQVgAYaXu6NZB
   UM73jjgtaPrcIBMG3py4/Q3vriswPmf6qbmgmCk5t3b3QeNmWYc4DifMY
   POFvbdYHzOU01pSZT6evDGSiHg9Jaxh56eIW8E592Tf63fOQIhTsJyAwy
   zkiRjxfsVD+3R0/ti2r5I0Px2xMBXFJzMb/W7V91T47zq3WcofI8/mJSD
   U9fVWR7LqFTGkg3Y9y1k2GwqnzAEr4fCi9oNrjZqIj8MnK8GPFbruJB3G
   e+gbYF5fzME7HgXCbiBTsgpHD3qELlEv1XYLinqGdPXkRmhmMvzYjxT8m
   Q==;
X-CSE-ConnectionGUID: zcac2EoRQDu2ajy4au5G5A==
X-CSE-MsgGUID: PztgeF3cSHqRXHJeu+TDGg==
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="293114454"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 01:46:45 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Thu, 6 Aug 2026 01:46:44 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 6 Aug 2026 01:46:35 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <ehristev@kernel.org>, <jic23@kernel.org>, <dlechner@baylibre.com>,
	<nuno.sa@analog.com>, <andy@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<srini@kernel.org>, <marcelo.schmitt@analog.com>, <radu.sabau@analog.com>,
	<joshua.crofts1@gmail.com>, <jorge.marques@analog.com>,
	<Jonathan.Santos@analog.com>, <jishnu.prakash@oss.qualcomm.com>,
	<antoniu.miclaus@analog.com>, <duje@dujemihanovic.xyz>,
	<mazziesaccount@gmail.com>, <varshini.rajendran@microchip.com>,
	<linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 00/17] Add thermal management support for sama7d65
Date: Thu, 6 Aug 2026 13:10:07 +0530
Message-ID: <20260806074024.531259-1-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_014646_200726_1B6C29D0 
X-CRM114-Status: GOOD (  22.71  )
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

Thermal management system of sama7d65 includes:

- Temperature sensor as a part of ADC channel
- Temperature calibration data retrieved from the OTP memory for
  improved accuracy of the readings
- DVFS implementation
- Thermal system with DVFS as cooling cell.

This patch series adds support for the following:

- Tag-based packet lookup for the NVMEM OTPC driver while preserving
  backward compatibility with existing ID-based access
- Temperature calibration layout handling in the ADC driver to support
  different SoC-specific calibration data formats
- ADC driver adaptation for sama7d65
- DT nodes for OTP, ADC, temperature sensor, and thermal zones for
  sama7d65

Changes in v6:
	- Moved DEFINE_FREE helper outside the CONFIG_NVMEM conditional
	  #if / #else block

Link to v5: https://lore.kernel.org/lkml/20260804113338.261782-1-varshini.rajendran@microchip.com/

Changes in v5:
	- Placed the DEFINE_FREE helper in the header file and added it as a
	  new commit
	- Added IS_ERR_OR_NULL(_T) condition to the DEFINE_FREE of nvmem_cell_put
	- Reorder signing tags alphabetically in Patch 1
	- Kept the changes minimal by retaining ret variable
	- Collected the Rb tags

Link to v4: https://lore.kernel.org/lkml/20260727122633.117435-1-varshini.rajendran@microchip.com/

Changes in v4:
	- Reworked cleanup.h usage: define and assign __free() variables at point
	  of use after early returns, add DEFINE_FREE(nvmem_cell_put, ...) for
	  nvmem_cell cleanup
	- Split patch 3/13 into two: refactoring (layout struct) and tag validation
	- Used struct u32_fract for p1 scaling factors
	- Return -ENODEV instead of -EINVAL when layout is missing
	- New precursor patch to remove unnecessary casts in of_device_id
	- Removed trailing comma from single-line initializer array
	- Moved emulation mode validation into a separate patch
	- Added FourCC validation for packet tags; invalid tags fall back to ID-only
	  access
	- Mentioned FourCC in commit message and comments
	- Used intermediate variable for off % 4
	- Rename tmp → mr_val, val→ tag
	- Addressed style issues: Removed comment blocks, put functions in
	  one line
	- Remove blank line after compatible in regulator node
	- Reorder properties.

Link to v3: https://lore.kernel.org/lkml/20260630093603.38663-1-varshini.rajendran@microchip.com/

Changes in v3:
    - Updated the commit message with reasoning for a new compatible
      without a fallback (sama7d65-adc)
    - Split patch 2/12 into two patches: a patch with cleanup.h changes only
      and the rework patch
    - Added comment explaining the TAG ACST
    - Fixed the holes identified in the at91_adc_platform struct by
      pahole tool
    - Dropped labels in the dt document example
    - Added temp variable in mchp_otpc_resolve_packet() to avoid % and /
      operations in the same instruction (avoiding compiler optimization)
    - Added the SoC details in the ADC driver Kconfig help section
    - Maintained reverse xmas ordering in declarations
    - Fixed node ordering (alphabetically) in the board dts file

Link to v2: https://lore.kernel.org/lkml/20260623105944.128840-1-varshini.rajendran@microchip.com/

Changes in v2:
    - Preserved backward compatibility with ID-based packet lookup to
      avoid breaking existing users
    - Removed sama7g5 DTS changes (not needed with backward compatible
      driver - will be sent later to update to the new access method)
    - Preserved the packet data structure returned not to break the
      consumers
    - Reworked ADC driver to use a calibration layout structure instead of
      hardcoded indexes, for scalability
    - Fixed kernel-doc Return section
    - Removed stray blank line in mchp_otpc_read()
    - Removed unnecessary UL suffix in writel_relaxed()
    - Dropped unused packet types
    - Fixed stray spaces before exclamation marks in error messages
    - Added ASCII representation to TAG macro definition
    - Removed odd MAX enum with trailing comma and refactored
    - Moved DTS patches to the end of series
    - Used cleanup.h helpers for NVMEM data buffer handling in ADC driver
    - Combined multiple v1 patches into logical units
    - Used correct subject prefixes for dt-bindings patches
    - Used fixed-layout NVMEM syntax for sama7d65 DTS and binding
      instead of deprecated syntax
    - Added cpu-supply linkage for proper DVFS voltage scaling
    - Updated stale stride=4 comment in dt-bindings header

Link to v1: https://lore.kernel.org/linux-arm-kernel/20250804100219.63325-1-varshini.rajendran@microchip.com/

Varshini Rajendran (17):
  dt-bindings: iio: adc: at91-sama5d2: document sama7d65
  nvmem: add DEFINE_FREE for nvmem_cell_put cleanup
  iio: adc: at91-sama5d2_adc: use cleanup.h for NVMEM buffer
  iio: adc: at91-sama5d2_adc: rework temp calibration layout handling
  iio: adc: at91-sama5d2_adc: add condition to validate calibration data
  iio: adc: at91-sama5d2_adc: remove unnecessary casts in of_device_id
  iio: adc: at91-sama5d2_adc: adapt the driver for sama7d65
  dt-bindings: nvmem: microchip,sama7g5-otpc: add sama7d65 and dt node
    example
  nvmem: microchip-otpc: nvmem: microchip-otpc: add tag-based packet
    lookup
  nvmem: microchip-otpc: nvmem: add emulation mode and OTP access
    validation
  ARM: dts: microchip: sama7d65: add cpu opps
  ARM: dts: microchip: sama7d65: Add ADC node
  ARM: dts: microchip: sama7d65_curiosity: Enable ADC, DVFS
  ARM: dts: microchip: sama7d65: add otpc node
  ARM: dts: microchip: sama7d65: add cells for temperature calibration
  ARM: dts: microchip: sama7d65: add temperature sensor
  ARM: dts: microchip: sama7d65: add thermal zones node

 .../bindings/iio/adc/atmel,sama5d2-adc.yaml   |   1 +
 .../nvmem/microchip,sama7g5-otpc.yaml         |  28 +++-
 .../dts/microchip/at91-sama7d65_curiosity.dts |  27 ++++
 arch/arm/boot/dts/microchip/sama7d65.dtsi     | 131 +++++++++++++++++
 drivers/iio/adc/Kconfig                       |   2 +-
 drivers/iio/adc/at91-sama5d2_adc.c            | 124 +++++++++++-----
 drivers/nvmem/microchip-otpc.c                | 133 ++++++++++++++++--
 .../nvmem/microchip,sama7g5-otpc.h            |   4 +-
 include/linux/nvmem-consumer.h                |   3 +
 9 files changed, 403 insertions(+), 50 deletions(-)

-- 
2.34.1


