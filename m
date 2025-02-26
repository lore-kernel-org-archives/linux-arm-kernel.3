Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 156E5C021BC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 08:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zsizWtkjWm8qfJrKiO1LvboF9dMVTu0yxG98B7uMums=; b=QQVMzKG0a8L1wOISKc8cHWoko3
	6jFpDkuiZwkIr5TcORXCECAQpyNOfD6hG6YujcU7vb4gCHWyQSXl6xigJfaqDnbIOszUhs0S1dYtj
	NWg2c56MvlCtYKxalLRrp9iz14hiPfr9b1Jj+MRjhfBk3f59nQMT4YKC71uI2eH3izQR3G4h1MPIQ
	xSnV+qxtIlRHmyuD4EJvfKrwQjb1UHEqpEF3XG0Gfat/F3do+RB10Lxq2qy5JYyhXowZ2B+dbroRC
	RRPy3Ku0466Al5YAeGhmy+LMXI3EmSVgxK11cT0ftZVPnhU+09AUoehY3yOh8ItIfeO4ubw6E+XqM
	YFhfuoLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnCT4-00000002oof-0mK8;
	Wed, 26 Feb 2025 08:08:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnCGN-00000002lXS-1ukD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 07:55:28 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PMWoTC012154;
	Wed, 26 Feb 2025 07:55:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zsizWtkjWm8qfJrKiO1Lvb
	oF9dMVTu0yxG98B7uMums=; b=MCrKoQHIqwPrlJC7WZDl+mr/IZPFM7ihfneyMh
	Tl5rtGOvByKYdfDqcId4Vlf/f+Qpo27dMeDS7fBzPNDjc4m/p+ZNRJFnRzd9xwX8
	KMPX9m8dvDeQNpysEQRQQogesfQ8dDfNRud8Pw9PbfufZloRh6gFXYfvGscQnQxo
	ZwkECetKEFRVxLBuENC/+jAoGHkmY0B5fV7OauC4b3O2NjEMN+rKZxg6tBdYdRS+
	kYDMHj5hBGiF6lJ1aRWsGazflEEKIq/967D1sFWTp6sMi4EbLjcEBsBSGhw0ULxu
	7sXRfKWMe1x9wOVDj4RMKfVXfLlmn+JcdW2LzkDJctekR6lQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prk162s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 07:55:08 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51Q7t7It019976
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 07:55:07 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 25 Feb 2025 23:54:59 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <konradybcio@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
        <p.zabel@pengutronix.de>, <richardcochran@gmail.com>,
        <geert+renesas@glider.be>, <dmitry.baryshkov@linaro.org>,
        <arnd@arndb.de>, <nfraprado@collabora.com>, <quic_tdas@quicinc.com>,
        <biju.das.jz@bp.renesas.com>, <ebiggers@google.com>,
        <ross.burton@arm.com>, <elinor.montmasson@savoirfairelinux.com>,
        <quic_anusha@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <netdev@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH v11 0/6] Add NSS clock controller support for IPQ9574
Date: Wed, 26 Feb 2025 13:24:43 +0530
Message-ID: <20250226075449.136544-1-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 969BKY-qV7X_FsjZC1JBdLynRMT8gQ25
X-Proofpoint-ORIG-GUID: 969BKY-qV7X_FsjZC1JBdLynRMT8gQ25
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_01,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 mlxscore=0 mlxlogscore=927 malwarescore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_235527_611247_07E2E61D 
X-CRM114-Status: GOOD (  13.83  )
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

Changes in V11:
	- nsscc dt-bindings
		- Renamed 'nsscc' clock to 'bus'.
	- nsscc driver
		- Added the 'pm_runtime_put()' API in the qcom_cc_map()
		  failure case to decrement the runtime PM usage counter.
		- Added the 'bus' clock to PM instead of 'nsscc', as
		  'nsscc' has been renamed to 'bus'.
		- Added dev_err_probe for all failure cases in nss_cc_ipq9574_probe().
		- Updated module description to use the full name
		  "Qualcomm Technologies, Inc." instead of the abbreviation "QTI".
	- dtsi
		- Renamed 'nsscc' clock to 'bus'.
	- Fixed review comments from Konrad.

V10 can be found at:
https://lore.kernel.org/linux-arm-msm/20250221101426.776377-1-quic_mmanikan@quicinc.com/

V9 can be found at:
https://lore.kernel.org/linux-arm-msm/20250207073926.2735129-1-quic_mmanikan@quicinc.com/

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

 .../bindings/clock/qcom,ipq9574-nsscc.yaml    |   98 +
 arch/arm64/boot/dts/qcom/ipq9574.dtsi         |   29 +
 arch/arm64/configs/defconfig                  |    1 +
 drivers/clk/qcom/Kconfig                      |    7 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/gcc-ipq9574.c                |   15 +
 drivers/clk/qcom/nsscc-ipq9574.c              | 3110 +++++++++++++++++
 include/dt-bindings/clock/qcom,ipq9574-gcc.h  |    1 +
 .../dt-bindings/clock/qcom,ipq9574-nsscc.h    |  152 +
 .../dt-bindings/reset/qcom,ipq9574-nsscc.h    |  134 +
 10 files changed, 3548 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
 create mode 100644 drivers/clk/qcom/nsscc-ipq9574.c
 create mode 100644 include/dt-bindings/clock/qcom,ipq9574-nsscc.h
 create mode 100644 include/dt-bindings/reset/qcom,ipq9574-nsscc.h


base-commit: 0226d0ce98a477937ed295fb7df4cc30b46fc304
-- 
2.34.1


