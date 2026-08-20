Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB835C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 07:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UEjYLylXJF/q29NFKj7OUUasMxvnUE+N8UUFRk+cDW8=; b=HIPEwKm0cuvrKlrYpq4H4Sz6tH
	dxnLkUwvjZ7KmnOXu0ufVs4qMR3Z3FgiC/rgghh93ev9ymEvYxUTwyV9vBIG4O0Rv5Nf8aqLhjs1b
	PVzj3SXin3KPOpsLV4eFxIoEyil6SQEg9qb2prk4quaTABNtacBf+MhVol89VMnZ5/EG7jBoOOvQK
	aUv7buP1qiQdv/1kdFGhQ2oGJGYCoscFYlM0Nhvk/vjr310HEgfxg4kb2j/HLqi8BQzTLFJbZ29I6
	7Czme6Ik+kEG2esAiv6AbLYN/O0/2a/cikHEKx26cpfc7RCkiL5/4V/b32ixOX0wWq0z11QQWTZu3
	KK1oGL1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwx7R-0000000B23H-1o22;
	Thu, 20 Aug 2026 07:23:21 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwx7L-0000000B1zW-34t8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 07:23:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rDQTt3XbBj5r52n9s+u5miHmvIfQ6vlsRxFuh+PXLn5YDpRwpr0b9pNu3JglCuxN+twe6nZ1GA9w1mHYF8L6zYDA60C3PYum2iP+PvRHzxiM0PFlgpQyoozHbeKwU/0IlnD9VlAb4ZSsndRJ153/YWxp570YyKQagYTtH6g9elFH7kMuZRuYaONDbql1L5ixV+p5eFTRIKX56/Tljr5XB/ZDa0pKGAj907YDXlNN5MPDLKhHyf+T6HQuH46yg37gCJx1Ipnf4U26Uehu0j93Mpf2dHLQJUSFrd0MQ5tRDU/v7+6QgIf2QYS1YFfPDy2wKSYG9IryMURlzp6GNdkmew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEjYLylXJF/q29NFKj7OUUasMxvnUE+N8UUFRk+cDW8=;
 b=qVle/ErP4j3a6onjXNub7lXddHd5b8ihasfsL5JJ2Vu+KPLMjn2eRymZ4wNAYU9NRbt07OG3zyVfBdQT1Mh//dBkKQfPSwyT0qaOWsxeLGt/fML+Y7EoF5Au+JZvx1gbTQLIHFiqatybc7r9cuRx0NnbHFpqgOsChghGTuOx8CDEfABbNYoHHmJS28ql5FEMxcdTaglRC2eGhnVJfSTP+ndXf4T2AaRof4Hs+snBUQFhbkmkMVrfjUvAowJOk4PHbVhv8rzsr4WKxCNZSVcweI92yihmRcGUaVtSOBE7fdRYx0/O5padrZqL9UKwgVtB44DrxKI+2DDjgNVLd+uAYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEjYLylXJF/q29NFKj7OUUasMxvnUE+N8UUFRk+cDW8=;
 b=MDUiP0fXuTcqaDco/lz7XnT342TOG3ERtPh9i2Ij3yCZdaOwrB0hpySqVySTqhmT5mj0PrBJP9M0lrIQ1MIb0d+E/M80gmeMO2YnXy6OGu7zEMmDXGlYlvo7O8Njbw1hNcoT/GDDprP8ArIh1wcNFWUNgP8oWNAYWKAp6SWXSF1JCHFYUBtQRruxN6cHARVm+Q1CVxC1woJnZgEe/RvEwj8OncNE6qkiBc0HqKcH1neGl+wsAPALQa9WcfoVE8LPnGvhIJ06Bmjmm1EF3VDY3iil1sgptrd0LR7hkhsa4GTMGh+r/6ZvOspNQ3BG2lM8asp0LLsWRPc3RyxDF+IePA==
Received: from DUZP191CA0036.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::28)
 by GV1PR10MB8846.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1d7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 07:23:11 +0000
