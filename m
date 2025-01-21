Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B307C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 08:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9IpyAq32RWq5IqDQ8FG5p4cQgFTnTO+EW9HFr5WAPs=; b=yPg+LB9b5mHsyVZN4uB7gIiZk1
	sr577zlgMt9nEdIyQouMvb43y84ngor1nDkcjIJWuwOmj21e6sW9CEzzxRoPxOMx4tAhPg/+pTE4G
	uC76yuWC1qMieHLXWoAUobepdYmzgHOLQcuI0ThNCEWthMrjJa/0bsp5yfOWk1KuoeubMPcNVRtSv
	FI1XzbhWa9X9HgXQ3YZYPbKPpcG2TucNiYjT3Z8C6KJGYUIPNCWmBxNJQvtXK/Rr+ZwpZx0YNoy+6
	ff73ALl2kaATX7rFC9Vu5hjPG4trx59yApNszlOPydIi373O1SX3QSwW4pbQgT1LJSQID1GjuQTTC
	chWOgFTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta9G1-00000007Ckj-11WP;
	Tue, 21 Jan 2025 08:05:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta97h-00000007BZ4-01Dp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 07:56:34 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50KNGISw007409;
	Tue, 21 Jan 2025 07:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i9IpyAq32RWq5IqDQ8FG5p4cQgFTnTO+EW9HFr5WAPs=; b=Dz0pFq8aSNSkV6hJ
	FBbRYSTQpNc1WOZYWTBOXpK2KUf6j90jyO3MjBGHdaG7V8QY/Iq6BMMndzsCDK2b
	KE0P1aJkfcIIXJ2eYR+3P9zMe6/IiRyBhlAy+dKCvjEFGP2PALxVSvEf9n73I19C
	yfof7m+Yr9HGXwW9oSV6+pxReOyn/7liUCem7Mv3T9Wv1j602Ei2AlerMn9G75AT
	ZaVY70ZSvHjIUsMANJqMPwC/to8h86p1efsY6byYGBbIOrwGIU+UqvEWzae4/+/z
	vENRqzcz6zUTJFpFUkhI9UE9GJ01mh+vXK6pGKOGm7Pk1Id4eYlPoFvob7psm89f
	kDNEGA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 449v7e99cd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 07:56:22 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50L7u452031025
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 07:56:04 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 20 Jan 2025 23:55:59 -0800
From: Yijie Yang <quic_yijiyang@quicinc.com>
Date: Tue, 21 Jan 2025 15:54:55 +0800
Subject: [PATCH v3 3/4] arm64: dts: qcom: qcs615: add ethernet node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250121-dts_qcs615-v3-3-fa4496950d8a@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737446143; l=1622;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=ZL8DFamzw8ju4ThEC/STKHYmbYZ2vK19I+bikrTWklA=;
 b=v6qIiX5x99C5eiRCtfcBhASLsqlZizNfhrnnGlBpWTsiW3PuPGfUDzdGDhcNEtXvIWY0vmes6
 cDzBY2VF1G9At+hvC96P6olb61tRqkoJQ/bncFZBbodsOWvtuFReGEL
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0jRxKBlAn2NlVgZAw8v68CscjsZ-d0XT
X-Proofpoint-GUID: 0jRxKBlAn2NlVgZAw8v68CscjsZ-d0XT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_04,2025-01-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 spamscore=0 clxscore=1015 mlxlogscore=637 impostorscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501210065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_235633_173950_AAF07912 
X-CRM114-Status: GOOD (  11.20  )
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

Add an ethernet controller node for QCS615 SoC to enable ethernet
functionality.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index f4abfad474ea62dea13d05eb874530947e1e8d3e..b93609a07a5554ab127c0c0540c58ebc781416a4 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -432,6 +432,40 @@ soc: soc@0 {
 		#address-cells = <2>;
 		#size-cells = <2>;
 
+		ethernet: ethernet@20000 {
+			compatible = "qcom,qcs615-ethqos", "qcom,qcs404-ethqos";
+			reg = <0x0 0x00020000 0x0 0x10000>,
+			      <0x0 0x00036000 0x0 0x100>;
+			reg-names = "stmmaceth",
+				    "rgmii";
+
+			clocks = <&gcc GCC_EMAC_AXI_CLK>,
+				 <&gcc GCC_EMAC_SLV_AHB_CLK>,
+				 <&gcc GCC_EMAC_PTP_CLK>,
+				 <&gcc GCC_EMAC_RGMII_CLK>;
+			clock-names = "stmmaceth",
+				      "pclk",
+				      "ptp_ref",
+				      "rgmii";
+
+			interrupts = <GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 661 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq",
+					  "eth_lpi";
+
+			power-domains = <&gcc EMAC_GDSC>;
+			resets = <&gcc GCC_EMAC_BCR>;
+
+			iommus = <&apps_smmu 0x1c0 0x0>;
+
+			snps,tso;
+			snps,pbl = <32>;
+			rx-fifo-depth = <16384>;
+			tx-fifo-depth = <20480>;
+
+			status = "disabled";
+		};
+
 		gcc: clock-controller@100000 {
 			compatible = "qcom,qcs615-gcc";
 			reg = <0 0x00100000 0 0x1f0000>;

-- 
2.34.1


