Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A41AFC5926
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 10:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=srWL9bt58H8X54p4YAG4fjaV9EEKOcR5MTMc7HXPiu0=; b=eWtYM4wFdHUzOImF1jBv5UidA4
	DnqLSNTL9cy77TNdIeI6T4LgvPnHVFI2wpMRtgX7kjl7GEBpvOM/YZmngfhumzgw7N3abNk2Fojrp
	LfapInY7ksfPu0p9+oOg6iuak21ZPIZ1fHBo3Gy8aSRya1GgyoEX4jU4GlzLdlwRSbHr1qUxuR85W
	BIjMaxuf7OICh7CIFFlOpNBmSD2uHMNPp800v+a6Y22y48NANd4dX6XwgPWB05qUEIo9C9sKuicCx
	JJyQTdv9uce+8Eg8UowQmzumqWrrO9F4847hHezFrcGi2HX4LytMW6cIYBj8ZftGOFOWi33Xd6qnj
	sHmOhwrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYdm-00000005umx-1O4u;
	Thu, 26 Feb 2026 10:30:42 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYdi-00000005ulN-1MGS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 10:30:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qwCKXY+5yiO4sMkV3LCrRuxdSblyZj5WMvpFyCQDq7zQ8CqUOV86KIhHjZyFmIJgulC3Xj9K4it7dm8glqGANIWRCAfUMhdNcnmLnky0hpARCMfOOVCbLSJrqTfuzlFtNVHeCnp0RCaA6/DD/CRE+wlUPpu8wcpwvU+prsVAE0QzdcyHMIgDV/Ujj6j6DI/8Q4RqBRxZQSkjDlj9XDz95dQ27Ps+CeUGsPVPCCh3dIrHkE4ZH15VxlCmI4LFiFNkBGgRKIzjhMM2IXl0sCc57pEnzVENnolu7Lvk4j/W1R1/NKWpb2YxntsXPw+sUsuFZgrd2e1voSCokVwRmPfs8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=srWL9bt58H8X54p4YAG4fjaV9EEKOcR5MTMc7HXPiu0=;
 b=xfwCljUusrdqH98KM2bJxOlvw7BthLGDVGc/2X6SciDnSMHc8lxM2WTickox6zVwg8ZWK8X1xtRoq5RY5RZI3OgRBH6gtRLnzdMekmJ9KDlrTBLzt/dnyssj4L8pyvvZr4zla9gCnzmwA8VJ2fLny6uUkzRep3ObJ51+TyOc+cCG3Rrx89ecpni4d8Y9+hI92DAZmHGlNg2WS68ZwiN+5PMCGjwUSwWQKq3Q/NzfeNLrwjDBYIL0B8ZyDSw9aqcSX8+9aTr+F2q5lUMyFY5p5BWySOyNfabQcO9SeJJkXHAKaRQMTB7nLctEYbTArlDlHsoPZa9awQKm8ZwCg1kPhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=srWL9bt58H8X54p4YAG4fjaV9EEKOcR5MTMc7HXPiu0=;
 b=k9X1mjNCNXE0p/A/prGycWbR/YNuPZ1jY5GMCTydPJSjUihezA+Ijvlekg2U7OopZH1RWgW1qwTRbkp02OAMRckGOBPOPGfvnQPY8DiAQy6AQlNBpXiipKlEPINdNI/bbbtv6JqT6t9FS5pYdvuehc7erySQhLpOaCJOuB88BIQL5AifxVRmA69qmQJfi0JxmMLBmgPEvaXYkQY2ByV9f1TKedSOaAG7P8PvcoAZQ56CUPmyT+r61XbQHtUeJAKBQ+lZuwNiSLflWz/ry7Miv1uk0Nhy4Qz94B6WvCO3j1nhcuDaA4HAHSlwcLJyXeZKZpwQZPa92IqapTT8XstCbQ==
Received: from AS4P192CA0026.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::10)
 by PAVPR10MB6839.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:323::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Thu, 26 Feb
 2026 10:30:33 +0000
