Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31680C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 07:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yF85aJgSMXtw3n5D7Dt1dmtFN+YP3OBd0/9wnXR66JU=; b=ZAQdhE54RLA5dsFrU+XsmTPKYj
	xCjbNdvvA0loUx2IpcVpSBbks610jh9qNHNt3agY3Lxr126WBH2WiZbUGJ28ODjeMGShim1iXrcmu
	J4XcGGTsWVilnbcuW1y2buxyh4oSgGsXBBcw2Evt2qSLUwhWT5BrLwYBuP/wdVckrd01jbgJKK9JJ
	CK6AdssADZZNpye6KqpnTAl2BML+2/arwjeswlQkAi7GEkWSrjh9svRxvZ1kOn1bjmBG3059e1X38
	j066e/6e3WQeOeYSSfjmJIrEEF/NetSp114yBpIa1VAIkGQ1pAgdER1YZ6QItg0cTreSsLj4eAMvT
	QFIWpSvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwx7r-0000000B2Oe-1HD9;
	Thu, 20 Aug 2026 07:23:47 +0000
Received: from mail-swedencentralazon11013049.outbound.protection.outlook.com ([52.101.83.49] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwx7a-0000000B2B0-0ELY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 07:23:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KtYdt3Ke0wE93mxGob5W7trb+cQYk57kSO0yk9vzCsvCXdfUJhzxNYkQTfwEs8hE3q9dDj9qXDcCIOtfv/ZlRudp4nWalgkcesZBo0bP4iqpYJtDzB8mURdBdTE+qsLVv9gBSR/MJKcS4p1dVbnMbu3+VrB4maAJABP/LHrBjIHESK8O4VY5eAt3uSREoklc7Mx/HZBGCZc4I+ZeQ7QdA4UyvM9jAjtClv1CIJx525vAjZbLvsxaUKVB4PRQnNRgz+HZXGm/16Xgy8v9gqd/F2Ozuxssg9kfje3qFpVfS68/hAL7Rk7dFl2ySheTQnsRUtJazdQ/QBbPFA7QC8dlnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yF85aJgSMXtw3n5D7Dt1dmtFN+YP3OBd0/9wnXR66JU=;
 b=u1HjtAbcGkEZIvxY1ZACdWtTnaQfRsyzweaEDlysuemuzvdsDT7KhWWdvjGaY/laD919PJeBE7PSK5T3pgUyK909H61CK4KYZtyd32QUsLZzIbftwYKXpwnufDZPZdp1dJNwu7M77//kTIXzHSJa3t0rd3mzxDNHqiemW2R0RvPSV2CB65v5l3lp9DnYP2IKJfiEuocNgIQJSG5LDN9JVaxM5+kmL/SB6igCyGYJfrsX9FoAUBAJJO6wbnSkb6rV74kvQ6lyfM2s49V4eQglQSpKHcC+0NLvMjBDEzZBqpPqBjcr/Fr6DyEiIwwnClmBIaYWEfh09oUyBqy7p6ZbOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yF85aJgSMXtw3n5D7Dt1dmtFN+YP3OBd0/9wnXR66JU=;
 b=YoKl01lcPiDBweEUOq03YASmAIOiEnew1y+uSAQKIpSTlZuBl8fcC3BoqnJKWqJ3l5dLCbrmU/pGiK1c5S4cjco4DT9WPZrI6MopUKSbCoYkZsQjURDlnZO8dVMdUAYBqSQeMq3x5e7b+jdTni10mhxmeuzekNngrk8K2Vuh+k603MdPBGxDlTEFE9AvAJpCGCte1N4YG1dG2nWnc5OzV/9gLyjAA4oNyZN6xGOnJoJmlroxi6CC9jb0Xfmi4VIe8cf3qTntSEpOxg9upNyUhc/ZGsnXLqfu3DUgJyY9h8QR3TtVTDIaOqozn97NJVWvhtLl+57OqnqvVIxsPeVajw==
Received: from AS8P189CA0015.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::11)
 by DB9PR10MB6421.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3db::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 07:23:22 +0000
