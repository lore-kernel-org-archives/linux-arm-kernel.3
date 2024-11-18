Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF90D10F5C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 06:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tIuhqDedNNE+RKLFjY7UPz+oQyiGEu+Qqb7U8Kyo+Bc=; b=oKkj2x3bPSEFND16bVla8+/IJN
	8+5r/AZojw+3hYKyu+QUGIgovlwBMjzc49iOBXL2543oTJF10HPp24lgg228CuakyaWEq4dhd6Teo
	BKUciuz8vr4Rg3SYyXpOJsFcFLa9dd1lCjpUvgCywvSuEUETr8sSeouK6m2lCJuR0DTNXGTV9YT+U
	Qf6LJYNHXyZ05QOb1XrPLT7lvTZrIMSc/0D6u+iEhoSJVOqDWEMyMJctK471aL9iDwdzXAp0eWViv
	nSUVbVIlyrjyqnJDvEfmsIHtkhOfdIH1cJirTZ4FIVFhBAJn4qma4pn/ruhOAEXzt+j9rOcBUQqdF
	2CDVNF0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCv9C-00000008VTx-3niD;
	Mon, 18 Nov 2024 06:22:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCv5w-00000008UvL-29bq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 06:18:45 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI5Rd5B020056;
	Mon, 18 Nov 2024 06:18:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tIuhqDedNNE+RKLFjY7UPz+oQyiGEu+Qqb7U8Kyo+Bc=; b=mpu6YmfG3px0WoIT
	HfKVOCKp/Ee1RiUpW6kQEBr8qTykJl4xK/1jXzwNOuRkMVA51+TcKwu43c7hvK8x
	oEN7ra6fVbe7L27wipVCv7DDGfHgSqgbRyy6oFYHpFXgGwwAB9auWksCEAvZ2gOT
	3d6RvmDRyFcb8UKOafltX7UM7p3HNXVoAFgKJj0+1l8PMvzvadps1kVCJpsO/SEt
	NXs+8iobdHDRj8LjFLoWzUQogd6MEbV6qdRrOJ6mYhpJliL+tghQhzF7ZE88LlMi
	MoEe1pb5xkBhKa7UY1qu6bVP1IfqVj0kvZIvDXXJwDKbnSw/oBovNQDW563XrVZI
	kL8XiA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42xksqkkkf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 06:18:35 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AI6IYst000885
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 06:18:34 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 17 Nov 2024 22:18:27 -0800
From: Yijie Yang <quic_yijiyang@quicinc.com>
Date: Mon, 18 Nov 2024 14:16:52 +0800
Subject: [PATCH 3/3] net: stmmac: dwmac-qcom-ethqos: add support for EMAC
 on qcs615 platforms
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241118-schema-v1-3-11b7c1583c0c@quicinc.com>
References: <20241118-schema-v1-0-11b7c1583c0c@quicinc.com>
In-Reply-To: <20241118-schema-v1-0-11b7c1583c0c@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David
 S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro
	<peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>
CC: <quic_yijiyang@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <quic_tingweiz@quicinc.com>,
        <quic_aiquny@quicinc.com>, <quic_tengfan@quicinc.com>,
        <quic_jiegan@quicinc.com>, <quic_jingyw@quicinc.com>,
        <quic_jsuraj@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731910684; l=2068;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=V7lalbixoBGJlxP3pf4NJMaXZaZuAQMqMIc+vgd+3BI=;
 b=FU8k6QsxVA/681P/NbgYU6+syEkmnFdoOFzhIomrZ48QvJUCsK6mosz415tHOcmMNAj2DqsRa
 AEefZBFFK0vBhVMxIaQ6UJQsz8mffcQuT1iSNJka9gr6OckqE69K/wY
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BdP2FsdCWzm30kLl9btzK92UAshlb41s
X-Proofpoint-ORIG-GUID: BdP2FsdCWzm30kLl9btzK92UAshlb41s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411180051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_221844_675618_10A8763C 
X-CRM114-Status: GOOD (  13.99  )
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

qcs615 uses EMAC version 2.3.1, add the relevant defines and add the new
compatible.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 901a3c1959fa57efb078da795ad4f92a8b6f71e1..8c76beaee48821eb2853f4e3f8bfd37db8cadf78 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -249,6 +249,22 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
 	.has_emac_ge_3 = false,
 };
 
+static const struct ethqos_emac_por emac_v2_3_1_por[] = {
+	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x00C01343 },
+	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642C },
+	{ .offset = SDCC_HC_REG_DDR_CONFIG,	.value = 0x00000000 },
+	{ .offset = SDCC_HC_REG_DLL_CONFIG2,	.value = 0x00200000 },
+	{ .offset = SDCC_USR_CTL,		.value = 0x00010800 },
+	{ .offset = RGMII_IO_MACRO_CONFIG2,	.value = 0x00002060 },
+};
+
+static const struct ethqos_emac_driver_data emac_v2_3_1_data = {
+	.por = emac_v2_3_1_por,
+	.num_por = ARRAY_SIZE(emac_v2_3_1_por),
+	.rgmii_config_loopback_en = true,
+	.has_emac_ge_3 = false,
+};
+
 static const struct ethqos_emac_por emac_v3_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -898,6 +914,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
+	{ .compatible = "qcom,qcs615-ethqos", .data = &emac_v2_3_1_data},
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
 	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},

-- 
2.34.1


