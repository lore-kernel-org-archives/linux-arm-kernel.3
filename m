Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00343C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 12:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EK88bIxyb7opoCqG7E3Er3n2due1WnCsiMk8VTgRnkg=; b=nOQJsDhNWf4L5V/H61pWqdRNgT
	3FZy0vgR+CRetq+yGvxOXD46M46cMna3sCPHKq6ic48x2aCMltGtHGdCjuLgTPzucm24K9AMBc7AJ
	8yxr8hk8USadSkTNC0/q+xgFHSmYJO9IlPQ5MrLZ6lD+74h5+woO7j+p+hZlQdBgDqDc8ucOsV1eT
	/ig5ThJvpoyGM2PHoyAgN9yJvmb4XVLRGrFDFOLQ6ZUOmfilMWB6mqG9iTsk3bDl9FehpewkgtQKV
	8QkXTjTlDDhXVi1qk3wMtd6SqynDblxvjLDNgb6E14HBrQZ6DrGaUKyUmVw5EACZrwPTnhvIQOmb6
	U0vkK0BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urbto-00000001aLG-1bYQ;
	Thu, 28 Aug 2025 12:38:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZx3-00000001Aoh-1PPs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 10:33:54 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S5V6iu027635;
	Thu, 28 Aug 2025 10:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EK88bIxyb7opoCqG7E3Er3n2due1WnCsiMk8VTgRnkg=; b=VbPqjHBAKKoSDxnp
	9Rpo1QrjUfKV0V40Htm0yfmbtxrn3gtAV/1pWp2lLubLWOUnqVSIPOp0VRq8RqSA
	RRBv4tM1Zi/9/0OuD0XJ73t4+kgxuAfiN3CIacPCTC/5u8wfv4se6hF8JOAgp2Pc
	qa1EYOfchfnkSt1pxVMhPU4hDInv8gVqPlqnpbYGqvU4AXoU6bzTBv7J90XXXj5T
	lpD/r2nu5uqS/Vg+hx5yh8vB/EZw4ivNBsiMoPo+S3Xcc+YJ0dVPjrUuGgZcdZ54
	LMNcvH8m+CrU0h7LkL9EJ3ryubkFWJULlSmjbZSkns5qweXHFOPQH2eNIoJl7PGK
	xzoMRw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48se16xwea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 10:33:45 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57SAXikn007489
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 10:33:44 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Thu, 28 Aug 2025 03:33:38 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Thu, 28 Aug 2025 18:32:15 +0800
Subject: [PATCH v4 02/10] dt-bindings: interconnect: Add Qualcomm IPQ5424
 NSSNOC IDs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250828-qcom_ipq5424_nsscc-v4-2-cb913b205bcb@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756377204; l=1518;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=3kI7v3n2uneHPtTTq+P96g+GGegxV6qWC49TJxH8Jfc=;
 b=R+9aNlH/7KLMo6EriQXGnCPQiT9yh/ugvKt9/IBK7NbZlSVkxf4sVltzpiERezzCJAJnhGkad
 w3XilZ4QUseCCZL1mOqbpaif0UNEZDn79SB4Oy6lI0exg4Pg+fq8ths
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6U-7LzYry8q6Hm6L8jdHC4oYUaTfbRau
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDEyMCBTYWx0ZWRfXwbqLjTSRHj5H
 W0CUUdFSI4Un1pd+Ki5o+xlf0ysHuSrI4JyLrZKGJKJnqsAQNg45UbMnoyH8Fqzu2s0xRX8+1I3
 TFpvF6cVQfaWC8GfD+iEQn1geYBNLNfG5kEMvLoZPSycDlDhmI7qBao2D53kGS5xzaVGFNcMfgi
 RyYCmyDxN+7P/5h3PSNFWI+o1Jh197xe669FUKd/8GoCXR3/xlR8etdkjhdsQ/D5ghgjWFlfuhn
 VVmxh8/J3U1/8n7bGL+X3MTVwzfiNHr0cAiEHbIRHvfpff1IgLFjCfTlF3E7+nWNBN1p13frIsn
 LvclE54FUXNUeukWXm5wcJgMGlJlWhUmxnMuA6VhvmKAwJe2gEWAk8h7uiiBYqkQ8lH9kwAQ4ka
 jLHwlNQ7
X-Proofpoint-ORIG-GUID: 6U-7LzYry8q6Hm6L8jdHC4oYUaTfbRau
X-Authority-Analysis: v=2.4 cv=CNYqXQrD c=1 sm=1 tr=0 ts=68b03089 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=Qcuqu0ky38DJWFOqejsA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508260120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_033353_382594_F7F7D706 
X-CRM114-Status: GOOD (  10.50  )
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

Add the NSSNOC master/slave ids for Qualcomm IPQ5424 network subsystem
(NSS) hardware blocks. These will be used by the gcc-ipq5424 driver
that provides the interconnect services by using the icc-clk framework.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 include/dt-bindings/interconnect/qcom,ipq5424.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/dt-bindings/interconnect/qcom,ipq5424.h b/include/dt-bindings/interconnect/qcom,ipq5424.h
index afd7e0683a24..c5e0dec0b300 100644
--- a/include/dt-bindings/interconnect/qcom,ipq5424.h
+++ b/include/dt-bindings/interconnect/qcom,ipq5424.h
@@ -20,6 +20,26 @@
 #define SLAVE_CNOC_PCIE3		15
 #define MASTER_CNOC_USB			16
 #define SLAVE_CNOC_USB			17
+#define MASTER_NSSNOC_NSSCC		18
+#define SLAVE_NSSNOC_NSSCC		19
+#define MASTER_NSSNOC_SNOC_0		20
+#define SLAVE_NSSNOC_SNOC_0		21
+#define MASTER_NSSNOC_SNOC_1		22
+#define SLAVE_NSSNOC_SNOC_1		23
+#define MASTER_NSSNOC_PCNOC_1		24
+#define SLAVE_NSSNOC_PCNOC_1		25
+#define MASTER_NSSNOC_QOSGEN_REF	26
+#define SLAVE_NSSNOC_QOSGEN_REF		27
+#define MASTER_NSSNOC_TIMEOUT_REF	28
+#define SLAVE_NSSNOC_TIMEOUT_REF	29
+#define MASTER_NSSNOC_XO_DCD		30
+#define SLAVE_NSSNOC_XO_DCD		31
+#define MASTER_NSSNOC_ATB		32
+#define SLAVE_NSSNOC_ATB		33
+#define MASTER_CNOC_LPASS_CFG		34
+#define SLAVE_CNOC_LPASS_CFG		35
+#define MASTER_SNOC_LPASS		36
+#define SLAVE_SNOC_LPASS		37
 
 #define MASTER_CPU			0
 #define SLAVE_L3			1

-- 
2.34.1


