Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB6EF364AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 18:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=90mdpQup8rBx7BL1jnOaOW8ntM6siN7SFRLLyNJz170=; b=SmIwhhkVQoWwSlHcOYPierskb4
	eL9gO0FB98NfoVLoPKDaEWNDwSYo6p9969ZZJGrDEUDSRddnrdm6TYO5DSElEpPRCwEKxPv9cHocZ
	bbSWauHz3n6SFME++w7SSU0pJnXuOfb2DoDifW0tpWdkGSQJQD889TRzPTWXDfJ53plbz1+AZQU95
	keqCbUUlFn26+8HyAiwjjo3+YmoHC9xJQpqfxKScfy+kdaj7kHED1KNsAxuQs3wgtZYwP20Cke49W
	HqE0f6+7iJ96C7eY5ggHqxTPdUYajBM1MwnjZlNvD2ZWZsN6IcnyKQ8khk3ORx4s4ErEWzngSi0Zc
	yLAId0Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAtrB-0000000B480-3bSH;
	Thu, 09 Apr 2026 18:11:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAtr6-0000000B44t-481u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 18:11:56 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639CfF842867026
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Apr 2026 18:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	90mdpQup8rBx7BL1jnOaOW8ntM6siN7SFRLLyNJz170=; b=XHt5epio5cFRDWxq
	HkwPdJj1EDoY160Mj5/L9CiczSF99rZy+kQQrAw/5KOLGJMJMxmvQB5rb9NkeUP1
	mIu1l0w4X5UlkSKIPzJ9RMcxtmmSLIz8Vj26Llcy1dsC0tCpIiVQK4eJzKEek8D1
	lXoaOm+y99rz1qMXEZynoelqBzg9y3+lgN2HT6yZaLd46Ess3+2Rn2Kov6PnRGrl
	Hk1nTSBqtF3A+QGY21/qXYL0rldoGSNRmweb007b74ZqAY9iZvSNVp0BoSZz4WMq
	glvdOs1wpv8npsOtMYnHilgLXtiv9xa9w/kJ/jQIrwNBio9Xksyxrdozr86dqTHQ
	TfCbXA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decayha5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 18:11:52 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c76b6d4337bso973567a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 11:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775758311; x=1776363111; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=90mdpQup8rBx7BL1jnOaOW8ntM6siN7SFRLLyNJz170=;
        b=KRiYOQAl8My/g1HfWAV0g0mu1DlM9bELzo6bbyFNqfIf2x+X7PNOSgS2fSAtsPTuok
         oIQwjiEkY22tyvfmPfdOl7Bg/sznKtigD+6HkOic0BazC0osBH30/1R6lhhIDXAafH+3
         o9OaUY3nT+bf53ZrMqIfBjE6OInHffoXF/W+rjBHw+rlWRH6VkXXbRzPIdWr1Dy/Du+F
         1iIu/8jru5fM+JaoO8PhTfJK6dj2MUyPUK2NLrbSIA2tHGKF2bxzpnFN5VOaYrggKEcT
         uhTxX8cAM+exXGMyoz9iRlGP1jrrQsHiODB07+XE0Jp0AIARAReA5xx++dm4K/SnN1VG
         VwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775758311; x=1776363111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=90mdpQup8rBx7BL1jnOaOW8ntM6siN7SFRLLyNJz170=;
        b=GsQPsctqtbz01VGC/C2RrfuD+zUdnYVGn4H8dD8E84/q7NfFmzgs8u9xepD0mhc0hF
         cRP7X0psyT9Cv4N+31w74YuSP7JCActgeYLlPLAFho5LjyFld5PDQNwpHyZsPMlOQSMh
         cxj8oQ73VjFQ/o0fDKRGysGza2slZP5vXV/cjc5e4qUoZFRyB+waPR/4KX2TqJ1TL+Dm
         HA39OBlnBUCHEKE7gryZ+fdXXbvunDkXarNO5a6qgYZKxxOd0oCG47iv/DSOWlmGYVMW
         ruVF/d9wGfICwXMF0fLyYRMdaXM/gigF3HOB/2//HqUUvQaN/wC+xNd7FgrsW8C1PlgL
         FsWw==
X-Forwarded-Encrypted: i=1; AJvYcCXWSYn3hyJi7JtCw68GN0gl9VRTF9KvOg/XLJKb6wN53usI2vvNMhtlaUQa0IrzsKpEQSX3V2ghBEKJXAT//LNj@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0FZpG9CUWjBJcCnXJXUtNQA6jOyV5/H+IasrkLE58B0mqzoGS
	M9L34nLwe0+/gCAY5pqDihC+AWV6mEm+XNtgPDFSupDmh5HrLeWwoz8KkMcnWJAI1CjQN0+3ySz
	RMQBLpZIaxlIsVjfCe57bVRFiOBpQotWkZm3nHY5OGMXRNJA1xANFdyTNlbXtP4NsYBrBVWN0Fu
	Q7xg==
