Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20206C98308
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 07:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b28VSkaiC+H5BMGCTosCuzPJZTw8xeVONBmQ25xxRQM=; b=Cy1ByH6NcmdoneifGyhbm7fCXH
	GSL5SjqXeTp0uCKVTA7YibZD6B/8UuHaDl86wiCY/KcAilzZxpWnlh+RBvc7/nbWv/2KqPzIxqA22
	9yRPG/qag2qKzZT4q1vJ2ZyFg6oRsGuCb6JPhZ5HoNEy9p0l2we+dFsqJKKFEzNDdaO3nk1EFKwf7
	mZ3xseh4vJmDWlySjbe9Y+Dj8dFKoUao2ZR7sEbXNZub0saElB19byjyY5Ng2eHPzJuzXNVLE85Y+
	DnkxXrlbB0x59QHso1ExcMvkuLfeijh2hjxLea2Kc1RD6xX3yYAbJTwCGjHR0Dlr5ZlmxVwV11EaV
	n7+S22aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9HE3-00000007Nfa-2gWf;
	Wed, 23 Sep 2026 07:17:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9HDx-00000007Ncd-3pkS
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 07:17:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=b28VSkaiC+H5BMGCTosCuzPJZTw8xeVONBmQ25xxRQM=; b=ISCmjLMgHxwThqzRNDz0H2jgjo
	RXd03w10x4T/fJgJAPtWKIJjkvANDFYW/bQG8/sqtcvL4FlMdO9cmCw3TdNJMCoEV7ZnOpXwjf1SG
	RMXmpOVeUDIKRZCO/MgzPx8UVyEsA2JhhVi83HY9SE6L0CmFCS9QJ3J1QBF3cbzH0ERII+T59xjI+
	c4uXsvGDVOZhYIWRhwlX/RRPY+fH0BgimQB/xW70TqLaFU3YlEfUKF6neUiCTiU/T0T8t8Q1vQTCH
	ADPdG+EZAnQd4zwNLzpq5nECNC7NZHPBgM04u90vRihXZ3E8FI5tj0de9fugZMhnKEAWhN6QuLdpz
	3SQiRUwA==;
