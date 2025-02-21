Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE98FC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 09:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nIrFihGCxximWuYDb1lhIEvQ6LYJWGGxztqcAsIqSc4=; b=vVmcOLlDhY0fTY
	/wPuRmFI2Gh4whzro19GOdehEwjrQ3iU4TaAASPfsTE/cIEJ/n4IgstCP3dwLw3NNgP+f0UttOYNB
	p9c612zDch240m2JzQ5+GKiSa0MNAsiFoz4H8/6piQVAuQt4ZIMgn8riiNQEudbeHaFrhUoCy+vD5
	pWQu345Tn67br7CePKUFr0tcdtZ1BT/5kTK/jpO413S1NBryVRtCOxvMAgQJ7d2tJDpKlGXRvDWKl
	K3zsVNS559ZHy7QAQ1aRGsRqlnPCKf4k7glZQhRvZhzI33kTPk1yh0AFYNylMPvf34RZwFUvVe1ST
	92FBErMrovxxezNvg6Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPGj-00000004ujd-3j50;
	Fri, 21 Feb 2025 09:24:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPDA-00000004twv-0hdi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 09:20:45 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L6x42g002702;
	Fri, 21 Feb 2025 09:20:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nIrFihGCxximWuYDb1lhIE
	vQ6LYJWGGxztqcAsIqSc4=; b=GLdqKr/ghK3wG/mstC/Nsfc6jAm2k82Gpof4RG
	g98DVy/aLNm5zZE63AXyt3LFXbUZSkfGYNLFQpMSipBGXi3i9xOVTXnV/lIdHeiV
	eC3cKRyMbJvuvum5cXhGNkQ9rSrwmfEE0xYy274Ot9n6mPBmQER5yZAElUbwBzZ1
	3Z6wySMyREdArBN28tYsR2MzzmZ7+y3hIXuHY7+RVTOPNT2/vjGvB7+dvATq8t3D
	flQJH9CEoi8k76jaIus1yIFd6xTJsfy+rga9mJM/Qm61nkf5eABrm9pkB+DN1Xw6
	vUmTsRYqPnn1ehzW/6HRqKRvuiub+ZvM5kqtHfKtZGyw4jVQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy2hdvh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 09:20:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51L9KXPn030748
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 09:20:33 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 21 Feb 2025 01:20:28 -0800
From: Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH v5 00/10] Add support for videocc, camcc, dispcc and gpucc
 on Qualcomm QCS615 platform
Date: Fri, 21 Feb 2025 14:50:11 +0530
Message-ID: <20250221-qcs615-v5-mm-cc-v5-0-b6d9ddf2f28d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAExFuGcC/x3MPQqAMAxA4atIZgO1GFGvIg41Rs3gXwtFkN7d4
 vgN770QxKsE6IsXvEQNeh4ZVBbAmztWQZ2zwRpLxtoKbw5NRRgJ9x2ZsZ262i3s2o4JcnV5WfT
 5j8OY0gf3dg0XYQAAAA==
X-Change-ID: 20250221-qcs615-v5-mm-cc-8b94afca89c5
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-aa3f6
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -ogHBi25dwJnY2W1fFopbkQ1SBHXJLL-
X-Proofpoint-GUID: -ogHBi25dwJnY2W1fFopbkQ1SBHXJLL-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_01,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_012044_219885_52A45DC4 
X-CRM114-Status: GOOD (  12.20  )
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

Add support for multimedia clock controllers on Qualcomm QCS615 platform.
Update the defconfig to enable these clock controllers.

Global clock controller support
https://lore.kernel.org/all/20241022-qcs615-clock-driver-v4-0-3d716ad0d987@quicinc.com/

Changes in v5:
- Update ARM64 || COMPILE_TEST in all Kconfig to resolve kismet warnings.
- Fix sparse errors in GPUCC.
- Link to v4: https://lore.kernel.org/r/20250119-qcs615-mm-v4-clockcontroller-v4-0-5d1bdb5a140c@quicinc.com

