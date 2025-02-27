Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A915EC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yd3dTLedqb5GA2DtXcI0Oi5n0dqfuJJDV7nWzFjTFlI=; b=tIhzur5jeHDRO5mFmKPcBw6jwr
	TGX8B/pKgAKh+bRWmGyOPpC1mR778UUNR+f2Y5xCJLh1JRIKPgq/Ut4DlJsfmy+p6YnjjfPBQfexR
	rykFcE6d0vEp4DiLe50je+iNcGWv077Eup276Cl0wFptbt7SSgfmDxdIzv8jB5lZ5drHcqCbYbtXW
	kL+Paz9wDuODFGdVvmcl6QXt8huW7/SiKcHIlxDY4oSkHmZueNpr2t/XcIlbOf1LnJGMvYEXL7vZK
	woze0E/15j+FsSJ3yBv7RDAlxbuJuhjkvh6O15FgBG8j5XrxJktjrL+sPtEl8/rxJkSjY3F3owST6
	HhWNHurA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjhz-00000008VOL-2P8V;
	Thu, 27 Feb 2025 19:38:11 +0000
Received: from mail-db8eur05on20716.outbound.protection.outlook.com ([2a01:111:f403:2614::716] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tng0F-00000007wAH-1CP7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 15:40:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u82zp7cZmlT470sc2JqUStlc1BKb3gLsKH2XBAIwXzYckGrf132aQtMQszXc3TPr8pKjvwxblQbAao+8soAIj63lkyAt/1QWxPztsydeRjMO2awEtq8Gx73S9ODja8HEzBJTvSDwMYnbvU2uDMEgeydV0YMTIr14ymwQpwwxtJmDyBGCWrLYGwraPBKZGSKWNxdB+792zx8G0dJXADPLqJ5YjhBhdAq9B/ZC5e3QUqWEDsbYGRqkGhWKlmMJNrgi0SVo9A/m7oC9xDl2KQ3vSjcLawZaDuKErqOAreWPQ7oQUkgjdRvhWGfyLzQViq5k/+EPPBcsI9E6fB9VhINrqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yd3dTLedqb5GA2DtXcI0Oi5n0dqfuJJDV7nWzFjTFlI=;
 b=ynpOrUq4s57XOl/YzobbUnV0RUvrJfmHAaAXMPpnFyzfxOcz5Ll5KRAWd+PulTu9wU7jysmJYNZ0UAXAOeFcjpCrovE9+3Aoc0lUF+DOmI/LGaMx+BDHZLCuf/iDeFnJKrI/lzCnafYNct5ZXIgh2SqfPU05wu7Gdu63EuvTY4gceGPQ5SwcTJ6fEih2h1i+tht4xeT8RmH7daR9x7gKr3WsYJfYSwlWrb8qXvw/+dIWOeDOyr5NweYkuagnDScKgc/eRbcDZ0qLlC7xAmnCQHqOV2S84JKvluwh+er+yPmv9RDIKgTgynMWHH4Hx8HSk9AzmohKSQQxS0ORRe4fbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=phytec.fr;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yd3dTLedqb5GA2DtXcI0Oi5n0dqfuJJDV7nWzFjTFlI=;
 b=gWhZl5WnF1JEHiYJATzHxO72TqKwWxu7DZ2kprasFKdkNzwJ7UvZ30SnZybyvgLoQz8/82C4oCUFAaalHi4/82OwRXBRSmP4NaBm+7DnzaQPsg6/sPA2pMkFKS/njlJ/boIlJXCtJTdBibs3iCU+LKM7SKsbudhTcYbsoNGJJ0U=
Received: from AS9PR06CA0563.eurprd06.prod.outlook.com (2603:10a6:20b:485::28)
 by DBAP195MB1004.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:1c7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Thu, 27 Feb
 2025 15:40:43 +0000
Received: from AM2PEPF0001C70C.eurprd05.prod.outlook.com
 (2603:10a6:20b:485:cafe::d9) by AS9PR06CA0563.outlook.office365.com
 (2603:10a6:20b:485::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.20 via Frontend Transport; Thu,
 27 Feb 2025 15:40:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Diagnostix.phytec.de;
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AM2PEPF0001C70C.mail.protection.outlook.com (10.167.16.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Thu, 27 Feb 2025 15:40:43 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 27 Feb
 2025 16:40:17 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.13) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 27 Feb 2025 16:40:17 +0100
Received: from localhost.localdomain ([172.25.39.2])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2025022716401750-92 ;
          Thu, 27 Feb 2025 16:40:17 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	<upstream@lists.phytec.de>
Subject: [PATCH 09/11] ARM: dts: stm32: phycore-stm32mp15: Disable optional SoM peripherals
Date: Thu, 27 Feb 2025 16:40:10 +0100
Message-ID: <20250227154012.259566-10-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250227154012.259566-1-c.parant@phytec.fr>
References: <20250227154012.259566-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 27.02.2025 16:40:17,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 27.02.2025 16:40:17
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70C:EE_|DBAP195MB1004:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c4fca1c-88b8-495a-6490-08dd574518b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DAhC6+bC2tL1dW1E8kK3V5be50SU0lxwXall8m8yoa7S3GrHAy5x4mksAvhU?=
 =?us-ascii?Q?6h5oIFPRNcm5teoRqAgIfVjt0lvpgJedvXSPpR82Oa2JOwcSKaEGqLyVZMpo?=
 =?us-ascii?Q?jYeX7qtVwawxASB61dBG1e7ysMTLITqpyIPJXS71ecA+12ENBeQykGStHBsv?=
 =?us-ascii?Q?Dkz9CeViqjlX1V2IxNDZy4lQ60+XH/qqAP1s/Fh9R85rSm7dkAeeHhWbFOw1?=
 =?us-ascii?Q?uPvevX0Q6KUfHZLgy6s2f9MLYDVxTZTYjiT4JUtL9yWORmi7LaYzwHWuxUor?=
 =?us-ascii?Q?QhY19VYekjXEDwXWLMY/zxTjNZFCprAzp+fwdT9PKS7xsTHo+VGJIIzWyDnl?=
 =?us-ascii?Q?KtM+auMMElWPLmyZREwSlLSEUd9AsOR3wUYXTqIuw/SPIbXWSw+JZD57++2o?=
 =?us-ascii?Q?YrY/y+bfp6oLMWbZdok9uVguwnUqcBkaoVD5ItqMkHKbrhCbBZGhL53uNh8S?=
 =?us-ascii?Q?IA+wf5vWLm90zD5T5v+n+suf2vysu6W+y6eAJgGv0fQKzswJc76ljv7qtNOS?=
 =?us-ascii?Q?eCgTp4MppdjW4kaqdhVkNqqqt2tNBZnFQFX3EYQSI/dZH0CQWUYJyCYqSBzm?=
 =?us-ascii?Q?9oSKDLSrIo5zK6R1d+bGb9t3d7ty+fJ4NXDstH70M3pZNdy5QWBS143kA5su?=
 =?us-ascii?Q?mWVfkrdvnKYXerb/FM2sZ3C5IhtnPYNBOnv41274zN2jIqoZKPYTo6SLyVPy?=
 =?us-ascii?Q?fXqUmlURUqQilu2JXp2N/6F+GE6Cw6U2zkBt36nmzMJMAo57k/2GBW8vqB6J?=
 =?us-ascii?Q?DsRiRGL5IEGLF5EGnh2sYtGckCYcVUtlHgIzvn9/tpF6wAjmTgTImes136zA?=
 =?us-ascii?Q?MZfxWClIqXy+ijNfKw5/y86onrTl4laRVAYCAPypQKLx75E2KL0RLfkzP1uQ?=
 =?us-ascii?Q?5G6+g/OpWr7vk/Il0NBxZgT0yoo9hXOI/Ma1O9C2RVjLAlSA/Bvv9AKnvGS4?=
 =?us-ascii?Q?fxqba+zu9VIgaN+FOpbW0vRlAnu80lB1p1ZlldWUXyHIzkVDxGIGDOyuf8sw?=
 =?us-ascii?Q?coEFEzMJonY9XFKw9/d7EZIDg9mE672M11mEaXnwwJ0ctnrpOs3kxFmo6zrE?=
 =?us-ascii?Q?mqQknBCVMUO6+2dNBzWwYovMus0EshvfYBLodE2UkpDPJhAzzR7sLflWsJZw?=
 =?us-ascii?Q?o4jLW2mCldlQSmYVYFcpfqN6ZzaUc95UdD0yJ/8T678bql431JPHDNSA306n?=
 =?us-ascii?Q?dO0EknS/vWTmBV1TKCbtmLemiFw29wp8b7GgrZw+faVrzcqKaUcXvZwleNw6?=
 =?us-ascii?Q?8Ncp0qirtA7V9fh/JOoAwOouRjQCfa3MZUcG2n39u4IeAg5d/JFSzYrOJliM?=
 =?us-ascii?Q?T8/Y3CzE8I5UE6CtmP9A6OMgDvDCBH5aI09KEvRo88nPnKYVtwlTzIv5eigf?=
 =?us-ascii?Q?xUia+IWs+FLrabvTUbOio03TAjLFo4+rgv1gRoPFdW/D8wQw0xe6g4jPZoST?=
 =?us-ascii?Q?BBpQLNWBMj5FWlRROsecLq+9JB8MRecuZJJVw64cX30Ek7qEF3eOAbelCeKg?=
 =?us-ascii?Q?2qIZEZluVIjndkQ=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 15:40:43.4870
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c4fca1c-88b8-495a-6490-08dd574518b2
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C70C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAP195MB1004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_074047_325059_D501ADE9 
X-CRM114-Status: GOOD (  10.27  )
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

Following peripherals are optional on phyCORE-STM32MP15x following
PHYTEC standard SoM variants: external RTC, EEPROM, SPI NOR.
Also NAND (fmc) can be populated instead of eMMC (sdmmc2).

So disable those peripherals on SoM dtsi file and enable them on board
dts file.
Additionally, enable by default the "DTS" SoC IP on common SoM dtsi file
as it is not an optional IP in STM32MP15x SoC.

Signed-off-by: Christophe Parant <c.parant@phytec.fr>
---
 arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts | 8 --------
 arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi        | 9 ++++++++-
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts b/arc=
h/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
index 462c89e68e2c..c9870f94ac1f 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
@@ -22,14 +22,6 @@ &cryp1 {
 	status =3D "okay";
 };
=20
-&dts {
-	status =3D "okay";
-};
-
-&fmc {
-	status =3D "disabled";
-};
-
 &gpu {
 	status =3D "okay";
 };
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi b/arch/arm/b=
oot/dts/st/stm32mp15xx-phycore-som.dtsi
index ce859b94ae26..3f60f184978c 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi
@@ -265,11 +265,13 @@ i2c4=5Feeprom: eeprom@50 {
 		compatible =3D "microchip,24c32",
 			     "atmel,24c32";
 		reg =3D <0x50>;
+		status =3D "disabled";
 	};
=20
 	i2c4=5Frtc: rtc@52 {
 		compatible =3D "microcrystal,rv3028";
 		reg =3D <0x52>;
+		status =3D "disabled";
 	};
 };
=20
@@ -307,7 +309,7 @@ &qspi=5Fbk1=5Fsleep=5Fpins=5Fa
 		     &qspi=5Fcs1=5Fsleep=5Fpins=5Fa>;
 	reg =3D <0x58003000 0x1000>,
 	      <0x70000000 0x1000000>;
-	status =3D "okay";
+	status =3D "disabled";
=20
 	flash0: flash@0 {
 		compatible =3D "winbond,w25q128", "jedec,spi-nor";
@@ -328,6 +330,10 @@ &rtc {
 	status =3D "okay";
 };
=20
+&dts {
+	status =3D "okay";
+};
+
 &sdmmc2 {
 	pinctrl-names =3D "default", "opendrain", "sleep";
 	pinctrl-0 =3D <&sdmmc2=5Fb4=5Fpins=5Fa &sdmmc2=5Fd47=5Fpins=5Fe>;
@@ -341,4 +347,5 @@ &sdmmc2 {
 	vmmc-supply =3D <&v3v3>;
 	vqmmc-supply =3D <&v3v3>;
 	mmc-ddr-3=5F3v;
+	status =3D "disabled";
 };
--=20
2.34.1


