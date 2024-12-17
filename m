Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035EFE77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 18:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fuFnMO3ijaaacswBw6QbcsmE5nKXXLvyIsQw+1GMwgY=; b=P5Q6y/HeYcAUcsgUFRbkNmX8l8
	wXcFoj+dCnNRmcfKObMKmBLYHk+c/qjbHvmry9KudnfeE3jt4HQr9kHkJl6zHypGeUS5bKHaKsFwf
	GjWSOQWFuuphWpY+gaZsUhbgdm0gx/R024bbB47t8oQxQExLvzFUCIaKbDMO+Tr3Q4nTgl8lGzDkE
	gq+cS8jbxNto5Oaqi/c7h/a7hI47C6otdoiakMh4wt1A0cOuQVRhql5zsioEOb7BxKGmEf+X105pz
	7e+EM/ERzRC3XsSSAZ/EhiMWktmbWhiOsJBhULna7W4qcyoE3jbBzlid5c3OlkXqEx7ISihJfKR6O
	ALBYA8rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNbzT-0000000ESr7-1QCq;
	Tue, 17 Dec 2024 18:08:15 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNbZz-0000000ENu3-1iwq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 17:41:56 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHDD0xc004545;
	Tue, 17 Dec 2024 18:41:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	fuFnMO3ijaaacswBw6QbcsmE5nKXXLvyIsQw+1GMwgY=; b=jR8rDuH8wprDtrPm
	WnQeLVCuC0OfQc4OVFvw9UK/6anCl6ZC+0jTAHHj+9VxtV9f7pCRRyRQZyUmj2eE
	wNfBcmfPrBA6Dq6QYOwRpR8AKrvKY88+FaLM3QHOOEQAg1hTtNRK1WnYrluIFJLd
	oVI316Kt4uYKzBzLqYcl0J5hDjM3FSusVO58BBbG60TS7mAVzvR8/ns/o02oy2rz
	hN78qYHLVF/SBi5Q6Kcwiet3gZJW2nREsAR7LJ5v7lJq3VNBbnKM0UEZ7SO0I7VI
	7OrQJ8/S5ZUoh+6OhgfaTTb790hVdh/FdsxGOd7o6nukQnnyA68CUi9WhgkTqxbD
	fQkw2w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43k689autk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 18:41:44 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7E5C74004C;
	Tue, 17 Dec 2024 18:40:20 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C7E5C292896;
	Tue, 17 Dec 2024 18:39:30 +0100 (CET)
Received: from localhost (10.252.23.235) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 17 Dec
 2024 18:39:30 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 17 Dec 2024 18:39:23 +0100
Subject: [PATCH 6/9] media: stm32: csi: simplify enable_streams error
 handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241217-csi_dcmipp_mp25_enhancements-v1-6-2b432805d17d@foss.st.com>
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
X-CRM114-CacheID: sfid-20241217_094155_737124_DA5C506F 
X-CRM114-Status: UNSURE (   9.39  )
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


