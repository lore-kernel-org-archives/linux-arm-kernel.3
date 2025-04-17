Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56615C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 13:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QfrzKJThfwHn1MDCSW4YI61kPcQvkhcraL8X4f356ys=; b=V3mQESU5ARMUM8U7MIak14JlEo
	ZqZPphkyOmKSfBJhHA3h4m8vqnkfyx7xFQojija3FD7cEhx8dzyBwxP5hOBoz3HH/ubC7IYlcJZhV
	KRLbsWvxhDZVUqSnZG4sTIl4Il9OikCMsTvh+tUwawKbovX+s0gH7iCkFCixmm9L1QWizKeGYN0eK
	mHs+HIjllkm4FkT+96Sta6+2c3ZURp4kDGo13vmJteLiwUgieeTaArHFLRpMyxVTkvTvJnFpoa3uA
	Rng8S5NZdkD7X262NdFb06mSc1q2ATZ+HkGLkBM/2XKz28mzGL9y0W6Mu14cLTEU9qEQ+Q2xMEp36
	Wlvxc99A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Ozh-0000000D5Zq-23Vw;
	Thu, 17 Apr 2025 13:09:29 +0000
Received: from mail-db8eur05on2100.outbound.protection.outlook.com ([40.107.20.100] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Oqt-0000000D465-3Ckd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 13:00:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qLQ0Qq2W781FXxtoxojaGbAb7OSVcPXyFcnN9Daos+o7KKQ4y89bj5ou+YZ9FraE7xhMnPQ4lGAxLeX/OLq+6ekh1LzvOL3cnof6fyWoAuiMVEUpj9t4kgTgjUSdJOUm8x+54XNtLVZ33or7YWj/kegTRME/QZvmwom0sQjyHaz5AmuYx/fQ2AWWoSvY7jWspzimUhB2FHW5Wjf0TDklyyc0YPz0W7W1CAwHjIORdXi8R5ilOdO7ksMk/7CzZQdJH6FGjLN8DikwMmyMaLxazCkPv8oxnydyXaYekWpaiCwqHgmiRWMjrQq0Asx4PV8C/xsdqnUsMOGEWmKgrDJXFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QfrzKJThfwHn1MDCSW4YI61kPcQvkhcraL8X4f356ys=;
 b=PO2bLbIKkk1Byv6ewvxdbaE50h4UVoP3Dfyz5ELZY0eqHwhEvgTdK4rD+CCGf95AO7nYFGXPkwyokYRt9bctGg9fV05CnLp3zI/ibIaFmHUK1D8d6h1BiQUcSyx5H+mlDm4HkCXZaH5n7F9E0OKiZQsdfW1kRpKiCJ+Dx0siw9+Ax/oPRqVoJ0VAOVZDfJ/eqpY4X5/QGyVtoYwTJExrvi26D60STtcdcqTGnWEfoKpDGos3y8p48ydbQZNnMzO895aUvIE8jz61MtH4LucgGoKCl5qV3BzADl0a9UoD6HVyZ+LeLIRs/RWQKeNf1MkdNZzwiys1lHfaSxpP8IX2AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QfrzKJThfwHn1MDCSW4YI61kPcQvkhcraL8X4f356ys=;
 b=aR2vTgLAE8+EI29U7yKIYsY9QNRrRClYDRTqEzpB4S9G8cBUUoOPofT/c7VZ3GYIlA8GfWqKq7zj6XuFhm0o7DRo7XRgOo7tkgf/Co5sq4QNRocFZBNZY/kGfecRXERS9mu+9PBT39U2/saHPPR/s2/TXsXhPSEoucHGQGHqlmZp7B10FK4eWYqDo4kEmnKEhlA5p8bkNiBb+tl0Z0q1esxmuOQHAPfPhjZZmJnje9zFVWxY07ZWSO7KVnHEntDOKXOFi8Cz5Gw5ElrbGlHB3Z3cG4+GWmUPxau1FWOBOlq4rIQZ5dcp6DRyhHEALu9rGN/VjuTUzYkBXFJGIBV1Mg==
Received: from AS4PR10CA0009.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5dc::12)
 by AS8P195MB2164.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5c3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Thu, 17 Apr
 2025 13:00:16 +0000
