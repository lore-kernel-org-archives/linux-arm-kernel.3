Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF3ED3B9A9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 10:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RfnSzLR/duxm3IUxGAlwn2fbzDVyLuSpyxsrAfEf0fo=; b=sYVj7t64uudFkjVMnQWj/JFL87
	1lZk1g6hOyo9C1S3NFA758E3WTFE/knvEgaDE7u7pZWGorf5GisPztdDlc88AWYg+IFfLxcVNXCai
	KUTaaVnDUFgPgCDUZGATRWsTHHb8U6YkBrkYkm+5umNldQ8fJzFRvmSaOTFBni0rILZfP2oDqBO2M
	ZE2U8Cx5PIum5KmVs/NKrNNeSqa3pUhuN5xdtZ08thcfv3zNYthZnKsKesVr6aBYinzspzM234D1c
	P4gF3hIH0vNugNocYp1shk0ajJ3/G8FD8fVn+5ORoNrzd0EJkgxgnBsZ9F1R06zRteH7366Dz2WtS
	aufu5Mvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTHFB-0000000FJS8-2lRY;
	Wed, 10 Dec 2025 10:16:25 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTHF8-0000000FJOE-1bgX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 10:16:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QbYeb2AhUoUB3RroLmJbPyIBgeQyXaC+4KRA2VbAekTCNDEa1uDywg+6sC9XnpKrE6HvvieCTnWl0PqxmI43M6owvPRUjQvZ0UfUpXtp7sd/c+Fig+gODcjPZz2RrNXNHfFGhgrT7Ht3KKzo3atOWrSpHYslhS1F5pyA+5ZCYjo64d2fsGqb7wKiDfB+utLuQs2QMtBeTYrjnHrhYzwA6ssZWZd+4+49x+d2OtKRSuJL0pEC07Yud/Wywj1jfWQuCKv8NSHAonTtkK7CCYRA6DNSiJ9t8lIgGcD9bd3VD6YDkJFAvbqkvtZ/fuua1JjXg3vtGOTNK5Ac7Kwuao/kQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RfnSzLR/duxm3IUxGAlwn2fbzDVyLuSpyxsrAfEf0fo=;
 b=pf/Xq4lhZz1bzuiPABK6gfyPNy8NKCLprQ4eI0SrNX0wupfNpkL67GW0O98tIVQ56GlyuLAMUpBbFj/KuJ/8ZhmsW5DNc1T6vBw9XP3qPf4qs8phYEiFvfDWfRfFFGJcttaHl8jhfwS8GMHJqKn8R/NPy7NnqgGj/Xa8w7i/SpjyVSbJoY5vwVmyrh0zYP3QOFioPwUWCZPqgeXi5SWg2iuCTfwCgepr6XCNCsgWvQO6c33s8A9SYB1oSmKDgOTs1ufkquSGBtAmajZ2qo/FwPhClAt/CBc7Udi41KlWv/vzAwT2nWoouQrYweklKnTiM3z9q12gji8mD/CmKrXobA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=phytec.fr;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RfnSzLR/duxm3IUxGAlwn2fbzDVyLuSpyxsrAfEf0fo=;
 b=Q11O0U0IOgYzyJB23uuytI2BctoNDP0r81fyoaymsiTpA/kiDpuuj0avqfsc9oLXF8AAQ6OtFQT2BSFHzDAiYDkBt7yIa+9HSELZvNvG77qFvngbw6TaSPBl0fqoJANcPzXh8vEsMaFK0d2pCeXgGWZ+Dq0uj9otXs1/bhKvdrA=
Received: from DB9PR01CA0017.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::22) by AM9P195MB1300.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:3af::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Wed, 10 Dec
 2025 10:16:16 +0000
Received: from DU2PEPF00028D09.eurprd03.prod.outlook.com
 (2603:10a6:10:1d8:cafe::15) by DB9PR01CA0017.outlook.office365.com
 (2603:10a6:10:1d8::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Wed,
 10 Dec 2025 10:16:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Postix.phytec.de;
Received: from Postix.phytec.de (91.26.50.189) by
 DU2PEPF00028D09.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Wed, 10 Dec 2025 10:16:16 +0000
Received: from Postix.phytec.de (172.25.0.11) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 10 Dec
 2025 11:16:14 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.11) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Wed, 10 Dec 2025 11:16:14 +0100