Received: from AM3PEPF00009B9D.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::eb) by AS4P192CA0026.outlook.office365.com
 (2603:10a6:20b:5e1::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 10:30:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF00009B9D.mail.protection.outlook.com (10.167.16.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 10:30:32 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:32:40 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:30:32 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 26 Feb 2026 11:30:16 +0100
Subject: [PATCH v6 01/12] dt-bindings: document access-controllers property
 for coresight peripherals
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260226-debug_bus-v6-1-5d794697798d@foss.st.com>
References: <20260226-debug_bus-v6-0-5d794697798d@foss.st.com>
In-Reply-To: <20260226-debug_bus-v6-0-5d794697798d@foss.st.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan
	<leo.yan@linux.dev>, =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<legoffic.clement@gmail.com>, Linus Walleij <linusw@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, <cristian.marussi@arm.com>,
	<jens.wiklander@linaro.org>, <etienne.carriere@foss.st.com>, Sudeep Holla
	<sudeep.holla@kernel.org>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9D:EE_|PAVPR10MB6839:EE_
X-MS-Office365-Filtering-Correlation-Id: d38a0db9-b148-4337-260f-08de75221248
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700013|921020;
X-Microsoft-Antispam-Message-Info: zbGMnGh8FZLKvTR9BHD9xvrScXRdh9VDC7c+FFHWeueHegFdKO2eqOIVc6NXVNXH/G/Kq6jzWmh9+AtllIxxZuQ/zYOCM/GYu1KvTGTxxIoR14BTjaxrhk5ItjGyXQQCp/WLeRwmGC5+EBatew893SbY8sURm6L4003kDQUQ0r30dUyDzJiCcipxWz/4ODnR8UQ5FNqwsBRcP7D1gcAygoCiPT5LDiGaKBHTgY36QWuooeyzKbj8fzMYZ2QBNWILiAi7jlVVHNB0bKRE4g5Pgw4A82vbJs+wndtBk0vHnsnOr18oLNVUCC4MV+Hu/NhlUj46UC8MUxUD9cfpuDHhnrt2LnDemf1HUoI3IzHiqbhesZmj0gylptksbCYdtfMOi60AyuAVI6jYM+zF0vQjGLIw5p1pp1Th4FoswxBZVa7MTx1oYjZIRove4rXLXoqDrv+9D4aS3PMZiZLzVf9ilH9FudaKwS83NqsyqMs+n+NhIsEV9kxpPpZj9ltqDPbVmsjQGCOpjBHA0bjUrodX53lQeEEytAGcFADc1k9SDtsGhqVO4IXRYwUii8JY87299TI1BG63XBRYVB9Xxurh5itI7hXQI5QO8IGiYLzzA4H4xGZjt1ihg2AMWiDqocJs2FT4yCTnly6daXUOHO6ZjkVyYUNnC3r3KJilyv5eyXp4ROiKeuLTGgPtS4S7QGj3EjZ1bZTsOf6a8co6P00X44DA+b/MO68AeHl+6/JhH6AiJV/VRxIx0rFcvLRdGMJb6MqawqhJPyyGYuUas4eRKKltPQrVi9LssqR3oojs2zaqn3wemlh16b+WOa8t/yIBviwBjE7+z7pzBAUShlovUh9cuCxxrFxwXw3zh9A47MQ=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700013)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZYNxRUWuBe7IS92ebtRUBFMUp2hhen+Ys7UlhJCflF1FKHQIgU+RzBBaZXoe23rWGor3JZfpyWiCzVav96pDqM7ZsxLW/blPKbC/O5OCcnZWoXs8m5g9Hgqf1n6Ci5NFXzDC2KHX93pFfScfxPYOu77W44GIxW9W88bpbYAwoKaqhaxUhf4aOHDQ5dY5b5bOUbeT27mU7KSR8/EwZfEx6y1M9BNTuhDkzCltIDHn5gd/lR4NDDpJMJLmwIBdI4ro6M19qzC3US8xYotRPIf+ihV/uv4JfUu4Fr25pu78TH2BrFzY3gzTi17H+//b+4xYuNZCWydOkdkv/tjqPfu8OGYhCHV1WNC56t/yqnW5AArDuegem4JWgsuub60s0otWqjG9iw426Um0OFojINQXzSF+WShqjO8Mg3B4K6oeQJ+YGNevVtrQ2ktqU/EIyVD6
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 10:30:32.8470
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d38a0db9-b148-4337-260f-08de75221248
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009B9D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB6839
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_023038_368298_F775A931 
X-CRM114-Status: UNSURE (   8.78  )
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

Document the access-controllers for coresight peripherals in case some
access checks need to be performed to use them.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml           | 3 +++
 .../devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml          | 3 +++
 Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml           | 3 +++
 Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml           | 3 +++
 Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml           | 3 +++
 Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml          | 3 +++
 6 files changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
index 2a91670ccb8c..949444aba1f8 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
@@ -128,6 +128,9 @@ properties:
   "#address-cells":
     const: 1
 
+  access-controllers:
+    maxItems: 1
+
 patternProperties:
   '^trig-conns@([0-9]+)$':
     type: object
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
index b74db15e5f8a..b0693cd46d27 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
@@ -78,6 +78,9 @@ properties:
         description: Output connection to CoreSight Trace bus
         $ref: /schemas/graph.yaml#/properties/port
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
index 71f2e1ed27e5..10ebbbeadf93 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
@@ -118,6 +118,9 @@ properties:
         description: Output connection from the ETM to CoreSight Trace bus.
         $ref: /schemas/graph.yaml#/properties/port
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - clocks
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml
index 378380c3f5aa..f243e76f597f 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml
@@ -73,6 +73,9 @@ properties:
         description: Output connection to the CoreSight Trace bus.
         $ref: /schemas/graph.yaml#/properties/port
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
index 96dd5b5f771a..9dc096698c65 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
@@ -128,6 +128,9 @@ properties:
       - const: tracedata
       - const: metadata
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
index a207f6899e67..29bbc3961fdf 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
@@ -70,6 +70,9 @@ properties:
         description: Input connection from the CoreSight Trace bus.
         $ref: /schemas/graph.yaml#/properties/port
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - reg

-- 
2.43.0


