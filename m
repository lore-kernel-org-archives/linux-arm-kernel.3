Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2DFEC1EB0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 13:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8yn+meXZ1ZzWGuMC6MYnWeOTVd5Fd8gpmDfSTBbreVo=; b=MfESxvlwkURr2cPwV0x4Si2yZq
	gc/5KtPCm+UoIa/5QzOtnTyHChnRp3K30ekCxrNKAJ4JFHGriyEtlb1AA98DHLnlho8EDI85qPyMM
	Ad9yjc29mtGHJWmIKlT26+6XZjJ8gVkGhbIHLHdOBy9cg+pUFnaHwpmuBxgZjcZwAIjW7JURV6ezA
	/KbGOX2i1FnXqeygI4ArK5PMx5AsuLNxlMx9t6qbueaLFhCAiHL07z3S2tTPhwyVxVrYif4kcoLxe
	M04zNsxya2efJzVxTRJyYkpCyB/vv8Txq9NwC5BxBrmb27xE5ScAoZzcvWe3K7GCbFhw59UJkfVPe
	Iqy62CkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnz4s-00000009vdg-3h6N;
	Thu, 05 Feb 2026 13:07:22 +0000
Received: from mail-southcentralusazon11011002.outbound.protection.outlook.com ([40.93.194.2] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnz4q-00000009vcw-3cCh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 13:07:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aibgIx86Y5dWuS6oLwDgdtZD1Owy/aze0/xulS2CdmkeY6UjMMjQ2lrpXT6fehyucYib2aJcpRUB9YmJwuKtAfA6RD2Qp8hmPAZjhJKbI8tqRgqem5M+zfhOzUnHL9xPRhCoByhguKAlk9zZG/qvkIjyV4S7GrXGbUR9Lj9WaCjio4ko/tVSbJOog1xYu3nc5u/PYLtYcvKxKD52fvn8QPvPRqSEPMT8WkTFyX8gVYpLz8UUdDiqF5rR+XFHcPAoS/gZUW5ndiSxKewhL46uNPZR29GebcVLp4Ak4UX4xHVPn/TOXJYO89zh23w12QrEHdnBH4sBNy+PkHdM2AatFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8yn+meXZ1ZzWGuMC6MYnWeOTVd5Fd8gpmDfSTBbreVo=;
 b=dA8jwHT+U+zVpATlJ0kCmrZU6uGZpEz8gnqmtBmd8zUIAq+fbwj+PPJWPyIiX5QkH7/KMOR3H28VG0LbJ8UrzhhRx5iH93GfexD4ICW0yZRkMVJfOnXLn3+agN7TftnH/6EECItpjzE55eZgS4b+yRkDm68V9YMAQA4JhhNfKxZvzT2EMs6sbhKv2c5vE1ZfPTxyTJ/0rF+HLXVqGiV+YBIjV+Fa8eOt4SeKr8unH4nXYFj36KByru4W3qYFufr2rZXt5hI8Qqu4eDKc/xlmdMzHJCe3vsHQSrGK3xkCvo1lqGo4IBqQn0j7elwJC01HNb5dyMQzuTvmHbxOyij8oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8yn+meXZ1ZzWGuMC6MYnWeOTVd5Fd8gpmDfSTBbreVo=;
 b=tJ3dkfk9d3C4VGpbxJdetQp3SFbh0N4f/1lkMUCnjW638AAr4myx3kqVm91KF8qlxRfx9H/Wh+o+op5kroVF9b3a9ECzgSm7HFc02SPXzXW1eBjdlw6l2DlQTVzji26imcYACSHFJYPHHlse7dg/mv1q060N76IzP/bYNGt3680=
Received: from SA9P223CA0013.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::18)
 by IA0PR10MB7274.namprd10.prod.outlook.com (2603:10b6:208:40f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 13:07:16 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:806:26:cafe::ff) by SA9P223CA0013.outlook.office365.com
 (2603:10b6:806:26::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Thu,
 5 Feb 2026 13:07:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Thu, 5 Feb 2026 13:07:14 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 07:07:12 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 07:07:12 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Feb 2026 07:07:12 -0600
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [172.24.235.46])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 615D77C33027516;
	Thu, 5 Feb 2026 07:07:08 -0600
