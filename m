Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D81C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 07:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gT5JxJdOP/gH5XTnLdTvDzX4sF9AguuL9+g3UDm7e08=; b=fyCAck/sXg5msqO9J3d2qSiqwx
	YNyyUpSV/aYxxmJAzRRJq+LB+RRwBVzAuxzlGibyicPGaYfGTbNLzc306uZyUTsDIdvTyAKRnu4oz
	PMybWestHjjrBqApwgSjgRgobRuc0OBPFsp2AE0y/SNG5QpQLkeOkEwsFUU0V+uITGgwaiiZEgl1C
	iKCzika2cHb1GSChiMmwnUTyCDPHE55b/ncvVbOCQOE9iIiW14YMGSDhSQVhUGHCrsf66122gOWdC
	Qotx4L1LKGcIbpyETKSctTEHeI3Mu24D2sUs5TQYX1kKMtOqt04GsvYIjdQPv07L1EjLUPXyI89Tc
	7X/fVDvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucJPX-00000009VOy-44Mr;
	Thu, 17 Jul 2025 07:52:11 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIwg-00000009QCq-3aaX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 07:22:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jQ1TGJVx6pibV+ufw3h8ISH9AdORw8+ZO7lCZGpun+TGxHnbPczJ/6YBhg1/bPny+rP57sBNDv2Wif50fEGshX1M2cztS6fdIZzyfyt+2ZmycsV0dDmvZchLTM5ZUz4gT36IKN55Y3dtOlkO4vyOdxw4RqLhOKtLwE0NLyQFscC/EUWojD4+HinWHqBdTwe+eoiOXV9YBhlIEAWn1vOrhUUtZmlhKeUWwY/C4wk9BpJzuqz8zXvWYHtPrRfNMBSqpe2sWSC6GMTdS9PHH6MCQ5b3OMrVMKxXBX7FooInCFmzd4phoqWXFhlCVmjeDf4yjE+tBSir+SbFjNnASP9F5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gT5JxJdOP/gH5XTnLdTvDzX4sF9AguuL9+g3UDm7e08=;
 b=pJtpKqV52srHKu+m9jiKSCRXSqGuf9kiZJtvvenunEDjLNAsGpzouZd7HbB7L0HfkPE04ubD3dcy6qXJs+cLpgou6melFKWFJZrjGgHq3Dgy9OC1bTalb2/d3tNhCNYxV9iisiWML8jxJN71x3wV2RSkSSqjj4aY/9VLvmVnxkoPfhyPVvwZ2ZyvGqP1S6Tb15HNK3CCXM0+pxa95pnHHoQ0yW0UC+2qaapmnEE/QZWgdbBDbGLZP4aXKngl1A50v5Fbi0WVOqjeWJuncjR8MXXdkcjKjcIXDIXseofJlo/D1EHC2qXyhhLB/EpTsiDjm5XvVb4Uk6P0pFCgW0+w9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR02CA0045.apcprd02.prod.outlook.com (2603:1096:3:18::33) by
 TYQPR06MB8119.apcprd06.prod.outlook.com (2603:1096:405:2fa::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.32; Thu, 17 Jul 2025 07:22:11 +0000
Received: from SG2PEPF000B66CD.apcprd03.prod.outlook.com
 (2603:1096:3:18:cafe::27) by SG2PR02CA0045.outlook.office365.com
 (2603:1096:3:18::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.21 via Frontend Transport; Thu,
 17 Jul 2025 07:22:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CD.mail.protection.outlook.com (10.167.240.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8943.21 via Frontend Transport; Thu, 17 Jul 2025 07:22:10 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id D9C4C41604F9;
	Thu, 17 Jul 2025 15:22:09 +0800 (CST)
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
Subject: [PATCH v10 4/9] dt-bindings: mailbox: add cix,sky1-mbox
Date: Thu, 17 Jul 2025 15:22:04 +0800
Message-Id: <20250717072209.176807-5-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250717072209.176807-1-peter.chen@cixtech.com>
References: <20250717072209.176807-1-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CD:EE_|TYQPR06MB8119:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8e070abb-88b1-4997-c4b9-08ddc502a517
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qFmyzdOj5h474U/THFr2kjGx0nBu7wefC0LMEj7QZeeAzVzieyeIELBpdUtV?=
 =?us-ascii?Q?1zGSpTvRQNOIRl0eaGYQoOKf3H8q1fo4DxzQ8vnpIynN0vV7a2iSNRzVCd1z?=
 =?us-ascii?Q?QCpZw6yRulR5dlwNOvQfy5D1+zGKMJyTZ2X1+p55SCnONh/2kxQtjO6lBy4l?=
 =?us-ascii?Q?sakK2oiNxcKdinJzjN2Fo6N/yOOC8DCSL+zOa56obxhuEqFyy9ZiT8C7Daia?=
 =?us-ascii?Q?nB10PNCEzhCHEaDDHW2T5MT5G/6milT5tm3yYWq96o29f464pGkm3HkUgHDT?=
 =?us-ascii?Q?FGfW0Lb4YZR54KV3kEfZg4SudtXKlX4LMxJk31Z8Tk9KKd7meGs6XUuvb7Ha?=
 =?us-ascii?Q?mSQYW6GzyIDtlCXnpcKKcrC2lkWfGgTO2+Xh+V0deAY15jvaJBD39kTCVqXc?=
 =?us-ascii?Q?cwcFXJx7qa7FviEVj5PeGzB/RuAs1gIix+JuT4hqz5DlrQhNaYmSM1gbVB9y?=
 =?us-ascii?Q?hgSrlCmdTmVkMmFJASJFmIJMWUx0JI33RquVq1WoUZQ70djvzE2dedHNM1PH?=
 =?us-ascii?Q?pCsjdLR4G/fTSxvkyHabcV3ZDzp7XTMr/ZPKBu2Qw/fR/Vi6O2PrY4bRC7Wf?=
 =?us-ascii?Q?nF7sHcLc8hkK8xVRAi+x17A8getbGYKvRirl/KZhkASNQPfkU4K+FnkqKDMO?=
 =?us-ascii?Q?IuUj/NS58jB1PCuH06BK5+BRRAlIpaYYjusI48nbA74jGlRoh1yuQkGwM7bB?=
 =?us-ascii?Q?C9txKXD5INk2QMSJ0m5ah60sB+yKo0DCXXNISKBGZkDmrmjZ4nGF4nLDvdij?=
 =?us-ascii?Q?7038OggQtn++B9oWMa2iasCRIkzba4lSH9s4MqtPMNI8+y5UjHG0BMIntxTQ?=
 =?us-ascii?Q?sciVZzjDoM95MjboQEwcoFz5ietQy6khziS3wgwhh/RPD9VSiKnFq3HogX5/?=
 =?us-ascii?Q?1ArbRDD2UhnhV4GmH5/fsU8kpqPYbXExsL+aZTmMx8zKlta9IlQBOHpSylxQ?=
 =?us-ascii?Q?GDgzCzEKRuqgnNjTCL+7NgfEmiETnv9USURJBzhhRYobOQXzqADKfC/VejvM?=
 =?us-ascii?Q?42ApkG1CKbzHp7uWnpJqVlydIY3XPmgskawIei/fha3BH08SkZtEEv0vUOra?=
 =?us-ascii?Q?+DQl932V/1C6Dh7o+rGt4b4WOo50sMjUST1OFFL05wzvDv0z3JitBW31U0wy?=
 =?us-ascii?Q?2Gyof1JFG5GMyVUzU5OtTWWTuRzHXQAHS7rJpk/2rgp/YcG8FrGWYDHbVWf6?=
 =?us-ascii?Q?kodHw++JdmsUMDHQN7MtO70igTj6ntFCWms8/wrjmxV4BOSuEVT1TJlYwviu?=
 =?us-ascii?Q?3eWsV+TvNHHYAMDbTr9bIDP1JYpT+L5E69cPbqKcEb6MrcRHS2CHvnNPBHlj?=
 =?us-ascii?Q?vcylKSRy+sXOyByEpfLVd4iZAEZB/88xlzCId6FwsHxKVz3+GAZoSzCw/zSB?=
 =?us-ascii?Q?vr/yy8XzcSDFEVLVXJSaNQIyP7nRLudSJcYXKexUgAcrPnqN0CBGgc9NIXV4?=
 =?us-ascii?Q?AWS39zrLkt0ByneWGgHHyUnKvTwpn+kP5wN02ZzaaSfogl1o1NixHw=3D=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 07:22:10.5275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e070abb-88b1-4997-c4b9-08ddc502a517
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CD.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYQPR06MB8119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_002222_902686_D9BFC25E 
X-CRM114-Status: GOOD (  14.53  )
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
Changes for v10:
- Update the description of the Sky1 SoC use case.

Changes for v7:
- Add Krzysztof Kozlowski Reviewed-by tag
- Add my Sob tag

Changes for v3:
- Replace the direction attribute of the mailbox with the strings "rx" and "tx"

 .../bindings/mailbox/cix,sky1-mbox.yaml       | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml b/Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml
new file mode 100644
index 000000000000..66d75b7bc8c8
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml
@@ -0,0 +1,77 @@
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
+  In the CIX Sky1 SoC use case, there are 4 pairs of mailbox controllers
+    AP <--> PM - using Doorbell transfer mode
+    AP <--> SE - using REG transfer mode
+    AP <--> DSP - using FIFO transfer mode
+    AP <--> SensorHub - using FIFO transfer mode
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


