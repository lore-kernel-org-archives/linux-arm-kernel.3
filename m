Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0041C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 17:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BzZrYKJ719TbfYyFhu6sPQe5KNJvUX1XlD0RKATByZ4=; b=yHWyNKbGGl9xJ7
	2q0iB1JIaN7YArS4Uuze9B8Rahs9XY/4b7AIXJ8cL7gnu5ukr6N/nRI34ZXVRA5+iZpfCQgl7KM4u
	BTJGjsu2DCq7RvVOESZVRTwD5AqDnrn+F3262wScoo5+B9PX+ACoTn6ANV8jeR3BIug6jjwvr/Lz5
	PigzPiwRpDfjAN3ihaeDrUWLHsJoHFIhwmtl6dVWtqycAIj/wS/jmYmrTtcWkZvVYLpl1jy+O3CXx
	FX7mz5SRfzzRsLVjzbLfNmNIQNTg5FOgRX58IxgVH9wBxln/sNdUT+fFtaQT2RU/eKK3TgIUl3nWj
	EnqaXhDAVqsz9Uvq8KMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulsg9-0000000BXoE-2GtO;
	Tue, 12 Aug 2025 17:20:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulpPO-0000000Aycz-0rgt
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 12 Aug 2025 13:51:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=BzZrYKJ719TbfYyFhu6sPQe5KNJvUX1XlD0RKATByZ4=; b=FiPKZAsjfQ88Rd9Vkr7FB3Rw5F
	iJWThR8FblcqNkZYfgJZQ3z0BQAkoXz8jA9GrfTs2PjgjtGaAX72rNPNSwtFR+w4xkMZhQU3us8my
	b/KWk+amPRB971eDVBzrNSsYD7mIvqHjoajXFpNiG5Z8v2y0nji+L8mUqUGlAl0My92b2ncbLcb4p
	9oVurLPL664AU9D4Ky3ZTgeOmYRuZAXNlsVhKIy3rMR0/vFu4Q7h+UlhKeKDaN/VVHyjqRIY87zek
	5RpiY/des7wpVJC58trMnSJOKsozMzEB6O0ifukIgjdXEj1yF1EPH3tawk671SC3ssa/KiXMhiPVj
	E27hNlJg==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulpPL-0000000Fp9B-05lA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 13:51:21 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CDPppH020872;
	Tue, 12 Aug 2025 15:50:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=BzZrYKJ719TbfYyFhu6sPQ
	e5KNJvUX1XlD0RKATByZ4=; b=PmKbGT2TzkhAh88PnD4Anecg5M6xIqDTmv8LQL
	SrWNvir8a1v67es6iyr0qfdyrJlWgbF2zHdRWrjveb4Px4X5xGaVaWEs8pJlpu8t
	GQTPpuZz8lArUDB+AfacacPIoPLiQ1Oz85zdmtJJXSKrMwG6PDeQn9vcuOyjYIQY
	HL8UGlMr8kFwN/+tgOUPPr1ZdxxQ0ptz/1Y5DAKQnnF7YsTxDLz1Zb2qSN92q81j
	svAPuKUi5m0ONvfqTFD9TN+NuZ+8Vg27wMx2RIT8jENHK/ciEYHcVHLqPQTrFa61
	mMsAvX34JMpDtuSL3wyjr0Zi0y/oHwg3p7rZmo7SGtPW5HqQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48dwp1tvsw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 15:50:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6C6BD40048;
	Tue, 12 Aug 2025 15:49:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C98E37835C8;
	Tue, 12 Aug 2025 15:48:59 +0200 (CEST)
Received: from localhost (10.130.74.180) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Aug
 2025 15:48:59 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Subject: [PATCH v2 00/13] Enable display support for STM32MP25
Date: Tue, 12 Aug 2025 15:48:57 +0200
Message-ID: <20250812-drm-misc-next-v2-0-132fd84463d7@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAElGm2gC/13MywqDMBCF4VeRWXckCYmXrnyP4kLipM5CUzIiF
 vHdm9pdl/+B8x0glJgE7sUBiTYWjksOcyvAT8PyJOQxNxhlnKp0jWOacWbxuNC+oh2CVZXX3ro
 A+fNKFHi/vEefe2JZY3pf/Ka/60+qjfuTNo0KB9c2tqHK+NB2IYqUspY+ztCf5/kBvG0dVKwAA
 AA=
X-Change-ID: 20250617-drm-misc-next-4af406c1c45f
To: Yannick Fertre <yannick.fertre@foss.st.com>,
        Philippe Cornu
	<philippe.cornu@foss.st.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Christophe Roullier
	<christophe.roullier@foss.st.com>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.130.74.180]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_145119_209350_4CE0C1EE 
