Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3212CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 10:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hSMJbr1PGvgD3m2WqZy4NZpdMn7GQjSQRsHMugwc/oI=; b=AjwFV8fQaSeSnK3O+dvRWnUiWF
	L+9EUYSd3aiXNgQJINWIZuPg9lCUfXgnXV65SK4R+tIBEqr/rSiRRMpg+qRgqPts5ghvkaXoT7vav
	G1s56JUxDYfahkdPdtmmbALfO6Kjn+7NZBuv+baT8+rp4q1v/lfqQzvNUclgCnP5G2Qgt0UOFTqbb
	GhG3sp59vbiKUnkz+rvqKyRfE4Fcq9MI0jJhS4KauBM/lcuq9KL/Dg/XKn5ZVsur2fvkvBEFMJiAF
	N8EKqgTIQ9SXeKRFXabySWUgcfZHKiEM7jAfJGRBmjuT8ILmNhcwrmBql6nn2ydngSWbZKRDkX+Um
	onSUuMtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRSpy-0000000Gymr-1Evj;
	Mon, 25 May 2026 10:47:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRSpu-0000000Gykg-2fwQ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 25 May 2026 10:47:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=hSMJbr1PGvgD3m2WqZy4NZpdMn7GQjSQRsHMugwc/oI=; b=j6dT+cEANtJ77TAfTKThoeIx9c
	savTJeYQ73eWwN9d8iIPdAB1b/aF5WxFzPy39maO04GhVYbvIuokuA/Csa0CSeoXYi+EdgrVTK7xR
	P/OLGpgTDriVlgmMW+Ttvebi12CwhqldADa2DIyl0tI61tEJnIE0rJAkFuxkaIQCDtwg4bwsItoUU
	KodLCMuu46K6fepZ95Dr7pglhJeRIANHLaB40q20LtAcAAaLHgLSzwjQ031jVzOfF1OLuDwjGITNv
	ICkfoFMdXlcLHaybYbe3aKzIL0sWaxIEUJt7ANoYdn4R7u+kE+xbi/AJ7IKoDnuAq6bSWSYfK5+36
	QEQl7DaA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRSpq-0000000923H-2zNr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 10:47:05 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7aKxe1871835
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 10:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hSMJbr1PGvgD3m2WqZy4NZpdMn7GQjSQRsHMugwc/oI=; b=YPCBmmv1j1oD2Rzs
	9KFYS60zUJ+4ap74UyWpRcQKuJtpnlXowA94aQIzNm7BXU0KpLlcZekyszuEGenN
	+aHtYHyXffKyjOSsOXX3kLtgsaGCJfBdT7pM/SQjy0bZkDuHRVli2VuPhubJSlp1
	0ugp5ZkSdHQBHWQxvdvuUSp2tLL0WzAmD5ib4csuQg0rZt7Y5uyzZAVcKiLe+C+v
	ieBG/l0GOXPLPw/ad1icgL/ZBUtSugp2Q/7oJQLn3c0KDQQBXUaR7GABUZ2BC1pj
	T7O+YyuTBy3Ah47U9QR+M/gUmaaaU5RuCELfRbxogxTCeIQVjk3UKozVa8pzhOXH
	7Yqkwg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ebba0wgvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 10:47:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bc6899bfb1so98195965ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 03:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779706021; x=1780310821; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hSMJbr1PGvgD3m2WqZy4NZpdMn7GQjSQRsHMugwc/oI=;
        b=R5gaCZ8gzGVqk4EKK39Vg7XITXr7OCmkuhFWXs12sk1yehg05B1JBDQcgGmueWxfoF
         OByJXhQVInBXpiDxrwKRk+KYjSaa7aol/iHdyJQG/SNaMBSch1jjW+tmFos4aNCY1XJV
         6nsQGUnic6WF9YXrsxxyVnBqQqoqX7Oq8uTYOBjnR5GmKGqbYnjtwhlraVh4mrXVBFod
         gtCbVSrdVJq25w/yBnNIflklnmv/hcPcwp/6bQgkb83ZrkSjjkANanguWqK68BFVChqT
         I/qadW8YIBn44JHxThD49n2/19PD/BKnIVpa9jFTmKS0E7TVe2eoeFyH5X+kmOQwjx4R
         tKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779706021; x=1780310821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hSMJbr1PGvgD3m2WqZy4NZpdMn7GQjSQRsHMugwc/oI=;
        b=i7dvfXGVVfaTBxPKGc+MTWX/g4dPItcW7VjurR+nTfgrHAv4q9B5IcfSDDXyW3n8VQ
         dnWxg1VXB4/rHJRJdSrIO7zKsC/6f3E+MgmQj9VmwGGd/Oo/qnn/xcsgjjvk7DuQ8i/l
         87PEFNGYHKx7cWCMYIGufV6aGeWk4pfbsMOCML0aAQmRactKj10A423vl4vgn6xdSZhF
         Bkv+rz9eIDuY38+e3OO1rn7AEhFXU+dFmzDgoekqQh21CQVpcvMeR3XIX7OFuU+lHteo
         V+B4waNNSxAKNa7D0qKBF+YjauEWZVAQTFi99N9tNjwQGkI5raWt2V3p9Aa2KU6I6GSu
         bq0g==
