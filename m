Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF01EC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 08:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oTSddBFBZpIhVzkPETurEWo14Aj+75DmLa6musDz0bM=; b=j0KdDtt2eT0b8ZCZJZGYv1o/pr
	iehtHKFvvFsNsmm1PLRwng09Wd8CPDJC4PyncBVxRETz/ifplwqZRQvwYZ0tfOi4+Sw69VgpytfpT
	g5iTSpsXeRp4sU9A8rf4xVNgU9iDtxiBDZktak2g9geS3kOLU/4NsH7V7h2CXqjDzrQyA6pQtrQ/Z
	l3KRjS9A7ZGyIbj3CfWegJh0E5M9zNc6wiB6pNThu/BLezwzNk0WZUKz/mvwglAI7ML5dj9Vkn6jk
	2s0gALEumsQ4Oe2zMSgbf6k/hr/9lB+q/3jA8rIOoahzLCfoCWExCgIcTHCmhDMcoK4q2x+u1YRwW
	Nh8YyJqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta9DW-00000007CMI-3h5y;
	Tue, 21 Jan 2025 08:02:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta97I-00000007BTR-1rdb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 07:56:09 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50KNr9lM029987;
	Tue, 21 Jan 2025 07:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oTSddBFBZpIhVzkPETurEWo14Aj+75DmLa6musDz0bM=; b=izO3WHFVVXT2pnH4
	cZMkGoOSVFYE82/bu6Kbf8IALqepCgurDGXfk13j4SnBLPQav+UHDFc5k8CqH5ft
	kabVWcPixRvZ91sQCuLX3O42U0H8TeRFd7vD9rvyEbLbP0a6QiKEygp4VEKGrGTK
	oV+rzO+f5X81E3twr9qigqt4XJQVX71Hxx/q+irHG8mJuaPJQqII/wUWvwQbAqkC
	Xvl56+kYZbXuPebWqGL9Vke64jMTsmtEtAQY1IPpGI26K4qtKTbskPc3LXLW/RCq
	AI3AQ24KFK9PQM5Ec5P2+79hEKjLIXu/h5QYISnYvn58JebAatYGgzdFHcnN0vEm
	UnpWPA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44a0j10weu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 07:56:00 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50L7twvr030840
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 07:55:59 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 20 Jan 2025 23:55:53 -0800
From: Yijie Yang <quic_yijiyang@quicinc.com>
Date: Tue, 21 Jan 2025 15:54:54 +0800
Subject: [PATCH v3 2/4] net: stmmac: dwmac-qcom-ethqos: Mask PHY mode if
 configured with rgmii-id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250121-dts_qcs615-v3-2-fa4496950d8a@quicinc.com>
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
In-Reply-To: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Yijie Yang
	<quic_yijiyang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737446142; l=2549;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=IOg1nnppdMQcH00w1oDu9lTpaep4VwJFdoVptu9pVOw=;
 b=u5lxfMjiG0oC+Rsdrtq5a/4ObLhn6e82cYu8U04hNlj4IB5qza/VM6cyqslnSsH50BjvsPIDu
 JvtyCL2bEW6Cy+AAnB8j2mi1k/HgSJcAalAx1lOmgeoXDKGt02+AsC8
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tYLQeiEyuYaUOBE6C0IierrWhvNxMere
X-Proofpoint-ORIG-GUID: tYLQeiEyuYaUOBE6C0IierrWhvNxMere
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_04,2025-01-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501210064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_235608_609252_ED1CA110 
X-CRM114-Status: GOOD (  20.48  )
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

The Qualcomm board always chooses the MAC to provide the delay instead of
the PHY, which is completely opposite to the suggestion of the Linux
kernel. The usage of phy-mode in legacy DTS was also incorrect. Change the
phy_mode passed from the DTS to the driver from PHY_INTERFACE_MODE_RGMII_ID
to PHY_INTERFACE_MODE_RGMII to ensure correct operation and adherence to
the definition.
To address the ABI compatibility issue between the kernel and DTS caused by
this change, handle the compatible string 'qcom,qcs404-evb-4000' in the
code, as it is the only legacy board that mistakenly uses the 'rgmii'
phy-mode.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 2a5b38723635b5ef9233ca4709e99dd5ddf06b77..e228a62723e221d58d8c4f104109e0dcf682d06d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -401,14 +401,11 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
-	int phase_shift;
+	int phase_shift = 0;
 	int loopback;
 
 	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
-	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
-	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
-		phase_shift = 0;
-	else
+	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID)
 		phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;
 
 	/* Disable loopback mode */
@@ -810,6 +807,17 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ret = of_get_phy_mode(np, &ethqos->phy_mode);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get phy mode\n");
+
+	root = of_find_node_by_path("/");
+	if (root && of_device_is_compatible(root, "qcom,qcs404-evb-4000"))
+		ethqos->phy_mode = PHY_INTERFACE_MODE_RGMII_ID;
+	else if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII)
+		return dev_err_probe(dev, -EINVAL, "Invalid phy-mode rgmii\n");
+	of_node_put(root);
+
+	if (plat_dat->phy_interface == PHY_INTERFACE_MODE_RGMII_ID)
+		plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII;
+
 	switch (ethqos->phy_mode) {
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_ID:

-- 
2.34.1


