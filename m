Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C86CE77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 09:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KqRvH4SEF5KeVepNwsxtXCC8/+sOCDGIMzQeamLf5Xw=; b=wgd9YALf70fVj/fzTiGAXa1BRs
	1mGTZeSibGKOGE+AbXTWITQOzRUiZrTmg/7EhtqYJfvYphs1h2XWljZ9zvq+W0B02g9FtK4iMEkeo
	C1Fkhh9PJOdpbP7M3JoVnGziNlPY9gZdE91B5OE8HDbaWieFutgdLhiiIkkk8DckUI4oq05pcI71B
	KC5HUMMHR+sU8hsQo8snDcO4e3pydgHhps3kWjPyEzaXdtis66/sm3CS2ytLyZwOohLHW+0CjzEda
	wXUP1/Q/2d44+OqEk9LNJRkXF4/8KqhlLx9B9Me2md5Tp0gEnoIOl5dqYQ1tpZj7mchbEFL64102c
	cGyMRy2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLfPB-0000000HTRM-1qyF;
	Thu, 12 Dec 2024 09:22:45 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLfMo-0000000HSeO-1ty5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 09:20:19 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC70UnG004975;
	Thu, 12 Dec 2024 10:20:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	KqRvH4SEF5KeVepNwsxtXCC8/+sOCDGIMzQeamLf5Xw=; b=LLqHFMrS4ruBVeRN
	xevyrCulECGoAHkPgsXfi6XovzckRSQNWn4XWDl3+tSWLjFA3gTwgHQm9TPqBrza
	McfvmENrezVftpBgF5LLpYI+ncfI6EZuhH59mx6jgVk7wEQdnASMBXybcEEMv4K4
	/ybExDehNcWSPQozaLH5pj+RaxaOdcoHGwhayW95A4m1tfiVz64t5//ClHy5dHiC
	NHBErw7QU1Q0JM2odW44X8AYIN+HvlMBWtX0gGEf+6tFxeFpzH36NxpYZO7fRrKE
	pVxXAqBewhC00H2rF9101y7aD7uLQHLTTLUnN9N5KP2QIfinjBr0L5yB27BKB6mP
	oTPJtw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ccnmf77t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 10:20:09 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 921F640053;
	Thu, 12 Dec 2024 10:19:02 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CAD4C263840;
	Thu, 12 Dec 2024 10:18:09 +0100 (CET)
Received: from localhost (10.129.178.65) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 12 Dec
 2024 10:18:09 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 12 Dec 2024 10:17:35 +0100
Subject: [PATCH v4 11/15] media: stm32: dcmipp: fill media ctl hw_revision
 field
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241212-csi_dcmipp_mp25-v4-11-fbeb55a05ed7@foss.st.com>
References: <20241212-csi_dcmipp_mp25-v4-0-fbeb55a05ed7@foss.st.com>
In-Reply-To: <20241212-csi_dcmipp_mp25-v4-0-fbeb55a05ed7@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp
 Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>, Hans
 Verkuil <hverkuil@xs4all.nl>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.1
X-Originating-IP: [10.129.178.65]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_012018_786129_AD0DCE2C 
X-CRM114-Status: GOOD (  11.63  )
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

Add hw_revision field information of the media controller so that
application can distinguish between variants of DCMIPP implementations.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
index 97590079bb5a..62dd17e0488d 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -87,6 +87,7 @@ struct dcmipp_pipeline_config {
 	size_t num_ents;
 	const struct dcmipp_ent_link *links;
 	size_t num_links;
+	u32 hw_revision;
 };
 
 /* --------------------------------------------------------------------------
@@ -122,11 +123,13 @@ static const struct dcmipp_ent_link stm32mp13_ent_links[] = {
 			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
 };
 
+#define DCMIPP_STM32MP13_VERR	0x10
 static const struct dcmipp_pipeline_config stm32mp13_pipe_cfg = {
 	.ents		= stm32mp13_ent_config,
 	.num_ents	= ARRAY_SIZE(stm32mp13_ent_config),
 	.links		= stm32mp13_ent_links,
-	.num_links	= ARRAY_SIZE(stm32mp13_ent_links)
+	.num_links	= ARRAY_SIZE(stm32mp13_ent_links),
+	.hw_revision	= DCMIPP_STM32MP13_VERR
 };
 
 #define LINK_FLAG_TO_STR(f) ((f) == 0 ? "" :\
@@ -496,6 +499,7 @@ static int dcmipp_probe(struct platform_device *pdev)
 	/* Initialize media device */
 	strscpy(dcmipp->mdev.model, DCMIPP_MDEV_MODEL_NAME,
 		sizeof(dcmipp->mdev.model));
+	dcmipp->mdev.hw_revision = pipe_cfg->hw_revision;
 	dcmipp->mdev.dev = &pdev->dev;
 	media_device_init(&dcmipp->mdev);
 

-- 
2.34.1


