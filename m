Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE99C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 13:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BTefLwab6y4wKK3qCZuwcJtFI1zo2uWgrNN0F8ExCsQ=; b=qG9Hf57NjLRZALGdgMEkc7Eg2Y
	5qcOIMJaWejUd4GSU/7aVWOWrq8BlzHScmfjxSs9DkRJBXqkFa9wVqrm819CjiB0cPudxAiIcND9f
	N+nz95ms2kraG2bHcLaQwVhLE4owpApu3A6/r6Ci6Rmu5k3ssCZx0a7C4SxW5r3bKyHJsYMoc96q5
	KhTZIDp6UpzivuLtPu6yatq+dE4JyzCG57u9ZO1DLHVEjbClD6dTRXSOqtQYH7hl6IJlQBnnqFZRW
	lTwan3tgFds+xqtVwNp9Sfnrl/NOlJZepPX+NX6LUpO/TwRxFRt9SrJDKLIpJOmZNTciwSWagdUcZ
	Wwq+Wf2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaDhV-0000000ErfT-3Mn2;
	Fri, 11 Jul 2025 13:22:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaDYI-0000000EqcO-1TJu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 13:12:35 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BAUdOr018284;
	Fri, 11 Jul 2025 13:12:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BTefLwab6y4wKK3qCZuwcJtFI1zo2uWgrNN0F8ExCsQ=; b=naUzYY80kqdodNDH
	y1yy2KviwL1HHy65MEXieMA0FbGDRJ6TqWSTn6Y+QsipmI/uxYahmliTBZQHXcbc
	7EhsoZZ4jVFIpY+32nlyhqWy2NLY8gSN4eas2y3633UadzZAFGAyxJZr/Cv6ty7O
	sJkFVr2+lcViW2H53PfJsaDcKStg6iw72B1xnISdzdn7uok9jnHPTdFNgPxJzPEz
	uerj23/LNzERYpsWIUe6YrHuZN5i6k1AXTqLtgTOioTyQ/nb6Nl3XuywWRUtyDH4
	gY0ytOloyJwtVxufMkc4Pk2TeLfQVts2PTcBX1W8X9ByU8a2i8FUivrXqvl0d4hP
	vQQ2iw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47tkf32j63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 13:12:26 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56BDCPf4008868
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 13:12:25 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 11 Jul 2025 06:12:20 -0700
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
Subject: [PATCH v2 3/7] media: qcom: camss: Add qcs8300 compatible
Date: Fri, 11 Jul 2025 18:41:30 +0530
Message-ID: <20250711131134.215382-4-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250711131134.215382-1-quic_vikramsa@quicinc.com>
References: <20250711131134.215382-1-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA5MyBTYWx0ZWRfX2AhmSbWPz4TN
 z3ZyLpFnHmLn5o9PWvq8bxPRf2LjRp5ZDQMJrkubeR6PgWi6LJhGaae+hwv8SqGUWMtOCDJ83oU
 Y6RctfdH85F1i4GSzkcfRqqBoSnZXyQD3k7j49wKucioj8xdRnwX4WAliTH7eHj6dxzQ9jyweii
 QYW0wbEG2goqCgXy8QsgLC+jK1A45I5Ji+YTnSdYCl2YlfXYsdXiLRbJ01MkTTNwKjqmsyyQMXL
 eRaw1KqAtY6fBYC12aOW874UdE3sZ6/8+oE7W33pyDrx/m36ZTeClOjS1i81PCd1Ti+GY0X8Szg
 DgTeJgxcqBVIgkrwOQs7yeCwmmX+GeQNrL1zXjSVncQz39OXmR9aVK4g5J72Rr9UTUVm8+SNvH1
 cYyzohd1DUjmFs6fQaCYWMCq4TWj/Un62FvqC4phYL2plDKhyioHwjwQTiUdGj0z941GMHXy
X-Proofpoint-GUID: z3pSdBP2adka-nl_0HXe-kVW1G3YYUmM
X-Authority-Analysis: v=2.4 cv=Xuf6OUF9 c=1 sm=1 tr=0 ts=68710dba cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=R4QheEYGlDiWUf2spAAA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: z3pSdBP2adka-nl_0HXe-kVW1G3YYUmM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_061234_391457_06A2D75A 
X-CRM114-Status: GOOD (  14.37  )
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
---
 drivers/media/platform/qcom/camss/camss.c | 21 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 6f5b70bcf488..5211367b535d 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2898,6 +2898,19 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
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
@@ -4180,6 +4193,13 @@ static const struct camss_resources msm8996_resources = {
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
@@ -4308,6 +4328,7 @@ static const struct of_device_id camss_dt_match[] = {
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


