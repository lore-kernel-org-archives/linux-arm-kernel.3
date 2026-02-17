Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A0C3E68171
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 13:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iRMttMpqtXMMschQ17dp1wWmvQbAZ0i7DDCDXaRiyYc=; b=tqJXEF5jGBWhlU5FC3eb8UKCpj
	XyGrv50W2C/XEO6Ztlw+FSlYIbZocEuJ8UkV3uOszNofJjwteDN0oRXw9571xLmGzz8cTuR4qKToN
	rCHLEeQKXNg8taUHHYqr76HpbX+mhlJCjXqoUvxZBAQP+A+vrNGOdmfUeka5l8dlbabT5o/3pPoyE
	iFlBsto6j/7zmv76T7Tf06KS085QWOo6Aq2l4wf87n/6V1OvW7tQa36mfjukFrpptx2RR//PixQ3B
	h8di9j3ko1Q5xM2kiQybdQ+DO9etB8Sw704iPoGp+QB5ZrmndTu6oxo5y1D1QYZDj654giCVGLmSZ
	JaR0LhPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsKgQ-00000008GA3-3pDd;
	Tue, 17 Feb 2026 13:00:06 +0000
Received: from mail-southcentralusazon11013044.outbound.protection.outlook.com ([40.93.196.44] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsKgN-00000008G8J-48ta
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 13:00:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QQBoGhz/VcqsPoAJeuoHOgY0GSBOZQSFeCcG8W3pEi3MReEGtPW5rlpoff5usYpLXrD3unRRueavxvK9b7oz+1lcqFynjZSBy4T5k1WitUK4g39gifCa+pC3Fjhl9hZ47g2blgKkQJjcgRjXwOTags6Il0Bemxe+ylDT3kgXZaxlZOWAMQ/ujomqGpftXJIRVV/YU3ndJU60zAIZLnhEvOEE7VPmpypCLyq+14QBkilYzbAmiZ2YDG1lBXsbqIGXYNkDLM7TyiSZxomL68lESyy/Yyb+PfnwZkEnhPpLc5+l4BhXpg9kSr7263hvoWTLUwz8/YWh3ubRW1YMQGbLaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iRMttMpqtXMMschQ17dp1wWmvQbAZ0i7DDCDXaRiyYc=;
 b=tq4fA+KWii0ooABYmRwRV9aBAO+4PvHzJkKwdXgR+6kRB1uWEQsSRDmR8ouv0OZukrIjGgVNrv6nokr5O8vgfSXa52vTcRVZxjb5C6N42Y/w+Ra4wH1DRTkd3t7L5/9f0X53gEeXFOX71HLfoMmHnSVM8RiEICjhQeeQyJlxxdeGR9lSAnsw5CzAy1UkwLhJiZhhCmaNnsc7twekXLbfRxyiHSDnMJmJ8tx232DunSMemSjtdHr6MxGmMoK+0ahdEDopS1cpZaR3KeVdNG0GfLXWoc5VMIDFTqNIfHGVyCj3IZowfTWtf41IKBA4KkHGXQXGZCk7/JOFUStXfe9u9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iRMttMpqtXMMschQ17dp1wWmvQbAZ0i7DDCDXaRiyYc=;
 b=NWR9idJq+j3yhjVyQ1cQ/1IZ63KJ1UZEnszEsoSRSC5VG0Em7pUZgGtDfZvTBTpS/QHiJXNolSbWulcmIMgLWDrFHDxD0Ytpbrrihz5LSIoQ0viWRdoqkOXE+Jy2+TZmod+4fb/RFHkkbmxUXp04BXnYx68xbcGI3ZLo/ZumDhV7H2j2KON0m9BofOPuriXMSkDpj14D4X4Ahtf1vGXmDDA+5XX/uR/7AhO3QW+hLvuChE+p3GnesARa2/+l8xttbAON7EN1hdEIz/KZLLx8dF9NmCMmyvXH71vXthZaIDPZMGh7N9dUXG8+sjlNtDj/v0uNf8l5aa+BoanvZOozig==
Received: from SJ0PR03CA0223.namprd03.prod.outlook.com (2603:10b6:a03:39f::18)
 by DS0PR22MB5970.namprd22.prod.outlook.com (2603:10b6:8:1ce::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 13:00:00 +0000
Received: from SJ1PEPF00001CDD.namprd05.prod.outlook.com
 (2603:10b6:a03:39f:cafe::f1) by SJ0PR03CA0223.outlook.office365.com
 (2603:10b6:a03:39f::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 12:59:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay2.compute.ge-healthcare.net;
Received: from atlrelay2.compute.ge-healthcare.net (165.85.157.49) by
 SJ1PEPF00001CDD.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 12:59:58 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 3B0E8FFDA0;
	Tue, 17 Feb 2026 14:59:55 +0200 (EET)
From: Ian Ray <ian.ray@gehealthcare.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] ARM: dts: imx: b850v3: Disable usdhc4
Date: Tue, 17 Feb 2026 14:59:51 +0200
Message-ID: <20260217125952.53997-5-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260217125952.53997-1-ian.ray@gehealthcare.com>
References: <20260217125952.53997-1-ian.ray@gehealthcare.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDD:EE_|DS0PR22MB5970:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c1d54324-d427-4915-75cf-08de6e24748e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pRH0B0EcxirbQIRNt1H0mlJzgLcMpiHLDRIGkpM10wvfbc8PTeuQ/UzkrAyH?=
 =?us-ascii?Q?moxhNbAIdgxCi2J7ZZIPeGUYhQfp6aOuIGuQHYkLuQCozD/GdRkbNqLU6pFM?=
 =?us-ascii?Q?ERB5qgCV3TiiaE2t6ijyxtg5cjxLto1mdRxNq/slOWGW9Y9ki8FzBUAwBJJf?=
 =?us-ascii?Q?dxjv3psa2EMMsu9iV6yFvitthFVpDUPj6e0FTmHhhR4F1G9ajnKTNUrbgF0/?=
 =?us-ascii?Q?V/DBVnwfTXl+02znyHELb2AMHPigCHWcujJq8F5H4Iz4djuDPpwR9hgWrNkd?=
 =?us-ascii?Q?J5pdFXpOFAJm8L74D2bf5+lOIvWBuffP5Z5ug5qOlUgsfq0cXqsDAUbSE6p2?=
 =?us-ascii?Q?SrtgSiCIncMWPs0C4F9stLpl4xobvneN4sFGiJVsvXsqjYRRMfXsc2TODZK2?=
 =?us-ascii?Q?qNjGTtbKXmfpduBuHvzwVLKLvpVueIcu91DRSlxRpaarw1ii5ULItjuyFk0D?=
 =?us-ascii?Q?GeyVx2scyMkcQ3bntss7ry/8bELA8JL0qwLAyAoH7mCZKVR1PdX4HHLy2Zlt?=
 =?us-ascii?Q?8c6yKV/B0fbx6lVEONXGSg/fEezqbR0RKFCu7Qx3pRcqq6/0qJrCmvaZwh9k?=
 =?us-ascii?Q?kLqAP6SS2VgyOuiGz7aDuew9Lf9Sa8RZDCsjUU+QH7PVmAA0386nHzH7/jGS?=
 =?us-ascii?Q?54OOxejH2I8M0hhmEOhVC9dHUnZXcGSB2maYuE9fE3fi2Kqz4hZBgP+e7sSh?=
 =?us-ascii?Q?Uv5wv+KnZIue3wabfvcalJz0h6RkDleO5R7KhnQH8pahxTleuceKM5Xi9oEs?=
 =?us-ascii?Q?3vjZ9YhqPwfIX9yLKO5e0u20ZFEeMyj+OaxacHq+/VuGlf2CmlLdr0yDXh/a?=
 =?us-ascii?Q?F2IDSHdxHKjRtsTiBzdwIUqr7ZYY5so6TAsFdC0CsB/tZTey30dICntCDg0Q?=
 =?us-ascii?Q?HULfLs2ro1z6KWpDe8Owtfr7rdIf5W2uEf2xugKwC2Y4y/kBpIFFwsZrafHL?=
 =?us-ascii?Q?tYpEUjIYKCR5y7yfcgLoYjAs/XuN8V7rRb5vjXi/OO/0gvxVecr+RivLH5jj?=
 =?us-ascii?Q?sBGG6ncsYFJLkumyZ03/pzioL9xOMYa+HVB1CCtJaGTBEZGirTOU1l5sxJty?=
 =?us-ascii?Q?iqRwVuIjKFrjYYOJnFMJ06cUYlsBIbii2TOoZNfxm4U5oGA4o29STp5IQzWL?=
 =?us-ascii?Q?CfEq8Jc83OysD/GQV3N1+L6rpKq+9YRFaZRZkRKEo5EWxKBuUigDT1fCdTen?=
 =?us-ascii?Q?ZkQgo43Wfn8WzWeVE3f7q5h60I1UjBnEa2m3P8WAD2ZI1MB3GWYHRDxil2Av?=
 =?us-ascii?Q?70vPCwazuv3N/GAxiiQHCCX2Nf2piiHoWrhnxlE/3Yu8CoJ1HrURSHO5RnWw?=
 =?us-ascii?Q?nBKHFy1DATlgIaOldDDa3QABeVZkFjbVoD+wkypiIpZ3HBPhXuhKT3h8ChMx?=
 =?us-ascii?Q?dx+4CB7fNrpnV81XO0TWGAxYWQGA0NSkeEMoejSt0GGAisMKwrnPVWL77rXt?=
 =?us-ascii?Q?XpyF5E8Re29SMsvh/uVM9SyAGenVRuAI8kN3uvlAu4rfm0B5roidzfeA+zya?=
 =?us-ascii?Q?Nr0VrzPzeeaTtT7TOEqvFBk4IJeVYfsn2m9jKQMT1xtf9/E7ZAojAfmH49Pd?=
 =?us-ascii?Q?DQcP6/keTvVvhvEsDKq5sh0/iqc0zFWoxbtHOMDXwO7g2ZjL694O1Xet0XGp?=
 =?us-ascii?Q?6VVOl6I7u3Tf9WaEfaOjoKC7z+x4Zbq32k0ykt//y+vUKp7tEgDNnheuiJYd?=
 =?us-ascii?Q?Frfv4g=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Hk2TSQ8O62Zuh3i58uwgmNtp23/v5Vaj5krtXRVkmNqWmWJ7Xtu9G5CRmdUH/hmBpDQv/XnpVx33Vz1wiTCwg8UNb94Sw2krBtAul6QZatjxmvnEC0VTxEqrIixBTW8UOBJUAu+POPWFVKDvFEBW8zc0DXfFPb8tkWcPEUu6nY/LjTqw951yDb/ochNznXyLE5IQ9EKRKxzXqDfdoZFfcXMZuqf8n2nX6UJd6CcBQ4v06wluolRCuFjxUqEcRoCU22imAvOy1+rctxDGij6wAay3OtOOCBV3GuqE2A2t9ig9PnrYzG3kIOnkubMSXubCmxhlVDAE7eSmnR2h4UFq963idlEICGzucGqR+xZY/UE898w9sVF854Sc8gDaw1QPnJmj3p3Wfhvnavi0Xu6GTEvyiYC+HgH1uF4ooynm+siP33PkXfefiCFroCXiap3T
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 12:59:58.4394
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1d54324-d427-4915-75cf-08de6e24748e
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00001CDD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR22MB5970
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_050004_205914_029F5323 
X-CRM114-Status: UNSURE (   9.10  )
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

Disable the unused interface, to fix a log message.

```
mmc3: Failed to initialize a non-removable card
```

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts b/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
index 30181b5132a9..a030b26e06b4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
@@ -303,3 +303,7 @@ port@4 {
 		phy-handle = <&switchphy4>;
 	};
 };
+
+&usdhc4 {
+	status = "disabled";
+};
-- 
2.49.0


