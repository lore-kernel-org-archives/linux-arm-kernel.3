Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428CAC531C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 21:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Va2ISi2eUMuPw8igdZ5oE6THAZoextsNPdbofPkw+h4=; b=wYxUUjD0DpA5R/FRVvaUZlP72o
	s1LW0gQA4tLBcdKb8gx7h9t5bpH9nw8ZkeyBJqXPsW4Zjmxh13neKr0443oZZN0XzDUegHxivWO3z
	5pVkXkkeEzt1gif8mWJG54GCn3aaeT5pOEMl+W/NSTF1/ILN2meWVAvFIEXT1bq8WQySJNbm3CKmZ
	m/oBxRlGwUzEKW51wl4IoxofPoS8mmF7Zs3cR5ZQrtycI0viWQivorQlwiVrZ68PtV9/KKV1lHlAJ
	EXK7ekK1uzuwniWq9FwCA3DpTRJAR7xXleanTqlitdl0OKg/mJchheYUvpxJ7S59F/VeZtaPTyWrB
	qOl2/Zxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmeh0-0000000Cq0E-23sn;
	Wed, 22 Jul 2026 21:41:30 +0000
Received: from mail-westeuropeazon11023116.outbound.protection.outlook.com ([52.101.72.116] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmego-0000000Cpwt-2nfS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 21:41:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZzC22VrnGZsl5Te4h4pHeYYXGxHa6/IFPlmTyoqnq/1KwchdI78M1Yvh+eiidfT7ThS5TLMPQRWqXBB/UUFNBHU/g5Hx6UK52VTOdvzaq+VLdRHIUALOyoCBbovLAJTi5jiQE7zL/ZwWyJBgKX3lxM0Oz6OIW0vBPkbh9kudG50TiqKuAHXfdMbCPia3kWouiNbg36l4K6NEwKwNvH4cCrqR98pJc2wwrwTdnO0JjVTqIMIdqQi5f30GT9UJGDAHMeWEvygQfsI1vBHeKp0tbj0nFQueMzQbGtD4nKwxq9icUX97ub7547LX5cNtBR/1oW3o/09nJBzzuVH1WYspaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Va2ISi2eUMuPw8igdZ5oE6THAZoextsNPdbofPkw+h4=;
 b=PGfIJQJGLGVgUGDv58LE+E7G5nGgArCgHSrQv343gGSsLYp58lWboP9e1USFpitHbNCcjGuqykWarzNmB0kI6np8V6nm7PT9quSs0KkM4d0oTxQrnoqwOUQ7y52jHXJopscIlZul/SXphe+xXOjKC3aJumLgEz+zo5EbEW2fQTqvzpYJgQ6ql+UrKDVI/jS5XFOVca9Bxmva5/EfQZN6HSZx3pli8J6KNr8O1yUhahGHO5hOAG0YP+LRp4RXyW5Y3KLjIGaV728Uml/Ul3ZsZnTXugTdwq4zUHJq9tuu1lnUOvbsbPPRUgtr67HhfuEM1dH62OYYSZO6ydSlEL8s/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=phytec.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Va2ISi2eUMuPw8igdZ5oE6THAZoextsNPdbofPkw+h4=;
 b=VGSRykr8gnvN1GOreVKqRDn91T0KT87u9akoYIBGlmQx682CT0wW0a9LmDdm1VwNBMVcoycjZzYQQKOa4R67Y9aHxBIVL31lwWW/+Do4B2Q7u7XE3oeX7O1NnUJvvrBYS0HM7R8ND8XT0iZf/f/jtn0NLMx9EVpbN8DB+s/8Myv7wTFGReaFVz+t3KfP26EfvQo8BgM0oS4hjyOV8opeOz5MoUTIWde/VnsnqUOs8hZ8CA8gOKDn9LCkdWumDNuyH8rXVc9fsADj9UdMpVGsfl6l/c0RAvVy9xR2MJKtX5UlLRxXkkxT/p/rOJZwRD5Ilwq1EqOV3A+PCSr6u/nnVg==
Received: from DU2PR04CA0216.eurprd04.prod.outlook.com (2603:10a6:10:2b1::11)
 by AM0P195MB0595.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:16a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 21:41:12 +0000
Received: from DB1PEPF000509EA.eurprd03.prod.outlook.com
 (2603:10a6:10:2b1:cafe::61) by DU2PR04CA0216.outlook.office365.com
 (2603:10a6:10:2b1::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 21:41:12 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=phytec.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.com discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509EA.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 21:41:10 +0000
Received: from wl-jma.com (172.25.39.17) by Postix.phytec.de (172.25.0.11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 22 Jul
 2026 23:41:07 +0200
From: John Ma <jma@phytec.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>, John Ma
	<jma@phytec.com>
Subject: [PATCH 1/2] dt-bindings: arm: ti: Add bindings for PHYTEC AM62Px based hardware
Date: Wed, 22 Jul 2026 14:40:51 -0700
Message-ID: <20260722214052.1962414-1-jma@phytec.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.17]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EA:EE_|AM0P195MB0595:EE_
X-MS-Office365-Filtering-Correlation-Id: f659d3b7-5c81-4d2f-98b0-08dee839f22a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: Ijc3Eo55e0rGmu8/4FETYXE0ikwr0qek8E801vb7HEw5g/wOmN0s29M32+Q+az6grlDq8zdrpRiPTCbBEdYIJFNp+RLYFCvcJfo72haAevzdYlaXWebEJOtkSt6yHeMomPkWXJ+njkS5v0vQTdA46NCp8VY1ICtSuLBrK0wxL91Xn2CpIemIZEcOqjVvJj+LRqgxK3VTQbxaJjLoQWQW5LarEeVMCCmPUntAcq8Yw4lHPuuQU0qOHsbWTkFno8DJZcSzjnqOvY3g5pHxAzF9QVuanycVyr9PG0SLxQ4FjyrVRP1gWTE+XkxRVbk9vNZd3BmlsSaVK67jCTiMyYY44MyrWmwaq+lMx8UIrE9fsFUgETusgjthpyC3bOduLxtQvPgk5rN7TZu8W0ome53D1gDnNF0Wx3iKiDLouOtnwio9NL/y+4wXkmnYdlP44+uXjf0pmhoKAi5F80IVYJWfIv61p7Olby8+Hk+Fi6AkmW8N9zZ2wIhlTTdHle7kkDvZQIEdM2c7AeD6ZPJd4eZUXTksq/7nc4pfcMeei39y2feLG9uac5HFUCWeozY3BLw1O2qCY1MdotTd40XXpFyjiUfTOuawuyaQFYXxusFG1FzDUGpaX/AiNt50r7h7Zi6ehCdBN2IqlgCEYLELl/t/9m0s/Ju5nrFxyouZ5wmf9KqvbLXEAPmZ7ybSFjBXMT2LTISSZt6FUqt4Ho/JHgYpFQ==
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: IQgSykVGn9JMVw/1qJUgS6VTrek2p9Y0JJPaXNxH+3UarLhZputxE10VxAZfdwv97azKTQK8NjpHkj3np2S1jtL+/rohsGtdZU3V+m7f7rGDp+VZxyDdOsbAPo8i2r0hAtKzpfWYo3CqQcB/o4t0eLW4I71OXrpEWmtw3TskrnRBLL2k2g4ucbgwQma6WsQYXWDPCmXhmwGjSSLIpnW/wJczdubH1fmz7bkTdgyJNOHQbEfXVAsv50E19KiqvKv3AX8iU+9WEUPwMkcVq/OrxCqXpTj4qZFAXaNb5PTDLUv3AfVJl6KtKfHZET2RA5v8UNP7+xRb2RxtO1rWLE5al5K++zLpXiJ//k15LGkxqJy+AwJ05+B3Xmcv3WsLqLGILYo34SizHvJzp2QjOreqcMim/7EdMies/xH8DpOvn6f2BOSwIqbF3xi5MaHr+G/m
X-OriginatorOrg: phytec.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 21:41:10.6129
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f659d3b7-5c81-4d2f-98b0-08dee839f22a
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509EA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P195MB0595
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_144118_813204_9ABADA6F 
X-CRM114-Status: UNSURE (   8.83  )
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

Add device tree bindings for the AM62Px based phyCORE-AM62Px SoM and
phyBOARD-Lynx.

Signed-off-by: John Ma <jma@phytec.com>
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index eebb3523303c..1788b5449b8a 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -50,6 +50,13 @@ properties:
               - ti,am62p5-sk
           - const: ti,am62p5
 
+      - description: K3 AM62P5 SoC PHYTEC phyBOARD-Lynx
+        items:
+          - enum:
+              - phytec,am62p5-phyboard-lynx
+          - const: phytec,am62p-phycore-som
+          - const: ti,am62p5
+
       - description: K3 AM625 SoC PHYTEC phyBOARD-Lyra
         items:
           - const: phytec,am625-phyboard-lyra-rdk
-- 
2.43.0


