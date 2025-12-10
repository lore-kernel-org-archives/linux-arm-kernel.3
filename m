Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D364BD3C52A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 10:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eCpGj14y8qnWzSxrj6VdBuo5/QZItUYGIcekqKER1Go=; b=cLmkMerQ0+3eOCIyod6gg34DG/
	2Bqgu3uuXmD806dZ7IrNON8cR2M1bHC2CNJvy1vpwa/JVJBmJEJ4qtQMGgmvlIgObbJnRJ+C4DRLp
	A5ieRVL/Z5FEB5h8p1J8qVD/XkNg3uhUv2yJFsa+H0xsvR8hiPw9naJQ/ZbDxb9OS3b1anuwBzaXR
	zlGxM0oamEiS5PImF/MpSsWmCigdfvrKCLC77j0mrF6b2XZbObnIknQlN27zt/38dhFRXtrd5rhuO
	rUJRZ3NU5BLKQ/OPhIKihVw5/UVKyt04b0AYBDPmhwo5Jzjpzy7zpSkyOPRR19Mt5WjzmOo+wODRc
	fqgnjygg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTHFB-0000000FJR9-1CBI;
	Wed, 10 Dec 2025 10:16:25 +0000
Received: from mail-northeuropeazon11020115.outbound.protection.outlook.com ([52.101.84.115] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTHF7-0000000FJNT-0Duy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 10:16:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hdz0j02cAYcYVo0/6NKwb/zKzxPxaWSrQ9FRfONq0GLWrHeqPVpgiC1FIIi6YTGaKkvd/LGirkzAwSM9l/p6cYwBJNhgENkWLcujs898dpO7ZgWqhfNppwAYpl4zQQHfTL7x3b+WpjpBzQY9V0Lv4+t9Y/oug3CX7MQwF3R5a2ry8EIdBKE+eft7/v2p3Q+TQ4Uf4q67u24Og9H3dsLNLmKDJsoVbeQ4yphKHbAQljXlQkyRxJctI70QrDAOZI23yptYzMlvGyzyBZO+tMQO4AKcruL2Ul+bWL+JyOzq7Q8m30ef3DOrgkNK41oqRE3Kwj4PwVGl0RLwL5NhNyiWtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eCpGj14y8qnWzSxrj6VdBuo5/QZItUYGIcekqKER1Go=;
 b=kZplxndKw8pAWD3yP1iy7blWYiJnEkJT/pebcexiHYEQwQWEDXxJT+QOKuTVcO9cHusxQZ1kTPAzi6kGgOxFNC++DV/KYChx7MasZIW4VsEyKJf48zAIQPu7aa8GEvnzU/0SBmPhHDwh7YKgsQA3s06DOa7YRsA2Rv4GJ9B4bSfFtDXkWYoEsksYxO7zAc/V5BGcpYOicDyFwPFoiOY8g/Ro5BAXpgp/1LZN7T9+2agdz89NDuB2g7G4Inl0xALLIKFwYtdz6QUx3oVipW/rpTDf9WJkfOwFdD8TwX7554j/7aNDH7RtPAFT/pBJZLph9UXHGEtAJvpELYT/D2/Ekg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=phytec.fr;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eCpGj14y8qnWzSxrj6VdBuo5/QZItUYGIcekqKER1Go=;
 b=AkjEsIPLzr4EVAsj2nJAIQDAKtslNaZ6rziQco66XH2HaRWQpHe+qm0wgr4jayiRIgGBM16us6Lk9H5gGRSwYkh5KMV7qPxCybpIQAffDRazvQmxEWRhYJ8/AYP9HV2y5anGvMpgwu4qbDgQ8aeUZioU7dXDHF+Yg2iUhzIRThM=
Received: from DB9PR01CA0024.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::29) by PA3P195MB2844.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:4d5::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 10:16:16 +0000
Received: from DU2PEPF00028D09.eurprd03.prod.outlook.com
 (2603:10a6:10:1d8:cafe::d9) by DB9PR01CA0024.outlook.office365.com
 (2603:10a6:10:1d8::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.7 via Frontend Transport; Wed,
 10 Dec 2025 10:16:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Postix.phytec.de;
Received: from Postix.phytec.de (91.26.50.189) by
 DU2PEPF00028D09.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Wed, 10 Dec 2025 10:16:15 +0000
Received: from Postix.phytec.de (172.25.0.11) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 10 Dec
 2025 11:16:13 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.11) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Wed, 10 Dec 2025 11:16:13 +0100
Received: from pc.home ([172.25.39.2])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2025121011161348-313 ;
          Wed, 10 Dec 2025 11:16:13 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	<upstream@lists.phytec.de>
