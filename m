Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF42C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 15:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uNQA/OE3+BB7QMb6SFZmGKBaLktb4sGzmpvgmpR3/vc=; b=daCQ2XEU9/4aQ7xzW5GcC4t0S2
	Jzx8XkPe3F6v/ZN3JqjpoX070hN6534f6PcLZq6XPDLxHclin8OUTuFVA3pIfFqaLomaDPV2aZIvD
	7pvKQ+AwjEoao6vRNTXHEiqeFVlFnkwE2GggoB6nvdCOzwVg+ojvAtLmFO63YnOxIqPmgE+9begFW
	v+635d6kzcsR/koOVpTfvHSXh82EwKm/3+td+JirEIvm3IZEEc+bkCwfnLANizmMprW5oRg9DTEO/
	ZyHbGOn/6RPSmFRNwbDi8sMK0LHemO8sp705IBh5/rz5xAm7xxdNB3AlEAlpuG0ve5p0QtmpabP3G
	nF2+WqMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAsbx-00000002Nyw-3Wiv;
	Fri, 02 May 2025 15:47:37 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAsUQ-00000002MZt-27iu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 15:39:51 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542FdlVG3896456
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 10:39:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746200387;
	bh=uNQA/OE3+BB7QMb6SFZmGKBaLktb4sGzmpvgmpR3/vc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=XJXb5oxzVo8WGPdFS5XNTsrbfIPHAgWViBb5H0INP0YHg6Huzrblp/pqAF6FYQVk7
	 tfBSgC8Nk3dI3SuAm0thBGoHzDg1lchGZMZL0WMZ0Ob0YNMv54oZ8p5MQVau3xHJ68
	 s09JEURLqVrXc/ygzQQLnm7llooygufBhMB6JffA=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542Fdlw6042358
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 10:39:47 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 10:39:46 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 10:39:46 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542Fdkjx058821;
	Fri, 2 May 2025 10:39:46 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: ti: Add bindings for AM62D2 SoC
Date: Fri, 2 May 2025 21:09:13 +0530
Message-ID: <20250502153915.734932-2-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250502153915.734932-1-p-bhagat@ti.com>
References: <20250502153915.734932-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_083950_636258_AB7F34BC 
X-CRM114-Status: GOOD (  10.37  )
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

This adds dt bindings for TI's AM62D2 family of devices.

More details about the SoCs can be found in the Technical Reference Manual:
https://www.ti.com/lit/pdf/sprujd4

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index a6d9fd0bcaba..bac821d63cf1 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -31,6 +31,12 @@ properties:
           - const: phytec,am62a-phycore-som
           - const: ti,am62a7
 
+      - description: K3 AM62D2 SoC and Boards
+        items:
+          - enum:
+              - ti,am62d2-evm
+          - const: ti,am62d2
+
       - description: K3 AM62P5 SoC and Boards
         items:
           - enum:
-- 
2.34.1


