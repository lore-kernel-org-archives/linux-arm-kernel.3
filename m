Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1735AD2F7C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 09:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XktNPwgpQHwJppiZFloKBBaGltsydabDqoe0plMyjxs=; b=mDzd/vaud8dhd9pj00vJLcg5d8
	9id7k7MFlCyovP1KMYVhNHoLwTOHhwkIhLpfDt5XSSKTPU79CY490iPeka30YzA3L+BLNNuevMMAS
	YRi9roxrDb03FhjaAErlKXj/7ddlDKJkSsyj2eu6sKB2gfd+AzORprcY016OdtQyQmi9mDwMMCtod
	l9kYGFpufF2ZQm90pKcofEOQCLmh7Hr3pA/hvRuSV4NHGWd7k3z/OD70YEPXvySXYBMq7M8J+wpmX
	ssWD39hODIjZ3g8971TeMqCzURuj3ozYS/TDwWW54qGyBYSPeZJswYSxKKhvdRVyW7eyw9LTroezi
	OsbssrgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRSCb-00000009Iep-2GpX;
	Fri, 05 Dec 2025 09:34:13 +0000
Received: from mail-westeuropeazon11023100.outbound.protection.outlook.com ([52.101.72.100] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRSCX-00000009Icr-24PC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 09:34:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WikaaO1Ba5ghrb/EGTjABIaLp1hwix12JflFruITfnBmt2hDQNeAXUWqvFWx1TLWHVWGjD95hS7ffTz/TmJxAmn8hJOBSzNFHOGTKXBUDjsn+jGoQGASTWWgjgHjJf+am2hrQ14gIpAK6/Jb5NrZOBFkmER+cAJwlHhnOyMEwwnmYsBkEMYJpoVj3RJ5lGaURrJKPqM1OZ+1eJP/U0jCErhrRWyRUSLaAEhndoE9OtmNfzDuziHIM4h5fxdVslisEGHUVUdFHgI7GTDT2Xdk6KkCK0QkGF6QkT0FqbC+8meA6Jei1j/6YkinD0vP4T+n3NEIw5w4qdCugcGfbJuoSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XktNPwgpQHwJppiZFloKBBaGltsydabDqoe0plMyjxs=;
 b=Ffcj/AZccab6+fdwiGLHpSha5HdopPTgOVbkUDrkAbQKfGj+xr25kQBxTmY+L85oAw5w6AIwJm2mZ5wfbSqCLqYlQq+D4embE4hdTs6DB9F8UV+alkRCU5TajUML+3TLkd5wXnHI1syYArHupyZDx6VqX1DC9G3lF7/3DeQ1+8gYQCDrys0nr/jQgDbezRlYP/g8W5tvt4IYQ4t/eDb0djhyzCFK/zJyfRVqy4vh3LtWHVCu2qvMdvUXAzbd4PtksWJ2sUXBXkTWqhoy5ysPKh71aw/F6VB2ekiJtY7fry94taXfOfBMr0zNDowlus5rcPIfZ0p8P4usPltbB6Z+Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XktNPwgpQHwJppiZFloKBBaGltsydabDqoe0plMyjxs=;
 b=WLWeeMHj0GJyyyUspN5T01LTAGW0gVvaVQ9Hw9/6uBuqQQAC3NsE6Xx82Eodxz0W5TP6BcP5r18Akt4awta2BOAk8LrUqooqUwpWtMnerjJ1Nm1KUlM1Kq0ioFOzYWhFW2Omj+clRvUZHsLPwAkbeDtOfT8bz2wjYzRd9uUM/0EidCn7AXLSAlJo6IJofiKwZdhvSAK/ALtVMjAcLbjj6i3+k2pft4qc2lQfo16mFa7yxTVgTdyYOApI6WjGD9yBLkmM1aQQINSrycenPOZ1TZoUkpz4BEuAI05PiUyh3GOPD7WBfLPothFSOV4pSHd1BCtyn2jym9Eo0h31szCamw==
Received: from DU7P191CA0029.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::24)
 by DB8P195MB0632.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:15c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 09:34:02 +0000
