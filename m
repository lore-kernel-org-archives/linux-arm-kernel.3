Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB2ED39403
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 09:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1t+cSXgbPOtugAcLyoc7h7gL+0nsGdMe61/bSuxOYW4=; b=2ON8bfPrlz2RT5w9twNlTPBZmR
	+SGtjCdUiK2N4MD8+ZJkOdapyDiV4ZUG6b5NqQrGt1jYDGsp7n7N/hQFfuQXDlprLZdLl2PpsZYDI
	KtAze0lN1zCgA8MGfPbXQ0NYcwDoeyfKePEN0Ja3ooEJemR0BSb49f5Ujqjp8wDMbPFThQ1a5XRag
	7AXcRfeUxHQLU3iadS0xrKIoiNkGIH2ditUffcKdtv0Hm/iCD6a1nf1gEM4uaM4jP2fqtjgDFx0Pj
	qcjaAbUmc84uT6q4iG2VF7+hTCJhLviWy0WupNIlgJ4ie3uCyP32JLnyM+GnBiBWl8tbAorJeXLrC
	fI4z0gsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8EhC-0000000HIn3-1WnI;
	Thu, 02 Apr 2026 09:50:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8EhB-0000000HIlo-0k5V
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 09:50:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=1t+cSXgbPOtugAcLyoc7h7gL+0nsGdMe61/bSuxOYW4=; b=oVco53uS2+/uD/JHDL94TWTS8R
	Shw6W9yO6Nc4qBjr1BOghasWKu/iSoD8osBlVSGV7w037fxUbTUROpEOtwcJCdHkHhej17XLAkCz8
	XNGDex9x3ftKFYgRcn8xwsBcXa8CdFmGnfhZZ7gBvH8qpHnZ9o7FhGgWhtlwXjTGW28oQhlWmjEn3
	KiUXL6v0vuIh5V5xGUcunWYi+ai9tojAp0mJYtDyjsZmScaelz0Tx608yp8GoIelTao+/ilVtGHX0
	O6Foecdq61HzAreEzh77SfAR5cVZVxmvyuz+b91wCgHVVYFx4SBrWS5NEpS9i6Oy9ZQGYaGoUOd+w
	TcGarRHw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Eh7-00000002AEC-2iD7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 09:50:35 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6326BuGJ1965398;
	Thu, 2 Apr 2026 09:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1t+cSXgbPOt
	ugAcLyoc7h7gL+0nsGdMe61/bSuxOYW4=; b=VMxNaDSXpNEOGop9XUOKKfzV4+J
	TIRspHK+wBXE2DkuPisH4iDkRZumDoviwrUq1k3RBi2RxTtSHwAALchnW9HVzJ6Z
	1Epq/sJtm51/dRuPupXQYdo5GO6qewrW+/x+4N5/JCc4EdjFjRYLbtUFONamVLiY
	EX7YA+caua0KliQ2JSIW+CEgq4bqwgTWrOlbsaK3X6jLJKtGnAI6FU3OqtqabWGe
	BdaiUy0wfvrRAu+wR3rCMta+ZLegmqSZiWl4vFiPyfzlga7BM1ngnSGkd7XV8Hga
	sixIZDpHuCuvQHFiLZX/ce5C5sf4rkFrgAg2DFlBc8phtuXd+Znd0klEYQQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9b9h2g36-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Apr 2026 09:50:20 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6329oGj5004381;
	Thu, 2 Apr 2026 09:50:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4d6qk2m86n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Apr 2026 09:50:16 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6329oGat004361;
	Thu, 2 Apr 2026 09:50:16 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mkuntuma-hyd.qualcomm.com [10.213.97.145])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6329oGwc004357
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Apr 2026 09:50:16 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4582077)
	id A8CFA3E5; Thu,  2 Apr 2026 15:20:15 +0530 (+0530)
From: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
To: dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
        swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
        sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
        alex.vinarskis@gmail.com
Cc: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicinc.com, Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: [PATCH v5 1/3] arm64: dts: qcom: lemans: add mdss1 display device nodes
Date: Thu,  2 Apr 2026 15:20:01 +0530
Message-Id: <20260402095003.3758176-2-quic_mkuntuma@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260402095003.3758176-1-quic_mkuntuma@quicinc.com>
References: <20260402095003.3758176-1-quic_mkuntuma@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=TqLrRTXh c=1 sm=1 tr=0 ts=69ce3bdc cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=QB79VSau0zwNiicQFnEA:9 a=mKziBQOQ0kVx0287:21 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 0VPfT5Yq6xN2QhzJQjdji1q9iyh9m8dE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA4NyBTYWx0ZWRfX4YKMDC0wnLOg
 fxJ2p28Gbce7pSA8D0mq2OpFY/RBVT6hP5VmGv+QXPjX6BQRWea/2Wk8bb/yRH3QeZEuA/dV20W
 iLMGxPwGuzJS3BL79mfAnz9qAvd/A4eKYI03J94LIeaYVOggNiYbbAKwqJZkCZHspPi1D8+tPPq
 M9JL0r3/R4WGJVwL6ptmGspDWBXSOHCc+RRa1gMNBhYzKVLxGKxTBnT/rzf97tKFGpARZ3dBzTl
 nWQho76jZfbj0pU/IcCxTbJcoePgNaXmgfEiJjKS4SCg7qLRB9QLP1eN34u0SgDzETn59GDwNA/
 HoznJwTd4I83DL5Kp5jS4Y/hTVtQ+vpDP2+HMkdVplfinLDa+j1tTo4gkapYc0+b6BLtM+UpHJs
 rv1Knf/X859cT+iDUrgGgPIMMFwrA8wYxaP6RT6PHGlLkYRjqkPQAv0D99jXWLV8zCAqNEkudy4
 dskJ9FHuwVHHA9l1gXw==
