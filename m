Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE2AC87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 10:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6fEcLtOOORd170G02fTTchEZDijLG6F9UwBKHQDvMa4=; b=TdZ6wZnpeYg3/8YHS5clAhc1Sd
	C3VqDDAamhVK9gc8Gg2MjSJXkzeTTV/CjfiqviCACDiGCbI83Q0akSOpx8CXVlzH53IiFNwQa75rH
	ljv2g4Zm+OkK/qeM2P6fktKiKcj+3+L/nC6QBRV5eLtDFtXV7rXlqXDCytWeXnZRTMzc0r6yUt+or
	X/DQj2Sr0pEGjrRRnPUiZsaaCAQx/h4kTWvKtE4V2Cj2XppXTge42JxlUwfsiFjc9lurH31l8hPbx
	xsT90VoHa8NQDcb2KL+hsdM8k/DmLmN6NHD0+N7NM21skQitrUlHvuO9fRKCkpHjCiUJRqxYGJZul
	zjiX8mzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukK47-00000002WxE-01jj;
	Fri, 08 Aug 2025 10:11:11 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukJs1-00000002VaS-3124
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 09:58:43 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5789wciv569358;
	Fri, 8 Aug 2025 04:58:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754647118;
	bh=6fEcLtOOORd170G02fTTchEZDijLG6F9UwBKHQDvMa4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=dFBlb5k3j9L79ALM6VVBlNLAR8p/9WWlceprFcrGAYdZjTFDsf1VwOdW88xDBZrzo
	 uTpxqt4eE6VLBdFJGLXNPX9PEhOQ1+ju/Dz2OBr9Ev0HArCwTadyBkdTcwCrdYMHa/
	 4uDfE3X2ebcF0AXIm0rH2uckw3Pl4OBbRkrbImg4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5789wcRo1552371
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 8 Aug 2025 04:58:38 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 8
 Aug 2025 04:58:38 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 8 Aug 2025 04:58:37 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5789wCOt2574818;
	Fri, 8 Aug 2025 04:58:34 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>,
        <y-abhilashchandra@ti.com>, Jared McArthur <j-mcarthur@ti.com>
Subject: [PATCH V2 4/7] arm64: dts: ti: k3-am62p-j722s-common-main: Add interrupts property
Date: Fri, 8 Aug 2025 15:28:01 +0530
Message-ID: <20250808095804.544298-5-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250808095804.544298-1-y-abhilashchandra@ti.com>
References: <20250808095804.544298-1-y-abhilashchandra@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_025841_842473_4987A9DB 
X-CRM114-Status: UNSURE (   8.85  )
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

Add interrupts property for CDNS CSI2RX. Interrupt IDs are taken from the
J722S TRM [0].

Interrupt Line     | Source Interrupt
-------------------|-------------------------
GICSS0_SPI_IN_175  | CSI_RX_IF0_CSI_ERR_IRQ_0
GICSS0_SPI_IN_173  | CSI_RX_IF0_CSI_IRQ_0

[0]: https://www.ti.com/lit/zip/sprujb3

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Reviewed-by: Udit Kumar <u-kumar1@ti.com>
Reviewed-by: Jared McArthur <j-mcarthur@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index 2e5e25a8ca86..4427b12058a6 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -1045,6 +1045,9 @@ ti_csi2rx0: ticsi2rx@30102000 {
 		cdns_csi2rx0: csi-bridge@30101000 {
 			compatible = "ti,j721e-csi2rx", "cdns,csi2rx";
 			reg = <0x00 0x30101000 0x00 0x1000>;
+			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error_irq", "irq";
 			clocks = <&k3_clks 182 0>, <&k3_clks 182 3>, <&k3_clks 182 0>,
 				<&k3_clks 182 0>, <&k3_clks 182 4>, <&k3_clks 182 4>;
 			clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
-- 
2.34.1


