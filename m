Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2034EC5DF88
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 06:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UEjYLylXJF/q29NFKj7OUUasMxvnUE+N8UUFRk+cDW8=; b=hmDDwgJqiIX/JOEvPboxOfJPim
	v8ZjZf/VMm1qyI2fyZud4jgZJaHiifQYZvU55eD4GA0HywkNA/qv7oj4nQ+tSyBHQ2PmQ2l04LyBw
	OqonG9xho48hGpQkYcVqDsf9POPbp7tmpYEkmp6yDTWHAxHwSaFxsWCgZiz3VbR7cQjF3Kti6CE74
	1pbIJ8rjLqrWcJKBxfJs//Efn/jsukhy8BsrTdKWuBPPdG9+dHK/Iv1faYskVP0jwKtSJU84+5WPY
	2ZBEO0bEQwJNRxxaYP/IaviZal43/aV0vf5XZWK1wtqz6k1byYPeCEvV3hbcwSW1IVzOtikGBIA/b
	wNWl6tvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxItn-0000000Ccx5-27sJ;
	Fri, 21 Aug 2026 06:38:43 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxItc-0000000Ccp3-00qq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 06:38:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wQlrbiJ0tNxjohMGzQMqesCGquC6aqk8+tB4fiV2x5a4nIlfJ8FcN+w8jfsIUqZirTrGOz6KgXDkgeELu/ltt45yUZ8QAyY7LsiEMzgagfZWMAsw5sPM/3kmuQsbZEwO1Q3YsavHsyxuXAFiLxCEctAdCQmFF0tAbI/jaoFfjKYpbaVddt3pQO1+QeekRngzZKa7+81LIKC1OzizStUwP+tlDLxeZ+oy86wdkFtXFYtrVjHktEe/wJQPpuNCK96HGZpb6C7yhgnIeZGpxPNb0Geaw+zs0rArUFzz5WvfP5NeQCwPUbpLGm4faD+BzfDfKZH3U9fx2a+KQ4gSHyr+vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEjYLylXJF/q29NFKj7OUUasMxvnUE+N8UUFRk+cDW8=;
 b=mDdwOQGPB99y8pHTIwkIQbsOdeWqK1PylLALUT00R8lqPAk3YccXiiv7C5dd0KeKAqNu9yMcDP+VNG+Dr+RmJ7izlvvJE9kf3ZkE30HcX5HeRe5SISk5MFqWCprjSXySmsupC07D2yw1AFCg59GCyefbvlitwnx9ZAuCk/RqNvZ8nDjca6gJk68wInO3E+xEXYkCFlYg8LoKXCs91pqIoshLHV5dlBiuUDj5r3gKncmKuiIzp++HzTuzL7phA5vfGG0993fLpTRl+SHPVS2zffyFMs+3wm+3Pzt0U5yCvefENI5P11XTbBDzHXK85a/5zsNgdW5eX30oN5j6uGIMFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEjYLylXJF/q29NFKj7OUUasMxvnUE+N8UUFRk+cDW8=;
 b=Wnla7O26Yxga/fQZKJE0GyP9YV9/wdFCPp9vph0RFHjgZ8xQVYqhtktcciJVbDuZ3h+yAZoIaitYQYFngKjAGcAgVg5vULJUpYA6iMa82SGvWmb7vV+QegFF7frodfYRRX4ILHpcYyJP34X74N3BKxYIs5KWmKd9z2+ruCAJGkYO4UNyZ73u4b94TVFiOsl5uIHixkd3GYZqSuxXsCxLSZaFvN2qSJkZMinpJAeQgdmQ819Ds4DETJZUsrNSqJ4ZZojweNJaBjjQrMWBggyAQ094U43ilSnaTzTQ8RdVch37epllOTFtxqqI7Ye2EQXgdyicT2zz7gOFeCIbwVzaaw==
Received: from AS4P190CA0026.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::13)
 by AS2PR10MB7527.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:591::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 06:38:25 +0000
