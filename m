Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E179E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 22:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ibuURv4xTWoCUb0ZYBZvQr63MwW5FsH8r9nGct30E+4=; b=NhDcAQYG8nTb0I
	iFYLF0MvbxKdiiCgXt1c3BWcIQqCajnJ7wE01klVrnwyKQDXtfOwPU2N6tmKAIfN+11jBj36E7UZt
	XAbdDCm+o/AwumP7wqlov0SP9s6Hun1cnMsed5IG4zBrbvP1fymaiXNs7b5gCOLk9BTMQ2jgDneOG
	CaAgXYFyea8xLJX18CILFj/5f2v++xqIHz/SQWYg2SKNl94uKrObLP4NtMNet0txRKXbDloq9qKUo
	H41r80cVqERJi2C8qXjoNBdf7dY21bYn6QH9Xg4ZL2iyt67uLZiC3xpV+ZHVnCYMNmnZv5m/SXkw4
	syV4D6Pa9/MF4+ELqeCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVezu-0000000A6Hd-1K8T;
	Wed, 08 Jan 2025 22:57:58 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVevA-0000000A56B-0CdY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 22:53:05 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 508MqDer2870978
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jan 2025 16:52:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736376733;
	bh=ibuURv4xTWoCUb0ZYBZvQr63MwW5FsH8r9nGct30E+4=;
	h=From:Subject:Date:To:CC;
	b=MrCWlt++a9BQ4SkU925mAzQes2r7fpCUuCf5olDCD9s/mD+9KY3vkHATUPzrAs+ms
	 +A1LG9KJrBzuRCbll4wJDTZdlkpe9nG+Yb004YTqVMx2w+W5YnVWTTdRCEBPC3XCbh
	 Whar4zGI5xqQBf520uAurF/JIWctZmMfqhCozFs4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 508MqD82019336
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jan 2025 16:52:13 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Jan 2025 16:52:12 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Jan 2025 16:52:12 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 508MqC0W038346;
	Wed, 8 Jan 2025 16:52:12 -0600
From: Bryan Brattlof <bb@ti.com>
Subject: [PATCH v2 0/3] arm64: dts: ti: introduce basic support for the
 AM62L
Date: Wed, 8 Jan 2025 16:51:52 -0600
Message-ID: <20250108-am62lx-v2-0-581285a37d8f@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIgBf2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIxNDIyMD3cRcM6OcCt3kREsTS4vUtBQL81QloOKCotS0zAqwQdGxtbUAERy
 LWFgAAAA=
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Bryan Brattlof <bb@ti.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3407; i=bb@ti.com;
 h=from:subject:message-id; bh=l555czrwlTYLjBIpGqV4/yEAVsCJ3BvifL46ZgYveB8=;
 b=owNCWmg5MUFZJlNZbm55xQAAcH///7/fe7Wv/xf8+v/Imfv3vZXq7pfqy99vV/7c63b99v0wA
 RtqB2oBpoaNAaA0AGmmmhiGRkNAGjQBoNAaDQaDIAAaaDTI0yGRppo09RkaaZGDTUQAaaA00Gmm
 gyaGgDQDRoaNNBpobUGIAwmgaAyANAGgaMhp6QaDJoaAGMjSYZTR6QYg0aYjQBoAwmQ0DQA000A
 AMAJhAwjIyNGgDIGQaGIANGgAZNAEFWGNBU9ytSAQYkVEaorGKdP1NQzS7nMKvsIrvdSA0A10AF
 qLuSA+dou5979Phm59UH8vfiFbGVBNJYWMrw49RgEr3K3N24rLO7Lm/LOLMerX0sydhToPWNA7K
 T0JkyyD8HhX668eMxR043YJEDUqOMI8dP07Di95qQsToHscgGrzr9vcgLNSsU9SUIfycGFtLVIk
 AEAdJpd+Zw5vG9u5S7B06ptvCDeaj4w4hwV1KAunPWgIetsSGStELk5RMqQ1VoKVtu0YwK8QNqs
 MNY1mLCkldWtLiAwWjkSIRHiEUEMgtcyxRrz5rLABN+aE90MmkzipcMicGurliy+pdzIfBQWOls
 ZKs+f1uFCC21C1hjSAfcOy4bZEA4CVAOXbsyJBWqAyvOBx2RFRoQ7XIJPC5o0UCenz25Th6wcCk
 AdEjZBYXDNplX+LuSKcKEg3NzzigA==
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_145304_229401_0054D5F4 
X-CRM114-Status: GOOD (  12.22  )
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
base-commit: 6b51892b31fe83fe7cc8cf69e4bf7721cf08951b
change-id: 20241220-am62lx-ca9498efd87e

Best regards,
-- 
Bryan Brattlof <bb@ti.com>