Subject: [PATCH RESEND v2 04/11] ARM: dts: stm32: Add new pinmux groups for phyboard-sargas and phycore
Date: Wed, 10 Dec 2025 11:16:04 +0100
Message-ID: <20251210101611.27008-5-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251210101611.27008-1-c.parant@phytec.fr>
References: <20251210101611.27008-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 10.12.2025 11:16:13,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 10.12.2025 11:16:13
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D09:EE_|PA3P195MB2844:EE_
X-MS-Office365-Filtering-Correlation-Id: 41fdaccb-e344-4ef5-6e63-08de37d52751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?T2Iw6cm36jr/FILbLXI/8bgqt/voDTuTzF3a5m4KFMQ0rnzHx7Om8RdnjPBP?=
 =?us-ascii?Q?gHNsKrQoHpLE7JCsFSXB7iZnuenyYBvVyb2EEPTQxBY0nnd6kYqj85gEoBe7?=
 =?us-ascii?Q?ys2Ak1M6dHJbCPxRF6hqV3FBz5iwu158peNEz5U2MvVd7sczH4h20lkaCo+E?=
 =?us-ascii?Q?qqnNOZ5DRXc60sqD+Px0Xzg8MHISiRGiTO1URwwb9isBgAs8jFCMElUKtBwZ?=
 =?us-ascii?Q?ryVI6UVJ7TapvPDDmL5B98HgO7rQ31lbUFAsimn93T3Xjgtq2PiTl0d30eYV?=
 =?us-ascii?Q?ndmXswYNzUOv1rqCrmXKtaXhIslFQ9ecOHI44gWfAnpkJsSf4TAKX4KUP8it?=
 =?us-ascii?Q?72nu7L4dSPvuAKzKdkopBlYeXat8jw8VfOHpHhEhlB9CyRPvG9DnoV5Q56Ao?=
 =?us-ascii?Q?CcO1Dz7b8FTH1cmRfIWmMrDURQZ3eH8V/TVy5ZAhOOurhd9jL75RCeeA7V0+?=
 =?us-ascii?Q?mht1TUOGkBRB9GG9EnuPPSzlRSy8Lnx+XC/UyUeOW4tTIiTcoFicJV4jKW2B?=
 =?us-ascii?Q?CO1gH6GzWgV2AVS7IyTnCv+BUBY/lP5CIjgFtMtwdGnJB2W8RcRcjHncdC5R?=
 =?us-ascii?Q?cxcvTqoil6ukG/VRuevA4JeGpy65541aNNvBYqfSUXqggYwZyof3JEg2A9y0?=
 =?us-ascii?Q?rhRrRm1FIasSxcTE1AvCxyrpZZOLUx0PtyajIIIqcO5F+ubBuRlxclJI/JE1?=
 =?us-ascii?Q?QpSk2dv1A2M7op0CZbvGv5hpnpJEITeSnhbkcbEFf8BQwFyDVEgYcSi6lJMH?=
 =?us-ascii?Q?HjqMz9xrHNCbx87O68Ukx7Vgnz43ZW94dxQzD87DUC1+rjy95VQAQiC8E/vV?=
 =?us-ascii?Q?jM7YCqhklPPihV4XLgDPQGIMIKj2PAbdNdrSuM0g1aMmVF88p4WhCpy4lUSx?=
 =?us-ascii?Q?8pg65AYftSKY4ck8VfoAVnrHXbGL4LhljY4D0gNMKePPUqvMpfjRHHhpavhj?=
 =?us-ascii?Q?jRQW+poVQ/9vwhMWcUWl9G1vNSHjuowlCAAl1oNYU9sdJqEsvD2zuZHD/Gvq?=
 =?us-ascii?Q?OBa2P0/9D5m5TZj2Nr+98RimZAgiQOJrB/hUFu1B7Sqra6oukddTD3/ltXWo?=
 =?us-ascii?Q?/EQdQxS4UOvOIuHcW7w5Qpafmp4iLLyvXMu4XPyW5SRTr7m+4ec9ddQ+J/W0?=
 =?us-ascii?Q?skleVsWFVzmDFq2jpjqlPYLvOi/+VQqVxIErc7oCxMwa9PbCS2h07DddZ0kE?=
 =?us-ascii?Q?pH/XmwSr2qTE+7QOJW+Dji4zgohDje/joGHrdjnsBRY0PGEOzCbe5bspWxRW?=
 =?us-ascii?Q?Y7S/PuiwhLLreiH6608U05nYzY7y622A+Emui8OVGtDwBxPGLiz81PnTZPxP?=
 =?us-ascii?Q?hs08ASuwT940SlP2IW9WNhimQb4eGByoAOwSL0YmDLgVTJ547KNAMTRMTsns?=
 =?us-ascii?Q?HrLJ+z0fKU9zXbKmEVGm1ZrKJLuMhyfRJjKPV6cwF2rb5UbQNT119YU9ME6D?=
 =?us-ascii?Q?A/FAs2fDF+Pl4tzFyRXQtwyZF8uxQUc0XJzfftB62B7eiJGz119V5TJdXdmW?=
 =?us-ascii?Q?QlJaeXi0iFuzQHjEl905kcNmVb/+zUvzSIsBB4aEM99lVVeULk1b+1RhNFEE?=
 =?us-ascii?Q?FN7kJpkVnRVSNQYsqGQ=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 10:16:15.9673
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41fdaccb-e344-4ef5-6e63-08de37d52751
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P195MB2844
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_021621_227915_0A261FA3 
X-CRM114-Status: GOOD (  10.13  )
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

