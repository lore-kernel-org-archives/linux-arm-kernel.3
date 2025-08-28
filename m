Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD87BC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 11:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KQonpQfjTg6uM1eNKdmdkwH9DntxeJhvTVyaaJJp7DI=; b=yKnjP8vTYrPNZlZ4rp7q/c+E5s
	TFnSrT7y5AZmlMl+YuuCjBiRSWU2RNtWcKMjqDPW7nXsgqzkegbclbpJQ9Rpo/3QO/7k1I3mHf7Jv
	ljhskT5wjanobuVXYoa45xs+ZvnVXfRSX5mxBd5PghA2eV5AgpJj3xvcFlaU51FEQa4d8zqcGmHiV
	GIX7QYLhgATC4No4dX5mEaZdAd6+ro74eDy35jhPx18YL+9xG+mojDRf6jO5qpM8NLaFTLXtplKng
	YahjctoNpO7D+fZT15QLnAL4gqMZz/oIrhwOqRcFdTCzC38O/q8QoZ/V7PgAvcrPRSgie7WO3Axwc
	MfVX3pRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uraob-00000001Lyu-44A9;
	Thu, 28 Aug 2025 11:29:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZwx-00000001Anm-0DFX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 10:33:48 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SA6jQM004791;
	Thu, 28 Aug 2025 10:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KQonpQfjTg6uM1eNKdmdkwH9DntxeJhvTVyaaJJp7DI=; b=V/9EGZfVCkd9ZH++
	hDrpkJnSOX+4HDNKwKc3OoaeukbqUPKZMQP6Avxm7YOdoKvLJEpq7nZ5b8lm5ghS
	+4ONPJq8IEdi86NFh10ZG2j7KQuqrKfP4zxG2EyUCV42+jIc21q3+tk3qYQeb1vq
	E6V2dgAcU1lrKII+4LgWiRolx5THcLB0qHTEDeWOUesmQwHljAU5rFaHOpqaLIrE
	7BaYHvA1FB+G6tXGIYQb7PrXuFYFDPHCkRA5ythbPGwKZ+Np9Jr3mA2aECJ0kRF7
	9Lcut6+hsvjWrXaH7Auoqsjubt9R6+prJ10o+H/s3rfRVCGDCdUwlwpn1WKsVE57
	1L6eag==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615qteb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 10:33:39 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57SAXc3a017269
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 10:33:38 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Thu, 28 Aug 2025 03:33:32 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Thu, 28 Aug 2025 18:32:14 +0800
Subject: [PATCH v4 01/10] clk: qcom: gcc-ipq5424: Correct the
 icc_first_node_id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250828-qcom_ipq5424_nsscc-v4-1-cb913b205bcb@quicinc.com>
References: <20250828-qcom_ipq5424_nsscc-v4-0-cb913b205bcb@quicinc.com>
In-Reply-To: <20250828-qcom_ipq5424_nsscc-v4-0-cb913b205bcb@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Varadarajan
 Narayanan" <quic_varada@quicinc.com>,
        Georgi Djakov <djakov@kernel.org>, "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Anusha Rao <quic_anusha@quicinc.com>,
        "Manikanta Mylavarapu" <quic_mmanikan@quicinc.com>,
        Devi Priya
	<quic_devipriy@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Richard
 Cochran" <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>,
        <quic_leiwei@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_suruchia@quicinc.com>, Luo Jie
	<quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756377204; l=1222;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=zw34bEJ/TzKi0pxmrPueLS7J170qhieZcjCAbPH0znU=;
 b=Hibm27U6Pef3q50VH+b1Fivgpq9g9ClUYddYrnoMwa++PWuar/bMmcoDA13UCclAtgs+XR4FX
 yIrUTHSIdAkBVVz+bMkkbpZDdA+n94YaovmFMKWmK4fKa49DeEuj1XL
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfXwz28aGh7pEBZ
 2ZjQPBe3u66YQ5+puSeIXwQJwrYG5idr2mrUTfJJB9xsyX5hs2epwNYcuctaiFVln/L1ukXnH13
 VmreGA8ev+FL2mdEVh/16Xk3tVFF4tQrzV/ytL528NKjCXEl9IQYqfQ7DlJG4rXMWfVNyPtM70N
 psWgPdNf8EctX6fr9PsUSsqOVFTDWsYdyBBz9VxnA2JaWEIg2zV+kdACFdp+UEKrgL7Co5fT3dG
 +fJ4AseqZDvoTB8cyjxdusuguSf3XShWQlnFAZyhxJRAvuq5MuydlA32DRJCpx7LjmpP1vlIC/6
 aYCGf3Cu1BTqdnZCoq5gGNV8Z6ZbatmDJQmQ1+lA3b2hix/orjFtMINbIijOe8NiUw1YHE+lN3u
 iMuPmAI2
X-Proofpoint-GUID: 9K3Cl2RwO6s9wLzghCZ-NPm-4RQaunEC
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68b03083 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=yUHhXAd9wW1YfvQ6HRQA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 9K3Cl2RwO6s9wLzghCZ-NPm-4RQaunEC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_033347_218062_99D5D46E 
X-CRM114-Status: GOOD (  13.72  )
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

Update to use the expected icc_first_node_id for registering the icc
clocks, ensuring correct association of clocks with interconnect nodes.

Fixes: 170f3d2c065e ("clk: qcom: ipq5424: Use icc-clk for enabling NoC related clocks")
Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 drivers/clk/qcom/gcc-ipq5424.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-ipq5424.c b/drivers/clk/qcom/gcc-ipq5424.c
index 3d42f3d85c7a..71afa1b86b72 100644
--- a/drivers/clk/qcom/gcc-ipq5424.c
+++ b/drivers/clk/qcom/gcc-ipq5424.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) 2018,2020 The Linux Foundation. All rights reserved.
- * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/clk-provider.h>
@@ -3284,6 +3284,7 @@ static const struct qcom_cc_desc gcc_ipq5424_desc = {
 	.num_clk_hws = ARRAY_SIZE(gcc_ipq5424_hws),
 	.icc_hws = icc_ipq5424_hws,
 	.num_icc_hws = ARRAY_SIZE(icc_ipq5424_hws),
+	.icc_first_node_id = IPQ_APPS_ID,
 };
 
 static int gcc_ipq5424_probe(struct platform_device *pdev)

-- 
2.34.1


