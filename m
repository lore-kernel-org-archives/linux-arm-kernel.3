Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35CC6D49221
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 13:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CljfqA+tRNBhppv+/47HW/+wKiyeRMWC8XV1LMidIbQ=; b=0TYSRS1NKkvN+f6kMIYs+EiDQe
	v+zXATfI0G8AAuKM7j0iq2+xWZ/HA4naPmbMhWcd8c/h+w0vai/sfX4SC5U1xOm6x43yTZg1VOhFo
	8kiE8l4ZIaeze40Qn8OqbYQ63jpGyc71OdgZa8+OMW60rnntHkvfoRpKUEJSCsRSwN8Ek+hJ2cAru
	VT9XcGGwZyLMSaxRS9P3DZumM2z0zzTwdS0rxyBEpON1noij/CjAByq315YEHs4MwOvsKYbw1IcgR
	Mo6Ssqd/SD+V/byxwJpHBKvTeB+2QpXKxW6d1fp/2fR3rzP5oUFQqjVFz/7Gz4ECUx78cQDVapTm3
	md9TY7Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD272-00000009eyU-2Fon;
	Mon, 18 Nov 2024 13:48:20 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1z0-00000009cqY-0l3p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 13:40:09 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AIBWj5G006648;
	Mon, 18 Nov 2024 14:39:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	CljfqA+tRNBhppv+/47HW/+wKiyeRMWC8XV1LMidIbQ=; b=ceGhG0/oMDAZzn09
	fHYpZU+nk03UDXUas7ZgVvweSWqHHTQZaWQA7YLnEu+7RMSrW46Zddnh5Saox0MM
	QpT7rWXRAJ4+VUSZF2VOxlvXSRlrlrBxZ4BRUkeO9v/car7pSThpXLrjnIckMv1y
	T0stgRMJSCyIVMB8j3Q5ujdEefCRxNL4L+fS3zfuVfgWAMdrHOqIgJNES9eYSME9
	OB1KIiGCKA5FPc9dNyFaBezScakGrmMzFE1mYsz0MJBmCV6OTLOxvDcFpdEoj0R/
	U9yxPCEcQrB2H7Mod8hev2687iSaFKitBBAcDIJ+kdBNF+yDblLrb0TwSBYgJide
	82BVNQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42xknvyh8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 14:39:52 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7BCCA40062;
	Mon, 18 Nov 2024 14:38:33 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C4DC4275651;
	Mon, 18 Nov 2024 14:35:31 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 18 Nov
 2024 14:35:31 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 18 Nov 2024 14:35:32 +0100
Subject: [PATCH v3 09/15] media: stm32: dcmipp: add 1X16 RGB / YUV formats
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241118-csi_dcmipp_mp25-v3-9-c1914afb0a0f@foss.st.com>
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
X-CRM114-CacheID: sfid-20241118_054002_570287_389A41D0 
X-CRM114-Status: GOOD (  16.24  )
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

Add 1X16 RGB & YUV formats support within bytecap & byteproc.
Slightly change the link_validate function to be able to validate
against either 1X16 or 2X8 variant of a format.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../st/stm32/stm32-dcmipp/dcmipp-bytecap.c         | 23 ++++++++++++++++------
 .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c        |  5 +++++
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index d6fad99e44bba5bcab1df056ba9208e82aff4bea..99732d19dc4d5f4692588118eadb236d4ed9c8a1 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -56,10 +56,15 @@ struct dcmipp_bytecap_pix_map {
 
 static const struct dcmipp_bytecap_pix_map dcmipp_bytecap_pix_map_list[] = {
 	PIXMAP_MBUS_PFMT(RGB565_2X8_LE, RGB565),
+	PIXMAP_MBUS_PFMT(RGB565_1X16, RGB565),
 	PIXMAP_MBUS_PFMT(YUYV8_2X8, YUYV),
+	PIXMAP_MBUS_PFMT(YUYV8_1X16, YUYV),
 	PIXMAP_MBUS_PFMT(YVYU8_2X8, YVYU),
+	PIXMAP_MBUS_PFMT(YVYU8_1X16, YVYU),
 	PIXMAP_MBUS_PFMT(UYVY8_2X8, UYVY),
+	PIXMAP_MBUS_PFMT(UYVY8_1X16, UYVY),
 	PIXMAP_MBUS_PFMT(VYUY8_2X8, VYUY),
+	PIXMAP_MBUS_PFMT(VYUY8_1X16, VYUY),
 	PIXMAP_MBUS_PFMT(Y8_1X8, GREY),
 	PIXMAP_MBUS_PFMT(SBGGR8_1X8, SBGGR8),
 	PIXMAP_MBUS_PFMT(SGBRG8_1X8, SGBRG8),
@@ -819,8 +824,7 @@ static int dcmipp_bytecap_link_validate(struct media_link *link)
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 		.pad = link->source->index,
 	};
-	const struct dcmipp_bytecap_pix_map *vpix;
-	int ret;
+	int ret, i;
 
 	ret = v4l2_subdev_call(source_sd, pad, get_fmt, NULL, &source_fmt);
 	if (ret < 0)
@@ -834,10 +838,17 @@ static int dcmipp_bytecap_link_validate(struct media_link *link)
 		return -EINVAL;
 	}
 
-	vpix = dcmipp_bytecap_pix_map_by_pixelformat(vcap->format.pixelformat);
-	if (source_fmt.format.code != vpix->code) {
-		dev_err(vcap->dev, "Wrong mbus_code 0x%x, (0x%x expected)\n",
-			vpix->code, source_fmt.format.code);
+	for (i = 0; i < ARRAY_SIZE(dcmipp_bytecap_pix_map_list); i++) {
+		if (dcmipp_bytecap_pix_map_list[i].pixelformat ==
+			vcap->format.pixelformat &&
+		    dcmipp_bytecap_pix_map_list[i].code ==
+			source_fmt.format.code)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(dcmipp_bytecap_pix_map_list)) {
+		dev_err(vcap->dev, "mbus code 0x%x do not match capture device format (0x%x)\n",
+			vcap->format.pixelformat, source_fmt.format.code);
 		return -EINVAL;
 	}
 
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
index 72f1bb4c64ad4c194c14467dfc354a04bc69e208..3c742a546441e190b7d93d5e9401d6824acf509b 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
@@ -48,10 +48,15 @@ struct dcmipp_byteproc_pix_map {
 	}
 static const struct dcmipp_byteproc_pix_map dcmipp_byteproc_pix_map_list[] = {
 	PIXMAP_MBUS_BPP(RGB565_2X8_LE, 2),
+	PIXMAP_MBUS_BPP(RGB565_1X16, 2),
 	PIXMAP_MBUS_BPP(YUYV8_2X8, 2),
+	PIXMAP_MBUS_BPP(YUYV8_1X16, 2),
 	PIXMAP_MBUS_BPP(YVYU8_2X8, 2),
+	PIXMAP_MBUS_BPP(YVYU8_1X16, 2),
 	PIXMAP_MBUS_BPP(UYVY8_2X8, 2),
+	PIXMAP_MBUS_BPP(UYVY8_1X16, 2),
 	PIXMAP_MBUS_BPP(VYUY8_2X8, 2),
+	PIXMAP_MBUS_BPP(VYUY8_1X16, 2),
 	PIXMAP_MBUS_BPP(Y8_1X8, 1),
 	PIXMAP_MBUS_BPP(SBGGR8_1X8, 1),
 	PIXMAP_MBUS_BPP(SGBRG8_1X8, 1),

-- 
2.25.1


