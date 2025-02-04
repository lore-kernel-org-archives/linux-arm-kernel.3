Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13EB6C02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 08:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xN9QLASCZXYE/Y5zBNkrQ9yaLmNsjlSqzhjbBmJGoBc=; b=c0asqyXVP5aM1WH8M7R8L6mbDs
	JkgN2NA8aA9PI/fvvXm70BKxjx2zcTgeWq34CI8t7h+74eDeGREhlWYFWhDXLCxouH5i7U3myjSxh
	Jx7xjmyA5Lb9hSKWIfQXNoPIuuk9JfZtAvqifueBMe3lu20INpzxzy4n0DK+99MdetG5c1ev64Wml
	t9Q9vIrZB/qX4MfoakY3q5bve53jZh38skSFwGDEg3P8oLJ7ER/p9fdfe30y3eqk7+Rv00gtJelQi
	t+D9TVzXZ9mOSJCP0+iuwUa0AtRHqiXkjjCGMVvknUyfRu3BxIdhtKMe4Y7OuxO8M75yBS044ZrIk
	eJxC0kxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfENE-0000000HXO9-0OaB;
	Tue, 04 Feb 2025 08:33:36 +0000
Received: from mail-co1nam11on2060d.outbound.protection.outlook.com ([2a01:111:f403:2416::60d] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfEKa-0000000HX8c-1NMB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 08:30:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p07ZBLvpgkcwgnbvIkBNB9XGW176MF1TbrthbiHWUadNK6rih+UnObrRG1b+FQ1VOIZYFR/S7qINqvAV+QlX2Ahk8hcZpUtDJT04rvPzOTk3Wl/UIjwf4OmAOM7SstOUZZ/TaHFu6iOmfF+g509sNzg98hJknwadWmvm2RygWA+l3WHnZKDUOE/3CcoKc5FWg+0+44T4wXVMtkcPhhzCyjCd8P24aSmgkRPJevgyw/YbVhD9WA310ix2mBI629QgF0HKK0hnMqxHCo5wUfvd9B5UTmCPtC6NCtpV/BXpUoLzcRBxWvL2VSQDYJYYEV1ehqO8BMrdpPztbwl2RuO7pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xN9QLASCZXYE/Y5zBNkrQ9yaLmNsjlSqzhjbBmJGoBc=;
 b=SbRcrGEi3P3Jh1HOmtMkdiYhjnIEQbbc5/yR4dyTCRHF6K4ssxJEZL35LuB8RvZefbeDDzeg92LjwpxYkVNuITRdx1BDrHzi59KVhRHrPnRFc4TYJOpbTdCoqz6U8KjEWhyFl00KHflCxaahEAFlBRvSPW13RCtDohGhA2Sh28V58zx3nqTvUDzUpeOLCUMv91R2ACFnHtVGfwa8R9Y+PB0yGtSK4mzlFBSTsdJOqm+2sPW8bXRimgC+96q3/F66TjPAZ/VrIy5gVIY6q7T/Spd/XYili7BA6im1sCVndfEXxVnE/81Rywcl0LOFJh9ihJhnv0rAMy7JZbCJ1z/zHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xN9QLASCZXYE/Y5zBNkrQ9yaLmNsjlSqzhjbBmJGoBc=;
 b=v5iTwyx4zPLbla4PjVpFihDsN7IGGyqXshcel42RyqkRcnRbf4piDdl4seI1HIJH1dI7eQ8W/0yrCgfsftXN4YdHMiUEV/zrpn3NYeug2O4T47Le2Buz3owOM5a7Irlzo/llrlBr8JkRb2vFMVK1Ax4KThnojyBsLY85T8zzK88=
Received: from SN7PR04CA0172.namprd04.prod.outlook.com (2603:10b6:806:125::27)
 by SJ0PR12MB7036.namprd12.prod.outlook.com (2603:10b6:a03:483::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 08:30:47 +0000
Received: from SA2PEPF00003AEB.namprd02.prod.outlook.com
 (2603:10b6:806:125:cafe::6c) by SN7PR04CA0172.outlook.office365.com
 (2603:10b6:806:125::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.21 via Frontend Transport; Tue,
 4 Feb 2025 08:30:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AEB.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Tue, 4 Feb 2025 08:30:45 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Feb
 2025 02:30:43 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@xilinx.com>, <git@xilinx.com>
CC: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Conor Dooley
	<conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring
	<robh@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/ZYNQ
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 1/2] dt-bindings: soc: Add new VN-X board description based on Versal NET
Date: Tue, 4 Feb 2025 09:30:32 +0100
Message-ID: <6e4486141cf9b1d36b03624cc73621b2e3bba894.1738657826.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738657826.git.michal.simek@amd.com>
References: <cover.1738657826.git.michal.simek@amd.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1590; i=michal.simek@amd.com; h=from:subject:message-id; bh=b+WF/LFiKMQZmWaPqZLkpraISTMHQshaDU4vPyr+EzQ=; b=owGbwMvMwCR4yjP1tKYXjyLjabUkhvSFF3RKpQWmn1h2t3zR72eVHpML4jXOund+Lc+Wvn+0n LN51/onHbEsDIJMDLJiiizSNlfO7K2cMUX44mE5mDmsTCBDGLg4BWAit04yzI/+n3/iQUb4/07G ks9/+arYHJ3cfjIsaFp8qHX/nr+vrS1LZ50uLYuMve2+EgA=
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEB:EE_|SJ0PR12MB7036:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ba61cb0-a031-4f5f-520f-08dd44f638a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?o7bUzpWkhjOYbozOnkg/SYwcueYH2mKqKmwIXXxZ3qmEnB9Yy7IxoSE4VWKH?=
 =?us-ascii?Q?ITfQ3yixUthLSjyuKZVkpIv1ZwYQg8h7Bpq/R+R0REbhE1I0s2SItAcEO2Id?=
 =?us-ascii?Q?HogTedEswdn6JUonqDzO3lIr1KLnS4dLwRK4wgziDubeAorr0z5GXQANciC0?=
 =?us-ascii?Q?H/hFLA2pggrG+lpPe8CBzUeusRKXcowFx2VsMdOAkVcABv3F92cbAMmoHhhd?=
 =?us-ascii?Q?OSkB42fDXTz85WWHYjr5dMLYxs0fhmgFQ8LQUzGglCkA/Mh4NQxhV0HCt/gk?=
 =?us-ascii?Q?3uwoG1FDROkaJ+7UK8ddEH2RaEE0U1MSz8u/fWrQBdHRAjBDYyKpkvpLwnZj?=
 =?us-ascii?Q?ioraA/2b/3011oo92+89daOOqNZ6abSUDwDrQl6D9GM+aKDoc9dADTcNNtmF?=
 =?us-ascii?Q?avviuxeIg9tj7r+s39p88sREl0B1EduW942HIaAgubyiWN/yLjnqDdAMHhD0?=
 =?us-ascii?Q?mcuqRuD3o66AhIrYMBcyKMrYg6cx4fMtEsVk6zDQ5V/05NRlpfyLxzh5/DT1?=
 =?us-ascii?Q?/Jgix5XQPc/FIA/t24JyrkHUmRw9z3XatI7yiZoiCLew1CprDdyo8YbrbWiY?=
 =?us-ascii?Q?YadgFhRyXcu6JjV34nvvaEsnCAFahWxPzKWjpB8PBZz5nS4yZz8LoHESu9rF?=
 =?us-ascii?Q?GAVK+dqGvcwfKCDHMF73T1O2F3Ew6Dt7Ibw3JnPceELovRioKdhrhwcnX5AI?=
 =?us-ascii?Q?9z/nSxcBzwfIr7886UXEQSVQr7dWzpyyVIj/bY9CgnGJ961umHS9h9XxAPLm?=
 =?us-ascii?Q?0L9PqpX1CTALNoOLpBTR+mEoM0zXISMu2M4nr6Ab7OWoJ0TfDpxsnN+IdCLY?=
 =?us-ascii?Q?/qa63b3Kp8HMkrQlSvY9xl8LBISPF62lMlN2nDQbvvrNXFmgshEW/B21UWzj?=
 =?us-ascii?Q?GFyZHqwpxhzH0GELHXUrImBlkWB9vmEVE3OM0nzaCY8mqsLJJkLY8Vxnd4Tq?=
 =?us-ascii?Q?1MYfCY9KFM9cm1dE+B6iGo+Kdzwf1WKPusDMHf6t1rbwT+GLgi7c/Bu3P1ic?=
 =?us-ascii?Q?bae8IfERAAMwrfTkcMNLfz5k1AnPtMsBhpaUjXD4jwXpehjHs+F71jHfl0ko?=
 =?us-ascii?Q?plwkt2IzOvcpRCUDwM6+UHOUZgoHobvoSfIbqWWGIA9IOk2HcnA/8tgDWBWc?=
 =?us-ascii?Q?sfgPHSVi5HuA7VMaxPKYLJDfw7b/d/RHA8Em7SjgR36ctQGmtMvIP3zbNwAl?=
 =?us-ascii?Q?muqBp364WH1YQhwbUlj3783u7LXHKzQ+H2IaYVW9B+7FpLxL+5571TjY24Nl?=
 =?us-ascii?Q?Ocbe170+IYkkQHCW48i008AynxCR5nWZgmtyv4EjumG8EAUshyf+5Wy1ZjHT?=
 =?us-ascii?Q?CMfXAomhNrY4Z4v6+MXaidR2mUGGoVOQnDhp2R7uz6WxpY3kLNmBWnsbDQ9b?=
 =?us-ascii?Q?5KVgXjGSD1r9keLv5G9sAAmoFg9RyN4q8Mej9xbAO2LwM9xGfKoQQPe9gDF5?=
 =?us-ascii?Q?IAc9TU3cXMAwVn1C9S2XvLQZ5w/FTzkD+OspPkczxg3qIXO/BHMksSGX3DbM?=
 =?us-ascii?Q?VrZNbhRLyT42j0Y=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 08:30:45.8674
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ba61cb0-a031-4f5f-520f-08dd44f638a7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AEB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_003052_368727_31E99C58 
X-CRM114-Status: GOOD (  11.98  )
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

From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

The Versal NET (Networked Adaptive Compute Acceleration Platform) from
AMD/Xilinx is a next-generation adaptive platform designed for high
performance computing, networking, and AI acceleration. It is part of the
Versal ACAP (Adaptive Compute Acceleration Platform) family.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Signed-off-by: Michal Simek <michal.simek@amd.com>
---

Changes in v2:
- Remove | from description
- Change description
- Update subject to match VN-X
- Add description for VN-X

 .../devicetree/bindings/soc/xilinx/xilinx.yaml        | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
index 131aba5ed9f4..fb5c39c79d28 100644
--- a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
+++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
@@ -9,8 +9,8 @@ title: Xilinx Zynq Platforms
 maintainers:
   - Michal Simek <michal.simek@amd.com>
 
-description: |
-  Xilinx boards with Zynq-7000 SOC or Zynq UltraScale+ MPSoC
+description:
+  AMD/Xilinx boards with ARM 32/64bits cores
 
 properties:
   $nodename:
@@ -187,6 +187,13 @@ properties:
           - const: qemu,mbv
           - const: amd,mbv
 
+      - description: Xilinx Versal NET VN-X revA platform
+        items:
+          enum:
+            - xlnx,versal-net-vnx-revA
+            - xlnx,versal-net-vnx
+            - xlnx,versal-net
+
 additionalProperties: true
 
 ...
-- 
2.43.0


