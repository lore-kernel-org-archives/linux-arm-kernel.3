Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF565C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 16:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D1eanfAkB5EEMvMI6mKH8d/IGekndB5PumogQ8P7NTY=; b=iKkMwCapsmols1L0hNKobZpHUX
	adWGysPsgI5JI/TJoqU55xUiUowKzSmyVM6I7wAf0c0WmPTJ5TRBWP4WZqZq8qN/RK1x1v1M5wWRC
	gSLjsNAqniz4zZW7n0P0SA6IED1wCo7lCyH+UD2+l/2884B49zz8v2sv1a1/QmQYHqTW+ZVl8n7jW
	MCNXu93M4YCqcPZ+zxA/AY1IFcZNMb7f3merMr74KVrMUDczy7TlS+ApFKg7tShduuHuBmtMY3iJk
	tmb6s1IAR3MN/SmcFACRxBtsfVm4b/IFTVGvIO97X8rFXNdIqxIhKYcB4B6RoukgylRPgcX0qAzoD
	8c0C8+6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukPWb-00000003G6y-12gb;
	Fri, 08 Aug 2025 16:00:57 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukPRr-00000003FCZ-2uDh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 15:56:06 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 578Ftx23582641;
	Fri, 8 Aug 2025 10:55:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754668559;
	bh=D1eanfAkB5EEMvMI6mKH8d/IGekndB5PumogQ8P7NTY=;
	h=From:To:CC:Subject:Date;
	b=Efg3ZFSc0zmeTNG06/HXUNXRtG4hqEOUXzRiZ+EzshJoTBVHIqTrgan0OE7RdpcxG
	 h5FbVAiyT25eu2ohF9zKSqcXByZPlEebgy9pDrGMku7rzjsr+SYfDc6j2py53um8nZ
	 jtlDIp+JQJc2c4vq32oiBlLkeLI3FaxFp5T8bL4Q=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 578Ftxim1028687
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 8 Aug 2025 10:55:59 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 8
 Aug 2025 10:55:58 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 8 Aug 2025 10:55:58 -0500
Received: from udba0500997.dhcp.ti.com (udba0500997.dhcp.ti.com [128.247.81.190])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 578Ftw3I2977000;
	Fri, 8 Aug 2025 10:55:58 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: <linux-kernel@vger.kernel.org>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        Devarsh
 Thakkar <devarsht@ti.com>, Udit Kumar <u-kumar1@ti.com>,
        Darren Etheridge
	<detheridge@ti.com>,
        Brandon Brnich <b-brnich@ti.com>
Subject: [PATCH v3] arm64: dts: ti: k3-j722s-main: Add E5010 JPEG Encoder
Date: Fri, 8 Aug 2025 10:55:55 -0500
Message-ID: <20250808155555.2632451-1-b-brnich@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_085603_864608_7F7D360E 
X-CRM114-Status: UNSURE (   9.37  )
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

This adds node for E5010 JPEG Encoder which is a stateful JPEG Encoder
present in J722s SoC, supporting baseline encoding of semiplanar based
YUV420 and YUV422 raw video formats to JPEG encoding, with resolutions
supported from 64x64 to 8kx8k.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---

Changes in v3:
  - Add TI compatible
  - Make node name more generic

Changes in v2:
  - remove invalid clock-names attribute

 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
index 5cfa7bf36641..c0a104bc87ad 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
@@ -385,6 +385,16 @@ c7x_1: dsp@7e200000 {
 		ti,sci-proc-ids = <0x31 0xff>;
 		status = "disabled";
 	};
+
+	e5010: jpeg-encoder@fd20000 {
+		compatible = "ti,am62a-jpeg-enc", "img,e5010-jpeg-enc";
+		reg = <0x00 0xfd20000 0x00 0x100>,
+		      <0x00 0xfd20200 0x00 0x200>;
+		reg-names = "core","mmu";
+		clocks = <&k3_clks 201 0>;
+		power-domains = <&k3_pds 201 TI_SCI_PD_EXCLUSIVE>;
+		interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+	};
 };
 
 &main_bcdma_csi {
-- 
2.34.1


