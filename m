Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F000C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 13:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DmKZqDOTLERnHhUhJYE5kSfVUTTRvfEt4LvUxR4ysO4=; b=f02TgS71WH8uXxX9DE7CeAVutW
	5QkwlL0QSlgUxDtB1TSblu5r/vNfdATVDyR42ePZqVN6oN9ddS+cm0Hm246vur9+rhUtjoM5NI/Ux
	WSeg1Drmg2p9D/iovezUKAvCXq3XN0JeEWjbt5flZ7QA/JLdOL7kUsHqSs303soggXPosInaKZ2AS
	AAGk7MLNN3MtgwM5x89WOG8zwkeQUq0ipXF/fgrsgFqd4DBOwpRZWBKFLz/SNp/o6DcrvRxb0bOTi
	KQmdWaioJ7dLHf5vEKN07sEn1WKMRoNObA4reahL0C0qcbRRGe/+3VRJ0IGe1b5wvkHO+uGzn+drl
	Rg501wZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7aaE-0000000Ak7Z-1Q9F;
	Wed, 23 Apr 2025 13:56:14 +0000
Received: from mail-am6eur05on2072e.outbound.protection.outlook.com ([2a01:111:f403:2612::72e] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7aHY-0000000Ad0V-1MHw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 13:36:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bvsizmBoKhO/+RhYxJxBMeMDZR4QNcL6nwwhybnXJatDMC/50Lq0Ck5gD7KEP9BBZ2qjWlFsTas7aEMTpyvPGq254XYqqDJr9x5zwG5XplhyqZbWsg8W0p15Bkq08VjO4q5SvOrlGnVagBY97HNA1ynXQFdpTbxSw8JvzyPu7pk/hhfH5urLRqEPKU6czF5uBkajhJxuVFqzPyHSw+E3zW1YCJuIUglGseuHqKrv047mNdU/HnuSCnqzxTKNGdXNdM7JBb01qQIVTYVFZrFjdMV7Kzy7EGJd7neW9kH1Bed23h/AmZwApsiwWPV6blEbTYtscPFaf2/XtplApymFLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DmKZqDOTLERnHhUhJYE5kSfVUTTRvfEt4LvUxR4ysO4=;
 b=Yo9AnCMsUoQgVPMijGolDzci5yKHRxE9MxDakdBwqxWM+BWwQQhYf7IPePRwCgEypxNi029R0m/B0zlIDD36rEtPegjtY2nfKC3cw0FTUMQvTVkqdBPvsy2ONp7ANIKRd1hcJ1oDK3GV+1zd+PUzdtd9VEWx0bnfniRvzccIAN+cNGtGTz7ouXTrTqRRkjZTqEm+0hG6gcUZFRLY1nIoFWsE6lpZABrhGJP8X2AQ/XqUR6xaj2NiyySKBUYcVNDcI62cK7tHrLVOwi5lzX2yzQHVeTEAzVhBew3tQ4Tn80RNqRLY5Lcm6MsS1FXfv0MhS8hY1Ybtagf1ZrxIBGFsAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DmKZqDOTLERnHhUhJYE5kSfVUTTRvfEt4LvUxR4ysO4=;
 b=qu0yaedGYMu+HgPIMZ3OLBBEfV4j0/zF2t+dG9anFwGyDDE42qQEg323YlfhkhG7PmOGVNndRiiObXO/W9QSNoqgG8xJAMERsJY2MdpZJhu01ICn3HXGrTXak9Au7cvHvZt9G6EFeLsxfkSpEltVmSllBqFtc3TaagZF4FhKq/c/ssBp3M5RlmSUHMzhdPpd5AdEthYUJbtn2Yw9/2ViEaFmqfEAXeK1ZyMX7d3hC8pufcVtvPrGnt4Hk995eDoHTSJUYVD2XjBiBadqMYOTZM317Yls3uX85yuT1K7/oN4V1+bET7S3otq5SdXGDcPtIvYs//iOX9gVn4zCttPOfg==
Received: from DU2PR04CA0179.eurprd04.prod.outlook.com (2603:10a6:10:2b0::34)
 by PR3P195MB0508.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:24::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 13:36:49 +0000
Received: from DB1PEPF00050A01.eurprd03.prod.outlook.com
 (2603:10a6:10:2b0:cafe::bc) by DU2PR04CA0179.outlook.office365.com
 (2603:10a6:10:2b0::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Wed,
 23 Apr 2025 13:36:49 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB1PEPF00050A01.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Wed, 23 Apr 2025 13:36:48 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 23 Apr
 2025 15:36:48 +0200
Received: from lws-haller.phytec.de (172.25.32.139) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 23 Apr
 2025 15:36:48 +0200
From: Dominik Haller <d.haller@phytec.de>
To: <robh@kernel.org>, <kristo@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <vigneshr@ti.com>, <nm@ti.com>, <m-chawdhry@ti.com>,
	<w.egorov@phytec.de>, <u-kumar1@ti.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<upstream@lists.phytec.de>
Subject: [PATCH v4 1/3] dt-bindings: arm: ti: Add bindings for PHYTEC AM68x based hardware
Date: Wed, 23 Apr 2025 15:36:33 +0200
Message-ID: <20250423133635.29897-1-d.haller@phytec.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.32.139]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A01:EE_|PR3P195MB0508:EE_
X-MS-Office365-Filtering-Correlation-Id: 473f712d-46cf-4fa1-5601-08dd826be616
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4cGH3wNHldErUDQuHigASr48JJgp/F0EmIHcNFDyclcbc/oNtLTlUKaCjhVO?=
 =?us-ascii?Q?rO79NBHNHAbdA5TQISHwVLLzRV6iDRpZCrGdyG18tzhT2Kcujz1luB+0vXnV?=
 =?us-ascii?Q?UEHvMQRut5vdW01mN/NG1dLziNXrdBI+vSHskJlVaNl8CE5nAQPaZrtBtfQa?=
 =?us-ascii?Q?aAwMXjrpvP/bAvaEmI+xWXemPin/72zB/IHsa5aj/pEInrnfT9MwLBVczAcK?=
 =?us-ascii?Q?aDP6ZwS5O5ufYkZpxPPExWmz0Z7m98VW93IVgluiFB19Br9YVEK2WYNRHiYq?=
 =?us-ascii?Q?jvmu+f8EHRvMki+a/bGTUN9EWZuxQ/I161twmxafttGLPySJ3kfN0l7QTccw?=
 =?us-ascii?Q?sC8lTeYOSX3UM0QoR3Wx0ldqFixpDukyoLJiyp7NVLkrM/tUK/Kk3/yVsUh2?=
 =?us-ascii?Q?IZTiYCSdBhYVXxVTrLFPDfEU1YF+gbsicHVkTNC5tkfqPSzQvFt/Dc40iC9C?=
 =?us-ascii?Q?3E2MomtVz2tiDYjOGTCPeAzqdle5X8RRrdy5DMvvLqHYZkDsI1tZ7fdD3RI1?=
 =?us-ascii?Q?RRtQ+RS1YDUobYCmn0BETIw4CKO5wa7/QCXVc3BzqSHPzanU1b/90bQTIZLj?=
 =?us-ascii?Q?1VVMv47+6YS6yb2KhyUkjE+2l2yfs1qogokOvM2yMlAGsTjWa7dTZWwgwRC2?=
 =?us-ascii?Q?oNqX2snH3Qb4BEWQOXTkBkoY6KkqbhcAy+hCbPEA9VCV/gQnjhIdDN5XV8wg?=
 =?us-ascii?Q?4I22Uthp+pIW7HMQdMQRvdGr1rZqEykEBXhmX8zIUCUFHfksLxVyvEX4qanf?=
 =?us-ascii?Q?jCKdoyzmU/+mD9HRrynkkCM1xNYutmPppxMShZHc76m7JL1t11rOdk4u0r8D?=
 =?us-ascii?Q?TtW2h+ORLlqWQNWntC3puaUk4m8NiH4K+XxCwLziXDdHNI/VBJ9qWJLHfK4z?=
 =?us-ascii?Q?8oBajyv9jj/rUtOLDO0M7kjqUz/1djMFRtTKbB2O97XBZdakGQuA2iESArjQ?=
 =?us-ascii?Q?8+dMeh/HOc+shZN/dBiew5/2xCsNXdikavD5HmjYpGbn09zyl/1/Sfd6q80g?=
 =?us-ascii?Q?WlyD8E3L2kUFLw5aIKGqJ/PKhql1IGSYSGW/JnqIGJO+hG8fWR8RmQLFaZS7?=
 =?us-ascii?Q?zkAz7iumV5tYSlwZxDuZWIzKIu77vOA4yqwDI5OJbb0hcn++hmLuttIvhA9U?=
 =?us-ascii?Q?FDw9jKGI8MddM4YqZV4mcE2cgtSfqr2BXXCF+LDkqJL9I4+eOU8zLkjS+Csz?=
 =?us-ascii?Q?W/fdMfol7kGt+FP+BtXPej2LAWvDhHizbxkGtvA+oM1XSGdmpN4NDtCUyd8e?=
 =?us-ascii?Q?nts1tMtxZgO0SBwCCjeFzLsGQqheVWzeQbqI8kIC6+duHzLlTb/9ylJxc7/Z?=
 =?us-ascii?Q?N2V9Vw4LiEKp69TiwCsmGXrMdBG/3sn3OdeoLcLuYJxX3SXiGMrPvo/kg0q1?=
 =?us-ascii?Q?BUOMTk7YEycvE1Ey/LRdQ4lqYJxlBh1/kZGVIMfqUnCGJOOT2RlDkoPg1X3o?=
 =?us-ascii?Q?7PZkZjhzbn2T5dqK/BhDO+meCZfdeTcNydbeHJkANogdGKb8GU0k3Gj0k0c0?=
 =?us-ascii?Q?jvpV6C0uen2bTgX58oy5uF/7p8JzWl8FHUCD?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 13:36:48.9188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 473f712d-46cf-4fa1-5601-08dd826be616
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P195MB0508
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_063656_671465_0CB1A294 
X-CRM114-Status: UNSURE (   8.22  )
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
Reviewed-by: Wadim Egorov <w.egorov@phytec.de>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Notes:
    Changes in v4:
    - picked up Reviewed-by: Wadim Egorov and Acked-by: Krzysztof Kozlowski
    
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


