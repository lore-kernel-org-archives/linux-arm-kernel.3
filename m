Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F93E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 10:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6dwwb4zzM3NnTCe1iM39anIq3aObQY5K5ZIRUt96S7c=; b=R5N55DQmEbPjOBTTwaq3Dz6Hpq
	MmIQvCzgYNeixcjdnfTXUZmwTIcAfMCJljwvxemeE28vyjV66fbr4iX1Ut961tUcOuXNlbYSq4e3g
	B46kCdhXomYEEVJbhTmRvRWnPCeguz8rYsTaRSCXPPE/Bf2aMK+Cd2mjn2/nabY449L8CWs8eKbMI
	pPBCX595T4G9Dwox3Z0Dd8M6OAy4qzg5adyZ32H/MegXN59GrOL/ji5h093rOIYZTfRmAj2FaTvy5
	HWe6M/cvL92CTLGcQoNRnVQNqH1UWmytv/MYWudIoUER+apLenEQAWtWZpI2T4oraNfxWV/dnAaQ7
	8AF+irzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQOLG-0000000Dc2q-1lU8;
	Wed, 25 Dec 2024 10:10:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQOHs-0000000DbMB-1Hc1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Dec 2024 10:06:45 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BP0PJQf025271;
	Wed, 25 Dec 2024 10:06:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6dwwb4zzM3NnTCe1iM39anIq3aObQY5K5ZIRUt96S7c=; b=ZFkR01nG2NtEXu6W
	eQebjLXUBRpy8clgJFCR7uFANB6xKXBCjn02u2GKqfjnCzEBBwV3W/3CbQcrmuxq
	QcxL0UBgJP7IGSXfqZusKmuAsPYiDSVCg8Tcj0RP9L8uvSgYclSQUOa00mhJxbrd
	9T9hs1jt7RCp6oNcyEsK7a/xZhI9yIAQtK477fMktb0ZFjtXBLTu+8RHbaG4r8J7
	bJR23qf1lsxtlymX5N8IuMlqfmkwiBb5GLAsfFuZqHapq7wr4J83MTRxrivTIuJj
	N0dtXl4qh8RyV3W/N1pmpO679EVA73qWZCmgiyYWaJjHW4olpbeQ5eJ1R5o/ILaj
	qt+l3A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43r56e3tjn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 10:06:36 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BPA6Z69013309
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 10:06:35 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Dec 2024 02:06:29 -0800
From: Yijie Yang <quic_yijiyang@quicinc.com>
Date: Wed, 25 Dec 2024 18:04:46 +0800
Subject: [PATCH 2/3] net: stmmac: qcom-ethqos: Enable RX programmable swap
 on qcs615
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241225-support_10m100m-v1-2-4b52ef48b488@quicinc.com>
References: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
In-Reply-To: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
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
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Yijie Yang
	<quic_yijiyang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735121177; l=4726;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=hW5jubt77JttYcMYtAbKMeDmlRM35dxAAtrVbltLXMg=;
 b=byNHrVMKBBunIayRe+2v9vA3H65KPmxFRv7xD8srWB9eDv+bWQOU2OxjbDdT6HrUTTLWh7kBz
 zKLcehwhyd4DgIndZO8XsidM8obSEBTn4l7bnqbpJt8/5/3HbOWyB7G
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NDFb-a5GyPywypvJih38ovVJgudJSsme
X-Proofpoint-GUID: NDFb-a5GyPywypvJih38ovVJgudJSsme
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 phishscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412250088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_020644_471504_C414A87C 
X-CRM114-Status: GOOD (  19.50  )
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

