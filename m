Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BAAE77187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 17:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KypdGnyKgLl4nhvMId8FZobhUoEfqEaVUPzgI6v5dkk=; b=jENyDo334uxQ2ZVTDhblDQtgVK
	wGXN7TvZfPRFj9jC4H4zifdPl2LQzlP0hon5Uu5wQ6kA5SP3cbRBPshEoqQO3E1nqZ7k3kppTV6SI
	t97Ik9YTmAU50AJVaw/YHfSLeyGD1sJljKa3aXMrPbgSelcGcskc/O3GH5q9egi70otgo1lGDiF3u
	lcmYO/Oj9RFLVfg3GVeYI6e+mBxwMuuc9wTSY/gD66qfAM33D+KwllE6T7h7to0Hq2a8v3aaitSN2
	dh65O2EsBHFNteMWk+bpLTO/o5O/zVooFAV8MHvdDIIYqyCFmS6D9MtRid+vRGGA2Eeg7xuul/hpI
	OgUMdaLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNbbx-0000000EOOC-1ohJ;
	Tue, 17 Dec 2024 17:43:57 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNbZj-0000000ENlo-37ux
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 17:41:41 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHD9qtI008410;
	Tue, 17 Dec 2024 18:41:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	KypdGnyKgLl4nhvMId8FZobhUoEfqEaVUPzgI6v5dkk=; b=H335tpHYP5jCXwXe
	NWSYmv2md7kclq5VcyXzN/bMfS8tH3ZI+xMOZ0t0eoNWLgmRLFP2xBJWEprcZ2ox
	g5zM7l6wYjEQT84EK2tjCTVTt4VbSaNVXyMFXdGOx+sUbnlq72Pxz7eeJ/+UDBXN
	B+7DOKBMLhBPlM8QAOMBznjLq/ZwOzYdAsGQSuBapjuJSyTwDVXl0/xQsIOE01Fj
	BHvGbiPQLuVxrgBPPseS4zUwNg5zbaj9UF4joYICoMPNqkGwn4A9MZ8Bm5iD/lYx
	joTQtv6593rWMbb5GB/Mcs+LPpu9qHKjHL23zg27qJ1OEIK8qeKZoq0zzS4agO9G
	T3CU2Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43k5h9jwa0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 18:41:25 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7C6C640049;
	Tue, 17 Dec 2024 18:40:16 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8DCFB28A65A;
	Tue, 17 Dec 2024 18:39:28 +0100 (CET)
Received: from localhost (10.252.23.235) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 17 Dec
 2024 18:39:28 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 17 Dec 2024 18:39:21 +0100
Subject: [PATCH 4/9] media: stm32: csi: register subdev only at end of
 probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241217-csi_dcmipp_mp25_enhancements-v1-4-2b432805d17d@foss.st.com>
References: <20241217-csi_dcmipp_mp25_enhancements-v1-0-2b432805d17d@foss.st.com>
In-Reply-To: <20241217-csi_dcmipp_mp25_enhancements-v1-0-2b432805d17d@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.1
X-Originating-IP: [10.252.23.235]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_094140_086399_11E40740 
X-CRM114-Status: GOOD (  12.44  )
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

Call v4l2_async_register_subdev only whenever all initialization
are completed at the end of the probe function.
Remove as well useless err_free_priv label by returning directly
upon error.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-csi.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
index e2f63bb47d33..89fcd7d07904 100644
--- a/drivers/media/platform/st/stm32/stm32-csi.c
+++ b/drivers/media/platform/st/stm32/stm32-csi.c
@@ -991,11 +991,11 @@ static int stm32_csi_probe(struct platform_device *pdev)
 
 	ret = stm32_csi_get_resources(csidev, pdev);
 	if (ret)
-		goto err_free_priv;
+		return ret;
 
 	ret = stm32_csi_parse_dt(csidev);
 	if (ret)
-		goto err_free_priv;
+		return ret;
 
 	csidev->sd.owner = THIS_MODULE;
 	csidev->sd.dev = &pdev->dev;
@@ -1020,10 +1020,6 @@ static int stm32_csi_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_cleanup;
 
-	ret = v4l2_async_register_subdev(&csidev->sd);
-	if (ret < 0)
-		goto err_cleanup;
-
 	/* Reset device */
 	rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(rstc)) {
@@ -1050,6 +1046,10 @@ static int stm32_csi_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(&pdev->dev);
 
+	ret = v4l2_async_register_subdev(&csidev->sd);
+	if (ret < 0)
+		goto err_cleanup;
+
 	dev_info(&pdev->dev,
 		 "Probed CSI with %u lanes\n", csidev->num_lanes);
 
@@ -1057,7 +1057,6 @@ static int stm32_csi_probe(struct platform_device *pdev)
 
 err_cleanup:
 	v4l2_async_nf_cleanup(&csidev->notifier);
-err_free_priv:
 	return ret;
 }
 

-- 
2.34.1