X-CRM114-Status: GOOD (  16.92  )
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

This series aims to add and enable sufficient LVDS display support for
STM32MP257F-EV1 board.

LVDS is the default use case to drive a display panel on STM32MP257F-EV,
even though DSI panels will be supported in the near future.

The LTDC needs a pixel rate in sync with the bridge currently in use.
For that both DSI and LVDS bridges need to declare an internal clock and
become clock provider to the mux. The mux then selects the reference
clock for the LTDC pixel rate generation.

For now this mux is handled internally in the LTDC, while waiting for
the STM32 clock framework to merge a 'clk-mux' based on the SYSCFG.
This explains the link done in the patch [7/8] between the LVDS,
providing the reference clock for the LTDC internals.

  +----------+              |\
  |  DSI PHY |------------->| \           +------------+
  |          |ck_dsi_phy    |  |          |            |
  +----------+              |  |--------->|    LTDC    |
  +----------+              |  |pixel_clk |            |
  | LVDS PHY |------------->|  |          +------------+
  |          |clk_pix_lvds  |  |
  +----------+              |  |
                            |  |
   ck_ker_ltdc ------------>| /
                            |/|
                              └- SYSCFG

Clock selection applies as follow:
- 0b00: Selects ck_dsi_phy
- 0b01: Selects clk_pix_lvds
- 0b10: Selects ck_ker_ltdc (for parallel or DSI display).
- 0b11: Reserved

The reset value of the register controlling the mux is 0b01, meaning
that the default clock assigned is the clk_pix_lvds.  This causes two
things:

- In order to get basic display on the LVDS encoder, like intended,
nothing has to be done on this mux within the LTDC driver (which for now
explains the unused syscfg phandle on the LTDC node in the device-tree).

- 'pixel_clk' is dependent from 'clk_pix_lvds' because of the LTDC clock
domains.  They also need to be sync to get a coherent pixel rate though
the display clock tree (which explains the LVDS phandle on the LTDC node
in the device-tree).

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
Changes in v2:
- Documentation:
  - Add support for new compatible "st,stm32mp255-lvds"
  - Change LTDC compatible for SoC compliant one
  - Make clearer LTDC clock-names property
- Devicetree:
  - Change compatible according to the documentation
  - Change clock and clock-names order to match documentation (and avoid
    warnings)
- Drivers:
  - Change LTDC compatible
- Add Rob's trailer where relevant
- Link to v1: https://lore.kernel.org/r/20250725-drm-misc-next-v1-0-a59848e62cf9@foss.st.com

---
Raphael Gallais-Pou (11):
      dt-bindings: display: st: add new compatible to LTDC device
      dt-bindings: display: st,stm32-ltdc: add access-controllers property
      dt-bindings: display: st: add new compatible to LVDS device
      dt-bindings: display: st,stm32mp25-lvds: add access-controllers property
      dt-bindings: display: st,stm32mp25-lvds: add power-domains property
      dt-bindings: arm: stm32: add required #clock-cells property
      arm64: dts: st: add ltdc support on stm32mp251
      arm64: dts: st: add lvds support on stm32mp255
      arm64: dts: st: add clock-cells to syscfg node on stm32mp251
      arm64: dts: st: enable display support on stm32mp257f-ev1 board
      arm64: dts: st: add loopback clocks on LTDC node

Yannick Fertre (2):
      drm/stm: ltdc: support new hardware version for STM32MP25 SoC
      drm/stm: ltdc: handle lvds pixel clock

 .../bindings/arm/stm32/st,stm32-syscon.yaml        | 31 ++++++---
 .../devicetree/bindings/display/st,stm32-ltdc.yaml | 33 ++++++++-
 .../bindings/display/st,stm32mp25-lvds.yaml        | 14 +++-
 arch/arm64/boot/dts/st/stm32mp251.dtsi             | 19 ++++++
 arch/arm64/boot/dts/st/stm32mp255.dtsi             | 19 +++++-
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         | 79 ++++++++++++++++++++++
 drivers/gpu/drm/stm/drv.c                          | 11 ++-
 drivers/gpu/drm/stm/ltdc.c                         | 57 +++++++++++++++-
 drivers/gpu/drm/stm/ltdc.h                         |  6 ++
 9 files changed, 251 insertions(+), 18 deletions(-)
---
base-commit: e48123c607a0db8b9ad02f83c8c3d39918dbda06
change-id: 20250617-drm-misc-next-4af406c1c45f

Best regards,
-- 
Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>


