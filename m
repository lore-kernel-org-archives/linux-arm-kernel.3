Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9319D12660
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 08:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UMjisKeEpQSwI1Wvbjb6PN1AjDm43YkTXsgIuNYi82g=; b=EbWqjfLbO44rMfnr4sUpLWvzvs
	h5sNEKRFBF9r3vqOHOXFKZnNaiGM4RFjLa3m6lI8RtMdS8YgxT3aN9Zo15GUyVfeGAi2HZqTc61TY
	t/t8u+NUDorOXYAGgW24Yd9w2UsQB3vDE40aoaVm36kmii4zE/JRkod3lOtC0QrQU49fSIGqHtpeR
	mUy6ivtQj7SKNNuKcf4NVjsdo1PBbF1ivZSI/E+B31uHdu0Ss6xBjtFYjYCFeqCHzpI6yvlMbXKcU
	HFPLWMHAJBJ5GVbKmCQQeAdzQx6V+U2k/XQ6H39ia/OKoxlygSRhFysiW3ARnVv8+wFkrwALTfTCK
	50wOoGhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Eck-0000000GHgA-07UF;
	Tue, 05 Nov 2024 08:09:14 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8EMc-0000000GEw6-2Cmv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 07:52:36 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A53GSeY022439;
	Tue, 5 Nov 2024 08:52:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	UMjisKeEpQSwI1Wvbjb6PN1AjDm43YkTXsgIuNYi82g=; b=SQSUSbUM2zkhZuws
	PBy6S0AJewSp/6u3emy5wgWhSViEBlty0Wa9jCWGWeq3OnZTW+yDBQa5tdKRad+t
	nhL/+BPn1tfwKUS9wVq7Z+5WnGo4lsSqpD1NX63G9FiXDzUIM61z8YTkdYksIgxp
	MISSsopE+EBSc3bAYEArY8UYMiMf5UvK1byNc2zszl27ZiLCo9bvqkgIN/yiD0J5
	DACOi5g36lZdDhU94mHYSYg2nhnO4ja2nWUQ3sxfW3VR6DWCJDKln4ohFJTLLcJ0
	dT6WFF2mrB96vHBBXa5bRk/2av2m0Esa5r/tKbmUHE6V4uR2c6DnKLjO24EBt/UZ
	kA2+bQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42nxh3rnmj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 08:52:27 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D735C40052;
	Tue,  5 Nov 2024 08:50:26 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2DBCA250FA5;
	Tue,  5 Nov 2024 08:49:35 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 5 Nov
 2024 08:49:34 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 5 Nov 2024 08:49:14 +0100
Subject: [PATCH v2 11/15] media: stm32: dcmipp: fill media ctl hw_revision
 field
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241105-csi_dcmipp_mp25-v2-11-b9fc8a7273c2@foss.st.com>
References: <20241105-csi_dcmipp_mp25-v2-0-b9fc8a7273c2@foss.st.com>
In-Reply-To: <20241105-csi_dcmipp_mp25-v2-0-b9fc8a7273c2@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Hans Verkuil
	<hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_235234_887985_41EDB5CD 
X-CRM114-Status: GOOD (  11.87  )
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
index 50b9b964fbc4674b870189736a49f1d6a02b2503..d2cc19bb40d77f67a1f5fe565bc62f45eff2d266 100644
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
2.25.1