Received: from AMS0EPF000001A1.eurprd05.prod.outlook.com
 (2603:10a6:20b:31f:cafe::9) by AS8P189CA0015.outlook.office365.com
 (2603:10a6:20b:31f::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Thu, 20
 Aug 2026 07:23:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF000001A1.mail.protection.outlook.com (10.167.16.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 07:23:22 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 20 Aug
 2026 09:28:21 +0200
Received: from localhost (10.252.29.67) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 20 Aug
 2026 09:23:21 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 20 Aug 2026 09:22:42 +0200
Subject: [PATCH v4 14/14] media: stm32: dcmipp: instantiate & link
 stm32mp25 subdevs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260820-stm32-dcmipp-pixel-pipes-support-v4-14-d212eb4e3792@foss.st.com>
References: <20260820-stm32-dcmipp-pixel-pipes-support-v4-0-d212eb4e3792@foss.st.com>
In-Reply-To: <20260820-stm32-dcmipp-pixel-pipes-support-v4-0-d212eb4e3792@foss.st.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>, Hugues Fruchet
	<hugues.fruchet@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.15.2
X-Originating-IP: [10.252.29.67]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A1:EE_|DB9PR10MB6421:EE_
X-MS-Office365-Filtering-Correlation-Id: 705be721-aa7a-41ef-2511-08defe8beaa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|6133799003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: IMDBOjTErvwQ/C2HX/D3dYWXUGa23SRRA1y3juTXoZNVSeL9K0Xqrr6k/qiyFO/woFR7XFtiNuEHOr4d8xb3IG60SsX3KktTw90kEl7Lg8rOiUVjzVbFO8uXdx4QoUR4kXiKv0UUNlIwn/QnF142yduq8aq3Wxh7I6X140iDe95ToZ3/KTd6hHEEIA9J8jmIgzClDviv9C2T1cYymzc7yzMt6DOJME0Rjrsf0qZRW8t9lEBusJLnPHcNeXgL2q9SnDr/2tZS2NctQce3MTqOSyW8ouapabsvHC6lg3uVSE33WIWcEUlSypb4BMxoYpzueTS3CAqrq1UI3KU6EW5MVviT/4l7sWEyB0CSOM4ThgCD3CCyU8ngDAe8QAf3ZnyxQtGYxv5Gg3BE3fqF9N9GFYIJ+bYjg39jI8x9PwbJNGGOiQzfj0Ntg+Gu8wxxdFlMl6a6Xd5T9FCGZyszFORWmbEq9p8NuOZLKKygIm8nQ7y4F5reZezLVlwQFsNZp1qTa4nw2y+2RF5mUtVjJTAIOXwuT7xlL45GbHfAiOzVKPnKd2RsyAc3zENAVoS7x5mvrG5HZcWH96SMTWDBSVz5o4eej6R8GOTh2NOZ5SvUO6Zez73iTA07XRKs5rxLyDqokOLDF70gzFkPMxoNt/MjmyaIEz440ODb7xRTd1B7WQQ407ody+Vq0G9jLDG/qEZLAixFmp9FUfaDBA5Mz/4f3Q==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: XlP25wriivTZx+Ipw9VwFR3nq+tTG/hJOKYi13hZhq7TPPFIxUYyT8hecBPkC+Xp+LGextB4KOWwM2j64sxMdmHzkh/gMHHvEIG8qPx6LYbHj+uCLgwGCw8k+afo6vnPly54EDlKXUe+gYwB6CU4Wv8XT1snJyed0tFO7YZ5Ymo3xGtmPs1uTBD7AMirJb9NPCwj9/zPLXGkyY1WdqVqhxhfR5O+J/PN4V6mrTpH0jKqhr3dUbQJsJh8OSM5iGKZ+y4Ha55eEFGC9e133ia76dgPZiL9D4S+Csoyx4yqej8cBFAnyhzekqF2Tq6qD2p42cZoPkrxbl0STJA1f9Z5sOQJDI6N/Tdl44gCat+ZwNvvjDjc6c+oZKgKKi7FALkTXvkxJzqAhtK6wHu2kg9kXHuDWWaqylWQW/TFDx3YoP9Ve2wRWEDJu/mwskShKH7W
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 07:23:22.3223
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 705be721-aa7a-41ef-2511-08defe8beaa9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6421
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_002330_104236_278F8AB1 
X-CRM114-Status: GOOD (  11.64  )
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


