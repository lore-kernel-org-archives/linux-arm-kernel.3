Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B76CD6E64
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 13:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5OIr+Ol0Hv8QsnTiXbFuxu3dwRP80a5F0HF6qg8A0vs=; b=pMSYaBZ16zOvfoVML/FqvzIvEo
	hUrvZ3NYeCYcgGsjOAbrSZOi1bGc2cCLrkAiSRzj72iI0vP+8EVHdJdUlqYoXHw0hPulreB23taRB
	wR/BOKQnGMrhXa8QoPTaxwZCgPXmMXsmlUG4bo2AY46l+f+ni4andKldfo69xYIagltOsI/d8w2O9
	Pm50qT+smSLk7Akwn7CBhONti4t6BmDleZqflthiFJ5LQU2L3BTM4cwFaGp4mx5SKwPV13lnMTHsv
	fGwAykuM6+FGYVBqjW7rZaoxo6dimZm0Sj5pEfLW0MnTJ0v+yLkFala4Bb0DXSuRc0PUHsHnczxOg
	wLfT1XEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUOxF-0000000D3k9-0aqK;
	Tue, 02 Jun 2026 13:14:49 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUOxA-0000000D3f5-49Ct
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 13:14:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ivQbeHdIVJzVvdDh0Bs21EGJozBVWvinQhiNerw0INVYqez4bdrA4i2pp82KBpeiC15RSyyklmRqahABoxUjQtBt5qHZ9BXMhmvy8FBluYqx/TileJOJJb05WoXkJquKEc2aEYYRKfEOMOx4OIL0iBEiWvuf8fl1JxPq5kSvfTfvay9r/ggBTokXmVzAOROmEMKwT/Lwr6PS+H+RlJF132ly+4FWTo+GVsUgiLlt4ZevRsHeQ+7IL32YcEfBoUSPBwSWdXwVw/pWVHGtXlzEBIw/L/+sH4/FJcaUmtN4TrGsXO0PL3vmzBDCb/uvYAKEQZ+99CQ3xnB7Kv7NBP7PWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5OIr+Ol0Hv8QsnTiXbFuxu3dwRP80a5F0HF6qg8A0vs=;
 b=pkpOD9ZuJtzzqAikTecnGn7sUaezdWyyTm+psN99kHyEvTGu57Z1FBkb7DOqoK/3SXiiDOxz+J47Y6aTwLwjw5dfk3bw2chfyWaOPCRjwPINfblL8Vy17uh7Zu3Ol/oo3fXuryEJ/v0/O/qg2sZHTKzCOy0EdXmZKgsDhZUc+ZfWDRlK2RnIokbbfwVpeywY8G1ssJMUZ9l8wgq7oSBsT4pQ8waDsic5jahQG7o9TxI8dfcyNRZdzrie32hb9LfUckJAG4MUnllEn6FTROTuuI6l6TXvuHSDEjOTBcYzUZgQ82TbT0JthO0ADs7Px2kQLBs0z2cXYitvhejgUAjCUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OIr+Ol0Hv8QsnTiXbFuxu3dwRP80a5F0HF6qg8A0vs=;
 b=LTbeSodtY0PRZNxbib4By439eFfKEqSJhPXNMY/OyngwaWfbzkRqUOiUzcSQjUgC0HceG5GzolSNR4su8r3IWEI4DW3zm3x5kT6puxUk3Fyy7s7Cr4V5tP41dqAdqlUvkcvyDOIU2WGB4y/RKf7ZMNFzAePmaO7FWMQ+IGNuBKP61ldlw4NCtaNbYazwFAerSPo+W6/J18tNQ7hcoTuq5tUHLiMx5swYScxfDBOBQiIxfNiXKmjkP3bX/vkzr0GJ3BoU7jllCghmdtkfvqI1q/bgk89L++rndhHJLUMlxWuV1yIVGVH5QN6eXmKhoedx+5jFa/oqprg7oPPZa3ZNPg==
Received: from DUZP191CA0035.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::27)
 by GV1PR10MB5891.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:57::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 13:14:39 +0000
