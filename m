Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC3FC5B567
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 18:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0IFJzUyKTyComRMaTu+7OqGWhIO4Z4Re3ZI4aToSGBY=; b=A5sORjYNsz/cTxHzDMgmBscN39
	5B+MMmvVPQKDCR+joRsStrTQizrexOY6TTp+RFVNAQdVdX0dD6mN7W8rUzPlEvfxfE/I4iPBiSBpH
	ilnU6eye/iK5mKYm+lSm6IMGisBHCc7CX8bfek16HcoIKRn7H+F3zrWLUCnG3aFr1bEigJd5VyQik
	M2XhqNefREiiLpBCtreRJek2ctY/wpW72pCza2oi8FLQ2TL2DOaYyocKsLUpOKRJ1aj7JQMFWF40S
	YgQhIsVkny+lAS3fYsf3RKrI8WWrLOXQnBDJtRPrZu+EC8J8DyL+UW8smY+r5ZX/xjOar8BtjuQ1x
	pa5ztUdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUsk-0000000CeFm-2d2C;
	Mon, 10 Aug 2026 18:37:54 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUsg-0000000CeFP-3eZq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 18:37:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HCsVNBfxKJE+/4IVikL8Kkutkf/FcQnuW6FhWLpzFEqwXBa2zjvXPqnVP7KdxztaAjMInWKmsYhCJxmCtyijgBDNDsIiD5DMacccGUqPJdiyB4AmntBrs6QCfLeEbWBtjLmwgmvVu2ZKlTeY2sH+aBcdYJpJP35jRK8oYFeQ/X2uycvMz0WPLPx4T3aamYvUo4H/l4JhYBBFqpqAb6/Css9va9DLlC1GcdwZODLhA4fGV1dMVKacQj5IDTLMmMaajPkI3JMgkvW1KZqevuQrHiBZWzkCF5N6iRUDMyXoJs85zy0xDuZvtFfT3IS8FZ9uGgQUAd4OjtHngMW3TonQnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0IFJzUyKTyComRMaTu+7OqGWhIO4Z4Re3ZI4aToSGBY=;
 b=Lcqv6n/E34UDX4sCmdvcEouJmIgRriF2eWEpMywX37spuVKKz0ogQcRDbimNRN4Aklm7AB9hvU271cT7WHx4dImfMPDCseFad0ypVJz0MqkfbMRirDd/Th3/bwyv2IsoaD7FNmqtilgY/f70tG52Z8jlvNsWmVjBr+XDianuHtKQrlkVxUcCt1dDwQgijN//xwE5BIIW+4RGTequxC1PP5NFTyKdFF+pDTRT7Qu4YZXVy8swwiGjjvGqqBCkeZNnnEtEJbw73NlWdxekz9HkUtzLa6voYJYOD03QSE1zaUL/Dgx/2M8W4V8aTvl0NPhmTl5hh5tq7aviBDFeiwLiCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=phytec.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IFJzUyKTyComRMaTu+7OqGWhIO4Z4Re3ZI4aToSGBY=;
 b=frzmkocRzOGgSitIscJVhmSLlI175Veu9vihoX55WLkkF3zNeEkbo26Cx0Tl5M2UbzgAdyviY/cux1nNUR0mBkPtvdXBcWDNzCE/EIaGTpfZeVXAc12oluKaYIInZ8JZZbZpQIR1AeictChAIFIiqefTHoGV44QSooWXVSN5G2dGXCFTBoJeGfJKFsoI0ZFTJgebGYKrgvOZTF5BLttQKPAT/gcegsGXCdYn7uekYBMRPVQW8Uxh4ZTqKuV3pWODlRfaQ8mSPK5XsuxynoWJC5uXeyBB5upbj32MY77KNWwjJPEtpRYowsI8DG+B84+nzBM2cwx8apr6A1wTx1dkRA==
