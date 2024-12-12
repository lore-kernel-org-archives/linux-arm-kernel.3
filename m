Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F767E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 09:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dijISF3YlI8nYJBk9LFYkS/tCO33US68/qrqpE/iPBE=; b=GBvcUF1V3/xxxwIjumXMzDC196
	ZFd1h8wNu9xxgN8K3JRnJdXp/sTozRd1awM4P/5gx87tI4FFssHA2o63EIqK9O9A+XKyekuxuv1pv
	2DczPlJCvocjrSpuqR0/aGt7e/0iEKdlWg5LhUOZOeaMpDuws6hoc20I1cudvc8Bu+zOYFpeq2GAQ
	fbjLOjJC0KZw09IHdf/roV+IXGCls/xF4bxJ28cUuhOGK+q/xNHscuJ9pw7QsO2WDiGszYUMaF0EA
	NxxDCsIS5hTRObWw7/zOGqJUL85Cv/l/hOTlP/IC0ePJbAXgDuO3cwYcdnCOGQvHqc/BqZ9icPJik
	GcVXuw9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLfTM-0000000HUY2-09WZ;
	Thu, 12 Dec 2024 09:27:04 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLfMo-0000000HSeW-44ND
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 09:20:21 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC6Pixh025528;
	Thu, 12 Dec 2024 10:20:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	dijISF3YlI8nYJBk9LFYkS/tCO33US68/qrqpE/iPBE=; b=KrZ08M9bypPrKl+v
	euFwL4fsb7IaLNwM2MA2xWAyqNQt+s2NOjX4ojbcitfQwQF7Wigj0INAjDfAJ4X3
	Abl0aO0mZ46VpwoHBk9DsJ3jgVuQvlSLbgtfewvL3SeuMhG97YJD+DSXC4F+OooZ
	wFKq1bvgYNuADcRSsn1L+oUushFmuIoYgPSHuAmoZxx/BbaSicAYXBkUptYQSNyw
	wSVU8T4u06dPUvBbtDD0Xz27O3DGLBA4t9MNhYPy6XUs3LrHsj6Up1/vnhvwJvtm
	oTBotEN4ptQKp0YEd5pod60mSmfY9wOw13nrpZRBUOAbiTuJjcrkocKpcEJaqcr1
	sjbUDA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ftj70qnm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 10:20:04 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8A6484004F;
	Thu, 12 Dec 2024 10:19:02 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2FE36258A6C;
	Thu, 12 Dec 2024 10:18:09 +0100 (CET)
Received: from localhost (10.129.178.65) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 12 Dec
 2024 10:18:08 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 12 Dec 2024 10:17:34 +0100
Subject: [PATCH v4 10/15] media: stm32: dcmipp: avoid duplicated format on
 enum in bytecap
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241212-csi_dcmipp_mp25-v4-10-fbeb55a05ed7@foss.st.com>
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
X-CRM114-CacheID: sfid-20241212_012019_285695_0197EB9B 
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

Avoid duplication of enumerated pixelformat on the bytecap
video capture device.  Indeed, since the bytecap format list
contains both CSI & parallel 16bits formats, ensure that same
pixelformat are not reported twice when performing enumeration
of supported formats.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../st/stm32/stm32-dcmipp/dcmipp-bytecap.c         | 42 +++++++++++-----------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index da80e1aa37ca..1c1b6b48918e 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -268,34 +268,34 @@ static int dcmipp_bytecap_enum_fmt_vid_cap(struct file *file, void *priv,
 {
 	const struct dcmipp_bytecap_pix_map *vpix;
 	unsigned int index = f->index;
-	unsigned int i;
+	unsigned int i, prev_pixelformat = 0;
 
-	if (f->mbus_code) {
-		/*
-		 * If a media bus code is specified, only enumerate formats
-		 * compatible with it.
-		 */
-		for (i = 0; i < ARRAY_SIZE(dcmipp_bytecap_pix_map_list); i++) {
-			vpix = &dcmipp_bytecap_pix_map_list[i];
-			if (vpix->code != f->mbus_code)
-				continue;
+	/*
+	 * List up all formats (or only ones matching f->mbus_code), taking
+	 * care of removing duplicated entries (due to support of both
+	 * parallel & csi 16 bits formats
+	 */
+	for (i = 0; i < ARRAY_SIZE(dcmipp_bytecap_pix_map_list); i++) {
+		vpix = &dcmipp_bytecap_pix_map_list[i];
+		/* Skip formats not matching requested mbus code */
+		if (f->mbus_code && vpix->code != f->mbus_code)
+			continue;
 
-			if (index == 0)
-				break;
+		/* Skip duplicated pixelformat */
+		if (vpix->pixelformat == prev_pixelformat)
+			continue;
 
-			index--;
-		}
+		prev_pixelformat = vpix->pixelformat;
 
-		if (i == ARRAY_SIZE(dcmipp_bytecap_pix_map_list))
-			return -EINVAL;
-	} else {
-		/* Otherwise, enumerate all formats. */
-		if (f->index >= ARRAY_SIZE(dcmipp_bytecap_pix_map_list))
-			return -EINVAL;
+		if (index == 0)
+			break;
 
-		vpix = &dcmipp_bytecap_pix_map_list[f->index];
+		index--;
 	}
 
+	if (i == ARRAY_SIZE(dcmipp_bytecap_pix_map_list))
+		return -EINVAL;
+
 	f->pixelformat = vpix->pixelformat;
 
 	return 0;

-- 
2.34.1


