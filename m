Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CA0CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 00:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1Po+sPg3iRBdm/xK4kD4qr72SMpV78K/Gr58Q9zZ4UE=; b=nggMNQ+LxKx22NbBUt1d/BmCwQ
	MpeWPSni4w71AtlGWIEu90fxqUEvZIZCTLVXeKyADcH1wX4Qdsgix2QqZUUFluYBfir14AiW3Kea0
	c+TLV1uyCzGodAfJa8ObkGPlkdrNU0is3hdHV91coPbpI6wiHX+W8/ImgisBWc73f57Ep6yJA0RTm
	vitVsOrC7GERP1cTDhaqR9M7gQV2HgUsluCh4ftbuTowrBQriLE6hntNBSoYPPcf/BRPzmEPF5gO9
	zgj4ZvCcUjEoQhwRfvPdWbnKtU2lQT6n0895E5/2DFtX1jZCfmR53wdmkzc57z2cDcr306AS6e0X0
	6EyRSU4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8SpJ-0000000Epmx-2ydM;
	Tue, 14 Oct 2025 00:23:41 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8SpG-0000000Epmc-082A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 00:23:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TjmW25r5juOuDFN9PS1iFTFPJ04eAc7o5a6tt+eEHYyWVNeEhsZEhrwEASrXpg36R5bs52VMGqHIPckJLZd9lWgTsbhZL+EO5mEnEjViX4uYid6zddKawxSNJTnaN4m2BWBD9WwRFWLZfX0QPe+6fnCATC7zjz1AUvc5TVDB3nns+6cq90fEQr/NIVWJ/AUZdKpCPSAuSzbPcYeukOsN3wnbuN6UMp+OzAnbI5nd/M9rG+2VKyCLNOaOJsXssUAwZn0CW2N+CJe4kiFy3FqUgHXPdaGawLl5K+UnqPnX8srdgB6T4U/JKFM74uAhxv4ZwGDVcnmPliI5CNBDgB6Tzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Po+sPg3iRBdm/xK4kD4qr72SMpV78K/Gr58Q9zZ4UE=;
 b=Qsu6F8kH/FD1wHZ6hg3bPH1DFx/XPKNcO+FtimajTBx4DrxidKZRaT6wuT+ArH14HuZ3tzLLOZ1LHtYl4ao5x8azP1PK+ZZ3+K+490nzEccnahHG1wzEji8sUcKs/rIxDRFfwYGyT4XrJASj2P46XofiSVMz9XyPTuNBOkJT2jU87jzLUMOK9G4oIf8LDnHLdR7gLL05xTF/8/OTRTwA2CCffw0nzOq4EVn6J7IIMuMyXf1ZxYL1Hw897K1gAfA4EE3sSkYGn2SbG6aX5auuIC2sOK/KG92eynOQxTWisRtsTA/S2xlI0DVN9Yn1buYM8dvGOAAuRVX6uq1+cY7n+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Po+sPg3iRBdm/xK4kD4qr72SMpV78K/Gr58Q9zZ4UE=;
 b=pu86x6Ah+QQQcifxypCgMxZmCAOIsNfw08s8U2ql0XOp5CKKh8SfCsoA2bI0a18+A20JJGV8rri+IH4pgHNAG5XTvnYi+Tg2Czw95NgwtD5wPp3j0+ZJK15sSjrmpRiNe2eKIGHB6tGDxjWT6baptaHLiy6uVh2PWbCgkMO06nbThzMnBCn5g1C1NBC6uLPtnbEPIAJVgqoMK3sPnVzQIte9p9ENVvl3htL8BTbbVopqUT1djqmdVXvlKEFM60d3c7EyUyNNucOja/tnoH5CE+Me595CdeZRiW32oxQlSN91DP6bGJegw/H1vHKr7iWw77HHe11xNThmlEaEmu/bpw==
Received: from DB8PR04CA0026.eurprd04.prod.outlook.com (2603:10a6:10:110::36)
 by PAXP195MB1167.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:19a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 00:23:31 +0000
