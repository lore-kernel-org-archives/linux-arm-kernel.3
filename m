Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16AFBC9EC6D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 10:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9NJ1nAfQs65MD73P07v8Bpxi/FVPMkmQB1bxhWaVAko=; b=ggSjlaDy9P1lJBssVIrTjYh+8S
	/2w/11s21Y26x9LqPGJxuKr5qzcQtNRLukaMWRLVUV/8gGjsGD0pBRnD4Wrp2zHP6wX+hsLqtuyAW
	/vwDbKVRZJ9RT1TriWFTcWumbbZplY+Vo63DR/4EVIUYkz72P345Yili5AAuo7NO5r7adLUtdmbDx
	XOdAghyaWJGIigpjMv8KzF2PXMfjhgkOQRYwLdfkoC9tYRll3ZppeMVYSZ12LsAY/O4h/aai/W0lE
	zl5gOzhewS+uDo6l6DdgBkOUl/NRdpDy/H3e6EmpnPRF/2RziU90ShB68/8oEzPV67fE/nsoFUWid
	tOCv6g3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFQz-00000005Bzy-13kU;
	Mon, 12 Jan 2026 10:46:05 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFQw-00000005ByL-1C9L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 10:46:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q2H1MFvDBD9DVijbpGKOEVsD71A8T/hXxyE+b//BzooCfWTzgttX2ZzIuDGW8EHUte3X/nvFhmGnb12sKzNRAxbl0lpHdW7m2XT4oQgklvtajFDbsziQBgbzlkFx/LMGMEf+9OSNuZJ6kvBJ53SuWhStOKd6CTAbCOmg/cf5NB11UcXn/htpbtvzlAJfkviKi1kzyEHrQSDBboWH2/x6i7Nq6+ohg2sOo3tH9ON6WoLht3IIetJHyciHx8TPP1RtwotI7qrc3SCQNsBu0Y6gZ7n2rPWCWHomFYc3q2SiEMG+bTSbxReXpUN/EyByrmjLA5JZEePgyfSOHNKiRyCT5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9NJ1nAfQs65MD73P07v8Bpxi/FVPMkmQB1bxhWaVAko=;
 b=Sy5G2Mwlo4UHXbHaERuuJtFSaK4H27qe6Pp2869I6bix44iYpAMj3v0H7axDfNkbzFnVPFkmtSYBgPSyfyRLMYlkK6/e2ml+NQ16ZqtWvi4LgdVDlajW4HBxkEbbIXmkgrk1ozI8C9xnuAqnosOEI662Y2ylPcG0nmhSOJZZvz0bbTY/kCsgWBuYpv9nfjd4my67l8pQfhew66fnQLH3xaIgoSa0yEBioEQfW+dMNtw1bymWssuSlYJjxFhtTyUpyd0CxzmJ1sa72tuBGTqsBiYSR9Wg39Q9yNjomqOxrWnUiVyk9ZYIf00VIa5jGOtWqfq+SvPpeZGVyZ0avnZr/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9NJ1nAfQs65MD73P07v8Bpxi/FVPMkmQB1bxhWaVAko=;
 b=rU61a3Ml6UMs9npJjuuLgLBAHgrBUVHgF6WaIC5k1DdQtx2nQCtbDtAltjDB0SrK5dCvhq5k5T9UvSapfPsOtjxqRd/8JhS1w/7hIv3MVnkPgsBv0w2RWqEaS7XLQcOS/wzSuhw3zI/Z/SbdW5qDQvFZKAQszWK+zyrGnLgxOLE=
