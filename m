Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA69C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 10:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NnH+ZSEhlCd4rHV81aslMU0DtNzllincRE46KqIsoI8=; b=IpEfXCPqSNn0m0EAMsIcVOXscd
	KYQHEguVIMUYvFNnVAsz4Bwlx217Y6Gp5vYMIDiq/kqJQb95HacKognuNvPzHraDhvkqddFUUovnp
	5ekWns1+6O+cXof1Er7abp9KMhJLonNvcDgLiL/pdUbof82MAQdQnEI9TijpSgrF5h4Z/uksqEDq6
	MaMWs2NeUo9i9UjRJyWOZulfjDfjDhYv5MDPJEKUtx1IW/D3jVo4/mjqp26wikrJAY4mDwtcWhAuN
	niqQ4Z/qhu4tdNb/RxwaeM3TgPrjKw+EEN1qbHeoVDBHazpJE8JN7s7i4xH/772emkaT3GKhiFuR8
	hG7EXqPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp1Mk-00000007WKC-3xu2;
	Wed, 29 Jul 2026 10:18:22 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp1Mh-00000007WIr-3JNM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 10:18:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cw8K+PCkscQKneeyhLXbQMWSuz+hcfLH7n1YD5sVfxRM5JXujPscy8YIRD7sxO1Q0fNwEzagDuf2KRzBaokR8ozn8hD/nm3V2mXpSw4OLhJw8lQ/d7gg/YvIielDeCMn6Lkl/RWPC92mybZQ6yuX9+d/nJBBQojMCPHbI4AjNtrjBoS5H5Zd+98Q/J265D2G75AvYdzM9FvKMM5r8QF1qgUmC/LfTvFrbRISrFHncBZGLkuxfPT4OCTsCW7/SpjEVL0iRZG75QxtTwZ7t3d0GN2Gzlchhrdy74vJpsbtWSdqgiZbOL7MxLrlGamcrs9+LGLIS0ylAadyblKskRjGPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NnH+ZSEhlCd4rHV81aslMU0DtNzllincRE46KqIsoI8=;
 b=dwURToChGxCl/wxq0W95ecx+SyC5XRY58VAYiXP670+KbEkuh5yvDU8O05Q01znRLo73gWJzmU7h8j1396c8843ZtMcEj4jtDu07VdIONuVtyDTBvvdAI8+nSSoWtMhFpH2vueyNGfwIaHTdh3Q20Fv9jXVQ2a+XJ3lQ8Yk/UONKSTNk3n7O8bZIQd702fYerAt+7X00eKYnEwozRunowAdwp7vJKO5Mc7YaMz17fHID8wREU5WdauW+HBk1+qT+xPoCcMlEtPEE+bq2Dx1QtxKdYeOZd3lQmANohNoZU5+pjXWPhsuufEQeyfGl4vqxh6SmlmQ4AYZbxlPDCtgS0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NnH+ZSEhlCd4rHV81aslMU0DtNzllincRE46KqIsoI8=;
 b=uOFIN5CyHH5+ykBnPeLXgq3LLAzYcpLKePkB6MEUdfNclRagYmayKG32fv3xel0YNPoms7H9lvFBN+DfVJUvEtaZZAb8/8aYH6VUu41lwjes/qdCxqg2RFYR+oTcA23MQevzvjDIbeOne7MqUXfdJCv96QmmjSd8ATbe+T3lrBA=
