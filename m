Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC41CC5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 07:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J3gtnsrz/6HAoZspZUg9M8ZJWC6bmzmlydxL6z/xP2Y=; b=RYEBHT65QqA3Yz4lYWPALajZjR
	Eg47b0YFUTOwU8dt/LVj3f9bxAQFgz4k9i7LSQhJ61Ja35Qsf0YLtPRXigqUIZ0B/xSlhN01r5/ZS
	IOX1jGyvKSHbmCoAxl5BKcMFTVEPrTiX7idXu4fLZ6Vn9AE3zPqWKhfeKurB5AhEVDTkro+FWHUFv
	nVyndaL2wwaDP0dT/+O1rMbYxqheAyM4iZ8n77mq/vxnKZsdY5uJSDulXHsn6MaX4AK6PGS3rZL/R
	6NrPQlA9FUxU9x8hCUfDG7dlWMVdKaUOVcL2USbYA14K6bYDQZ/bVva5psMC55xi9QdFKJ6mnhn1z
	IDj2s+gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwx7o-0000000B2Kb-2qlh;
	Thu, 20 Aug 2026 07:23:44 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwx7U-0000000B246-0UKj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 07:23:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJCRp1E66hrDz9cokNvwfVGacf+xFbPzmwVaOYM41vdpDkXF67lcdCYjY4lzjajCVNE/ZJUxSTsvq/8Qph5o0YbYGCCQjAoTjb/hLns/JCJ4yTIFg1TY6PwDOw7DEHrL6pJkFcmz0ZCh3S8nXXIiAL01YkXVpf+HvTVoitpy+DgW+EJW0PCLf2pXKj/j6oIVvBljbJ7eQAZRV0hDSeBD1/wB9ZGavjy1nZi8ZDLbFraRC4Riw4QN2KMsGnbkmx+0bAMMtj8LhI8J/4zV9SyPwb7S3HeDDAdLSaPK5yblCkC8TMNsr88z+CmQfTHnVeZWl48lt/gfFe5xXWIBG1eotg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J3gtnsrz/6HAoZspZUg9M8ZJWC6bmzmlydxL6z/xP2Y=;
 b=FmN/Q0d9DwBvI09sNzqDQs+3cAU5vhvDnoak14G7R2xvqnAvA+ewvX4wWexhyMuGJls+CkRco+qZLdAKmWwKeyK3B1ghhCy3k/0zhJVTX829XWQHYhtxQZ9yVzg8iJTjwxZgLhDe9uqGzWu4ibMxkzwZeUDbXQcrrD82VhTqCa+cgYSoIF5mQEE7v7gq5dcpKGruD/0f0Uu2Gy0DvCkeF/5W/kJNJvkTRTQl0Z3tQJsybKTMawxApzJJuSVy/AFVAjG9cV47z1efUAtcFFu898B4Znp+dietQKjXNPxS2L2czbbqntlI7ptKlYLy+kuWg3dN+OdRjZHNaSBCpWGStg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J3gtnsrz/6HAoZspZUg9M8ZJWC6bmzmlydxL6z/xP2Y=;
 b=AZEw6LDHtzvfeKOXe6yB6WEQ5MpohOkRgeqtUnzpdehfrAW38MWKuPJExxd6zLNSFaW//BaHrZ22g1+WGsu1IE0OjwG3mkzVryJReTV81B57AgNPXw8PNHDZGKbIj/eDcjv9WwbPq/IJgDNX/5ZxuxfxI3n+ZcWpXVPYYExvzm1ffKdLcX0LBi9B47/ksKVhqLyOtsP6FVPLEDBF6wgeCxciOgH4AwahyVOaO2gm+jZOUpxQSvFnPhWwk3z07euOADJOUSKiwVeelrr4TCj7doum3L/KgYaw+TP4DC3f5mbdpSIEeAyknvusk1en7SIGbcbf+NlosDWQUcND8mZfdA==
Received: from AS4PR09CA0019.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::10)
 by GV2PR10MB7055.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:e2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 07:23:15 +0000
