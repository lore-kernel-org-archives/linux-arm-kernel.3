Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0466DC18E7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 14:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IckXbOF2nRYQWb48QXUhy/93/4hHgPTjFS69MgYdTaQ=; b=hPcORz5sUKblG9PU3EmpBBm13m
	XbVXJQg2UZsOWP1ym/8ezM1miv5b3btCtpS0vVBkqkbQoiYYSXMSWmynDgIgkt9NdoWzu3tWgg5jW
	+L2dgJpgsujy/xyYsc37ioYD546lm4y/M70wwpGdRMK5OWqyw2mDOEAuqDvqDdGj1Kcic6HQmQ2t2
	JKLXt7aLoLDHpC5dUu+yQsT7t0tRRUXvrkEEDSY5x/ATXWoo+K0mSmNa1XxkgsTAXjxEUeLXgL//7
	MyAkVTDwXy0BVWVmt9Rw+DH+qjv1huPY8YyvdxHY/6POw5g2nh/CH9Yl6ZddwVsUGXIn1U6xR6HIG
	MTgKw0Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnIY7-000000047oW-3qhc;
	Wed, 26 Feb 2025 14:38:12 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnGke-00000003jQ6-1mlV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 12:43:01 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51QCgogd1545393
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Feb 2025 06:42:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740573770;
	bh=IckXbOF2nRYQWb48QXUhy/93/4hHgPTjFS69MgYdTaQ=;
	h=From:To:CC:Subject:Date;
	b=ix60J3aHGe5NRwygp6sRd0V6N5MtG4wYWGUlkoVADem3cVXwAiREbxsUnoCurA5k3
	 ahvhxy6WfdPVce7xiSE2DaxrUGiDVoTe3S1uFWNXykRDJkcwylJEF0hLIqmMLOioC6
	 998BGxjlt/HBGXHqQj7g7cxw1uc03V/PMwQLkgtc=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51QCgolN090066
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Feb 2025 06:42:50 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Feb 2025 06:42:49 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Feb 2025 06:42:49 -0600
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51QCgkI0094589;
	Wed, 26 Feb 2025 06:42:46 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v2 0/3] PCIe NTB and USB Overlays for J721E, J742S2 and J784S4
Date: Wed, 26 Feb 2025 18:12:42 +0530
Message-ID: <20250226124245.9856-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_044300_549293_3669D0FF 
X-CRM114-Status: GOOD (  11.51  )
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

Series is based on linux-next tagged next-20250226.

v1 of this series is at:
https://patchwork.kernel.org/project/linux-arm-kernel/cover/20250202093636.2699064-1-s-vadapalli@ti.com/
Changes since v1:
- s/epf_bus/epf-bus in the first and second patch of this series since
  node names shouldn't contain underscores.

Regards,
Siddharth.

Siddharth Vadapalli (3):
  arm64: dts: ti: k3-j721e-evm: Add overlay for PCIe NTB functionality
  arm64: dts: ti: k3-j784s4-j742s2-evm: Add overlay for PCIe NTB
  arm64: dts: ti: k3-j784s4-j742s2-evm: Add overlay to enable USB0
    Type-A

 arch/arm64/boot/dts/ti/Makefile               | 18 ++++
 .../boot/dts/ti/k3-j721e-evm-pcie-ntb.dtso    | 91 ++++++++++++++++++
 .../dts/ti/k3-j784s4-j742s2-evm-pcie-ntb.dtso | 92 +++++++++++++++++++
 .../ti/k3-j784s4-j742s2-evm-usb0-type-a.dtso  | 29 ++++++
 4 files changed, 230 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721e-evm-pcie-ntb.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-pcie-ntb.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-usb0-type-a.dtso

-- 
2.34.1


