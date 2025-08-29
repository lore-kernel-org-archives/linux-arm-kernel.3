Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62013C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 08:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SH/ctj9vD03wmsu2Xl+2+/R9pVmCmGHxlhChOeszcNo=; b=EMSiK5W8kgCwnsv4h1z0KUm8ON
	tmTmmjGEd8RBs1yCW/5jKrubCX014Mxsx45Gj4Uf+IEVqvYfyeOcgb3ooBM6TG1TiuzUYCNxq0etV
	1xQlTg22vKGREf88aRg83S37nQOdzW8KDfVjXVLtZQafcXfXGNRoZsyx68x0ib3wUjnXS8qcCFq/G
	gCUzk+vWdQItPFVYE5fCtrl6uTFUJ6+YGgNhW4lDSfG+y2XEy9dM5EhaVBebvi4rMhdV1U1PYcl2s
	lzzGG/344ZViJPUZP3o1FS1p6wl3gkjAq/dCqkbwj2vvVhBM+mlE1dINgAuV2mflcjfqZTc0glaYd
	PoOh0USA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uru6b-00000004tRT-2Zza;
	Fri, 29 Aug 2025 08:05:05 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urtpI-00000004oUK-3yWx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 07:47:14 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57T7l9mQ2167299;
	Fri, 29 Aug 2025 02:47:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756453629;
	bh=SH/ctj9vD03wmsu2Xl+2+/R9pVmCmGHxlhChOeszcNo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GGCnC2vVLtanIydT/MtmErZjoKvIj5MUFrQtjEpmQGEYE8vw34IbZHA/6//tTsUNf
	 7w9RATw3G/v1Rqq1AFbi1Ev05v9BBBsptF0mvcCHxJMVtuvL41C25XxQ/ekJerKJ8D
	 K+ibRrx7f0zy9CJPrlF1Za0QXtL+KyHhj8Ka1/L0=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57T7l9eE3850485
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 29 Aug 2025 02:47:09 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 29
 Aug 2025 02:47:09 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 29 Aug 2025 02:47:09 -0500
Received: from hp-z2-tower.dhcp.ti.com (hp-z2-tower.dhcp.ti.com [172.24.231.157])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57T7l1fQ1717407;
	Fri, 29 Aug 2025 02:47:05 -0500
From: Hrushikesh Salunke <h-salunke@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <s-vadapalli@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <h-salunke@ti.com>, <danishanwar@ti.com>
Subject: [PATCH 1/3] arm64: dts: ti: k3-am62p-j722s-common-wakeup: Add bootph-all tag to usb0-phy-ctrl node
Date: Fri, 29 Aug 2025 13:16:58 +0530
Message-ID: <20250829074700.1531562-2-h-salunke@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250829074700.1531562-1-h-salunke@ti.com>
References: <20250829074700.1531562-1-h-salunke@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_004713_035285_EAA1B9B5 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

Add bootph-all property to the USB0 PHY controller node to make it
available during all boot phases. This is required for USB DFU boot.

Signed-off-by: Hrushikesh Salunke <h-salunke@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi
index 6757b37a9de3..42f80edf52b7 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi
@@ -35,6 +35,7 @@ cpsw_mac_syscon: ethernet-mac-syscon@200 {
 		usb0_phy_ctrl: syscon@4008 {
 			compatible = "ti,am62-usb-phy-ctrl", "syscon";
 			reg = <0x4008 0x4>;
+			bootph-all;
 		};
 
 		usb1_phy_ctrl: syscon@4018 {
-- 
2.34.1