Received: from pc.home ([172.25.39.2])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2025121011161390-314 ;
          Wed, 10 Dec 2025 11:16:13 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	<upstream@lists.phytec.de>
Subject: [PATCH RESEND v2 05/11] ARM: dts: stm32: phyboard-sargas: Fix uart4 and sai2 pinctrl
Date: Wed, 10 Dec 2025 11:16:05 +0100
Message-ID: <20251210101611.27008-6-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251210101611.27008-1-c.parant@phytec.fr>
References: <20251210101611.27008-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 10.12.2025 11:16:13,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 10.12.2025 11:16:14
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D09:EE_|AM9P195MB1300:EE_
X-MS-Office365-Filtering-Correlation-Id: d5e93e3b-84b2-49ac-3470-08de37d527a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Cs4+tErpE4tn7aCztl/vR1VnAw37DGPzM7VY4XgoiDVp/wSVbXfHYLL/sj6x?=
 =?us-ascii?Q?UMJOi21W1dR0ypsWkWgy58TsQdx2C7ku5PlM2Kx0/bpPSg02JWOHJU5JEbJI?=
 =?us-ascii?Q?ET1p5DJRsZx5w9B0qHhSk5ShVegsrcfhDny7EG2ZvZj0/iuqjDwbJ1N3Z86D?=
 =?us-ascii?Q?XdyzKwLLMb57SAPims//SQh2ASIpjcWnAsqaNO2MhiOuGKPCJXTSbzZfKW3c?=
 =?us-ascii?Q?KMYvpjsRigbSNP888nUvoL/C9w4b8mOqfzws6nXIO23U0SAPU+Km5KIRdu0j?=
 =?us-ascii?Q?0LPHVhLFh5xikUkIfq3r/6tTq4kaycic4Dul06AzYMtQGh8VrOIPJuu6KEhv?=
 =?us-ascii?Q?k2N1WbCkgVzqkX/YcnRee6w3WenkccbJZPQoxFwpuBos0NLO4CtZ6SrD5Mpp?=
 =?us-ascii?Q?KusSaZ5T8LMCmlxrnzy5X3M6Ceu5QlXyh8sPncBn6xEtnimmQkrlXGIJM0oX?=
 =?us-ascii?Q?lNJOVQNYKC3MAUbFkPWoMMWFCNYDCEOMwe4MZoqIocqyc1WTQ8BrnXQx8WTq?=
 =?us-ascii?Q?/fuGofIBL5FTuRDlI4HWPMmMJPGZKXBrLh+aSzc5QbcO6+eCw/XXyOS5vu/R?=
 =?us-ascii?Q?ei7yo+ReI/FWdo7mR5DnbEqhdo6zh9MCUkqbTCCzFN44m18FHjZKQBhwoG05?=
 =?us-ascii?Q?lYiWNc4vjzYxdQE1R5sl4y5VF3qoS724/qJv/v8sKN2yhDmK4bbI3SseMzQ6?=
 =?us-ascii?Q?Magy/q23e9HGQ9CuUvZv39HP1y0rER0qNyBjE4uAGT/vfsWEGXR62VBOZJ1q?=
 =?us-ascii?Q?VszJFJx4YXpnhTUBDWWc5Sbh4s06wtD6ZdzhvsUBrRtwFwixGUDg6YgtfWqN?=
 =?us-ascii?Q?USN76bGDjq6AgaG/ojnYlFYZ87DoqHJaKneHDfJ/2BzOoantHGBvK96i4ebo?=
 =?us-ascii?Q?tUBojQcmLPlpkMt3OHyzXOom5pXg+z/62KZI+LrW4zLXXccQdjo+sk5UDy8x?=
 =?us-ascii?Q?J4W9cTRL6Kn716zRn+edn3ccEQXpOP5mxJ1Tc85aXkT0BQ6Wf980cCeoJft7?=
 =?us-ascii?Q?h4hP4Fd96sPCEHvEmRHhtt58cdRBER9+IKsQ1FwE1crtbZRe22q3f4Vow/pO?=
 =?us-ascii?Q?eTrChLY+J9WmAGl1apvmVuFkmKYD0gY7gYINFzWfpzUS5fn2Vle/eDapJekO?=
 =?us-ascii?Q?ZJpnO/A422QexDjdwbjW1vK6+/0ov6pM/y1YxBxYQpaJSv1ddtg5aF8s5Kj6?=
 =?us-ascii?Q?+CooazWdpco0mZJEAHmI1jPtQsBvEXcDFHwblnRUne2+JOE75JqQ+53OoCLG?=
 =?us-ascii?Q?CWQ2yYlnuLJUctEAdmRziUc4H6L9shWGPrvxpetykaecuxgmKjmqMZgISE0B?=
 =?us-ascii?Q?RTCxFuDiYQ+CdTKk/5/MsbV+sfQ1KyeILD7ZDhGcw9zuHLspgB1jS4KwvcYW?=
 =?us-ascii?Q?FKiVCkILw5aOYcLcOxLNKRw6f6gQOGHtVoLg84t15pYlAwmn93aKZpKiwsgH?=
 =?us-ascii?Q?lW7AnFCh+pMt9QvtySj4N3Xy49tOQN95JJiXbzCOCWC5Yw+rXfFpHUVHnMxI?=
 =?us-ascii?Q?OyrDI8PAuFqJNEkg2lOkhlFyV2b6dHgvizLSB3wceWIP1yu/aHCAzQwbLJwU?=
 =?us-ascii?Q?bix0wC/mg6T8PXDhOco=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 10:16:16.4831
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5e93e3b-84b2-49ac-3470-08de37d527a0
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P195MB1300
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_021622_421051_586615BF 
X-CRM114-Status: UNSURE (   9.39  )
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

