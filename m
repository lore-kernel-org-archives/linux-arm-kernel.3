Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4B0C83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 19:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/GQP4wRF0C9Ayuoe88iWNVNtaLSpaAhjrkZfGNetWnY=; b=jc14hL2O1AHHQG7BsTuG8J4YYf
	iz3+m61woKm1s2JgN8bRT0uiSeDxEUiOdKMX8VgemthvZbQV3rO7F4JddOa6d82PYexWTVNVMTzwA
	qNf079vbjXlWrDe2H3/URXgaECNFdjhzME5iHiNQZMrCaw+j1/aMFUU/8T42y/0dPlRo/j1g4sMl1
	/hCbnTzejBjkLm9mIutYSHV/LQ2xeJZVjczlxBBJF3e/fRnmVOYGmQyTxH7FN7oC02XSczAKgfAz6
	/K6fQ5m19gjokh8WIQ6n0GqpRuW/TU5zBLGMgMromotf1srrOrhmV+M22pvI37tKsISS1cxBcau5/
	FdkFxowA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZa5V-00000009cT6-1sJG;
	Wed, 09 Jul 2025 19:04:13 +0000
Received: from mail-db8eur05on2072a.outbound.protection.outlook.com ([2a01:111:f403:2614::72a] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZWRE-000000096wl-2KUm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 15:10:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oJ0k3tiupjzcTrwhiEvWS7vaD3BkK7B251KVya0nzE4vvjEk3Vbt19CSKYjjGfZu/JSr1y9XBJ+7czrJlx2NRpB1TIaFBATZnnBRFjo5pgK3HvKsrQOp7BE3V4jYYTKjnrqrEnE6SGLSNVsqgsBeWY6Y6lQsEMP+Htix/VIippJKrmXhjeAGYK3oDS4ubDB04xnlDX1FOHp7K4WsIpOs02fEzAnxUwpVONAKYxFgDhXkO/e5qmppNEYumNaClhMb16EpUVC1NvkcNBzvmxM/tG+BVv6ji8RdUZAzajbWrHGLjZkxO13Hicun5AYC/EqQ9FNkRJT5qTKluJ3+taylJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/GQP4wRF0C9Ayuoe88iWNVNtaLSpaAhjrkZfGNetWnY=;
 b=KHTWO7xVYa1tyJZwNqUvnl+qWU1wfGmypSI57cLgXab5tOq7OOFlTwbBMOWvvvtniK4wqcLAE92HODN+z1E6/EgUmi2E41wjdcwaUkXLDIHhVuxN+l7Lot6N03E2WA01cjcgl7kHpbPtVfdgwG5ss58GPDGYxUuGapUTNYqmpg/INhMTOyN+MiE0QI5NhmHMJZlZMdnm6zkLRiNEPD+iZDFicwT6NVhLLWqzkKdJAhc185YxWKnVhuKAHoGo0pVAPxHJkRzFgTMwPH1c2KYnBrweDWcXFnDMBbiFAhmmD0D0Qkf7Jx5QNyXAhZQvs7PpA6I9wzxUY4YVSTO9NsmXEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=phytec.fr;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GQP4wRF0C9Ayuoe88iWNVNtaLSpaAhjrkZfGNetWnY=;
 b=fHiaGe6eEEmN/TChnsze4ikIn0duMe50J7caNQx8JHE2ztpNFmPMfpj+VUjamfVN/qjy8Tg6PtT7PxLz3hj77509FDWAzuTdFNLERPPZk2F1Ig5p1ChBG794yez5GpxkoUVA+Xi5fovF9kEdXi/a5ydTD0y3Tls9iF4/SP94We0=
Received: from DB7PR02CA0003.eurprd02.prod.outlook.com (2603:10a6:10:52::16)
 by DBAP195MB1018.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:1c7::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 15:10:19 +0000
Received: from DB1PEPF000509ED.eurprd03.prod.outlook.com
 (2603:10a6:10:52:cafe::f0) by DB7PR02CA0003.outlook.office365.com
 (2603:10a6:10:52::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Wed,
 9 Jul 2025 15:10:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Diagnostix.phytec.de;
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB1PEPF000509ED.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Wed, 9 Jul 2025 15:10:19 +0000
Received: from Diagnostix.phytec.de (172.25.0.14) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 9 Jul
 2025 17:10:14 +0200
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.14) with Microsoft SMTP Server id 15.1.2507.57 via Frontend
 Transport; Wed, 9 Jul 2025 17:10:14 +0200
Received: from pc.home ([172.25.39.2])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2025070917101412-212 ;
          Wed, 9 Jul 2025 17:10:14 +0200 
From: Christophe Parant <c.parant@phytec.fr>
To: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	<upstream@lists.phytec.de>
Subject: [PATCH v2 06/11] ARM: dts: stm32: phycore-stm32mp15: qspi: Fix memory map and pinctrl
Date: Wed, 9 Jul 2025 17:10:06 +0200
Message-ID: <20250709151011.366537-7-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709151011.366537-1-c.parant@phytec.fr>
References: <20250709151011.366537-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 09.07.2025 17:10:14,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 09.07.2025 17:10:14
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509ED:EE_|DBAP195MB1018:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ee9cb31-08c2-45ac-3281-08ddbefab7e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?r35Cni6xYYgYUrIvGFw9fokWLaBa5otAbB0ElL06Casu8nFqOOEpcqmpkFOT?=
 =?us-ascii?Q?juvPojExM4XPBXce2tkPSnSgzc9DSLfZfFTamnCgjnOZ7C9xPnGos+ZM2PA4?=
 =?us-ascii?Q?yP4y5i6OS2iNP6ldvRPo4NhhPPfUo+j6GRi7xCuXHGRqzYTCWIYBd1zm6ui6?=
 =?us-ascii?Q?l8uRQg84SIWEgmfpCix3qe5xGJjLS92HPDm1F3TmUgdFap+GX7jmfMgbLSAi?=
 =?us-ascii?Q?YznBnkVA5DCdWp71OdfZIRUEQ7DsQ5pjPY/wH9Qrla3mqMzrhKrZgjGIeWta?=
 =?us-ascii?Q?y74qkV0cObCGhpc5SMe+GLHp3aATTe1xlsWqRNinrnLcxuAdPZ7/tuGHuAHk?=
 =?us-ascii?Q?YdcYKTSjrByfboF+v+IUPcsbmof74z/6+URdOW1GsuC/WgDb/t1+KhEeqYKV?=
 =?us-ascii?Q?tOWDrKKkYtdA/g2KeREiVv4JI9h9HM2gxsHXHRD4NP3ntM0VEobKY9Ht//LT?=
 =?us-ascii?Q?eN3ux/YaGGTa97rB5RWA8gIL1IHfMjG+5qrw5+GoUdDZwGtcjavIYvQCYpmH?=
 =?us-ascii?Q?rRmCgfA/V0sls4DSHT5cjOvn+7qkSCqHrHMIJSsKhz1AXKyEqbYqofyuwEdE?=
 =?us-ascii?Q?JQtx3JceHzw9R6tj0ID6WiAKqJ+tKIZGufTiYkiymxegSnFaEAgfUd0SChzN?=
 =?us-ascii?Q?A9VHNF4Slddh7mZ+2xH8aw7C4R/QlrYycCkaNpJzhUJAC/lTicMcBPTh+8K+?=
 =?us-ascii?Q?4C2bOv9WLQmkf6wXnIJHtqs9PQC7TKGtG0OFg0eFcQoy+kOBH3ELzBGkEeWq?=
 =?us-ascii?Q?okfLPvzMd+Oxv3dLIYa8Mit4GXSquWgv+JXR/9koB9FuolLdklqUAVX/Ofvv?=
 =?us-ascii?Q?kwfmF9eLDw9sexFTrRPL8+asBBi1KT9U6baHMSkObL7Oiw63NuGMu95jtmf7?=
 =?us-ascii?Q?HGlYZMJCcBv2em0U7xtFZyMIuzLp7N/GuNyUIHjr2uIfNOMFtfnzHKDMXAKz?=
 =?us-ascii?Q?lZaOKITu6L/L+1Ts5Q6bvmtjhZFHw4Un/TCsqkyWaVzGeTFB9Tmf1jCoUWAJ?=
 =?us-ascii?Q?I3M1WeObgFlQ6OMLWGc/Q1v/Lzv0aW1MUOEc1vINT4Q+1NlW+t/xHbp7Klj5?=
 =?us-ascii?Q?KhJf1+9lCOlZhklJMpLE45LNaRZFlGJXNj83eKoIS2/xH4/Hokfxeb6ZDRzM?=
 =?us-ascii?Q?61JiYQ+1+GjrxIYvk1GpvJFNcbJtvKNZKk49ozcLMI2QlxHXVshFL1lz4B/D?=
 =?us-ascii?Q?ZPKunwW6a0NsoNKxfioZ+siOQXMAQusLNs/fbRfzqsqsZMl5LNCDqeGEnKAn?=
 =?us-ascii?Q?GPfOm9b71x08M1lZoVpNCTVxHVz7xVtPSOdPMMLjqU9rhoj6XvIm342oLN+J?=
 =?us-ascii?Q?0u8PX2g7xqhFxjoo8QEt/wLfHLbg6SEQDlAzdsqimK4KXFUhi7rwyu79s4fD?=
 =?us-ascii?Q?GsvJ+UkONnOALiIG9Yn66uzqPypzsDrKxqU0mdddz5IWi19UuAX2c5yvgrBK?=
 =?us-ascii?Q?tSWQCbiayMihFoGoCMUcK/8v/gx8g8gJktaxiP4PHhzBnv8MU53o012dY4wo?=
 =?us-ascii?Q?mXOJjuU5Y5v7yMMC2lPs3NVN9b3ZAfKmu4Gn?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 15:10:19.2371
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ee9cb31-08c2-45ac-3281-08ddbefab7e9
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAP195MB1018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_081024_592105_32DD4BA1 
X-CRM114-Status: GOOD (  10.53  )
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


