Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667A4D609C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 10:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/5K1Oi4oid6+qbwzyVBajnXfRp72LumPzVSLiiIpdE4=; b=Bhi676SNVjnfbKDLow4S7KU6qg
	/gSlskc0vS16Zo0qzd/jY28OSFqlg/wl79N2tyFsp0wBtWcsHh+aeAomGljGqlHCspIAMzGAFqXrO
	D67dQLFZY1nSVz7KMx8y6BzPJ9c7KShNx0ZxATyuI+kJE1krZZg/G8B6fE5PSjjVT6AIH1iV7ZB1E
	FEjF3g49Znc/9iIcX4OqewYlHUK9Q+SrkGxQE3pl+Oz0zVxrGrECnRUO+r8FV7dfW0oqV4OUwdAs0
	ejITkgXe76O7PsdzsUgNt65irCt3Shd9fKd+pqmW7Wig/8NwMojg+tQYu9jfCJORDbix4vX0hlXBn
	p/k6KuQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGF25-0000000CnkM-2HbG;
	Wed, 27 Nov 2024 10:12:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGEux-0000000CmKd-3Z63
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 10:05:09 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AR95xEm022746;
	Wed, 27 Nov 2024 10:05:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/5K1Oi4oid6+qbwzyVBajnXfRp72LumPzVSLiiIpdE4=; b=Mkz7KWRxnYr5xNRn
	ZPncOuJtc9g2BlxjMzqzHfQ6LkYknBCaEthU5lxRgNb5kKtdbs1CgH9R5yt9FRyp
	eQg3GJlgktr+UubRUshY6nPJqnTmzwpb2oPGXUDsvYtq4TxhdT32V21+2qsXBICY
	EdxfBCu36DVvHxi28LwFvPLd3DQJkBPFIhLH+7P3mYLmbtsVbbIKx8Qkx0C6Jdbt
	2je9Ryc3PHZ0XhUo6KiYLKOSwoyoOPzTJDOnLOhKGXYQr0lHey+rEvbwPbquqL4T
	FFY7YaWi65nx2kMCpg/zSLlo4uwcPk3s2qEq8J96B/jIVkNjmQKMBLGGNLJiNKLk
	blVYUA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 434mx77fa9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 10:05:00 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ARA4xCU023571
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 10:04:59 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 27 Nov 2024 02:04:50 -0800
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
Subject: [PATCH v6 2/5] media: qcom: camss: Sort camss version enums and compatible strings
Date: Wed, 27 Nov 2024 15:34:18 +0530
Message-ID: <20241127100421.3447601-3-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241127100421.3447601-1-quic_vikramsa@quicinc.com>
References: <20241127100421.3447601-1-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UWUlwXHWWOk0u96b1mSo7I59bzqnkYvK
X-Proofpoint-ORIG-GUID: UWUlwXHWWOk0u96b1mSo7I59bzqnkYvK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 spamscore=0 mlxscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411270082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_020508_010783_4C218ACF 
X-CRM114-Status: GOOD (  16.10  )
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

Sort CAMSS version enums and compatible strings alphanumerically.

Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../media/platform/qcom/camss/camss-csiphy-3ph-1-0.c   | 10 +++++-----
 drivers/media/platform/qcom/camss/camss-vfe.c          |  6 +++---
 drivers/media/platform/qcom/camss/camss.c              |  2 +-
 drivers/media/platform/qcom/camss/camss.h              |  4 ++--
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index df7e93a5a4f6..7d2490c9de01 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -505,10 +505,6 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
 	u32 val;
 
 	switch (csiphy->camss->res->version) {
-	case CAMSS_845:
-		r = &lane_regs_sdm845[0][0];
-		array_size = ARRAY_SIZE(lane_regs_sdm845[0]);
-		break;
 	case CAMSS_8250:
 		r = &lane_regs_sm8250[0][0];
 		array_size = ARRAY_SIZE(lane_regs_sm8250[0]);
@@ -517,6 +513,10 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
 		r = &lane_regs_sc8280xp[0][0];
 		array_size = ARRAY_SIZE(lane_regs_sc8280xp[0]);
 		break;
+	case CAMSS_845:
+		r = &lane_regs_sdm845[0][0];
+		array_size = ARRAY_SIZE(lane_regs_sdm845[0]);
+		break;
 	default:
 		WARN(1, "unknown cspi version\n");
 		return;
@@ -557,9 +557,9 @@ static bool csiphy_is_gen2(u32 version)
 	bool ret = false;
 
 	switch (version) {
-	case CAMSS_845:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
+	case CAMSS_845:
 		ret = true;
 		break;
 	}
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 80a62ba11295..fb3234c65403 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -334,11 +334,11 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 			return sink_code;
 		}
 		break;
-	case CAMSS_8x96:
 	case CAMSS_660:
-	case CAMSS_845:
+	case CAMSS_8x96:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
+	case CAMSS_845:
 		switch (sink_code) {
 		case MEDIA_BUS_FMT_YUYV8_1X16:
 		{
@@ -1693,9 +1693,9 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 	int ret = 8;
 
 	switch (vfe->camss->res->version) {
-	case CAMSS_845:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
+	case CAMSS_845:
 		ret = 16;
 		break;
 	default:
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 6824ffbdf4a8..53aa7c963909 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2638,10 +2638,10 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
 	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
+	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
 	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
 	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
-	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
 	{ }
 };
 
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 9da7f48f5dd7..ffce0a0edbc5 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -77,13 +77,13 @@ enum pm_domain {
 };
 
 enum camss_version {
+	CAMSS_660,
 	CAMSS_8x16,
 	CAMSS_8x53,
 	CAMSS_8x96,
-	CAMSS_660,
-	CAMSS_845,
 	CAMSS_8250,
 	CAMSS_8280XP,
+	CAMSS_845,
 };
 
 enum icc_count {
-- 
2.25.1


