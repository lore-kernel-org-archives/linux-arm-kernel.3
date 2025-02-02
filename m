Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02FBC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Feb 2025 09:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yUw7ymLELkI5+jt5wh+PAwXmQ5X5tURqWHNh4UxI+ho=; b=pAAwIYOOzgGKUcpGaKa+xKoBjk
	HqeJC6oazuXh3rDM+HIAJYnaKaH+NFjo0lahpV8UyAgeKxN7Ybzk5hxEDKy4DZbFYf6EEIiLoJQtC
	a/j2NT0t8YipETd6i3UpIv1Jj601uT8abqpgdWY/U1CCHHm5OURGklXb80POZkEjsQpCP0+GPyEf5
	HO5iTGiQUUDiH21povZWNF0KxOwu2U8ZX9/6lVO5Cg0c4xpuM+OQwqR3vfZajsv330xc7UlxW4jjv
	/vTqo9xb4WBG/53IJHNyZV9gkPYwhs+bG6m/CEa/aElJOHaNKu2VxLr7u/2401XfElaD/OsIKo+RR
	YPDUs+og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teWRg-0000000DZw9-2C2T;
	Sun, 02 Feb 2025 09:39:16 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teWPO-0000000DZd5-1kUI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Feb 2025 09:36:55 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5129afQt2003141
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 2 Feb 2025 03:36:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738489001;
	bh=yUw7ymLELkI5+jt5wh+PAwXmQ5X5tURqWHNh4UxI+ho=;
	h=From:To:CC:Subject:Date;
	b=yUPBb7l/21BYt6k+mTtnylBFjaUzKXbZRxpb2Ry63IzCf9ax+uxu+tFoX9WypRPJw
	 olGssMfOgaIxcLFZ2XRDaVu5jyS1q1y15AP/MUq0PljW2H0vUHxNTX4JZpjwzomH5Y
	 Ib9ncayEEft/EjOJbx2RR9fRn6zgFzYXNLoQprNQ=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5129afin059250
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 2 Feb 2025 03:36:41 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 2
 Feb 2025 03:36:40 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 2 Feb 2025 03:36:40 -0600
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5129abbi119794;
	Sun, 2 Feb 2025 03:36:37 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 0/3] PCIe NTB and USB Overlays for J721E, J742S2 and J784S4
Date: Sun, 2 Feb 2025 15:06:27 +0530
Message-ID: <20250202093636.2699064-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_013654_603079_6341E07F 
X-CRM114-Status: GOOD (  11.26  )
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

Hello,

This series adds the device-tree overlays for PCIe NTB (Non-Transparent-
Bridge) functionality on J721E, J742S2 and J784S4 SoCs which have
at-least two instances of PCIe that are required for NTB.

The device-tree overlay for switching from Type-C USB interface to Type-A
USB interface on J742S2-EVM and J784S4-EVM is also included in this series.

Series is based on linux-next tagged next-20250131.

Due to Makefile dependencies, the USB Overlay at:
https://patch.msgid.link/20250124124150.2024963-1-s-vadapalli@ti.com/
has been merged into this series. No changes have been made to the USB
Overlay patch when compared to its v1 patch.

Regards,
Siddharth.

Siddharth Vadapalli (3):
  arm64: dts: ti: k3-j721e-evm: Add overlay for PCIe NTB functionality
  arm64: dts: ti: k3-j784s4-j742s2-evm: Add overlay for PCIe NTB
  arm64: dts: ti: k3-j784s4-j742s2-evm: Add overlay to enable USB0
    Type-A

 arch/arm64/boot/dts/ti/Makefile               | 20 +++-
 .../boot/dts/ti/k3-j721e-evm-pcie-ntb.dtso    | 91 ++++++++++++++++++
 .../dts/ti/k3-j784s4-j742s2-evm-pcie-ntb.dtso | 92 +++++++++++++++++++
 .../ti/k3-j784s4-j742s2-evm-usb0-type-a.dtso  | 29 ++++++
 4 files changed, 231 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721e-evm-pcie-ntb.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-pcie-ntb.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-usb0-type-a.dtso

-- 
2.43.0


