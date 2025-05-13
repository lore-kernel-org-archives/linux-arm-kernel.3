Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DA2C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 02:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tdPnR+qQTKK1uT4ot4BQhrMALpF3oO12PDINoZXQpt4=; b=I2sUIacpgfiUrxxANvd07uPOMY
	8rGaX+RdJotg7v1qEF7lxf+yZYELSrTj14NkfZVmk3WIoYoS70J4vdJRZbw4f+myfkl+1xSUd3eKZ
	6TAxMzW0L8H4+1leQqXsPlXDP/uqizkw3R81p1NYxTbBAlLHoW0Ok4zge+4NUl9NSYm6/dqzpPvdP
	3lG14QtTDPJYxgxp4p+p2TME4eX8v+qtp+FYnGpSmREZd8PVCHltzjb+AEkTb6wuCptL0Jz4VPUlS
	kP7H/2R2KwNPQmsD7nCyGZ7kmAdxI07fDjs+FcqYBTnzglFtJjvyIQ0lj85xhqJz3/b3g+F208/Kd
	+bobiQOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEfKZ-0000000B9WG-3x2y;
	Tue, 13 May 2025 02:25:19 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEeze-0000000B6cH-0kO1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 02:03:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yc789YtF3ta3AK6FHHlvQfJEvckGDs8ebMWCba2NG8vrI9XFHLahT5KFwjR+bA2fHyp70m2iX8mrUSBXDRtOloS9hXmZIitcpPx4ZYnCONgOztYFFCFJSgZNshLjXKQlB0iHz/OPRBFe3cIt2/cTL7JKB3rBxEzp68jwn1btXyGohioChORTNjhvrk0k+fImtffyb8gMF/SiqkBzwGpnQBbqvTOyRhcE8FLYkl25lmvZvhZbHB/ymfSAuVj7uclyzfRcl7U5Ktun2ECRQvsZQXjeTcot0TVAfSLnL4bxXyjB7ABJCD8nWHT774xFGmyFRzAP5+aflJ9mTn5l+8y/9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdPnR+qQTKK1uT4ot4BQhrMALpF3oO12PDINoZXQpt4=;
 b=NW0v224H6smRv7eehajXom5OTiEcZ+5R1ZzIwWYw3CjB22BPzm7EzFMfky0nmNMtFr6V/J9bn6YAmDVTsnJ++zxhLFGjNux0NwOmmStsIVqFIn3LjpPRJq+x6zVyXFCUry+9IGI6UFELxcrBW4Com/CleGsRwibVTTKQ3gsrEWxMjJNETn9bDP6qDr9l869EROM3vOwowuZ79ws8JwXaAqVtv+EMJKQptJcjfIxC6LbWuAgQsgOsdXTzMEufDQS6ZaRLgdeQe18Y2mVYUwVby4Tg+XEtPTqqpgsNPQ/0cviuhP1wd5ZN8chz5epoP7eZYaDshIt0vmJKbBr0T5OCqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0018.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:263::9)
 by JH0PR06MB7210.apcprd06.prod.outlook.com (2603:1096:990:8d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.26; Tue, 13 May
 2025 02:03:29 +0000
Received: from OSA0EPF000000CB.apcprd02.prod.outlook.com
 (2603:1096:400:263:cafe::c) by TYCP286CA0018.outlook.office365.com
 (2603:1096:400:263::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.30 via Frontend Transport; Tue,
 13 May 2025 02:03:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CB.mail.protection.outlook.com (10.167.240.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Tue, 13 May 2025 02:03:28 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 4AD214160503;
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
	Peter Chen <peter.chen@cixtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Subject: [PATCH v8 2/9] dt-bindings: arm: add CIX P1 (SKY1) SoC
Date: Tue, 13 May 2025 10:03:20 +0800
Message-Id: <20250513020327.414017-3-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250513020327.414017-1-peter.chen@cixtech.com>
References: <20250513020327.414017-1-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CB:EE_|JH0PR06MB7210:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6b036c8e-d5ec-4927-2339-08dd91c25a62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QU7QRW2vev95r9Ef0hT/gY/L8O42JmatjOOPQAyU9hklh0BF6pwlQ1LuUtmq?=
 =?us-ascii?Q?tDOjvhspyai62bHSo5WqKs4vpXkYFZtz4YPmcYD5ajn0fMTDgmqOQ8rTUlGd?=
 =?us-ascii?Q?rz1goVTt49mdfZVZ1b+p9nAJ6xOh10u26CsA5ikc9NnmIJtD0WRXzVZdBdjb?=
 =?us-ascii?Q?iAfUpaK5Lqb8AOLSbJyHXGCMqA6ljRyq6MUql6gc4+0kO2lyd7KKGu1/WBri?=
 =?us-ascii?Q?D/zPfpEjNgD0yIOzeKCqjmcTLHUdKwCjb5xtQAIV9NZY3uEn2UAKpcrJ7CUr?=
 =?us-ascii?Q?Y56MTICl8FFBRCmWbc8NGi1iqH9+APBqKIqwsUSDIZ2Pbelqu+35gF3f4+XJ?=
 =?us-ascii?Q?9qPf6fmK33Bus34qNjHKFpe3sWvA5KxOEX6lyoClu2W02mcBbQNUpaq6Ro5B?=
 =?us-ascii?Q?l0+owOnaJDoq31WCCtFO0nv+ZP9hPPfHClnHlLaBc0LR541qQyCWMUpr1O78?=
 =?us-ascii?Q?CRIPHisIOREibRBQPVjPQ3jRK8PHq+tIKsNGZ7dqDgUiOczURscmdwRQnKDe?=
 =?us-ascii?Q?B+qOTRYTUsC7AalrIp+iOSyskb0h+jh46yD0oFmvzbyUQ7gb5BDWiVZHTwut?=
 =?us-ascii?Q?URURGz0BzRdEMvEev5K2P7untWRqscqW38U31eD3Log7dPa6pQZPCRV7eM1f?=
 =?us-ascii?Q?lATw8xBfiQeHMtu70INxqtG5VNAW1LbDc0NSQw/FJx/yPb6nrGFhdUgFnFPr?=
 =?us-ascii?Q?llCFf/CFptI6ROl4CS5uWu9bkV40/qRCccUvMJdjEKAhZZDRuNM5lYC63OAY?=
 =?us-ascii?Q?DpYLXVxYZntxsAzXhowEVeQg5Mi6W99TK4BqUHrCuTG1FjYJtiv6ptm10AlA?=
 =?us-ascii?Q?ZDiWkV+9/pIOds+KxLpBRVrG/V/64LRdhjEid0UD59pfTCTiY9vyihcQoIH5?=
 =?us-ascii?Q?fkrSYLHdY6nAGr2PKbv/XRHFe/rYDaua4TdaNnCjmfbf+zRfgWJ3u5kVGFs+?=
 =?us-ascii?Q?NoAfRQnK+gcyXniiUV43wAhlgRSruQM1ptwDTkevyYFj53mPUJtmhZ/Brc7w?=
 =?us-ascii?Q?wVHW4omG6kKJiPh1nJzJh7sLym65Byx8wbGcvu0wtjRNREQlL/afoAl/wKmd?=
 =?us-ascii?Q?W6vBwxFHPcZndxYckwMEZwHsG0hJV266pFnygwbxaO+McgIbcJbBvzy2OfG4?=
 =?us-ascii?Q?LjC68wYrs0od6UejLyWzVMtgwNzQd5MToy74dj2bKW6P1jcJA5wcc1sKfUUb?=
 =?us-ascii?Q?B5XM/EFQoBrhEGEssDU0T+vkrPub0o15RjzLP8ROsNJr1IlBSWNDuH4CpjxL?=
 =?us-ascii?Q?IE8yCTWUxEjMxVokK4HRLgq91tIxMzwuMx3a+MeFbbnadGo9X0cjiWujkveI?=
 =?us-ascii?Q?k4KtmYR4sdUSuZ5W29kZdE9KTQrDSjM9tIff5E72EJZBSkUVO6zB4gmc4YeH?=
 =?us-ascii?Q?2R/YsSFI9QpMhMVl/0O0WV0o9n/fgAZmoVKJuSDbYVZgZSjpmF26mzVfVrd4?=
 =?us-ascii?Q?WJKxHskHatEE0iOclXVOBDdDqzwXWx25kb6NdBUyRPWkog8HwEHwmg=3D=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 02:03:28.0468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b036c8e-d5ec-4927-2339-08dd91c25a62
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CB.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7210
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_190342_216348_39FE8354 
X-CRM114-Status: GOOD (  10.97  )
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

Add device tree bindings for CIX P1 (Internal name sky1) Arm SoC,
it consists several SoC models like CP8180, CD8180, etc.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Fugang Duan <fugang.duan@cixtech.com>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
 .../devicetree/bindings/arm/cix.yaml          | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/cix.yaml

diff --git a/Documentation/devicetree/bindings/arm/cix.yaml b/Documentation/devicetree/bindings/arm/cix.yaml
new file mode 100644
index 000000000000..114dab4bc4d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/cix.yaml
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/cix.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CIX platforms
+
+maintainers:
+  - Peter Chen <peter.chen@cixtech.com>
+  - Fugang Duan <fugang.duan@cixtech.com>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+
+      - description: Radxa Orion O6
+        items:
+          - const: radxa,orion-o6
+          - const: cix,sky1
+
+additionalProperties: true
+
+...
-- 
2.25.1