X-Proofpoint-GUID: 0VPfT5Yq6xN2QhzJQjdji1q9iyh9m8dE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_105034_108175_8A527872 
X-CRM114-Status: GOOD (  12.11  )
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

Add devicetree changes to enable second Mobile Display Subsystem (mdss1),
Display Processing Unit(DPU), Display Port(DP), Display clock controller
(dispcc1) and eDP PHYs on the Qualcomm Lemans platform.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 289 ++++++++++++++++++++++++---
 1 file changed, 262 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index bc0ec9a80284..4e608bd6486c 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -5474,7 +5474,7 @@ mdss0_dp1: displayport-controller@af5c000 {
 				phys = <&mdss0_dp1_phy>;
 				phy-names = "dp";
 
-				operating-points-v2 = <&dp1_opp_table>;
+				operating-points-v2 = <&dp_opp_table>;
 				power-domains = <&rpmhpd SA8775P_MMCX>;
 
 				#sound-dai-cells = <0>;
@@ -5499,30 +5499,6 @@ port@1 {
 						mdss0_dp1_out: endpoint { };
 					};
 				};
-
-				dp1_opp_table: opp-table {
-					compatible = "operating-points-v2";
-
-					opp-162000000 {
-						opp-hz = /bits/ 64 <162000000>;
-						required-opps = <&rpmhpd_opp_low_svs>;
-					};
-
-					opp-270000000 {
-						opp-hz = /bits/ 64 <270000000>;
-						required-opps = <&rpmhpd_opp_svs>;
-					};
-
-					opp-540000000 {
-						opp-hz = /bits/ 64 <540000000>;
-						required-opps = <&rpmhpd_opp_svs_l1>;
-					};
-
-					opp-810000000 {
-						opp-hz = /bits/ 64 <810000000>;
-						required-opps = <&rpmhpd_opp_nom>;
-					};
-				};
 			};
 		};
 
@@ -7055,6 +7031,265 @@ compute-cb@3 {
 			};
 		};
 