- UART4:
  "uart4=5Fpins=5Fa" pinmux option does not apply here, as PB9 should be
  used for UART4=5FTX instead of PG11 (PG11 is LCD=5FB3 on Sargas).
  Use "uart4=5Fpins=5Ff" instead.
  Also remove "pinctrl-3" which is useless (identical to "pinctrl-1").

- SAI2 A:
  "sai2a=5Fpins=5Fb" pinmux option does not apply here, as only PI6 is used
  for SAI2 A ("SAI2=5FSD=5FA"). Other pins of this group (PI7 and PD13) are
  not used for audio.
  Use "sai2a=5Fsleep=5Fpins=5Fd" instead.

Signed-off-by: Christophe Parant <c.parant@phytec.fr>
---
 arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi b/arch/a=
rm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
index 2fdab99fc562..44f3aa1ddebf 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
@@ -143,8 +143,8 @@ &sai2 {
 	clocks =3D <&rcc SAI2>, <&rcc PLL3=5FQ>, <&rcc PLL3=5FR>;
 	clock-names =3D "pclk", "x8k", "x11k";
 	pinctrl-names =3D "default", "sleep";
-	pinctrl-0 =3D <&sai2a=5Fpins=5Fb>, <&sai2b=5Fpins=5Fd>;
-	pinctrl-1 =3D <&sai2a=5Fsleep=5Fpins=5Fb>, <&sai2b=5Fsleep=5Fpins=5Fd>;
+	pinctrl-0 =3D <&sai2a=5Fpins=5Fd>, <&sai2b=5Fpins=5Fd>;
+	pinctrl-1 =3D <&sai2a=5Fsleep=5Fpins=5Fd>, <&sai2b=5Fsleep=5Fpins=5Fd>;
 	status =3D "okay";
 };
=20
@@ -202,10 +202,9 @@ &spi1 {
=20
 &uart4 {
 	pinctrl-names =3D "default", "sleep", "idle";
-	pinctrl-0 =3D <&uart4=5Fpins=5Fa>;
-	pinctrl-1 =3D <&uart4=5Fsleep=5Fpins=5Fa>;
-	pinctrl-2 =3D <&uart4=5Fidle=5Fpins=5Fa>;
-	pinctrl-3 =3D <&uart4=5Fpins=5Fa>;
+	pinctrl-0 =3D <&uart4=5Fpins=5Ff>;
+	pinctrl-1 =3D <&uart4=5Fsleep=5Fpins=5Ff>;
+	pinctrl-2 =3D <&uart4=5Fidle=5Fpins=5Ff>;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status =3D "okay";
--=20
2.34.1