Received: from DUZPR01CA0059.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::13) by PAWP195MB2369.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:358::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 18:37:43 +0000
Received: from DU2PEPF00028D00.eurprd03.prod.outlook.com
 (2603:10a6:10:469:cafe::37) by DUZPR01CA0059.outlook.office365.com
 (2603:10a6:10:469::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 18:37:43 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=phytec.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.com discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DU2PEPF00028D00.mail.protection.outlook.com (10.167.242.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 18:37:41 +0000
Received: from wl-jma.com (172.25.39.17) by Postix.phytec.de (172.25.0.11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 10 Aug
 2026 20:37:38 +0200
From: John Ma <jma@phytec.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <w.egorov@phytec.de>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>, John Ma
	<jma@phytec.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: ti: Add bindings for PHYTEC AM62Px based hardware
Date: Mon, 10 Aug 2026 11:37:27 -0700
Message-ID: <20260810183728.1542417-1-jma@phytec.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.17]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D00:EE_|PAWP195MB2369:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ffe25ef-57bf-4f60-bdc7-08def70e761c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|376014|7416014|82310400026|1800799024|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: XwjRvW1+XVJP50molx5lKzs5kXJ6S0AasY9FkVIUFyG3FErpEgFBawYcsnezPl0nVJmM2IMOcIIZ/za/N1ZQ9lF3/DfJG2z4kd9lT1jt9R0b8bjYQ3G79RKCMjOh8LNX6qs89FaXVBulybonu84Yw5RgCqgi6pf7GjlVmrqDs1WYmEVjHZ8z9t34mcdpmNqtogTG8ze1t9rneLU9wHJYm5MNcYUxYhESilMz95jJJp1K/35ChPxYtBxeya0TCWM4gZWf5DnO2GJzpu+drajGljzQy418IrghzCct6X2nUE0QCBT5yPCqGoXg78HIH8rYvjRjuUGc1H+m+oKHZgcwlMvBK3BwMylwNTelcTk7n2DfxQgUb/DNZS84czuzpZPMQU0IL7WSyBjV6N/JyabNaIyFCby3mClCBeMZ8GMvbyMjVi3UDRJAeVEeln8qc9NOIiv1ZOZHIilhYyI7xmjcgZEp9iqZF9QV6wQ9f4LamNywX/EP6foNPkEwU3Wmp40lsVYQnLnUl8pe7u96y5FuZljlMY580fO04B8IPE4Vd/yXthgz4Z0XdRdKl+irI+cOH3cLEl3ryCSnPeZkVOg9k1SAt3YSaSCTj5Uk6AxVAtnNwNKv+pCknA4C0EafJOE2/MCXzAas3hu58DM3lAR3rUjoofykRJPUOLFC4/yFbqd2iVrszgh8XYMtaNnwaOHjfXybra5txG96M4tYl/kHtw==
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(7416014)(82310400026)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: i9hbHErsSkYgd/2w1jH374P96JRgaNaH+N281IK5iGwpbmLEfxzzRHh/JvYFy94u8HJs0/U8RaYHWXEGLVcjOs5kqR6FHsW2Wp0EFdsfiM6pGAPpfQVIFA5PmdNvq/Uu7c4G2e5MycRGn+OBt4zGR1I7kKfccahbXTPaJnAbmvmDkUEGvC/ZRQHAX5tSZD7bPrNT0vzq6ZK5WmOWDoKnP8K0nrJuJNhlEshgMTcOqdgM4/0rSjYMl64I88GbaPd+7HpBWvvJqcH/6aHa45y+WpfUOT1bjWRPKWPmCXdVdzk29Vzmp63nrwFRU9R132Ceq+yfzAkRUmduJgbKd8pcwotd1Mvn4DbM1R8Udq5J56dTe8OuqksM+qD3EMdgSw4mJJksTb/VgWKJQ2+podM4Rs4SUyXGAo3Xr6O2rpcn0rEYDihbtjLeqyjsYcgMVQG7
X-OriginatorOrg: phytec.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 18:37:41.5680
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ffe25ef-57bf-4f60-bdc7-08def70e761c
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP195MB2369
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_113751_613305_C31AD78C 
X-CRM114-Status: UNSURE (   8.32  )
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
v3:
  - No change
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