Received: from SJ0PR03CA0261.namprd03.prod.outlook.com (2603:10b6:a03:3a0::26)
 by DM3PR12MB9413.namprd12.prod.outlook.com (2603:10b6:8:1af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 10:18:13 +0000
Received: from CO1PEPF000066E6.namprd05.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::14) by SJ0PR03CA0261.outlook.office365.com
 (2603:10b6:a03:3a0::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Wed,
 29 Jul 2026 10:18:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000066E6.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Wed, 29 Jul 2026 10:18:12 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 29 Jul
 2026 05:18:11 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 29 Jul
 2026 05:18:11 -0500
Received: from xhdrdevl202.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 29 Jul 2026 05:18:09 -0500
From: Rajesh Gugulothu <rajesh.gugulothu@amd.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, Michal Simek <michal.simek@amd.com>
CC: <rajesh.gugulothu@amd.com>, <linux-media@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: xilinx: vtc: Dynamically calculate pixel clock
Date: Wed, 29 Jul 2026 15:48:08 +0530
Message-ID: <20260729101808.3904212-1-rajesh.gugulothu@amd.com>
X-Mailer: git-send-email 2.44.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E6:EE_|DM3PR12MB9413:EE_
X-MS-Office365-Filtering-Correlation-Id: 881049b6-84a8-4210-4e51-08deed5ab248
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|23010399003|36860700016|1800799024|6133799003|18002099003|3023799007|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: NDMX7YPshkuLLVGFUWFHW+nGZhUn4xZrB+X5YzqDYBnSUwh5AyEFj78fzh76PK2V9qJfdjI5Rdldl3n7gmOgyvXxgt4OEAxzSCwKBjn3upEI+A2hQp2ougOohF65Sp4Lblacr1+urWvVehu07NNqhAWVt2kOcgT1/umfaLIaMMR/xA50GPsE4x7ZIDGIT3NW31nJQRKvvBAUDTv9wsZVZAXTNcXCQCJPj9hjKOm2KgJ7CDFHw+R0IXs+LsSMRZRYC+uDQhCb5opDBi6tEkM00P3zXtgB6xfuxLiBcWYMACVGctV+ChsX5S8ZzmqsCKyN1vIFCUs7NVaCRfmCMZqAhB+BMlj7v2XcdMfg4iCEgNbSUiM+EC+ekhm4vVTCh6blui38TsmzcM6bC4oVqtj0S+tsoccTM4hxldnyIY/5F4f9sNAU9L5CLRWNqqlKPXX1w0/1/WBjCM5GX5jEtG8moX283k38quk3j0lpMM71y4SherXmEOkg9Cb+NUq9twSBP/9TehyuDYlhRhoDtHjZs8l+RpOnh5SVEbkiLkLKvvkpVpRNMk/XLz5vIMPf5QwGXAuvIbl3JgTJANHmFp1lVeyWWB+E8jQFZlmnmrkaJGy3Rt0CPEM4/CFSGjDMgv74UVK0xVMFbbp5rhB4fGCgaVZHLzSgv2lG8A2OKUoVrIPxwUdb3j/UPgY6lBAl2Qs3LhptWuSi4zsdghoOxXnqNA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(36860700016)(1800799024)(6133799003)(18002099003)(3023799007)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: t+jDlNRpx95usllQ1krvvS4Ks9I1/3BoKI3F2rANg85DBudkjvgM0K8mmX7B0ZH93GhqgXKQsjbGpAn2iKSTB2UHGUNvLHqt0Qwa0lQ+bsiYdZRtFO1rEjn2Iim+ltmLHJJE5zoZSRARjIhygrcy3XtGEULtiQNypwMttdoIw6ITfyfbUqu6sBBaS29ayiNPXjr+iMky82FuPkVnzq7PRqqsrdpQpwjqiMe8cczHbFi3polB3EOXCCkIoTampQQH2BCl2R9hmG+42mrzl3Zdwlt3l7IqPKszgEA1NyIkACv0TWo31QTs+cJ69z5QRQT25G5k9TYXFrgy7DyDt2aQH5gI2BCN9DMnGIsCqK4U9aoiOPwmtRwReAa14qrUytLerr3Yek8pHYsXlngj0OCY8jwfh1QzieMG0lfC9ruxP2YI9l0HfdCTyt2NgCBIREKH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 10:18:12.5761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 881049b6-84a8-4210-4e51-08deed5ab248
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066E6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9413
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_031819_828801_94D57EC0 
X-CRM114-Status: GOOD (  14.87  )
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

This update enables the vtc to set the pixel clock based on the
specified timing parameters. A new fps field is added to struct
xvtc_config and the pixel rate is computed as fps * hsize * vsize.
After setting the rate, the actual clock rate is read back and a
warning is emitted if it deviates beyond a small tolerance.

The pixel rate is computed in unsigned long arithmetic to avoid a 32-bit
overflow in the fps * hsize * vsize product.

Signed-off-by: Rajesh Gugulothu <rajesh.gugulothu@amd.com>
---
 drivers/media/platform/xilinx/xilinx-vtc.c | 19 +++++++++++++++++++
 drivers/media/platform/xilinx/xilinx-vtc.h |  1 +
 2 files changed, 20 insertions(+)

diff --git a/drivers/media/platform/xilinx/xilinx-vtc.c b/drivers/media/platform/xilinx/xilinx-vtc.c
index 92fec7bb4..695eb2a46 100644
--- a/drivers/media/platform/xilinx/xilinx-vtc.c
+++ b/drivers/media/platform/xilinx/xilinx-vtc.c
@@ -141,6 +141,9 @@
 
 #define XVTC_GENERATOR_GLOBAL_DELAY		0x0104
 
+/* Value of 1 = .01% */
+#define XVTC_CLK_MAX_PCT_ERR			1
+
 /**
  * struct xvtc_device - Xilinx Video Timing Controller device structure
  * @xvip: Xilinx Video IP device
@@ -175,10 +178,26 @@ int xvtc_generator_start(struct xvtc_device *xvtc,
 			 const struct xvtc_config *config)
 {
 	int ret;
+	unsigned long s_rate;
+	unsigned long g_rate;
+	unsigned long clk_err;
 
 	if (!xvtc->has_generator)
 		return -ENXIO;
 
+	s_rate = (unsigned long)config->fps * config->hsize * config->vsize;
+	ret = clk_set_rate(xvtc->xvip.clk, s_rate);
+	if (ret < 0)
+		return ret;
+
+	/* Verify that the clock is within a reasonable tolerance. */
+	g_rate = clk_get_rate(xvtc->xvip.clk);
+	clk_err = (abs(g_rate - s_rate) * 10000) / (s_rate);
+	if (clk_err > XVTC_CLK_MAX_PCT_ERR)
+		dev_warn(xvtc->xvip.dev,
+			 "Failed to set clk rate: %lu, actual rate: %lu\n",
+			 s_rate, g_rate);
+
 	ret = clk_prepare_enable(xvtc->xvip.clk);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/media/platform/xilinx/xilinx-vtc.h b/drivers/media/platform/xilinx/xilinx-vtc.h
index 855845911..0f360ed55 100644
--- a/drivers/media/platform/xilinx/xilinx-vtc.h
+++ b/drivers/media/platform/xilinx/xilinx-vtc.h
@@ -27,6 +27,7 @@ struct xvtc_config {
 	unsigned int vsync_start;
 	unsigned int vsync_end;
 	unsigned int vsize;
+	unsigned int fps;
 };
 
 struct xvtc_device *xvtc_of_get(struct device_node *np);
-- 
2.34.1


