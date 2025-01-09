Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51AA3E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 20:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IEa18ie8DTllVVPJfMHrQACNyqSH9sbtwipii9X8L7k=; b=R2W+VLIesKCQXj
	9naISASoilIBjn2r24INGIdHs57ZNOWZlnsnhULF6T/hu2Ohw2/e2a5f4497TWyk1tjizqATw1P8t
	nb5p7u0fYzIEw9pbldWc3ETXEFA/uBqIhoLWdcJqisXdeIaui3GMSdmrrRYTax6xTz099JM19ZUy5
	IBvLr9x4CoBbYx2mU4eBmmC25gj0lI/xhve/i6tNyCtAunkKr6U+ET07lYnbUng/MFE5mQQXvhqlU
	Rqg6jj9cAai0Y27qNlw9vQZDh8GA4NtizBQiaLJrZLjT2HRBhC5s4GDnSOZ22y4fvIRLRDeMdLtu+
	uvFHLGGrHWYRS6yxz6IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVz4J-0000000DE2E-3Tzx;
	Thu, 09 Jan 2025 20:23:51 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVz0m-0000000DDRO-0UeP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 20:20:13 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 509KK4tn3208660
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jan 2025 14:20:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736454004;
	bh=IEa18ie8DTllVVPJfMHrQACNyqSH9sbtwipii9X8L7k=;
	h=From:Subject:Date:To:CC;
	b=KpACpZrqchQuLwJDvHl/jQBzoT/B1M7kEQswCqe6pnuUa2PR0xpJq8WcS2t6Y0jIv
	 cTawl/uFRX0OzTVZGE4KbkA5kn4Mjmr/JUbLNbz+bylh5hUQs/NoAalvas0UMkkfY8
	 ZCG6W3F8TSt2/mcJ+8F90SdKEFOhONVfMYQtgdVs=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 509KK3sw018435
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Jan 2025 14:20:04 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 9
 Jan 2025 14:20:03 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 9 Jan 2025 14:20:03 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 509KK3DN070132;
	Thu, 9 Jan 2025 14:20:03 -0600
From: Bryan Brattlof <bb@ti.com>
Subject: [PATCH v3 0/3] arm64: dts: ti: introduce basic support for the
 AM62L
Date: Thu, 9 Jan 2025 14:20:01 -0600
Message-ID: <20250109-am62lx-v3-0-ef171e789527@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHEvgGcC/zXMQQqDMBCF4avIrJuSjKbGrnqP4iIkkzpQTUlEL
 OLdG4Uu/8fj2yBTYspwrzZItHDmOJWoLxW4wU4vEuxLA0psFKIUdrzhexXOdk1nKHjTEpTzJ1H
 g9YSefemB8xzT93QXPNaD0FJJ8ycWFFJoo9BoW7fehMfMVxdH6Pd9/wGP+8rvmQAAAA==
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Bryan Brattlof <bb@ti.com>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_122012_252519_8219CC76 
X-CRM114-Status: GOOD (  11.50  )
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

Hello Everyone,

This small series adds the initial support (currently just a UART) for 
TI's AM62L SoC family.

The AM62L is a lite, low power and performance optimized family of 
application processors that are built for Linux application development. 
AM62L is well suited for a wide range of general-purpose applications 
with scalable ARM Cortex-A53 core performance and embedded features such 
as: Multimedia DSI/DPI support, integrated ADC on chip, advanced lower 
power management modes, and extensive security options for IP protection 
with the built-in security features.

Additionally, the AM62Lx devices includes an extensive set of 
peripherals that make it a well-suited for a broad range of industrial 
applications while offering intelligent features and optimized power 
architecture as well. In addition, the extensive set of peripherals 
included in AM62Lx enables system-level connectivity, such as: USB, 
MMC/SD, OSPI, CAN-FD and an ADC.
 
AM62L is a general purpose processor, however some of the applications 
well suited for it include: Human Machine Interfaces (HMI), Medical 
patient monitoring , Building automation, Smart secure gateways, Smart 
Thermostats, EV charging stations, Smart Metering, Solar energy and 
more.
 
Some highlights of AM62L SoC are:
 - Single to Dual 64-bit Arm® Cortex®-A53 microprocessor subsystem up to 
   1.25GHz Integrated Giga-bit Ethernet switch supporting up to a total 
   of two external
 - 16-bit DDR Subsystem that supports LPDDR4, DDR4 memory types.
 - Display support: 1x display support over MIPI DSI (4 lanes DPHY) or 
   DPI (24-bit RGB LVCMOS)
 - Multiple low power modes support, ex: Deep sleep and Standby
 - Support for secure boot, Trusted Execution Environment (TEE) & 
   Cryptographic Acceleration

For more information check out our Technical Reference Manual (TRM) 
which is located here:

	https://www.ti.com/lit/pdf/sprujb4

Happy Hacking
~Bryan

Changes in v1:
 - switched to non-direct links so TRM updates are automatic
 - fixed indentation issues with a few nodes
 - separated bindings into a different patch
 - removed current-speed property from main_uart0{}
 - removed empty reserved-memory{} node
 - removed serial2 from aliases{} node
 - corrected the main_uart0{} pinmux
 - Link: https://lore.kernel.org/all/20241117-am62lx-v1-0-4e71e42d781d@ti.com/

Changes in v2:
- alphabetized phandles
- corrected macro and node names for main_uart0 pinmux
- Link to v2: https://lore.kernel.org/r/20250108-am62lx-v2-0-581285a37d8f@ti.com

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Bryan Brattlof (1):
      dt-bindings: arm: ti: Add binding for AM62L SoCs

Vignesh Raghavendra (2):
      arm64: dts: ti: k3-am62l: add initial infrastructure
      arm64: dts: ti: k3-am62l: add initial reference board file

 Documentation/devicetree/bindings/arm/ti/k3.yaml |  6 ++
 arch/arm64/boot/dts/ti/Makefile                  |  3 +
 arch/arm64/boot/dts/ti/k3-am62l-main.dtsi        | 52 ++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi      | 33 +++++++++
 arch/arm64/boot/dts/ti/k3-am62l.dtsi             | 89 ++++++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts         | 43 ++++++++++++
 arch/arm64/boot/dts/ti/k3-am62l3.dtsi            | 67 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-pinctrl.h              |  2 +
 8 files changed, 295 insertions(+)
---
base-commit: 5532b8a9ce0e80514e37a1e082824934663580a3
change-id: 20241220-am62lx-ca9498efd87e

Best regards,
-- 
Bryan Brattlof <bb@ti.com>


