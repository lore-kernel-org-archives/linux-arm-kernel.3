Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8528C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 08:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ExmNu9H1z+r+hx9rysb9NAJ4CtrthHNR0LVzxTK9j7Y=; b=u3oyPGarcmBN7eTwRty0DYRZdK
	xeJfrC6kUgT0stt5RYNRgvKBVzWMLbOr8P5MhkOmt6/hytr3dWez2MeUTnw1xjbtaD72JzjIGp6Ia
	kARkZFjG/KRx99GfP1PWJRtQxS8M3Y6brY/6nWSDvxk+8b47pLGPCmmvH5RrEEy3ITV9lpLXsD6n6
	rsI/hDjumTM+vyTUkEWdVu+9HW7nEozv7OQO80ej/2VOkXX4EH+/3TY6eaX2ZUDsVk1wYIbAYVHTF
	2OxDQB9JydqPtyaD+rHBDIAB7zuc4SGM+bVS0YpExjVkr3/ADKDAyLOCAhfOUHBRpV/6cyRowhNO3
	D9ZYnxHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8xPY-00000003BUi-2Zen;
	Sun, 27 Apr 2025 08:30:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8w21-000000033yK-2xYu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 07:02:30 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53QGMGVQ029586;
	Sun, 27 Apr 2025 07:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ExmNu9H1z+r+hx9rysb9NAJ4CtrthHNR0LVzxTK9j7Y=; b=VQVgPqjv6eYDtz0e
	VLjLXcNT47hGPSKGrQq/NvyoLgMzZ71MzPqakfvNvkqaNx/EC+R7rX72Ms3wln6t
	W34I1wkLlTjashjqKA3AExbJ8szeTXvvqHnBCGELfhxbPG1mNq+C9Fgo2hysm71Y
	TC5aigybMAwKTbdu967JFt0NWGxo+impUijP1ctR6v7wJ3KAPelBjDp3T0VG27a8
	M3Z9BBhOJDF2/FKeVxEEFMka936abTzlqItYjqO5QVT5W/JnCboiISIl4IY9ZbNo
	lr67G988Sp5inEQhOq2iKwhmTmHaYKGjCXEBK1bGshmiUI5NECjr/Q0XM/i5wB2i
	Qbco0g==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pevba45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Apr 2025 07:02:20 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53R72J7v008304
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Apr 2025 07:02:19 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 27 Apr 2025 00:02:14 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH RFC/WIP v2 2/9] media: qcom: camss: add generic vfe handling in vfe gen3
Date: Sun, 27 Apr 2025 12:31:28 +0530
Message-ID: <20250427070135.884623-3-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250427070135.884623-1-quic_vikramsa@quicinc.com>
References: <20250427070135.884623-1-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: eOkwxa3xyihRntGPkb2fVwtdwK825rBM
X-Authority-Analysis: v=2.4 cv=aeBhnQot c=1 sm=1 tr=0 ts=680dd67c cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=QJlLqlAAiDquw72lqzYA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: eOkwxa3xyihRntGPkb2fVwtdwK825rBM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI3MDA1NSBTYWx0ZWRfX8U07UsrEw95f XOlD6Ao7UtgJi+dXUslYgU2lK5sIre0kYgAmS+BnmqBjR7RqgpM7ccdB05RwVYWp9Io00WfW9od Cvntn5d1+z2ZXUjneOUzUXph5E+aa+1Cz7RGfyku9jI2GI4FBso4el4YnwRY6OGHbIxpeRrg4fP
 qu6ELIeLAcCaT4aLZkNk8nq9/8ubQZLhM4EL/QDS+Saob7cCKlO+THFbMDiE6Rx6CI1YCwEdNm7 v5JfIWgflTPaYWem/B04Tnrl306f+r28yZslNUqfeSiEVjS2nPKRCmbO8kMcaQcuakv1gsiV76k wv+9iQ3WX09wL8GTsdgbwuYYFfwzrylWXsf+V9ji8dPRXbP5C4iPf37VitwTcNcZrour80+8LfP
 kESsBf2xz14IZ0noP3O4uskTlkQ0DHvAhvxL0z/FMrH5oOC6wlAt5mlvtyKyOiXM/OoyZFHD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-27_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504270055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_000229_749024_C3879877 
X-CRM114-Status: GOOD (  14.69  )
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

