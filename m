Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D216C87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Aug 2025 00:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/cQCpTjNp7NaTO7wwD6pgxbUD76is+JmYVN/rSHXcU=; b=2vUdIeZHlwGQP0O8CFaO8leSJs
	jhCWkpq4ZBkwJM84UqCbtQCQ1wNEmQPd9HeEVOwjS81NI/vrRVuWfBTASFT9c3xg1XkPxB6bBnNs/
	8M4TtkXqczWtEij4ULxgS97kCkrW9OmtyBTBxTBtc0fEQUIw0AlHvn7VqTEXgq65xn/3xroqqvWRd
	AP/2JeavfBq9tt1Zf9C8/tghIj2+sYbcjJmiJgYaBdHp2X/b/ZaybelAL45F+lTeEZ8jTQTZTYDOM
	xho5CMNgnBvSlFPsnr7xO5VBpUFWKN49Mr9SZr0RyEEPSQ/RxLX3TJ32pyjvmt6DBS1+fQnDneYCB
	YltIhgug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukXHS-00000003vQx-1aPb;
	Sat, 09 Aug 2025 00:17:50 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukWTX-00000003rlR-3k1h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 23:26:17 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 578NQ3p21144772;
	Fri, 8 Aug 2025 18:26:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754695563;
	bh=n/cQCpTjNp7NaTO7wwD6pgxbUD76is+JmYVN/rSHXcU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ZcqeN1n+r8k0mbHcExlq9neIQiACmIwu1o2TEWKeZx8EWRqqZzrvsyRqNdHbZkqlm
	 Xhg9krHQ/hptwOhXrkajHhhyfvMuRj5EhEymV7R5aNkIKwwFOzo1KwGpYpKGIzF96f
	 9+aJkCEhGJv7bF+N8A/g+hQQc7AjSvjweEI0En7Q=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 578NQ3QJ1922268
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 8 Aug 2025 18:26:03 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 8
 Aug 2025 18:26:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 8 Aug 2025 18:26:02 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 578NQ2Ru3452261;
	Fri, 8 Aug 2025 18:26:02 -0500
From: <rs@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>
CC: <conor+dt@kernel.org>, <d-gole@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <detheridge@ti.com>,
        <matt.coster@imgtec.com>
Subject: [PATCH 2/3] arm64: dts: ti: k3-am62p-j722s: enable the bxs-4-64
Date: Fri, 8 Aug 2025 18:25:21 -0500
Message-ID: <20250808232522.1296240-2-rs@ti.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250808232522.1296240-1-rs@ti.com>
References: <20250808232522.1296240-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_162615_980385_D8E2ED5D 
X-CRM114-Status: GOOD (  10.23  )
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

From: Randolph Sapp <rs@ti.com>

Add the relevant device tree node for Imagination's BXS-4-64 GPU.

These devices specifically do not set the dma-coherent bit because they
do not use the same MSMC configuration as other BXS-4-64 enabled TI
platforms.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../boot/dts/ti/k3-am62p-j722s-common-main.dtsi     | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index 2e5e25a8ca86..a51db8f9dff8 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -690,6 +690,19 @@ ospi0: spi@fc40000 {
 		};
 	};
 
+	gpu: gpu@fd80000 {
+		compatible = "ti,j721s2-gpu", "img,img-bxs-4-64", "img,img-rogue";
+		reg = <0x00 0x0fd80000 0x00 0x80000>;
+		clocks = <&k3_clks 237 1>;
+		clock-names = "core";
+		assigned-clocks = <&k3_clks 237 1>;
+		assigned-clock-rates = <800000000>;
+		interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&k3_pds 237 TI_SCI_PD_EXCLUSIVE>,
+				<&k3_pds 242 TI_SCI_PD_EXCLUSIVE>;
+		power-domain-names = "a", "b";
+	};
+
 	cpsw3g: ethernet@8000000 {
 		compatible = "ti,am642-cpsw-nuss";
 		#address-cells = <2>;
-- 
2.50.1