Received: from AMS0EPF00000197.eurprd05.prod.outlook.com
 (2603:10a6:20b:5dc:cafe::cd) by AS4PR10CA0009.outlook.office365.com
 (2603:10a6:20b:5dc::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.22 via Frontend Transport; Thu,
 17 Apr 2025 13:00:16 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AMS0EPF00000197.mail.protection.outlook.com (10.167.16.219) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 13:00:15 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 17 Apr
 2025 15:00:15 +0200
Received: from lws-haller.phytec.de (172.25.32.139) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 17 Apr
 2025 15:00:15 +0200
From: Dominik Haller <d.haller@phytec.de>
To: <robh@kernel.org>, <kristo@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <vigneshr@ti.com>, <nm@ti.com>, <m-chawdhry@ti.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<upstream@lists.phytec.de>
Subject: [PATCH v3 1/3] dt-bindings: arm: ti: Add bindings for PHYTEC AM68x based hardware
Date: Thu, 17 Apr 2025 14:59:19 +0200
Message-ID: <20250417125921.100580-1-d.haller@phytec.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.32.139]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000197:EE_|AS8P195MB2164:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c666cb4-ea84-42d1-d752-08dd7dafcc81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?t50E2vk5ZYqTBxaGU3gw854tJcKSsnFU3NqwWxoQUukZ3707ctxZ2sNv389Z?=
 =?us-ascii?Q?aSY9DSTesYJQzEMBdN4p/6nq1u7VXv9k4QmDE9HFe9geNXmtphvEzYdxhDUf?=
 =?us-ascii?Q?o9UbN/So7v+rSL5/kPvNUrcYSrkEjUQWVz7eLz1MIdfHBAjfFYRnGOnwQ2e1?=
 =?us-ascii?Q?N9xZ99zCFneSNwj0zivt3Nj2UztTWbAtdYRWwJuI1z34Jt8/LUwUqcY70NfS?=
 =?us-ascii?Q?rI8Obh8CTMrTK9hDRvvCeWSaCm/c3pqLY1IyJ8+J1JDtofnPiw5h0YOtzYKn?=
 =?us-ascii?Q?3a/2/WRPE35Zhm0bsiYipPi0/e+4qq0uzV6R4ybo1SKGqRsVTYQt4CX3iyQk?=
 =?us-ascii?Q?f4esu5HgLttOwqVSFkIxennHSAnFHH+KKmtN/hlLorvnHK4xgWtBy433QwEl?=
 =?us-ascii?Q?qE9JNaZ5agDOK667vDO8YFvo/+9udDDAik1IrAM1e21d5PUcAvmjt8GH19Ak?=
 =?us-ascii?Q?cDoLVPKuqrwmTtnXFaqeWHjiuTIeKUL+JgOvWhLodbiA4DtJd+V7DvSCZwii?=
 =?us-ascii?Q?J6oarQ1KdD8Bw2pJE9mrcMCna8TmTVycZCpAu41lfoRSjdoLvXyFj4jGW3nm?=
 =?us-ascii?Q?exG3kk0BI3iqYXBZ5+3Ek6JJb2plv7g0irrHoXKcX//vbQ/tLxgDPVZN2peu?=
 =?us-ascii?Q?TRC83Rpsk4OudkGNVHLGz63zIDqaKqbomWObxukqkufyA093QB/xCB5NjxcN?=
 =?us-ascii?Q?qffizuw62QvPOGmXPH4ZSZ1T7EfqOxrmsrjcVjJPL0cu7gRHJ9EBDH0VEfNQ?=
 =?us-ascii?Q?al8LFALdekT6mfMoteBgRMLh84eAjNZ09RfQT8jiVs9ngLX2niNykTIoY9El?=
 =?us-ascii?Q?niYTcCs+ZWjpuu9e+gMTeB3N+lTy0gKvajTac6c/2RSgOWRbBw9X5oNNPRS1?=
 =?us-ascii?Q?b4MaxXSKtWjcRE0sZqGg27FiRN1LBsErw6RhZz5KziDZmWgOKOir8MR5dQqV?=
 =?us-ascii?Q?XMksaeAj2J+AeMedje2FAIYWxdiDx9O1wHUFIZ92lb4p+LlCJNHBJ4IlZoUk?=
 =?us-ascii?Q?pRpv25MadZbJMrFEiZHCmofnTy3Y+pAAh2oaY2ug3NwwUQOH9TZ9RAcdXe5z?=
 =?us-ascii?Q?D4wlNRJ/qnRTonL0+O+3uKHV/pPPBXOEjiphVjOijV+R0FPvnzjrcHLzm0bl?=
 =?us-ascii?Q?fYEifhB7X4TjBPFxw3H5D9+n8/is4auaELO2Vtwyaxz2ZziWOiwyLdfMr8g5?=
 =?us-ascii?Q?Jgdyb/upsq/tmNfrfda3oOkAUFABRe8SmWbCqZ3bLTOixMSU3TsikAVHla2Z?=
 =?us-ascii?Q?5tYv6ApoUFC6avxK7GqIS7HeNLn/BZG2rhzMIfD5sQffLQWY4vo0n6X/zlGk?=
 =?us-ascii?Q?0hCKTsNBRR8esXhAiLLmqhTvmlesVq0LmbjemV6MNDWpIB9iFVrNWUdgMrSA?=
 =?us-ascii?Q?U38n8+oxnZKCd6Ok2kdrLj0MYwBB8T8zryKOz1p/UESRLwTlmC50IylPh0BE?=
 =?us-ascii?Q?rKnyPi9RwkO/gLWrup30BUiRP82GKCbQDtkoahJil0LPREgvDtr2k0iRl3HK?=
 =?us-ascii?Q?jxYKyxCFY4JNBJCw6o7mVDdhqr2fcYprE019?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 13:00:15.9976
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c666cb4-ea84-42d1-d752-08dd7dafcc81
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000197.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P195MB2164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_060024_094905_8ED87395 
X-CRM114-Status: UNSURE (   7.42  )
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

Add devicetree bindings for the AM68x based phyCORE-AM68x/TDA4x SoM
and the phyBOARD-Izar carrier board.

Signed-off-by: Dominik Haller <d.haller@phytec.de>
---

Notes:
    Changes in v3:
    - reorganized compatibles into their own entry
    
    Changes in v2:
    - no changes

 Documentation/devicetree/bindings/arm/ti/k3.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 18f155cd06c8..30631daf9a84 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -139,6 +139,13 @@ properties:
               - ti,j721s2-evm
           - const: ti,j721s2
 
+      - description: K3 J721s2 SoC Phytec SoM based boards
+        items:
+          - enum:
+              - phytec,am68-phyboard-izar
+          - const: phytec,am68-phycore-som
+          - const: ti,j721s2
+
       - description: K3 J722S SoC and Boards
         items:
           - enum:
-- 
2.43.0