Rename camss-vfe-780.c to camss-vfe-gen3.c to avoid code duplication
for later SOCs i.e SA8775P. SA877P have vfe 690 which is almost same
as vfe 780 with very minor changes in register bitfield.

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 drivers/media/platform/qcom/camss/Makefile             |  2 +-
 .../qcom/camss/{camss-vfe-780.c => camss-vfe-gen3.c}   |  9 +++++----
 drivers/media/platform/qcom/camss/camss-vfe.h          |  2 +-
 drivers/media/platform/qcom/camss/camss.c              | 10 +++++-----
 4 files changed, 12 insertions(+), 11 deletions(-)
 rename drivers/media/platform/qcom/camss/{camss-vfe-780.c => camss-vfe-gen3.c} (95%)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index ee869e69521a..9fc4591c0edb 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -19,7 +19,7 @@ qcom-camss-objs += \
 		camss-vfe-17x.o \
 		camss-vfe-480.o \
 		camss-vfe-680.o \
-		camss-vfe-780.o \
+		camss-vfe-gen2.o \
 		camss-vfe-gen1.o \
 		camss-vfe.o \
 		camss-video.o \
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-780.c b/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
similarity index 95%
rename from drivers/media/platform/qcom/camss/camss-vfe-780.c
rename to drivers/media/platform/qcom/camss/camss-vfe-gen3.c
index b9812d70f91b..ed1681148143 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-780.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module v780 (SM8550)
+ * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module gen3
+ * Gen3 Supports Qualcomm vfe version 780 and 690
  *
  * Copyright (c) 2024 Qualcomm Technologies, Inc.
  */
@@ -113,14 +114,14 @@ static inline void vfe_reg_update_clear(struct vfe_device *vfe,
 	camss_reg_update(vfe->camss, vfe->id, port_id, true);
 }
 
-static const struct camss_video_ops vfe_video_ops_780 = {
+static const struct camss_video_ops vfe_video_ops_gen2 = {
 	.queue_buffer = vfe_queue_buffer_v2,
 	.flush_buffers = vfe_flush_buffers,
 };
 
 static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 {
-	vfe->video_ops = vfe_video_ops_780;
+	vfe->video_ops = vfe_video_ops_gen2;
 }
 
 static void vfe_global_reset(struct vfe_device *vfe)
@@ -140,7 +141,7 @@ static int vfe_halt(struct vfe_device *vfe)
 	return 0;
 }
 
-const struct vfe_hw_ops vfe_ops_780 = {
+const struct vfe_hw_ops vfe_ops_gen2 = {
 	.global_reset = vfe_global_reset,
 	.hw_version = vfe_hw_version,
 	.isr = vfe_isr,
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index a23f666be753..bded88aa85c0 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -244,7 +244,7 @@ extern const struct vfe_hw_ops vfe_ops_4_8;
 extern const struct vfe_hw_ops vfe_ops_170;
 extern const struct vfe_hw_ops vfe_ops_480;
 extern const struct vfe_hw_ops vfe_ops_680;
-extern const struct vfe_hw_ops vfe_ops_780;
+extern const struct vfe_hw_ops vfe_ops_gen2;
 
 int vfe_get(struct vfe_device *vfe);
 void vfe_put(struct vfe_device *vfe);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 1431e08dc04a..467f7ff4b042 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2371,7 +2371,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
 			.is_lite = false,
 			.has_pd = true,
 			.pd_name = "ife0",
-			.hw_ops = &vfe_ops_780,
+			.hw_ops = &vfe_ops_gen2,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -2395,7 +2395,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
 			.is_lite = false,
 			.has_pd = true,
 			.pd_name = "ife1",
-			.hw_ops = &vfe_ops_780,
+			.hw_ops = &vfe_ops_gen2,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -2419,7 +2419,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
 			.is_lite = false,
 			.has_pd = true,
 			.pd_name = "ife2",
-			.hw_ops = &vfe_ops_780,
+			.hw_ops = &vfe_ops_gen2,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -2441,7 +2441,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
 		.vfe = {
 			.line_num = 4,
 			.is_lite = true,
-			.hw_ops = &vfe_ops_780,
+			.hw_ops = &vfe_ops_gen2,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -2463,7 +2463,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
 		.vfe = {
 			.line_num = 4,
 			.is_lite = true,
-			.hw_ops = &vfe_ops_780,
+			.hw_ops = &vfe_ops_gen2,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
-- 
2.25.1