Received: from mail-southcentralusazon11011018.outbound.protection.outlook.com ([40.93.194.18] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9HDo-0000000ESlR-3vS5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 07:16:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M1WsiD+P3eH7w5KrDZ36xvQLImJSdAlngg2p30++PstMkEBlZaXW7uNiYdvvOKiPtCaRaithfuR/UeR8hWv9ymwh/lHHRt56dGSu2z4lRCufCY7V3QUVqoEeEBOE673cgYlOchR8oeiDg8Sdpa3hFzAIo9Z2NPFirmvBEBAv+dchSA/JEQs+XxJif68HrNbhK41QzlQBSMuaCrrBvKCA0K17qOZU7hLW6/yWnV05h8h5arkKIoKyqQ0abmb5oDWRIlUI3U6ZmqmPGGbFZthMwoaXKsICC4d0E9SxtwoA6oWITHMDSxZr+R0VsCbcEIhllgOi0+M7/aZeDAHkLBTvDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b28VSkaiC+H5BMGCTosCuzPJZTw8xeVONBmQ25xxRQM=;
 b=rg0DzP7Ni1ifFuCONUiFlIWOES24D0qc3Qeqlx4H5yCuMJ/cNFhZHT9xvSMraWJWyBp0Iw+zK4UD8+koo2zJDVzPA31M4e2HsPR8VhGaQkbPlldIxIiSWMF2m5A/LKqF4JYUJhSmQ3KrceyTKc/dDVbre9KnQMYfW+HES3kwVtPBo4alBsu4doDWqmhl8/rEBJvg3X5g9Li0Ih79ICdiBTeCb7uSVad9NOtgSA7q7sLUbLHA8zib10mgoI93IgFgMEHN4lWUdRYxIhv4mVcjA1hO51l1asJciYIUZdURUM+uMUyjWV6TeE1TVHVzOlB2eRq64OHwC+24OfebLdpSag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b28VSkaiC+H5BMGCTosCuzPJZTw8xeVONBmQ25xxRQM=;
 b=OpB0zLZ4kWiai1t1Gz5cWF4X/KT4PVncsIBT1nKikUqYvRvq3PT0TgNPdOLEoofLFaoqPcZexpQU7NijE0jwugRazKox5sXHGstoK5oV08ilKUxf+rPqgOJZWLHkDDevJ+MF5YdfXK/FXsDGm8KiHxwUeCfi365XrDkN4wiJrC4=
Received: from PH5P222CA0011.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:34b::15)
 by CY8PR12MB8314.namprd12.prod.outlook.com (2603:10b6:930:7b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Wed, 23 Sep
 2026 07:16:43 +0000
Received: from SJ1PEPF000037B9.namprd05.prod.outlook.com
 (2603:10b6:510:34b:cafe::53) by PH5P222CA0011.outlook.office365.com
 (2603:10b6:510:34b::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 23 Sep 2026 07:16:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000037B9.mail.protection.outlook.com (10.167.244.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 07:16:42 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 23 Sep
 2026 02:16:42 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 23 Sep
 2026 02:16:41 -0500
Received: from xhdtunimkar40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Wed, 23 Sep 2026 02:16:38 -0500
From: Tushar Nimkar <tushar.nimkar@amd.com>
Date: Wed, 23 Sep 2026 12:46:31 +0530
Subject: [PATCH v3 1/2] dt-bindings: interrupt-controller: Add Xilinx
 Versal NET SMMU CSR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260923-smmu-changes-v2-v3-1-87bd09ba9605@amd.com>
References: <20260923-smmu-changes-v2-v3-0-87bd09ba9605@amd.com>
In-Reply-To: <20260923-smmu-changes-v2-v3-0-87bd09ba9605@amd.com>
To: Anirudha Sarangi <anirudha.sarangi@amd.com>, Thomas Gleixner
	<tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>
CC: <git@amd.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Tushar Nimkar
	<tushar.nimkar@amd.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790147794; l=3182;
 i=tushar.nimkar@amd.com; s=20260917; h=from:subject:message-id;
 bh=/X0Y481AIlfdO5p17knYhpEmuAu/GMNgPmVrgnQCZKU=;
 b=PwmssJeL1LDRnvnq7Q8r9m/BYDKodYJ7tbVyyl9oEFMGI8INatnaBFRBBDKSEzFJhmt0Xx57S
 Jw3p9GL6gGQAGx3/YJCjSqsAsQxKqrLwZP0xhz8fMIOa5eGCBCH4l0I
X-Developer-Key: i=tushar.nimkar@amd.com; a=ed25519;
 pk=Uirerl/gKBwPgdWL9awJAJkw5FM33ZF2TlUTJ58DEYA=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037B9:EE_|CY8PR12MB8314:EE_
X-MS-Office365-Filtering-Correlation-Id: e067c5cb-95fc-481b-7b16-08df19429e99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|376014|82310400026|1800799024|10067099003|3023799007|22082099003|18002099003|56012099006|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info: 5GjQ6jM1ysiETCUcoSftq4UvpEs2ROuURDWtDbUUMl+TVjuH3VC3lxt6gCOvF2BFFSpTowg6HIFeRKercFkmOtcC/Km6BplZr8ifOclZFHJbAAUanfxQbbiqtLKyzHKivDfmettFB7/UDGGdaRAUuTYfAkfqDE6iDj/onMdXnYxiGK57K/ypC9zEknvWA81LW3Fw0tywe9e//JTk+ji4y6z68Bp+o5eScq0JwUGncwlqmcvulNrIUnYtnw/aaV5DMfXMqy4sSS/xeLzds7XjKT8WBdqZm5adeAr2eB7b34+w0nkWnkJepbPQ21AC163gHlyPCWw/CDEvqf63SFTHTP+pMhgUtz9oxlLNUSaTr27ww+kIx80RImioS15d6wozNbdPghjjqNNX+8Hn3Jbh+MImbk7BtVk+3nBEonvlxjQVYLxcqJ0nJQY9mxccQhc7wyGajXy3ct857mzI7t/XhvUGlxJ/DIHg/dB7mTPGqIBMrGOVO4Pe/Wn6bxpSt72SiE7KavcMt7ll9humnbuebXNo8bDntaog92twxUtCaITTyp65Vkqal/f027i/24fvD3tvZbekw35hdm1QPZRuwlGBBTI8TEMbc84pEJv2q3b5P7OdFPAF++ZSnPNEWZNVZcFWpKtM/s+RPVDlME3WZA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(1800799024)(10067099003)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: B0AFEdUqjNFp0GY0aQvIC+uNyol/wdkhP9hJPwg7R1/MyZH5EePU7058mRqb8cQMyqtIx/3pGXL+hHKPDcwzwdE+8DmXbUzk2fLgDi04PuF0AxzkgY5c3W49SYUWsFGUcXPi0wk/YKeqUNnSptO9iD/2IPYa4ImKZ4RCN0fQYgKDqu5Ntj8NJ1YhY5pmXpafMT0YiAetZpn1NHqEh2s970AVSRpbYZhQLYtM+f4lUalNAmlYrvFsqGl7nbfRmBewIIo+zQYnyaiv0RjMZhgc0FAhR3So73zlSCGQof/hDVRlEQUT9QLlBmxCRXR0n9tR8daBErCpJMQ616bjPzE6y8IXtQSmYTPP0Kie10+Hq56Fq40tZ+epLYh81dFmMZUfq43H+s6rtT7jHAL5eZ1elya4/cNEFzaTUfceGkqAeqOo3xzuqvD8pV98cxUvJLv0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 07:16:42.8012
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e067c5cb-95fc-481b-7b16-08df19429e99
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000037B9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8314
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_081656_391875_5B5DE639 
X-CRM114-Status: GOOD (  14.69  )
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

From: Anirudha Sarangi <anirudha.sarangi@amd.com>

Add a device tree binding schema for the Xilinx Versal NET SMMU CSR
(Control and Status Register) interrupt controller.

The SMMU CSR block acts as a vendor-specific interrupt controller
in front of the ARM SMMUv3, providing registers to enable and clear
standard SMMU interrupts such as EVENTQ, CMDQ_SYNC, GERROR and PRIQ.
Interrupts must be acknowledged in this block before being forwarded
to the parent interrupt controller (e.g. GIC).

Signed-off-by: Anirudha Sarangi <anirudha.sarangi@amd.com>
Co-developed-by: Tushar Nimkar <tushar.nimkar@amd.com>
Signed-off-by: Tushar Nimkar <tushar.nimkar@amd.com>
---
 .../xlnx,versal-net-smmu-csr.yaml                  | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/xlnx,versal-net-smmu-csr.yaml b/Documentation/devicetree/bindings/interrupt-controller/xlnx,versal-net-smmu-csr.yaml
new file mode 100644
index 000000000000..38b63e51b732
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/xlnx,versal-net-smmu-csr.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/xlnx,versal-net-smmu-csr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx Versal NET SMMU CSR Interrupt Controller
+
+maintainers:
+  - Anirudha Sarangi <anirudha.sarangi@amd.com>
+  - Tushar Nimkar <tushar.nimkar@amd.com>
+
+description: |
+  The Versal NET platform includes a Xilinx-specific SMMU CSR (Control and
+  Status Register) block that acts as an intermediate interrupt controller
+  for ARM SMMUv3.
+
+  The block provides registers to enable, disable and clear the
+  standard SMMUv3 interrupt sources (EVENTQ, CMDQ_SYNC, GERROR and PRIQ)
+  before forwarding them to the parent interrupt controller,
+  typically a GIC.
+
+  The controller receives one parent interrupt and demultiplexes CSR
+  status bits into the following child interrupt identifiers
+    0 - EVENTQ
+    1 - CMDQ_SYNC
+    2 - GERROR (GLOBAL)
+    3 - PRIQ
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  compatible:
+    const: xlnx,versal-net-smmu-csr
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 1
+    description: |
+     Single cell containing the child interrupt identifier
+      0 - EVENTQ
+      1 - CMDQ_SYNC
+      2 - GERROR (GLOBAL)
+      3 - PRIQ
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - "#interrupt-cells"
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    interrupt-controller@eca10000 {
+        compatible = "xlnx,versal-net-smmu-csr";
+        reg = <0xeca10000 0x1000>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+        interrupt-parent = <&gic>;
+        interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
+    };

-- 
2.34.1