Received: from DB5PEPF00014B94.eurprd02.prod.outlook.com
 (2603:10a6:10:54e:cafe::65) by DU7P191CA0029.outlook.office365.com
 (2603:10a6:10:54e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Fri, 5
 Dec 2025 09:33:58 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB5PEPF00014B94.mail.protection.outlook.com (10.167.8.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 5 Dec 2025 09:34:02 +0000
Received: from llp-moog.phytec.de (172.25.32.61) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 5 Dec
 2025 10:34:00 +0100
From: Yannic Moog <y.moog@phytec.de>
Date: Fri, 5 Dec 2025 10:33:26 +0100
Subject: [PATCH v2 2/4] arm64: dts: imx8mp-phycore-som: add spi-nor supply
 vcc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251205-imx8mp-dts-additions-v2-2-d4db54fbadd0@phytec.de>
References: <20251205-imx8mp-dts-additions-v2-0-d4db54fbadd0@phytec.de>
In-Reply-To: <20251205-imx8mp-dts-additions-v2-0-d4db54fbadd0@phytec.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <upstream@lists.phytec.de>, <devicetree@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Yannic Moog <y.moog@phytec.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764927240; l=1162;
 i=y.moog@phytec.de; s=20250509; h=from:subject:message-id;
 bh=1aQ7At+w8VdjwWM8YhDCB1zfAdVqnGbasMnwvgdxzIs=;
 b=/AY6yu+QD9vBz/r0BLKCqOwh+P0fNTsqWb2JA9zY87cAwjYgfh/+5OIZEPOWz0j9IV1mzCXb1
 7y5Z/4g2Dl4CkYy2Ux9WXbdSkA3AhAX6zNcweCYtLKscGJ7pVxApnYg
X-Developer-Key: i=y.moog@phytec.de; a=ed25519;
 pk=rpKoEJ4E7nD9qsrU/rfKVwMTWNWYaTBylZuJUXUiFr8=
X-Originating-IP: [172.25.32.61]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B94:EE_|DB8P195MB0632:EE_
X-MS-Office365-Filtering-Correlation-Id: da4c4b2f-58c0-4be5-db2c-08de33e16d06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ymh2SkRaTWR2cHhnbDF6QlplamdNYmtRbUovaE1BR3pVaUZlaUlCRHhyRTNC?=
 =?utf-8?B?aWpmVFNLWExZR0p6R1FoRlNXK3RDT1BFWXU1eTRvYmNWVVoxU2xyeWxxTERL?=
 =?utf-8?B?M0c1MExpVHVCOW9qenJ2RGQ2NGJ0dC9TTGVWTDg1NG9BQ1Bnb0xjVy9IU3pZ?=
 =?utf-8?B?ekRCWjFtMFZUeTBhRXU5QXkxM3BwTnA0NEtxUlE5VHhMbEZ6clhVdUVrL05G?=
 =?utf-8?B?U21McmllaHk4ZEMwYXZaM2h1UGxwN3I4N2FlL0xPU05PYW5iUDRMZ0JZeXdH?=
 =?utf-8?B?aGVES2xNRXpNd0dZUVN3U0xLOUk1aHV3dUxqUnFCek1VTkNKSVRVQWV2QTA2?=
 =?utf-8?B?NFIrQy96V25vU2JzODlqTk1ONmRIcm5HNDVsY2xCc2p6dVVnVEowRXoyTW51?=
 =?utf-8?B?dEtrajZmU1ZjTDZzTXlDWmhwdkR6c2lvck1BNkdSOTJUQjdzRklGZHVHOTFQ?=
 =?utf-8?B?aUZLa2dXczZrWDNxcmIwMk9zYWxuQzZNRSs5cjhaVDcrKzJJQkVuTElvVFpJ?=
 =?utf-8?B?WWMzZ3h1V0ZMWmRtVzdOZ08vekNrdWtCVTJNU3dReXpaSGxtZG5JLzdleVR5?=
 =?utf-8?B?WlBsbU8xWlZGTkFXTWdIbjdVQk1uZVV3bE5oRWFLK1JDOHlEZkRDUmx0b2Yr?=
 =?utf-8?B?blVQMTVYb3RYaGFhZDN5ZkxpamFxUDBQZVlGZTc0NUI5RUNJN0ZCZFJ4aWoy?=
 =?utf-8?B?SjRDMmNDR0V6Tlh3d2t4emk4cGJvc2VKWWFYOEFFbHREUmRqd0UyNE5JSFR2?=
 =?utf-8?B?ZDN1SXEwYXdnRmpzTmU5K3ZSaHhEc095YXZ6akVKamZJSUp2U2oyS0tVK2Ni?=
 =?utf-8?B?Y1lsODBVejUwZVlSbjd1MzhUdG8zYS9hNC96L0d1R0N6Y3JuQ09xdmtuaXdv?=
 =?utf-8?B?OEhkNkNwbnVMTE1icjNwWDl6aGIvTzF4N2Uwd1hoTlFMUmtxa0x5OG1FNFN6?=
 =?utf-8?B?UTA2b0g2bkM3SzJRd3VlTExQS2dWTjB6bHZSeUZHMW5NTmZwbnIxUlg2YnBj?=
 =?utf-8?B?Vlg4RVVQdHlVekpmMGNtdnBQY3UzRE53dWJhc2IxeHFCNEdmU3o3dFVkRWUv?=
 =?utf-8?B?NUFOL3kyWmp1RGJ5Rk9LcWtPUVpYL1VYZE52SU80RGJsTVhvd3JmME5hQklL?=
 =?utf-8?B?Z3NKWXVCOVY4RkloVlJxakFUbUFPcjVQU3l1UWV3MmVGbmlwYy95SHFTL3ZU?=
 =?utf-8?B?QlkrTVVuZG9RRWpBNTdVM0FuUEVuWGY1aVkrNG9qbndac3dZZk5YY2tmUUFz?=
 =?utf-8?B?eDBLUGthWVVtVVo5UlpMQnZaSnNnaSszN0NGVGtWRDdoSXY2N2tLSTBxK1dh?=
 =?utf-8?B?bDZxY29JbENDZ20reEljTi9YYVhLdStkWDc2UUNNbG9QWjlCckdUSVlCcjVF?=
 =?utf-8?B?OGJQaTY5RndoSTYyaEkrWUpHaFRDT3BSQ2ZEVTRTV09WQjdySks3Z1V2SUVQ?=
 =?utf-8?B?UFI1MGd3Wkp5WnhxWVQ2RXJFdFRFNlJaU1V0Q254RGJ3UzlFNHRiV29QQmZ2?=
 =?utf-8?B?SVd6bEN5VEpHQXJ1elpxSzRyczloZUNEODIrRVJTNWVFZHpYbk9XUHdnVGZY?=
 =?utf-8?B?MzU5QXZqQmNTZ2gyclpFM0UvaEg5ZlFwL2dSQVRKVVNkY3dXSWdoeG4rQ0o2?=
 =?utf-8?B?c3ZzSXgyNWtSZ2RYUzJSSUxzWk5KMXdrVk5haWx5djBReFhxUHZLTUdxYVpz?=
 =?utf-8?B?QjduRTJXb29OSTF5Q1ltMUNqSzRWanNZTDdJbmZmVldZbGhBbnBIaytjeC9J?=
 =?utf-8?B?M0xHbXg4UmVJL21DUGRER2g5cGk4ZjU4QzRVN1A0Z3lvRjI1WG9ZTVM2WDd1?=
 =?utf-8?B?YmJHWTNHalc4YVBuems5UkVnbklzQlcyUmhkRG1lQUhNTW1KZDZRRnB4cW1L?=
 =?utf-8?B?VGU1eTJITThJVjNJZWw3T2E0ODJHSnFPWXdXanRjeVR3amFqWDl5UXBJdGpD?=
 =?utf-8?B?aU5oSWtuVm4wTEgvbGNZTzFXcFJyNENqTG9idE1pR1R4azQxZkRHWm1TU21N?=
 =?utf-8?B?Rjd2UjNUYW8ycDlzaldZTHY2N1EyRmp6cExIckNiV1dBc2RmOHBqQW51ZzI0?=
 =?utf-8?B?MzNpQmxHYzVTd0JwZXpQNzdIQ0twTTJEVHZHRnUvMFV2M2NpUWkya1pDbmgv?=
 =?utf-8?Q?4k0k=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 09:34:02.2277
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da4c4b2f-58c0-4be5-db2c-08de33e16d06
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B94.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P195MB0632
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_013409_849584_19227E68 
X-CRM114-Status: UNSURE (   7.70  )
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

The spi flash on the SoM is missing its vcc supply definition. Add
missing regulator which supplies the flash with 1.8V.

Signed-off-by: Yannic Moog <y.moog@phytec.de>
---
 arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi
index 88831c0fbb7be3db18910385e4e15691b1c74ef2..63adb1c4b3ebc9e1f588e8c7c00acf92f5a04e94 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi
@@ -28,6 +28,13 @@ reg_vdd_io: regulator-vdd-io {
 		regulator-min-microvolt = <3300000>;
 		regulator-name = "VDD_IO";
 	};
+
+	reg_vdd_1v8: regulator-vdd-1v8 {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "VDD_1V8";
+	};
 };
 
 &A53_0 {
@@ -83,6 +90,7 @@ som_flash: flash@0 {
 		spi-max-frequency = <80000000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <1>;
+		vcc-supply = <&reg_vdd_1v8>;
 	};
 };
 

-- 
2.43.0


