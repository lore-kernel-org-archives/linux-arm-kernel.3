Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23874C36018
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 11:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T7GXSrCelE7fze5pqE3ynsiOQxqvgOU5MvzsMaU1iQM=; b=v+8htu4qtJszhs27aPonPaUAHi
	FS1/9yAeEQBJp14aMg92j4LuAS1aErDs4fzP9vVFC7HjbFMxVmpno0Q+GMQq651jzgBlnEJpo3hXJ
	KEn82OLzrqHmcKq7hqQgxUp1Qy3Y+mY8xXqPUWJ4iwbreV0VQftIRyPXJA9ani1LHLlnfzM2TJW3w
	w+B/lfrsi3gkLbaT3ReEU7+fDHl0cZm3xS3K9HkEgsIDlnZgJzNqIBh9Oj3JXVG3wLf0Y1IIi/EVz
	CjX+uDrFx0vE5dgy7p8Q2GolzgP4RrrnFDTlNEpCpIL7xUHhPLbVxc21UhDTJ3FuJZTQdIHRYWnAK
	3dVNX8LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwPT-00000005vZW-2bIt;
	Wed, 02 Apr 2025 11:37:31 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwKK-00000005uHN-0wCV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 11:32:13 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 532BW9Kv3915804
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Apr 2025 06:32:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743593529;
	bh=T7GXSrCelE7fze5pqE3ynsiOQxqvgOU5MvzsMaU1iQM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=tD6I4wXvD35uwxLxJJtd26v2QWO9g7qPX4fhrz1ED2Su/c4P2atXutcsz1MmKDxRH
	 /YAB9gTU6dcTkpd5PN23qWquMYDUvcaeUxD3caaQnl5HYbWmA2SRHzQ/bGCU9WVS25
	 c7iPJNFM6OmzQvYOTv6PvaXW0EmUgjLRWDF8pbp4=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 532BW8bf103477
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Apr 2025 06:32:08 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 2
 Apr 2025 06:32:08 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 2 Apr 2025 06:32:08 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.210])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 532BW755036731;
	Wed, 2 Apr 2025 06:32:08 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>, <afd@ti.com>, <s-vadapalli@ti.com>,
        <linux-kernel@vger.kernel.org>
CC: <kristo@kernel.org>, <rogerq@kernel.org>, <kishon@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <j-choudhary@ti.com>
Subject: [PATCH v2 3/5] arm64: dts: ti: k3-j7200: Add PCIe ctrl node to scm_conf region
Date: Wed, 2 Apr 2025 17:01:59 +0530
Message-ID: <20250402113201.151195-4-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250402113201.151195-1-j-choudhary@ti.com>
References: <20250402113201.151195-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_043212_370061_ADB65FCD 
X-CRM114-Status: GOOD (  13.38  )
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

From: Andrew Davis <afd@ti.com>

This region is used for controlling the function of the PCIe IP. It is
compatible with "ti,j784s4-pcie-ctrl", add this here and use it with
the PCIe node.

Signed-off-by: Andrew Davis <afd@ti.com>
[j-choudhary@ti.com: Add changes to k3-j7200-evm-pcie1-ep.dtso]
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j7200-evm-pcie1-ep.dtso | 2 +-
 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi         | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j7200-evm-pcie1-ep.dtso b/arch/arm64/boot/dts/ti/k3-j7200-evm-pcie1-ep.dtso
index 3cc315a0e084..281076d905f3 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-evm-pcie1-ep.dtso
+++ b/arch/arm64/boot/dts/ti/k3-j7200-evm-pcie1-ep.dtso
@@ -48,6 +48,6 @@ pcie1_ep: pcie-ep@2910000 {
 		dma-coherent;
 		phys = <&serdes0_pcie_link>;
 		phy-names = "pcie-phy";
-		ti,syscon-pcie-ctrl = <&scm_conf 0x4074>;
+		ti,syscon-pcie-ctrl = <&pcie1_ctrl 0x0>;
 	};
 };
diff --git a/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
index 5ab510a0605f..dbb000657377 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
@@ -32,6 +32,11 @@ scm_conf: scm-conf@100000 {
 		#size-cells = <1>;
 		ranges = <0x00 0x00 0x00100000 0x1c000>;
 
+		pcie1_ctrl: pcie-ctrl@4074 {
+			compatible = "ti,j784s4-pcie-ctrl", "syscon";
+			reg = <0x4074 0x4>;
+		};
+
 		serdes_ln_ctrl: mux-controller@4080 {
 			compatible = "reg-mux";
 			reg = <0x4080 0x20>;
@@ -764,7 +769,7 @@ pcie1_rc: pcie@2910000 {
 		interrupt-names = "link_state";
 		interrupts = <GIC_SPI 330 IRQ_TYPE_EDGE_RISING>;
 		device_type = "pci";
-		ti,syscon-pcie-ctrl = <&scm_conf 0x4074>;
+		ti,syscon-pcie-ctrl = <&pcie1_ctrl 0x0>;
 		max-link-speed = <3>;
 		num-lanes = <4>;
 		power-domains = <&k3_pds 240 TI_SCI_PD_EXCLUSIVE>;
-- 
2.34.1


