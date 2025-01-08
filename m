Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B31E77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 13:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KypdGnyKgLl4nhvMId8FZobhUoEfqEaVUPzgI6v5dkk=; b=1RtyQtcdnUREEp6v+tEREXXx1V
	b6FxeMe3T7I2r0EgqVapevyCfNIg+8f0qePLee+HTmcYaUlCk3nv9jApPs2kevaYv3h97V+cQ2+d6
	14TFixBqx0bW87EGRB+TK3MQdhkU7+G04GSB0Jmjic+YARQXR9kbwyqdn0tKYjD6XHAU1EWmgYTzk
	0IxYmf/VLEj2GwNMW9iHGD/c5cNeTa0AdzcygnQXg0/w0ZyLTfrhyP+ng9MOYTB5ZajJO4btX6Odr
	LdkwzvXeD2s3OCFj5CAa93ixX/I1AhXw+gPKaZz9xl/je/PmOHKIQdTqJC9EVYm1vdYnbM66v1kf0
	KTQD0IYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVWBO-00000008cpW-0RSC;
	Wed, 08 Jan 2025 13:33:14 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVwp-00000008ZuG-0PhZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 13:18:13 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5089S6hV024342;
	Wed, 8 Jan 2025 14:18:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	KypdGnyKgLl4nhvMId8FZobhUoEfqEaVUPzgI6v5dkk=; b=kRZihFMdMm4/V/5j
	KLBRxAjDqBfFEVDxaXFsPr/tmRQgkCFThqx3QuYGyO0d1oE3MRA/L1TtUyN+upDS
	r0CBFTPxgicSNK4qmoKoSRwgZVj+pGZzceEfzECaF2uIO1NeEcbBLUrgMvYSm3lU
	sdVXbhpwiVPsX1WVqAWIjrMUWO6F7izU5dGugfPt37elLsfe+tObFXjG0wkAzS5z
	4mN2R84vIlB5II31tf9NYeJ/SDCvJ+pUixiWAzjHgMH+Wa7jCSO68zCXwgBRvFEC
	g/WXAy7HG96gc5srZFjPxXixAirhNoL1m8cLaGt0F+DkucJQmSlSOTlzuBVU9/C2
	BehfNQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 441at8k7tp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 14:18:02 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C79F04004A;
	Wed,  8 Jan 2025 14:17:07 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2D52E2795F4;
	Wed,  8 Jan 2025 14:16:13 +0100 (CET)
Received: from localhost (10.252.31.140) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 8 Jan
 2025 14:16:12 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Wed, 8 Jan 2025 14:16:06 +0100
Subject: [PATCH v2 3/8] media: stm32: csi: register subdev only at end of
 probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250108-csi_dcmipp_mp25_enhancements-v2-3-05808ce50e41@foss.st.com>
References: <20250108-csi_dcmipp_mp25_enhancements-v2-0-05808ce50e41@foss.st.com>
In-Reply-To: <20250108-csi_dcmipp_mp25_enhancements-v2-0-05808ce50e41@foss.st.com>
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
X-Originating-IP: [10.252.31.140]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_051811_557065_243FE07B 
X-CRM114-Status: GOOD (  13.11  )
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


