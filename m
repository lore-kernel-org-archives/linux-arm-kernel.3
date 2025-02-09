Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5709C02199
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 08:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=euXuTkju0OPAsAr+EKUqdoMAYnLddo63qQiyM5gI5Go=; b=fhDA8uGJYT4zTd9TE2mmGk9OPP
	Pj1B1m9BzrY8XtA7UPo3stz7rnSe36HfZkXa1ANcPbMgJ6Y1y0kdetnsro1xRCzuQ3qZpbKjiYgeV
	kdavyodpDuHolWMlRXlc/CU/UXbUqHCvfGoxrOfkaVUUPJekE2FHyWaanuQ0TjoBp7fQxgjE2b9Ih
	V6ZvC6oLB9mIQgSF5p5F/PtJksds2tpHQGrGQeDYXKk3fq9aZrzgzW5F3rULB5ZeYeUgfacpi2v8n
	QETWN+Cn4IsP65rWjYqXtt989lAvD4hYBQUVo70mBjX2ymz5laxqgsPoPOnTErCf3SpACTC0x0UZW
	j0FcCRWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th2YX-0000000EKsH-0a5D;
	Sun, 09 Feb 2025 08:20:45 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th2Vo-0000000EKWx-3H3C
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 08:17:58 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5198Hk3K3211691
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 9 Feb 2025 02:17:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739089066;
	bh=euXuTkju0OPAsAr+EKUqdoMAYnLddo63qQiyM5gI5Go=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=WnWqrAqrow1oXRUd6ILiAKBjWOCkqzLOPtqdFY5nv8Gu3qIF2hYa7w43bDQZWmCBo
	 wDKLanSOFERFJrlgdsAniSaj+USH/PI6ztqp4pRfc4pn46vBsdaplNoC3qdWpC1zko
	 MAkQpoUCwCCGg4ejf1NRrse5pOOWMwVosY5nV47A=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5198HkU8024725
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 9 Feb 2025 02:17:46 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 9
 Feb 2025 02:17:46 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 9 Feb 2025 02:17:46 -0600
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5198HciT083866;
	Sun, 9 Feb 2025 02:17:43 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 1/2] arm64: dts: ti: k3-j721e-common-proc-board: Add boot phase tag to SERDES3
Date: Sun, 9 Feb 2025 13:47:32 +0530
Message-ID: <20250209081738.1874749-2-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250209081738.1874749-1-s-vadapalli@ti.com>
References: <20250209081738.1874749-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_001756_886901_B7210F2F 
X-CRM114-Status: GOOD (  10.92  )
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
Since the USB Type-C interface on the J721E-EVM is connected to USB0 via
SERDES3, supporting USB DFU boot requires SERDES3 link associated with
USB0 to be functional at all stages of the USB DFU boot process. Thus,
add the "bootph-all" boot phase tag to "serdes3_usb_link" device-tree node.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
index 4c1e02a4e7a2..4421852161dd 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
@@ -540,6 +540,7 @@ serdes3_usb_link: phy@0 {
 		#phy-cells = <0>;
 		cdns,phy-type = <PHY_TYPE_USB3>;
 		resets = <&serdes_wiz3 1>, <&serdes_wiz3 2>;
+		bootph-all;
 	};
 };
 
-- 
2.43.0


