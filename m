Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C5BC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 13:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sg9El2RNDhGBvNMVt4G/+d/AimpEjyKy8uzIw7grPLU=; b=fJqJiXePI7yg2Xv09jHSGYet1M
	+2KSsHjf55zCfdjxDLhSyhvBFIj84hMG/kTZ6MyigxjzTyUoq4VF7F7PwTkVkHNiGVfDCNqp2YB0n
	7ed6eD4Sk2b6+Q5j2NlL0yKwoV767O7PaDmp08NsiLbgI9XRHXCny/BTVOgf+ozTVsZm7Mg9jLa+H
	imptnlOoxyjQPntgrUHhFV7ERMi3urK2Bqo0QxAtSVz5RRaLYRqRZSTtPApkzOeAMdLBX/qG3pn6r
	Guyr570aq2cl+7s8yAhAZsvy2nRsnKiQ5meO09AobP/R/3g9oh+/I8oRRWkpEaYajlCHLmyRlDlSe
	FUm99NPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaDoT-0000000EskB-0CF8;
	Fri, 11 Jul 2025 13:29:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaDYZ-0000000EqfB-0cnZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 13:12:52 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BATaI5008001;
	Fri, 11 Jul 2025 13:12:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sg9El2RNDhGBvNMVt4G/+d/AimpEjyKy8uzIw7grPLU=; b=cugXmxVXzr9IEPJy
	IFjKhK3T6MM/gGkDQB+ShOVWX7Urx2b0zrIUewcpfgZcW1bbeafyXhw0G3OPN6V8
	7ghVCC+skeawTh4dFulo0AWG/aIQoAoRWZ+2fpvXRc/XPBCceyW7hzrxxz9VJPMG
	n/LY0kcBR2yCeem5kT8awGpg9DdZEw17q3ffweqgjcJupUBzovg94660aV5K4PUm
	25v13eAkOmw2lxyn/cpLDJwmThEXG2hic49hnDE83Txu5HHKsN5a1fsZqm9Jo7++
	QxBzeKZq+M9DvopV4QDb81SAv5NPLLpIsKUjxOWgbeWRJDS0X0/X7P/STzJOzyLa
	xh6sfA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smcg8n27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 13:12:43 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56BDCghx001914
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 13:12:42 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 11 Jul 2025 06:12:36 -0700
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
Subject: [PATCH v2 6/7] media: qcom: camss: Add support for CSIPHY QCS8300
Date: Fri, 11 Jul 2025 18:41:33 +0530
Message-ID: <20250711131134.215382-7-quic_vikramsa@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=P7o6hjAu c=1 sm=1 tr=0 ts=68710dcb cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=8aMUJFMWNzm9pSYggZkA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Ans5s06nRM3f5ylGIbmNoV-o5Dzae77y
X-Proofpoint-GUID: Ans5s06nRM3f5ylGIbmNoV-o5Dzae77y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA5MyBTYWx0ZWRfX2KGl249IbolR
 Tr6af7rrz2xnXhA6jfjWUEHCsU5v6gaIEVUxn/mvVCkUqtpRLd4yOoz7Eha05T7MwseEO4S7WA5
 817qyDfxaVZf8Opk2kpRARJhgBDonUYJY0nf+2g/OfL9wBx3QwfMMgkLS2Hdwu2k1vL560wJq2v
 DIIPqIePhTZ3tTOy1X31vhq5ydE6K2OI5JCPtz9G01EW1VayUVzgJCYaua/E76t4DbmYy5Qsf3X
 zcL3iajqdCSBAZ6/A2Gb4WbFoY8RkcohEomGrqQQig263VNY9j37Sa0vtjCI+cC1Xu+VgCVY1Uk
 2UutnpJS508GiFd6TEzaOJkYhEJ7g4ommBXvvKOwmcbscCQrEG1rSeam0/83Kmoq++uKkbqpV9p
 0bHYW2J6ujI0Byf15oOyPZqf3+4kl4jTrxFR+T9VpysuiiM+tHFrfoGFWQt3SyYezEoJBEgU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_061251_190166_275B84D0 
X-CRM114-Status: GOOD (  14.56  )
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

Add support for CSIPHY found on QCS8300.

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 .../qcom/camss/camss-csiphy-3ph-1-0.c         |  2 +
 drivers/media/platform/qcom/camss/camss.c     | 57 +++++++++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index e8dbf9af6ccb..667a8cf349cb 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -826,6 +826,7 @@ static bool csiphy_is_gen2(u32 version)
 	case CAMSS_7280:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
+	case CAMSS_8300:
 	case CAMSS_845:
 	case CAMSS_8550:
 	case CAMSS_8775P:
@@ -928,6 +929,7 @@ static int csiphy_init(struct csiphy_device *csiphy)
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
 		regs->offset = 0x1000;
 		break;
+	case CAMSS_8300:
 	case CAMSS_8775P:
 		regs->lane_regs = &lane_regs_sa8775p[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index abfaa489cc0c..124bb56167cd 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2491,6 +2491,63 @@ static const struct resources_icc icc_res_sm8550[] = {
 	},
 };
 
+static const struct camss_subdev_resources csiphy_res_8300[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+
+		.clock = { "csiphy_rx", "csiphy0", "csiphy0_timer"},
+		.clock_rate = {
+			{ 400000000 },
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" },
+		.csiphy = {
+			.id = 0,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845,
+		}
+	},
+	/* CSIPHY1 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+
+		.clock = { "csiphy_rx", "csiphy1", "csiphy1_timer"},
+		.clock_rate = {
+			{ 400000000 },
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" },
+		.csiphy = {
+			.id = 1,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845,
+		}
+	},
+	/* CSIPHY2 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+
+		.clock = { "csiphy_rx", "csiphy2", "csiphy2_timer"},
+		.clock_rate = {
+			{ 400000000 },
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csiphy2" },
+		.interrupt = { "csiphy2" },
+		.csiphy = {
+			.id = 2,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845,
+		}
+	},
+};
+
 static const struct camss_subdev_resources csid_res_8300[] = {
 	/* CSID0 */
 	{
-- 
2.25.1