Received: from DU6PEPF0000952A.eurprd02.prod.outlook.com
 (2603:10a6:10:4f8:cafe::4) by DUZP191CA0035.outlook.office365.com
 (2603:10a6:10:4f8::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Tue, 2
 Jun 2026 13:14:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000952A.mail.protection.outlook.com (10.167.8.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 13:14:38 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 15:18:47 +0200
Received: from localhost (10.130.77.119) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 15:14:38 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 2 Jun 2026 15:13:59 +0200
Subject: [PATCH v2 02/13] media: stm32: dcmipp: make dcmipp_state & cmsr2
 read common
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260602-stm32-dcmipp-pixel-pipes-support-v2-2-3c76b5f93157@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF0000952A:EE_|GV1PR10MB5891:EE_
X-MS-Office365-Filtering-Correlation-Id: a8d503bd-f0a6-4967-af29-08dec0a8e69d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|18002099003|11063799006|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: gBzoa3/npbs9DFoBMT18qGInV7jbcd6P1OUkZKJinMJFBourm5DckkTtraSvh+Le9Cqn5zsjzHdUWo+nRRZQ5UMHT+UJWqGA6gVJNCiYpUhLd4M4s4JE0hX/jonQKGaAVdDvFyRuPzS8ng2FrK6SWzigpNwqQAvNkjJwMirafqljX3PqD6ThFfTgIp5b8NvD+WU1NO9DokfKnXUEtyxX+4sXcJNnIVjkDm7m45CEWbUVehFrr2XVJejI6QE77KzLHgsuFwsMvsDsl3+jvYrC2CcadCV7h/dbJRPCivUNeJbz7Keum+X74mxebsDJHOSaHD74Tc69GGaQP93HVQ8ls6xVEcDipKb5AMoqkR1ZUay/9FxLN5bK8oWwOdBWDt0nuPw8DtwhYrNqFW9/uNQTLJBB3Qpoyr8Ec/C6Wt4e1cjKXxnFuj1LrBGEjlYwhdbJCA1YVS/KB/HPeTmCD8iFLNgJ3oNSJUqZVME0lne4RT0lTjfBpXVGn1AlBNV7d8sryemAHxRB/u8X7kw/0JioSo5ZRylWquS1pod0THXszg1DWjB4EH3j5tUjpaZKGY1z7s7Va2UgJ7A7Fw62mfK2WjmguGHTf4DIK9UJDl+7VAo/rDFXFK3x/dG0V3y7Tm91vQBRo+P2/a/pGPvib6XWHu3JCD+TUyQIMsUMcW0X7NeD4K5L8Cl66PxX608gmUqm+81vsJge4U2vWcmKVff08LJJORqC75RyjRdGnBVKGPg=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(18002099003)(11063799006)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: pAvsOskgSrWJpmjvS8QQBts3P1dXFbuDFxKOFhaPBi4omX8u7DQPFMrrZ5xls30oGsyzUNdg4EzlnzcFgksw7VlmdUeFYOIEL44SegHCp/mrj/TwNTMSq+t5ticB7ZBb5WeKRRg6dOzZlMKZG6qoPR5tNE73BxW5aG7ayNR+MRVH4MFoMdm6yNFBiU6RqXmYNlqzir2ljn8Qp2FGCHnTpqu5/VCWEP2cuD2W2vAqCTJqQ29yQp0QZ6/8diyTSyDTtU3t0W6UlfFocBe8Z7QW/X/kl8gZ3SDtoUeL7ehJQ2jKe5VKgkVjgJdhBKw8vxUIbSQ+bzCgaXiJ3ppVqZrZSxf5fCz5prJh6U+ZVRkPwBm1KB5+detX7OwShA5o//sH2+LYu+/ZN+YoIYxf8Du7+BEJ7Lf+q3yeTcbC0Sxuhhhzl334OAR6fXL6uryqrYXS
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 13:14:38.8243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8d503bd-f0a6-4967-af29-08dec0a8e69d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB5891
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_061445_064385_6E84CB3A 
X-CRM114-Status: GOOD (  14.44  )
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

In preparation of the introduction of the pixel pipes capture devices,
move struct dcmipp_state into common header and perform
interrupt status register CMSR2 into the core interrupt handler and
share the value with each subdevs.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c | 11 ++++-------
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h  |  7 +++++++
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c    |  7 +++++++
 3 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index 395c0ea72019..990bbaaf4bda 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -110,12 +110,6 @@ struct dcmipp_buf {
 	struct list_head	list;
 };
 
-enum dcmipp_state {
-	DCMIPP_STOPPED = 0,
-	DCMIPP_WAIT_FOR_BUFFER,
-	DCMIPP_RUNNING,
-};
-
 struct dcmipp_bytecap_device {
 	struct dcmipp_ent_device ved;
 	struct video_device vdev;
@@ -797,9 +791,12 @@ static irqreturn_t dcmipp_bytecap_irq_callback(int irq, void *arg)
 {
 	struct dcmipp_bytecap_device *vcap =
 			container_of(arg, struct dcmipp_bytecap_device, ved);
+	struct dcmipp_ent_device *ved = arg;
 
 	/* Store interrupt status register */
-	vcap->cmsr2 = reg_read(vcap, DCMIPP_CMSR2) & DCMIPP_CMIER_P0ALL;
+	vcap->cmsr2 = ved->cmsr2 & DCMIPP_CMIER_P0ALL;
+	if (!vcap->cmsr2)
+		return IRQ_HANDLED;
 	vcap->count.it++;
 
 	/* Clear interrupt */
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
index e5c0eda8b18a..3c3996472e03 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
@@ -119,6 +119,13 @@ struct dcmipp_ent_device {
 	irq_handler_t handler;
 	irqreturn_t handler_ret;
 	irq_handler_t thread_fn;
+	u32 cmsr2;
+};
+
+enum dcmipp_state {
+	DCMIPP_STOPPED = 0,
+	DCMIPP_WAIT_FOR_BUFFER,
+	DCMIPP_RUNNING,
 };
 
 /**
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
index dd784cfcaac8..b06a4931ae95 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -33,6 +33,8 @@
 	.flags = link_flags,					\
 }
 
+#define DCMIPP_CMSR2	0x3f8
+
 static inline struct dcmipp_device *
 notifier_to_dcmipp(struct v4l2_async_notifier *n)
 {
@@ -251,10 +253,15 @@ static irqreturn_t dcmipp_irq_callback(int irq, void *arg)
 	struct dcmipp_ent_device *ved;
 	irqreturn_t ret = IRQ_HANDLED;
 	unsigned int i;
+	u32 cmsr2;
+
+	/* Centralized read of CMSR2 */
+	cmsr2 = reg_read(dcmipp, DCMIPP_CMSR2);
 
 	/* Call irq handler of each entities of pipeline */
 	for (i = 0; i < dcmipp->pipe_cfg->num_ents; i++) {
 		ved = dcmipp->entity[i];
+		ved->cmsr2 = cmsr2;
 		if (ved->handler)
 			ved->handler_ret = ved->handler(irq, ved);
 		else if (ved->thread_fn)

-- 
2.43.0


