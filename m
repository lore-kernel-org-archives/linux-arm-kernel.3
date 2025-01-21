Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14B3C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 18:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vIvKIBkT5H5B3pj83VWUXBvXrVOzL7W789I2WkPrpQg=; b=KY1skSvUI8W850CUp+UsjEEiZ0
	TfVBK9qL7fzvz+IaUE+Uv1bvZqKIv+2lC84WrybSPoWXr9w0nZv0mwU1Jr5Q5PXGSMLpjtR4p6B4Q
	jKTnfXMg8wfFNK8SDXET0/klAc8uTmqIWmAlbSlE2GYM9ibKwMae5otl3VT3nmNiN1kTnDvH7yFXt
	iVOIxDrjRTRCU0WM6LAvgGPNqG84ZYQ6omocCWZmafll5l7FTqmXnhSrYtJi8eQVRPxzIRyMkU9BE
	kSA9asMzZ0oeiaD7GEU6pb8FAd4k2KyWUJmQY11ktBTGQTh5IMZqXj4/2/rxB3hkksgxxSy4X0kRH
	9k2nixrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taIjl-00000008ZHD-1MWS;
	Tue, 21 Jan 2025 18:12:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taIfx-00000008Ydd-31JN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 18:08:35 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50LHQeLv002281;
	Tue, 21 Jan 2025 18:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vIvKIBkT5H5B3pj83VWUXBvXrVOzL7W789I2WkPrpQg=; b=kZRj1vUWXTw9Biom
	0H7oLx70/eyktDUSKx8tprUlPwxKKfZrh4ue8nzHj3EeM66vD8uY9WZ9h/IBbcn/
	aJ/xkvPt7TZxuJ5V5T3VVL/tHENrJw8nbCJxGHYsvvw4zhlfOCZAo9p5y9jFzPtT
	P0xYsn43d6cFVFe4TFaHfE94cd/neC/gLvDV8MYGvKodenrocS7NyDA2QAl18EEf
	I0J3PGmEQHStjwT35FwXX5MIlZA7+DDmrHWc+QPxrP476bh4qDkjCd3mnY2TnBFf
	bpBorOlJ1CJ974dZ5olJpV77edWzgOEa7DmJg2H+AfaJL1ge0Dmb8QHbHyd8VT9c
	BFeMGw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ag01g3q8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 18:08:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50LI8OYJ010956
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 18:08:24 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 21 Jan 2025 10:08:15 -0800
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
Subject: [PATCH v2 2/2] media: qcom: camss: update clock names for sc7280
Date: Tue, 21 Jan 2025 23:37:46 +0530
Message-ID: <20250121180746.1989996-3-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250121180746.1989996-1-quic_vikramsa@quicinc.com>
References: <20250121180746.1989996-1-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PY2JqTgTQFAf3aWiZomDb5HpQDGiVqRC
X-Proofpoint-GUID: PY2JqTgTQFAf3aWiZomDb5HpQDGiVqRC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_07,2025-01-21_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 spamscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501210145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_100833_872030_43C6FE8E 
X-CRM114-Status: GOOD (  13.53  )
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

Update clock names to make them consistent with existing platform i.e
sc8280xp. Rename gcc_cam_hf_axi to gcc_axi_hf and add gcc_axi_sf.

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 drivers/media/platform/qcom/camss/camss.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index a85e9df0f301..b1358457c66e 100644
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


