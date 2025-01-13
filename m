Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33E0E7719F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 09:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1OijE7D/bwZ86UgAtBbLF2m/QNftawfwPt9+VBoGOMA=; b=f4U4iqQPExfB0V6xiaITzPB6h+
	dhN+5Ck4Q1xKNT0fKLbQxQyQ/W9U6kXm3tbordm+32/ozYiYaBa4f2aHwkQEL4OSg5yYdIj/j1dFQ
	CgDhXTE59EyXA38YxYYVgdcCgerjgSYlFB5zuUahXeN/e09Y4C6tt+g7/e60y376VKm2IbRCud7BP
	zyvuv7pptE/apk3xfDWNmVILHc6FXrqmCjexz3nCJP3o817NG4FtN4MTXBDBz6svq7QrU8eMXynMY
	C6/LAgL5eGl1DnyDC7kJ4ZH+7qGw9hys2SzDZEJBmx58QtwiFaZIIi8dE2wqWgVVaGKAfC0Ew+Tf1
	x4CFYGkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGSf-00000004YAY-26D0;
	Mon, 13 Jan 2025 09:10:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGJH-00000004Vjl-2jZW
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jan 2025 09:00:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=1OijE7D/bwZ86UgAtBbLF2m/QNftawfwPt9+VBoGOMA=; b=j+J/8KR4eNQURk0Y8KgL8kidZ3
	3KfcU7j+COZgTh7SaHVJpD68OjjuHFAl0lumXg7Y4X8BqRxxbYrjaMqKVcZSevI8SxV5KWGPw2FOQ
	wHkbmlT9whaagAs3W6p9U643tgyJP0Z2MiiBQtSCPxFhqOSUMATjCNzG0Y5ssN1czjvwU3lJJSRqD
	KMhSRJms4rb6VBXa9vUZweSBhSbRAJClNOWoNs1ej9oJoJBQzDFr12I1Ey2ply6t7ybKvp6Ci9Bfx
	0QYzQmminofEFZbcp29EjJW+jwbBvzo/vDkFWqCkWHz6oIKUcjqHcMOf25eS477h3HleilruB04pW
	5PiUmA/w==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGJC-0000000AGow-3rMJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 09:00:34 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D5ko5q016842;
	Mon, 13 Jan 2025 10:00:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	1OijE7D/bwZ86UgAtBbLF2m/QNftawfwPt9+VBoGOMA=; b=MzSUHa3R4y1nErgC
	P8gGgnwQgeysswan49qV7vLmSx+iKCvsJSJpo3Sb0wVhxSZXINjlGhVmQRDjy6hb
	JfIbDioyQRiGq8/Bb1ulMxmQNhzqgbO26TN+RVwv6lM1C/EBG3m1vOBSO9/DSUhV
	yPpswU+PhsyhWYn1bzpC81ttPd1Idisf5ojkdltLbGIX7fHsTbxdwBh3fe0q01Mx
	zOaYKvW0KQFXoUkRzxzr6AhSEpJNW0TTmjg5ylIvTbB/oTJqzcuVpiv9z97c+l2r
	5d4hRZMU3a2h66IW2L51yAsRt0cLS4EZQQCGuXoJXvqzS48MC2gKx/e7jXV7mSjB
	Oqik4A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4444fmub6a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 10:00:23 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1800C40057;
	Mon, 13 Jan 2025 09:59:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4FEBB234C38;
	Mon, 13 Jan 2025 09:58:17 +0100 (CET)
Received: from localhost (10.129.178.39) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 13 Jan
 2025 09:58:17 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 13 Jan 2025 09:57:58 +0100
Subject: [PATCH v3 8/9] media: stm32: csi: correct unsigned or useless
 variable settings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250113-csi_dcmipp_mp25_enhancements-v3-8-33b96744df46@foss.st.com>
References: <20250113-csi_dcmipp_mp25_enhancements-v3-0-33b96744df46@foss.st.com>
In-Reply-To: <20250113-csi_dcmipp_mp25_enhancements-v3-0-33b96744df46@foss.st.com>
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
X-Originating-IP: [10.129.178.39]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_090031_207519_BBF81085 
X-CRM114-Status: GOOD (  14.46  )
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

