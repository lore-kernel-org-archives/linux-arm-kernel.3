Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0B9C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 09:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tCWRx9blVLo2MHJp/AlQoy3RKo+LifsE/1Ub3YI6nPk=; b=k8ZXvJBkfSag9Y7vuYaqGR31gR
	AQgSo9FxWSsqG/jm3Tl1to7NQV+WEozO8pLGdRS/MJjTPfCfkn20zP5lmtKgSGqI5vy6fxib3b/Aw
	YhBGtm3VBWh2VKiGCWB5/8n6H7Qvgci3RvxzbI+ilVAfivqlj+xJW0mcG0Ji+z7lh+Uaz98S0e83y
	IA8GBliDu+PaNnIkdn5Mt4eCJJjpKmF9D2ZXbIzLriWewdAw66SNNo9Goz4iaCZgkGmhtGLPgJx3q
	1UyHzbatOplfRhwEkic47PLluq+tYAHbZSnMIqorbDRV+JtvGxZxr8OMNPAluxoLckHskkvnTSff+
	73TK6X7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCxng-00000000I01-07ul;
	Thu, 08 May 2025 09:44:20 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCxLU-00000000E3B-15HH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 09:15:13 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5489Eu041632377
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 May 2025 04:14:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746695697;
	bh=tCWRx9blVLo2MHJp/AlQoy3RKo+LifsE/1Ub3YI6nPk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=NTGxcJo9C990KXUqnUytKX6hvo41EHMnaG6qSNlTRc7U7s3G4+8Ozibr60ytnyEHx
	 Juei0isYJVhjsCxV6Ug7vyJ+cA7Kx4O21oCYIpedZcXzuW1za22jwrRlWPQ0+khste
	 K7aUOpbnA7iCjtbm6U4PGLewMo55WZdwk6Fc15TY=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5489Eupj049704
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 May 2025 04:14:56 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 May 2025 04:14:56 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 May 2025 04:14:56 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5489EtRr110324;
	Thu, 8 May 2025 04:14:56 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>
Subject: [PATCH v3 1/3] dt-bindings: arm: ti: Add bindings for AM62D2 SoC
Date: Thu, 8 May 2025 14:44:20 +0530
Message-ID: <20250508091422.288876-2-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250508091422.288876-1-p-bhagat@ti.com>
References: <20250508091422.288876-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_021512_389097_A66886AD 
X-CRM114-Status: GOOD (  10.87  )
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

This SoC is part K3 AM62x family, which includes the AM62A and AM62P
variants. While the AM62A and AM62D are largely similar, the AM62D is
specifically targeted for general-purpose DSP applications, whereas the
AM62A focuses on edge AI workloads. A key distinction is that the AM62D
does not include multimedia components such as the video encoder/decoder,
MJPEG encoder, Vision Processing Accelerator (VPAC) for image signal
processing, or the display subsystem. Additionally, the AM62D has a
different pin configuration compared to the AM62A, which impacts embedded
software development.

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


