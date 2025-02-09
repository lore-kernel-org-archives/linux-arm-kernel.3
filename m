Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C85C02199
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 08:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YTpHK6EocecJt+2gPnCi/fOd1SBr1RBHfu2IhB1fT5Y=; b=LEwWQFxi8hDGT16OmsIlZZBli9
	j4tIYt5pC0UuTm/vHIAqalPjquYdjtqMIQdIWWmKaSnhGvXjQasptd9TbyIMya8SI7oup9OW2pwBd
	tsZvLjjgJqSDrtf5VQZiawxDASwC34a6OZbyHpZ0OqZ1YoCtQ/i+lCv2QcCqSMMQ8FIwXbrlro7Fb
	+J80fQ7wwF8c19Ucksg49NXbuH0+jMo0eJfuURE7fSdLerp3+tSghfr9RrHPfHKRa2osG4w95xbjc
	Ohv7bYB1TM2s0A4rddwUFcDHM6UoH2Pz71PsQY9hqaUM7M/Mx059amwtiRclfi35Jj4bEZzGyDS7U
	XaEK46PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th2Zs-0000000EKzQ-3PJI;
	Sun, 09 Feb 2025 08:22:08 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th2Vq-0000000EKXR-3lnf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 08:18:00 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5198Hoon3211703
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 9 Feb 2025 02:17:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739089070;
	bh=YTpHK6EocecJt+2gPnCi/fOd1SBr1RBHfu2IhB1fT5Y=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=eA4RvMBf3RxTEYGo8DtdMdPkb2rSI6mHnlz1CS6Zv+ZIb122emzRQXgyZ9Z0xuzPb
	 nBGr1oaFGfktzBN9uVS5jK53ZfEfuqa6rAWvu/e3C7zJhlhwsAisQ2TMS6O1XdpxbP
	 5boEx8ZFBDs29CQCJx2alIIHJ/Oh+fazYV8vl8ks=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5198HoL8045818
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 9 Feb 2025 02:17:50 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 9
 Feb 2025 02:17:49 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 9 Feb 2025 02:17:49 -0600
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5198HciU083866;
	Sun, 9 Feb 2025 02:17:46 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 2/2] arm64: dts: ti: k3-j721e-sk: Add boot phase tag to SERDES3
Date: Sun, 9 Feb 2025 13:47:33 +0530
Message-ID: <20250209081738.1874749-3-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250209081738.1874749-1-s-vadapalli@ti.com>
References: <20250209081738.1874749-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_001758_983762_1F492FD2 
X-CRM114-Status: GOOD (  10.71  )
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

The USB0 instance of USB on J721E SoC can be used for USB DFU boot.
Since the USB Type-C interface on the J721E-SK is connected to USB0 via
SERDES3, supporting USB DFU boot requires SERDES3 link associated with
USB0 to be functional at all stages of the USB DFU boot process. Thus,
add the "bootph-all" boot phase tag to "serdes3_usb_link" device-tree node.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721e-sk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
index 69b3d1ed8a21..440ef57be294 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
@@ -1040,6 +1040,7 @@ serdes3_usb_link: phy@0 {
 		#phy-cells = <0>;
 		cdns,phy-type = <PHY_TYPE_USB3>;
 		resets = <&serdes_wiz3 1>, <&serdes_wiz3 2>;
+		bootph-all;
 	};
 };
 
-- 
2.43.0


