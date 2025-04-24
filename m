Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B93C369D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 10:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mPqt+xfp2s1fsDQEEdS7k0oYUNBPR+x/s2Z7vl/A9mY=; b=KpUaUWeykSu3AV
	wsvrwN8mY+/CwC97AT2vHHmlQ8uw8hjtd69SAh2AGnKuJuetD2NFpcD4CARRxNnLnasEPk0db0nM/
	xq+PHeGr7uGjdSxTjXWwv27LBaU1TNNWWoT2JWpTaTAOzNVC3GKTxJm099FlOfBvTl2Kc2Mdz1K4u
	oJmg6jd4P2l6lLjW84HWR6xqE3+BEyavfi/jNzmIHGa/2AAH0ULLFEOEQhvZ+a73iehhIyjccMriM
	1UxguoAaK5TwnbR+51dm7KU6a40B/zALddMCuB9nYdipiYyoQG0wR/mlt9Wdtcm6FTdGSqYPLmr7r
	I3mKzYHQ0TfwOpUOr2hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tRk-0000000DbZS-1IWB;
	Thu, 24 Apr 2025 10:04:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7sxi-0000000DW0Q-2sGO
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 09:33:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=mPqt+xfp2s1fsDQEEdS7k0oYUNBPR+x/s2Z7vl/A9mY=; b=F9t7Lwidpen5F15NVtRD79jkRR
	R+S3X/tJPXxgRKfkTO+ukG70E9vMSx4WDkDw01180syYtZJiMu457xcDDGi9mMhs0ZKsjrwDsVCml
	Lv10hZ7S3MuWHYcEIygj8dXaruKkQ6cmKujsYOgGe9s8AFEoIdFDTVc4Db3CDr9INj9FQoJfgi37M
	4d1lB+lzkocLRxWGj83BDZTLVLpcwQ/nU13H74XZgHHwJG8OZBmLl0CZwTyqyie6JfH5SrglbYaO6
	PCgfqaymzGwT1y8E6Qfdd/qOBpDG4jr/qCzT7pPg5mQ/rYbvIqsa4/f8lfiZbw7ks+v3agyixr4qY
	sDNQQpRg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7sxf-0000000BgX2-02Rq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 09:33:41 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F6uh013087;
	Thu, 24 Apr 2025 09:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mPqt+xfp2s1fsDQEEdS7k0
	oYUNBPR+x/s2Z7vl/A9mY=; b=VRE5mO+3eZbTOoICed3+I903eUDxd5nRBQR4eX
	0QxUFyLtGdqiu1iQn9tjh+0lU00AeOuK144vnXu1V3zVZiP5II09NFZdmveWQ35f
	9TkVSPWHpvSux4C1N0jK79JZFr4IXIUrdAE8I40zNpbyTm1IXuYPDTNhKWzBbDuK
	fDVj2PE87nOastKXDiJre0/eb8OhkBDCXJ7DG+w8fqzoy8vC8tTHjktFPpG4h7Rz
	DwEJM9OkNG72lsA0YSnZaSx3+kXB5AUf44nRjwq2a2uGAhsRiRrL5lO18Ll7sTXw
	NB1gBm5nUdiwapObiz3blq4K9Mt1TifMunKrY1vDgdOdr4SQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2d0gd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 09:33:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53O9XQ5N008858
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 09:33:26 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Apr 2025 02:33:21 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH v8 00/10] Add support for videocc, camcc, dispcc and gpucc
 on Qualcomm QCS615 platform
Date: Thu, 24 Apr 2025 15:02:55 +0530
Message-ID: <20250424-qcs615-mm-v7-clock-controllers-v8-0-bacad5b3659a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEgFCmgC/42NSw6CMBBAr0Jm7Rig/OrKexgWdBxkIrTSItEQ7
 m71BC7fW7y3QWAvHOCUbOB5lSDORmgOCdDQ2RujXCNDnuZlWmQFzhSqrMRpwrVGGh3dkZxdvBt
 H9gFzbVSjlCl01kOMPDz38voNLm3kQcLi/Pv3W+uv/TsdZYpsOtOw6nTF+jw/hcTSkdwE7b7vH
 y4MBiHOAAAA