From: Moteen Shah <m-shah@ti.com>
To: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <gehariprasath@ti.com>,
	<y-abhilashchandra@ti.com>, <m-shah@ti.com>
Subject: [PATCH v2 1/2] ti,j721e-system-controller.yaml: Allow audio-refclk as clock-controller child
Date: Thu, 5 Feb 2026 18:37:06 +0530
Message-ID: <20260205130707.2033197-1-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|IA0PR10MB7274:EE_
X-MS-Office365-Filtering-Correlation-Id: 662a39c5-62f4-495f-506e-08de64b77b84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?o11P4Iw3g14lDmr7L7dyNztJPLzyXRWMJ4vvU4NMc+xKcT2/4RzkKZu3nx8R?=
 =?us-ascii?Q?SKZxDmsTtVBGFsPaVgyCKOUqVAMMb/49wEazof4gcYh/ppUDcelNOnAMfxn+?=
 =?us-ascii?Q?zGN9JxgumzgWurX7HCzpc4bfRFPS1yn8ALJjkh7fpQ1iPNDlIe+QYFWIirgJ?=
 =?us-ascii?Q?CiaW+8X3Z8+fxURn+ihTSLmfFVCbpWE1ymVcQbHSKjchW2hI/8DfxucTYbZR?=
 =?us-ascii?Q?DzCiEWkKNsi3NxPWgNYbYfzk27sodG1MsCHPKphQgp6ELC7VOYj+EnDOF+i7?=
 =?us-ascii?Q?eUHkeBBUUoSlSVkHaCAypiFy9O4wavZNWwsN4kMwPtn9R/wCTZlYslkkwVJI?=
 =?us-ascii?Q?jWr5/9gkkMfpuqCpciR+Ns9N64rT3VKNUDlWvpNv/MBGmNXuAkDiUPLNFBDa?=
 =?us-ascii?Q?wP+cAk+AF+ZnDxi/FdPPxoiLFci+ohZosuZW24cYQhSG9KDIFruR9YhcU+Pc?=
 =?us-ascii?Q?hn+jYm6QxXYsI4HhgiNvbsfsiJcgqxDKULOafQyzdBUCizXvSGa9B7RIocwr?=
 =?us-ascii?Q?Y4hDTQHiVqOJEQ/XuC6jwr/W0FphJA4BXN5654ahPSCGMMWTRzb2/l62KxSr?=
 =?us-ascii?Q?8nHb5vNxLQwzrg1kO6ahZQWcgH2asP23byM64Mz/TSvf1ivXyt0n9P5+CMZO?=
 =?us-ascii?Q?mv9sUgJP1rmTiiusYsZxo6ZXge4zlIRvMH8aSNCYITgkSBRczMyA00n2Zfsg?=
 =?us-ascii?Q?aZcLaU3Gl5smKE2Ez1xD1aaILoY/d5phFxqJe0dUf0Kfp7XA/fQZItMDBgCr?=
 =?us-ascii?Q?EevExKE9iEoNccXm/QMAen1+76teOPkmrVUrctWwXJgpmDGI8EEoC0ESsiaV?=
 =?us-ascii?Q?Cg2aI/FQWbjsUOq2Um6mBZhSNzGP37liJvEfF9tQDBomus2fQm3F8Dq+vIKH?=
 =?us-ascii?Q?po45CrXZn3C4cBXXjJmX2vTwvYcB9pIDvkvYdPuTGMjfnOfnwMgvoD+89fWJ?=
 =?us-ascii?Q?Jxzv4Aczp1u4+yeAEZKBMHm7aa6f0J0GIU/zGojjVeetXr4QKtnpqSLkCtXI?=
 =?us-ascii?Q?+RXxv2oE89Y5pq1uGqUeblVJomkLQJcp6MqG4jo3pyimX0MopJOOKaIVfBrL?=
 =?us-ascii?Q?sKJSVQ6hmcV8a24joNuLZABli0+pYAt/YW8zeFFfrC72331nN7HKXUcsn76U?=
 =?us-ascii?Q?lAeinqtmTwaawbTap+2pbyTxUlHObZdVbCfiNdJEJJZ0i8Dg/qcdQgupaYuE?=
 =?us-ascii?Q?JsHmqPmmXWDfH3yYatc2bXNWC1SbxXn9/6nk1tZN6J2W3uA/h8pQz05nn1Yj?=
 =?us-ascii?Q?TYAK1CrodeJHUPBVa3PvjygF2t2ByTgVpg4yY3VHuS7j01ybNyueQWxmyM9N?=
 =?us-ascii?Q?xZfNRJBQFudVwFk0Yf6jonYfP5UIi6c2EoMZO25/JNlBAQvqbEHrCYQu02w/?=
 =?us-ascii?Q?wtB0Pcj8jI4KbwJZ0vpQCfNqAYl50ngJbkO0sn4TbyeDRgmUVZ6MvXbhvRZ8?=
 =?us-ascii?Q?4CpKo/PN33oQs3shaEJCk76dg7LfbsIP7RwzyUFLbxAB3WRi1EBM59bsDXAO?=
 =?us-ascii?Q?nmQ2TMJYKRH+6FBscHQaUHtVmv2MXVz7ZHx8C1/Z7pTnWvdR/1kQKc72a24E?=
 =?us-ascii?Q?XdTk2b0iDzB/OVYs8KmU5uLuBKW0n4jMX5bQ5epQmEWQi3sieG3zcb88teU2?=
 =?us-ascii?Q?iayof5d5GAncPYU8mGuxIlPd8qktBl7OZIIWb/4MfM0qmPS9Uj/tVJXvKR8J?=
 =?us-ascii?Q?aByFuw=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: lrisGUROYteEMAD27DIGHoQIHUudnUnU0EZC7bF2xgRFaoFdpkPRpEWWdo6tAnvgM9Cu5uRX7n6/PesteS1ZURkAzWGMCBo+VlrcLqm7kT99Hq6oxcjzEfjHhzj6V1lhF6C8u7YDTLSKRzRM2DeNWxjDCFuhX2xzbmbZ7TF4pL8VSwBVSrVjSOYDUryJpOKUe/XTE55Rqw1madK7LgRPEIUtRCMGQflzV0VgQ3d4eZByqa7royG4wvTEVID1O/GUjTiaxNeTP8YyH8EGYAD6FVi2mwh1TPHxyiKTyuKGq10sBPy7xQfGtSc/u9umje7KovR/IIcJEWM71qgDQcslkmqixfVvKMqWL4c4FlmB/vk625JsHcFbXOmYBfaJYzLbmxwCBR9pVjBFRoL2uBxFfv8gNibBzc/ih5RSuA+ozB2VNLohgQX5kMhkiHGLhdhv
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 13:07:14.5925
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 662a39c5-62f4-495f-506e-08de64b77b84
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7274
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_050720_900479_12B28E3B 
X-CRM114-Status: UNSURE (   7.97  )
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

