Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A96EC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 19:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RM0OaW0E/SgwP5X2OGiNMUsoYcnx0P1QvIZ1zQCjoCk=; b=Yuw04ttWIsutohu4OBdnKTQQfm
	O76miAzYARFc3aWtqAU+9rzWPx5YXhPG6m/qwJVj21cM9NHUgztEKc2uFRGf9XnJ0aUBFH9SFAGPC
	aKdcDkaTyStul95krbUtf4PHAAlYIGCL6b4D68/BlOBKNryeOAUnBxqgnJnXDg5vfyDc7ZIbOInJj
	tHYjmRbs0YVfTOBw2kLjke4Xyk6XGKRKIC7lSX9mX5Nxow/gqpBj+QgLzx/NVnzsIlJXTxXL6cD1J
	u7NZYsvy2q4LQ8y61l40whrZyIqY9F3LHvk8Ysj0y/8YyRI7pBufXUgy3/5WXqLB8MmQs+VUpUtOX
	BvM20LLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZa5a-00000009ccS-3eDr;
	Wed, 09 Jul 2025 19:04:18 +0000
Received: from mail-vi1eur02on2072c.outbound.protection.outlook.com ([2a01:111:f403:2607::72c] helo=EUR02-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZWRG-000000096xL-3ePR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 15:10:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iXT3LvTo3lvhax4EtVaEKI6Fu7UXFNtxsgPobhQFya3VSWoBD3BdKBq6NDKg5EEDgoqoMxF3MIlBJm2LWjxfbYkRPP6fLGbACX6RyDWEaPvM9rTBJdZcQZSSdv2QFnonNFRJIulpCWu2GscXQuuEMTKYBz+qJt5LmNKy/et5bQeg4AD+l1SJcSdfxxCBgYA7Pu6CHKiDhOKQ2KuBUd0xT/mrla2bacqJcHVYy4ZW1yoYTlVnZ71JGcUqNKHrMrh+69Vy8vhtdgxp0lXQjm17cmxZE7qJGGYg38EUqcteHwaZFV9Hzei5IT/sPUi0a1dGntiZQIIM//aQAvjY+c8NJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RM0OaW0E/SgwP5X2OGiNMUsoYcnx0P1QvIZ1zQCjoCk=;
 b=E7fmloc6+n8kqi0Yeu3p5RY6ePzvIeT6uLwclxwaAqnS5TbgVP6lm9E3ML68QoxwEhvo/jsDv/RUMiw58I0KLs1K4E5ErB/t87flGB51eI20g57ze0MGro4TgSX+DxUw3G8H++1AnZkaPiPVqEJw8p3EnSOzamL+MWeuXXU8se020hp9bkoqqzpiTOCx79VwBtqfusZvS3K54xfuhglGjMUVD/VfxWULFbgXBES/Hr+1UTl+UVglVc9bggfa/j5pPlqEGRDGAxiXoV2OMTge3EcCnwGmqiGqFu0KCK1HNfMzG0FjphXuQjyV3TrJwQM0ySA2hfzA0mWkPiv0aG/yOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=phytec.fr;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RM0OaW0E/SgwP5X2OGiNMUsoYcnx0P1QvIZ1zQCjoCk=;
 b=QlT89Rh0NAf5y/yPJPF4DPGlhSPoegNDVOG/8+FSyYNHs26YF9Wd/eU3RhiWYavFM51Hk2uDTFh+tjcWFfSeCsKUO4Www1sg5oYpo4TYtZ56aY/Cd0nq7SBzeaScp7Moeft2puNAqvhIJro5zvLiSMB2PMWLEQ1HTI8gyJ6rung=
Received: from DB7PR02CA0032.eurprd02.prod.outlook.com (2603:10a6:10:52::45)
 by AM9P195MB0999.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:1cc::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 9 Jul
 2025 15:10:20 +0000
Received: from DB1PEPF000509ED.eurprd03.prod.outlook.com
 (2603:10a6:10:52:cafe::ca) by DB7PR02CA0032.outlook.office365.com
 (2603:10a6:10:52::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Wed,
 9 Jul 2025 15:10:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Diagnostix.phytec.de;
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB1PEPF000509ED.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Wed, 9 Jul 2025 15:10:20 +0000
Received: from Diagnostix.phytec.de (172.25.0.14) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 9 Jul
 2025 17:10:15 +0200
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.14) with Microsoft SMTP Server id 15.1.2507.57 via Frontend
 Transport; Wed, 9 Jul 2025 17:10:15 +0200
Received: from pc.home ([172.25.39.2])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2025070917101537-214 ;
          Wed, 9 Jul 2025 17:10:15 +0200 
From: Christophe Parant <c.parant@phytec.fr>
To: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	<upstream@lists.phytec.de>
Subject: [PATCH v2 08/11] ARM: dts: stm32: phyboard-sargas: Move aliases from dts to dtsi
Date: Wed, 9 Jul 2025 17:10:08 +0200
Message-ID: <20250709151011.366537-9-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709151011.366537-1-c.parant@phytec.fr>
References: <20250709151011.366537-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 09.07.2025 17:10:15,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 09.07.2025 17:10:15
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509ED:EE_|AM9P195MB0999:EE_
X-MS-Office365-Filtering-Correlation-Id: 177c95c1-f84f-4f5d-b0f2-08ddbefab8d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3r8lvyEyINmh40xZr37ou5oSmLFzfQ1jdTAho+Zc1JfiovPYS0i+E9Er0kV0?=
 =?us-ascii?Q?1TxGQP3swfnfVozkSQU8Os04eNhhfAaCuUKQqs9wpz3eXfr2eevtY29rU6LS?=
 =?us-ascii?Q?nChG6Iq2WwJpqneFr/vKYYu5+WyplbF1zBfmB+HF0WxT91cyad4C27uAfOkl?=
 =?us-ascii?Q?MSrsqEhzEbX57KncXqBdULdqw9XwuCRXzzvQiiOAwqgjQfxAKAvYa3Ul5vEE?=
 =?us-ascii?Q?9hRu7iBA2ut34J2OINyy3F3sxONnIIo95aVAMStdN8N22vLGzKuM+/gJgPOE?=
 =?us-ascii?Q?lqG26VsCIMwAtR+zBWIWa9RWpy1AdDhfMPATbe7saIshe8j2pP/KeF01Z7iL?=
 =?us-ascii?Q?lFE660K2kK+7SpkJeH5VkUzjaBKV5hBZ5TymBMjZYM+PYujZLXytQO+ycmGy?=
 =?us-ascii?Q?0w2z6srBHYKj9IZsLF+h2l31DWUCEjW2lHA2MVzWe7ovMIEPlnCeIb3nXVwK?=
 =?us-ascii?Q?Oc2mNZslhSNesuDRyZrJsjVlq25DIx9Cn9+bVunq2IQNvcD0JiUWJUSia0AS?=
 =?us-ascii?Q?ahNkY7mTL68qhmFTxmFebzw3vAOgawqfayK1cHMGHS9QB5bxIf1P7xGNqbwX?=
 =?us-ascii?Q?wstV96PLb7uzeuE3E5UY1m7+L78Ey14ypqUrcjX2J59P4HAt8TE/1iGBPzqg?=
 =?us-ascii?Q?JWJReSd/glTdYNwv9+gBe7JMSh7vrbnSf2jIs24t1o5dnel583C7Ygicrwoj?=
 =?us-ascii?Q?OWuq69EIyVIrILtN+xc1lRiWGcWJ5J7/Q4E+Ft+AbLU/c5CgHFtW5MnH5khE?=
 =?us-ascii?Q?TG7mR8xEOBKGzU36WvxG9LJBZQgtXEisP+3ndnjmPQuon9zgjhu3TLmZ+a+F?=
 =?us-ascii?Q?hgWf16I7wUg0MjM15QvysmFHhvihzaRPStrG0yNtE9wt1WUUE6jTFye6/Af8?=
 =?us-ascii?Q?QItroNeXtng3ZLxOjWJASYhSwDCnUrPyVjwI5rRqE52SbQsYE7bMlqF+Kb43?=
 =?us-ascii?Q?aSZfvLq/kZi9FbyT11ksiqtnJBbgJdIV+GDR7nso8SJEI9148vH49tvWjrNC?=
 =?us-ascii?Q?WtkpYiFiMgySebU8UDe3paurDEm5eSiwsrIMgTWD/VXNuyNdcdqcRSdNiIkd?=
 =?us-ascii?Q?4jJHm0JtlzUr0NB+oGXemR4W1Mw6eUIzMhviNUxtPbIF0EErcRdkjClrLLaU?=
 =?us-ascii?Q?LJlqjtTImR8cZgeySkdAlVBk08X4O6ntXd2jW7s2iYGZrGRM7DlUG//G0IZC?=
 =?us-ascii?Q?Ei2F+VpTqHO07xT8D8ox8attSsvy0Wskfhv7DFLPoLx7mhbiAvJPPrlBowmK?=
 =?us-ascii?Q?niYey3LunE9LCodX3uTnN+lKiLSRUV+T93RKK+mXDbNTG8DIdg64wqdewmdX?=
 =?us-ascii?Q?ZN5pszoOZpDbghnPjjV8LHOye0ZK2M+LZ8oKYko+pUQG8LMwXtfnCeK6MatY?=
 =?us-ascii?Q?B/zQ8ExAE+LumEdPWVP4L5k2phHAZVxZ8flmBz3QstyWD159EGJqSIjvLDUK?=
 =?us-ascii?Q?oLfERWoLV/8AiKz+KmoFE3lHXGLfUrspd4HYm/zcth0qIg7MZtdNmfcHXhnC?=
 =?us-ascii?Q?Zvlu2I8pqubcnAwE/KGfyyX6bPjYTnWLU92r?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 15:10:20.7616
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 177c95c1-f84f-4f5d-b0f2-08ddbefab8d1
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P195MB0999
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_081026_906277_87A09FEA 
X-CRM114-Status: UNSURE (   9.53  )
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

aliases are common to every phyboard-sargas version. So move it to
the common phyboard dtsi file.

Signed-off-by: Christophe Parant <c.parant@phytec.fr>
---
 arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts | 9 ---------
 arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi    | 9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts b/arc=
h/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
index 48adc3462958..f7c02a381304 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
@@ -16,15 +16,6 @@ / {
 	model =3D "PHYTEC phyBOARD-Sargas STM32MP157C";
 	compatible =3D "phytec,phycore-stm32mp1-3",
 		     "phytec,phycore-stm32mp157c-som", "st,stm32mp157";
-
-	aliases {
-		mmc0 =3D &sdmmc1;
-		mmc1 =3D &sdmmc2;
-		mmc2 =3D &sdmmc3;
-		serial0 =3D &uart4;
-		serial1 =3D &usart3;
-		serial2 =3D &usart1;
-	};
 };
=20
 &cryp1 {
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi b/arch/a=
rm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
index 44f3aa1ddebf..9578e78bcc1d 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
@@ -12,6 +12,15 @@
 #include <dt-bindings/leds/leds-pca9532.h>
=20
 / {
+	aliases {
+		mmc0 =3D &sdmmc1;
+		mmc1 =3D &sdmmc2;
+		mmc2 =3D &sdmmc3;
+		serial0 =3D &uart4;
+		serial1 =3D &usart3;
+		serial2 =3D &usart1;
+	};
+
 	chosen {
 		stdout-path =3D "serial0:115200n8";
 	};
--=20
2.34.1


