Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2161DCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 13:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2tiES/GbyB4fWos+Pgblp+C1jXwj9g+q/ZWaN/wgUNQ=; b=2S4XTKdejZiyxcwH+VVLO0VkVs
	KFZSGuUEZub90XUXqbRLeU9QoLJCzJXAzQxJPujKoV9xr02qwbdWroUoFuWIdFfOrX5OIOwaLl7Dd
	FRuMFvAgz3g4SG285pV/UR0sgi537SMHwHrQ5UVinbpzaoc+QNs7cdkmg84G/8VY/GY59SNssW4V1
	vCzv5Kup7xjq7gDLiZThxzFbAZc0V2P54+lzWc3/dsUEoUZCbGxxWD5fzToH0GOICtKPcd5wgYm9x
	38T0TQqGwOT2VC2zSkTQkjULf1mIQTXI/OiPl3iX2+jOGRo6ienStEMIIsL6hFxcB4pS9xkOxP2f2
	E+aBfPXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUOxL-0000000D3uj-0Ykt;
	Tue, 02 Jun 2026 13:14:55 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUOxI-0000000D3n4-0lKo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 13:14:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OVehXWBGC0BsT82G5Gp+5tLmi03MoONuvlmE3syiYa6dih89Jwo71DtFGxgDWvcOSVjbcBGP9eCO+4OZZ2p7wBxjucjkcaEn+7m3nZfD5K5Dte8v+hBPYUyXUtlj1xLn34fQTtYHZ+olkmCchRcIFLMwlRWewLnHPUqsGWYAflaLLBnOCejmNVuVyj7QjSbBPGqOBNJNpB+paie5etLnNUk0YJ20kKgi1WiW7PtP9zCfo+JQHM2a888wsgi9MEvrvZmccvopUyiQZwwN1YAiTx8Qak3Ytxyc3SnAgwslwtbIIGRmox6b8FpKypw0HUA/XTcUsRerMtXNMKC4NCkHog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2tiES/GbyB4fWos+Pgblp+C1jXwj9g+q/ZWaN/wgUNQ=;
 b=IofHPFlFmCJJBJWpLU8vmlqGuggC8Low1twWEFd4JQFeab6671UDsoPF+cMgN2DbJOJUUEP6uElTaBdClzcBBi8HZmc/tR5j/Iu5hVwJyxnLc/jkosEHiFeqk1c6YBQM9/RJEdFIgVmfvBfeKmpOg0b+0E0Q+9uFLTbxiZp5+MQDy/8hMEFbCrxBnAcXbI9ow7RlJ7QN6SXKVuMwf4WcbdGDjOx2RbS052Nz3bd2y8w7Hdi/HZX0u5yDOY2Tv7+oa36fvKE3OSoyAj8MT6jzPbF7x1zY5+TDQrF5YcLy/rxTXeSZshrYsCL427Qgin0whRxp8a6ghGyb9eBwR/yhiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2tiES/GbyB4fWos+Pgblp+C1jXwj9g+q/ZWaN/wgUNQ=;
 b=FhMJsVUnUi64OrB0t1VrNkI9HKUxi9q27GgD05x/HmwmHecUmxEfOHm7xnRcJsc7YQQ3qAE7QUFh/UWOEi2zRtgzBLBvPRUYx2OkO7NL7SQ6yH0Rk1mRU4EjRxJRCfWRACZEvqYNqz3N7jzs0jtSVszpWBEMba5oeA/3b8eIwdGz8Y/2ZBuaTGATeRN2ZWSUkZQ1fztgH2pWgSwHDIiUWRQd7rvUCcCQKDbU0NClJWfp0V3Wy8rRev/iUYJuxrKteFTLPVsmNGRyq2s0nAaEzecU7Jse9y5JmvbcMyHctBW9gEFcoLgqgIqxaym436WKiMP9bQwEcmXLf9ndq7WZhQ==
Received: from CWLP265CA0462.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d4::8)
 by DU4PR10MB9047.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:55f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 13:14:45 +0000