Received: from DS7P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:1ca::8) by
 SA2PR10MB4442.namprd10.prod.outlook.com (2603:10b6:806:11a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 12 Jan
 2026 10:45:56 +0000
Received: from CH3PEPF00000013.namprd21.prod.outlook.com (2603:10b6:8:1ca::4)
 by DS7P220CA0010.outlook.office365.com (2603:10b6:8:1ca::8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7
 via Frontend Transport; Mon, 12 Jan 2026 10:45:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH3PEPF00000013.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.0 via Frontend Transport; Mon, 12 Jan 2026 10:45:54 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 12 Jan
 2026 04:45:50 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 12 Jan
 2026 04:45:50 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 12 Jan 2026 04:45:50 -0600
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [172.24.235.46])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60CAjbfF242687;
	Mon, 12 Jan 2026 04:45:46 -0600
From: Moteen Shah <m-shah@ti.com>
To: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <gehariprasath@ti.com>,
	<y-abhilashchandra@ti.com>, <m-shah@ti.com>
Subject: [PATCH 2/3] arm64: dts: ti: k3-j721s2-main: Add audio_refclk node
Date: Mon, 12 Jan 2026 16:15:35 +0530
Message-ID: <20260112104536.83309-3-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260112104536.83309-1-m-shah@ti.com>
References: <20260112104536.83309-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000013:EE_|SA2PR10MB4442:EE_
X-MS-Office365-Filtering-Correlation-Id: dfa3bc06-fe0b-4441-0dac-08de51c7c353
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|34020700016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EPd4EcWofPkxGQqeJXtIv7BpVtiwRafT+FZw4MmIhL1KWfXcnTu0MrvlJ9Da?=
 =?us-ascii?Q?ARgPLnqpv33arzD/ShHLDSKS2+LAMIRTpdnAtiYbuESO7TYwPa+e17BYJ+np?=
 =?us-ascii?Q?6tq2FtY5mwD+6EqMZc5mMBnVmoMMEFNfGD08hTvYZU/FQG6mavjep7xQ0xR6?=
 =?us-ascii?Q?0m0BCMW3BA/UjnfyA6C7kIQFi0iXh2yKWsP5EydH0S3OlWOgQo6oVb1TTYtL?=
 =?us-ascii?Q?v9zL0UkhRnHiGidSCpl11xzXNgeV+5AgzeWQa22nBqp+PFOnabzxEFMrUd70?=
 =?us-ascii?Q?viaJ6ljt6VWG/5IjNo48U/jc2Os8b320jwMDkqw4otzqyqZTVvvgGaOX9Xuz?=
 =?us-ascii?Q?Idn+R+TGBVfjG9r6RzvX/TsGRrbfYoeqNVIVdxAiqZgwb4OwylR6yMIXbC8n?=
 =?us-ascii?Q?IQ6O660vgWRtXw8/4S2RXGpSg3DwtMYkYw7U8NAhu/Pdc4L4PCL92lEQ9eav?=
 =?us-ascii?Q?xhpFehFOAd8PZWCbLaLIu5zjPw082sViYvPOsc/+kSUuqi9hBsiqyVwtPyZ7?=
 =?us-ascii?Q?1bNkNAk3afxNZqryvow7JNxsw4Zh6Vojrhg6Y/Qrccsp309HjXY/IANv17UJ?=
 =?us-ascii?Q?s3sKawvr7GuA/YrmQ1jMJVQcDxJiStOWnGgpVyqx1iW3Uo0aLrqUUWdFGz7q?=
 =?us-ascii?Q?N5vGsSyRcYNCZXBxRM33nvi7lV4ednY0v37Syemqj2IByK3sMO1cFmdFRw9M?=
 =?us-ascii?Q?144n9FfATVIJJxisUczuX1PNG7YI0rYeiEbMg+AjwiJatoURDWF0ta5qKoHt?=
 =?us-ascii?Q?0ROD3sDEAOMu890Qs5bgPlta5CXHGWk+8Rs+paFo5UbCS/8A2HAYnOrVzFli?=
 =?us-ascii?Q?K/yvwGXlvzKzfkHHnDjtJZVVygDMFmO7t0hIeiYowixx5k0u2y6tZkUPgMZi?=
 =?us-ascii?Q?1M5Pdlsrj663bAub0CffLzH4LCjYVKyUUCRz+QIuB+N5yuRTCwkJ2UT9jF9C?=
 =?us-ascii?Q?S0pV7Tp5D1JaHJpPrFCxpGlaXEiPvMKxcbdRN/hDuaqhPLOs1oWK5LwSmg49?=
 =?us-ascii?Q?ixqYqnihBN4PFp/OrbD3FxYcrHSZAmIwVpto5nOxsnCo+aP6DKPuBr1lwrPG?=
 =?us-ascii?Q?XYzY06AjywefOWZjm9qrijs2cRcA0ZbDooTDdCgki8Im/1cNqmAzZSWABJ+i?=
 =?us-ascii?Q?BcMOiiy6f4OmfHKiY/JqNKMJzy5xrXjPmjyOEFS01QqsaimwN/4fcruBYfj3?=
 =?us-ascii?Q?NP6XYLgaj5b+O2Io1j8N9soEhxE7uPdv2tg7m5PL1ztLs7A+buPCw6Mp6d8w?=
 =?us-ascii?Q?uLZh6P+/TvafCYD026ub9MmUE2DFymiL8IhcCaDfp6rCrM8wpvTs5ddvsTho?=
 =?us-ascii?Q?79oHxDXDyFZugoFmuQSg2K4xmYXK02YMPPXHlgL9zM4WkpmCSOn8eamOl8gk?=
 =?us-ascii?Q?hgj76F93mfjZv4RuzSGAkKPbGt+xx/F4ELqPltChbBetweW+Mua41Z+G/C8D?=
 =?us-ascii?Q?Rbp6fAUCrNRkA9UBLA7cAMURREZJCUcljZqmU2pcyC/GCjDL1WKQSY6zqFl2?=
 =?us-ascii?Q?mpS1kITlvKzxXM8sGdYh4Efacl0+EVNPxr6mzXNphLaDQyBDoPMmrQ9+9xx+?=
 =?us-ascii?Q?cv5ewGrOgeBgBlcBIkY=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 10:45:54.9566
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfa3bc06-fe0b-4441-0dac-08de51c7c353
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000013.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4442
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_024602_330772_FEE2F6C6 
X-CRM114-Status: UNSURE (   9.70  )
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

From: Jayesh Choudhary <j-choudhary@ti.com>

On J721S2 SoC, the AUDIO_REFCLK1 can be used as input to external
peripherals when configured through CTRL_MMR.
Add audio_refclk1 node which would be used as system clock for
audio codec PCM3168A.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 80c51b11ac9f..3ecc7c973205 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -75,6 +75,15 @@ ehrpwm_tbclk: clock-controller@140 {
 			reg = <0x140 0x18>;
 			#clock-cells = <1>;
 		};
+
+		audio_refclk1: clock-controller@42e4 {
+			compatible = "ti,am62-audio-refclk";
+			reg = <0x42e4 0x4>;
+			clocks = <&k3_clks 157 299>;
+			assigned-clocks = <&k3_clks 157 299>;
+			assigned-clock-parents = <&k3_clks 157 328>;
+			#clock-cells = <0>;
+		};
 	};
 
 	main_ehrpwm0: pwm@3000000 {
-- 
2.34.1


