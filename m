Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CDE106F30F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 09:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SBvHjPHjWOcno+Dnp8Xm6RKHPzOi8PtR/4JylO51848=; b=m54enzo4g4acb2hEvqow1qbHKS
	cHhCWDdX6et/IrIUNracSHAMjthBjwMWGlEMwTmrVI6mQFM30iRsvRIlwqIHopjFnH+B1/RLm/mBN
	r0ZkiG3dArzMPpd51JJ7ZGKgxhmgRcbcoQr02jl0R0WLafCJSQ8TiGg46N241RunVu7DXQiLIAO+3
	EID+kaz5F0w24XMAK2CcnW6QA1M0Malit10yS2Ije23Cnh6NXTuKiIr9EhBsgiTtGidQCnHO3SyCx
	VsfUGXIy+8jg0Tt9t9e+RTM4hhzSyBZX9QBtG8HHluyPb+/Nbu+V40CEdnp5/RO2UheNPayJOPUkl
	xs/6gt0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gze-0000000595j-41LR;
	Thu, 26 Mar 2026 09:27:10 +0000
Received: from [64.106.246.77] (helo=mail-sc.amlogic.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gzY-00000005942-2RID;
	Thu, 26 Mar 2026 09:27:10 +0000
Received: from rd03-sz.software.amlogic (10.28.11.121) by mailsc.amlogic.com
 (10.8.11.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 26 Mar
 2026 02:25:58 -0700
From: Jian Hu <jian.hu@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, Stephen Boyd
	<sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, robh+dt
	<robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Jian Hu <jian.hu@amlogic.com>, devicetree <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>, linux-amlogic
	<linux-amlogic@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Ronald Claveau
	<linux-kernel-dev@aliel.fr>, Ferass El Hafidi <funderscore@postmarketos.org>
Subject: [PATCH v3 0/3] Add the missing mpll3 clock and clock controller nodes
Date: Thu, 26 Mar 2026 17:26:42 +0800
Message-ID: <20260326092645.1053261-1-jian.hu@amlogic.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.28.11.121]
X-ClientProxiedBy: mailsh.amlogic.com (10.18.11.5) To mailsc.amlogic.com
 (10.8.11.35)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_022709_358381_E660DE5B 
X-CRM114-Status: GOOD (  14.33  )
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

This series adds the missing mpll3 parent clock and completes the
Amlogic T7 SoC clock controller DT support.

- Fix redundant hyphen in for gp1 pll
- Add the missing mpll3 parent clock definition to t7-peripherals-clkc.yaml
- Add Amlogic T7 SoC clock controller nodes

Changes in v3 since v2 at [2]:

- Move Ronald's SoB tag to the top (as original author of the base patches)
- Add Krzysztof's Reviewed-by for Patch 2
- Update cover letter structure for clarity

Changes in v2 since v1 at [1]:

- Add Ronald Claveau's Signed-off-by to the first and third patches
- Fix compilation error for amlogic-peripherals-clkc.yaml
- Update commit message for amlogic-peripherals-clkc.yaml
- Add Fixes tag
- Remove the blank line in the watchdog node of meson-t7.dtsi
- Add 'reg' property to sram node
- Add a space after the clock controller label

### Background
This series is based on Ronald's initial T7 clock series [3], which aimed
to enable T7 EMMC DT but lacked a complete clock controller implementation.
The T7 clock tree in Ronald's series (fixed PLL, fixed fdivX and sys clocks)
is handled by the SCP firmware via SCMI [4]. Therefore, his clock drivers
do not need to be added. I have discussed with Ronald and agreed that I
will submit the T7 clock DT first, then he can proceed with his EMMC work.

### Series Overview
1. Patch 1: Fix redundant hyphen in amlogic,t7-pll-clkc DT binding
   - Based on Ronald's "[3/7] dt-bindings: clk: meson: Add Amlogic T7 fix pll support"
2. Patch 2: Add missing mpll3 parent clock definition to t7-peripherals-clkc.yaml
3. Patch 3: Add complete T7 clock controller nodes
   - Based on Ronald's initial PLL and peripheral clock nodes
   - Remove unused fixed PLL node
   - Add PCIe and HDMI PLL nodes
   - Add SCMI clock nodes for clocks handled by SCP firmware
   - Update fixed clock index in peripheral clock nodes
   - Add gp1 and mpll1 clock index in peripheral clock nodes

### Dependencies
- Patch 3 depends on Patch 2

### ABI Risk
The amlogic,t7-peripherals-clkc DT binding was merged in v7.0-rc1 [5],
but the corresponding Amlogic T7 SoC DT has not been submitted upstream
yet. Thus, no real users or systems are affected by the DT binding ABI
breakage in this series.

### Credit
- Patch 1 is based on Ronald's "[PATCH 3/7] dt-bindings: clk: meson: Add Amlogic T7 fix pll support"
- Patch 3 is based on Ronald's "[6/7] arm64: dts: amlogic: Add clock and EMMC for T7"
- Patch 1 and Patch 3 retain Ronald's Signed-off-by
- Thanks to Ronald for pointing out the gp1 pll typo and initial clock work

[1]: https://lore.kernel.org/all/20260305074328.639993-1-jian.hu@amlogic.com
[2]: https://lore.kernel.org/all/20260313070022.700437-1-jian.hu@amlogic.com/
[3]: https://lore.kernel.org/all/20260218101709.35450-1-linux-kernel-dev@aliel.fr/
[4]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/dt-bindings/clock/amlogic,t7-scmi.h
[5]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml?h=v7.0-rc1

Jian Hu (3):
  dt-bindings: clock: amlogic: Fix redundant hyphen in
    "amlogic,t7-gp1--pll" string.
  dt-bindings: clock: amlogic: t7: Add missing mpll3 parent clock
  arm64: dts: amlogic: t7: Add clock controller nodes

 .../clock/amlogic,t7-peripherals-clkc.yaml    |  12 +-
 .../bindings/clock/amlogic,t7-pll-clkc.yaml   |   2 +-
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   | 125 ++++++++++++++++++
 3 files changed, 134 insertions(+), 5 deletions(-)

-- 
2.47.1


