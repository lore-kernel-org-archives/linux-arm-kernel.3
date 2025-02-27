Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B1DC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/GQP4wRF0C9Ayuoe88iWNVNtaLSpaAhjrkZfGNetWnY=; b=qB5h0/Y6Vy78y+IFSYB/sdwtsI
	p+bvJ/EHl8QbAojKFK73SOQUprvAuKf/asv5WdtI/xDXrlX/X7DYmUNZQGiV1pxkulydrAlc7cImc
	4UgSrwIzWwmxzc8UvBKY0GqJsOsSdzi9eWvomDHPfzuKSqVRWRyseYOzaDQTRROHWLqWGxW8vZYKf
	dm3gTbOCvkDThFyjKhPKDkf0QMDHs6f9poTZX1VXC2jB0g9k5IJFRjoHJZLDqTz2xS44U2adwTbwS
	jsedxZSVzmhtxrSFaZkzo5BXxL/xbIhaCS+TV2ivt7KKK2vR8Fn76mWxgRdd5YBLKkEj728M8Zqrh
	1QV7tKNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjhl-00000008UvJ-0xQ5;
	Thu, 27 Feb 2025 19:37:57 +0000
Received: from mail-am6eur05on20730.outbound.protection.outlook.com ([2a01:111:f403:2612::730] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnfzr-00000007w3S-2sLE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 15:40:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ln1d79ZcItlydhE6SdkR8VLixE/AC3u3gWKymlZsIZ+0GVPgsjIx0xbSxSs3/AdwszD0srk1/Ago76Y95V20MVmRzpkRps4AgoEiFVTbRm65EEQuRp/Wv1np4TSAi0pjukuZNfib16q52M5U7VH+DOS1bW3ba3mU1lnzZzd2UHXVDX+BH8e/pZWvUAxfJ72xDMcc9QGDiLHLXYV++r9KnKteewQIHqcN4RpmxWokzEk6911rNC9h1smHR7UVTkZ1k1A+zXmWeu3TaL0RDJ8n+r0qK0bC1nSP9EvruKu7hU8WWgfhVzo4UQIAqiFxxSiC1oPGhdHttOgL+Wx2G0dUKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/GQP4wRF0C9Ayuoe88iWNVNtaLSpaAhjrkZfGNetWnY=;
 b=duHXNfMj6qg3ssRDj6QwVDBw+x+AuHfsn48GFwkJyAWrCTosS+ls8KvU1mUbsT16PzQvfmQzdx7WNqtN3RH8+1iKVUBiHzMbjyOBb+QjevsbKVrLkaWJ6rzomxCCZlXTKQHZONb33xizomcyms35cd0pNU4jkaA7kujMvne2haFjZSxUirnRFMntQmqIgTiHS2cdbu1wrQPqlJ5BqYMX7TRuDSWUHMP1nS/ddyCJM0EEF8Fmlph1cZR6KxPr8ojNuFJGz7qoAIqsZmKqpvp+Uyx+WfVKSRqprzbuesXx6SfvsY2iLfmxzlKzq49gNgZhad1D8WKbRT87luYPCKb1jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=phytec.fr;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GQP4wRF0C9Ayuoe88iWNVNtaLSpaAhjrkZfGNetWnY=;
 b=Fh/blS96fo4r2mnpxFURgJBmaV2BLYITyvsn4/1XqsW4PkwRcQ1PFKvz1rIN6r4NVayTKoBaqEyWICbcwvVmtiNsxZ1xuiILmq9AuQLisi8hAYOffnFdbIfE4+/FI3u5MCaLrnE6YXyBg0+vlsIYRmbi5QwjcW9TkF9dcH0ub8Y=
Received: from CWLP123CA0079.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:5b::19)
 by AS4P195MB1622.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:505::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Thu, 27 Feb
 2025 15:40:17 +0000