Received: from DB5PEPF00014B93.eurprd02.prod.outlook.com
 (2603:10a6:10:4f8:cafe::21) by DUZP191CA0036.outlook.office365.com
 (2603:10a6:10:4f8::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Thu, 20
 Aug 2026 07:23:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B93.mail.protection.outlook.com (10.167.8.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 07:23:11 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 20 Aug
 2026 09:28:45 +0200
Received: from localhost (10.252.29.67) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 20 Aug
 2026 09:23:10 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 20 Aug 2026 09:22:31 +0200
Subject: [PATCH v4 03/14] media: stm32: dcmipp: bytecap: protect CMIER
 register access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260820-stm32-dcmipp-pixel-pipes-support-v4-3-d212eb4e3792@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B93:EE_|GV1PR10MB8846:EE_
X-MS-Office365-Filtering-Correlation-Id: 6422d938-697b-466c-eb95-08defe8be3f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: DYy3TOqWiYriQhIVxWgk6wKGrtPjvItudw4d9bCeVeExJZrEGMW/ky/JKOlKdC+coUl4dhV4PnGa7xK9cr01oaS9OKz2bX9I2G17Iqm5XwC/xRDTGaY3IjvxZ1nerG0WA+Dqab6MMLF20gaRab7Lx46HXS/TT3Gk/K+iPD3VPFnl07aeglZjeHVIc647v9PbIMIjek6C1MkN0bLpS2/2TPrW54nBu2Z/1QzVhsIM2AuqCXJBy5u1nY3e5lvyWu/9HNVvQwlFOA3DI7v7yT2KghGTvyLdDRwKvJP0gGkqFdtdudLzjHCBgKFkYAGTr+k/D6kDOR5Nk0wujME2jjsvtJ7nnI8qDx+Ddx3zzldxTLC3QvyLPZajJgdLh+WIek9YSZX9Z1DOXjvn9Sd2ixguUCbT7yXQF6NlqdJi4ATMJKjHJ9OuQ2y8WdeagOu7DKEOl3kAqguJDx/vQQ5K7d2boyWxHWw4jV4cgzyDCIdzlZ0JJhFpE4Sx9FnA0Cp9QVPZ8x6XZELFBRC7PMoG0rYU6pGEkyIRJtSYkFNp6WytYxetDwnB5Odk1P3WpXm+cheQBurDJt+T3Lmt+kBzI+TnMJyEOtYvXfmcaIDbtz0zJuu54V3Gzd4w/af9xcRxJdFxcqMSF92puw1RyH7OMLGN1XOd1mc457LMGNFlJFpu02U7l7stNswG4TaQM+5FWXuASxcNKezS26+kBbWc0XcTfw==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: KxBhqsILNMSzQpxN/xK0SjPtXmm4iXP2IoM+PpFYsCWu9KSkO8j/Eam7xpgtifiBC9gbAtO7FIO92JGz816E8Un4YrBLS2Iq/xqLNTSw5tDNNAfOVU1Yzz0ZjKyxbqWkRxup9+TLJlKjeYDZPqfXrMNG8/B+iL3hzXarnKvYUTGResAg2VRs3CRbl9kjwToegp9+DQwFmt84HE8bHl3/R9fJ1fXIT1C+BZE5l+2rye/NHdQx43EGmAGqq3Un8+aV0pNTh64KPnrB9Jj3YlA5P1c9vbJN/BTk3vaNtcSmwPH1LfCb1/8RPX7SoLklxPFnILqemDmb4igCnYhi97/oYBkxVIqc00n17evKgGccdLUEK90SE89Mjmqvfrzs+tRVHDsuLsLsUx5iC9Hw2Ikxl9MgrLwyfPWnkLYHlBTAF4IJ/Nm0nd15ohkk3MW4Ca2y
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 07:23:11.0664
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6422d938-697b-466c-eb95-08defe8be3f8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8846
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_002315_785248_9A7BB2C5 
X-CRM114-Status: UNSURE (   9.15  )
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

CMIER register is common between all pipes and thus needs to be
protected from concurrent access.  The struct v4l2_device structure,
unique to the whole driver embeds a spin_lock which can also be used
by the driver itself as explained in its description.  Rely on this
spin_lock to protect from concurrent access to the CMIER register.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index 0e789bbd1198b..f6011b42203c7 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -438,7 +438,9 @@ static int dcmipp_bytecap_start_streaming(struct vb2_queue *vq,
 	dcmipp_start_capture(vcap, vcap->next);
 
 	/* Enable interruptions */
+	spin_lock(&vcap->vdev.v4l2_dev->lock);
 	reg_set(vcap, DCMIPP_CMIER, DCMIPP_CMIER_P0ALL);
+	spin_unlock(&vcap->vdev.v4l2_dev->lock);
 
 	vcap->state = DCMIPP_RUNNING;
 
@@ -494,7 +496,9 @@ static void dcmipp_bytecap_stop_streaming(struct vb2_queue *vq)
 	media_pipeline_stop(vcap->vdev.entity.pads);
 
 	/* Disable interruptions */
+	spin_lock(&vcap->vdev.v4l2_dev->lock);
 	reg_clear(vcap, DCMIPP_CMIER, DCMIPP_CMIER_P0ALL);
+	spin_unlock(&vcap->vdev.v4l2_dev->lock);
 
 	/* Stop capture */
 	reg_clear(vcap, DCMIPP_P0FCTCR, DCMIPP_P0FCTCR_CPTREQ);

-- 
2.34.1


