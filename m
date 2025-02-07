Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B80C02192
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 07:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oyzRANn5dmtjvGE1jNRWe6EuSnAsWWPUVRxFwxxtv6A=; b=4VAyQPhZB5+Tia6/EN2GIiXgVB
	upCe6sBltyyaR9lQmMydN4co8KtiT4IWgCo3P6Oeakc+sfKTqbdYH5VqUzHkRVak7Y1VaNNthIp71
	XNoleFUAfdtFPXMrqM2k2so3VxhJBVV9+PgK2C8cYEPIFb7b60OqICi51BnSUB6GWLTsy7LsEDvSe
	yOxM7RvYAX9mOzoghW5pIk+D1HByCpjl1NBAYV6EV4DneEVXjqQa5YXbq6FYycOg3TJkTWoT55YXy
	dTANFyavar83PtpB5EiJS9JQ4yLAPXehrwjPM1Muxt/w6WCfTyedwrwNXP8k9mUjXTuRtphoCFW1K
	0NUtdDAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgIzR-00000008fa7-3b5J;
	Fri, 07 Feb 2025 07:41:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgIy4-00000008fH3-1ZHs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 07:40:05 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51770ik8030084;
	Fri, 7 Feb 2025 07:39:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oyzRANn5dmtjvGE1jNRWe6
	EuSnAsWWPUVRxFwxxtv6A=; b=moR+GT3TKX1+thVsIsCC4fwrFsUTOdqAJKrS87
	bxrMzNbLmQ61xbL94GkNmWxlAlGvRTDelCNS6232C6BflVlj905MOJxe6vmgMk5J
	uLiDcfYhtYR3Y+/OrG/YGR/Hk6O+BOGXuAsHnlgrZfAKmUbAqAfaby/qoYp3Wc19
	L5LYskXcalMGmNkssDhEppiF+e4whzzgFHye5flgGCEAHyvLl2LLv8WrvONOBUOt
	Doxhh9Wwgg7aFRwPWUWzkqzILz1M+EmQCTBdK+D1SfT5tqGGXOE5baG+1q1Vkpeq
	+wTGV3wApY9tdXeu7wCxamx/srb09ailNZjO2zoooQ4uCFcQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nddjg2x6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 07:39:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5177djsA000543
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 07:39:45 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Feb 2025 23:39:36 -0800
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
Subject: [PATCH v9 0/6] Add NSS clock controller support for IPQ9574
Date: Fri, 7 Feb 2025 13:09:20 +0530
Message-ID: <20250207073926.2735129-1-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uDi8ZUKtWb1JAjxjPD8u8gRmEOPsuJoI
X-Proofpoint-GUID: uDi8ZUKtWb1JAjxjPD8u8gRmEOPsuJoI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_03,2025-02-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=737 priorityscore=1501 clxscore=1011 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_234004_422643_CA78A08B 
X-CRM114-Status: GOOD (  12.60  )
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

Add bindings, driver and devicetree node for networking sub system clock
controller on IPQ9574. Also add support for gpll0_out_aux clock
which serves as the parent for some nss clocks.

Changes in V9:
	- Dropped patch #1 because it's merged.
	- Detailed change logs are added to the respective patches.
	- Dependency series has been merged.

V8 can be found at:
https://lore.kernel.org/linux-arm-msm/20241025035520.1841792-1-quic_mmanikan@quicinc.com/

V7 can be found at:
https://lore.kernel.org/linux-arm-msm/20241009074125.794997-1-quic_mmanikan@quicinc.com/

V6 can be found at:
https://lore.kernel.org/linux-arm-msm/20241004080332.853503-1-quic_mmanikan@quicinc.com/

V5 can be found at:
https://lore.kernel.org/linux-arm-msm/20240626143302.810632-1-quic_devipriy@quicinc.com/

V4 can be found at:
https://lore.kernel.org/linux-arm-msm/20240625070536.3043630-1-quic_devipriy@quicinc.com/

V3 can be found at:
https://lore.kernel.org/linux-arm-msm/20240129051104.1855487-1-quic_devipriy@quicinc.com/

V2 can be found at:
https://lore.kernel.org/linux-arm-msm/20230825091234.32713-1-quic_devipriy@quicinc.com/

Devi Priya (6):
  dt-bindings: clock: gcc-ipq9574: Add definition for GPLL0_OUT_AUX
  clk: qcom: gcc-ipq9574: Add support for gpll0_out_aux clock
  dt-bindings: clock: Add ipq9574 NSSCC clock and reset definitions
  clk: qcom: Add NSS clock Controller driver for IPQ9574
  arm64: dts: qcom: ipq9574: Add nsscc node
  arm64: defconfig: Build NSS Clock Controller driver for IPQ9574

 .../bindings/clock/qcom,ipq9574-nsscc.yaml    |   73 +
 arch/arm64/boot/dts/qcom/ipq9574.dtsi         |   19 +
 arch/arm64/configs/defconfig                  |    1 +
 drivers/clk/qcom/Kconfig                      |    7 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/gcc-ipq9574.c                |   15 +
 drivers/clk/qcom/nsscc-ipq9574.c              | 3080 +++++++++++++++++
 include/dt-bindings/clock/qcom,ipq9574-gcc.h  |    1 +
 .../dt-bindings/clock/qcom,ipq9574-nsscc.h    |  152 +
 .../dt-bindings/reset/qcom,ipq9574-nsscc.h    |  134 +
 10 files changed, 3483 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
 create mode 100644 drivers/clk/qcom/nsscc-ipq9574.c
 create mode 100644 include/dt-bindings/clock/qcom,ipq9574-nsscc.h
 create mode 100644 include/dt-bindings/reset/qcom,ipq9574-nsscc.h


base-commit: ed88b8b82c53d73ca0428e31c2eba3984e32140d
-- 
2.34.1


