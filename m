Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99EBE7719A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 13:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mvpHg9TQ6IL1UuT8hLct/OvilUvBkO53Z6F+HaXouII=; b=CCN0lA0+V47YeV1IcgMHlF87Cg
	dVuY+tHDmSQjNIn2BIaqRbMq26LqBtAaWIs4VuDotNhyL5UK48nrTNYQZ8DIder/ij3WHV3V03iqf
	3xPoLS4TeJ6In4L6FW55A0V97kfJHkxGa5qO0pV/D4ZfdR7kRLemN8hw9aDh9r/8tXjKqMnmivZuh
	M+39H/ypOOKnmgpfQnWnSABI4BlfASkgwb5Sv0BAT3wB9h/4ZC20v5JtayHb+BKn/s47lAWI2qpT+
	D+I0MyeN8dG37SZV2qzW2hcIkB0CCzZsY0jcqXP12tVKpuqDV9YYLyuJcySFKRv/YKgT9AcZcmcmC
	JuxtCGWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVWNH-00000008ehU-26Ub;
	Wed, 08 Jan 2025 13:45:31 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVW0i-00000008b1m-0b5p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 13:22:13 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508DL3ZV002861;
	Wed, 8 Jan 2025 14:22:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	mvpHg9TQ6IL1UuT8hLct/OvilUvBkO53Z6F+HaXouII=; b=mIuFO2W/T/pz+RBI
	kRfhDHXuRKgwKBJ4fTDFiKnvamwsyPhFq124XIsmx11kOoW6JcJHuITQ85R3zXwY
	eym4A06l/6jxEm69xaUB1Jdjk/8SB+Xw+JXBrAQ3YReXd00QPSUzc7l4LiVTfwsM
	L2UPLAETeg98XwkBeFImbHbG499mIHERgzOvsvAeuvWaVjPVePc6pgtPEpQQco2h
	tXCojQP4+DQ01edcxKEGjC+jPLYCoU3jLXN/Vcat8JqHpchIX2ufA273VrfMC/aU
	QYhPcdcC0GfzexHMpI7sMlJi7d+h53UYRaoAq9xx+mgfmhU4VSDnruVWGjcjv/rG
	QbHbRA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 441kvw1rwa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 14:22:02 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 205F040052;
	Wed,  8 Jan 2025 14:20:40 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B8E7A270D63;
	Wed,  8 Jan 2025 14:16:18 +0100 (CET)
Received: from localhost (10.252.31.140) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 8 Jan
 2025 14:16:18 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Wed, 8 Jan 2025 14:16:11 +0100
Subject: [PATCH v2 8/8] media: stm32: dcmipp: add has_csi2 & needs_mclk in
 match data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250108-csi_dcmipp_mp25_enhancements-v2-8-05808ce50e41@foss.st.com>
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
X-CRM114-CacheID: sfid-20250108_052212_479209_3C43AD5E 
X-CRM114-Status: GOOD (  17.73  )
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

Introduce two variable has_csi and has_mclk within the
match data of the driver in order to know, depending on
the compatible if CSI-2 interface is available and if
the mclk clk should be retrieved.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   | 23 ++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
index 5a04018a6a9d..1b7bae3266c8 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -89,6 +89,8 @@ struct dcmipp_pipeline_config {
 	const struct dcmipp_ent_link *links;
 	size_t num_links;
 	u32 hw_revision;
+	bool has_csi2;
+	bool needs_mclk;
 };
 
 /* --------------------------------------------------------------------------
@@ -164,7 +166,9 @@ static const struct dcmipp_pipeline_config stm32mp25_pipe_cfg = {
 	.num_ents	= ARRAY_SIZE(stm32mp25_ent_config),
 	.links		= stm32mp25_ent_links,
 	.num_links	= ARRAY_SIZE(stm32mp25_ent_links),
-	.hw_revision    = DCMIPP_STM32MP25_VERR
+	.hw_revision    = DCMIPP_STM32MP25_VERR,
+	.has_csi2	= true,
+	.needs_mclk	= true
 };
 
 #define LINK_FLAG_TO_STR(f) ((f) == 0 ? "" :\
@@ -296,7 +300,7 @@ static int dcmipp_graph_notify_bound(struct v4l2_async_notifier *notifier,
 				     struct v4l2_async_connection *asd)
 {
 	struct dcmipp_device *dcmipp = notifier_to_dcmipp(notifier);
-	int ret;
+	int ret = -EINVAL;
 	int src_pad, i;
 	struct dcmipp_ent_device *sink;
 	struct v4l2_fwnode_endpoint vep = { 0 };
@@ -304,15 +308,9 @@ static int dcmipp_graph_notify_bound(struct v4l2_async_notifier *notifier,
 	enum v4l2_mbus_type supported_types[] = {
 		V4L2_MBUS_PARALLEL, V4L2_MBUS_BT656, V4L2_MBUS_CSI2_DPHY
 	};
-	int supported_types_nb = ARRAY_SIZE(supported_types);
 
 	dev_dbg(dcmipp->dev, "Subdev \"%s\" bound\n", subdev->name);
 
-	/* Only MP25 supports CSI input */
-	if (!of_device_is_compatible(dcmipp->dev->of_node,
-				     "st,stm32mp25-dcmipp"))
-		supported_types_nb--;
-
 	/*
 	 * Link this sub-device to DCMIPP, it could be
 	 * a parallel camera sensor or a CSI-2 to parallel bridge
@@ -330,7 +328,12 @@ static int dcmipp_graph_notify_bound(struct v4l2_async_notifier *notifier,
 	}
 
 	/* Check for supported MBUS type */
-	for (i = 0; i < supported_types_nb; i++) {
+	for (i = 0; i < ARRAY_SIZE(supported_types); i++) {
+		/* Only MP25 supports CSI input */
+		if (supported_types[i] == V4L2_MBUS_CSI2_DPHY &&
+		    !dcmipp->pipe_cfg->has_csi2)
+			continue;
+
 		vep.bus_type = supported_types[i];
 		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
 		if (!ret)
@@ -529,7 +532,7 @@ static int dcmipp_probe(struct platform_device *pdev)
 				     "Unable to get kclk\n");
 	dcmipp->kclk = kclk;
 
-	if (!of_device_is_compatible(pdev->dev.of_node, "st,stm32mp13-dcmipp")) {
+	if (dcmipp->pipe_cfg->needs_mclk) {
 		mclk = devm_clk_get(&pdev->dev, "mclk");
 		if (IS_ERR(mclk))
 			return dev_err_probe(&pdev->dev, PTR_ERR(mclk),

-- 
2.34.1


