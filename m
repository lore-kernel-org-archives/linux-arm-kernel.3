Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C00C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 22:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=udwwSHFaz738/153TPLULuKklqKbe5xtG0LSOddGNx8=; b=lpaObR63KCX8/w5N8vN/Pu0wq8
	1Rryj5rrteUfTQnaczsKvLd/qGnig4kasuv5XPKPK5IlK3meh4pUuY7ySRDdv8ryFXTNAyJAuwyUa
	9tHhsrZ9cgdc6IONL8pVr0Z4CfX7rZ42MYso7f1X99P18EHmv2+CU6IOOx2h8gaU5m8ril3S9/iFs
	9nE54Q97axy9hQ4NkGeSJDE2z4da5ojES09ECn+JD0V9vJwaKXwS3QHgNmFGvJeF52FL6is/anD5R
	IKjqXfoW7tB3/bnu3+9qhJtm+T2QJcG1vpiC0SGDgFgKF9nBC1e/7MPS3SM4Xy9nkK7JrLRDtm0GI
	/I0NtQ9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXS4c-0000000Cg9c-2bsA;
	Thu, 03 Jul 2025 22:06:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXNby-0000000C7Dc-21jc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 17:20:39 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5639gXS4005469;
	Thu, 3 Jul 2025 17:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	udwwSHFaz738/153TPLULuKklqKbe5xtG0LSOddGNx8=; b=o2JK0jcqeyqNch+r
	tacMftzdlQOAdHE8cdl4jmOW/yihZHkUML4ryRfNq4suIR2xCtiNSDOvxUfwBDZ2
	/tiwXwgzLO3+leEqVLqw5k/h9B1hRp0zc8KvSZfN5FXHMUnTDaXfhm3Q5OaAdYvs
	7v60ArY7RSfhzhI+pXr7obeXy79thp7LB6les+sDtIEiCqVcM0GoVEMmd7KNPjg2
	raMuapwIjudEh5fQCQyOp8I8NuQoByT/hMVf52iHd5JhBwXCSmhQH1Luql7InCEw
	xvrUEBym+ps7yaeQOSbk5K33uuMXU1pJKQ7b2wbKJvy/+9h4zcwBOm1t086uzadk
	BZc0ag==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qmh4cw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 17:20:32 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 563HKVM0027655
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Jul 2025 17:20:31 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 3 Jul 2025 10:20:25 -0700
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
Subject: [PATCH v3 5/9] media: qcom: camss: Add sa8775p compatible
Date: Thu, 3 Jul 2025 22:49:34 +0530
Message-ID: <20250703171938.3606998-6-quic_vikramsa@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=6866bbe0 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=gE60Ov1lhapgyOv8Ur0A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: HYrl4Zhc2hgdyj0jca7uJM-0MPrVhyc9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE0MyBTYWx0ZWRfX/oQEEUKzPJXn
 73NHBV2E5ePEQ5te2vY7mxoAwIhR0Gp6BFOIALxnF/7req6voyt1GZk2fwL19EWH/cxrVwJzdmA
 PoSJxBNeF5y0dLZatfeif82hxjVDjpewdY83UG4taCJ6Z8HBZTZOKgaqCJSoA2yitug2i/WLPIL
 B3aH8ej4222K3wABFWMDEdWjpgAzsFWd7+7b+/1bRLIVNCuKT7iS/Lg0cpEgsWJXeUFWfMfMD9e
 vwW2WjZuw/zEQsIqf9qibockFC4XEVf5oHfYW+PeWUskzYDtukxw/KzulBtN6EnTHPCuoU8T7Ll
 SOI3fhOXMx5k4h/hiyylF3NkQh5guO59iWRzQWrWxRtEb9QSsG2xdUm5x+XHKYluzCAK95hedNp
 dGd2FtMoHYWRSnPj58C5zw49cLRc0QZ6Avsmj8wZ3TiCIYnVyInjlL8fpu4D65ytK7g8Qyj1
X-Proofpoint-GUID: HYrl4Zhc2hgdyj0jca7uJM-0MPrVhyc9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1011 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=997
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_102038_637376_F7FC0C20 
X-CRM114-Status: GOOD (  14.48  )
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

Add CAMSS_8775P enum, SA8775P compatible and sa8775p camss driver
private data, the private data just include some basic information
now, later changes will enumerate with csiphy, tpg, csid and vfe
resources.

Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 drivers/media/platform/qcom/camss/camss.c | 23 +++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 310b5cd8de5f..3122a29891c2 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2483,6 +2483,19 @@ static const struct resources_icc icc_res_sm8550[] = {
 	},
 };
 
+static const struct resources_icc icc_res_sa8775p[] = {
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
 static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	/* CSIPHY0 */
 	{
@@ -3753,6 +3766,15 @@ static const struct camss_resources msm8996_resources = {
 	.link_entities = camss_link_entities
 };
 
+
+static const struct camss_resources sa8775p_resources = {
+	.version = CAMSS_8775P,
+	.pd_name = "top",
+	.icc_res = icc_res_sa8775p,
+	.icc_path_num = ARRAY_SIZE(icc_res_sa8775p),
+	.link_entities = camss_link_entities
+};
+
 static const struct camss_resources sdm660_resources = {
 	.version = CAMSS_660,
 	.csiphy_res = csiphy_res_660,
@@ -3865,6 +3887,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
 	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
+	{ .compatible = "qcom,sa8775p-camss", .data = &sa8775p_resources },
 	{ .compatible = "qcom,sc7280-camss", .data = &sc7280_resources },
 	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
 	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 63c0afee154a..345479f6feba 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -86,6 +86,7 @@ enum camss_version {
 	CAMSS_8280XP,
 	CAMSS_845,
 	CAMSS_8550,
+	CAMSS_8775P,
 	CAMSS_X1E80100,
 };
 
-- 
2.25.1