Received: from AMS1EPF00000044.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::4a) by AS4P190CA0026.outlook.office365.com
 (2603:10a6:20b:5d0::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 06:38:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000044.mail.protection.outlook.com (10.167.16.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 06:38:25 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 08:43:24 +0200
Received: from localhost (10.130.77.105) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 08:38:24 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 21 Aug 2026 08:38:05 +0200
Subject: [PATCH v5 03/14] media: stm32: dcmipp: bytecap: protect CMIER
 register access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260821-stm32-dcmipp-pixel-pipes-support-v5-3-d140efb61d72@foss.st.com>
References: <20260821-stm32-dcmipp-pixel-pipes-support-v5-0-d140efb61d72@foss.st.com>
In-Reply-To: <20260821-stm32-dcmipp-pixel-pipes-support-v5-0-d140efb61d72@foss.st.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>, Hugues Fruchet
	<hugues.fruchet@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.15.2
X-Originating-IP: [10.130.77.105]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000044:EE_|AS2PR10MB7527:EE_
X-MS-Office365-Filtering-Correlation-Id: 081ce978-958f-4c1b-1070-08deff4ecddb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|376014|1800799024|36860700016|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: P/nO7+DN5z3zQ2O00fcnqodBaF5122KTREuI59S7H3uyNzrALDQ2SK+X7OqU43F4koyZfSYRYU8s5rSnJQLdyK0QWSwZhlhEyIb0hirfLdgMVL2fJXy6dGTAkpqjU8dWuHeCCGrLq94XmZrmkRCoomJGfyos/J4wsiutYLzZ5EUzapM+wKOpvHVpe3pEHsGONdg23mxn3fzvg6ciX55oSMzUqT59pl1dTZypqMRDJDpwQWeUdnfRQTnNzfbhKrpojnz6k848NFbJp5zMscm5f2UdrfVwUU4eo419a9s+Tgz8plYfaHfuSOAtPdJbqxB6znymLffR0ZB+fNBkM86Y579VBVCTJTkq0vJgcesx4LERjenwPkfG5xVsWWkY7JS0Z4WZuQEqzhHf+aN0b8J+oPu1Revvmd8XzKfmpvx+0cHCWbHAECbeXjUi5bTSmayqUJNxQlDOHz4xJe/rKs1mkT3sMDjPApltsAUCYsFgP3IM/Wdbf/zfc9e6yPxx+6IGSdIkfcPDbnZX+DGDD7hmZDyhllDvp+AE90SPD0M8TCjwNAaH6XRcrPHQ4P4i6+yh9SeHgzlSwmjzIHmLnINba7/aQ0dN4kEH9lB+pp5qrIeYu6FC2vP33IN4yCd8GztT5aG+LHHaSzHEO3axYrpMQXWCyw0TNhmij1YvJ2bCWoo0LNRXKDSUipqd+imSSfhvx0tQlrXWOQZB7NUFdMK2+A==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(1800799024)(36860700016)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Si1MzFVBXJFFZSX/7MRm7HhyCKzOyHhdhSMEHjtumRd/4y+dZmQ94H3pS8XWazqvtmwMtOfbEVEkTF8JgDvJzTk3/oa4nayXmwpxmLa+lVbckR2eH8cSVr/vLuNeMejB0h6W/Gt4wdo0tPSNs48+U7ner+NhgMrm4kEUNg1KCwWom7xGSCqOXUpcdkZrRaPt2xscZSCd4yxJrxgSSEQgDnz+N+hkzebL68KwGkDv6mkbgrgA49TQWWpizsh2VfLogaPer0RxwHOXDs2hqwDtiJZ5Ui7UdHq+V2JnfaGeUeXvDCaxSIiGUCe13XUNqFRiJpbqMn6Qw1MMjJb8dAFFv6zrDLBSeRl0OIFLzTSrpoKssj31yfM12giABMY9039IhUfo4xcFbmuFKSt93/Y4hpzT4xFu3z+TRInQb90YY07Mg8/d2X/BSelx3moLj+jl
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 06:38:25.8453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 081ce978-958f-4c1b-1070-08deff4ecddb
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7527
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_233832_067623_F3A98F34 
X-CRM114-Status: UNSURE (   9.36  )
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


