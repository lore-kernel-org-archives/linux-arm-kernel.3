Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B861C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 22:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JY9QzbwM3Gyo5DqvP54LKzf1b8veHh/AxJCKUeZgqtw=; b=smSh43iBQ493OUY92linYiEeSJ
	sVsV7XUeGJE58294tCISLAKdNNbGWj854bPqTMunqlXcb0cu/CctoJZWKOI/kvmY9cCBpQuW0Uw0m
	edcAek8vg1PvkvEztquo0b0Nz4+2LDR3PL+DZkiTdYI4s21oZYjph5XsqC+ND8DY3vUhzdM8qmKlX
	HL48Uv3w2HvdoV7knl3i6tI04rrBoC/acNOGDHHV4iw1AueJRAJSmc+OTM/MjyVVwQKpMTKXtwilk
	kJzqVr0/knkXwKI883hxp6kP/ET9/M3ZaZqPG5eoxxxyLqUqi1fcdfJRRwjc9txmRP14fdskRGnfk
	M351RuOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXS4a-0000000Cg7K-1rEq;
	Thu, 03 Jul 2025 22:06:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXNbo-0000000C7Ac-3Lst
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 17:20:30 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563B8QMM000320;
	Thu, 3 Jul 2025 17:20:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JY9QzbwM3Gyo5DqvP54LKzf1b8veHh/AxJCKUeZgqtw=; b=AZeUEQBRRt5RXkI2
	VqPkWGR7LrHhttE9OYecWq9pSDm4/NXRc2gfbAgkbMds3xyF7A5wuTtpo1dpd4b5
	s1CGBQU52GfeJUT2Cv9LpSBimKCRRnVoZFGvLr2TjKou/lcpM4ucB2KRFhpUrpnp
	vqF7RMI8PFdpz5+DvqAVbunGO7Ub44pALfapmRVtPg39MAFJtrJRkHeWjt7txeHM
	L5yDcKB83OFI4G7n7oq7Ya2mPHjWvIQ8LkfpxLbSw6MgDaIBfBVwtir5iPiASDHg
	Wts0p4kSe+nVJ0g+K5ryPXuhyzdGmiwP7+hpfBEFdkqUmuHYh/7xfpBQ6/UFK1K4
	62Vejw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qmh4br-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 17:20:15 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 563HKEwc026891
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Jul 2025 17:20:14 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 3 Jul 2025 10:20:08 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <quic_svankada@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/9] media: qcom: camss: Rename camss-vfe-780.c to camss-vfe-gen3.c
Date: Thu, 3 Jul 2025 22:49:31 +0530
Message-ID: <20250703171938.3606998-3-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250703171938.3606998-1-quic_vikramsa@quicinc.com>
References: <20250703171938.3606998-1-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=6866bbcf cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=m-t3JITvBdmPMbOQ9dkA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: vJBVuyKzLF4eZG7Mf7PqV5beP3pu6gHm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE0MyBTYWx0ZWRfX4X+t7ux6mWEZ
 PElu738MXxJ9Vq+tHkBXnjaZ6+sxoZwQ0qh5Co4XUc2WS40d4VQ7J8jRL8H/z6S77A/D6Twfedj
 c2pxH+WQ//FNXQ8mRQ39EMUby1GcovaEAmcR/rvwF8gN1JYe8dbvTpAf7neskbn4F/WYT9PcbSm
 VAWaHE+LDymZYU5tieWyQkc3zKcGYU4LtMzoo4Ev4qw1cjySll9jUN96IjO/goJzxkJV35VUF2I
 lowAa9yL1A3okd2Ntza2OJXo4FDXN8MASw1plQgE810Uj3gWwhefYPtruD18os6BeZLcsQCZnLv
 llEYjib7W+ZUTJVfCjmV8YXQqJmCoaH6l3zlKoCMs2SXrjjKlJ/zLcgr+NTREnnVXv+HWSADREJ
 MdglGQb5mqzw27cbog40vmEjby2o77B91RcPgLlRr16l571FVeq54rHxdM6Yxep5gszOy6e1
X-Proofpoint-GUID: vJBVuyKzLF4eZG7Mf7PqV5beP3pu6gHm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1011 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_102028_958985_BCA36641 
X-CRM114-Status: GOOD (  16.49  )
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

Rename the file camss-vfe-780.c to camss-vfe-gen3.c to enable
reuse of VFE logic across multiple SoCs.

