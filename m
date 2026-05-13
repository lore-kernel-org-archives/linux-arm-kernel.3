Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC43CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 14:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bv9MTFIgK7RFKHc7n/KdA9PcHAo8/akOMScX0ExYt74=; b=JUI4kt7g18crpM1LeLe2w0VP/x
	lcw6n60VUFFEcuwmBlKSPAkImcqO65oIoOMM0Ui8wSj0NWrmayoZnLdC268k40qMNjTm1IqgjAVUI
	4K5VqkoujMhnAnTohU/a2ciNG9WwAyPi/DpAjItRbZTJOscWF3ORknTAnnKE1oySnO2eVN80yHKc3
	2VEh3pjfa3qMvKAKykb/Gwq5bM5/3BgbaigXJmDyIEO8yEDdybSBIYx4qEVNEKd8Q2mBlQk/vxO8s
	bMzeNylh95Bbumbz2ouM/YE94NNcfo+YrcSyudJtFs9jU+mMw76ZbqHdKBigNdXTmaHza4RRnwRrI
	XzfZ5xTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNAVQ-00000002uXz-0xe1;
	Wed, 13 May 2026 14:24:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNAVL-00000002uUR-1ShQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 14:24:08 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8wpo44159634
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 14:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bv9MTFIgK7RFKHc7n/KdA9PcHAo8/akOMScX0ExYt74=; b=JmUl7uW1J5WFqGSX
	6F3nvyG9fAV3nWnhsroFhEN66SRZt/4N1PuJC85Ju8bMOAn3dQNcvhaJk3qkGDKK
	TS/D24r78CfTndlo7pqmSy0uP4xXuAfGRFv1ouh0Bs9NuNj77NPlSYjxyvAIS+Bj
	RvoCXzCW1i/YRpKATkw+gzu7VJKDnJdQvBx6Nb9iuKpaCJSToMn2OAKO9qevfkFo
	MAj5B0wYpu/sbtkMDhKOUsIL5Yw7phm5/KH3BFMqLckAASVfyAezgB/FVBr+mfiL
	CSVzJ/HBxLTGOxdAT5USJ852rb1u9yzz7SHZp/3BPlaiMriiZaTKDx0pGugTglvV
	IKM1jQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91s7u8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 14:24:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2e8bba2e6so89064935ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 07:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778682246; x=1779287046; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bv9MTFIgK7RFKHc7n/KdA9PcHAo8/akOMScX0ExYt74=;
        b=jG6dOLDp4t5IBD3lOnh534eh1cJc4kc8a3SXq4C6h+Kk8K36Mkk3fBvA+n/nFpAUzB
         1K0I1Olw7FyHtxYYgYIa8TssvszTpRvoT5jQYgklvSv36ZUWFT4LaCh2WgBJ0ygH+VY2
         nRQCo0kxfP1BgiTkamVKXckxPUSm+l5OEjdqW0dNl7pXBvZoApareEgZe7fuqwjsRCY5
         CW7ajdXx2s/elFVBexOCzJrl6UrqIn3SiiHVyexE6UcZB/jquS4NxV1oDU738xqfiKWt
         HVuNGe+SHylBu5vsoQZJj+O9dIzO0ta+kDn0XIp0kJGI08P6c5oWb96o56wQf6+aYa91
         6HAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778682246; x=1779287046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bv9MTFIgK7RFKHc7n/KdA9PcHAo8/akOMScX0ExYt74=;
        b=lTIY3cgr0MPurNvturAxp9jLvW8bpVWdoHBG1H6BCbdqccElsDL4Gs2bqUD2tGHWDa
         i6a9sunWapcc7fkM9u3vzOMfG8GvtEbiutyc1NaAWig8+6nw0dqDFKiVFZX99GEul6RZ
         7Q8J61XLR8RSKcE/WulB/4bxvIHl/QffcN1DHuQF89iVSo1CW84itLjHy3a5E27cDrPW
         d6OGAEHN12hvaOggMl7S/4KWLmJ3xolYtEBWgtfxOAOY96dPlnDUyuiBogBYbHdpFeYz
         /UxUPVOu5kgxu4XU7Ey3w1UpKbAJqJ3ocIGheOX8f2voDWOX0iPv6UjMgmLZLHGhMtDr
         kQfg==
X-Forwarded-Encrypted: i=1; AFNElJ/1+clUMSBI72goI/jXXtpBGgEH9/UBLHJ3FqQBA/6lE5QCOFICqbNtkmIo6MxprmgFSZZu9G3P1FAk1BMpeR/h@lists.infradead.org
X-Gm-Message-State: AOJu0YypnNGi6gkWx/YH/g/DFWwwlEFm0AOUAl5WdUgvnmVrb90vi/f8
	wYSI7uumLy8lWw+tnuH068aChP4HgAvdmDawezShjCcaH+6aQiPqZ6KOLXXmctGocFLuatJg6xr
	lHsnUThTJLHe/FZ61Yv/kSfJO3sZMBNf5tkUmrZXClBbzq3n+Pg38r9iqbj4cTuExq6c8znwu2y
	tDNw==
