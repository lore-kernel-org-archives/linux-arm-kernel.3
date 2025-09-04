Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72464CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xdEUUeRhDvZUmqzLma+RUB4tbwLO4rgKjOTXQim98rM=; b=3ganWK9RL8vrqxCpRFsq1Qfl3c
	JltZm7F6cL3lxOH07RM9EEtswtEihjpWnL8HiTOhJVicejh5erDQUkYOrki1reyr/5Dm2wWg8Rkqo
	BZtn5U1CYMAnwy/9KQEJlgCaQ4Z9A1bvtQnDgkBQwONqWAkavdPQox08aNigXFxgc0IUawgsJgdMz
	gpYcTYlHgr+n9f6ndfhff8yn9DswGyRLNIF8sgp2ac0OtCM4VxKszlM13eVY15OthvDecKFiDZFnb
	EhJ0ZcICPoUMt6gzofgMEkOC0BwF0MhrrDZSWKBTn03G/GYr+cknl2jc2zBCUm0pY7DDFyTWRZvD1
	jGKZrYqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM3y-0000000G30q-1lHS;
	Fri, 05 Sep 2025 02:20:30 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuHVR-0000000EZ72-32VT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 21:28:35 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 584LSUHv3603630;
	Thu, 4 Sep 2025 16:28:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757021310;
	bh=xdEUUeRhDvZUmqzLma+RUB4tbwLO4rgKjOTXQim98rM=;
	h=From:To:CC:Subject:Date;
	b=Hji1Dl0CIUe0DA6IZnqGJ63BgO4TOWYXyyNJoOtLy72CtK//roniuVPUz4IpsY1yf
	 aS+CwKNRH0UJmC2kgHbFtNT0LExWlmGVojULS5lZGBg6evYbxsTRNcYCroUXeIN3aU
	 VSx96isudiXGZIm23NMKqSTK4fx3fVXKdlGAy16M=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 584LSU6r449422
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 4 Sep 2025 16:28:30 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 4
 Sep 2025 16:28:29 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 4 Sep 2025 16:28:29 -0500
Received: from uda0506412.dhcp.ti.com (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 584LSTnN3903903;
	Thu, 4 Sep 2025 16:28:29 -0500
From: Kendall Willis <k-willis@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <d-gole@ti.com>, <vishalm@ti.com>, <sebin.francis@ti.com>,
        <msp@baylibre.com>, <khilman@baylibre.com>, <a-kaur@ti.com>,
        <k-willis@ti.com>
Subject: [PATCH 0/3] arm64: dts: ti: k3-am62: Support Main UART wakeup
Date: Thu, 4 Sep 2025 16:28:24 -0500
Message-ID: <20250904212827.3730314-1-k-willis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_142833_852245_B2DE1C27 
X-CRM114-Status: GOOD (  14.25  )
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

This series adds wakeup support for the Main UART in the device tree of
the TI AM62 family of devices. It defines the specific pins and pinctrl
states needed to wakeup the system from the Main UART via I/O
daisy-chaining. The wakeup-source property is configured to describe the
low power modes the system can wakeup from using the Main UART.

Dependencies
------------
This series is dependent on the following series [1] to be merged into
the kernel. The series adds the system idle states that are available on
the SoCs. The system idle states are used when configuring the
wakeup-source property.

This series is also dependent on the following patch [2] to be merged
into the kernel. The patch integrates the PIN_WKUP_EN macro which
enables the WKUP_EN bit.

Implementation
--------------
This series is intended to be implemented along with the following
series:

1. "pmdomain: ti_sci: Handle wakeup constraint if device has pinctrl
   wakeup state": Patch which skips setting constraints for wakeup sources
   that use pinctrl state 'wakeup'.

2. "serial: 8250: omap: Add wakeup support": Implements
   wakeup from the UARTs for TI K3 SoCs

3. "arm64: dts: ti: k3-am62: Support Main UART wakeup": (this series)
   implements the functionality to wakeup the system from the Main UART

Testing
-------
Tested on a SK-AM62B-P1 board with all series and dependencies
implemented. Suspend/resume verified with the Main UART wakeup source
by entering a keypress on the console.

[1] https://lore.kernel.org/linux-arm-kernel/20250812-topic-am62-dt-partialio-v6-15-v2-2-25352364a0ac@baylibre.com/
[2] https://lore.kernel.org/all/20250904112538.529857-4-a-kaur@ti.com/

Kendall Willis (3):
  arm64: dts: ti: k3-am62x-sk-common: Enable Main UART wakeup
  arm64: dts: ti: k3-am62a7-sk: Enable Main UART wakeup
  arm64: dts: ti: k3-am62p5-sk: Enable Main UART wakeup

 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts       | 24 +++++++++++++++----
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts       | 24 +++++++++++++++----
 .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 24 +++++++++++++++----
 3 files changed, 60 insertions(+), 12 deletions(-)


base-commit: 4ac65880ebca1b68495bd8704263b26c050ac010
-- 
2.34.1