+		mdss1: display-subsystem@22000000 {
+			compatible = "qcom,sa8775p-mdss";
+			reg = <0x0 0x22000000 0x0 0x1000>;
+			reg-names = "mdss";
+
+			interconnects = <&mmss_noc MASTER_MDP_CORE1_0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_MDP_CORE1_1 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "mdp0-mem",
+					     "mdp1-mem",
+					     "cpu-cfg";
+
+			resets = <&dispcc1 MDSS_DISP_CC_MDSS_CORE_BCR>;
+
+			power-domains = <&dispcc1 MDSS_DISP_CC_MDSS_CORE_GDSC>;
+
+			clocks = <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+				 <&gcc GCC_DISP1_HF_AXI_CLK>,
+				 <&dispcc1 MDSS_DISP_CC_MDSS_MDP_CLK>;
+
+			interrupts = <GIC_SPI 865 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			iommus = <&apps_smmu 0x1800 0x402>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			display-controller@22001000 {
+				compatible = "qcom,sa8775p-dpu";
+				reg = <0x0 0x22001000 0x0 0x8f000>,
+				      <0x0 0x220b0000 0x0 0x3000>;
+				reg-names = "mdp", "vbif";
+
+				clocks = <&gcc GCC_DISP1_HF_AXI_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_MDP_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+				clock-names = "nrt_bus",
+					      "iface",
+					      "lut",
+					      "core",
+					      "vsync";
+
+				assigned-clocks = <&dispcc1 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+				assigned-clock-rates = <19200000>;
+
+				operating-points-v2 = <&mdss0_mdp_opp_table>;
+				power-domains = <&rpmhpd SA8775P_MMCX>;
+
+				interrupt-parent = <&mdss1>;
+				interrupts = <0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dpu1_intf0_out: endpoint {
+							remote-endpoint = <&mdss1_dp0_in>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						dpu1_intf4_out: endpoint {
+							remote-endpoint = <&mdss1_dp1_in>;
+						};
+					};
+				};
+			};
+
+			mdss1_dp0_phy: phy@220c2a00 {
+				compatible = "qcom,sa8775p-edp-phy";
+				reg = <0x0 0x220c2a00 0x0 0x200>,
+				      <0x0 0x220c2200 0x0 0xd0>,
+				      <0x0 0x220c2600 0x0 0xd0>,
+				      <0x0 0x220c2000 0x0 0x1c8>;
+
+				clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_EDP_REF_CLKREF_EN>;
+				clock-names = "aux",
+					      "cfg_ahb",
+					      "ref";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
+
+			mdss1_dp1_phy: phy@220c5a00 {
+				compatible = "qcom,sa8775p-edp-phy";
+				reg = <0x0 0x220c5a00 0x0 0x200>,
+				      <0x0 0x220c5200 0x0 0xd0>,
+				      <0x0 0x220c5600 0x0 0xd0>,
+				      <0x0 0x220c5000 0x0 0x1c8>;
+
+				clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_EDP_REF_CLKREF_EN>;
+				clock-names = "aux",
+					      "cfg_ahb",
+					      "ref";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
+
+			mdss1_dp0: displayport-controller@22154000 {
+				compatible = "qcom,sa8775p-dp";
+				reg = <0x0 0x22154000 0x0 0x104>,
+				      <0x0 0x22154200 0x0 0x0c0>,
+				      <0x0 0x22155000 0x0 0x770>,
+				      <0x0 0x22156000 0x0 0x09c>,
+				      <0x0 0x22157000 0x0 0x09c>,
+				      <0x0 0x22158000 0x0 0x09c>,
+				      <0x0 0x22159000 0x0 0x09c>,
+				      <0x0 0x2215a000 0x0 0x23c>,
+				      <0x0 0x2215b000 0x0 0x23c>;
+
+				interrupt-parent = <&mdss1>;
+				interrupts = <12>;
+
+				clocks = <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel",
+					      "stream_1_pixel",
+					      "stream_2_pixel",
+					      "stream_3_pixel";
+				assigned-clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+						  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+						  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>,
+						  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK_SRC>,
+						  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK_SRC>;
+				assigned-clock-parents = <&mdss1_dp0_phy 0>,
+							 <&mdss1_dp0_phy 1>,
+							 <&mdss1_dp0_phy 1>,
+							 <&mdss1_dp0_phy 1>,
+							 <&mdss1_dp0_phy 1>;
+				phys = <&mdss1_dp0_phy>;
+				phy-names = "dp";
+
+				operating-points-v2 = <&dp_opp_table>;
+				power-domains = <&rpmhpd SA8775P_MMCX>;
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss1_dp0_in: endpoint {
+							remote-endpoint = <&dpu1_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss1_dp0_out: endpoint { };
+					};
+				};
+			};
+
+			mdss1_dp1: displayport-controller@2215c000 {
+				compatible = "qcom,sa8775p-dp";
+				reg = <0x0 0x2215c000 0x0 0x104>,
+				      <0x0 0x2215c200 0x0 0x0c0>,
+				      <0x0 0x2215d000 0x0 0x770>,
+				      <0x0 0x2215e000 0x0 0x09c>,
+				      <0x0 0x2215f000 0x0 0x09c>,
+				      <0x0 0x22160000 0x0 0x09c>,
+				      <0x0 0x22161000 0x0 0x09c>,
+				      <0x0 0x22162000 0x0 0x23c>,
+				      <0x0 0x22163000 0x0 0x23c>;
+
+				interrupt-parent = <&mdss1>;
+				interrupts = <13>;
+
+				clocks = <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel",
+					      "stream_1_pixel";
+				assigned-clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
+						  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
+						  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
+				assigned-clock-parents = <&mdss1_dp1_phy 0>,
+							 <&mdss1_dp1_phy 1>,
+							 <&mdss1_dp1_phy 1>;
+				phys = <&mdss1_dp1_phy>;
+				phy-names = "dp";
+
+				operating-points-v2 = <&dp_opp_table>;
+				power-domains = <&rpmhpd SA8775P_MMCX>;
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss1_dp1_in: endpoint {
+							remote-endpoint = <&dpu1_intf4_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss1_dp1_out: endpoint { };
+					};
+				};
+
+			};
+		};
+
 		dispcc1: clock-controller@22100000 {
 			compatible = "qcom,sa8775p-dispcc1";
 			reg = <0x0 0x22100000 0x0 0x20000>;
@@ -7062,13 +7297,13 @@ dispcc1: clock-controller@22100000 {
 				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK_A>,
 				 <&sleep_clk>,
-				 <0>, <0>, <0>, <0>,
+				 <&mdss1_dp0_phy 0>, <&mdss1_dp0_phy 1>,
+				 <&mdss1_dp1_phy 0>, <&mdss1_dp1_phy 1>,
 				 <0>, <0>, <0>, <0>;
 			power-domains = <&rpmhpd SA8775P_MMCX>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
-			status = "disabled";
 		};
 
 		ethernet1: ethernet@23000000 {
-- 
2.34.1


