Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6191CE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 07:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VWw+5QmJu0GdfrNZ8LAHP76xLaoV9zwK4krvOTUJ0XE=; b=iMmOOaGs9APCG8j+sN+rXtNee9
	AlFaZVpH1hRFfhw8qDMccB2gGgTJSBkSKmjjzYj+YXuG24yVvOaxgf3VreqpZzG2u3tE25rh2vOCs
	YEBjtaT+JQDfNyPvULm6WpmNYt5NrOjdnzqrHk3JgwHKkuKRA6a5nFspWirq4CmP5yhAgIzRumFVl
	aYX9hMF0WzOQYspMrVdq5ezyZZa6UoEqO7l590lKT2FThvTtqlw7j7KbfEruKM1dWF5rjt/6pG7cx
	NLDsgMZtzwSpm6qwLB8QyaKDAm7+QKVrZCYA8HgeNBzmq6vzYr9mkVu9zS49YiSuEm/c0CygI/FzQ
	BIsdFUqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNRd7-0000000CWNJ-3Gjb;
	Tue, 17 Dec 2024 07:04:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNROL-0000000CTF4-38an
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 06:49:14 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH58C0Y016688;
	Tue, 17 Dec 2024 06:49:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VWw+5QmJu0GdfrNZ8LAHP76xLaoV9zwK4kr
	vOTUJ0XE=; b=O0phCf4ZS7oOgaruGr5O52SlqcVDCD8bGenF8q4IkRfkMJnzTPV
	GbijsmlcrBEpnmXs/1/G7f/E3Bbzi7K4pc6EMuI/TdZi5Oi8FDlKlMsRVxlBtdqZ
	lv2VgRv5jU5QsatXWi7/FlBybuDtXH+J3Ji6fglqCo9g1AWmoDEf76/v2TJCqwgB
	pSLWsdmT6MxFp2ow0hOcOea3be2p6Iq+xQ77LTtpGzj6XB7UaI4EcaqRAWCB+bHU
	Sggi9+SS5aFCvmRjbXbZURqlZJa9EbyGRoRpWoSe48NawxfeCAKQMJVKtsOTa/Ci
	hwzQMjn+JE+Iy0311kcIXuOvv6mljLvV7RA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k2vng7s1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:49:03 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH6n0CX014905;
	Tue, 17 Dec 2024 06:49:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 43h33kx8y3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:49:00 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4BH6n0bJ014876;
	Tue, 17 Dec 2024 06:49:00 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4BH6mxRv014865
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:49:00 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id EB8265A5; Tue, 17 Dec 2024 12:18:58 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@quicinc.com, Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH v4 0/7] arm64: qcom: Add support for QCS9075 boards
Date: Tue, 17 Dec 2024 12:18:49 +0530
Message-ID: <20241217064856.2772305-1-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Em0ZAJvPaLWiIEqFpgW5cfcexGGIU7r2
X-Proofpoint-ORIG-GUID: Em0ZAJvPaLWiIEqFpgW5cfcexGGIU7r2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxlogscore=935 impostorscore=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_224913_800875_41997B3C 
X-CRM114-Status: GOOD (  13.37  )
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

This series:

Add support for Qualcomm's rb8, ride/ride-r3 boards using QCS9075 SoC.

QCS9075 is compatible IoT-industrial grade variant of SA8775p SoC.
Unlike QCS9100, it doesn't have safety monitoring feature of
Safety-Island(SAIL) subsystem, which affects thermal management.

In QCS9100 SoC, the safety subsystem monitors all thermal sensors and
does corrective action for each subsystem based on sensor violation
to comply safety standards. But as QCS9075 is non-safe SoC it requires
conventional thermal mitigation for thermal management.

Difference between Ride & ride-r3 boards is ethernet phy,
ride uses 1G ethernet phy while ride-r3 uses 2.5G ethernet phy.

This series depends on [1] for thermal functionality to work.

[1]: https://lore.kernel.org/all/20241112-sa8775p_cpuidle-v1-1-66ff3ba72464@quicinc.com/

---
Changelog:

v4:
  - Replace dts to dtsi in Ride/Ride-r3 platform files
  - Add thermal patch to differentiate between 9100 vs 9075
  - Add proper abbreviation and update commit for 9100 vs 9075
  - v3: https://lore.kernel.org/all/20241119174954.1219002-1-quic_wasimn@quicinc.com/

v3:
  - Fix RB8 board compatible string
  - v2: https://lore.kernel.org/all/20241115225152.3264396-1-quic_wasimn@quicinc.com/

v2:
  - Remove unused dp nodes & update commit for ride vs ride-r3.
  - v1: https://lore.kernel.org/all/20241110145339.3635437-1-quic_wasimn@quicinc.com/

Manaf Meethalavalappu Pallikunhi (2):
  arm64: defconfig: enable cpu idle injection and cpu idle cooling
    device
  arm64: dts: qcom: Enable cpu cooling devices for QCS9075 platforms

Wasim Nazir (5):
  dt-bindings: arm: qcom,ids: add SoC ID for QCS9075
  soc: qcom: socinfo: add QCS9075 SoC ID
  dt-bindings: arm: qcom: Document rb8/ride/ride-r3 on QCS9075
  arm64: dts: qcom: Add support for QCS9075 RB8
  arm64: dts: qcom: Add support for QCS9075 Ride & Ride-r3

 .../devicetree/bindings/arm/qcom.yaml         |   9 +
 arch/arm64/boot/dts/qcom/Makefile             |   3 +
 arch/arm64/boot/dts/qcom/qcs9075-rb8.dts      | 282 +++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts  |  47 +++
 arch/arm64/boot/dts/qcom/qcs9075-ride.dts     |  47 +++
 arch/arm64/boot/dts/qcom/qcs9075-thermal.dtsi | 287 ++++++++++++++++++
 arch/arm64/configs/defconfig                  |   3 +
 drivers/soc/qcom/socinfo.c                    |   1 +
 include/dt-bindings/arm/qcom,ids.h            |   1 +
 9 files changed, 680 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-thermal.dtsi


base-commit: 4176cf5c5651c33769de83bb61b0287f4ec7719f
--
2.47.0