The sampling timing of the MAC varies per board due to differences in
hardware layout or peer PHY, even within the same version. For instance,
the EMAC version on the qcs615-ride board is below 3, but it requires
swapping the RX timing to enable 10M/100M speeds. Therefore, this setting
should be adjustable rather than solely determined by the version.
The RGMII_CONFIG2_RX_PROG_SWAP bit is used to switch the RX sampling
timing between the rising edge and the falling edge of the clock.
Consequently, the condition for setting this bit should be revised to
ensure correct data sampling.
The compatible string matching for 'qcom,sa8540p-ride' in this change is
intended to ensure ABI compatibility for DTS files that do not include the
new 'qcom,rx-prog-swap' property, allowing legacy boards to function as
before. This board is the only one among legacy boards using RGMII and
needs to enable RX swap.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 36 ++++++++++++----------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 2a5b38723635b5ef9233ca4709e99dd5ddf06b77..cf9633489975bc89480d065ae723a92723a12b04 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -120,6 +120,7 @@ struct qcom_ethqos {
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
 	bool needs_sgmii_loopback;
+	bool needs_rx_prog_swap;
 };
 
 static int rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
@@ -401,6 +402,7 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
+	int rx_prog_swap = 0;
 	int phase_shift;
 	int loopback;
 
@@ -421,6 +423,9 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
 	else
 		loopback = 0;
 
+	if (ethqos->needs_rx_prog_swap)
+		rx_prog_swap = RGMII_CONFIG2_RX_PROG_SWAP;
+
 	/* Select RGMII, write 0 to interface select */
 	rgmii_updatel(ethqos, RGMII_CONFIG_INTF_SEL,
 		      0, RGMII_IO_MACRO_CONFIG);
@@ -484,14 +489,8 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
 			      BIT(6), RGMII_IO_MACRO_CONFIG);
 		rgmii_updatel(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
 			      0, RGMII_IO_MACRO_CONFIG2);
-
-		if (ethqos->has_emac_ge_3)
-			rgmii_updatel(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
-				      RGMII_CONFIG2_RX_PROG_SWAP,
-				      RGMII_IO_MACRO_CONFIG2);
-		else
-			rgmii_updatel(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
-				      0, RGMII_IO_MACRO_CONFIG2);
+		rgmii_updatel(ethqos, RGMII_CONFIG2_RX_PROG_SWAP, rx_prog_swap,
+			      RGMII_IO_MACRO_CONFIG2);
 
 		/* Write 0x5 to PRG_RCLK_DLY_CODE */
 		rgmii_updatel(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE,
@@ -525,13 +524,9 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
 			      RGMII_IO_MACRO_CONFIG);
 		rgmii_updatel(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
 			      0, RGMII_IO_MACRO_CONFIG2);
-		if (ethqos->has_emac_ge_3)
-			rgmii_updatel(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
-				      RGMII_CONFIG2_RX_PROG_SWAP,
-				      RGMII_IO_MACRO_CONFIG2);
-		else
-			rgmii_updatel(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
-				      0, RGMII_IO_MACRO_CONFIG2);
+		rgmii_updatel(ethqos, RGMII_CONFIG2_RX_PROG_SWAP, rx_prog_swap,
+			      RGMII_IO_MACRO_CONFIG2);
+
 		/* Write 0x5 to PRG_RCLK_DLY_CODE */
 		rgmii_updatel(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE,
 			      (BIT(29) | BIT(27)), SDCC_HC_REG_DDR_CONFIG);
@@ -782,7 +777,7 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
+	struct device_node *np = pdev->dev.of_node, *root;
 	const struct ethqos_emac_driver_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
@@ -810,6 +805,15 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ret = of_get_phy_mode(np, &ethqos->phy_mode);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get phy mode\n");
+
+	root = of_find_node_by_path("/");
+	if (root && of_device_is_compatible(root, "qcom,sa8540p-ride"))
+		ethqos->needs_rx_prog_swap = true;
+	else
+		ethqos->needs_rx_prog_swap =
+			of_property_read_bool(np, "qcom,rx-prog-swap");
+	of_node_put(root);
+
 	switch (ethqos->phy_mode) {
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_ID:

-- 
2.34.1


