Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F8EEE8B383
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 02:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X0wHX0iGY+FpWwoiDV4hCWS+Ea/V+9Pd+u+jyqoeHxU=; b=G5rVyjbHuorV97XGOIKzDqwSKM
	klMRaxAMQ7vi0QmTQRWQBd8mGzI75v4eM/13tz1Amk2s1odDyksBs03U1M5H/bj0J8FpJm42+6GOb
	JD/c9KRw6ks209qr22kQMYxhoHRgbEUegA74AUVgMF5Xl5DyiifvEFxnXyMkJDygTkp1m6TC5vVVz
	VWC5h/oasKLO8k6NLQLY1EcaTJdLmi6Ku+cOJAxao/IOWnGIdKbH50BivFuP6tbB1U1Zz+TS5LhhK
	jPYvqfailuWiv/SJbPWU8SHC/6R3jMQdCukSLt/o3KPhFqdiQuv3BfZTODwd0KrI5u6pb4NjzgH6C
	fNqhTgUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnSIE-00000007kC4-2G0D;
	Wed, 04 Feb 2026 02:06:58 +0000
Received: from mail-koreacentralazon11023094.outbound.protection.outlook.com ([40.107.44.94] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnSIB-00000007kAb-01qc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 02:06:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ur3a1rUIUAeYFSxmLwqTccoeq/X0bBPf0kZx5kNyrUfEEwPaQCQWMQAp1zuU4ag1ms/RLnkObPKUPaV92xlXn2HujyeY3iYBB7M2xGzCZSgnRbgNhU6ORgqjGpY4cbEij7giE2CEmdugugEK+Zil9/H7/KTL4h0b2ar7Gcke4ArA6PJW9lvMrKJSFm1/qhvHZzkcO26O12O1mp59IX6Y+GnOuE1685d6HcqoTTI8jRBga5PspKFR2EsaADw0sgtIgi3c4VGPwJml+tZWkWHI/YWZBX0c/WlCxZbaVWECe4HXY/mqRGJEoVqKCwE0bU/Jh1jEajAGlycT8GCCBw2ylQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0wHX0iGY+FpWwoiDV4hCWS+Ea/V+9Pd+u+jyqoeHxU=;
 b=yCtxbFzjiCCpvGoqJRrfeQadFlyu5SPn9jehs2HmeJzOkrDqSoVFTXJYviF8pwlWbZxyx2W4SrvYKNO+vs8JAEc7Q4T7Yx4+3+Gu2fgFmiagUoyA6FHXTfD8OuSRa02F4mAXfhtkVEHeF8lkrijfkkawGWPi+/ogDx2hDEpclOSErL1WmQCfQPMDyq0B2REBHRM0UCp3Whg14YV4fFaMeqtfhIng1jNcEF8qeNmesZLdODU6ozgMB7pBWxzZtXeeYJXocl7kSV0DDVWUMRVGteMTbz/1or4jA9t2DipemDznDRG1+iWYJcMRUeMVNmkNWvzg/VLeVJt3ijQ2kuA71Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SEWP216CA0003.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2b4::6)
 by TYSPR06MB6442.apcprd06.prod.outlook.com (2603:1096:400:483::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 02:06:46 +0000
Received: from OSA0EPF000000CB.apcprd02.prod.outlook.com
 (2603:1096:101:2b4:cafe::22) by SEWP216CA0003.outlook.office365.com
 (2603:1096:101:2b4::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.13 via Frontend Transport; Wed,
 4 Feb 2026 02:06:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CB.mail.protection.outlook.com (10.167.240.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 02:06:45 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 3B78941604E6;
	Wed,  4 Feb 2026 10:06:44 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	peter.chen@cixtech.com,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	alchark@gmail.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v7 1/3] dt-bindings: soc: cix: document the simple-mfd syscon on Sky1 SoC
Date: Wed,  4 Feb 2026 10:06:42 +0800
Message-ID: <20260204020644.155094-2-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260204020644.155094-1-gary.yang@cixtech.com>
References: <20260204020644.155094-1-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CB:EE_|TYSPR06MB6442:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 19f89641-e411-4857-3df6-08de63920c56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|32650700017|36860700013|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?abLGB0J9Xy+2wJrCrsAM99ALvw8+bWmNWgHQ3qhkqc/W6I8hdh6hXobuFQYk?=
 =?us-ascii?Q?kBqHga4qHHw66CDOaezmhR1J1CioSvQepWD3erS2JleWczyED+kJHQiFsmTp?=
 =?us-ascii?Q?YIGljzJlAvXnpCe6vHUy9zD1qUi99MkbT+/o7LA2JuIrdtaIKMwG2JnMIlIh?=
 =?us-ascii?Q?4OC06waaSWN+Yi+HxmezcCaoqYqLAnWNAMqGmGaaKuab9H/iMzP74yqCdTgy?=
 =?us-ascii?Q?tt/24KeIyDytvORKGnfCAcAOXL82HFD/nW8d1/cgeTYPu9g7v3wNX0WRFewe?=
 =?us-ascii?Q?4P3+MWGhd5G+4JFIZlNDaF5GeCEz5ZbUpopcs9n0Ot8XLIKkyRLxWDSN7V6E?=
 =?us-ascii?Q?3IKcL/Jm+id8K2KUA3LqkCUs/aDcCR8Z8Asvhl5lyb6UogXSGQL/Z31lTUfp?=
 =?us-ascii?Q?0oUmlIJhvEGgEYZNmIXYNuM7H26s2lo0elAn4bdu9Ni4I9WPitfFcJOixDWJ?=
 =?us-ascii?Q?wDgWKm/8cV2mmpuDdDaEtEfsXBG0j0Dz+YQgHY3d521GRqRE1P24gNNEY7dr?=
 =?us-ascii?Q?/mMKuvn3TAQJJvgHdtUpZPab89ZPIq/9zhsx8ToozaAULePQXbHOYvYtXPLY?=
 =?us-ascii?Q?rzNt3OsCLsgto5DyBpSt0UZ+uK8O5Zx7UkR9sm/21b836YApXAC1wcr9X1m8?=
 =?us-ascii?Q?Bni/PCDMYo8NHodvCgf3Sn6/VBAeud0U8Iv+olDoUFCi+cYfmWVfrh3mAcbw?=
 =?us-ascii?Q?mv4kPI7y2PHf7qki7axVcqnHVv7lR5Qg7DccyLYaGpwHkuROxayeju7Bl6UJ?=
 =?us-ascii?Q?ohTEovnNYQ6H6ZbRrDNBgKbfsu0ubZutYf2ibmJOQ2idJWxSlHiRxPu3b53P?=
 =?us-ascii?Q?cu2FCNKjmuD2k5c0yXWICFVRyoZTZ774THmJSjzeINy6D0chxP2dOmhr7lnZ?=
 =?us-ascii?Q?kyoja/uez+OJq96ndscauTKCbFdAMJzR9TrK+9fm5E2urKtfxFhh8JZj4iuJ?=
 =?us-ascii?Q?zfG6BUI23PSTW4tnI1zlU2gKP9fQHIRVBtD1Fem48KTVG5VxhUWE05YwDsgq?=
 =?us-ascii?Q?Xvs092CEkUZE3abMBdocmkh66hGhi6WlTmhdsTB48B5zGgh7Tis1974ndRmi?=
 =?us-ascii?Q?dvd2j+Lpw3WmUzQ2g6IuGuiLON3l36MCifNHM+wt8iH2BqP4ZEOv0hQsteYt?=
 =?us-ascii?Q?bFerXcDgDjl1po2Gbn/ZuZXtl7YBcDhUzeMNjLwKPj4Pun3cYFXdhgHen/zE?=
 =?us-ascii?Q?3yu4x3YvIxxZlKWQDzAOO8XaVIffcXLseKkKq1YmwJ5VhVvvbAMzDvT6p8lq?=
 =?us-ascii?Q?FWrUeIueoJfzHv6XKD96D0H1fSbI5iZ8l8u8KjVkwd7VZVUprgj6rj7yt6e9?=
 =?us-ascii?Q?t4Urxmbuq4GCTXEQu1GK0TwWhJzRZsCEjwXGkuXhUzfzL7H8p1cvlYkTH8Kf?=
 =?us-ascii?Q?IkCBYvVeB5JLwksXH8jIRn3MkMnex9o6PSypILlfnqq5s4XssP+teHgIrn4V?=
 =?us-ascii?Q?JYsn/osOBj+u6O7aGkEt3dcxSP3lU+ROzPy2Tie+kVb0Yd6BeX5DXic4AiHe?=
 =?us-ascii?Q?Z5nOI8TaN7hvSlUkvDYgCEp9i5Sp+NNAd8JXdGlyETnU8aL7LUunT+g1baOR?=
 =?us-ascii?Q?METikIO6pxy88960R11gNj5uMg8R6Rz0olvhsk50qMPnD0za39Ss50JqYbeN?=
 =?us-ascii?Q?IZR1h/Gx6zoByoSmLXZdc1Y=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(32650700017)(36860700013)(7416014)(376014)(82310400026);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: psUrM6Off62bb6niBIc330xnb2PasNt9rE6m2FqVQ4baa2thlyxAYCP3nRJ0MLapR1FchLofuD8yeoY9WMxOYh+tBz96tCWE78ZEZ+a480pq0Zj3cPND2q2GDmwprHe2JtzVpBSq7v+g+gpZGDhQU6zjCyv2P4TXC95oSaTs6nDPn9NtjKCaCvBvCTy0Abe4AACoo+GCfUuZ2lwEYGDLoOtxmUqmjc+17VL5/Gbbv/uAiryElQz9H2CydW2FDz20dEtvLb9IpN3tgWY8DAfbe/bvhftheiL0t55mbg85Kfg7x1dfWRRYxu0hS8dvv2PjlvvlOdMulwbU8i/vCoTyZIRGoy9s6UEYbbNAwdNwAoMglhb5qcwGiDmWTVlFQbXBfFqfu/pYwi0rEmTBtHZ2W1cDZhEa4wqg95e4XZltF8CtVpxQvwlIoFhScV91UB4e
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 02:06:45.4067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19f89641-e411-4857-3df6-08de63920c56
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CB.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6442
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_180655_169399_459C80A8 
X-CRM114-Status: GOOD (  14.50  )
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

There are two system control on Cix sky1 Soc. One is located in S0 domain,
and the other is located in S0 and S5 domain. The system control contains
resets, usb typeC and more. At this point, only the reset controller child
is described as usb typeC uses it by phandle.

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 .../soc/cix/cix,sky1-system-control.yaml      |  49 ++++++
 include/dt-bindings/reset/cix,sky1-rst-fch.h  |  42 +++++
 include/dt-bindings/reset/cix,sky1-rst.h      | 164 ++++++++++++++++++
 3 files changed, 255 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml
 create mode 100644 include/dt-bindings/reset/cix,sky1-rst-fch.h
 create mode 100644 include/dt-bindings/reset/cix,sky1-rst.h

diff --git a/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml b/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml
new file mode 100644
index 000000000000..5fb6b97c3c00
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/cix/cix,sky1-system-control.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cix Sky1 SoC system control register region
+
+maintainers:
+  - Gary Yang <gary.yang@cixtech.com>
+
+description:
+  An wide assortment of registers of the system controller on Sky1 SoC,
+  including resets, usb, wakeup sources and so on.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - cix,sky1-system-control
+          - cix,sky1-s5-system-control
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@16000000 {
+      compatible = "cix,sky1-s5-system-control", "syscon", "simple-mfd";
+      reg = <0x16000000 0x1000>;
+      #reset-cells = <1>;
+    };
diff --git a/include/dt-bindings/reset/cix,sky1-rst-fch.h b/include/dt-bindings/reset/cix,sky1-rst-fch.h
new file mode 100644
index 000000000000..8e67d7eb92aa
--- /dev/null
+++ b/include/dt-bindings/reset/cix,sky1-rst-fch.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/* Author: Jerry Zhu <jerry.zhu@cixtech.com> */
+#ifndef DT_BINDING_RESET_FCH_SKY1_H
+#define DT_BINDING_RESET_FCH_SKY1_H
+
+/* func reset for sky1 fch */
+
+#define SW_I3C0_RST_FUNC_G_N	0
+#define SW_I3C0_RST_FUNC_I_N	1
+#define SW_I3C1_RST_FUNC_G_N	2
+#define SW_I3C1_RST_FUNC_I_N	3
+#define SW_UART0_RST_FUNC_N	4
+#define SW_UART1_RST_FUNC_N	5
+#define SW_UART2_RST_FUNC_N	6
+#define SW_UART3_RST_FUNC_N	7
+#define SW_TIMER_RST_FUNC_N	8
+
+/* apb reset for sky1 fch */
+#define SW_I3C0_RST_APB_N	9
+#define SW_I3C1_RST_APB_N	10
+#define SW_DMA_RST_AXI_N	11
+#define SW_UART0_RST_APB_N	12
+#define SW_UART1_RST_APB_N	13
+#define SW_UART2_RST_APB_N	14
+#define SW_UART3_RST_APB_N	15
+#define SW_SPI0_RST_APB_N	16
+#define SW_SPI1_RST_APB_N	17
+#define SW_I2C0_RST_APB_N	18
+#define SW_I2C1_RST_APB_N	19
+#define SW_I2C2_RST_APB_N	20
+#define SW_I2C3_RST_APB_N	21
+#define SW_I2C4_RST_APB_N	22
+#define SW_I2C5_RST_APB_N	23
+#define SW_I2C6_RST_APB_N	24
+#define SW_I2C7_RST_APB_N	25
+#define SW_GPIO_RST_APB_N	26
+
+/* fch rst for xspi */
+#define SW_XSPI_REG_RST_N	27
+#define SW_XSPI_SYS_RST_N	28
+
+#endif
diff --git a/include/dt-bindings/reset/cix,sky1-rst.h b/include/dt-bindings/reset/cix,sky1-rst.h
new file mode 100644
index 000000000000..2f0990922aad
--- /dev/null
+++ b/include/dt-bindings/reset/cix,sky1-rst.h
@@ -0,0 +1,164 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/* Author: Jerry Zhu <jerry.zhu@cixtech.com> */
+#ifndef DT_BINDING_RESET_SKY1_H
+#define DT_BINDING_RESET_SKY1_H
+
+/* reset for csu_pm */
+
+#define SKY1_CSU_PM_RESET_N		0
+#define SKY1_SENSORFUSION_RESET_N	1
+#define SKY1_SENSORFUSION_NOC_RESET_N	2
+
+/* reset group0 for s0 domain modules */
+#define SKY1_DDRC_RESET_N		3
+#define SKY1_GIC_RESET_N		4
+#define SKY1_CI700_RESET_N		5
+#define SKY1_SYS_NI700_RESET_N		6
+#define SKY1_MM_NI700_RESET_N		7
+#define SKY1_PCIE_NI700_RESET_N		8
+#define SKY1_GPU_RESET_N		9
+#define SKY1_NPUTOP_RESET_N		10
+#define SKY1_NPUCORE0_RESET_N		11
+#define SKY1_NPUCORE1_RESET_N		12
+#define SKY1_NPUCORE2_RESET_N		13
+#define SKY1_VPU_RESET_N		14
+#define SKY1_ISP_SRESET_N		15
+#define SKY1_ISP_ARESET_N		16
+#define SKY1_ISP_HRESET_N		17
+#define SKY1_ISP_GDCRESET_N		18
+#define SKY1_DPU_RESET0_N		19
+#define SKY1_DPU_RESET1_N		20
+#define SKY1_DPU_RESET2_N		21
+#define SKY1_DPU_RESET3_N		22
+#define SKY1_DPU_RESET4_N		23
+#define SKY1_DP_RESET0_N		24
+#define SKY1_DP_RESET1_N		25
+#define SKY1_DP_RESET2_N		26
+#define SKY1_DP_RESET3_N		27
+#define SKY1_DP_RESET4_N		28
+#define SKY1_DP_PHY_RST_N		29
+
+/* reset group1 for s0 domain modules */
+#define SKY1_AUDIO_HIFI5_RESET_N	30
+#define SKY1_AUDIO_HIFI5_NOC_RESET_N	31
+#define SKY1_CSIDPHY_PRST0_N		32
+#define SKY1_CSIDPHY_CMNRST0_N		33
+#define SKY1_CSI0_RST_N			34
+#define SKY1_CSIDPHY_PRST1_N		35
+#define SKY1_CSIDPHY_CMNRST1_N		36
+#define SKY1_CSI1_RST_N			37
+#define SKY1_CSI2_RST_N			38
+#define SKY1_CSI3_RST_N			39
+#define SKY1_CSIBRDGE0_RST_N		40
+#define SKY1_CSIBRDGE1_RST_N		41
+#define SKY1_CSIBRDGE2_RST_N		42
+#define SKY1_CSIBRDGE3_RST_N		43
+#define SKY1_GMAC0_RST_N		44
+#define SKY1_GMAC1_RST_N		45
+#define SKY1_PCIE0_RESET_N		46
+#define SKY1_PCIE1_RESET_N		47
+#define SKY1_PCIE2_RESET_N		48
+#define SKY1_PCIE3_RESET_N		49
+#define SKY1_PCIE4_RESET_N		50
+
+/* reset group1 for usb phys */
+#define SKY1_USB_DP_PHY0_PRST_N		51
+#define SKY1_USB_DP_PHY1_PRST_N		52
+#define SKY1_USB_DP_PHY2_PRST_N		53
+#define SKY1_USB_DP_PHY3_PRST_N		54
+#define SKY1_USB_DP_PHY0_RST_N		55
+#define SKY1_USB_DP_PHY1_RST_N		56
+#define SKY1_USB_DP_PHY2_RST_N		57
+#define SKY1_USB_DP_PHY3_RST_N		58
+#define SKY1_USBPHY_SS_PST_N		59
+#define SKY1_USBPHY_SS_RST_N		60
+#define SKY1_USBPHY_HS0_PRST_N		61
+#define SKY1_USBPHY_HS1_PRST_N		62
+#define SKY1_USBPHY_HS2_PRST_N		63
+#define SKY1_USBPHY_HS3_PRST_N		64
+#define SKY1_USBPHY_HS4_PRST_N		65
+#define SKY1_USBPHY_HS5_PRST_N		66
+#define SKY1_USBPHY_HS6_PRST_N		67
+#define SKY1_USBPHY_HS7_PRST_N		68
+#define SKY1_USBPHY_HS8_PRST_N		69
+#define SKY1_USBPHY_HS9_PRST_N		70
+
+/* reset group1 for usb controllers */
+#define SKY1_USBC_SS0_PRST_N		71
+#define SKY1_USBC_SS1_PRST_N		72
+#define SKY1_USBC_SS2_PRST_N		73
+#define SKY1_USBC_SS3_PRST_N		74
+#define SKY1_USBC_SS4_PRST_N		75
+#define SKY1_USBC_SS5_PRST_N		76
+#define SKY1_USBC_SS0_RST_N		77
+#define SKY1_USBC_SS1_RST_N		78
+#define SKY1_USBC_SS2_RST_N		79
+#define SKY1_USBC_SS3_RST_N		80
+#define SKY1_USBC_SS4_RST_N		81
+#define SKY1_USBC_SS5_RST_N		82
+#define SKY1_USBC_HS0_PRST_N		83
+#define SKY1_USBC_HS1_PRST_N		84
+#define SKY1_USBC_HS2_PRST_N		85
+#define SKY1_USBC_HS3_PRST_N		86
+#define SKY1_USBC_HS0_RST_N		87
+#define SKY1_USBC_HS1_RST_N		88
+#define SKY1_USBC_HS2_RST_N		89
+#define SKY1_USBC_HS3_RST_N		90
+
+/* reset group0 for rcsu */
+#define SKY1_AUDIO_RCSU_RESET_N			91
+#define SKY1_CI700_RCSU_RESET_N			92
+#define SKY1_CSI_RCSU0_RESET_N			93
+#define SKY1_CSI_RCSU1_RESET_N			94
+#define SKY1_CSU_PM_RCSU_RESET_N		95
+#define SKY1_DDR_BROADCAST_RCSU_RESET_N		96
+#define SKY1_DDR_CTRL_RCSU_0_RESET_N		97
+#define SKY1_DDR_CTRL_RCSU_1_RESET_N		98
+#define SKY1_DDR_CTRL_RCSU_2_RESET_N		99
+#define SKY1_DDR_CTRL_RCSU_3_RESET_N		100
+#define SKY1_DDR_TZC400_RCSU_0_RESET_N		101
+#define SKY1_DDR_TZC400_RCSU_1_RESET_N		102
+#define SKY1_DDR_TZC400_RCSU_2_RESET_N		103
+#define SKY1_DDR_TZC400_RCSU_3_RESET_N		104
+#define SKY1_DP0_RCSU_RESET_N			105
+#define SKY1_DP1_RCSU_RESET_N			106
+#define SKY1_DP2_RCSU_RESET_N			107
+#define SKY1_DP3_RCSU_RESET_N			108
+#define SKY1_DP4_RCSU_RESET_N			109
+#define SKY1_DPU0_RCSU_RESET_N			110
+#define SKY1_DPU1_RCSU_RESET_N			111
+#define SKY1_DPU2_RCSU_RESET_N			112
+#define SKY1_DPU3_RCSU_RESET_N			113
+#define SKY1_DPU4_RCSU_RESET_N			114
+#define SKY1_DSU_RCSU_RESET_N			115
+#define SKY1_FCH_RCSU_RESET_N			116
+#define SKY1_GICD_RCSU_RESET_N			117
+#define SKY1_GMAC_RCSU_RESET_N			118
+#define SKY1_GPU_RCSU_RESET_N			119
+#define SKY1_ISP_RCSU0_RESET_N			120
+#define SKY1_ISP_RCSU1_RESET_N			121
+#define SKY1_NI700_MMHUB_RCSU_RESET_N		122
+
+/* reset group1 for rcsu */
+#define SKY1_NPU_RCSU_RESET_N			123
+#define SKY1_NI700_PCIE_RCSU_RESET_N		124
+#define SKY1_PCIE_X421_RCSU_RESET_N		125
+#define SKY1_PCIE_X8_RCSU_RESET_N		126
+#define SKY1_SF_RCSU_RESET_N			127
+#define SKY1_RCSU_SMMU_MMHUB_RESET_N		128
+#define SKY1_RCSU_SMMU_PCIEHUB_RESET_N		129
+#define SKY1_RCSU_SYSHUB_RESET_N		130
+#define SKY1_NI700_SMN_RCSU_RESET_N		131
+#define SKY1_NI700_SYSHUB_RCSU_RESET_N		132
+#define SKY1_RCSU_USB2_HOST0_RESET_N		133
+#define SKY1_RCSU_USB2_HOST1_RESET_N		134
+#define SKY1_RCSU_USB2_HOST2_RESET_N		135
+#define SKY1_RCSU_USB2_HOST3_RESET_N		136
+#define SKY1_RCSU_USB3_TYPEA_DRD_RESET_N	137
+#define SKY1_RCSU_USB3_TYPEC_DRD_RESET_N	138
+#define SKY1_RCSU_USB3_TYPEC_HOST0_RESET_N	139
+#define SKY1_RCSU_USB3_TYPEC_HOST1_RESET_N	140
+#define SKY1_RCSU_USB3_TYPEC_HOST2_RESET_N	141
+#define SKY1_VPU_RCSU_RESET_N			142
+
+#endif
-- 
2.49.0


