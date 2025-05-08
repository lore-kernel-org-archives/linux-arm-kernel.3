Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F38C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 08:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ARiW1L4tiT5iBYOOQbCx0ZDmWGO3FEV9285jooej9Js=; b=QiJX7Q57yZJjN/K928bzYvvvRx
	THIEqhJ5WCVMGU1g1iVUslPOOVi5NHz/lPfnr7dXgchHgudM0zeMf4fWwKkoADfnZAtGp3lDnWTu1
	MOTcUDvt2jVyPNS0+hs0dguFDdSGBSeSGsEOjVjVa9eI2M29qQQH5W0uNlFrOFIiqU+NbAF1tDM9r
	S0PjW3IcxLEpB+MENbwgLQwkT7BT23lcoCu0ZcCvdYueE4xBcbzz9hDQlMQ6mREVWorja8EJ8cpa/
	/qQktzMCCPWRzjkR14sCLRO9NV6jXAHR46l0oG9IY3071xEBY54sKeUB++KIHMSd40ehp0BbhlRG8
	B8uXtkeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwZZ-000000006dB-0ubS;
	Thu, 08 May 2025 08:25:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwQ2-000000004qZ-3MG5;
	Thu, 08 May 2025 08:15:52 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5484XEF1009418;
	Thu, 8 May 2025 08:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ARiW1L4tiT5iBYOOQbCx0ZDmWGO3FEV9285
	jooej9Js=; b=dYIkN4t78AWUQTqDyDoir8+ic1Zcz99PzSJDdu8VmSKah8VjRKK
	/5xPU89w52dqKD7tj74RBnMyzukw4yRWRofqe1UEeDWRLrlI+ob7pD2kE0at1PyK
	WKxsULdzkZO11/6F7+V5tqbeMp4T3nErCds6TBixl6vwIDAqwU9O+6Y+lXcE+A75
	Qya/OlRN4Eevr7XJFa7VZ6HTW0Bn6Pm8Qb7y6MW1Oyig/n0avwjCAZ0uJ2PUw1VR
	eBsdHCFxXT1VEe74BiC6u4iubu8Q46ruT877R9AnDW0+S7i6PageGwNT70k7DEXJ
	g5Bk/SFzlc08tWutvm874CUTowldef0XpNA==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnperh5n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 08:15:34 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5488FVjD015212;
	Thu, 8 May 2025 08:15:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 46dc7mq5f2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 08:15:31 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5488FV2t015199;
	Thu, 8 May 2025 08:15:31 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 5488FUvP015198
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 08:15:31 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 4635958)
	id CBF9540CFD; Thu,  8 May 2025 16:15:28 +0800 (CST)
From: Wenbin Yao <quic_wenbyao@quicinc.com>
To: catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vkoul@kernel.org, kishon@kernel.org, sfr@canb.auug.org.au,
        linux-phy@lists.infradead.org
Cc: krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com, quic_qianyu@quicinc.com,
        quic_wenbyao@quicinc.com
Subject: [PATCH v3 0/5] arm64: qcom: x1e80100-qcp: Add power supply and sideband signals for PCIe RC
Date: Thu,  8 May 2025 16:15:09 +0800
Message-Id: <20250508081514.3227956-1-quic_wenbyao@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDA3MiBTYWx0ZWRfX9Rl2cXH2JA+e
 gS5hPybH3+FlvOLrpRNHOJiFwppLc9Y+i5+X2nD3jcXQDEyntulxKHq89z1t5nZldbdNuwoZJfD
 MgY+5wZELbGcakg9zSeZtWKOYCn1pJfSETexwEv1VZ7GmjnpmUXBS1wD7e8Afe/s9rIPL93RXmE
 hNFMdO03CqKHYi1PL1TcuiQ5gNDEHsSRbjGJM51dcITZ7bjRoYbg966jC2FlNHtWXl8gijEPNUu
 LvuxRlfcB/zDmYwqj7kulMseHOMZkKPWHaOyzRgHgtSMMBzefPZ17svWK/Y43y29gIInAy1zskq
 BSAwd6H6hUsLDt+8g0efBs7uEz4urD9O30UlgbLgq2Wc1lhp6RgQAIbkUAmEZYz67KzQMTFZ91P
 38+i1IGPxU6O9iwWS3U8bywyIMg0R9qYhqCTLKyaolHJYfGQ3Ai2CbG+B1DblqmbaPDE0rU6
X-Proofpoint-ORIG-GUID: dxZEV0NnWuBV0HwtqCE43qcJprTz0pQm
X-Proofpoint-GUID: dxZEV0NnWuBV0HwtqCE43qcJprTz0pQm
X-Authority-Analysis: v=2.4 cv=Yt4PR5YX c=1 sm=1 tr=0 ts=681c6826 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=gQCXtSsaVPIGO4BefbEA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_02,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=872 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_011550_961164_EE1972B6 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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

The first patch enables the PCI Power Control driver to control the power
state of PCI slots. The second patch adds the bus topology of PCIe domain 3
on x1e80100 platform. The third patch adds perst, wake and clkreq sideband
signals, and describe the regulators powering the rails of the PCI slots in
the devicetree for PCIe3 controller and PHY device. The fourth patch adds
qref supply in dts nodes of PCIe PHYs. The fifth patch requests qref supply
for PCIe PHYs.

The patchset has been modified based on comments and suggestions.

Changes in v3:
- Replace PCI_PWRCTL_SLOT with PCI_PWRCTRL_SLOT in Patch 1/5.
- Kepp the order of pinctrl-0 before pinctrl-names in Patch 3/5.
- Add Patch 5/5 to request qref supply for PCIe PHYs.
- Link to v2: https://lore.kernel.org/all/20250425092955.4099677-1-quic_wenbyao@quicinc.com/

Changes in v2:
- Select PCI_PWRCTL_SLOT by ARCH_QCOM in arch/arm64/Kconfig.platforms in
  Patch 1/4.
- Add an empty line before pcie3port node in Patch 2/4.
- Rename regulator-pcie_12v regulator-pcie_3v3_aux and regulator-pcie_3v3
  in Patch 3/4.
- Add Patch 4/4 to describe qref supply of PCIe PHYs.
- Link to v1: https://lore.kernel.org/all/20250320055502.274849-1-quic_wenbyao@quicinc.com/

Qiang Yu (5):
  arm64: Kconfig: enable PCI Power Control Slot driver for QCOM
  arm64: dts: qcom: x1e80100: add bus topology for PCIe domain 3
  arm64: dts: qcom: x1e80100-qcp: enable pcie3 x8 slot for X1E80100-QCP
  arm64: dts: qcom: x1e80100-qcp: Add qref supply for PCIe PHYs
  phy: qcom: qmp-pcie: add x1e80100 qref supplies

 arch/arm64/Kconfig.platforms              |   1 +
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 121 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi    |  11 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c  |  37 ++++++-
 4 files changed, 165 insertions(+), 5 deletions(-)


base-commit: 0a00723f4c2d0b273edd0737f236f103164a08eb
-- 
2.34.1