Add add alternate pinmux for following interfaces used on
phyBOARD-Sargas:
- UART4
- LTDC
- DCMI
- TIM5
- SAI2

Fix "ethernet0=5Frgmii=5Fpins=5Fd" pinmux used on phyCORE-STM32MP15x:
ETH=5FRGMII=5FGTX=5FCLK pin was missing.

Signed-off-by: Christophe Parant <c.parant@phytec.fr>
---
 arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi | 164 ++++++++++++++++++++
 1 file changed, 164 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dt=
s/st/stm32mp15-pinctrl.dtsi
index 40605ea85ee1..f242959e8716 100644
--- a/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
@@ -223,6 +223,45 @@ pins {
 		};
 	};
=20
+	/omit-if-no-ref/
+	dcmi=5Fpins=5Fd: dcmi-3 {
+		pins {
+			pinmux =3D <STM32=5FPINMUX('H', 8,  AF13)>,/* DCMI=5FHSYNC */
+				 <STM32=5FPINMUX('B', 7,  AF13)>,/* DCMI=5FVSYNC */
+				 <STM32=5FPINMUX('A', 6,  AF13)>,/* DCMI=5FPIXCLK */
+				 <STM32=5FPINMUX('H', 9,  AF13)>,/* DCMI=5FD0 */
+				 <STM32=5FPINMUX('C', 7,  AF13)>,/* DCMI=5FD1 */
+				 <STM32=5FPINMUX('E', 0,  AF13)>,/* DCMI=5FD2 */
+				 <STM32=5FPINMUX('E', 1,  AF13)>,/* DCMI=5FD3 */
+				 <STM32=5FPINMUX('H', 14, AF13)>,/* DCMI=5FD4 */
+				 <STM32=5FPINMUX('I', 4,  AF13)>,/* DCMI=5FD5 */
+				 <STM32=5FPINMUX('E', 5,  AF13)>,/* DCMI=5FD6 */
+				 <STM32=5FPINMUX('I', 7,  AF13)>,/* DCMI=5FD7 */
+				 <STM32=5FPINMUX('I', 1,  AF13)>,/* DCMI=5FD8 */
+				 <STM32=5FPINMUX('H', 7,  AF13)>;/* DCMI=5FD9 */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	dcmi=5Fsleep=5Fpins=5Fd: dcmi-sleep-3 {
+		pins {
+			pinmux =3D <STM32=5FPINMUX('H', 8,  ANALOG)>,/* DCMI=5FHSYNC */
+				 <STM32=5FPINMUX('B', 7,  ANALOG)>,/* DCMI=5FVSYNC */
+				 <STM32=5FPINMUX('A', 6,  ANALOG)>,/* DCMI=5FPIXCLK */
+				 <STM32=5FPINMUX('H', 9,  ANALOG)>,/* DCMI=5FD0 */
+				 <STM32=5FPINMUX('C', 7,  ANALOG)>,/* DCMI=5FD1 */
+				 <STM32=5FPINMUX('E', 0,  ANALOG)>,/* DCMI=5FD2 */
+				 <STM32=5FPINMUX('E', 1,  ANALOG)>,/* DCMI=5FD3 */
+				 <STM32=5FPINMUX('H', 14, ANALOG)>,/* DCMI=5FD4 */
+				 <STM32=5FPINMUX('I', 4,  ANALOG)>,/* DCMI=5FD5 */
+				 <STM32=5FPINMUX('E', 5,  ANALOG)>,/* DCMI=5FD6 */
+				 <STM32=5FPINMUX('I', 7,  ANALOG)>,/* DCMI=5FD7 */
+				 <STM32=5FPINMUX('I', 1,  ANALOG)>,/* DCMI=5FD8 */
+				 <STM32=5FPINMUX('H', 7,  ANALOG)>;/* DCMI=5FD9 */
+		};
+	};
+
 	/omit-if-no-ref/
 	ethernet0=5Frgmii=5Fpins=5Fa: rgmii-0 {
 		pins1 {
@@ -386,6 +425,7 @@ pins1 {
 	ethernet0=5Frgmii=5Fpins=5Fd: rgmii-3 {
 		pins1 {
 			pinmux =3D <STM32=5FPINMUX('G', 5, AF11)>, /* ETH=5FRGMII=5FCLK125 */
+				 <STM32=5FPINMUX('G', 4, AF11)>, /* ETH=5FRGMII=5FGTX=5FCLK */
 				 <STM32=5FPINMUX('G', 13, AF11)>,	/* ETH=5FRGMII=5FTXD0 */
 				 <STM32=5FPINMUX('G', 14, AF11)>,	/* ETH=5FRGMII=5FTXD1 */
 				 <STM32=5FPINMUX('C', 2, AF11)>, /* ETH=5FRGMII=5FTXD2 */
@@ -1304,6 +1344,65 @@ pins {
 		};
 	};
=20
+	/omit-if-no-ref/
+	ltdc=5Fpins=5Ff: ltdc-5 {
+		pins {
+			pinmux =3D <STM32=5FPINMUX('G', 7,  AF14)>, /* LCD=5FCLK */
+				 <STM32=5FPINMUX('I', 10, AF14)>, /* LCD=5FHSYNC */
+				 <STM32=5FPINMUX('I', 9,  AF14)>, /* LCD=5FVSYNC */
+				 <STM32=5FPINMUX('E', 13, AF14)>, /* LCD=5FDE */
+				 <STM32=5FPINMUX('C', 10, AF14)>, /* LCD=5FR2 */
+				 <STM32=5FPINMUX('B', 0,   AF9)>, /* LCD=5FR3 */
+				 <STM32=5FPINMUX('H', 10, AF14)>, /* LCD=5FR4 */
+				 <STM32=5FPINMUX('H', 11, AF14)>, /* LCD=5FR5 */
+				 <STM32=5FPINMUX('H', 12, AF14)>, /* LCD=5FR6 */
+				 <STM32=5FPINMUX('E', 15, AF14)>, /* LCD=5FR7 */
+				 <STM32=5FPINMUX('H', 13, AF14)>, /* LCD=5FG2 */
+				 <STM32=5FPINMUX('E', 11, AF14)>, /* LCD=5FG3 */
+				 <STM32=5FPINMUX('H', 15, AF14)>, /* LCD=5FG4 */
+				 <STM32=5FPINMUX('H', 4,   AF9)>, /* LCD=5FG5 */
+				 <STM32=5FPINMUX('I', 11,  AF9)>, /* LCD=5FG6 */
+				 <STM32=5FPINMUX('I', 2,  AF14)>, /* LCD=5FG7 */
+				 <STM32=5FPINMUX('G', 10, AF14)>, /* LCD=5FB2 */
+				 <STM32=5FPINMUX('G', 11, AF14)>, /* LCD=5FB3 */
+				 <STM32=5FPINMUX('E', 12, AF14)>, /* LCD=5FB4 */
+				 <STM32=5FPINMUX('I', 5,  AF14)>, /* LCD=5FB5 */
+				 <STM32=5FPINMUX('B', 8,  AF14)>, /* LCD=5FB6 */
+				 <STM32=5FPINMUX('D', 8,  AF14)>; /* LCD=5FB7 */
+			bias-disable;
+			drive-push-pull;
+			slew-rate =3D <1>;
+		};
+	};
+
+	/omit-if-no-ref/
+	ltdc=5Fsleep=5Fpins=5Ff: ltdc-sleep-5 {
+		pins {
+			pinmux =3D <STM32=5FPINMUX('G', 7,  ANALOG)>, /* LCD=5FCLK */
+				 <STM32=5FPINMUX('I', 10, ANALOG)>, /* LCD=5FHSYNC */
+				 <STM32=5FPINMUX('I', 9,  ANALOG)>, /* LCD=5FVSYNC */
+				 <STM32=5FPINMUX('E', 13, ANALOG)>, /* LCD=5FDE */
+				 <STM32=5FPINMUX('C', 10, ANALOG)>, /* LCD=5FR2 */
+				 <STM32=5FPINMUX('B', 0,  ANALOG)>, /* LCD=5FR3 */
+				 <STM32=5FPINMUX('H', 10, ANALOG)>, /* LCD=5FR4 */
+				 <STM32=5FPINMUX('H', 11, ANALOG)>, /* LCD=5FR5 */
+				 <STM32=5FPINMUX('H', 12, ANALOG)>, /* LCD=5FR6 */
+				 <STM32=5FPINMUX('E', 15, ANALOG)>, /* LCD=5FR7 */
+				 <STM32=5FPINMUX('H', 13, ANALOG)>, /* LCD=5FG2 */
+				 <STM32=5FPINMUX('E', 11, ANALOG)>, /* LCD=5FG3 */
+				 <STM32=5FPINMUX('H', 15, ANALOG)>, /* LCD=5FG4 */
+				 <STM32=5FPINMUX('H', 4,  ANALOG)>, /* LCD=5FG5 */
+				 <STM32=5FPINMUX('I', 11, ANALOG)>, /* LCD=5FG6 */
+				 <STM32=5FPINMUX('I', 2,  ANALOG)>, /* LCD=5FG7 */
+				 <STM32=5FPINMUX('G', 10, ANALOG)>, /* LCD=5FB2 */
+				 <STM32=5FPINMUX('G', 11, ANALOG)>, /* LCD=5FB3 */
+				 <STM32=5FPINMUX('E', 12, ANALOG)>, /* LCD=5FB4 */
+				 <STM32=5FPINMUX('I', 5,  ANALOG)>, /* LCD=5FB5 */
+				 <STM32=5FPINMUX('B', 8,  ANALOG)>, /* LCD=5FB6 */
+				 <STM32=5FPINMUX('D', 8,  ANALOG)>; /* LCD=5FB7 */
+		};
+	};
+
 	/omit-if-no-ref/
 	mco1=5Fpins=5Fa: mco1-0 {
 		pins {
@@ -1644,6 +1743,23 @@ pins {
 		};
 	};
=20
+	/omit-if-no-ref/
+	pwm5=5Fpins=5Fc: pwm5-2 {
+		pins {
+			pinmux =3D <STM32=5FPINMUX('I', 0, AF2)>; /* TIM5=5FCH4 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate =3D <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm5=5Fsleep=5Fpins=5Fc: pwm5-sleep-2 {
+		pins {
+			pinmux =3D <STM32=5FPINMUX('I', 0, ANALOG)>; /* TIM5=5FCH4 */
+		};
+	};
+
 	/omit-if-no-ref/
 	pwm8=5Fpins=5Fa: pwm8-0 {
 		pins {
@@ -1869,6 +1985,21 @@ pins {
 		};
 	};
=20
+	/omit-if-no-ref/
+	sai2a=5Fpins=5Fd: sai2a-3 {
+		pins {
+			pinmux =3D <STM32=5FPINMUX('I', 6, AF10)>; /* SAI2=5FSD=5FA */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	sai2a=5Fsleep=5Fpins=5Fd: sai2a-3 {
+		pins {
+			pinmux =3D <STM32=5FPINMUX('I', 6, ANALOG)>; /* SAI2=5FSD=5FA */
+		};
+	};
+
 	/omit-if-no-ref/
 	sai2b=5Fpins=5Fa: sai2b-0 {
 		pins1 {
@@ -2856,6 +2987,39 @@ pins {
 		};
 	};
=20
+	/omit-if-no-ref/
+	uart4=5Fpins=5Ff: uart4-5 {
+		pins1 {
+			pinmux =3D <STM32=5FPINMUX('B', 9, AF8)>; /* UART4=5FTX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate =3D <0>;
+		};
+		pins2 {
+			pinmux =3D <STM32=5FPINMUX('B', 2, AF8)>; /* UART4=5FRX */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart4=5Fidle=5Fpins=5Ff: uart4-idle-5 {
+		pins1 {
+			pinmux =3D <STM32=5FPINMUX('B', 9, ANALOG)>; /* UART4=5FTX */
+		};
+		pins2 {
+			pinmux =3D <STM32=5FPINMUX('B', 2, AF8)>; /* UART4=5FRX */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart4=5Fsleep=5Fpins=5Ff: uart4-sleep-5 {
+		pins {
+			pinmux =3D <STM32=5FPINMUX('B', 9, ANALOG)>, /* UART4=5FTX */
+				 <STM32=5FPINMUX('B', 2, ANALOG)>; /* UART4=5FRX */
+		};
+	};
+
 	/omit-if-no-ref/
 	uart5=5Fpins=5Fa: uart5-0 {
 		pins1 {
--=20
2.34.1