Received: from DB5PEPF00014B95.eurprd02.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::7e) by AS4PR09CA0019.outlook.office365.com
 (2603:10a6:20b:5d4::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Thu, 20
 Aug 2026 07:23:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B95.mail.protection.outlook.com (10.167.8.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 07:23:15 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 20 Aug
 2026 09:28:49 +0200
Received: from localhost (10.252.29.67) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 20 Aug
 2026 09:23:14 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 20 Aug 2026 09:22:35 +0200
Subject: [PATCH v4 07/14] media: stm32: dcmipp: introduce a dcmipp global
 media_pipeline
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260820-stm32-dcmipp-pixel-pipes-support-v4-7-d212eb4e3792@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B95:EE_|GV2PR10MB7055:EE_
X-MS-Office365-Filtering-Correlation-Id: f0677ac0-e4cd-4715-cfbf-08defe8be668
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|23010399003|10067099003|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: co75OEvTXHei41ncL6EShXfiNlvqnBy8IQDpWZu2W7TwJo2mA2oUNinrE3Y6JIaO7eMkzRpxBBE4Zq9/0UgFHkdeoUkqxTZGaWfvhu9pN+luEh9AygGv3g7NhVPRwO/4lhhX182FmhEF0BL9TmGU5k9D4BTFLpo/PZlaKkyYdKfg2w3MMewtugW7ci3vDH2a3qQSlN4TfassL5GNZH5kq20PAxYYxqKC1gkI5br4683n1BfqBw2O8hN2URrRki9Y+fZyc3y0khweSWkoqJJFEo+lQ01Cy8MGnr05n8B74IIi2kKXTv1C98+l+5//HO7H9xp1sWkoEm77fDWX6aRD+66QHH0UWE4AGEN2L7dMXy3QFPayI/BEMlZRG1+pwQit6LXrPJXAjEsMCDtIvaC+UxF/cltFBhbhI9t0mTDOImHUsLfXjUm5ZHuVMAFcb+YJVswKe4oQJIpyLQTmIuQ6//ouVVEV+1I2/9gvIW8XlJSr03isruOU60udPfhTI1ZgxymPFRWlR8q/eDXwrSco1xZkJj6AWah6pnjAIm8neZaNhuohbL0coLRoUjZszwBin8fKUU+wP7lOsFrmNk1obyW7NtVv5qGPVLB/aWY78ljRvZCbd0gL8B6cXUa8t7SJUzjr9oqC7TdCY5G15b9TrGXIVJ1JwieUT6yku+X4u5tInjS9FNDY/lA+zcyKrVsXd1zFutBuHm6EPm/s/OcUyg==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(23010399003)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: eLVEX0q9bmjZhdZwAEpxl40Ih7jZrIjYwFeqBB6DymY+iFhUNbi/HBl84Fl+ahFgUGiq5IZCvu4otOm/xvTCvsmw50gRydKB/oA2u3uu6KapDYiOlTOQ3Qz63r6+hagrdlDjIWkN087I9ufOPQVKPdusGOEvLlRtU5n26TQn6zo4J0zFVzEN7i6q/M+TZ1fucFomHgPAfbs5tQ9bukL0J9W2IG75GkhoS7rq8QDkZjc5f/aRlhuC806f167lWFDiWKQpg9FZZ/uNpffxEd3sGDVhX+hkLFieiPDzAY/3nzMIOs1+RZUy0YsQOFg3IXKSxqIkawCiwvrqJA1JCMy7i+SyXWN3mxODx1LQYjRPjRwG4L+Srj20ui6vkH1jwsS4y+AqUuWaD7CPguFyvJY7MRfgIiqVIYJdrSxjd2MqvWDWbcX4x8UwyY/oiMdcAQ1q
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 07:23:15.1474
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0677ac0-e4cd-4715-cfbf-08defe8be668
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B95.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB7055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_002324_191909_3EADFD1E 
X-CRM114-Status: GOOD (  11.09  )
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

With the introduction of stm32mp25 containing several capture
devices, it becomes necessary to share the media_pipeline
structure among all capture devices since subdev pads can be
shared between several capture devices.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c | 3 +--
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h  | 1 +
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index f6011b42203c7..53341b7984579 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -125,7 +125,6 @@ struct dcmipp_bytecap_device {
 	/* mutex used as vdev and queue lock */
 	struct mutex lock;
 	u32 sequence;
-	struct media_pipeline pipe;
 	struct v4l2_subdev *s_subdev;
 	u32 s_subdev_pad_nb;
 
@@ -410,7 +409,7 @@ static int dcmipp_bytecap_start_streaming(struct vb2_queue *vq,
 		goto err_buffer_done;
 	}
 
-	ret = media_pipeline_start(entity->pads, &vcap->pipe);
+	ret = media_pipeline_start(entity->pads, &vcap->ved.dcmipp->pipe);
 	if (ret) {
 		dev_dbg(vcap->dev, "%s: Failed to start streaming, media pipeline start error (%d)\n",
 			__func__, ret);
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
index 2d26425b0b0fb..ee9f36268e646 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
@@ -73,6 +73,7 @@ struct dcmipp_device {
 
 	/* The Associated media_device parent */
 	struct media_device		mdev;
+	struct media_pipeline		pipe;
 
 	/* Internal v4l2 parent device*/
 	struct v4l2_device		v4l2_dev;

-- 
2.34.1


