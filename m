Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C346C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 13:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sa7DgvLLHNj1GXIB4TZUEjTmB79clCDtdIiU7hCEbDs=; b=nBRMQOo9dyYo0Y58Lj2vJSzZi/
	7vVyH+mXbPIfHiVFFeYKA2z0WSUpOAdn+YYxAlBypJ9YPdA4z4rSXnG2/ZFNLX+OY0VQDF9EY9CSB
	BbPuDwmuptNIUiFf1ngqaXD83u5PW+Z7x/6prCx3zkaOshdrHzwCYACstcLMizSaRR8R7xsSnWIQT
	LzDlPZdLEw+t9VPTVfVjYWdzzpucZ0JmkSDbYN8yFUafBIeXtsdVl56rcom+MzZNIkw65G9GKkm5A
	QcH0PK7iP7rVVJELCb2zRJ0p2rn/8kQsLo54tXhBW/2+cbKGUIfQLV0YlSYJrALwJyiczPQ/rQLO/
	NavStGdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9Vs-0000000DOYn-3gQT;
	Fri, 28 Mar 2025 13:12:44 +0000
Received: from mail-vi1eur05on20715.outbound.protection.outlook.com ([2a01:111:f403:2613::715] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9Oy-0000000DNGG-3yhr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 13:05:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kcWLJSJfrY9g/CC22Dq2Lg9C724pUpcV670Asptgbg3jzvw9itfnwdHhp2CkUcf/ff03quH/AU3i5hp/bCyAud5A1GRekTebBHv8Ny0qzSTq4kB0dOpncosTIYqxMPfY9NomFHsDHpQTpo9lnfQR/YhEdYjyX5UqmQTisbnF2iPrhE8tePLjgmjcRwQMgbsgnIrtcLQUk8rUQdyA3OWkg4XnT8cXc9WEdJ1bNo98Y+kdKbp/G9is65Y3cEEtyELNERZ2ahyRi0+kJLb9e92vyTF3U5n9mZUCL9tDvr4ob8m9yMdPo42N61s93O7W1ysCT4DSoZ1nMvIrn3lV88bkqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sa7DgvLLHNj1GXIB4TZUEjTmB79clCDtdIiU7hCEbDs=;
 b=bK8AujDbKY4df7Lqm4BaDa8KIUueu0jZ8a+sod63wVBVdksd8oPzeVGr9t28WBtK3qjbmuE1k8IMQbVkfgsmIrN4MeAlqsZrn2zFJtcDAUHYWjNI6+mtzgyzZk1kxP6fcmhXUkHCT3I6HZGWGZ0VkligGXICe80kZkUX68aNF+HxPCjZUtVeySK3Ik15ukhHkEUfOy5tFVPSUbAZ/zYy5rLTofZ7fQqoKchOeQSwxTY8BYolrTKJtVFPq7hza8lqMHBdUMBcatjObL/+RRd9T/mAu5b/ty41iqtmqH1bR/EnoXL1271muuHMm5Fu3FlAwLIuFVvbF4gtFwftZ2CZOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sa7DgvLLHNj1GXIB4TZUEjTmB79clCDtdIiU7hCEbDs=;
 b=GsX1xK2q5aM8z6Bd/ddQJrHp0tK6Ud7E7tRlSUrwd2UXuRjWJzxGUCxO/4BzLm347UmxmV2eemoLBtgymFQ69k7QkLaG22U8s4j77W6zrHP/SjIhVV9j872B0IyB11NGYXQOpz2K8NRTfRmmPV7Zw0uJTUHMBNP/xuyHSVVVV8/VuNoSmqJHyA5TktNtaXqEG4XIqBZPMiYc8ywj2fakLqYjBZYzB3px9i9Uf1c32uN+/b8YBYzDV9l748pdsb9ZNGthlT7P5r64omP6BFAQPXHgZq03odtrGYQXJGSR7H1OHpUQDCC1iQxI7nYeGmtfkL9X7el19ho3M0Hr9pMY8A==
Received: from AS4P195CA0032.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::6)
 by PAWP195MB2679.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:46f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 13:05:28 +0000
