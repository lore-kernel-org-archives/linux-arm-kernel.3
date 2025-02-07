Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B39AC02192
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 07:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=02mG2WZcRBojRzfuN8IxKbII+t/5VKzUwyabKtSkIr4=; b=O5/lRP65dKHwE36FfzYUgi/3ow
	N8RwxIzGQzYCZbh3uaFYJEOplP7j1GA3br1nO58cdVea7IywjVVzdNPiimmX/Zrs//b0uubipvre7
	5AN38b0m1bXJeK+OlqUr8r4UgMHTxpdlAH0+LjUwA81m0+lCjhDGUgBl68zbzsT1Tc2zomt7yvOYm
	8eLB9W80vMAvdLrP8c8CbdFUTwJg0PlKhYjqMU852N2XsVnIvSSxb1MVJLWChE98Wab6rk/P1hfjB
	gqPjrtosdQxamDupgMyW7W5MJlQVyAkFsCRdvNxQOxx4IMFwFsLycK45Z5/J4ogrrbGzDHEAeBLiE
	Aq/Qqf2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJ6C-00000008guo-0jiT;
	Fri, 07 Feb 2025 07:48:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgIye-00000008fOU-3rmc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 07:40:42 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5176Wphu009106;
	Fri, 7 Feb 2025 07:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	02mG2WZcRBojRzfuN8IxKbII+t/5VKzUwyabKtSkIr4=; b=fJMHp0eLleD07dIK
	+Gnkgu9dH7yeeE1rSJIYPb+Qh6cHUs+c99wnjkTEohhSMsISZhfzM9MR0IuldLYH
	bvJTM/Y3oYp9HCAlJAR8Y2k/2MKhSUftqPS+KNmGdm6Ft7LKlr182tcF+aTtAmzy
	UCkc5BVnZ//T3gWYvqsmBLQyF5DuAtjK/clWKyH+CjDhfgzr62vMMR7ZAjRAAT11
	T3PSnroqWFD/6BWvs9IumRs2414PvzaTGpo/Dr4ivAUR/l8mP+9FJoygjMarY5Yn
	osieJi7g3/BoUXgMXjn47gyg/yvc+YNPnkdTuBf/jnM7zdvKg5weFrmQ1kdcX0qR
	7Vgbtg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nd0f05e2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 07:40:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5177eP6P014613
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 07:40:25 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Feb 2025 23:40:17 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <konradybcio@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
        <p.zabel@pengutronix.de>, <richardcochran@gmail.com>,
        <geert+renesas@glider.be>, <dmitry.baryshkov@linaro.org>,
        <arnd@arndb.de>, <nfraprado@collabora.com>,
        <biju.das.jz@bp.renesas.com>, <quic_tdas@quicinc.com>,
        <ebiggers@google.com>, <ardb@kernel.org>, <ross.burton@arm.com>,
        <quic_anusha@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <netdev@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH v9 5/6] arm64: dts: qcom: ipq9574: Add nsscc node
Date: Fri, 7 Feb 2025 13:09:25 +0530
Message-ID: <20250207073926.2735129-6-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207073926.2735129-1-quic_mmanikan@quicinc.com>
References: <20250207073926.2735129-1-quic_mmanikan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Q48m644Dbx5kCBLYc0NSzd85T9XTXaZT
X-Proofpoint-GUID: Q48m644Dbx5kCBLYc0NSzd85T9XTXaZT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_03,2025-02-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxlogscore=970 mlxscore=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_234041_078524_9C30B905 
X-CRM114-Status: GOOD (  10.99  )
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

From: Devi Priya <quic_devipriy@quicinc.com>

Add a node for the nss clock controller found on ipq9574 based devices.

Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
Changes in V9:
	- Rebased on linux-next tip.

 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 942290028972..29008b156a7e 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -1193,6 +1193,25 @@ pcie0: pci@28000000 {
 			status = "disabled";
 		};
 
+		nsscc: clock-controller@39b00000 {
+			compatible = "qcom,ipq9574-nsscc";
+			reg = <0x39b00000 0x80000>;
+			clocks = <&xo_board_clk>,
+				 <&cmn_pll NSS_1200MHZ_CLK>,
+				 <&cmn_pll PPE_353MHZ_CLK>,
+				 <&gcc GPLL0_OUT_AUX>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <&gcc GCC_NSSCC_CLK>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+			#interconnect-cells = <1>;
+		};
 	};
 
 	thermal-zones {
-- 
2.34.1


