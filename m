Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E1EE77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 13:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fuFnMO3ijaaacswBw6QbcsmE5nKXXLvyIsQw+1GMwgY=; b=otlTLEyIEnZzl/KgDsT/DcteDv
	4ZRLB91apixdLY8DuDDrJ2F+AUtbVObgmdwEy9SKdlNQYXqVlsTb3MtFXwd/a7sI0TMuaFgPIAHz1
	fNl5gjBWmBVI4nZM0JdrMYQ/YMNYEECtuVC34t1aDcl2VfAfnF5jjOn8Sw9QtNFeWVBh+J1yZge6y
	Nn/Eg2YL5njtwEfI/KFWQZDTuhtI/4a+3URHqftRZGVUdP4X2z/J0BqD21eluIbqJg30brDSL1IOC
	ChYligV7MB5wgpVM6B/UIvDE5AmkZOwhb+BFVVSfka4O2K5q5y7KNhp0wpsWs8YxMa1pCi2xm5DVO
	LoLf4/3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVWNF-00000008eh3-3Izn;
	Wed, 08 Jan 2025 13:45:29 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVzl-00000008auU-1b66
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 13:21:14 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508DL3fj027097;
	Wed, 8 Jan 2025 14:21:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	fuFnMO3ijaaacswBw6QbcsmE5nKXXLvyIsQw+1GMwgY=; b=u9RZxc70cXLvchBK
	iYjHnAd3gcyecsNcts+g7QfKgG3n9T2Ob2yyg03VgrBBdK7rHRAidZqYzO1tH+m5
	X7pO7OrEh0wUwNKW0RZO4g1By5wt3Adey527HOe69Y0u/9QfKKd1VfJMOzP7saCE
	H+E2iYGyYhUh7G12J4hhyWRkeKlxQ+ULXfOnNmSYavI2ztBN1gC/nkvNGWZIJAkX
	RdWS3XEN0B12uNNtRa62GLfqGmFG9CDfhA7nZmc5ZSQ1e7RAjJnonFYIS0JX34IA
	vKZbBeP5N8tA6vfy7RyDx0Q33zYxlhMBWZ8jIiObj83MpxFrB+1pZO8Hze8byZkl
	5Wp46w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 441at8k85j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 14:21:03 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7697D40044;
	Wed,  8 Jan 2025 14:19:37 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6975126E530;
	Wed,  8 Jan 2025 14:16:15 +0100 (CET)
Received: from localhost (10.252.31.140) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 8 Jan
 2025 14:16:15 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Wed, 8 Jan 2025 14:16:08 +0100
Subject: [PATCH v2 5/8] media: stm32: csi: simplify enable_streams error
 handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250108-csi_dcmipp_mp25_enhancements-v2-5-05808ce50e41@foss.st.com>
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
X-CRM114-CacheID: sfid-20250108_052113_693490_D4B4C9A7 
X-CRM114-Status: GOOD (  10.07  )
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

Put all error handling for VC stop and CSI stop together
to avoid duplication of code.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-csi.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
index 3654f9895dbc..4affbc00b042 100644
--- a/drivers/media/platform/st/stm32/stm32-csi.c
+++ b/drivers/media/platform/st/stm32/stm32-csi.c
@@ -694,19 +694,21 @@ static int stm32_csi_enable_streams(struct v4l2_subdev *sd,
 	ret = stm32_csi_start_vc(csidev, state, 0);
 	if (ret) {
 		dev_err(csidev->dev, "Failed to start VC0\n");
-		stm32_csi_stop(csidev);
-		return ret;
+		goto failed_start_vc;
 	}
 
 	ret = v4l2_subdev_enable_streams(csidev->s_subdev,
 					 csidev->s_subdev_pad_nb, BIT_ULL(0));
-	if (ret) {
-		stm32_csi_stop_vc(csidev, 0);
-		stm32_csi_stop(csidev);
-		return ret;
-	}
+	if (ret)
+		goto failed_enable_streams;
 
 	return 0;
+
+failed_enable_streams:
+	stm32_csi_stop_vc(csidev, 0);
+failed_start_vc:
+	stm32_csi_stop(csidev);
+	return ret;
 }
 
 static int stm32_csi_init_state(struct v4l2_subdev *sd,

-- 
2.34.1


