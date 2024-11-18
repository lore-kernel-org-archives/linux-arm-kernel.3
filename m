Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D836D49223
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 13:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kO/XdeoBo7X02W334+E6LhxLlDrGOL8A5vE8mC37cg8=; b=FSQ4pv64ag4BqITLGaBrodlf78
	FYk0xetLg+Ix4IZR+E7YsYjGuslW8eJSFrs7CuTylOd/8mJ+0lj+IdfIJvFm9PYum4ooxbu+PCwJ2
	vpfhEE3dwF1qFSdAtiMAQeDCtrQ8ClSnumKuvO95jRrcY9NedMmmrG8dYd8IPfMb/2Eb19dwzlYg3
	cIJ/e81uasxR12eMznnGqzMxE4PuX84rVHXlUSjrPhknFqd4+Sk4vrRjQ0638Wk+Y3F4p9dDmj0Nn
	34udY6EzccZPDbuSMvnEg/6NKfApTVmD/FygDV8LKZA+MkqgcyRm02p4IjAJjm/PSgFD4JSmZxS5j
	v04IlfNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD2BX-00000009fmU-3SKd;
	Mon, 18 Nov 2024 13:52:59 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1z1-00000009ctN-38NH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 13:40:11 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AIBDkP6027114;
	Mon, 18 Nov 2024 14:39:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	kO/XdeoBo7X02W334+E6LhxLlDrGOL8A5vE8mC37cg8=; b=TDdKmm2/csD8ICFl
	s9jjVnrmzUOwf/krJUiDOGR6VQdbkDtIoEsdHsq1bUfYk4CiE6ZVb8RFTvos5QxM
	UpzQ0yBHOKY4xpRxVs4N9C+hfcxgVucgAA+0sqZNg8+nfVwjkBcImmA7k7dKXxcW
	ucnUn2ph2RKqHVvFL9iyXbQGBMOAV0y7zDYMvxai/r6f1jzSvJf+WBZL97XLA7LF
	aILmlHKesQniNIH/GuM9hXsCIujbSgVxSuO7pMZZF+J3ccTNUcATBMYcRiQ81ziL
	Y0Nl7WRMl8IhmvFCVBgwN9vrEjOoODvqt3/q4BDV5zwbCa4tVjIydfxgpGyMBoQE
	NMPw9w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42xkqeq7s2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 14:39:52 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 65AF140060;
	Mon, 18 Nov 2024 14:38:33 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 30BAD27564C;
	Mon, 18 Nov 2024 14:35:31 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 18 Nov
 2024 14:35:30 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 18 Nov 2024 14:35:31 +0100
Subject: [PATCH v3 08/15] media: stm32: dcmipp: add bayer 10~14 bits
 formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241118-csi_dcmipp_mp25-v3-8-c1914afb0a0f@foss.st.com>
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
X-CRM114-CacheID: sfid-20241118_054004_139021_1F5472F5 
X-CRM114-Status: UNSURE (   9.07  )
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

Add support for bayer formats from 10 to 14 bits.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c    | 12 ++++++++++++
 .../media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c   | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index 48596592bfd517b9d46946d27f154f0d17ebed78..d6fad99e44bba5bcab1df056ba9208e82aff4bea 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -65,6 +65,18 @@ static const struct dcmipp_bytecap_pix_map dcmipp_bytecap_pix_map_list[] = {
 	PIXMAP_MBUS_PFMT(SGBRG8_1X8, SGBRG8),
 	PIXMAP_MBUS_PFMT(SGRBG8_1X8, SGRBG8),
 	PIXMAP_MBUS_PFMT(SRGGB8_1X8, SRGGB8),
+	PIXMAP_MBUS_PFMT(SBGGR10_1X10, SBGGR10),
+	PIXMAP_MBUS_PFMT(SGBRG10_1X10, SGBRG10),
+	PIXMAP_MBUS_PFMT(SGRBG10_1X10, SGRBG10),
+	PIXMAP_MBUS_PFMT(SRGGB10_1X10, SRGGB10),
+	PIXMAP_MBUS_PFMT(SBGGR12_1X12, SBGGR12),
+	PIXMAP_MBUS_PFMT(SGBRG12_1X12, SGBRG12),
+	PIXMAP_MBUS_PFMT(SGRBG12_1X12, SGRBG12),
+	PIXMAP_MBUS_PFMT(SRGGB12_1X12, SRGGB12),
+	PIXMAP_MBUS_PFMT(SBGGR14_1X14, SBGGR14),
+	PIXMAP_MBUS_PFMT(SGBRG14_1X14, SGBRG14),
+	PIXMAP_MBUS_PFMT(SGRBG14_1X14, SGRBG14),
+	PIXMAP_MBUS_PFMT(SRGGB14_1X14, SRGGB14),
 	PIXMAP_MBUS_PFMT(JPEG_1X8, JPEG),
 };
 
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
index a19c8235af565fb5f673ba90b37ebfcadf03d72e..72f1bb4c64ad4c194c14467dfc354a04bc69e208 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
@@ -57,6 +57,18 @@ static const struct dcmipp_byteproc_pix_map dcmipp_byteproc_pix_map_list[] = {
 	PIXMAP_MBUS_BPP(SGBRG8_1X8, 1),
 	PIXMAP_MBUS_BPP(SGRBG8_1X8, 1),
 	PIXMAP_MBUS_BPP(SRGGB8_1X8, 1),
+	PIXMAP_MBUS_BPP(SBGGR10_1X10, 2),
+	PIXMAP_MBUS_BPP(SGBRG10_1X10, 2),
+	PIXMAP_MBUS_BPP(SGRBG10_1X10, 2),
+	PIXMAP_MBUS_BPP(SRGGB10_1X10, 2),
+	PIXMAP_MBUS_BPP(SBGGR12_1X12, 2),
+	PIXMAP_MBUS_BPP(SGBRG12_1X12, 2),
+	PIXMAP_MBUS_BPP(SGRBG12_1X12, 2),
+	PIXMAP_MBUS_BPP(SRGGB12_1X12, 2),
+	PIXMAP_MBUS_BPP(SBGGR14_1X14, 2),
+	PIXMAP_MBUS_BPP(SGBRG14_1X14, 2),
+	PIXMAP_MBUS_BPP(SGRBG14_1X14, 2),
+	PIXMAP_MBUS_BPP(SRGGB14_1X14, 2),
 	PIXMAP_MBUS_BPP(JPEG_1X8, 1),
 };
 

-- 
2.25.1


