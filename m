Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F390FCC9D1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 06:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NKQKILFOMyz+BduBovVO3DdK747FntT4dzQdAFZl5iQ=; b=yz6mL1q15Oc4S0K+2xJcraVNq7
	aEZuG5zKKgyVXVvZo58hKwNVKIQOE8oyvLbMqsjqixImySX02T7twsZXsJiMvMe1KurtqtOaKm99J
	LoLmKm6+fLENPKZUuPwowv6Gj0aMpn1oKy4O4PtKiViS1/qttw31yikraQHK5mjnJ5kCzv69+4hYz
	0cTUX14iVAmfGBE22zCVTmXbmntJiF/OjS73td/1dhdel/cWF85rYmJOZKYnWVdR0CGZUAJ2Ltgve
	CujB+TV7h8zOpPo2FCHctRHfz+NgVH3GMMlx/CkD8s3OkRFb5678MLobEmQWom5i1orENmyqg3JyA
	9vGY6snA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzqyb-00000008ocn-1I69;
	Tue, 10 Mar 2026 06:53:57 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzqyY-00000008oaQ-1iNq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 06:53:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LnhoTii0mPHs30zrZSnVTMOq9NMRPLfazm3etVbQL4OInWfHNcMMw9QOAwbunNY4ysZQcNSbbMd0zm9szGntaeVckzaU8Uhu8ukrQJ3MAhm/u4k7S/T0nv5saw9oA4G2FVeYxwij/Ey7qLi7asmgPICy6nmBIIMYrX5sVpoxFWgPsQmCsI+9LV2AS5tWQEGRZITdXY7Ta8mDGeP+kZ0kjAroj6Gb5TCmFJERPr7q6tivoz1tNIl7B2UbmIBcCOdPttsx6Mm1SL8Z2zYqa9hhYWm6b0WE/7pqFISTFVAyLdBzNw+qdFxxpy+Gp766Gep1YUlfl/hNtbWzy+z6+1YHtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NKQKILFOMyz+BduBovVO3DdK747FntT4dzQdAFZl5iQ=;
 b=XOfqLyCRFVUQML+yOSAEkN0ibUJLlLwhO4DnLMSa4VkKJAyK70OngELKP88n11ppIpXlBRQ1wSu/j+FI6/FYQUNJDErqWUr4QRol02RfaOAz/2yR6FLEyvHkXlmYSB+/HK9PE+GcsOKGZbzzsD8WKNreKiZHWY2MyCarqRlBDAGsZdbbnVLXbY/gSbB0k6Cgz1Py8X2Jf2A0opQYRmDTlcmIQkbDlxFdkybjj30bqr8KfrK5pyEy3RKYSvDdsdgCgZ4G9SJaIWAdijjcMKdBpTDx0rUUSTs+h8T8tpz6Fi8+gfdIudah0hgSG6THy+cuIFcx2UsxLF5KS/khOuJopw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR01CA0198.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::7) by KUZPR06MB7964.apcprd06.prod.outlook.com
 (2603:1096:d10:21::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.22; Tue, 10 Mar
 2026 06:53:43 +0000
Received: from SG2PEPF000B66CF.apcprd03.prod.outlook.com
 (2603:1096:4:189:cafe::fa) by SG2PR01CA0198.outlook.office365.com
 (2603:1096:4:189::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 06:53:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CF.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Tue, 10 Mar 2026 06:53:43 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 9DF4E41604E9;
	Tue, 10 Mar 2026 14:53:38 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peter.chen@cixtech.com
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v2 1/2] dt-bindings: PCI: update CIX Sky1 PCIe Root Complex bindings
Date: Tue, 10 Mar 2026 14:53:37 +0800
Message-ID: <20260310065338.2337761-2-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260310065338.2337761-1-gary.yang@cixtech.com>
References: <20260310065338.2337761-1-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CF:EE_|KUZPR06MB7964:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 745ae3bc-460c-45fb-1a19-08de7e71c50d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|1800799024|7416014|82310400026;
X-Microsoft-Antispam-Message-Info: V6aci+cd6WWp96Bi6I4u/g0xpanlGaizyrNMyhvWkBjxE/udDSLDU/226Nl/in/9UBBk1mBPJmfWkBkZublcKa2JUtJpvtj/y03j7Pnu4xwvlIbUZ5mClY2Fv5Wdf+1CNFR1Xyp+V1rv6XfWG9Cac85mqmLjkK71T+2kvBcpoNy7VamqeoEMszStor5UIFHp2g04drTIGFHHQyseJEevoaxMF/siFFMByThnsYEvinoEPNfyBa2+uBtlK3g8Gvg6NvyEkQNYqX2Sl2KeVITRaOIIsYgHInkaOwStn+QPw65FgRKG+YoaSTw1WLEArOcKtccdvRo4J93ZRz21P3H+NAXV8HLOtic1SKoP4QjPg1gYLTBU5URs4pEno0hLuusIz4+8LRKMtix1fwMUU/p0K0HkNyTS2SY4tY5RFQ3hoXMjD+P3MUv/Psj5pxX4W5Y+gyPN2xTIQRTQ/CC95lwQilHz2ob4pMDgoFpANZ00TStBeTZw3SuWDMvj6JH0fNN1bCtLkJFGG9UI/DWwJLgo1LyLTAXvIlFbio5yczQ4EWghTFElKOeWrXlRAKGdpdwQb5Yz3l8Ipg5WIY5pQsVihJeCx6F5LnoaFI2Q2pV0LFcoPz71qWiWROOZ4io7zuQatq5C9jg2moPu+BYgjyBlfSxERimi5Q0iqp199E1Au2fw2plVXkbvRcnOL/gCz45w2P8JWO3PtZuiSMh7EKJyrjvyv5izU50ZQVy8mdTBXuzSG87JzN3VXg1qGkYAFGaNYIk2VbQ9v1YPgmtQIKd98Q==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(7416014)(82310400026);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jaaYeEfMEgUfWD+y0nGi7weXDNQRMTfSSTKBJ23cpK7QgrJRvAXsKpYJyHnr6pMCrRX2Q6LBzOXEFR7lkszuNK1GqbawDqDhCS9mPxiXkI9LXfedW7FLtyH7grF4y/WiWMpilssVD3DF3+xXpHLTafhnxoR1ISOW1h9sCNeGcV7evjeibA9O6ZWk8dvydG9SKHJ8F/SY5pD1GwXw6wolroJA9ZulSYXORLnajfRPy1kcPKVNqK71jlODc1PtuaIPM9BRudwB2ZpbaEYRu7qQAQ+TITONKcfdVclJ/z44q+YEvTZwuvcIpA4grUnlm4tCH7FpOof+qrr3U3RoZFOV0pG/+tsP7ULB4Hd9l3IuwnJXRe/dE4qjuXgzEQzuTXGumemSOUK/tCC8DnlbjDZq3tlikEGl9WGclqvODUkdDOUA32Zmt8CA33CfWFfqf2Bd
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 06:53:43.3764
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 745ae3bc-460c-45fb-1a19-08de7e71c50d
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CF.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR06MB7964
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_235354_466397_7E3D47C3 
X-CRM114-Status: UNSURE (   7.56  )
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

add power-domains and power-domain-names property

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 .../devicetree/bindings/pci/cix,sky1-pcie-host.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/cix,sky1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/cix,sky1-pcie-host.yaml
index b910a42e0843..1d8ee8310588 100644
--- a/Documentation/devicetree/bindings/pci/cix,sky1-pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/cix,sky1-pcie-host.yaml
@@ -38,6 +38,12 @@ properties:
   ranges:
     maxItems: 3
 
+  power-domains:
+    minItems: 1
+
+  power-domain-names:
+    minItems: 1
+
 required:
   - compatible
   - ranges
-- 
2.49.0


