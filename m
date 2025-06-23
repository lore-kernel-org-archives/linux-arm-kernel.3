Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB41BC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 00:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sbYIPEArgEjkhtMURHidg8ZEr50Ni3vsZ4/42HdWJTs=; b=NUoulEy6kGwVr9bIEC/QSEMC8/
	n5Z4UDIvMEiq+dVXSTSvY1nQ7MgP4zWMPgKq2nzdPH/ZeMcgXXYeZb/SFf+v2zMNzSFa7pk11zVoD
	XFnrTSCgM+4mPlj9xSJ1EV6Or3t5qwOgRxfQYGflfbQb5jCC9oDWIFIubgytwM9CyGBHQbNaquUub
	kM06zi6xcfSCO8axvaqmgOeGBoPHpPyZzO880um7BOeB43bAIV3LkwfZtUQB2qcKnSnVYn4ZTlHWf
	8pw6xWEmZpcL9Afhm4xw2ojCDIezTOiVg/aD8thhrWB20qAQoIgWQkHl4/TiBeVnyfZd7/fp28AyS
	uDeBGDbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrZE-00000004F4r-3BhC;
	Tue, 24 Jun 2025 00:31:16 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThvP-00000002zvE-2Adt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 14:13:32 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55NEDSp21572760;
	Mon, 23 Jun 2025 09:13:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750688008;
	bh=sbYIPEArgEjkhtMURHidg8ZEr50Ni3vsZ4/42HdWJTs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Fnz5H5j2zI7SdKPtnPbkM9GCjc+F5svU5yBSka91Ffjq/Dv0CCEALDD8GeFxnGkkd
	 H49Kb2SqkfhHAUm5AtFmcOkbLLY7Gggo1gh5qEXcLUTOv9BRdbjQzZGPkLJos4lCDI
	 YTiqgsPMq329LJkwWKg6hMKTEfXgWc/sRcQYcueI=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55NEDSKY574346
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 23 Jun 2025 09:13:28 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 23
 Jun 2025 09:13:27 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 23 Jun 2025 09:13:27 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55NEDQC4050246;
	Mon, 23 Jun 2025 09:13:27 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <devarsht@ti.com>
Subject: [PATCHv4 2/6] dt-bindings: arm: ti: Add bindings for AM62D2 SoC
Date: Mon, 23 Jun 2025 19:42:49 +0530
Message-ID: <20250623141253.3519546-3-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623141253.3519546-1-p-bhagat@ti.com>
References: <20250623141253.3519546-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_071331_652170_FAF95B47 
X-CRM114-Status: GOOD (  10.06  )
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

The AM62D2 SoC belongs to the K3 Multicore SoC architecture with DSP core
targeted for applications needing high-performance Digital Signal
Processing. It is used in applications like automotive audio systems,
professional sound equipment, radar and radio for aerospace, sonar in
marine devices, and ultrasound in medical imaging. It also supports
precise signal analysis in test and measurement tools.

Some highlights of AM62D2 SoC are:

* Quad-Cortex-A53s (running up to 1.4GHz) in a single cluster. Dual/Single
  core variants are provided in the same package to allow HW compatible
  designs.
* One Device manager Cortex-R5F for system power and resource management,
  and one Cortex-R5F for Functional Safety or general-purpose usage.
* DSP with Matrix Multiplication Accelerator(MMA) (up to 2 TOPS) based on
  single core C7x.
* 3x Multichannel Audio Serial Ports (McASP) Up to 4/6/16 Serial Data Pins
  which can Transmit and Receive Clocks up to 50MHz, with multi-channel I2S
  and TDM Audio inputs and outputs.
* Integrated Giga-bit Ethernet switch supporting up to a total of two
  external ports with TSN capable to enable audio networking features such
  as, Ethernet Audio Video Bridging (eAVB) and Dante.
* 9xUARTs, 5xSPI, 6xI2C, 2xUSB2, 3xCAN-FD, 3x eMMC and SD, OSPI memory
  controller, 1x CSI-RX-4L for Camera, eCAP/eQEP, ePWM, among other
  peripherals.
* Dedicated Centralized Hardware Security Module with support for secure
  boot, debug security and crypto acceleration and trusted execution
  environment.
* One 32 bit DDR Subsystem that supports LPDDR4, DDR4 memory types.
* Low power mode support: Partial IO support for CAN/GPIO/UART wakeup.

This SoC is of part K3 AM62x family, which includes the AM62A and AM62P
variants. While the AM62A and AM62D are largely similar, the AM62D is
specifically targeted for general-purpose DSP applications, whereas the
AM62A focuses on edge AI workloads. A key distinction is that the AM62D
does not include multimedia components such as the video encoder/decoder,
MJPEG encoder, Vision Processing Accelerator (VPAC) for image signal
processing, or the display subsystem. Additionally, the AM62D has a
different pin configuration compared to the AM62A, which impacts
embedded software development.

This adds dt bindings for TI's AM62D2 family of devices.

More details about the SoCs can be found in the Technical Reference Manual:
https://www.ti.com/lit/pdf/sprujd4

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index bf6003d8fb76..e80c653fa438 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -25,6 +25,12 @@ properties:
               - ti,am62a7-sk
           - const: ti,am62a7
 
+      - description: K3 AM62D2 SoC and Boards
+        items:
+          - enum:
+              - ti,am62d2-evm
+          - const: ti,am62d2
+
       - description: K3 AM62A7 SoC PHYTEC phyBOARD-Lyra
         items:
           - const: phytec,am62a7-phyboard-lyra-rdk
-- 
2.34.1