X-Gm-Gg: Acq92OHNNw7uJvn8wFNobc7gnYvdK0Gf6TEFGzjVfoZxMmbYhKUeTmydPnXrodtLPMP
	LU1GYH2sT1B6q04qfVRAfI1LPTAaJq32NUT8OUuK5E3GORCS+FMa3QB//m3WL0UVNnkGoVHhLU+
	27aUsjjLzsHq1mQ8mK07XRJ0jqlAZZpDwua5Ub79ntx5eq0dQz2Co6F9MmS7RNZ43r507WLMYgF
	sA1qdYitZgFq5tHLygAFAM0B6MN/gsFvFwU1th1JLFirUg2KukpbB/zSecRELTrD35VI4i23ISF
	8um7MnZDwCBNUsjNnUDzoCLcwQVsK4/LuM0/01eNu8dNR/kz8nW006wIk3puXrAW83SS4FUnUKw
	9q61GphKmnjNX2fiJkgz8VPd/b/cVZ/1CaO+4pm/4AC/l6A==
X-Received: by 2002:a17:902:f650:b0:2b2:4d36:7aa with SMTP id d9443c01a7336-2bd2772e10cmr39657445ad.35.1778682246222;
        Wed, 13 May 2026 07:24:06 -0700 (PDT)
X-Received: by 2002:a17:902:f650:b0:2b2:4d36:7aa with SMTP id d9443c01a7336-2bd2772e10cmr39656995ad.35.1778682245716;
        Wed, 13 May 2026 07:24:05 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d40427sm179296105ad.24.2026.05.13.07.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:24:05 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 13 May 2026 19:53:12 +0530
Subject: [PATCH v3 7/7] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-eliza_mm_cc_v2-v3-7-b59c370dc281@oss.qualcomm.com>
References: <20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com>
In-Reply-To: <20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: ZDeciU31IlzKdrhSvqiyA3qomSAM0Hts
X-Proofpoint-GUID: ZDeciU31IlzKdrhSvqiyA3qomSAM0Hts
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a048986 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VHfLmW6ThCf22OJDftsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0NyBTYWx0ZWRfX8CJGt1ch9vdH
 2XvatOHZzBPWc5VDuxd7rEF9kcc0TjpWMCbSH+bZ9FQjUiOKuwOMe/mYu3fdwTiabgZXibzD1XI
 C6bwfNuhV6O984RzRjayN/GEaWXpn6Qt/pkBq9CZ6Xs4yRo3PoYiZp+z9aeVOszZjIwgpDFtXyc
 beM+Rs+b+P+W1U3402NB9ohl8nA29TyC+2Soy1d0yOdMl2J5dtXvbHaUHlwZtas3IxfNDBFKKNi
 Y/ZGE8oVYpk5nVvJZ2JuZqsxle8cTEwxV1GN/tmBcyszaiN3WjhJ4ccmULIZFX1p0xZg96+O6Hh
 j6Tm6kLdGeqUvvAizQVYsPlYep2p4w1MFjnYdEMFivwlpGLdjNz2BPAHGJ4fEr2NmDRbFSFQxmF
 aiXg9IVp8NdxIMpJsRGLspnTTGR9pFFbX0OKWJeVTSepx9tkRJysMmE5Cs740unby5+Zk4L/jym
 M0Aa8kETIxJzatUGDJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_072407_398678_7BD6E5CC 
X-CRM114-Status: GOOD (  14.22  )
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
 arch/arm64/boot/dts/qcom/eliza.dtsi | 59 +++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 4a7a0ac40ce6252a138bed06c7c190ada3ea61a3..07c871c1d4b0b22ccccd7753e8b7af26811c6956 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -3,8 +3,12 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/clock/qcom,eliza-cambistmclkcc.h>
+#include <dt-bindings/clock/qcom,eliza-camcc.h>
 #include <dt-bindings/clock/qcom,eliza-gcc.h>
+#include <dt-bindings/clock/qcom,eliza-gpucc.h>
 #include <dt-bindings/clock/qcom,eliza-tcsr.h>
+#include <dt-bindings/clock/qcom,eliza-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/interconnect/qcom,eliza-rpmh.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
@@ -709,6 +713,18 @@ aggre2_noc: interconnect@1700000 {
 			#interconnect-cells = <2>;
 		};
 
+		cambistmclkcc: clock-controller@1760000 {
+			compatible = "qcom,eliza-cambistmclkcc";
+			reg = <0x0 0x01760000 0x0 0x6000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>,
+				 <&sleep_clk>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,eliza-mmss-noc";
 			reg = <0x0 0x01780000 0x0 0x7d800>;
@@ -862,6 +878,23 @@ tcsr: clock-controller@1fbf000 {
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
@@ -883,6 +916,32 @@ lpass_lpicx_noc: interconnect@7420000 {
 			#interconnect-cells = <2>;
 		};
 
+		videocc: clock-controller@aaf0000 {
+			compatible = "qcom,eliza-videocc";
+			reg = <0x0 0xaaf0000 0x0 0x10000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
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
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_CAMERA_AHB_CLK>,
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


