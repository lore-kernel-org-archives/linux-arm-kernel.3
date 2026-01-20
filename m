Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70610D2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 10:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vut9EyxL+DOZ5dusAErbvkcZFybgKv/mLkX+z1WkdKM=; b=r5dE0emsfXCAzZr2wMpVxnXagG
	DqcrbarpBiT/QzPuD48p0WXoaiCha7Ri9BJlVUtxD5O0qGJo5Zx1aEMscMJc/ONotEoRlb92ILNv5
	OSh1j3+ajnT4VpQC+O4TzV/mtMiAY4mNJX//hdOR9Y+lg1gmfviL+psmZmikMEM55m2F9QRqjiKFN
	Ftl9nqfad2RmOkaczvhnC2UwVmTBlyhuferEwcjXnl568e/Y3l2m+903tZ/hjATeoGyCe3ECS+J2q
	H87aCN8eXDOA1Vm72b3h3pByWVz0haTtRRhOTPm2S5xmXgN4AVdyOljs4LmdQze1R0STfsSBZGDtT
	QVYWXRhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9Dw-00000003dz9-12hg;
	Tue, 20 Jan 2026 10:44:36 +0000
Received: from mail-southcentralusazon11011032.outbound.protection.outlook.com ([40.93.194.32] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9Dt-00000003dxn-1N0Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 10:44:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dQJ+VNptDhPAFKTv2wNfk4/iGfEj3U+Lk/OoPd/15c5tc9ytiEclE7LsvACTR5qryCL/c+KS8e80G8YCO+soFnXm9qKqvySnccPMI6MpuOOeGN5T2vFjC8+5WyiobpZLRBqGHdNuLUnCT20CjnYtyagmjlK0cRMMHyN2ifP8brKxT4p/HWgx+nI2fMIMiSDvbAnyFzgCHYJyZZsNDpoOxyZTQga0q2IppYYI/I+t61ikyn1bCh2ZBhmCaPL/ZpY3W4QkJoKX5fWRxpNmPMJFRLVQj4LansE2+uWz782GKwxE1s4C/82W8ZhpiH08K4f+hhdZPgs58+nnWDdOfHkv1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vut9EyxL+DOZ5dusAErbvkcZFybgKv/mLkX+z1WkdKM=;
 b=whuXFkcsxtGBGeo2UUjp2xEMFB+ySLVyuaYMq63w81b0CaPpiyiMlmvabLbMVU6aBzDL5EW7qbUq6VnaFrT8p1kfJeF9f/FDYhblDvcpV34bj6VatJvllA1AG3WviI9vQ/hTGtFcVH5BWmogcAMF80+17lgJeq/YWaG51HuwDUfXM34SL0gW1GhgLSPvTG7DIPGjk+Rwu4aJ/lFJ1hLoLlF8Kk1wVJI8WB7glRVRCymhbiWnJX4d2VhN3L0cLEFJ8KxNN1TGH10URs6lCTywSbz2u9rWp5kLUVfI6u5FD34WRYGACfQ8t9FAQt7p/BzMjQsG8BVveU9Q8CN55/m90w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vut9EyxL+DOZ5dusAErbvkcZFybgKv/mLkX+z1WkdKM=;
 b=C8SGXxEGUcJ3Lkanp2OwskdCVPc12Mx12SE/4cXGfarTGpT/fo5lP2N2EkbzOY82Aniv1/dIFbie/u0gXExap7Tu6nS7TUH4ECtbyEGqWLx2tJgityzPoJCDPUeoP8T96EI9Ro/ScITfPP7l1PzjnhGYJP+7ymRfVH4cdLjiRM0=
Received: from SJ0PR03CA0070.namprd03.prod.outlook.com (2603:10b6:a03:331::15)
 by DM4PR10MB6862.namprd10.prod.outlook.com (2603:10b6:8:105::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 10:44:29 +0000
Received: from CO1PEPF000044FC.namprd21.prod.outlook.com
 (2603:10b6:a03:331:cafe::d2) by SJ0PR03CA0070.outlook.office365.com
 (2603:10b6:a03:331::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Tue,
 20 Jan 2026 10:44:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000044FC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.0 via Frontend Transport; Tue, 20 Jan 2026 10:44:28 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 04:44:27 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 04:44:27 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 20 Jan 2026 04:44:27 -0600
Received: from psdkl-workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [172.24.234.127])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60KAiIEg939676;
	Tue, 20 Jan 2026 04:44:23 -0600
From: Aniket Limaye <a-limaye@ti.com>
Date: Tue, 20 Jan 2026 16:13:46 +0530
Subject: [PATCH v2 1/2] dt-bindings: interrupt-controller: ti,sci-intr:
 Per-line interrupt-types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260120-ul-driver-i2c-j722s-v2-1-832097c6b64f@ti.com>
References: <20260120-ul-driver-i2c-j722s-v2-0-832097c6b64f@ti.com>
In-Reply-To: <20260120-ul-driver-i2c-j722s-v2-0-832097c6b64f@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, <u-kumar1@ti.com>, Nishanth Menon
	<nm@ti.com>, Tero Kristo <kristo@kernel.org>, Santosh Shilimkar
	<ssantosh@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <j-mcarthur@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Aniket Limaye
	<a-limaye@ti.com>
X-Mailer: b4 0.14.3
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FC:EE_|DM4PR10MB6862:EE_
X-MS-Office365-Filtering-Correlation-Id: afe2d3fb-6f92-442c-0884-08de5810e2fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2YwQTdmWm14ZlFsWTZia0Njc0NyR1BXMWZoWXAvbHJmY2JvRGFCMWVHVCtW?=
 =?utf-8?B?K3BWbm1lWGluWWU1MGVUUjJqcWRkL0c3dW9BQWVkOHY1NzNKSXMyZjhCQTBt?=
 =?utf-8?B?QU1PSGl0SmxUQnJCQTZ3am5GZWExT0RXRXdCdzhjTUNwNXBuVHF0cHFnRmVO?=
 =?utf-8?B?K0Y2cGh6UUJMNG1ZUS82NTNjU0loWE5OL3N1bjVUMXZweVhjMGdra3ExeS9y?=
 =?utf-8?B?SnFzSTcxSXpELzVmS2JnSGR5YWt2OXRHLzg4RStSdFIxcEUwQ05NMlczU29w?=
 =?utf-8?B?QUkvNzJSVmFVNjRnbHFLbDhrMCsySEhZQllMT1lJZVBpekdkdnZHVURuc0hi?=
 =?utf-8?B?ZnBzUm16dmV6b3FKM3YvZnZyTllzMEdzVHpnbysvaU00ZVhDWk5XSHhNV0pa?=
 =?utf-8?B?b3cvUExZYUtrVEw4MTk5KzdLWFp4NTliOEViUmhKZURGWW9CTXRlWStSMTVQ?=
 =?utf-8?B?Y2Fid3UwRVJUcEhpMFZ5Z2xDdXcwQVpVUHFLbGxuQzAycjNJbUw5QmJnOHhR?=
 =?utf-8?B?djd0YzRQZmNrdTJyTFZveU1rSkZYcU4xRi9wZFVxS05Wa1p4RFZGMnZZdG80?=
 =?utf-8?B?QTR1VU5nS2FpeTgybUM2ZExpR2w5MUJZZ3h2dWY0QVQxU2JyTmUrSmlFeDUz?=
 =?utf-8?B?b2E1V3F2dzRFQ0c4akVDRjc4MitDNVRsb3RSWTd0QmZlbWRySzRoUkNodUR2?=
 =?utf-8?B?Y0JGeW0wbFVVYWU0cGNwM1RVUGtjdzl1cVViUStTajRJYVZ0Yzd2bEtWdlJj?=
 =?utf-8?B?aGQ1OXplK2ttWmcxckQybXBGVkVOdlNCQmRMb0FiZHAxZkx5MGJjdmliQ2pV?=
 =?utf-8?B?Wll5WU12My9jY003K2RmVWdGZWczcE9nM1laT0lFbmI1RHZ4dFRmMTFUOTFj?=
 =?utf-8?B?MURMVmVjT2ROM1J3YjVYS2h1MllERGVKQUlUUWpzb3VpU0g1R2h1M0lDaDdP?=
 =?utf-8?B?ZzBSTXdhUWQ4QXdUQkNZTnZqcGlpN1N6WGowaSt0MG8rMWkrY1YvN0ZJa0o1?=
 =?utf-8?B?NVl2bTJUREJSTlhtcDMvNjJxbTBlMVl2R2Z6NTVrV1JyY2FrSnorTU4rTkhq?=
 =?utf-8?B?dDk2cWlHbUo2S3FML3c1dHZKaFZ4MlVUVUpPZzdxdDQ0VGdJQWxtNXdJWGdQ?=
 =?utf-8?B?Q0Q2NDN0S3NXZjFjTGtMUFdybEFFTE9CRzdYSmlPcWpUbThIRlo3SmFqOE5M?=
 =?utf-8?B?UC9FV0lEV1BEYUx0cytMdklUR0t4WW14WHlrZ3J1dXV2bkpUWVpxanlnbnVw?=
 =?utf-8?B?c3dIM3o2QWxZd0Exa1oxMWNGVFVSRXBSUUJGL0x4TDNHNmR0a3VpbXdQaEZB?=
 =?utf-8?B?eVFlZGYzRlA3aytSUTVOY0FISU1vUUpRdlovcUpWcExYTHlaMEZUZ004ODlV?=
 =?utf-8?B?aWh4MHN4eEpEdWFBYkZzWjJZSklOTW8vS01OK2FRQWR1ZjJwVGoyM3JEN01j?=
 =?utf-8?B?bWlXdlRHa2ZSckRBTFFIbnBEZ3VJVzB2bzZmc3hiei9WUGxUMVA4YmI4QVNv?=
 =?utf-8?B?dG9vdU1FYVB2bktjY3hOeitialVJbEtJSjIzUmpSVWxPcWJybUlMSFVzUGRX?=
 =?utf-8?B?UUJvTWNFNG1QVll2YTMzOFpyYlZuY0s3ODh5aXB1eElBTGVlSE0wK0l2Ujly?=
 =?utf-8?B?THNHNXFCMlkra1lFTXB6a3ZXMnZFTmJYaUtRV2dscC82dUo0VDR0ZlhSZXJQ?=
 =?utf-8?B?YVU0WFp0NGlia2FZK1NET0JmQk41OGtwWHNYYzR5UnJFWVFOYXlBRzZkdlIr?=
 =?utf-8?B?S3hxa1NwODJtU0xOb3p3WTNNWmcvNytqZzBTWGtmbjNQTHFsVWh0dHN4cUdv?=
 =?utf-8?B?MjRNNkJVNk40cFFrY2JxK082NDdnaEI2emJJM3FLUktjdDM5VnljdUtlVHdw?=
 =?utf-8?B?aGxKTk1GNDltVjN4dFlJM2VnRlFsV205bnUyUDlpWVA5blBRcDFvcVVpL1h1?=
 =?utf-8?B?QTRFKzFCdjM3bG16OEg1UUVPMzZ3ZmxCR293c21zVm43K0Q1MEc1WWJIRndU?=
 =?utf-8?B?aURxelJyckVxdHdGVHV3UlEwbjBQNTRHY0x6SE9oVU82cnZybGUzaDRCdkF3?=
 =?utf-8?B?Ukczc1pMczJHTHZVSy9FQklLSHk3L25LT25zWjR2aDJnYnhYUlR4bmpjcTl4?=
 =?utf-8?B?eTN2M3BrWW5OSDAxaFpyKy9jb1pINnZsV0phak9XOFFLL0I2SG5lWWxoOE1Y?=
 =?utf-8?Q?99/CYFK1FNd1pvv0H3UCm1U=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 10:44:28.2776
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afe2d3fb-6f92-442c-0884-08de5810e2fc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044FC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6862
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_024433_374921_554F935E 
X-CRM114-Status: GOOD (  14.59  )
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

Update the bindings to allow setting per-line interrupt-types.

Some Interrupt Router instances can only work with a specific trigger
type (edge or level), while others act as simple passthroughs that
preserve the source interrupt type unchanged.

In addition to existing edge or level interrupt setting, add a third
enum value 15 (IRQ_TYPE_DEFAULT) for "ti,intr-trigger-type" property, to
indicate that the router acts as a passthrough. When set to 15,
"#interrupt-cells" must be 2 to allow each interrupt source to specify
its trigger type per-line.

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
Changes in v2:
- Reword Commit msg to better describe the patch
- Link to v1: https://lore.kernel.org/r/20260116-ul-driver-i2c-j722s-v1-1-c28e8ba38a9e@ti.com
---
 .../bindings/interrupt-controller/ti,sci-intr.yaml | 42 +++++++++++++++++++---
 1 file changed, 37 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml b/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml
index c99cc7323c71..59c01f327f3b 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml
@@ -15,8 +15,7 @@ allOf:
 description: |
   The Interrupt Router (INTR) module provides a mechanism to mux M
   interrupt inputs to N interrupt outputs, where all M inputs are selectable
-  to be driven per N output. An Interrupt Router can either handle edge
-  triggered or level triggered interrupts and that is fixed in hardware.
+  to be driven per N output.
 
                                    Interrupt Router
                                +----------------------+
@@ -52,11 +51,12 @@ properties:
 
   ti,intr-trigger-type:
     $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [1, 4]
+    enum: [1, 4, 15]
     description: |
       Should be one of the following.
         1 = If intr supports edge triggered interrupts.
         4 = If intr supports level triggered interrupts.
+        15 = If intr preserves the source interrupt type.
 
   reg:
     maxItems: 1
@@ -64,9 +64,14 @@ properties:
   interrupt-controller: true
 
   '#interrupt-cells':
-    const: 1
+    enum: [1, 2]
     description: |
-      The 1st cell should contain interrupt router input hw number.
+      Number of cells in interrupt specifier. Depends on ti,intr-trigger-type:
+      - If ti,intr-trigger-type is 1 or 4: must be 1
+        The 1st cell should contain interrupt router input hw number.
+      - If ti,intr-trigger-type is 15: must be 2
+        The 1st cell should contain interrupt router input hw number.
+        The 2nd cell should contain interrupt trigger type (preserved by router).
 
   ti,interrupt-ranges:
     $ref: /schemas/types.yaml#/definitions/uint32-matrix
@@ -82,6 +87,21 @@ properties:
         - description: |
             "limit" specifies the limit for translation
 
+if:
+  properties:
+    ti,intr-trigger-type:
+      enum: [1, 4]
+then:
+  properties:
+    '#interrupt-cells':
+      const: 1
+      description: Interrupt ID only. Interrupt type is specified globally
+else:
+  properties:
+    '#interrupt-cells':
+      const: 2
+      description: Interrupt ID and corresponding interrupt type
+
 required:
   - compatible
   - ti,intr-trigger-type
@@ -105,3 +125,15 @@ examples:
         ti,sci-dev-id = <131>;
         ti,interrupt-ranges = <0 360 32>;
     };
+
+  - |
+    main_gpio_intr1: interrupt-controller1 {
+        compatible = "ti,sci-intr";
+        ti,intr-trigger-type = <15>;
+        interrupt-controller;
+        interrupt-parent = <&gic500>;
+        #interrupt-cells = <2>;
+        ti,sci = <&dmsc>;
+        ti,sci-dev-id = <131>;
+        ti,interrupt-ranges = <0 360 32>;
+    };

-- 
2.52.0