X-Gm-Gg: AeBDiev5zruov1jt8rGUyoMNeps9FEzElw6zb269WFbkT9CQ3m3U6iUjYLVS4pj0e4p
	SiXe4ZG3iHmMVjB1BIEvM4rFg+FHqVgRRNEzRY2CvM6HTGEpFBteERG3a1+/Y65U58MeSDiDUn8
	KkJ+2tqR7Eq7BeE6UPx+paLqkjaLgavF0L2/te+0aoEiAagrzIaTX64wJ3h5iGCg2okWVikRyCE
	Ixn0LIIby0KbhtWvNSHVeJb42+bVkrhjfr7BzqhGH5VGdAlq5kzCCRJV15DROSS8RA1kgOxfCm5
	Y3woocASqVzQbb8NI+V8tX9AuPiNn3Zz1cBUUb7KOaOaRhKYXb7/VMP3jtBS7jT0k0GIHOlWLn5
	mdIMyarGto/WUOJlSQLlJCH8RojlC51rcgPwEm2idb4aiEQ==
X-Received: by 2002:a05:6a20:e291:b0:39f:461f:be7e with SMTP id adf61e73a8af0-39fc8342976mr5438785637.44.1775758310714;
        Thu, 09 Apr 2026 11:11:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:e291:b0:39f:461f:be7e with SMTP id adf61e73a8af0-39fc8342976mr5438739637.44.1775758310061;
        Thu, 09 Apr 2026 11:11:50 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7921a2d9ebsm66132a12.30.2026.04.09.11.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 11:11:49 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 23:40:49 +0530
Subject: [PATCH v2 8/8] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-eliza_mm_cc_v2-v2-8-bc0c6dd77bc5@oss.qualcomm.com>
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
In-Reply-To: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=XtnK/1F9 c=1 sm=1 tr=0 ts=69d7ebe8 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=lLqgR-C0kdikbQ7S4h0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE2NyBTYWx0ZWRfX51kpvDeBJeH7
 cSqQLzaI0uf5irTN5WR5B9H+l4df3uXI2L7lFGpinTHmLmo6cHaVMTlfffuXgthSgFqOqUUXzEe
 0Tr2XkLpMJHAZHatARfPBOTiaZljd/UHiMp56zYzxnV8cHtpgiB0IyqPsFmUWY2WbNetqrQwXHf
 CtOa9sj/YR1tXubKiC+eQRzSxspzDsxW/PZKAXOvDrhGH/XDLs+UjJwHCHimUNqWsjKmEZ49kMR
 xRps/PJYSQaexWTmS9t2e43HwWFPEI0N4t04Nln8B0tnwAxAsWJ658EP5vLHK+VYqgFot1NZOEl
 yqdkMtVw4AmHCeMdUvOBqhX3YpfFxubCyHejAhEnNYtzhTbGXXUtf1pv1/KL23erPlluZRg1SKM
 fuNhCXnFDFyUdd4BT6sLsstO0PCkS1VTPYaINB1s7qtam/1xR7bPxV2HG+imA13vgMsiGu1McH4
 Xr5Y+KFwQcF2ZYKWDNw==
X-Proofpoint-GUID: OZgDDOklrZBJ_JMor0ni6By8Alogwj8i
X-Proofpoint-ORIG-GUID: OZgDDOklrZBJ_JMor0ni6By8Alogwj8i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_111153_038636_83AA4F7E 
X-CRM114-Status: GOOD (  12.87  )
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

Add the device nodes for the multimedia clock controllers (cambistmclkcc,
camcc, videocc, gpucc) for Qualcomm Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 54 +++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 4a7a0ac40ce6252a138bed06c7c190ada3ea61a3..7a2a3dba86b9395743781cdf724e81733140ecd0 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -709,6 +709,18 @@ aggre2_noc: interconnect@1700000 {
 			#interconnect-cells = <2>;
 		};
 
+		cambistmclkcc: clock-controller@1760000 {
+			compatible = "qcom,eliza-cambistmclkcc";
+			reg = <0x0 0x01760000 0x0 0x6000>;
+
+			clocks = <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&sleep_clk>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,eliza-mmss-noc";
 			reg = <0x0 0x01780000 0x0 0x7d800>;
@@ -862,6 +874,23 @@ tcsr: clock-controller@1fbf000 {
 			#reset-cells = <1>;
 		};
 
+		gpucc: clock-controller@3d90000 {
+			compatible = "qcom,eliza-gpucc";
+			reg = <0x0 0x03d90000 0x0 0xa000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_GPU_GPLL0_CPH_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CPH_CLK_SRC>;
+
+			power-domains = <&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_CX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		lpass_ag_noc: interconnect@7e40000 {
 			compatible = "qcom,eliza-lpass-ag-noc";
 			reg = <0x0 0x07e40000 0x0 0xe080>;
@@ -883,6 +912,31 @@ lpass_lpicx_noc: interconnect@7420000 {
 			#interconnect-cells = <2>;
 		};
 
+		videocc: clock-controller@aaf0000 {
+			compatible = "qcom,eliza-videocc";
+			reg = <0x0 0xaaf0000 0x0 0x10000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_VIDEO_AHB_CLK>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,eliza-camcc";
+			reg = <0x0 0x0ade0000 0x0 0x20000>;
+
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&sleep_clk>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,eliza-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x40000>,

-- 
2.34.1


