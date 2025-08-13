Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8B5C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 05:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QIB1XapK8q4S6EcNDLWXFHAFtcdqhQt5oySjOLsqvE0=; b=Jy1V0PxZid4PnVy8B/N1ZhF/WD
	GA51/KDCVVNBbL66B4WnWUQ2wt+DfF0PU8M1RmAmHSlso0KcNW6uST27qIu5Sqwf4/tFWS7gqUkOB
	wHiKhcy94qZgSHhsEGMy3/Lnpnu+ddFgGwLQRYhWtu8vZDRPA+pAy8wqVBNCjioZdoObvnBvcSCQI
	a+mM3Ca8Kxg/biTYySL4tkKwomR9vv4nRlBoEZ8TDDofcpwNRpkxfrXTWR6ZFFwuVM30oooqUmffy
	rM4GoAICjVC1FVlGo609sI/YgQtlPM2vojBmghnjCcRh4Gm+zVpHhr8qRb7EGLaCTCmdJ/mcfuSVu
	s/r91VFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um4JG-0000000CgZI-3Rjh;
	Wed, 13 Aug 2025 05:46:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um4Bq-0000000CfWt-3XXM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 05:38:24 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D3o2r8005853;
	Wed, 13 Aug 2025 05:38:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QIB1XapK8q4S6EcNDLWXFHAFtcdqhQt5oySjOLsqvE0=; b=RVh5Oj1NzvkcWuB+
	ubvtPlQouTa06YPClpgSVaEKhzvUoIk281dZErVwnkr7nzcBwXVnTnJtJcTBSrmn
	3G3/ZhYsRnodxE5ZL+q3VEkA8D8t3tGrSG6jgNxm+KwWVoVG6UYCduQJbIz6dXxU
	T6uk9M+XSKjRegYi8Gk8db9VFuNIHz5YsJ4s6rAHX4hVQox3RT3lmMc7upIjkXxh
	iBGoQfBI2NHWD6qHipHKlyt9rJD3N8B6uJGePY5g5r+/uz3sCpLo+BbU3x0Tw6pR
	TGGImCKCXtOreZv+Rb9cyecdjams5X+r2PxVGOCaaLpWhFACSUn6HjFZAIuTZ3EW
	7Cy08Q==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g5hmafrq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 05:38:14 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57D5cCRT020956
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 05:38:12 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 12 Aug 2025 22:38:07 -0700
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
Subject: [PATCH v3 2/7] media: qcom: camss: Add qcs8300 compatible
Date: Wed, 13 Aug 2025 11:07:19 +0530
Message-ID: <20250813053724.232494-3-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250813053724.232494-1-quic_vikramsa@quicinc.com>
References: <20250813053724.232494-1-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDExOSBTYWx0ZWRfX9fyUDdBNNch8
 /qnuGCtRdt8RY8f3LBUvR2QXqxuLnvHqCceymkHUX5NRprTBidl1Woz0xRXe4H7eUDnSF79CFIM
 Im/Ws/BzczUKCHZjppCJCJEhXqPN4L69d5JwPOumGEVX5RxiGWkwaRZTSQrCBvug2KfLOK6w9v9
 oU2jpYlc3MDuOTW0BiZK2ZWXuT7zIF5E2gL08zEoJKt6UObaOWPSlvTeK4nkhUPfzlDcO1uU420
 dcIZYe6lKnFh/Ldeho6pr8RJhjeXQ3ru1KVWr7afXf4bLAQekwdtom2Rb+bZTH3tNx4ArFeDb0b
 W4Lli7btrE9wWP0RlUhRbxJwvADmp8ba8txOLLEwnUUG03wnbckSfZhxBAPMx4P7AXs4CeKYtOk
 x3bLlBcF
X-Proofpoint-GUID: 2CMu3aK6BYgxf7iYSWcGKeYdtRpvv_tQ
X-Proofpoint-ORIG-GUID: 2CMu3aK6BYgxf7iYSWcGKeYdtRpvv_tQ
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=689c24c6 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=R4QheEYGlDiWUf2spAAA:9 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_223823_008074_55457956 
X-CRM114-Status: GOOD (  14.17  )
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

Add CAMSS_8300 enum, QCS8300 compatible and qcs8300 camss driver
private data, the private data just include some basic information
for now, later changes will enumerate with csiphy, tpg, csid and
vfe resources.

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 21 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 020cb2d608b6..6b9aba1029b5 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2861,6 +2861,19 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 	},
 };
 
+static const struct resources_icc icc_res_qcs8300[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 38400,
+		.icc_bw_tbl.peak = 76800,
+	},
+	{
+		.name = "hf_0",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+};
+
 static const struct resources_icc icc_res_sa8775p[] = {
 	{
 		.name = "ahb",
@@ -4143,6 +4156,13 @@ static const struct camss_resources msm8996_resources = {
 	.link_entities = camss_link_entities
 };
 
+static const struct camss_resources qcs8300_resources = {
+	.version = CAMSS_8300,
+	.pd_name = "top",
+	.icc_res = icc_res_qcs8300,
+	.icc_path_num = ARRAY_SIZE(icc_res_qcs8300),
+	.link_entities = camss_link_entities
+};
 
 static const struct camss_resources sa8775p_resources = {
 	.version = CAMSS_8775P,
@@ -4271,6 +4291,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
 	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
+	{ .compatible = "qcom,qcs8300-camss", .data = &qcs8300_resources },
 	{ .compatible = "qcom,sa8775p-camss", .data = &sa8775p_resources },
 	{ .compatible = "qcom,sc7280-camss", .data = &sc7280_resources },
 	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 345479f6feba..b5600a8b2c4b 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -84,6 +84,7 @@ enum camss_version {
 	CAMSS_8x96,
 	CAMSS_8250,
 	CAMSS_8280XP,
+	CAMSS_8300,
 	CAMSS_845,
 	CAMSS_8550,
 	CAMSS_8775P,
-- 
2.25.1


