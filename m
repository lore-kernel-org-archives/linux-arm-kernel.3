Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20877C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 12:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xak7x/UUYc67ZaQ3u0Ym00MBt+lJzOGsRvBX6FlL2fc=; b=jCgbadHufn7twa6UDyA/DqZnc4
	PcXh/3/0a5cc8yXV1OT3Y+ihpzwhAi6a7RFxuKzNOuujRJaT77h1rxwdav9HChk3gzovMLV1ljBJl
	c3ZfthBK0hQEe7aj55bo5Xap26Pcg1cVItyF1Ht1HSI5+8Jy7GZS+SNpWYkff3TrR78vw1seKjykN
	Psq70ZZ/w2YhifZQCjoQUavpU0aaznkuVuvFvjH6ZyXASy0XPBd3MsoRx78AIK049JR/FdiWyD8iV
	G0i3511GL8ohif6ISJnR128oXDRPDtIByyDg2LqtFZQSlRTIGVeOLjl2yW7V7bdM/j2D4yOy8ERcY
	IfWfC1Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV8Nm-0000000EfM9-0AEu;
	Fri, 27 Jun 2025 12:40:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV7ua-0000000EbM6-2gk2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 12:10:33 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R4D6JL017705;
	Fri, 27 Jun 2025 12:10:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xak7x/UUYc67ZaQ3u0Ym00MBt+lJzOGsRvBX6FlL2fc=; b=FmUG26/Z6thG4IsD
	olQ6sG5UH67cpDJjAEaYPBhCs1WfPIf7jKpMySOw8Ia++hF6msK1lkVUqBN4GVfV
	gjJROj6fhqsukxkRuCNp5Dn8ZFhPAcvtKGPXnNvMs0tb1AQwQMUHypzjS5NrKkHW
	zwq8wwxcNkCSMHcYAI6JqyeFFb5mSLlNiZtH8KdErBM7hL7Vd7XtaQpHe3mYSupE
	frn1YAzRH+Y6qvNSpskIAtaDtE5slgb0xBpD4/Bpcn+zeBH2XooBP0sfC4n56fQa
	KQw4gFIF5mLuy6+Z3MgCUuQG2b+bsueW2mAfnolLB/YiWrn6vlmOWuFjiRgJhQeK
	fN52vg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfx531e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 12:10:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55RCAOiL001710
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 12:10:24 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 27 Jun 2025 05:10:19 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Fri, 27 Jun 2025 20:09:18 +0800
Subject: [PATCH v2 2/8] clk: qcom: ipq5424: Enable NSS NoC clocks to use
 icc-clk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250627-qcom_ipq5424_nsscc-v2-2-8d392f65102a@quicinc.com>
References: <20250627-qcom_ipq5424_nsscc-v2-0-8d392f65102a@quicinc.com>
In-Reply-To: <20250627-qcom_ipq5424_nsscc-v2-0-8d392f65102a@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Anusha Rao <quic_anusha@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-pm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        Luo Jie
	<quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751026208; l=1801;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=Ub5UVQb+X+nSMLPBAXiQVVQL13pmLpfYGlHDOtuBCq8=;
 b=32BkPvHEMk8v8cOUbucgvazg9d5H+Clf0sbLTMEgc9w/GFe8mE+rah8pGY7u3Ng3/L3Rn78GP
 5Po+ccSNa/nAl5sKhX2DhKq9XWSbtApRYrd8YSHZDoSYynKSwWQUxfG
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cPeq4VWowgcoXM3Rs9ZY1xPLlIDozvqx
X-Proofpoint-ORIG-GUID: cPeq4VWowgcoXM3Rs9ZY1xPLlIDozvqx
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685e8a31 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=Y335ZxkaApgOvvUokr4A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwMSBTYWx0ZWRfXxzAuCoIN++0E
 ro4IXnOT8xz8cQqB3fL6URRye9IddxRLxi4zD2vRXEL6K0dYHFIH98+DJxmSU4T3cM6ODSEdlS+
 DyAuRlax+ehPZ2ENQlVn9mloMenKe4qCtr3jiqSFR7IgAH/x+c6m6BtnPfML6P1290Cegfumci/
 0gW/S3ApMVDFVXrZHrI57UZvwsfjrxfdkmuTj9MpndtRz5Z1qu4ONfyoj3MuGiebAH7AUwPEHo/
 uToUgRvOev3n21YL4y7X6aI6ElPtoDbmfL/b4U0HrYu2dtsMCJUHhBsbgB4rURnRvdVDW1YzJzb
 jsvxZdguH4ymNpR6qVgCCtHtMCuhT1pB8i5N3eli43CGw198H01r19He8hY06c4+GSD0pcIEg1w
 wRyQFUd5avpxd8EKhko8gZ45sg30K2Q5NQDogUUr2iw33/NMoj01sh1tWHS4WRpEBH/XfwCw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=965 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_051032_805119_4C763803 
X-CRM114-Status: GOOD (  15.29  )
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

Add NSS NoC clocks using the icc-clk framework to create interconnect
paths. The network subsystem (NSS) can be connected to these NoCs.

Also update to use the expected icc_first_node_id for registering the
icc clocks.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 drivers/clk/qcom/gcc-ipq5424.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-ipq5424.c b/drivers/clk/qcom/gcc-ipq5424.c
index 3d42f3d85c7a..3a01cb277cac 100644
--- a/drivers/clk/qcom/gcc-ipq5424.c
+++ b/drivers/clk/qcom/gcc-ipq5424.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) 2018,2020 The Linux Foundation. All rights reserved.
- * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/clk-provider.h>
@@ -3250,6 +3250,9 @@ static const struct qcom_icc_hws_data icc_ipq5424_hws[] = {
 	{ MASTER_ANOC_PCIE3, SLAVE_ANOC_PCIE3, GCC_ANOC_PCIE3_2LANE_M_CLK },
 	{ MASTER_CNOC_PCIE3, SLAVE_CNOC_PCIE3, GCC_CNOC_PCIE3_2LANE_S_CLK },
 	{ MASTER_CNOC_USB, SLAVE_CNOC_USB, GCC_CNOC_USB_CLK },
+	{ MASTER_NSSNOC_NSSCC, SLAVE_NSSNOC_NSSCC, GCC_NSSNOC_NSSCC_CLK },
+	{ MASTER_NSSNOC_SNOC_0, SLAVE_NSSNOC_SNOC_0, GCC_NSSNOC_SNOC_CLK },
+	{ MASTER_NSSNOC_SNOC_1, SLAVE_NSSNOC_SNOC_1, GCC_NSSNOC_SNOC_1_CLK },
 };
 
 static const struct of_device_id gcc_ipq5424_match_table[] = {
@@ -3284,6 +3287,7 @@ static const struct qcom_cc_desc gcc_ipq5424_desc = {
 	.num_clk_hws = ARRAY_SIZE(gcc_ipq5424_hws),
 	.icc_hws = icc_ipq5424_hws,
 	.num_icc_hws = ARRAY_SIZE(icc_ipq5424_hws),
+	.icc_first_node_id = IPQ_APPS_ID,
 };
 
 static int gcc_ipq5424_probe(struct platform_device *pdev)

-- 
2.34.1