X-Forwarded-Encrypted: i=1; AFNElJ+xonBPRtEkDzmgZyLQAQBi/taxoUILgTuP8U8/2SzcdCCLDSjMu37L0KtFO5YZioWMQXvsWc2g1fyF1+/pPVIw@lists.infradead.org
X-Gm-Message-State: AOJu0YxcFtLzQOFC1ThA3hgbAf7jUBxeYydEdhnildOA9M+ITh9UUxdR
	9tSKqGELWMoTkNCIuxw/bxb27ryJYe0jdqCsfmvP61Wczv7RhtmNLLX7F/JfTO9+VJqUOeN3DqE
	izJyt+MGMp30NGZXLSQfqjzvZGKEpx7wY95JyrEFfGaEE32iTL5KHLuE4EByv3YdUF26xI/0so9
	fIEw==
X-Gm-Gg: Acq92OENd/F2nzAHZrAW57eWv5HD45+6YT59+BhQiXQYJ3Yz98lA3CoCtxFaP6gXa4i
	KUtTjtJMBD7QWjskYgLyMMD8cf0ThOPFw0OCSTYS1SVMpDihPR8/Y2e2n915V4ukhWYXoG//Y8d
	K9i00/kFTbgMFqXq5MnPojb9WaY2cnDDuebrSxziKe+LvawudiHfdA/sFpy+7NfU9u1hE+IV+8v
	jPaVO9CFs6FM04pyBNUyOXTOjOSN0/9VqqkC0S7fgF/ghJOpaHkXnlxmvFmWT3fgJxIa8Nkzv/W
	G+DSg8l9tbMTzZkK8qP4jZF7myTerFOFJD6pLqXnuAir7JFHNHsV0ymDNMCqtLb8S9ZAWyqBDgp
	P2u7eYBo885uyDVUQwiXC4C9utBEGiqIxLsxO9y3bjeDEZQ==
X-Received: by 2002:a17:903:2c04:b0:2b4:61cc:37a8 with SMTP id d9443c01a7336-2beb037a5ebmr150819475ad.17.1779706020571;
        Mon, 25 May 2026 03:47:00 -0700 (PDT)
X-Received: by 2002:a17:903:2c04:b0:2b4:61cc:37a8 with SMTP id d9443c01a7336-2beb037a5ebmr150819125ad.17.1779706020078;
        Mon, 25 May 2026 03:47:00 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb591f63dsm118666175ad.83.2026.05.25.03.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 03:46:59 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 25 May 2026 16:16:09 +0530
Subject: [PATCH v5 7/7] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-eliza_mm_cc_v2-v5-7-a1d125619a5a@oss.qualcomm.com>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: khoGN3RExizXug-KDwT1YSoSSEsPzi6E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEwOSBTYWx0ZWRfX2psUxY+Y9rlM
 O/TORkqBmYzBTOE4nzPYH7QuyrYmI9BOwyLDrMx7h4SnKQ5auVEhvXHUbvQf544DYf/AVcRKY+s
 he2qtHj+qBLt9MvihlqOEALp6vBGU3+ZmfiYe7ZIc4oRKWXEZleORiCqMw9SIMmYCRydYQe6XjJ
 FBy43O17Mc+wuCB3oPHZrrycY70l9mlgFzzOB8HDMKXF4Gjja7PJLkk74ZfhrdgHpan1ouW4Vqv
 g4pmAJXptHbFQ3nhLTCnq3Doky7OElbZZmxnHJBVWQCfiW75Z1o7LjTjyKPeqNu2oGVNESnMrlb
 bbYh/BoFLl5TB9uRJVlmRw2ufNCoKfoofE42s8cxg039on1PiSCWzx985APUEmGFWJKFzDl5mZO
 TYhUPeOpLqUwCvb50BdtQWeTmYajAIHqMNfG9MhuZq0+g06NSn2gJ3QCy1cc9lKBHKq+3E2hTU3
 uf7PDJ4h5cIq2YUDBmQ==
X-Proofpoint-GUID: khoGN3RExizXug-KDwT1YSoSSEsPzi6E
X-Authority-Analysis: v=2.4 cv=Xca5Co55 c=1 sm=1 tr=0 ts=6a1428a5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=nFpjIs4uCRy3fSY36ugA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_114703_476681_8FE60DF3 
X-CRM114-Status: GOOD (  14.05  )
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
 arch/arm64/boot/dts/qcom/eliza.dtsi | 61 +++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 4a7a0ac40ce6252a138bed06c7c190ada3ea61a3..88673e7b2a5f0b38675aea517daceed9c3f9a386 100644
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
@@ -709,6 +713,19 @@ aggre2_noc: interconnect@1700000 {
 			#interconnect-cells = <2>;
 		};
 
+		cambistmclkcc: clock-controller@1760000 {
+			compatible = "qcom,eliza-cambistmclkcc";
+			reg = <0x0 0x01760000 0x0 0x6000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,eliza-mmss-noc";
 			reg = <0x0 0x01780000 0x0 0x7d800>;
@@ -862,6 +879,23 @@ tcsr: clock-controller@1fbf000 {
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
@@ -883,6 +917,33 @@ lpass_lpicx_noc: interconnect@7420000 {
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
+				 <&sleep_clk>,
+				 <&gcc GCC_CAMERA_AHB_CLK>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,eliza-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x40000>,

-- 
2.34.1


