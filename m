Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D45C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 18:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5wTAMFKayqLsd0iSt+JhcYZiEaGhndqDGSrLqbFalIE=; b=j3qaoVA7SjGKzcAtucJ5vQEAXL
	GMVcAo29O3pbjjj8CcEs8RlWHISwWoNsU6fUnL9d+n+0fFdhMhql8R4KAW3TYbciCQSZnG3oZFWpp
	fXs3hbS7uTcGWCelebYkXte+qBw4F3ULxjGcJARANLWl74sVYvheGXNMly7t6BRmkseTNZNlMxZkm
	04m8ICOVAjcFmdeYXEToS5nHWa7jw8b0NjohL4PWRtdABM8lCPBaLH9DwwxP9rNLs/g3WLWPCreS+
	Y2+8+/C+TieCAG2zh8HA3XMxtJajvU7Z10skxJEmJ481bYI4KauOCWlRIalkmrxaT5L9Le3Sju0E8
	sTlzhSLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uizXY-0000000B7vU-3FvW;
	Mon, 04 Aug 2025 18:04:04 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uizV0-0000000B7lc-28fA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 18:01:27 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 574I1G483898163;
	Mon, 4 Aug 2025 13:01:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754330476;
	bh=5wTAMFKayqLsd0iSt+JhcYZiEaGhndqDGSrLqbFalIE=;
	h=From:To:CC:Subject:Date;
	b=Sp8Nh5z+oxrxxEwMpGcD4K19WN1yTeGmFNOEmoC5B3GkX1FOXG5oRM6lHmv1Ev7ph
	 J2cilWPfa28Pd5/+UpgjuVr+pJvxO63IzOLfhyTCA4m5oBLGfb1yrAiEOqDoSWJdyF
	 UNPo7Ug3LdBy76AT6tGo1XYaRMOEYOXlsUpwwyOY=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 574I1GKO3008401
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 4 Aug 2025 13:01:16 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 4
 Aug 2025 13:01:16 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 4 Aug 2025 13:01:15 -0500
Received: from udba0500997.dhcp.ti.com (udba0500997.dhcp.ti.com [128.247.81.190])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 574I1Fp4533532;
	Mon, 4 Aug 2025 13:01:15 -0500
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
Subject: [PATCH v2] arm64: dts: ti: k3-j722s-main: Add E5010 JPEG Encoder
Date: Mon, 4 Aug 2025 13:01:06 -0500
Message-ID: <20250804180106.2393256-1-b-brnich@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_110126_631057_81E0A2BA 
X-CRM114-Status: UNSURE (   9.75  )
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

Changes in v2:
  - remove invalid clock-names attribute

 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
index 5cfa7bf36641..fb24c14614b4 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
@@ -385,6 +385,16 @@ c7x_1: dsp@7e200000 {
 		ti,sci-proc-ids = <0x31 0xff>;
 		status = "disabled";
 	};
+
+	e5010: e5010@fd20000 {
+		compatible = "img,e5010-jpeg-enc";
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