Received: from AMS0EPF000001A4.eurprd05.prod.outlook.com
 (2603:10a6:20b:65a:cafe::68) by AS4P195CA0032.outlook.office365.com
 (2603:10a6:20b:65a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.44 via Frontend Transport; Fri,
 28 Mar 2025 13:05:28 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AMS0EPF000001A4.mail.protection.outlook.com (10.167.16.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Fri, 28 Mar 2025 13:05:28 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 28 Mar
 2025 14:05:27 +0100
Received: from [127.0.1.1] (172.25.39.168) by Florix.phytec.de (172.25.0.13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 28 Mar
 2025 14:05:27 +0100
From: Yannic Moog <y.moog@phytec.de>
Date: Fri, 28 Mar 2025 14:04:37 +0100
Subject: [PATCH 1/3] dt-bindings: add imx8mp-libra-rdk-fpsc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250328-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v1-1-28324c7f81fa@phytec.de>
References: <20250328-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v1-0-28324c7f81fa@phytec.de>
In-Reply-To: <20250328-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v1-0-28324c7f81fa@phytec.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <upstream@lists.phytec.de>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, Benjamin Hahn <b.hahn@phytec.de>,
	"Jan Remmet" <j.remmet@phytec.de>, Teresa Remmet <t.remmet@phytec.de>,
	"Yashwanth Varakala" <y.varakala@phytec.de>, Yannic Moog <y.moog@phytec.de>
X-Mailer: b4 0.14.2
X-Originating-IP: [172.25.39.168]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A4:EE_|PAWP195MB2679:EE_
X-MS-Office365-Filtering-Correlation-Id: 92e05385-c189-4bd8-9388-08dd6df93644
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dk5mTXEybTVsNVova0lQRGNsa1lVeGhQOEhGdTJERy9ZUWN6czBrZ3VmMmV4?=
 =?utf-8?B?ZXZvM2FTVCtURjJCZXQrNWVLcnVEcjA0eTJrbENianBzRWVkdGUrQ1FBTDdj?=
 =?utf-8?B?V1pqNjlKd2phSzNiQVpQcGNDS2NVSHpFUHp4aXdZZWxiNFpBTXZIQ1hxQlUr?=
 =?utf-8?B?OUhQb29iRVhaeHZWdDRXYkhmU2F5TjA0M2JVSGppdHRyQ1ZJM3VHcEZTMnI2?=
 =?utf-8?B?NGZVMi9hTy95cElza2ZYKzhBRng4azQyYm05elVwR2ZLbHJtUUd1YUpEZUtO?=
 =?utf-8?B?NzZTZHhSZTZJQ2xNWWtjNEJ2cFhpVUxJU1pWQWpwZXJYbE9yRldIYTVaUHlG?=
 =?utf-8?B?RjF1VFNuQmgyOEM4RzU2VnVjV21UTG9GNWs4SW85aGptY25LR3Z5THhtUlI5?=
 =?utf-8?B?cnV3dGpzc0FhMHFaUnZ3QTlKQzNFdEdaaVpBVEppZlNzSlR0RnlIdDE4UUtX?=
 =?utf-8?B?NU9idlIxVERMdUZwdFpMTWg0MkRsNHR2NDRJVGtOYXVzMTJLVmJoLzk0bDBp?=
 =?utf-8?B?TWhLcXI3Yms5YWxlTmNVa2VXNGR1V0ZoQlFQTzB5dVB1VTk5K3VTamJ3ZmNx?=
 =?utf-8?B?bHFIWnMya3JmbEpOd0ZrVXJPYjFmUWltRlhobmUxSHI2Sll4UGNKRnRkNSt5?=
 =?utf-8?B?VVY2VUZERW5tNVJueDhaUzNCREJxclJEeHU3VGVqa1dMY2lFaDhseE04czJi?=
 =?utf-8?B?eFZBY2htUENERnBENnQ1b0U0Q2tQWU12WFNSaWNwY2xRdVJWNjhXdDVLY0Ny?=
 =?utf-8?B?M2MrZlVCYmtxUVJtTGRXOXYvcXRsZVdPeVpvWmo1cWJubGNlbHNRVDFiRW1j?=
 =?utf-8?B?N3dmVDdTZFZ4T2VkZFFRWGVDNmQ2Y3U1eU11RnE1dUpMYXp0ck1aQnllUXVz?=
 =?utf-8?B?UDdZVmV3cUp2YnNyU3ord1lzZThlV0l3QlJKTStoQ25WelM5ZXFtY0lmUkFa?=
 =?utf-8?B?MHoyTUhxdWMrMGtiM3dGdzM2MmVoQWFuWFBLREQ0YzliZ2dzZ2lqYjlOOVRl?=
 =?utf-8?B?dXozNkFUMU5JdjFTOFF2QkpZanFwOEswNFJUL3F2REM1UEx0TVA2T1g3aEtp?=
 =?utf-8?B?ai91aWpyUTRMd3BCaFVURUs0WnFXUWlBeFFncGpVdDFBelNwdktSNFcrRUdh?=
 =?utf-8?B?OEJrQmhUMVcveUpLZmFnbEJTVEF3T0dScGVoZXd2MEtMRlVlTnZ1b2hvQ2Nz?=
 =?utf-8?B?ZlNXRU1JUzZsbFczLzNyZGxFRmFmN01HV1lRQTZyYllpTndCRGNiRTkybWZK?=
 =?utf-8?B?dFlCNFYyUENNLzNjNEJUT2s4R3VrUjlHZ2hkOG12am1PV3lzZXBxL1ZhQnZR?=
 =?utf-8?B?WGdGQkRIN2RSam9hcjNLRmc4MmVGMWpNKzJCa0E3L2lvVkVocXViVTA5ZXdU?=
 =?utf-8?B?dXRoQ25LUlQ5WEw5ZC9Xdk5hbjd1bnl5UjcrdmVpcTZDalFiOXVxZHRwQWRW?=
 =?utf-8?B?N2NBYWFrK003WUdFOUFGc0RzQ0lkQWJQRDNTekZSOFZJZ0NuZlQ4UVN3aWYw?=
 =?utf-8?B?R1Iwbkc2alZnTU85RVlXSVlHV2hEajJzYkZCRmxySS9zV2RueFh2QWdNWGxz?=
 =?utf-8?B?Wiswc25KVjFQdUNKUU16RWhEbS94Vjl3aFVQK3k2aWhLUmlDZ0VuWnFZSGxQ?=
 =?utf-8?B?b1NRU1BTOXNKazVlVTl4UDRPTHZTTTM5TzRncXpFQzN2anVKVzE1eW5kcVNn?=
 =?utf-8?B?cW5sTVc3czdqNEorZVNaRlhDU3MzbEJGTGpEQmRLbGpHZnJrZ2Rpdi9ERVJV?=
 =?utf-8?B?bkFaUmpsNnFvWHRaTU12NVNDaHlvVm04L2VaSng0cWY1Q3NLbC9udnVBKzNn?=
 =?utf-8?B?L3RTa0ZtU0NKNWFXeTRFczJUZlJKb1ZvNGpCUW5LcS9KZHhoRlQ2ZjhSVk1w?=
 =?utf-8?B?UXlENXRpbllmWWpUZ0ZYd0dEc3hnWmRzUVJ5YzYrUkhWbHAzMnpnMDBiWkhR?=
 =?utf-8?B?WEN0amtXd1VDNHcyVHNxNjF1cFZ1Vm1pL2JUd2lRMWZqSmRhTk9tQVY0T2lU?=
 =?utf-8?B?VS9BcEwwUWZRPT0=?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 13:05:28.0757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92e05385-c189-4bd8-9388-08dd6df93644
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP195MB2679
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_060536_992873_ABE9BD45 
X-CRM114-Status: UNSURE (   7.27  )
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

imx8mp-libra-rdk-fpsc is a development board based on the phyCORE-i.MX 8M
Plus FPSC SoM. Add its description and binding.

Signed-off-by: Yannic Moog <y.moog@phytec.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 1b90870958a22e49355dd1f932bf3d84cd864b5f..22f05e6709fd60bef1d22a378cf0bd57090774d4 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1156,6 +1156,13 @@ properties:
           - const: kontron,imx8mp-osm-s               # Kontron i.MX8MP OSM-S SoM
           - const: fsl,imx8mp
 
+      - description: PHYTEC phyCORE-i.MX8MP FPSC based boards
+        items:
+          - enum:
+              - phytec,imx8mp-libra-rdk-fpsc  # i.MX 8M Plus Libra RDK
+          - const: phytec,imx8mp-phycore-fpsc # phyCORE-i.MX 8M Plus FPSC
+          - const: fsl,imx8mp
+
       - description: PHYTEC phyCORE-i.MX8MP SoM based boards
         items:
           - const: phytec,imx8mp-phyboard-pollux-rdk # phyBOARD-Pollux RDK

-- 
2.48.1


