Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E779CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 08:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=glfxVveUJz9WQdfH/gvFund0nKtxrTC7NLT7dwSoog0=; b=V5h3d4Zzlaq8l4sMSQxM90VUO4
	pCLQOXt9nP69UJe74gp0h44c7bCFUC1DrXtx9AW2MCKJYq3zNgsPm+q1Ar4RNpyZMVG688h9Hm7tB
	VaRH/+augmj/vF0evjzGN6I+3vAbk2rJE6Wkkn0+NhZ6SLDe7nYZqpSDKjDWXrJGEQyRhAOEdeVnT
	RIML+zJ806GqYeorvAzCiHMU5t2iroQlvlv0W3BJ5KefvaVdyFhcBbysZowWfXJbEU9jzRLPrsP/V
	hoaiNDsF89vLc0sLRXHpABJV2ece2mwmJOmvCWNAziugWCUHykEoVlac7mr6ZGHm7CYZk87FmRamq
	GkFfOWRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGBc5-00000009y1w-1VMH;
	Mon, 12 Oct 2026 08:42:29 +0000
Received: from mail-koreacentralazon11023088.outbound.protection.outlook.com ([40.107.44.88] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGBc1-00000009xwO-3WAZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 08:42:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tx8vZk/8g27rM1xlpYrr3y9HVvDUJMAJ9as2Q6hmRyHKyOaZecQymJDMh/5kNuiYNOuxI28XzBjTSCfesF326dc+VXQ8iI+dilF6/WnKHq0lBaTqycQjxv3yjbp1FKuZLyBDCm35ZlosqtlYPJCADByX6MDBumD5t3Ilv7iDfs/EDyVbbE2oohVIH2ktWPkFVmNYVHkMUG5FzOrv/7PO+Fx9MAzu0/i0mSLIeHejPDXFdyIRbsqxWphg+NjigZvP4M42Af9G++UU+w+JzThav23jAplpjbtkLWa5mLX3NaBz5w5UV1OZs13+rt+vDMEscfBC6N3yjmQAecWqMPQQ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=glfxVveUJz9WQdfH/gvFund0nKtxrTC7NLT7dwSoog0=;
 b=ZadRPeVNELhFO02MVnG0XfGjsvt1cGKh32Kh4LrgwLZ1ydNpyI97oSP9UfRh0x7XYqNxgu96ULs1e2fvBZquWtOxSboa674gqafNzsYlH3PJZOnxOrZXAXpUqRoieLT3QBehW5ywve0y4Ks2ymtFQf0NMmsJF7RBV3x+S1pOiOZuzihIz232DcxawpUkemUVQfUg6Kv030vnKyAvO/ATgKNzBit6jc1H08xAhAMFGNUj9zVmI8WNGCDA4VLCZkvx6gWHR4Hb8vEqFbl14SU3CMpIx5UL+3bGP3r3G67OwUoeS7pbtDLh58raU7ycyFKPDNKLEHUq3EXU24m6NEveDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::13) by SG2PR06MB5359.apcprd06.prod.outlook.com
 (2603:1096:4:1d7::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 08:42:01 +0000
Received: from SG1PEPF000082E2.apcprd02.prod.outlook.com
 (2603:1096:4:191:cafe::33) by SI2PR01CA0001.outlook.office365.com
 (2603:1096:4:191::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 12
 Oct 2026 08:42:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E2.mail.protection.outlook.com (10.167.240.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 08:42:00 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 6695540920F7;
	Mon, 12 Oct 2026 16:41:58 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com
Cc: devicetree@vger.kernel.org,
	Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com
Subject: [PATCH v3 6/6] arm64: dts: cix: Describe the Sky1 DMA-350 bus integration
Date: Mon, 12 Oct 2026 16:41:55 +0800
Message-ID: <20261012084155.2547480-7-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012084155.2547480-1-Jelly.Jia@cixtech.com>
References: <20261012084155.2547480-1-Jelly.Jia@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E2:EE_|SG2PR06MB5359:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4c475ff5-3b71-441b-aaed-08df283caedf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|7416014|376014|6133799003|10067099003|22082099003|18002099003|261009223027099003|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info: BBCLeV4zdOjik3fg3P8s2FjnBayjbyoKKuuotwt9wP1qh9Bdy52ETNwTQdhDuqBPJibwNt+g8VkqsthAnA1m020ef560FkyNv8rPS2E5gWvm0zRjzbU11GVGHUqAJthyMrN2VSXi7TMF7Nn2Ahe6PYFBQwxZ46vAKNpbX35ErKlDD8FUhXWrDntDXuH4kaIDqKa4vLRhmCkwrrNUsQy6q02UO+mXtkUAURkIji6/IQEaM48fZM5D77HdtSxmigHaNgjOoBtz2NSsmvvRR8x2mLF+rXdPQaLCE6WqkGKb2p8TuWyOKbOb6iZBQf8WMRh7cVpyvDKxP8fPWtRHMQiIXG/ybWiX+SvqnhnmTd146xbZUlfCSQ9IAHJcwhOLutOHxcxtgVu+MBykoP/89Sc11WP4OlEUSKhKzsuWxBuD5RAoUjIe7abVxW1irQCdjjrlAbSgvVwqV3A49trc7Q5/bwRpfO2X91sOKYdDFnx8ZHbCs6c5yP+4ES1mz6QamnMLeUtaV6Gx88TJBUZbBlpYx0nrOSlLDBcrZToGsjUOUcknAeABxAnSVZsvF8e0vMflIRbdTz2TqJ6pro6JPWKzuRyCtKNLBaDivXnEI3FxgypPLbrCcNUh/3TPBuuD9OA8euxAw9PgNCHTI8ZZw1UOCDLhnsm+4g1EXnUQjuObXd/JBqXnX4Sug9fBkKYhHkxzjSwtzBj4FBID4rG2qhW+vw==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(7416014)(376014)(6133799003)(10067099003)(22082099003)(18002099003)(261009223027099003)(56012099006)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: eoVkLCVvIfFVoGgkpJl8Iva6RGBliz3lSJ/ccAzuG4PhsJjKNeqKKZXhz5C5JvkywAu3WsJiJ8ziKuXdUq7fZ34MqkktnHOa10gq6aybNH5xD3Dfluz7Hkb7nIJnbc3RmJa33OaTzhSee0XutH0EMsitZCyH3LV+cfBoebgccpe+bLhGOD2WnE/3itBTLAsZOe/g2SqxzqpNJux7q+I6rB5gteo+0hic9Tlli7wVGAFX3vxQYR95JR2r9HqV45r+KowD2p+UoId+ekVmDGmEh04V1da7uUrSC0R8w8ntLin/HMYNJ/fiVBWjuyLqvritWDTS2TajDPtDJx7xc9+Hp91HmU/VToQQfnDpjvrrFZYWQCZsKU2bO2k4NIex8ZqEEwL6Pb2p1G3KTkS/czCrkAj/4MHQbE/hAH/Keq2TQCCeXrTmd0Pt9gF+YHP+mo1G
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 08:42:00.2046
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c475ff5-3b71-441b-aaed-08df283caedf
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E2.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5359
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_014225_888316_9BF24963 
X-CRM114-Status: GOOD (  21.47  )
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

The FCH DMA-350 controller sits behind an interconnect window, so the
addresses its DMA master uses differ from the CPU physical addresses.
Describe the integration as a bus node carrying the dma-ranges of that
window, with the controller itself as a child, and give the controller
the SoC compatible and the clock feeding it.

The AUDSS DMA-350 controller is described the same way, with its clock
and reset. It has no consumer in the SoC dtsi yet: the audio controllers
that use it are not described upstream.

The bus nodes are address domains, not devices: they have no reg, so
they carry no unit-address in their node names.

v1 -> v2:
- The DMA-350 nodes are no longer wrappers with the generic controller
  as a child: each Sky1 DMA-350 is a single device node with the
  "cix,sky1-dma350", "arm,dma-350" compatible, its real MMIO region and
  the integration resources (clock, reset) that v1 kept on the wrapper.
  The integration and the block are one device, and the MMIO is the same
  as the generic node it replaces.
- The FCH and AUDSS DMA-350 masters sit behind SoC interconnect windows
  in a static DMA address domain: the AUDSS masters see the audio
  register and FIFO block at 0x20000000 and the DRAM window at
  0x30000000, which the CPU sees at 0x07010000 and 0xc0000000, and the
  FCH masters see the 0x040b0000 window at 0x040a0000. Their DMA view of
  the address space is not the CPU physical view.
- The windows are static hardware configuration, set up before Linux
  starts by the boot firmware / secure world: they are not programmable
  from Linux and must not be reconfigured by it. There is nothing for a
  Linux interconnect provider to manage here, so the translation cannot
  be modeled as one; it is a fixed property of the bus.
- It is described the standard devicetree way instead: a generic
  "simple-bus" parent with an identity "ranges;" and the "dma-ranges" of
  the window. This is not the rejected v1 wrapper and not a separate DMA
  wrapper/integration device: the parent has no device-specific or
  vendor wrapper compatible, only the generic "simple-bus" compatible,
  no reg, no clocks, no resets, no driver and no private address
  translation. Its only job is to carry the static translation, so it is
  only a generic bus/address-domain node.
- The "dma-ranges" have to sit on that parent for the OF core to build
  dev->dma_range_map: of_dma_configure_id() starts the lookup at the
  device's parent (bus_np = __of_get_dma_parent(np) in
  drivers/of/device.c), so a "dma-ranges" on the controller node itself
  would be ignored. The translation is applied by the DMA API, not by
  driver code: the driver maps slave resources with dma_map_resource()
  and contains no address parser.
- Mainline has similar bus nodes: the Agilex5 DMA bus (dma-bus@10db0000,
  a simple-bus with dma-ranges whose controller carries
  "altr,agilex5-axi-dma", "snps,axi-dma-1.01a") and the Marvell AC5
  buses (bus@80500000 with "ranges;" and "dma-ranges", and
  behind-32bit-controller@7f000000, whose only purpose is the DMA
  mapping of the devices below it).

v2 -> v3:
- The AUDSS interrupt gate is set up by the boot firmware and is not
  configured by Linux, so the cix,irq-router property is gone.
- The bus nodes carry no unit-address in their names: they have no reg,
  which made dtc warn (unit_address_vs_reg).

Assisted-by: LLM checkpatch sparse dt_binding_check dtbs_check
Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1.dtsi | 68 +++++++++++++++++++++++++------
 1 file changed, 56 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index 0a820f45feb9..1262f34794d2 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -518,18 +518,33 @@ iomuxc: pinctrl@4170000 {
 			reg = <0x0 0x04170000 0x0 0x1000>;
 		};
 
-		fch_dmac: dma-controller@4190000 {
-			compatible = "arm,dma-350";
-			reg = <0x0 0x4190000 0x0 0x10000>;
-			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
-				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
-				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
-				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
-				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
-				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
-				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
-				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>;
-			#dma-cells = <1>;
+		/*
+		 * The FCH DMA-350 master sits behind an interconnect window;
+		 * the dma-ranges below are its view of the address space.
+		 */
+		fch-dma-bus {
+			compatible = "simple-bus";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			dma-ranges = <0x0 0x040a0000 0x0 0x040b0000 0x0 0x00040000>,
+				     <0x0 0x80000000 0x0 0x80000000 0x8 0x00000000>,
+				     <0x80 0x00000000 0x80 0x00000000 0x80 0x00000000>;
+
+			fch_dmac: dma-controller@4190000 {
+				compatible = "cix,sky1-dma350", "arm,dma-350";
+				reg = <0x0 0x04190000 0x0 0x10000>;
+				clocks = <&scmi_clk CLK_TREE_FCH_DMA_ACLK>;
+				interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>;
+				#dma-cells = <1>;
+			};
 		};
 
 		mbox_ap2se: mailbox@5060000 {
@@ -576,6 +591,35 @@ mbox_pm2ap: mailbox@65a0080 {
 			cix,mbox-dir = "rx";
 		};
 
+		/*
+		 * The AUDSS DMA-350 master sits behind an interconnect window;
+		 * the dma-ranges below are its view of the address space.
+		 */
+		audss-dma-bus {
+			compatible = "simple-bus";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			dma-ranges = <0x0 0x20000000 0x0 0x07010000 0x0 0x00100000>,
+				     <0x0 0x30000000 0x0 0xc0000000 0x0 0x20000000>;
+
+			audss_dmac: dma-controller@7010000 {
+				compatible = "cix,sky1-dma350", "arm,dma-350";
+				reg = <0x0 0x07010000 0x0 0x10000>;
+				clocks = <&audss_cru CLK_DMAC_AXI>;
+				resets = <&audss_cru AUDSS_DMAC_SW_RST>;
+				interrupts = <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>;
+				#dma-cells = <1>;
+			};
+		};
+
 		audss_cru: clock-controller@7110000 {
 			compatible = "cix,sky1-audss-cru";
 			reg = <0x0 0x07110000 0x0 0x10000>;
-- 
2.54.0