Received: from AM2PEPF0001C70E.eurprd05.prod.outlook.com
 (2603:10a6:401:5b:cafe::42) by CWLP123CA0079.outlook.office365.com
 (2603:10a6:401:5b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.21 via Frontend Transport; Thu,
 27 Feb 2025 15:40:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Diagnostix.phytec.de;
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AM2PEPF0001C70E.mail.protection.outlook.com (10.167.16.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Thu, 27 Feb 2025 15:40:16 +0000
Received: from Berlix.phytec.de (172.25.0.12) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 27 Feb
 2025 16:40:16 +0100
Received: from Florix.phytec.de (172.25.0.13) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 27 Feb
 2025 16:40:16 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.13) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 27 Feb 2025 16:40:16 +0100
Received: from localhost.localdomain ([172.25.39.2])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2025022716401574-89 ;
          Thu, 27 Feb 2025 16:40:15 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	<upstream@lists.phytec.de>
Subject: [PATCH 06/11] ARM: dts: stm32: phycore-stm32mp15: qspi: Fix memory map and pinctrl
Date: Thu, 27 Feb 2025 16:40:07 +0100
Message-ID: <20250227154012.259566-7-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250227154012.259566-1-c.parant@phytec.fr>
References: <20250227154012.259566-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 27.02.2025 16:40:16,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 27.02.2025 16:40:16
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70E:EE_|AS4P195MB1622:EE_
X-MS-Office365-Filtering-Correlation-Id: f7b567d1-19a8-454a-b776-08dd574508a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TwABLNRTTvYwSy9hFfQIIuHA/hrDNy/EujfrR8qK1jTSlWVhqiA9+dWMI5Ef?=
 =?us-ascii?Q?+F2bVEuCxsnPX6ub8CBrDLHPPORqbFdcCqyli+CPAJuhh46KwaHzO+FnZ1c0?=
 =?us-ascii?Q?74ZA181k3EOD5rhOwAZnaF/E6mLww0MXzanKQHwCaq5BSitC3fBuGIH8oABR?=
 =?us-ascii?Q?big+HnJs1M+IWNEpm8GjEoEFrzNgZ0yRVKhWtVaxLWeH9pLfEJrSWwaDQWni?=
 =?us-ascii?Q?2o25tDTNDt0y4GUForTMCiZ2lz/Kx6MBsZywN+TTd881PPeQtbtEvpk3ZLHD?=
 =?us-ascii?Q?d+eYbiJerXOXRIS8vzA4iDgHE5PkoRF14ZHwrXBx1pU5L5cQ4NHR1VSuIFay?=
 =?us-ascii?Q?co12K3q2RNfBcy/m8P1LOVx1socNE7onmScxQThIlFhojXLh3ONFP+zaHOyP?=
 =?us-ascii?Q?cyZhenZ+2CslnhsZWZjxw2KtCGC4MZ79gu21CN2+Mwynoi4udpmrkRbNJMJr?=
 =?us-ascii?Q?ilpYp2Ov53LDku07nxqPhtRB+4VRw1wXHaEF1fXs8E5NYDvmmqK1Ngpo649R?=
 =?us-ascii?Q?oIVXUNmKW3IKi3xISovP6x5Wi7zyJFW6Rb/StyRCrkhMzceY8uojxfdqwxuA?=
 =?us-ascii?Q?AZ0q9Frd/mRu8LQILGqwvtiLr21XJi+aj5FtDP93V2LFf3Fmb0nw8j+g7Hcm?=
 =?us-ascii?Q?HSBq/r2xQSBVMp+7P2LwZUJb9Tz8tnG0jEYiMqIzrMYrnLAFhxt5WjqQhIYP?=
 =?us-ascii?Q?lSm1wXUcgeZMmhx7c6n3o8HX/hqpnOcp1iVngOpv+OPX/rAuFWEQFVG5WRIh?=
 =?us-ascii?Q?540Ntg4tbVWG2cAHkvX7pPQvJY3w26KCmqwmBM8O33sPLe8cQvl1kihezAMZ?=
 =?us-ascii?Q?KhvBx7ozH0+hXoLz0MP09wP6NK9orvAn4zoET9J11g30N4ae1n+anKNIARiM?=
 =?us-ascii?Q?yWMSiJq28ex3yngos01NeqrvFR0mx+/DG8/chhl3eZVuj2IBiR6LXkKMM616?=
 =?us-ascii?Q?d7SVFheAyWKsRp6eRzEtUn11vYPXMtdXKv/um5Y3LgiMOChc9NZfYebiUqr2?=
 =?us-ascii?Q?0oD+CbGGqAzybkGPjwF95Gufv3pUPSRuWexgbLqLTt93GqN77qDFtQqnGbro?=
 =?us-ascii?Q?u/cUvTWUhPzHwdhqB0jxvFza+cLVeKpSv2BDNv0ZkpgO1U4O6huogX8aaTTn?=
 =?us-ascii?Q?ZibcS+KRPOrxwJ1cTPmke94Xml3YxCV0cJhVF88mXhb4iESn7JCyIXKbhY09?=
 =?us-ascii?Q?8kNiR2XxA4rjG6TyoU4WxmQ1aCKezkqwcMi11/gZdMPXIu54tDSut1Gt8eDd?=
 =?us-ascii?Q?Bnf1xzZ7pJROveIFMJQF/LJtgq2Gxn0317LU2vrk7pASnzUDiAvZ5aVph9VF?=
 =?us-ascii?Q?BhLw57FhJCmH8OHYiayCYCCnN28Fz/NWuTXuFMUjKsUKX4B6Gba2sdN60RDT?=
 =?us-ascii?Q?+fCSmBSZ42Djdcq0pG+HPw5TqVpTs1qSz4kGYOzxbupRI1YpiYwnKvxgRNZ+?=
 =?us-ascii?Q?vvB8Mav6MYDKmZHzb3mz5XWFP+jNOwxCxWwNou50M3yIFNl/ZFHiN6p08180?=
 =?us-ascii?Q?1ZhbWG/jIc1Pr6I=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 15:40:16.5578
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7b567d1-19a8-454a-b776-08dd574508a7
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C70E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P195MB1622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_074023_725459_221A242F 
X-CRM114-Status: UNSURE (   9.86  )
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

- Add missing chip select pin group in pinctrl.
- Overwrite the memory map to the Flash device size (16MB) is necessary
to avoid waste of virtual memory that will not be used.
Without this modification, qspi probe fails because of ioremap error.

Signed-off-by: Christophe Parant <c.parant@phytec.fr>
---
 arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi b/arch/arm/b=
oot/dts/st/stm32mp15xx-phycore-som.dtsi
index 660cdc260963..72926c3de52c 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi
@@ -290,8 +290,14 @@ &pwr=5Fregulators {
=20
 &qspi {
 	pinctrl-names =3D "default", "sleep";
-	pinctrl-0 =3D <&qspi=5Fclk=5Fpins=5Fa &qspi=5Fbk1=5Fpins=5Fa>;
-	pinctrl-1 =3D <&qspi=5Fclk=5Fsleep=5Fpins=5Fa &qspi=5Fbk1=5Fsleep=5Fpins=
=5Fa>;
+	pinctrl-0 =3D <&qspi=5Fclk=5Fpins=5Fa
+		     &qspi=5Fbk1=5Fpins=5Fa
+		     &qspi=5Fcs1=5Fpins=5Fa>;
+	pinctrl-1 =3D <&qspi=5Fclk=5Fsleep=5Fpins=5Fa
+		     &qspi=5Fbk1=5Fsleep=5Fpins=5Fa
+		     &qspi=5Fcs1=5Fsleep=5Fpins=5Fa>;
+	reg =3D <0x58003000 0x1000>,
+	      <0x70000000 0x1000000>;
 	status =3D "okay";
=20
 	flash0: flash@0 {
--=20
2.34.1


