Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F9E1C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 16:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yF85aJgSMXtw3n5D7Dt1dmtFN+YP3OBd0/9wnXR66JU=; b=V06PNzgyepeDt52Z3fOpzmWaX/
	7E/GpIxYvlUaCl4YaArCCXeRimDJcSxguzdBvF/88YVzP9wAFcX7I0Gj7lswD4YuTw/8lZcNDsq2c
	pzN4JjaFyJE+GCh12ra65GUWbj8pypOiq417ASfGu2Yq7fgW+xOZAb/Cl2kHKHVJlFodGJQiVSIpO
	JjmMoR0gPCw5kWvjQNqS4r0iX/ofnyWDZ8RKXJM14sQcuyKM8p1aeWPgxTGiSwjNW2xj73Mmuj7Kx
	+HRcQPyG+tilSdFcNYtis3eMynXPMMfm97dBITf8eIeCdFvamAlJ5nhWCai6y3f/cYMLuOiUnek2/
	+jBQvq/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIYT-0000000Go6O-0kb6;
	Fri, 24 Jul 2026 16:15:21 +0000
Received: from mail-westeuropeazon11010006.outbound.protection.outlook.com ([52.101.69.6] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIXe-0000000GnSI-1EwJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 16:14:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SrKx/Y0Oo0YNeENUR0DRK7/nVAMHQLn+0X+Snq70x6xVtcYZ9QOhWuW06SpBtru+rDbR0eL6yXVZd49IUDSD7N0qBF+wFnIOilw5LuBPakwCPSbNasFy/5MWc3aYb1+FaweC705u7I/PEgYfxYTQPV2rL2oJZJ972E0GY7oILV0WRLzwGCVthSJHShCKaSbevdJL3gVIxYIW6tZz71BHv8px3pa1nOv6HogZKuEhQB5uJR9k5+KzUKTb0GmQLiXoCGW91jEFCHQboSZsu56QseUbN0Wk1uRvUo5koyBp6fWKYbjrj2KndrHIU2KV0dkr41uYFV22Pn80hDIoIck6ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yF85aJgSMXtw3n5D7Dt1dmtFN+YP3OBd0/9wnXR66JU=;
 b=wv7dkdFOvkozrYhDUhqmztkIRLVO90GLKw5BC9jEwkEqvw3cw35tGsf/tj52tYvMd+p91ga64CMBU20obzhuhnjC2xSOru0Wlje7XZ30XmT9amxgwO2enRgHwtnmmpSqzL8+9DsdUrRPVh7KtGPxInOMjJPm2ZW9Tgchsu2M7RUfAf6ZY0cTq1CQUxeUe++J3kwe1bT2i3t+v4ghaWjbVHB/DxU1IgHc9MyBQ2wAnO7aDHB7HUktUqUIOOtZkN117yBnxoD4Tvf5+9+HkueiehntieXlcPbrY2T5mFnTzVQhmlRcbgemrUvwr3tzGS/CykbcuPNc4GR5T1plH95IsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yF85aJgSMXtw3n5D7Dt1dmtFN+YP3OBd0/9wnXR66JU=;
 b=k2LeFflAAkBqabeDqbE0IH0JVp7TYPQOLOz5bSuWC/DF0Ha1zEOy3KvtSrhs3gOqEs5FlGsDInWYExrmseeNtvmwF6lu1YNzxU8HHuAPAHlgvGF4hCK9IBJ4TGUCvgec7sLl70/69x056ocLH3TKDi6FMkgAfnY+GcQ1YOVDPFBk73C2CT1Yk9pgTKzuxeXrvHFxBY90jBvfEPZAGyXjf4jEgdpgEydMRDbAn0YgUorGvRimp2ZfwBXCa03mA2tV2HdHWMhgZshYBITG3nH8lT8tqBxD5RM1HG9el29haKLzuCIABE688UQ9B/cSnYlb/8Jq21po4k5mlAtTXJuEDA==
Received: from DB9PR02CA0006.eurprd02.prod.outlook.com (2603:10a6:10:1d9::11)
 by PA1PR10MB8840.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:453::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 16:14:24 +0000
Received: from DU6PEPF00009525.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9:cafe::86) by DB9PR02CA0006.outlook.office365.com
 (2603:10a6:10:1d9::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Fri,
 24 Jul 2026 16:14:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF00009525.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 16:14:24 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 24 Jul
 2026 18:19:01 +0200
Received: from localhost (10.252.22.128) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 24 Jul
 2026 18:14:23 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 24 Jul 2026 18:13:54 +0200
Subject: [PATCH v3 13/13] media: stm32: dcmipp: instantiate & link
 stm32mp25 subdevs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260724-stm32-dcmipp-pixel-pipes-support-v3-13-f77fe7e723d9@foss.st.com>
References: <20260724-stm32-dcmipp-pixel-pipes-support-v3-0-f77fe7e723d9@foss.st.com>
In-Reply-To: <20260724-stm32-dcmipp-pixel-pipes-support-v3-0-f77fe7e723d9@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Alain Volmat
	<alain.volmat@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.15.2
X-Originating-IP: [10.252.22.128]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009525:EE_|PA1PR10MB8840:EE_
X-MS-Office365-Filtering-Correlation-Id: 19b78a7c-13b2-4cb8-7a42-08dee99ea0e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|10067099003|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: c/hY0vVerrP236fjLSH4dYtYUZt9/7EnG5cFyoc16t8AQl/eHw85HSQwU8lorm4vBv6arEdx6AHCJcPE3efvnINUtN4tBTjS2wX0zwbJN6goN7lVVazgS2q6xYft5TH4Qibl0OteIiT3fNxqKb1InCluHWokHxA2OXCb/gRYZoGsfHSHdwi2/5P6q7tIUnHnxTcLdo2ODoKSjdWF4JDc2MvyldDemZ3Q4+uM0Sdac000Nmkfy6de5LVvmgeZwf7/ZOCUgCccTC+ZzQwdcYNVwQ583qjf3TfI6X9v344XC17/p8OF9+YYZLqxSnVqiJzqWmgqB9dbQ3S00i+La6foojTseCBuMQavBOMQmQ1JI2DUZV0et8XW8gkkHNT9Hu2vJRkMfpOfCDwZPYGH2tHfMlwQqSLVH6jrpUhQvfNh9zpPUbmPd4mgz9gzcvOCHviEpLmfWih2CiG2ynq5dT9ex0uqDFNKX2bjBMC6HrAzTCns7993TfKcOfSubnvWFkfHFb5nHGBcnzq2K4pxu572Ds0PSmg0PCqWHRaN+4ME8CBhWLUempd9Sgb9p6eIqU+dwnkrR/Jouhs2RYA3ydyfuW0nxRSojTV6RnI5a76rYtdNm3raUupYd9NggtjXUxe5dmyn32s2DjPkJKydZhuz+etUzC6EJSdTpW4ExgQreMcpxdDmQV5dXDxFzFvotcR2zBJCgf4EiIu7WpRCCYDi1Q==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(10067099003)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: aUDWGQk8k0wYPQGN31TNveMCn8zAzRCQrGAjcLuUsd3ARpzpcbUG/8nGF4+AAP7AyX0fjaOgitNpNoXwCnLjNfu3rEyQozIXabpWPYyEx50vB96Nkx0RKajcMNzlDYy5kR4fDw/pBWrsEJ0YHKislvgc7oU5J2R59VQvlvkModnDacWr6SEfF4DpP40LxDbbSb71Kcasl9GO926J+qC37k5AG0UKi5BfcZkoj1oquRnstQ+1Ayw39hs1f3b5D2bR10qzz36A8QHGIFSN0r/93p7hm9+iG3HZM7Dt8ePzeAy+DEFFCrblD0csFmQpNxZgsSz192yf4GNTvPGWZf+YKZA5scDIzJrQW58xfAPdGLbfDz97BBtpU2GNtuHnUPdIFVfAXNioIHcb5uXuGu2pEJmFIfgmQiwy6LcfY3tFB3AmxUeP/M5utZ8CqUqInwVd
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 16:14:24.5461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19b78a7c-13b2-4cb8-7a42-08dee99ea0e4
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009525.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB8840
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_091430_391818_42369A4F 
X-CRM114-Status: GOOD (  11.90  )
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

Add topology of the two pixel pipes (main & aux) of the stm32mp25.
Do not make the link from dcmipp_input immutable and enabled by
default since not all pipes are always used together so when a pipeline
is not being used its link should be disconnected to allow proper
pipeline check.
Not doing this would most probably lead to pipeline start failure due
to incompatible pads configurations on the unused pipe.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   | 42 ++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
index a52b3b0e3c375..4b6b42fd148fd 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -75,6 +75,11 @@ static const struct dcmipp_pipeline_config stm32mp13_pipe_cfg = {
 	.hw_revision	= DCMIPP_STM32MP13_VERR
 };
 
+#define	ID_MAIN_ISP 3
+#define	ID_MAIN_POSTPROC 4
+#define	ID_MAIN_CAPTURE	5
+#define	ID_AUX_POSTPROC 6
+#define	ID_AUX_CAPTURE 7
 static const struct dcmipp_ent_config stm32mp25_ent_config[] = {
 	{
 		.name = "dcmipp_input",
@@ -91,13 +96,46 @@ static const struct dcmipp_ent_config stm32mp25_ent_config[] = {
 		.init = dcmipp_capture_ent_init,
 		.release = dcmipp_capture_ent_release,
 	},
+	{
+		.name = "dcmipp_main_isp",
+		.init = dcmipp_isp_ent_init,
+		.release = dcmipp_isp_ent_release,
+	},
+	{
+		.name = "dcmipp_main_postproc",
+		.init = dcmipp_pixelproc_ent_init,
+		.release = dcmipp_pixelproc_ent_release,
+	},
+	{
+		.name = "dcmipp_main_capture",
+		.init = dcmipp_capture_ent_init,
+		.release = dcmipp_capture_ent_release,
+	},
+	{
+		.name = "dcmipp_aux_postproc",
+		.init = dcmipp_pixelproc_ent_init,
+		.release = dcmipp_pixelproc_ent_release,
+	},
+	{
+		.name = "dcmipp_aux_capture",
+		.init = dcmipp_capture_ent_init,
+		.release = dcmipp_capture_ent_release,
+	},
 };
 
 static const struct dcmipp_ent_link stm32mp25_ent_links[] = {
-	DCMIPP_ENT_LINK(ID_INPUT, 1, ID_DUMP_BYTEPROC, 0,
-			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
+	DCMIPP_ENT_LINK(ID_INPUT, 1, ID_DUMP_BYTEPROC, 0, MEDIA_LNK_FL_ENABLED),
 	DCMIPP_ENT_LINK(ID_DUMP_BYTEPROC, 1, ID_DUMP_CAPTURE,  0,
 			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
+	DCMIPP_ENT_LINK(ID_INPUT,	2, ID_MAIN_ISP,  0, 0),
+	DCMIPP_ENT_LINK(ID_MAIN_ISP,	1, ID_MAIN_POSTPROC,  0,
+			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
+	DCMIPP_ENT_LINK(ID_MAIN_ISP,	2, ID_AUX_POSTPROC,  0, 0),
+	DCMIPP_ENT_LINK(ID_MAIN_POSTPROC,	1, ID_MAIN_CAPTURE,  0,
+			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
+	DCMIPP_ENT_LINK(ID_INPUT,	3, ID_AUX_POSTPROC,  0, 0),
+	DCMIPP_ENT_LINK(ID_AUX_POSTPROC,	1, ID_AUX_CAPTURE,  0,
+			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
 };
 
 #define DCMIPP_STM32MP25_VERR  0x30

-- 
2.34.1


