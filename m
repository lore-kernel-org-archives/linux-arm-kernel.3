Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44A4E77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 14:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UX+UB4pSAZuNGX3KLa2eoB0Vgo1doW5zbFcTpeB+Wnc=; b=NtpdMeOzUF1vAYmOdW2+Ijd6n4
	Thd9lxLKnw/lM0F3G3YlTz98tzPmzHkWJs0mC3gBK5mI/I9Bvfpg4PIBApEf24nISBiWMm0R1RquN
	qXYSo9j0UWp0GQ35EPQlhd9rVz3Wgoi+dZaBNRfJYWfufcGlmaDTWY5AHUPmxi9Oqi/cZSDwbMEfR
	C/fUfb0zkdyS+54Su8Cw3cu+sxJPsTt7ifo4DB6Ss/AUDxH2ud9gp+w81+HlFbx5d73n5UJ86mU1n
	S4DrbhV7txUr5ufuKhwCkN+ui8ZCDciMw8LL8Z4xwE8R18x0qMCFShGjV9fQSYhUSRu0qobGlEJ/t
	7n/dTxpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYId-0000000DhBH-2Dce;
	Tue, 17 Dec 2024 14:11:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYEh-0000000DgPC-0TWB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 14:07:44 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHAo3J0032334;
	Tue, 17 Dec 2024 14:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UX+UB4pSAZuNGX3KLa2eoB0Vgo1doW5zbFcTpeB+Wnc=; b=nEXqQ3bWKm2UR3Nf
	8V9+hzFQJCSxiZ5ejgYny5BqTdwqZYPSg5S/k3r0U7R8ci6vc5c89GuFtWLHDK84
	HBQqPavqAxY6hxbutFf2fiK+IDiqy5aHXZUIYphKbt52xAf3f88W/gXBW7KiUf8g
	sqASXwiQOIbfCwkDn7FT12azKmXnmofZ7j2VqLozCYtTkpAgtszPpcn+VBJ+yRqY
	hWJANusFankW4R9cdleAd/6x051XkBtBlgEhcIGIWXrEXKwZEQvpI5OId66aO8GP
	Txl1tgBSuVFiMEntVVe7DRB1/lf5nKQX5Ez+LTNyxn89DeY4ja5y8/wxlTfsZk9P
	hSCbGg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k7w50g1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 14:07:35 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BHE7YPP020667
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 14:07:34 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 06:07:25 -0800
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <akapatra@quicinc.com>, <hariramp@quicinc.com>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <cros-qcom-dts-watchers@chromium.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH v10 2/4] media: qcom: camss: update clock names for sc7280
Date: Tue, 17 Dec 2024 19:36:54 +0530
Message-ID: <20241217140656.965235-3-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241217140656.965235-1-quic_vikramsa@quicinc.com>
References: <20241217140656.965235-1-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2SNAksYNAhrFq04PtjHaCO_BjnnrcNst
X-Proofpoint-ORIG-GUID: 2SNAksYNAhrFq04PtjHaCO_BjnnrcNst
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_060743_265154_01E5D27E 
X-CRM114-Status: GOOD (  13.28  )
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

This patch changes gcc_cam_hf_axi clock name to make consistent
with existing platforms and add gcc_axi_sf clock too.
gcc_cam_hf_axi changed to gcc_axi_hf.
added gcc_axi_sf.

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 drivers/media/platform/qcom/camss/camss.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 004a74f6b2f6..1d992dc74877 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1443,12 +1443,13 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
 		.regulators = {},
 
 		.clock = { "camnoc_axi", "cpas_ahb", "icp_ahb", "vfe0",
-			   "vfe0_axi", "gcc_cam_hf_axi" },
+			   "vfe0_axi", "gcc_axi_hf", "gcc_axi_sf" },
 		.clock_rate = { { 150000000, 240000000, 320000000, 400000000, 480000000 },
 				{ 80000000 },
 				{ 0 },
 				{ 380000000, 510000000, 637000000, 760000000 },
 				{ 0 },
+				{ 0 },
 				{ 0 } },
 
 		.reg = { "vfe0" },
@@ -1468,12 +1469,13 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
 		.regulators = {},
 
 		.clock = { "camnoc_axi", "cpas_ahb", "icp_ahb", "vfe1",
-			   "vfe1_axi", "gcc_cam_hf_axi" },
+			   "vfe1_axi", "gcc_axi_hf", "gcc_axi_sf" },
 		.clock_rate = { { 150000000, 240000000, 320000000, 400000000, 480000000 },
 				{ 80000000 },
 				{ 0 },
 				{ 380000000, 510000000, 637000000, 760000000 },
 				{ 0 },
+				{ 0 },
 				{ 0 } },
 
 		.reg = { "vfe1" },
@@ -1493,12 +1495,13 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
 		.regulators = {},
 
 		.clock = { "camnoc_axi", "cpas_ahb", "icp_ahb", "vfe2",
-			   "vfe2_axi", "gcc_cam_hf_axi" },
+			   "vfe2_axi", "gcc_axi_hf", "gcc_axi_sf" },
 		.clock_rate = { { 150000000, 240000000, 320000000, 400000000, 480000000 },
 				{ 80000000 },
 				{ 0 },
 				{ 380000000, 510000000, 637000000, 760000000 },
 				{ 0 },
+				{ 0 },
 				{ 0 } },
 
 		.reg = { "vfe2" },
@@ -1516,11 +1519,12 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
 	/* VFE3 (lite) */
 	{
 		.clock = { "camnoc_axi", "cpas_ahb", "icp_ahb",
-			   "vfe_lite0", "gcc_cam_hf_axi" },
+			   "vfe_lite0", "gcc_axi_hf", "gcc_axi_sf" },
 		.clock_rate = { { 150000000, 240000000, 320000000, 400000000, 480000000 },
 				{ 80000000 },
 				{ 0 },
 				{ 320000000, 400000000, 480000000, 600000000 },
+				{ 0 },
 				{ 0 } },
 
 		.regulators = {},
@@ -1537,11 +1541,12 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
 	/* VFE4 (lite) */
 	{
 		.clock = { "camnoc_axi", "cpas_ahb", "icp_ahb",
-			   "vfe_lite1", "gcc_cam_hf_axi" },
+			   "vfe_lite1", "gcc_axi_hf", "gcc_axi_sf" },
 		.clock_rate = { { 150000000, 240000000, 320000000, 400000000, 480000000 },
 				{ 80000000 },
 				{ 0 },
 				{ 320000000, 400000000, 480000000, 600000000 },
+				{ 0 },
 				{ 0 } },
 
 		.regulators = {},
-- 
2.25.1