Received: from AMS0EPF00000195.eurprd05.prod.outlook.com
 (2603:10a6:400:1d4:cafe::60) by CWLP265CA0462.outlook.office365.com
 (2603:10a6:400:1d4::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Tue, 2
 Jun 2026 13:14:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF00000195.mail.protection.outlook.com (10.167.16.215) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 13:14:45 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 15:18:29 +0200
Received: from localhost (10.130.77.119) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 15:14:44 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 2 Jun 2026 15:14:10 +0200
Subject: [PATCH v2 13/13] media: stm32: dcmipp: instantiate & link
 stm32mp25 subdevs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260602-stm32-dcmipp-pixel-pipes-support-v2-13-3c76b5f93157@foss.st.com>
References: <20260602-stm32-dcmipp-pixel-pipes-support-v2-0-3c76b5f93157@foss.st.com>
In-Reply-To: <20260602-stm32-dcmipp-pixel-pipes-support-v2-0-3c76b5f93157@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Alain Volmat
	<alain.volmat@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<sakari.ailus@linux.intel.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.130.77.119]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000195:EE_|DU4PR10MB9047:EE_
X-MS-Office365-Filtering-Correlation-Id: 33e2159d-3c26-4b35-6c77-08dec0a8eaa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|11063799006|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: eomKL01yGca4y3V+9n5FZlfQKeucA/xu8zSKQlySJtvKpVnfGIuFG5X7xTrmkqJiUZqUFLG4frYH+7OIjuDfv/78x5+XX9vOh9dm9M4bBwMo6gys1Qrnzumgy60fjdFk4EwWyMYFs5LvY9kSvq4BAVVlsMlZ+vQiYcfQe1x8cCOkV7fULnCEMXR0P7nLpqnFCgpEpEDm3QHYnmscOO1XkJyK9Wbx7V/OSvDZlmZauj/OF1WNGHhKoRByNMi9ntqHTpRq8YVmV3kUfcOAOAiTILMYWzjAcVrk8WTg3lHvArIX8ZpriXeDd7u/SS0xGtWKmaUKsip+AtL343PDoj/TORHqM5yj5BvLjVk2ndj8D1HTS58X2gfycOoKBlqpIwVqemvml3Ma1Kbdx6CkzX//4EYnlDmGCB71W9m4MK6Vo27cf4aJlJkfbll59TEVMWm58mRzCcK4rTIKNgFkaIu6X0hEERJ3pM2a8Ej1ZHhi9YfPzss/VrS+hn/8795mn9yzOLnj+Q2Y0fZ4nUskac/sDFm0OHPDtRItdJ0uREnJjfhTDYuyLtfJqh/v42kXZ+JUwKmAfZ3zdU2PTmEIprbNSYoZzW/AEFhK60k9R3RdAEPnuvsQsiN/vSJipZ9iEhC16e93SRK5YulgQ9y0HbbOrfHa5l2m2kUfbUZzWk5xRwuBIke6jzLgY6WrsOUIsUP38lPNgwjwzvD2QyYhsD4VMeJ8dlyuNPcFbt3gWAgfRIM=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1Kd9gLYyszXZLCicgpYitrdgTo9B86jL7/lzNg3tMTU66OYoYvjL+XRbF2AS0XBcvyvOukcnAhH4VGHWavfsALlln6+7PiPJ56tfvPGh1newy/G4O1wyUqodQhU8ais0/s7JGJQ/bw9tYnCgm9i2zFf7wZo8KSppIh1MMpvYErL1GA56B51DW7pnzM0wftRb3+o2u2GhBP1JOqxY50PRFb2vC15uvZseEtXb/zYgnRvCWRiOWbUyxHVmiZotQT7w8Pg/2cmnowlXaiSeqDwEp2vsqeEW98BiL+jsqvxvoJ9Bdt44HpzItPzlMfoFmtlH8/DfLAq4oMxDkF2kKHexnf/WXWBsEdDzqgW4owPmYxVDmS6hBNTS/1AxkNq07A8QbUHSilUsotsyISGAeZQgvUi357+QGhtB3ZxZN8LVaPhmGhgx2Ck+fHLLB0k8Snvn
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 13:14:45.5711
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e2159d-3c26-4b35-6c77-08dec0a8eaa0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB9047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_061452_262282_BEB273A4 
X-CRM114-Status: GOOD (  11.49  )
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
index a52b3b0e3c37..44440f8ea9f5 100644
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
+	DCMIPP_ENT_LINK(ID_INPUT, 1, ID_DUMP_BYTEPROC, 0, 0),
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
2.43.0