The SA8775P SoC includes VFE 690, which is very similar to
VFE 780, with only minor differences in register bitfields.
Rename prepares the codebase for supporting additional SoCs
without duplicating VFE logic.

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 drivers/media/platform/qcom/camss/Makefile             |  2 +-
 .../qcom/camss/{camss-vfe-780.c => camss-vfe-gen3.c}   |  8 ++++----
 drivers/media/platform/qcom/camss/camss-vfe.h          |  2 +-
 drivers/media/platform/qcom/camss/camss.c              | 10 +++++-----
 4 files changed, 11 insertions(+), 11 deletions(-)
 rename drivers/media/platform/qcom/camss/{camss-vfe-780.c => camss-vfe-gen3.c} (96%)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index ee869e69521a..76845a456c45 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -19,7 +19,7 @@ qcom-camss-objs += \
 		camss-vfe-17x.o \
 		camss-vfe-480.o \
 		camss-vfe-680.o \
-		camss-vfe-780.o \
+		camss-vfe-gen3.o \
 		camss-vfe-gen1.o \
 		camss-vfe.o \
 		camss-video.o \
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-780.c b/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
similarity index 96%
rename from drivers/media/platform/qcom/camss/camss-vfe-780.c
rename to drivers/media/platform/qcom/camss/camss-vfe-gen3.c
index b9812d70f91b..93d16b0951e9 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-780.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module v780 (SM8550)
+ * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module gen3
  *
  * Copyright (c) 2024 Qualcomm Technologies, Inc.
  */
@@ -113,14 +113,14 @@ static inline void vfe_reg_update_clear(struct vfe_device *vfe,
 	camss_reg_update(vfe->camss, vfe->id, port_id, true);
 }
 
-static const struct camss_video_ops vfe_video_ops_780 = {
+static const struct camss_video_ops vfe_video_ops_gen3 = {
 	.queue_buffer = vfe_queue_buffer_v2,
 	.flush_buffers = vfe_flush_buffers,
 };
 
 static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 {
-	vfe->video_ops = vfe_video_ops_780;
+	vfe->video_ops = vfe_video_ops_gen3;
 }
 
 static void vfe_global_reset(struct vfe_device *vfe)
@@ -140,7 +140,7 @@ static int vfe_halt(struct vfe_device *vfe)
 	return 0;
 }
 
-const struct vfe_hw_ops vfe_ops_780 = {
+const struct vfe_hw_ops vfe_ops_gen3 = {
 	.global_reset = vfe_global_reset,
 	.hw_version = vfe_hw_version,
 	.isr = vfe_isr,
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index a23f666be753..02d9162ffd93 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -244,7 +244,7 @@ extern const struct vfe_hw_ops vfe_ops_4_8;
 extern const struct vfe_hw_ops vfe_ops_170;
 extern const struct vfe_hw_ops vfe_ops_480;
 extern const struct vfe_hw_ops vfe_ops_680;
-extern const struct vfe_hw_ops vfe_ops_780;
+extern const struct vfe_hw_ops vfe_ops_gen3;
 
 int vfe_get(struct vfe_device *vfe);
 void vfe_put(struct vfe_device *vfe);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 1431e08dc04a..310b5cd8de5f 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2371,7 +2371,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
 			.is_lite = false,
 			.has_pd = true,
 			.pd_name = "ife0",
-			.hw_ops = &vfe_ops_780,
+			.hw_ops = &vfe_ops_gen3,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -2395,7 +2395,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
 			.is_lite = false,
 			.has_pd = true,
 			.pd_name = "ife1",
-			.hw_ops = &vfe_ops_780,
+			.hw_ops = &vfe_ops_gen3,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -2419,7 +2419,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
 			.is_lite = false,
 			.has_pd = true,
 			.pd_name = "ife2",
-			.hw_ops = &vfe_ops_780,
+			.hw_ops = &vfe_ops_gen3,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -2441,7 +2441,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
 		.vfe = {
 			.line_num = 4,
 			.is_lite = true,
-			.hw_ops = &vfe_ops_780,
+			.hw_ops = &vfe_ops_gen3,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -2463,7 +2463,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
 		.vfe = {
 			.line_num = 4,
 			.is_lite = true,
-			.hw_ops = &vfe_ops_780,
+			.hw_ops = &vfe_ops_gen3,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
-- 
2.25.1


