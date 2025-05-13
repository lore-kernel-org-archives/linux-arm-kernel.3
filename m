Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C233C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 02:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qkp6gQi94U/2WPGbuHu4BvuDRcR+scHugkw+FjX9z/o=; b=TzdogpcoPyXeqdI2wO+7CLouEw
	rMb8do/5Q6eVf1f1WFzmupC9jcFnGVZkeFup/orJLoZzhCVzWgwAUAwJvflcxWoxBiUvh+cST5lhA
	Uy/xcOtWfYHYzY/U7DvYbhtE+tyGfaNAgSvuAElPYs7smiFvQSlSoCR5esm+MVKdRm5zsf2+6bCo0
	pBH6ZCRL7IyPp6+UTduFIkthLpy4xWuQHY9w787psWS7lUNl8T+V96Kj0ABPp9Is6KeTAAiQ+xF37
	Hbw2kmbWVkjCpj/wPESg1LMZmbJRGOilPPVKSjgsx4kiZZc/K0hvfu39pDnDv6aeuVpiikK9g1Je9
	FzijzT+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEf83-0000000B7wV-1ZHq;
	Tue, 13 May 2025 02:12:23 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEezc-0000000B6c0-48Kn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 02:03:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u9OIAIraml8tJw+PllXU80eMaW8lcMcD1qpJLCkCv0ojb5FOSz2QDcbUWYGFP2EwetqAlF/yPX5SdRYFkhUFvOtszJZ/22NWTjAtMqyUfERGT2ROBvpc6qNtgYLBDfLpHlxEuDobKs05pcKaACwbFfshzb/XXEqRsfGZmspTC/FAuRh7cBdztIVwYRLLRt3wZQ5Bk1BkdEPUdHClfSJ7HYOlXjJ5x+LidauWd/U+/qe4/BGamfewk9qCgvbqreulUpJ3RYt8x1hDne2nSMtqoLYyRWK1STlP4S4PoI5AQbBVDNod1kYkUxxWdAYS3VUAvgvWAVxFJE1Vq+K79tuyrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qkp6gQi94U/2WPGbuHu4BvuDRcR+scHugkw+FjX9z/o=;
 b=khN2hCrawpNuLv3IHdzXHaroXMVAt7zIFyDx/p19cXxutG1+MTPMqYd58y8GlyWDaSc2rCwuL+t7MrVCQtkEBcW7hbFmscY1ckMUdpeynjxWxewLpkTNtLbWg8kKlElJycfvfdBKK5iKCZzAAGfnmu0Jou8zpR+M/volyjHNcwEZvWEWQZy4so24P4I7B5tcxITRJ481c9Vxvc51fJH7byUXfkvXUYgENkfWCOzJPH1sSsgEEgC1SCI+8//uY+CZxPJ7R6ZQhZXx/iASmrruFKU9S91BqBUYw10nJivQ0brE3h50yxoeduQ2TOCNbA4aHSauRHFN87RY5p/UR+k7xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYWPR01CA0007.jpnprd01.prod.outlook.com (2603:1096:400:a9::12)
 by PUZPR06MB6104.apcprd06.prod.outlook.com (2603:1096:301:118::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 02:03:29 +0000
Received: from TY2PEPF0000AB83.apcprd03.prod.outlook.com
 (2603:1096:400:a9:cafe::87) by TYWPR01CA0007.outlook.office365.com
 (2603:1096:400:a9::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.30 via Frontend Transport; Tue,
 13 May 2025 02:03:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB83.mail.protection.outlook.com (10.167.253.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Tue, 13 May 2025 02:03:28 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 6D93B4160506;
	Tue, 13 May 2025 10:03:27 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	jassisinghbrar@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	maz@kernel.org,
	sudeep.holla@arm.com,
	kajetan.puchalski@arm.com,
	eballetb@redhat.com,
	Guomin Chen <Guomin.Chen@cixtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Peter Chen <peter.chen@cixtech.com>,
	Lihua Liu <Lihua.Liu@cixtech.com>
Subject: [PATCH v8 4/9] dt-bindings: mailbox: add cix,sky1-mbox
Date: Tue, 13 May 2025 10:03:22 +0800
Message-Id: <20250513020327.414017-5-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250513020327.414017-1-peter.chen@cixtech.com>
References: <20250513020327.414017-1-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB83:EE_|PUZPR06MB6104:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d1f0ae4d-3b0e-4fb0-8793-08dd91c25aad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?A+cC+LxpF0ZgJ1H0Vb72WBfmtHXe389918JtWVcelcM/tKnSCpQtxoTn5W9h?=
 =?us-ascii?Q?/a9tquYcuOanAXcAzxOKEzE1TdBQxC9Wt3bHLy7a/UUiZmBrUIKJVQve/Fsv?=
 =?us-ascii?Q?32wuNT3RK6q6Fp3sB/uqU6raxymuboew5kZAnFkhcKEe26cf6B8rCb8XV1nI?=
 =?us-ascii?Q?EybzOsf/QkXpQHHFg7T8m7qPiLASIgCjUISuPhmbz2xUmgeKSSUW+Msvg/mC?=
 =?us-ascii?Q?88qcJkXHp8ven0Nscix8313zMyJNEQ2Np2kUe0epXMx4jKSdHPgNctNmFJXL?=
 =?us-ascii?Q?+36kw2/A+9HeMMOe8lUsYd+5Sm6bz4WEbcsgveSQIzwf1ZHNYl3Hwg317e1v?=
 =?us-ascii?Q?iztpcEi/3iZiXKEl3oLOGr7pqZnkJBfbAIdiozfLZlAcY1Crz6r4qRIJAd9C?=
 =?us-ascii?Q?AQiQ2e3+ZHPzFM/aZqsFjy45+GRXESzrm2ywJCNoBpvpF3HDNoFl4E5er+M7?=
 =?us-ascii?Q?Ri8iTV4hvWwzTb19xawH8bAkZW71IPlZJo7RYuPLkQ0PTBysFF45LfXmxIf1?=
 =?us-ascii?Q?THdc0P6Iz1If8rEl2L5y5J5AdWBaDihVYbrh8myYTimh1ZVaH1Jh+PB7DfMQ?=
 =?us-ascii?Q?w9cM/jlT3KrAzcygje2TKTRgzJmHz6hWRf/bvtuhSvoqH0VX9RUVE+DM7J6X?=
 =?us-ascii?Q?ZjgH93/bNYyzGagQWSkLZHnwmtR7nci3/SZLDqnAcs/828tEX74wTehRE0cl?=
 =?us-ascii?Q?dY+nhcQg3E6M1VhSXvAoU4zEhyZslcZY9VEvMebDFkYHHuTUxiEgId55dL8c?=
 =?us-ascii?Q?EA3bSg3RX9vyRBythBT4OLmzQyn1yqEpoAMyAezYJz4L9LpX3w4WRQjf9R7s?=
 =?us-ascii?Q?d3lCLBUsBVpmBnbU63bfkl4iq12Klfyb01WDYuJ1BKIO5BlS8YrKDzG1IOeW?=
 =?us-ascii?Q?SyiQaIc86Aw7XEM3nklZz7TX85bRN4q6tREma2XLshV53LDFGSEDrLt7fldW?=
 =?us-ascii?Q?LBjciARiaVhSc2VzQ8dFRyfxick6EwWM1hq5iEkEQnN5pCAMmxISgv/u7CDV?=
 =?us-ascii?Q?h4lBptkwGd6ZlWszTYnaETdbolSG4prKpi2BK4X4sKr1G6o3BgElueWwRBPq?=
 =?us-ascii?Q?JRfXoZSwSdSz0zAP5PtZ0aO+6Nzg3B07y13XK2AHmzuzw+3DqAMxvd1OOvcV?=
 =?us-ascii?Q?pUFlD6LaNv89Hh4OhH39bVGAxCERkhL6Tdns6mgy7EdXBkoIyFXGPLH3w/8M?=
 =?us-ascii?Q?YfQ9en5mCvq0Of+DiIHxML1cqVcwKdTUnHNNPDng4cBjSpgxWDOCqeJhOr2F?=
 =?us-ascii?Q?w0ny/E4TRgpE63jqzsQzvqDFvwqdbCc2eTCIAhn8FlIUDLFZd8ut88NVPy4Q?=
 =?us-ascii?Q?wLd5NjIUZQcymJI747MfwAcAMGE1jeAhlj8i+R9A+IL5+yIHIdnTGPgOuKhj?=
 =?us-ascii?Q?18K//NR3AxHdoXA8cj9XucTTpLnconDuda3E5ELLLBfCu/fyWQidzsFkTrp1?=
 =?us-ascii?Q?OpTmvcGRgUwjh+8KLWA+7V5uYWVXwfdV5Dwxpqzm7WEd2vhaPzEV/w=3D=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 02:03:28.5033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f0ae4d-3b0e-4fb0-8793-08dd91c25aad
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB83.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB6104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_190341_027885_3928D5DF 
X-CRM114-Status: GOOD (  14.49  )
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

From: Guomin Chen <Guomin.Chen@cixtech.com>

Add a dt-binding for the Cixtech Mailbox Controller.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Peter Chen <peter.chen@cixtech.com>
Signed-off-by: Guomin Chen <Guomin.Chen@cixtech.com>
Signed-off-by: Lihua Liu <Lihua.Liu@cixtech.com>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
Changes for v7:
- Add Krzysztof Kozlowski Reviewed-by tag
- Add my Sob tag

Changes for v3:
- Replace the direction attribute of the mailbox with the strings "rx" and "tx"

 .../bindings/mailbox/cix,sky1-mbox.yaml       | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml b/Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml
new file mode 100644
index 000000000000..216186f7cc4d
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/cix,sky1-mbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cixtech mailbox controller
+
+maintainers:
+  - Guomin Chen <Guomin.Chen@cixtech.com>
+
+description:
+  The Cixtech mailbox controller, used in the Cixtech Sky1 SoC,
+  is used for message transmission between multiple processors
+  within the SoC, such as the AP, PM, audio DSP, SensorHub MCU,
+  and others
+
+  Each Cixtech mailbox controller is unidirectional, so they are
+  typically used in pairs-one for receiving and one for transmitting.
+
+  Each Cixtech mailbox supports 11 channels with different transmission modes
+    channel 0-7 - Fast channel with 32bit transmit register and IRQ support
+    channel 8   - Doorbell mode,using the mailbox as an interrupt-generating
+                   mechanism.
+    channel 9   - Fifo based channel with 32*32bit depth fifo and IRQ support
+    channel 10  - Reg based channel with 32*32bit transmit register and
+                   Doorbell+transmit acknowledgment IRQ support
+
+properties:
+  compatible:
+    const: cix,sky1-mbox
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  "#mbox-cells":
+    const: 1
+
+  cix,mbox-dir:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Direction of the mailbox relative to the AP
+    enum: [tx, rx]
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#mbox-cells"
+  - cix,mbox-dir
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        mbox_ap2pm: mailbox@30000000 {
+            compatible = "cix,sky1-mbox";
+            reg = <0 0x30000000 0 0x10000>;
+            interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH 0>;
+            #mbox-cells = <1>;
+            cix,mbox-dir = "tx";
+        };
+    };
-- 
2.25.1