The ti,j721e-system-controller binding currently only allows
clock-controller@ child nodes to reference the ti,am654-ehrpwm-tbclk
schema. However, the system controller on J721S2 also contains audio
reference clock controllers (ti,am62-audio-refclk) that use the same
clock-controller@XXXX naming pattern.

Hence, extend the clock-controller pattern to accept either ehrpwm-tbclk
or audio-refclk schemas using a oneOf constraint.

Signed-off-by: Moteen Shah <m-shah@ti.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

---
 .../bindings/soc/ti/ti,j721e-system-controller.yaml         | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
index f3bd0be3b279..d5d84a8f1257 100644
--- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
@@ -53,9 +53,11 @@ patternProperties:
 
   "^clock-controller@[0-9a-f]+$":
     type: object
-    $ref: /schemas/clock/ti,am654-ehrpwm-tbclk.yaml#
+    oneOf:
+      - $ref: /schemas/clock/ti,am654-ehrpwm-tbclk.yaml#
+      - $ref: /schemas/clock/ti,am62-audio-refclk.yaml#
     description:
-      Clock provider for TI EHRPWM nodes.
+      Clock provider for TI EHRPWM or Audio Reference Clock nodes.
 
   "phy@[0-9a-f]+$":
     type: object
-- 
2.34.1


