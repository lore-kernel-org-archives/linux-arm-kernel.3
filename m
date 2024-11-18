Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B5CD49223
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 13:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Boh51om16/6cUq1DCmo9haIf3b5vZQi+saUvgPu/98Y=; b=SPF6xme3Ff/tsYIPrZblS9LFvB
	sSlqnKkUdUr6V0mWYgXQzADelN98a6QWfGd/B1sJJ5EQ3Uf8ByhCK9UlnVO79nyKBvd3LTJxeLb49
	7GVHc+quSpI+oM2JN2qBs6BemKm+j9hEgmZSceUqC6DpQQ9BgwGJLQTHgkkRx8mCbPbLWU75EbQqm
	P1ta79lhyDWyxNkk5tIDTbCrvXbpEBaEEKy5zBYR1mvLpiBmR74VvvfmeUh6dcPUB5cQDKkTfAlvo
	88Trk5rGz1QQ6o8a7leUFHWfVTbl5YJ2z0/riRn7dp79h/IwSaw5pVtRfpXLy/Rce98WnKgXUQhmz
	4F/O4QLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD24K-00000009eJc-1BFu;
	Mon, 18 Nov 2024 13:45:32 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1yz-00000009cpa-2U9W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 13:40:05 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI9DM2l028148;
	Mon, 18 Nov 2024 14:39:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Boh51om16/6cUq1DCmo9haIf3b5vZQi+saUvgPu/98Y=; b=2M4v1XZiijK8nefF
	ak2n/7yBsecDvequuWx6nRBUKZpgK6HJwQLNrK8PLdkTkNlCi1wom4T4Tl59V3U4
	o64j6uR/yXRLYjHSUAabFZRTRcs8nRNMWcGHgmn5Vdmr3WSyj9yDQE0bhR3QCorR
	bogGW+Yj9LPuyNXwvTuxRSCk22T+paXMgFFDYrjs/vep67/5Psux8qKKwZQnmKYi
	cKdmN487K55apXykg0qiKeISzXWk2Kdtr4wvLlByesJ35w5AYLJtZiG7uJl3PnW2
	Ycs5c/RqI8T+VhtDaaiONuPeo3DcpxRYX9W7mjMuvO5cK1OQSi164KyuERAhSFUX
	MEpKhQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42y77n504r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 14:39:52 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F23E64005B;
	Mon, 18 Nov 2024 14:38:32 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9F1FD2747D7;
	Mon, 18 Nov 2024 14:35:28 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 18 Nov
 2024 14:35:28 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 18 Nov 2024 14:35:27 +0100
Subject: [PATCH v3 04/15] media: stm32: dcmipp: use
 v4l2_subdev_is_streaming
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241118-csi_dcmipp_mp25-v3-4-c1914afb0a0f@foss.st.com>
References: <20241118-csi_dcmipp_mp25-v3-0-c1914afb0a0f@foss.st.com>
In-Reply-To: <20241118-csi_dcmipp_mp25-v3-0-c1914afb0a0f@foss.st.com>
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
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_054001_964955_7EA26131 
X-CRM114-Status: GOOD (  13.75  )
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

Rely on v4l2_subdev_is_streaming in order to know if the subdev
is streaming or not instead of relying on a local variable.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c | 6 +-----
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c | 5 +----
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
index 5a361ad6b0234c5de03c12b0b7b9d428eae63c06..50500112eab9a7b10a0c5e29773e31ded1a66628 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
@@ -78,7 +78,6 @@ struct dcmipp_byteproc_device {
 	struct v4l2_subdev sd;
 	struct device *dev;
 	void __iomem *regs;
-	bool streaming;
 };
 
 static const struct v4l2_mbus_framefmt fmt_default = {
@@ -239,11 +238,10 @@ static int dcmipp_byteproc_set_fmt(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_format *fmt)
 {
-	struct dcmipp_byteproc_device *byteproc = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *mf;
 	struct v4l2_rect *crop, *compose;
 
-	if (byteproc->streaming)
+	if (v4l2_subdev_is_streaming(sd))
 		return -EBUSY;
 
 	mf = v4l2_subdev_state_get_format(sd_state, fmt->pad);
@@ -495,8 +493,6 @@ static int dcmipp_byteproc_s_stream(struct v4l2_subdev *sd, int enable)
 		}
 	}
 
-	byteproc->streaming = enable;
-
 	return 0;
 }
 
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c
index 62c5c3331cfecdf5fcf0a5d20b4051b1b024968e..05e8897ae37a4b6c8e16c066e83ff5b1d1e07635 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c
@@ -129,7 +129,6 @@ struct dcmipp_par_device {
 	struct v4l2_subdev sd;
 	struct device *dev;
 	void __iomem *regs;
-	bool streaming;
 };
 
 static const struct v4l2_mbus_framefmt fmt_default = {
@@ -230,7 +229,7 @@ static int dcmipp_par_set_fmt(struct v4l2_subdev *sd,
 	struct dcmipp_par_device *par = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *mf;
 
-	if (par->streaming)
+	if (v4l2_subdev_is_streaming(sd))
 		return -EBUSY;
 
 	mf = v4l2_subdev_state_get_format(sd_state, fmt->pad);
@@ -370,8 +369,6 @@ static int dcmipp_par_s_stream(struct v4l2_subdev *sd, int enable)
 		reg_clear(par, DCMIPP_PRCR, DCMIPP_PRCR_ENABLE);
 	}
 
-	par->streaming = enable;
-
 	return ret;
 }
 

-- 
2.25.1


