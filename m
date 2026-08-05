Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CCFC55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 17:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qnX8daorpbDCQU8cl3852hgGJZ2EWin5Kl0A5TSKeQo=; b=nx7LMe08qOUmnyRNAsxrn/YLpp
	ZahHLTabv8nDvIxwJUC6zA4lHL0ovHIH9qtvAyXRljLOgxoD+m/Mlbp++lwKJ0WnZPfWVT/d6chNk
	LJDny5XhPkf/Cz+PpZEIDgzdpzCd2dEYJnBm/LeNfetLink0LlSeocd4Ub/zzFaYG2aEDTu+YTX0o
	4LfjrbJQpPHyR/j2WNvLYBrOamsgNYwmKqfXFMBt2wQuF+FfsItK2/GHZtr0yKPdX6CBdOwELG6Hg
	bQgP000yI0/Pgt3fywGTlFna2GAnpIb5t9WRQ2F9eLRgGc+Ul1Vy1SskOY5gkCckFU2ykW/CadIn3
	G8AGl6TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrfOv-00000004Kd4-2ke5;
	Wed, 05 Aug 2026 17:27:33 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrfOs-00000004Kc4-3YaW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 17:27:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N0cEnUtLRaSNcoTHMbVA4dQ3pGVLVeCaBs5+Z1qARz4gj+vOGI6pEya2cl2h8CFA1e7NSsbszCAY1taRl6mvndbottvN013YqKn8h+LxHXqLGyeBQ2pjVNBuy2BH4Bb2q2lL+oQlq2x9jQZ+L2zKlrVeCGHxlLL9r3QNXzultJpc9bJPEssV0Jzc0Ni26K2xXBEngaBnZQNeBU0GGaiNICpDQvZXzDWlIZFw1nWLrTIn2cvObgU+/uiBTVwy/m8ewB6Ve8D/3WBNpjUMbT/bzlalBzfKJyaMi3q9v3T98ccF//I4HR59uDSzFxYPigwHIT6nOLHg5bS/cvu9IqbrWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qnX8daorpbDCQU8cl3852hgGJZ2EWin5Kl0A5TSKeQo=;
 b=KizmaubNzE3gnGb5qFbk31n3wNwH52ChwKkriwRIuhAbvUMXlnontmGfythYUEDAEMwQbffykpV5EPrIWjy+Z73nZtnwVEITZIJ2Ono+brCelVRK8iYSeYYgTZPTSgwuyQmTIougPruGPyhQqZkkmJFyiWyRQAH8vt1yk6Dz4LWeyaDIuiFy3Nd/V7/if5Q1AF5pvULxViewJGaxCDGQIEh+lVv++af1FPX/TkKFt5DxBWtHPBpwcck+nMJNxYm1nBzyN/mqlLznW9qa9LFA+CnKQiBxIp034kRUdTcLSm36u9IoyxD2nZACw0GFdhxbZd+WyIFRhXmxj1B7PAqQJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=phytec.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qnX8daorpbDCQU8cl3852hgGJZ2EWin5Kl0A5TSKeQo=;
 b=QnHvNJKz74NiqcwsWuJM76APPV1dKKX+wPQSRmVjiXzl4Y2Rx/8yYNVzn3yvq7HjV8WMYs4CUu0SF+Il69KaUe4zcKW3tXDmpiEi4LkO4XD6a3kAaZxvxtyFzmFSNeUASqdm7y+OJ/rOdOl+zTMNSyVkVon2m/Kh0duTgPK2+Txt23XvA4MgPnVWpnYA2imBydsMYiMu7l6m2cFcVynvfYiYQ2NQGgWELh03MTaasW9SB/RCaG/aoUNxdZZQIReUtiEwK2CSQNb3ey1tmlgf42c1kPZ7IcDT7PBlQBIhkYlYAd8us/akoNWClQz5K8LEdOXJwVZMIT0m7f0UxRM4pA==
Received: from AS4P191CA0009.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::16)
 by DB4P195MB2314.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:3cd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.19; Wed, 5 Aug
 2026 17:27:19 +0000