Changes in v4:
- Drop patch Update the support for alpha mode configuration as this
  patch was picked - https://lore.kernel.org/all/20241021-fix-alpha-mode-config-v1-1-f32c254e02bc@gmail.com/
- Update the bindings to include "qcom,gcc.yaml" [Dmitry]

Changes in v3:
- update PLL configs to use BIT and GENMASK for vco_val and vco_mask for all CCs [Bryan O'Donoghue]
- Link to v2: https://lore.kernel.org/r/20241101-qcs615-mm-clockcontroller-v2-0-d1a4870a4aed@quicinc.com

Changes in v2:
- cleanups in clk_alpha_pll_slew_update and clk_alpha_pll_slew_enable functions [Christophe]
- update PLL configs for "vco_val = 0x0" shift(20)  [Bryan O'Donoghue]
- update PLL configs to use lower case for L value  [Dmitry]
- Link parents for IFE/IPE/BPS GDSCs as Titan Top GDSC [Bryan O'Donoghue, Dmitry]
- Remove DT_BI_TCXO_AO from camcc-qcs615           [Dmitry]
- Remove HW_CTRL_TRIGGER from camcc-qcs615         [Bryan O'Donoghue]
- Update platform name for default configuration   [Dmitry]
- Link to v1: https://lore.kernel.org/r/20241019-qcs615-mm-clockcontroller-v1-0-4cfb96d779ae@quicinc.com

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
Taniya Das (10):
      clk: qcom: clk-alpha-pll: Add support for dynamic update for slewing PLLs
      dt-bindings: clock: Add Qualcomm QCS615 Camera clock controller
      clk: qcom: camcc-qcs615: Add QCS615 camera clock controller driver
      dt-bindings: clock: Add Qualcomm QCS615 Display clock controller
      clk: qcom: dispcc-qcs615: Add QCS615 display clock controller driver
      dt-bindings: clock: Add Qualcomm QCS615 Graphics clock controller
      clk: qcom: gpucc-qcs615: Add QCS615 graphics clock controller driver
      dt-bindings: clock: Add Qualcomm QCS615 Video clock controller
      clk: qcom: videocc-qcs615: Add QCS615 video clock controller driver
      arm64: defconfig: Enable QCS615 clock controllers

 .../bindings/clock/qcom,qcs615-camcc.yaml          |   54 +
 .../bindings/clock/qcom,qcs615-dispcc.yaml         |   73 +
 .../bindings/clock/qcom,qcs615-gpucc.yaml          |   66 +
 .../bindings/clock/qcom,qcs615-videocc.yaml        |   64 +
 arch/arm64/configs/defconfig                       |    4 +
 drivers/clk/qcom/Kconfig                           |   38 +
 drivers/clk/qcom/Makefile                          |    4 +
 drivers/clk/qcom/camcc-qcs615.c                    | 1591 ++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c                   |  170 +++
 drivers/clk/qcom/clk-alpha-pll.h                   |    1 +
 drivers/clk/qcom/dispcc-qcs615.c                   |  786 ++++++++++
 drivers/clk/qcom/gpucc-qcs615.c                    |  525 +++++++
 drivers/clk/qcom/videocc-qcs615.c                  |  332 ++++
 include/dt-bindings/clock/qcom,qcs615-camcc.h      |  110 ++
 include/dt-bindings/clock/qcom,qcs615-dispcc.h     |   52 +
 include/dt-bindings/clock/qcom,qcs615-gpucc.h      |   39 +
 include/dt-bindings/clock/qcom,qcs615-videocc.h    |   30 +
 17 files changed, 3939 insertions(+)
---
base-commit: 50a0c754714aa3ea0b0e62f3765eb666a1579f24
change-id: 20250221-qcs615-v5-mm-cc-8b94afca89c5

Best regards,
-- 
Taniya Das <quic_tdas@quicinc.com>


