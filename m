Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7218CCA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 05:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MZ0oTJ7BNPy/AuEtcunjTR7FnjQNVLvYIrYGkJCiqYA=; b=QSoUoQGFPPWN+xEOBOjAViA9pU
	MMzOX/D076/CoZKMOEkzWGabg6NF43mO2R6vJit1EXf+qiJNKLi9PshoLpLNaA2QIXacBPeqNpf2J
	SuXUvk03K18IgtYHfEIxRXVX6MDZ5mNEQe8is7VNayy0xnp4UfAFGgx2bsvv+CDZjMtDp3eyMAf+9
	BDHvJnlWz4aM73IXHLQlt1WZEH0MCDmDNJIh4kRuZIgs/wCc9+yai7VX20VeLAXO/JzYXFHirwjSK
	7D5mg7mm4wZnJk9WQ4nQq4s4+XS521ue/xyycQBysKdqbIBEsDAOWq68SYN/m3I5AXN12SUcAaFzJ
	4dsedHcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um4TM-0000000CiBu-08on;
	Wed, 13 Aug 2025 05:56:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um4C9-0000000CfbD-2Q7d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 05:38:43 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D3nYrO011486;
	Wed, 13 Aug 2025 05:38:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MZ0oTJ7BNPy/AuEtcunjTR7FnjQNVLvYIrYGkJCiqYA=; b=U6LBjXYUWsgYoVtX
	RFY9zB1rbvXb4139LLD4VT+T+9obiL2e1a1u1Id1Pt6S/NRd5G+P7TSjPymZfE5k
	KkbbkZt15OJxLx6a4I5rbgnvedDVwzdDc+BzjsOtCD9NPaW3Dx71vIrDVZknYpO9
	lHhvXzb3T+Qva3U/rTOBCLSJ0KcLReKZ9np1Ti93fAHYxSVlX0/z/EujdeRz8q9b
	sA4BMDaSpdCjM/qsNdqSi9dAQHfc60nLqzjVLVU+ceCZnYXK6dDkA2PtyGcCEerg
	8jqLxyjw2/8HHc4a622x0yoel129PpjZTT2sgxczpJJcIn6mmMT4f/H6wKGnQpEU
	L9Lcag==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjpcec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 05:38:35 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57D5cYQ3025732
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 05:38:34 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 12 Aug 2025 22:38:29 -0700
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
Subject: [PATCH v3 6/7] media: qcom: camss: Enumerate resources for QCS8300
Date: Wed, 13 Aug 2025 11:07:23 +0530
Message-ID: <20250813053724.232494-7-quic_vikramsa@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX1omN0NRxmtWZ
 qb/FscVkccr4/1CG5pyFr6MtoxhShDh1WXCnUCd3qN6L5kmvwn2NOksbkW4HM7gEANK9Td6rvkt
 LrytLUvAzY60g2Y3MxGImTt9wS8vHJ6rn9EyYFKdzRySbNMbrn2D0qWNseLJYy8ldMrvUV56Hx4
 7j2sC1/nMW1dp62i3lM2g2XTnO1tSuSZs+dx0g0GwhXpwalj3SodHiOaE3d7zbISrUUAJrWTbva
 tyh8votgrcgpcqUUUG5alrunE7OSJT64L0KJdrIcMdcUaCWR/0jm9UgvHE3lhST+2HTHfCvHYiS
 UFLc06IgV5Yaq0WG/iNEBy+60THzVIAeYZrHb/MhhxwjM999SWm83APFPQN8dbyIqpgLerSOEAh
 5DJUgmMr
X-Proofpoint-GUID: xlcmQg_avi1Xruu1g_YNVZABBUK1xUjt
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689c24db cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=5xgrgTx84zIufkjN8CwA:9 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: xlcmQg_avi1Xruu1g_YNVZABBUK1xUjt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_223841_724187_817A6E10 
X-CRM114-Status: GOOD (  10.85  )
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

Enumerate csiphy, csid and vfe resources for qcs8300.

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 410e188d26aa..ad88356b329a 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4216,7 +4216,14 @@ static const struct camss_resources msm8996_resources = {
 static const struct camss_resources qcs8300_resources = {
 	.version = CAMSS_8300,
 	.pd_name = "top",
+	.csiphy_res = csiphy_res_8300,
+	.csid_res = csid_res_8775p,
+	.csid_wrapper_res = &csid_wrapper_res_sm8550,
+	.vfe_res = vfe_res_8775p,
 	.icc_res = icc_res_qcs8300,
+	.csiphy_num = ARRAY_SIZE(csiphy_res_8300),
+	.csid_num = ARRAY_SIZE(csid_res_8775p),
+	.vfe_num = ARRAY_SIZE(vfe_res_8775p),
 	.icc_path_num = ARRAY_SIZE(icc_res_qcs8300),
 	.link_entities = camss_link_entities
 };
-- 
2.25.1


