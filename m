Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF86C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 16:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UEjYLylXJF/q29NFKj7OUUasMxvnUE+N8UUFRk+cDW8=; b=Df8imsVq/eczLzWtiWXBCQdW5F
	nyazDu+r9ozAWc0VIF+XRLs/dnQ45e3eDT87GlBzNvQKALsciX8pZ0dPIRZYahcZC9ruGQQIsWVm2
	ApZxlvpxiAwbJwTeL4OTgN/vtgeGpvJGw7TsJr8DutTfS+Z1eGk6oFjxw+Wi3Gb/xqicVYBi4Nuge
	cFfLxCHaemRz/1fCV4q5AJ2Yi6ZWSqOB7eGfVbcLWD2N6TianuHZbi4m3rf3zX3A8Iark6cMhFb3v
	Ia5Hd8vZpd5eMkcmi6fJs4RM8ZpUopCkxJVVALAXOU7XIZJnXhA+b2vbi5hsoEcxquE3noT4XHrkv
	ZeT4LCLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIXe-0000000GnT7-0cOK;
	Fri, 24 Jul 2026 16:14:30 +0000
Received: from mail-francecentralazon11013015.outbound.protection.outlook.com ([40.107.162.15] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIXV-0000000GnOA-3piT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 16:14:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ajhyYpr75Dptw3f8w+HA386SbDbPOPUuhYMoxBCafBAFbSZ7M/y8qTlEaxt/QW/F83ZzBb+Fh8YDqruejAwuNLJS4MDZefSqZslnfxmNfIXCh2swIFEe1SVF/hc+t6Jw56gd2dPTLPGaGyrX0IuCM3pIa6ZcRNDYNnc8ANIdJDgfSFQudCHMA4BzF6e3QJSA+us5CQ1nChBmYf36R2xgSgdWnCBGWhzYxcmi5wkM6FfBbuAnRgw6R6jfqT2+x+eExIDpEILrlIsqk1js1zTC5kxgU0BC8eyCLywdVt2msYEP1YhHZMUY+sRZRyj8WCN/7brGfaX98gZ/2jtnekSoOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEjYLylXJF/q29NFKj7OUUasMxvnUE+N8UUFRk+cDW8=;
 b=XO9XDds6F7SNQ6nGFt+DJjQhIjOsrXn2w8659QKiwg21Nquulq8Vyh21Uc9EEV0h0/tAixGJfSrSvWvfCqSl/7F576G2X/fpEF00UdlqZplQiIfiAdRlmEbYN0eukrBz+bFUgw5LwhhGdYlWVjHnNbxdEhZpKwXwpfJ/yBs6KCSm3758ZbSYJmu9c3n4bQHO12d2ZHJ60sLz712d7iYITw5cqMOoIV1d0Bd9lgLWwnAwzVGbm6XYkfj7iwK2FkiiNCIaROAeHjrXIyJ1Sutrzf/f8+ne5voVQUtblAjfyALM4aJPxLARtq+/smbXGrZJEujaJUKqyAqpzJhUjJ0HLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEjYLylXJF/q29NFKj7OUUasMxvnUE+N8UUFRk+cDW8=;
 b=Q/8qCt5jEpYg5HI7eRqN5RgvlzyVnU/F1F7XhOzKYmQUNrNLslDFI6Rjy7VzBs/4Z1jWu1ynijFrdTAFe6f8QqaBQGtMEH6ukQmHzuifeL/DftzMCcgDQ5HHi8dM6LzkUpr5kH+4wNKOk8WEy3VRjCLoCvUtvX/P1Dbmz95pXDGkrGCiJD9h3/jy4vNj5TOdELjiJFZls3V56C6aDexPnSgR5FkMdbqKUV2TNB2o0O77LZUU3noMzPuuA0S4tCV7X0/VcDJ7iDNyDyH31JEegqowAOoOfE2Yj6+QoYEQpKc77Rmpn/Kd4cK4J+JFnocJE6jMAPc6sCeHj7SCXgN82w==
Received: from DUZPR01CA0129.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::12) by PAWPR10MB6904.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:340::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 16:14:14 +0000
Received: from DU6PEPF0000952A.eurprd02.prod.outlook.com
 (2603:10a6:10:4bc:cafe::95) by DUZPR01CA0129.outlook.office365.com
 (2603:10a6:10:4bc::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Fri,
 24 Jul 2026 16:14:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF0000952A.mail.protection.outlook.com (10.167.8.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 16:14:14 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 24 Jul
 2026 18:18:51 +0200
Received: from localhost (10.252.22.128) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 24 Jul
 2026 18:14:13 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 24 Jul 2026 18:13:44 +0200
Subject: [PATCH v3 03/13] media: stm32: dcmipp: bytecap: protect CMIER
 register access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260724-stm32-dcmipp-pixel-pipes-support-v3-3-f77fe7e723d9@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF0000952A:EE_|PAWPR10MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: ccb0ff5e-31de-4607-1dae-08dee99e9ac8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|376014|82310400026|1800799024|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: kaI70gqP7NdYSY4FGYG6KhAr8AUk1GWS91biYWnd/W3E7QkbiP3Plj+8xxS+xG3xXajDocLxyVxhFgoek2RVW9CPTFhjiKXVm0jg9WcYXdf62Cj5qQ2BeqeV52zwAjbV3RxpCvtfvAUnOmn1i5NdJW03YatEzU5ohnn46sYMZHwDlRSpHYV44I2nrPEwin9ulA3zPyf9TB3O/x0FQDNdG30kYTz+M2VZvM6HGJXTF3N8PuEZki1hctMvxgGtr605ZYpaPue+Qo/kX3VO4woYWWlyW1zkqXWVOX91MsTTWrVEC6B9uYvo07ZPIJqsGy4TZ13N/Sfkik47V1FpRNGe8t95DoZGFABGIZNCG01RvLedwwqno8JTep3rFgMToVNxc1G8bQIpFFl48UFtNx8ZiUgQdlsi/bxXb+/DUwuOHZQGPC9EmmM2U+rj/najdHvXdE4E/hxqTvPMjKbteM7nGSlEXH1Qcs0Kuc/x8DBCl6AD0cX7pG+0hJFxG8Ar1plLXrGTBeslcLqIt04mDMTXocZRXyCeqSY46MqFGEqciv2qYCTzCJsHna6qLsQJOpCJhwAmMIKdhMviaXyiXWa4FV3l4TxerPpUsSreB+T+k45f6DtHjY4sqc3JKTx6v7f//1yXmHRCUj1qhcHcNsbqFDEqR0eAhugx/94e6WoLGEJLsSi1H2Wds0bGI0+7QignZa38aGnWIGHUNhIejB8Lpg==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(1800799024)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TFo887HkbICqqSEzbUPYIjp+WIyfZwWHqLCrsR3wz53G+7l4Fm58rQi/n1yzbMIGk4YZFhuaRckjQkCbglJmnMVIR7iB7d3AFKbPca7+s4EcDuLKo2XNi7FIbqm2PVmfShSTlrInkghl82vyY3Gal8E++Qb74PLs1X1qNAsAZKeywVgqqdc+mVOIc+mJbGkqgwdH10W0QefrFf1IbVC7q914Gx/U3oGA3eREzkkEo149tYAMN+vJ4Y3OZrKS5ZbmC9eWtoq0oDAuuFi/lnyFiNTsLE45AHhNfPaH0i8xGitwhr62kiX6MUGBnT63KiEXYvkazavSzrHGFmOJ8h/OWt0VePsNXbmMMpjlDoBQmgdw0k6+BsYXfFIwDU4AG3abL4MkUQTS35VCsCXdl2+7SqRdZs+M8DelrvG22wru3XYAxDt2/t+LbpYt67WsGkBZ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 16:14:14.2861
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccb0ff5e-31de-4607-1dae-08dee99e9ac8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB6904
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_091421_979507_8C28B423 
X-CRM114-Status: UNSURE (   9.31  )
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