Received: from AM4PEPF00027A69.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::ad) by AS4P191CA0009.outlook.office365.com
 (2603:10a6:20b:5d5::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.15 via Frontend Transport; Wed, 5
 Aug 2026 17:27:19 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=phytec.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.com discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AM4PEPF00027A69.mail.protection.outlook.com (10.167.16.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Wed, 5 Aug 2026 17:27:18 +0000
Received: from wl-jma.com (172.25.39.17) by Postix.phytec.de (172.25.0.11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 5 Aug
 2026 19:27:14 +0200
From: John Ma <jma@phytec.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <w.egorov@phytec.de>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>, John Ma
	<jma@phytec.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: ti: Add bindings for PHYTEC AM62Px based hardware
Date: Wed, 5 Aug 2026 10:26:57 -0700
Message-ID: <20260805172658.3892154-1-jma@phytec.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.17]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A69:EE_|DB4P195MB2314:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dabf4b6-ce60-4015-bb2f-08def316ccb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|7416014|376014|82310400026|1800799024|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: Lo+rt3x9wuxmoKmb9lX/cTVhE9JsnUQTAiP+y+rKHYYGWft383VpIvHQmweX/guxhwvdQ+30EBmSkvVMO9Nx+oAyXGuLqkzkrPWfq9UkdFjzUc/oYcfTwlFNu2Mq8u8BJZesAsaWGskRwNl/6glMoC8QqWvG7+gdnc2zJ0KH750ArEzVewAr3Uf5vBJUgqlK/355dg3+XLrpM7ZbygVP7BkoxjHWS30qoeKYVEIv70rhuHeXcabIhdz+b9CiGWFoYln8VyUCERqz5dLUznu2tiTPm/Et5SMCTY3dEd+UfjKyIRQSvSQAY44W2mn3UTgIbex5wI6/X7YizU5IoDzzKoZo6TvUa31PtbuNboRYiPz4x79UVEYbwRRE5Volq1lFHTG1y1T0AHHZG/aMGLvUlh5BsuxggMFqt04mGGwbFr74fYjegyMYBk3kKNf5sX3SOdFdr9maZnIOhNABlviSrlbqPYotWDvoOEszdp8psxcVA5jBO+vZ4X/EUJEUSHigu2i/tyc5XYmvEAOAb1pWksbln3NZL362/rKqtNviojJvV0LtWGD6qFBaYv3S/LYCHSGZapT8o8laI6eJBmtgK3vZge6+rDRaGWnrHIgdQt58Q+r/gqzI+78MWbAgvMfm2cE1B4lBfPED/E/4omBBMUH/RaChJ3JqUsv/qnnn4OhscJKH67wNsxu3sFt7RMOabDYp6n/NLJ/upbHzohiIfA==
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(376014)(82310400026)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: acpueHFYSmHtyPICJLtpaa9afhGFFdfCsasHpaEleZ5a6DohleFJCGXH1Ub9+BzMJsAJJ2cAPNvVAbpSdHWWQQyXS0rxd6/Q5Zg5q5iw4AnmnemBN8bFftFuYBuDZo1FfOCLilT9LC3Ke5jJl+WFvtluswElfysjdVNqgNTwSA6PriSUscRP4E6KjsBL8EnTaE/g/7XF+lzDjTKxAh7NlkCPGPRyIV1eYWrm23oGFeXkBCDCKsRrltdojNaD5IdCtKiczP8c04rbT0RHSgH0St3vnt4XgiAfHpumyYZ7Ibp2Oz9NBmr3sAVRx0pUNhOQ6iY+CC5MgSdnDbxgeOdiEqAQbfQ0ppfCvgh0iT+EWzKavjKoGynndKJbr26dkSnW1Xj+7/Nd4/tDy2YaOVAYbRoK8toBfn0U4HXjuV6cTGyVmTPYE24MWLKbo3GYhzaI
X-OriginatorOrg: phytec.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 17:27:18.1615
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dabf4b6-ce60-4015-bb2f-08def316ccb1
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A69.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P195MB2314
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_102730_985040_CA7FC740 
X-CRM114-Status: UNSURE (   8.49  )
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v2:
  - Add Acked-by tag

 Documentation/devicetree/bindings/arm/ti/k3.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 69b5441cbf1a..b7cba0a80efc 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -49,6 +49,13 @@ properties:
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


