Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2A8E6B240
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 10:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SN6JiXbW9V9Kobi8fjRJD0yQuzKXgICEkBYFv99i56c=; b=kpORVjf/eYNw9X
	VF0Fzl+2iBlKyp3TfS9h347UZDCTA6hEyA5RJ8WIb/oLGaFlEFply0t9IK0juYh7969eyjcHfdZKx
	pgC4vbk06fVRxt+H1SZZbwKLv2juqHz+N8DWy0VofCnK9VBM/UvCqzT3vRHRy9Vk7tEWOjOq8LexK
	E+SNCGc9oxWKylxGZcVWrd4gW+I2dUWIQ1BHkrnR9LMHoc90RhH/gZMRoss76ZNc5D2g6nkcCAoFc
	EyQj02mkqSBlSeNTQZ1TTJO389Jh2a96B+M76wOCPs9KDZmtPzmiLqTNO9VDVKYoCW3Ss9AjXatPT
	yiCP/h3Og5mf4XjgC/Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6p7C-00000006d0G-3XwA;
	Fri, 01 Nov 2024 10:42:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6p3d-00000006bzY-0JsB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 10:39:12 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A14cHOE020853;
	Fri, 1 Nov 2024 10:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SN6JiXbW9V9Kobi8fjRJD0
	yQuzKXgICEkBYFv99i56c=; b=m+Jb0RIQTSfaCt97mhmzbGEgcokgnuSSbQeFaz
	ZZ9fTqCwu0CK7W4ddHSqAGkM2TMZzRu3Irogb2k1g2u3GBQbcFpgNOTsOwnE67Wc
	qf7X1tetUma+LbwKW8q3ZZUL/Tz8QNPuTAAbDtBhMekzFEYGZr/Dnuab0nv7iOab
	Ip8qfBhRXSrZR0TpuMzHkPDgUnw69XKvkUJAtZ+REsW2ZXe8DLs64YSwzCYVTUOg
	3XbPMJ2oYO2uBGDJ6dnRahxZuiDy8op1/y/T7Md7xEJ8S6Glsa+MXCAanq8gSPJm
	a9WTAu3VY55gHLuqwZ2rj/2eh1x9HXO61m/Nw5bSO9svkSMA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42m1rpmqcc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Nov 2024 10:38:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A1AcXIq026178
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Nov 2024 10:38:33 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 1 Nov 2024 03:38:27 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH v2 00/11] Add support for videocc, camcc, dispcc and gpucc
 on Qualcomm QCS615 platform
Date: Fri, 1 Nov 2024 16:08:12 +0530
Message-ID: <20241101-qcs615-mm-clockcontroller-v2-0-d1a4870a4aed@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJWvJGcC/32NQQ6CMBBFr0K6dkxLsARX3sOwqMNUJkILLRIN4
 e5W1K3L95P/3iIiBaYojtkiAs0c2bsE+S4T2Bp3JeAmschlXiipNIwYtTpA3wN2Hm/o3RR811E
 AtLYyZEojpRbpPwSy/Njc5zpxy3Hy4bmlZvVef9bqj3VWIKFAe6l0U5YpcBrvjOxwj74X9foJB
 Upr5OlbW9cXcqptpdkAAAA=
X-Change-ID: 20241016-qcs615-mm-clockcontroller-cff9aea7a006
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Abhishek Sahu
	<absahu@codeaurora.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Gabor Juhos
	<j4g8y7@gmail.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9PutL6uBVCED1XaNiCZk5eSxxrKDuuAD
X-Proofpoint-ORIG-GUID: 9PutL6uBVCED1XaNiCZk5eSxxrKDuuAD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1011 suspectscore=0 spamscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411010076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_033909_161062_4F1E97D1 
X-CRM114-Status: GOOD (  11.76  )
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
https://lore.kernel.org/all/20240920-qcs615-clock-driver-v2-0-2f6de44eb2aa@quicinc.com/

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
Changes in v2:
- cleanups in clk_alpha_pll_slew_update and clk_alpha_pll_slew_enable functions [Christophe]
- update PLL configs for "vco_val = 0x0" shift(20)  [Bryan O'Donoghue]
- update PLL configs to use lower case for L value  [Dmitry]
- Link parents for IFE/IPE/BPS GDSCs as Titan Top GDSC [Bryan O'Donoghue, Dmitry]
- Remove DT_BI_TCXO_AO from camcc-qcs615           [Dmitry]
- Remove HW_CTRL_TRIGGER from camcc-qcs615         [Bryan O'Donoghue]
- Update platform name for default configuration   [Dmitry]
- Link to v1: https://lore.kernel.org/r/20241019-qcs615-mm-clockcontroller-v1-0-4cfb96d779ae@quicinc.com

---
Taniya Das (11):
      clk: qcom: Update the support for alpha mode configuration
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

 .../bindings/clock/qcom,qcs615-camcc.yaml          |   60 +
 .../bindings/clock/qcom,qcs615-dispcc.yaml         |   73 +
 .../bindings/clock/qcom,qcs615-gpucc.yaml          |   66 +
 .../bindings/clock/qcom,qcs615-videocc.yaml        |   64 +
 arch/arm64/configs/defconfig                       |    4 +
 drivers/clk/qcom/Kconfig                           |   35 +
 drivers/clk/qcom/Makefile                          |    4 +
 drivers/clk/qcom/camcc-qcs615.c                    | 1591 ++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c                   |  172 +++
 drivers/clk/qcom/clk-alpha-pll.h                   |    1 +
 drivers/clk/qcom/dispcc-qcs615.c                   |  786 ++++++++++
 drivers/clk/qcom/gpucc-qcs615.c                    |  525 +++++++
 drivers/clk/qcom/videocc-qcs615.c                  |  332 ++++
 include/dt-bindings/clock/qcom,qcs615-camcc.h      |  110 ++
 include/dt-bindings/clock/qcom,qcs615-dispcc.h     |   52 +
 include/dt-bindings/clock/qcom,qcs615-gpucc.h      |   39 +
 include/dt-bindings/clock/qcom,qcs615-videocc.h    |   30 +
 17 files changed, 3944 insertions(+)
---
base-commit: 15e7d45e786a62a211dd0098fee7c57f84f8c681
change-id: 20241016-qcs615-mm-clockcontroller-cff9aea7a006

Best regards,
-- 
Taniya Das <quic_tdas@quicinc.com>