X-Change-ID: 20250414-qcs615-mm-v7-clock-controllers-29b3833b491f
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<lumag@kernel.org>
X-Mailer: b4 0.15-dev-aa3f6
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AsdnDS3SHYvf9YrzeMn77c4SGr1p1SM5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX7DleNoiMVZhm s5KMAOwmgyYV8/r2FXXSj8mNFJoUpZ5C+toNGZHqIONeqLYeB20HXocXArqzZQDcUkgNDdkleNg bCGqQrI6sumnJTzjtprE//efVIIN71Ep/onvwF4DVqTkd+B6LLNTnSe5nmVGvAhi2CrGYFbZj4R
 bXaq8g+DaRhqxiyhrasuzRK9IiIpq4SvZ3pLStPhczn1b9mTbwCL7SG7DJAbADCHy4TdLdaPRLy y+mBngsbSBs94ICcww3/k9ZStrZ4c5G54vv5bZYyVNL5ExzJuJxMjHm9A+Kjp+eZz4keq9eZLab dVM4N+hMVfIHrejOI1uw5bWXPJUfDWTafeGnbvFbT+B3PCzn0/Va3e7T5gkTLg0KlOBu25rsP2j
 3bWpGSpcHRcdoEGdKTeTy/vqELayQYigwaScP4Z1fHnIAkLxsy5S5ln71NfG6PVZ5JaN+aUj
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=680a0567 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=pGLkceISAAAA:8
 a=qvAcXBSyIl58lO48RIsA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: AsdnDS3SHYvf9YrzeMn77c4SGr1p1SM5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_103339_480939_D0ABF63B 
X-CRM114-Status: GOOD (  15.38  )
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

Changes in v8:
- Drop the properties which are already covered as part of gcc.yaml [Krzysztof]
- Drop the RB tag for dt-bindings for Camera clock controller.
- Link to v7: https://lore.kernel.org/r/20250414-qcs615-mm-v7-clock-controllers-v7-0-ebab8e3a96e9@quicinc.com

Changes in v7:
- Update DT bindings for CAMCC, DISPCC, VIDEOCC, GPUCC to remove the
  common bindings and add reference to "qcom,gcc.yaml" [Krzysztof]
- Fix the following in the alpha pll code [Bjorn]
	- double space removal in clk_alpha_pll_slew_set_rate
	- fix the alpha_width from dynamic to 'ALPHA_REG_BITWIDTH'
	- cleanup the programming of lower/upper_32_bits of 'alpha'
	- update the comment for 'mb()'
- Link to v6: https://lore.kernel.org/all/20250313-qcs615-v5-mm-cc-v6-1-ebf4b9a5e916@quicinc.com/

Changes in v6:
- Remove wrongly RB-By tags which got introduced in v4 and was carried
  to v5 as well.
- Adding the reference where the tags were added and dropped.
  -[01/10] clk: qcom: clk-alpha-pll: Add support for dynamic update for slewing PLLs
    - RB-By from Imran (v2)
  -[02/10] dt-bindings: clock: Add Qualcomm QCS615 Camera clock controller
    - RB-By from Krzysztof (v2), drop wrong RB-By from Dmitry (v5)
  -[03/10] clk: qcom: camcc-qcs615: Add QCS615 camera clock controller driver
    - R-By from Bryan (v2)
  -[04/10] dt-bindings: clock: Add Qualcomm QCS615 Display clock controller
    - Drop wrong RB-By from Dmitry (v5)
  -[05/10] clk: qcom: dispcc-qcs615: Add QCS615 display clock controller driver
    - R-By from Dmitry (v1)
  -[06/10] dt-bindings: clock: Add Qualcomm QCS615 Graphics clock controller
    - Drop wrong RB-By from Dmitry(v5)
  -[07/10] clk: qcom: gpucc-qcs615: Add QCS615 graphics clock controller driver
    - R-By from Dmitry (v1)
  -[08/10] dt-bindings: clock: Add Qualcomm QCS615 Video clock controller
    - Drop wrong RB-By from Dmitry(v5)
  -[09/10] clk: qcom: videocc-qcs615: Add QCS615 video clock controller driver
    - R-By from Dmitry and Bryan (v3)
  -[10/10] arm64: defconfig: Enable QCS615 clock controllers
    - Drop wrong RB-By from Dmitry (v5)
- Link to v5: https://lore.kernel.org/r/20250221-qcs615-v5-mm-cc-v5-0-b6d9ddf2f28d@quicinc.com

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

 .../bindings/clock/qcom,qcs615-camcc.yaml          |   43 +
 .../bindings/clock/qcom,qcs615-dispcc.yaml         |   55 +
 .../bindings/clock/qcom,qcs615-gpucc.yaml          |   49 +
 .../bindings/clock/qcom,qcs615-videocc.yaml        |   47 +
 arch/arm64/configs/defconfig                       |    4 +
 drivers/clk/qcom/Kconfig                           |   35 +
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
 17 files changed, 3873 insertions(+)
---
base-commit: 01c6df60d5d4ae00cd5c1648818744838bba7763
change-id: 20250414-qcs615-mm-v7-clock-controllers-29b3833b491f

Best regards,
-- 
Taniya Das <quic_tdas@quicinc.com>