Received: from DB5PEPF00014B9D.eurprd02.prod.outlook.com
 (2603:10a6:10:110:cafe::d4) by DB8PR04CA0026.outlook.office365.com
 (2603:10a6:10:110::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Tue,
 14 Oct 2025 00:23:31 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB5PEPF00014B9D.mail.protection.outlook.com (10.167.8.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Tue, 14 Oct 2025 00:23:30 +0000
Received: from lws-haller-privat.attlocal.net (172.25.39.212) by
 Postix.phytec.de (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 14 Oct
 2025 02:23:27 +0200
From: Dominik Haller <d.haller@phytec.de>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <upstream@lists.phytec.de>, Dominik Haller <d.haller@phytec.de>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] arm64: dts: ti: k3-am68-phycore-som: Add pmic label
Date: Mon, 13 Oct 2025 17:22:40 -0700
Message-ID: <20251014002240.85045-1-d.haller@phytec.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.212]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9D:EE_|PAXP195MB1167:EE_
X-MS-Office365-Filtering-Correlation-Id: 2478cdbb-d526-4647-d6d4-08de0ab7e6ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Thqw6ZV4XQxhh7CXebNVjDCSt04zcjWwMx6/TJnwTGBrgLvvQzMRefzihta9?=
 =?us-ascii?Q?DV6K+Tm3gMdO7OmaV0CYfYcRCRadEwylzBk82ou51bGECkMrWmDXTNgo9dpQ?=
 =?us-ascii?Q?TSSyo0ryTl8lTyZmaSWfkKyl35ItFiDiu97J8lkkLYMJIMR8Dy1G7rqXIDUg?=
 =?us-ascii?Q?2H4EzjJFRlFE+iTrkeUE9ZfJm9OeJB+Id1ALz+nj8touVvXQP3Nr6RSPHmuL?=
 =?us-ascii?Q?Wl7KVeWvltqhAxfmKxivpdyJ1XJvRrYiupF/hNdL/VkJPDFW0gLalR+cy1/a?=
 =?us-ascii?Q?SdT1mZQHbrVDDJXMgGjGrmC6DcPpYhJYVL6+E+K+m0XkTLtqsWerxD1vUbNQ?=
 =?us-ascii?Q?HVRgrU+LHJc+vvbOZgKEjwcTEF5FYUadqvjOAz11SxrfkZKyYmIgwpj5tCqN?=
 =?us-ascii?Q?fKnWOGFwVuVNy/9/aXHcPPHo6NV9NuhWSvOP2Hug4EQGK2/Y4IjkvFhxfE0Z?=
 =?us-ascii?Q?IcEvMXgftpKUuEGZNShER+5HXQNpmwkxTRSr1XiOlrA8ou+Su9R9avhHLnBP?=
 =?us-ascii?Q?wKzGWVg8jlxvuzLTRXIGpnGdBEAxo8Rsi6KrufypeJfLXMtyR+9Q+8jznRnW?=
 =?us-ascii?Q?QL1eEC1toecfmY0hFrCSK3JP4/nbt4IuVwUBFRvnfNz7/tSWIEaoQn+jU0c9?=
 =?us-ascii?Q?rwjWE1Qg6U8QstLfgW+XzM4Csg0dH2cbGryO3pU5XU0XoX+xKUdBtsRgQQjN?=
 =?us-ascii?Q?LshufxkbydMi+A6WdccL5lDNTQZ9JnMExBdQkHOgnV6R4ia0T1GPotn94X+Z?=
 =?us-ascii?Q?YBh435dknk7I39IsR46nzH+/9SkekrZwu8RVqEtlag8M3YD2rI7iwHJGXlIO?=
 =?us-ascii?Q?dj3I/1hEPQuANzsxtTXdFZAIfgQJymFr0n3XOELE6yvuf2dIdNrTJbAkwWIs?=
 =?us-ascii?Q?AA7IjCWy4jyR9ujrcrNv6oCV/jRbKgqgGlqrd5D7xmsZY57636B2XGV6nD+D?=
 =?us-ascii?Q?CG2WoQzH31apGtltaaxT2PyvMNugd0EDgqUll0vbEUA/zVNdgf45B22lG/VH?=
 =?us-ascii?Q?ddYBCTwQi9vUb9nFTrqoi8314+YJNhDXXsziNtSQIWa/Zbn1Ful+6A78i7BY?=
 =?us-ascii?Q?ac/E7A/cK2FDLKhWDKOw3RqU31nddfCetA4Ix55uehgGUMrepN+Q/wxKiz32?=
 =?us-ascii?Q?lBdVVellqHhrSfximW/QX7jmAqQ4sXu40Krx8/OW8RH0wpxataxjGb0BnkxX?=
 =?us-ascii?Q?QX1jBwkFuPwo/YDl7Kc/gaN7kcRNb/EBIEo8gm9cE0gP4w7G22T6xmnjEuHa?=
 =?us-ascii?Q?UkyCUXah5sk+YigyZADf6iazZ4n0mW//Kj/mTri0T706vC6u1eD79hfyYOcY?=
 =?us-ascii?Q?RUPJPOeLdEVU0OW+JOEB7XZM1WizPBh0C4BqtbhRsIDpD8OM/WZaW9UICwoC?=
 =?us-ascii?Q?rPNNK0yXdRw//nLlAv58VUVFluZqDapqR5KqNg+Q8L7oLcpTjr3Pq2XJDhwn?=
 =?us-ascii?Q?otVp/x4b5q0uq2SufvmL4VJOh3bOOLnmmBLcpHHjht4bVD3Og/GbxTaL6EP/?=
 =?us-ascii?Q?cPNNUHXnlQXSW9jBP49hniuMFyxl51CJc///ZR3muP2HG8XLCJEPAVMuAkT+?=
 =?us-ascii?Q?yyY003BJX1Gmi/EN3FM=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 00:23:30.2145
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2478cdbb-d526-4647-d6d4-08de0ab7e6ee
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B9D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP195MB1167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_172338_786026_CBFC85B4 
X-CRM114-Status: GOOD (  10.08  )
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

Add a label to the pmic node which is necessary to configure the pmic
esm in the spl devicetree.

Signed-off-by: Dominik Haller <d.haller@phytec.de>
---
 arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi
index adef02bd8040..10a7eddcae4d 100644
--- a/arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi
@@ -258,7 +258,7 @@ vdd_cpu_avs: regulator@40 {
 		bootph-pre-ram;
 	};
 
-	pmic@48 {
+	pmic: pmic@48 {
 		compatible = "ti,tps6594-q1";
 		reg = <0x48>;
 		system-power-controller;
-- 
2.43.0