Correct several missing unsigned type missing for loop variables
and also remove useless initialization of variables.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-csi.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
index 1be12c9dcf55..602b0879f21e 100644
--- a/drivers/media/platform/st/stm32/stm32-csi.c
+++ b/drivers/media/platform/st/stm32/stm32-csi.c
@@ -357,7 +357,7 @@ static inline struct stm32_csi_dev *to_csidev(struct v4l2_subdev *sd)
 static int stm32_csi_setup_lane_merger(struct stm32_csi_dev *csidev)
 {
 	u32 lmcfgr = 0;
-	int i;
+	unsigned int i;
 
 	for (i = 0; i < csidev->num_lanes; i++) {
 		if (!csidev->lanes[i] || csidev->lanes[i] > STM32_CSI_LANES_MAX) {
@@ -595,20 +595,20 @@ static int stm32_csi_start_vc(struct stm32_csi_dev *csidev,
 {
 	struct v4l2_mbus_framefmt *mbus_fmt;
 	const struct stm32_csi_fmts *fmt;
-	u32 cfgr1 = 0;
-	int ret = 0;
 	u32 status;
+	u32 cfgr1;
+	int ret;
 
 	mbus_fmt = v4l2_subdev_state_get_format(state, STM32_CSI_PAD_SOURCE);
 	fmt = stm32_csi_code_to_fmt(mbus_fmt->code);
 
 	/* If the mbus code is JPEG, don't enable filtering */
 	if (mbus_fmt->code == MEDIA_BUS_FMT_JPEG_1X8) {
-		cfgr1 |= STM32_CSI_VCXCFGR1_ALLDT;
+		cfgr1 = STM32_CSI_VCXCFGR1_ALLDT;
 		cfgr1 |= fmt->input_fmt << STM32_CSI_VCXCFGR1_CDTFT_SHIFT;
 		dev_dbg(csidev->dev, "VC%d: enable AllDT mode\n", vc);
 	} else {
-		cfgr1 |= fmt->datatype << STM32_CSI_VCXCFGR1_DT0_SHIFT;
+		cfgr1 = fmt->datatype << STM32_CSI_VCXCFGR1_DT0_SHIFT;
 		cfgr1 |= fmt->input_fmt << STM32_CSI_VCXCFGR1_DT0FT_SHIFT;
 		cfgr1 |= STM32_CSI_VCXCFGR1_DT0EN;
 		dev_dbg(csidev->dev, "VC%d: enable DT0(0x%x)/DT0FT(0x%x)\n",
@@ -634,8 +634,8 @@ static int stm32_csi_start_vc(struct stm32_csi_dev *csidev,
 
 static int stm32_csi_stop_vc(struct stm32_csi_dev *csidev, u32 vc)
 {
-	int ret = 0;
 	u32 status;
+	int ret;
 
 	/* Stop the Virtual Channel */
 	writel_relaxed(STM32_CSI_CR_VCXSTOP(vc) | STM32_CSI_CR_CSIEN,
@@ -714,7 +714,7 @@ static int stm32_csi_enable_streams(struct v4l2_subdev *sd,
 static int stm32_csi_init_state(struct v4l2_subdev *sd,
 				struct v4l2_subdev_state *state)
 {
-	int i;
+	unsigned int i;
 
 	for (i = 0; i < sd->entity.num_pads; i++)
 		*v4l2_subdev_state_get_format(state, i) = fmt_default;
@@ -879,7 +879,8 @@ static irqreturn_t stm32_csi_irq_thread(int irq, void *arg)
 static int stm32_csi_get_resources(struct stm32_csi_dev *csidev,
 				   struct platform_device *pdev)
 {
-	int irq, ret, i;
+	unsigned int i;
+	int irq, ret;
 
 	csidev->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
 	if (IS_ERR(csidev->base))

-- 
2.34.1


