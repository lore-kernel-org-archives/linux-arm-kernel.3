Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0F4CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 13:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DPOkf2Z1yJrHEk4dyUUDc+c489fyDR3ZN2dKspwuuPY=; b=T6Y6gIwKaTGyyZvb2/yW5Iulu5
	S6GN5UBA51dqZEnVJVh3oPkjJB/YppyaOAmJYHZcRwdWBbot4+ACITxFXKSNKnW/WQhEj00RszSod
	oU4QcGsVjDTdF5iGFZU0HijRnYZJW/ch1gThtgRCDW6PaEeGAu/huM1x4nsb3GZB7klc8Sfp8xjw2
	is9h0s/aW8eJq8tpKW4J20kzuvpsNJEYtAFDkCiIi2vPEF+uBBOfzWNVkmxJHwlU7GBcetDoEy3pM
	0Czyj0toQZOYd5wFs0WYgbhW6yNfS5CBKPZ4HGyJTUTNcirzTCcQ8ssuA8N9mq1RE5NAY8E1RZ2cW
	g4o7A3Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0Kb-0000000FcfB-02zC;
	Thu, 06 Nov 2025 13:47:17 +0000
Received: from mail-centralusazhn15011023.outbound.protection.outlook.com ([52.102.139.23] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0KW-0000000Fcdb-1V8j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 13:47:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=obPqgQ+xb7bkMZ6kcbQyNTvsgRGIcxYO96liROm/j6cw6q9XbmOaVMrQ/4xNDXw8gFNY85QGYxmVkOjXleA8p1IevyGP6dpMrwpz13+V9Otce/f/zbfVctyYGCLa2TLrp3vZjgDBLgO6NY+1slq/+UiUIEc4TFr63+dtCn/HkdnEpAu02Vry98Qxr6OeptL+m823vL7OqNsTUaD5o5gwtYfdBCdUoLEvQThLrmwY2A54uMi21B6MjNfCqXvS9KzTJS9b+vTpCotPF2F4r4PxsHVPub8xlshYUHemtKUFCEU/NUgCZMCL6QgGK4iadVkkAaHTCeM4cZfVDZC5ud/gVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPOkf2Z1yJrHEk4dyUUDc+c489fyDR3ZN2dKspwuuPY=;
 b=yL6VDDKQeN3UU1jQjcKIl/1NoiUmJywNWOOoUQSC5wJMXNFoMPQ63T2nbDCWWxUEQ1HZAYtFJF2FlGfdK1NEpvyc2Bm7OtAKG4EzVeRFvzd9FNBxnG5SJQYqSOT8sUHQlXvsLXbt2rCQ9lwgeAWVyCvDCO30xXPEZP6vfsMT4pNQBQXrVlawye6OgSI6N8pknsJTwQRU4rXY8BmO6Rrs7QDxzMoDgVkBB8Pu/cLeH/7+ipOJRMBYeFkk2pH73feZF7Od+XDY1e4snpo7lsVZD/pRyGKXyxeIH6u8YmVPp48/++reGEuP+PluFJfUgIlc/0I7blrwnxkapcr9oQUcrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPOkf2Z1yJrHEk4dyUUDc+c489fyDR3ZN2dKspwuuPY=;
 b=Ix9Yy/a0FCc/WH8ID0ntenOSPxcA1Ir/dV5sA03Q5v5UJfI+C296IGxJxQ/L6PPSvYOFmPiIesZpXJM2wsMesUbmBTTr3LSDcWoZiNRTbXZaJLPRj7WHIswj4jynWBVqqigIHHFZZyVb+OyJVL0a+jUtn1jhSRlnN9jhRc0Sw8M=
Received: from CH0PR04CA0010.namprd04.prod.outlook.com (2603:10b6:610:76::15)
 by DM6PR10MB4122.namprd10.prod.outlook.com (2603:10b6:5:221::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 13:47:08 +0000
Received: from CH3PEPF0000000C.namprd04.prod.outlook.com
 (2603:10b6:610:76:cafe::1b) by CH0PR04CA0010.outlook.office365.com
 (2603:10b6:610:76::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Thu, 6
 Nov 2025 13:46:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH3PEPF0000000C.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Thu, 6 Nov 2025 13:47:07 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 07:47:05 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 07:47:04 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 6 Nov 2025 07:47:04 -0600
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A6DkqDY1301720;
	Thu, 6 Nov 2025 07:46:59 -0600
From: Swamil Jain <s-jain1@ti.com>
To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>, <nm@ti.com>,
	<vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <lee@kernel.org>,
	<louis.chauvet@bootlin.com>, <aradhya.bhatia@linux.dev>
CC: <devarsht@ti.com>, <praneeth@ti.com>, <h-shenoy@ti.com>,
	<dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/5] dt-bindings: display: ti,am65x-dss: Add clk property for data edge synchronization
Date: Thu, 6 Nov 2025 19:16:48 +0530
Message-ID: <20251106134652.883148-2-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251106134652.883148-1-s-jain1@ti.com>
References: <20251106134652.883148-1-s-jain1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000C:EE_|DM6PR10MB4122:EE_
X-MS-Office365-Filtering-Correlation-Id: 33984d1a-a850-40e1-0c88-08de1d3afa69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|34020700016|82310400026|921020|12100799066;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2RQHSq/l7eXIEskRInwrl/UHAAnzT6a7dpANEtlnv2kyno5HCXNRbkeqKLiF?=
 =?us-ascii?Q?fBU6j6bqnmF180mAgad7WNdCvkte0DHfp4mzgNDHLijAOMwtN9YvnLcv69rh?=
 =?us-ascii?Q?6+BkKoMjB756LgKsgyPAHBY9SMPhGSs0ijAb1POa7TIhRrKGbVR/xNMdmynI?=
 =?us-ascii?Q?1Ic78h1MNV+h6RK5CxWZvUbm/x4Vumk6M6XlI6flAmMIbPjVW7BMmEn2ieEK?=
 =?us-ascii?Q?GkExLJz+ALpN+lfz879bcRZWr718IjF2b0ZDcFuNkz1M23CDuWEqMRt8pl4m?=
 =?us-ascii?Q?hnWr/iqqTT72mM9N0pC8NMaFnS18WzijqVXfvkYXS+AIXLJUmUyFbM4FuZi0?=
 =?us-ascii?Q?8Ua2GF/Gkr13qzkqqI7SEso+WDiOyflumKFOxbcQaBePw50g7whd/SJ9pXDT?=
 =?us-ascii?Q?rT+fGVghHqjO1GuIwOFOqayqD8R6xu3PUFNlZwSDoCSvIxEfcjkQfHyyGUUp?=
 =?us-ascii?Q?UIi3/iml2y/zZ+Sb52bDxdB6e+5hDE/aUnNM0c6SvG0T6wZw41vtYQw09Yue?=
 =?us-ascii?Q?DEBsOkt7RCpp37ijXauRExHIam8HRUeC66pwo8usdRyJX6YgiqEzbuTQUG4a?=
 =?us-ascii?Q?nXo/t2hWYWSFG9N/j9iaV5ms9LujhFCmjqtvUis1aD6+GunTE9ks1Gd6spSW?=
 =?us-ascii?Q?axaDo1JsV8i5cbsuxt8Z+54aveVnOxXaDYRrEMU2hxvYPFpPWSYZby67Fs4/?=
 =?us-ascii?Q?FBHyIzkFBDvoR91eDPrQryUkhDJDbPYQquD5Te2M5bWs44KggbNTeJms8GL7?=
 =?us-ascii?Q?29pb8JSG7zxKX30Svd9MLjKGzgKEu3csOiY4QZ04DRRhCg46+OwD4mfBbFPd?=
 =?us-ascii?Q?YHx7XZj0RARTkM4ie/Ti+REVQQgjbMuj+54S98XdbhOxN01G8qWPymWtkROM?=
 =?us-ascii?Q?O9T+lIKIH8oiOxFyryoa+GelbsAWi4rHWR20T/OtXmVKWwm3IVdkwv6FAQ8P?=
 =?us-ascii?Q?+pGQ4qj7b5BFIHaw2gYwZkPEoIDlQip6TTuBInqlAKYn8VWLNaHVJ/v3dfca?=
 =?us-ascii?Q?hRNnHPLfY9RJRNX29JpRv2dcc25VKaVf4NpSS+aPzrleUA9lkBzFAEhF6Km2?=
 =?us-ascii?Q?nLy6aCTB60nVIN39/v3bCzNqLufW6ojR9UxqtK8TvbqNelX8a1OjTTcvb2/t?=
 =?us-ascii?Q?xI9fmgm2qMvG0Oq/udmhj0otpWwLrL0kKissat+duSrbbK+7ks/BTIhLPo41?=
 =?us-ascii?Q?88wZ1Zcvmk2NjQ06AuVoV0Xibq6/CxtjCgdmB5zJhB92yBBxescQRm4VRL4o?=
 =?us-ascii?Q?DLsZ/PTtivmKojnckuGQg/ZsK2MdhMIxctXEM1XLM624aj+VFD0LNUUJiKhi?=
 =?us-ascii?Q?+RUwstam4SbpM60+SaQmmobszbuzWaXnB2g6LdUqhVzLHkLLGjgTqkwpBbfa?=
 =?us-ascii?Q?XvrJqzJ7C28SW11Ae/BEHXT8S0W1spfhn2NF4h8+AlybVg6cnZl0iMRKClIs?=
 =?us-ascii?Q?53DneeRYG+zoGh8OOBfatp3FHHSCJ/gCfMrPcOiV4H0radxgjuMsQmkSP/Zo?=
 =?us-ascii?Q?G8DA+yCy8UseQL8cuogjaUa8QzfUnkJL3KWsqcxJrUC6XvCs+th317AEF1Sq?=
 =?us-ascii?Q?kdcd0ty4xRRUpNXAwpiinwE26Bn0dfnCr0c61LRr?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(34020700016)(82310400026)(921020)(12100799066);DIR:OUT;SFP:1501;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 13:47:07.9237
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33984d1a-a850-40e1-0c88-08de1d3afa69
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_054712_405389_95280AF0 
X-CRM114-Status: GOOD (  10.46  )
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

From: Louis Chauvet <louis.chauvet@bootlin.com>

The dt-bindings for the display, specifically ti,am65x-dss, need to
include a clock property for data edge synchronization. The current
implementation does not correctly apply the data edge sampling property.

To address this, synchronization of writes to two different registers is
required: one in the TIDSS IP (which is already described in the tidss
node) and one is in the Memory Mapped Control Register Modules.

As the Memory Mapped Control Register Modules is located in a different
IP, we need to use a phandle to write values in its registers.

Fixes: ad2ac9dc9426 ("drm/tidss: Add support for AM625 DSS")
Fixes: 5cc5ea7b6d7b ("drm/tidss: Add support for AM62A7 DSS")
Cc: stable@vger.kernel.org
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
 .../devicetree/bindings/display/ti/ti,am65x-dss.yaml        | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
index 361e9cae6896..b9a373b56917 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
@@ -133,6 +133,12 @@ properties:
       and OLDI_CLK_IO_CTRL registers. This property is needed for OLDI
       interface to work.
 
+  ti,clk-ctrl:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to syscon device node mapping CFG0_CLK_CTRL registers.
+      This property is needed for proper data sampling edge.
+
   max-memory-bandwidth:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:

