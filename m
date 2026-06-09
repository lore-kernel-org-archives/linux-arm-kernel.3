Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C41CD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 15:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jJceXiho06Og9O7kMeh7deoGHJJPmRDg1rHXj5YMqGU=; b=PsV2azEyvYfdfwNYSlCfPp29Jc
	NwCaGoOFtuOXxBL+WDVa0PgFrQW1snIcZBlubNxnZiTT3t32rtbNTv8wE1G5NeJOjuzgBDBQzMVeG
	83tPEeEBmBhgKQU8PDUloxrWMQpChJzEkhPa5jdbqbWGL/kIqd9Cy+r4bZZmZeZj2uo2d327mMw+t
	TeAtWn7CiAGoZjp//ZBoa04U+dUgvVAh5lY9M2EanKhPEGzX6B4MEta+nD4IZ7Ta8+BM2z1rvmjdL
	f6bMC3wGB53y1C9AWRfLOgJI1aZCNj3/2GlEosppfonwi+cU3CL/y1FUImAD4zH+gxfB/WbnXq9gA
	ycg4jroQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxzp-00000005quG-3u60;
	Tue, 09 Jun 2026 15:04:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxzo-00000005qt4-33wv
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Jun 2026 15:04:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=jJceXiho06Og9O7kMeh7deoGHJJPmRDg1rHXj5YMqGU=; b=ZdzdxdDnjrekfOG58qHacIcS/6
	qATBVUFsyc0yQ3y8bpjsYUM5gYj2n0XgSJX45f+k/JfR6e/JBlgfDT3s+JYgLX9dKNbx3hc1Aaq1t
	F+Wb4ZFrUiY5uwqBoW0r3RF+Oh6HKJ1rEAc63DoPUv638oh0GI0CTfMxRsnXcH1bCT/+u5oT/70qD
	4GdoZXFrnLZEeks6Oi8JGhiSeEZd6FYN9YUJsY9Zmk5hndsXpWwqMnTAWBR2T/Hu0H97Ldx9KXFJg
	PRbjq3cc7ZnsvmC781/eQpTjke5788OCpTamsDLKbIw9Z0gbvbTbpztw1v1xute71g3WWeejlj+JF
	e4ZJNGQQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWxzl-00000002hIL-2vh7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 15:04:03 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CnLJk2668531
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Jun 2026 15:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jJceXiho06Og9O7kMeh7deoGHJJPmRDg1rHXj5YMqGU=; b=ljIyuDQk9FzaHl6O
	K7gOjQJNj8g4pkgmE2oy+jqjEeOF0kZt1kA7vjugP+XWDux6tWhxK6opWPLIHSDn
	8RPotDBHnJb5W7qNQo6AhyajCSqfcVRB0rweuVrqWE2hDtMUKSCq2LojZ69k8dxW
	PrTVbzlHgs9LD+JAiymYgliKxm1sDkj1VtIQx0yAqgpy1EyIEm8//CF+mwGVdeGC
	C9j4zEuGr4tJT2eYcL1aQhN8rOmDf6+p3hFFqkOovLVB67Pvmj84i4RPUi0oXaKw
	7+BQE+2PagrtuI8nwmPh756efZaRMTiBUKxBDKkvcrMzr1jzyLLSUJj3FaW4JQ9R
	rg0BoA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epe25t69n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 15:03:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d98b828c8so7435009a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 08:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781017437; x=1781622237; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jJceXiho06Og9O7kMeh7deoGHJJPmRDg1rHXj5YMqGU=;
        b=f/IvClPNzLumXmq4WXtiQaxT9GymJxPtMy4IjKowTG9jBoQq+v4jvIQeSvN8L5rHFJ
         ukrUrskX8E9kSmcgpZBv45M2Rz6M40n7OBLEKaHemfnW8+XVzQyNseND10OHzigZ/Evr
         k78vuVbAxAs2J7pv3neVZ4BjiG6EQJxZ2bzbEInrgttWJFeOaNa/ZzLvbIxungpgMcCS
         iziA+6tZ3gTs231Oq+fN/f+kQ61fqNAUEonT5QFPh4Akl/VKvDWbS/pkugbIqLSDqb7t
         hS/x8If5QKn0nYrcA3ZRCDWKcvmiPcevVFXODwGALvU9fRkWOy/7en+ob1WzR+rY/r4O
         qySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781017437; x=1781622237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jJceXiho06Og9O7kMeh7deoGHJJPmRDg1rHXj5YMqGU=;
        b=FVoCrG050w+OhW3APV8l0A13jjrrahow6AXBxok4H70ZYBnrj1PpEGaq6az4lopr7t
         /FdsC1KFflzVIq1m/RUV/plXPaAHug/rWyEQ/obycp/FJUa35Vrt3KZJ8uY81uYyTYV5
         tW/dRS5hqtJwM7rGLXTnmXEc6mJ6QsFlr+GIaZ2Ah5MjJbHN4dg6o1IOTshsp1cD+xNH
         DMZ2erEo59LyLAxkwwOxLPf4+sgduPFt9RmnSmzidnPr3fRn3aXELnBapmSdt+kfPFvm
         8DOhK0HpJ7rUwSr2q6BD+Eo4lk8KsT44eJ3PF3Tpx/9AcOQ5JSQGNjN++K3Zq6DIAU+6
         NPAw==
X-Forwarded-Encrypted: i=1; AFNElJ+kF8lnSQXHMuPmxZlDUin9Dlv+XO4Yjur0ZwrDg/DfzAnt2/sE35daoPPR5My9wRvNLiKjWHz1ZWDhNkV+IBPK@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8a+x/eXf62mKO2C+9nUbiLPHr38Y2IUJbzXqUm3K+s0tygP3P
	AvVNtGKEXbK0jT1y4mFsfqjLPUxoOjHomsLFMsoM2nourutoZj/K/Art0dVNye38U5b3Wigcg+l
	BoMq+cbqK23q8AM2GXarD5AxzOmJdefXIDvDOoOwmKQ19Zc+qOiGqqljhFecDdR/9tHTrILf08e
	vkrw==
X-Gm-Gg: Acq92OFUQUgGd0cuaKOqh/nJ5naiLQ36myH5srMhP0SUj7Cvm+VurujEfngY/cLWc/j
	4qBod4ARIL6wndutIIqAm3uK2MCozfM45JMlKF92DnbgKtvSKqdb/G8ODUsUhy7aqsI29UkU7DE
	g1CWyHs5LEarfbBjdDsesnXj8XXSBGt2Q3mCt8y6j8twYdOi+3RVKdTWUbHTg7UhzXyuzvWjOCY
	T/DTF4jOOoWUiNY1HcsPbs5RGigUxfhsslO+QHwZ6UxojDKjPcKI0PNLR9xOvpRtCHtqHIZcGot
	jUkdwh+88EW+Wn/3CkL7I2/20dkMGmrO8BXP3pyJYBLfTskKS6GbHffajIm6cMMVfohDRAHdwIe
	unzPKyqvFIH2WX9N51SguFTvpTMDiHoqMbQ+jRNxo2uu0lb/TFbaf9Uh/
X-Received: by 2002:a17:90b:394e:b0:36a:aeaf:ab2a with SMTP id 98e67ed59e1d1-370f0d4c33emr26138406a91.19.1781017436510;
        Tue, 09 Jun 2026 08:03:56 -0700 (PDT)
X-Received: by 2002:a17:90b:394e:b0:36a:aeaf:ab2a with SMTP id 98e67ed59e1d1-370f0d4c33emr26138338a91.19.1781017435965;
        Tue, 09 Jun 2026 08:03:55 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828d6bd1sm26987659b3a.44.2026.06.09.08.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:03:55 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 20:32:58 +0530
Subject: [PATCH v6 7/7] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-b4-eliza_mm_cc_v6-v6-7-17df09e5940c@oss.qualcomm.com>
References: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
In-Reply-To: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
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
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: UIHgMNjB_Svsfdl5xtRehts4FwarQHO_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0MyBTYWx0ZWRfXz2DLd0ne6I3A
 YTx8DBZmSppp8F0mhyIlejweJAgjSGjryBg3qmcnWcvBkmgqS0QSDi29xA6boaN83Ij/P0Ag9CN
 46ZWWtb1UAprgDIoSuEEtuJYKUy8/7ssUG/Y7gPyIUXSDQoo1O+qUOWDkGetSCmG1bsI0aDRmDW
 O7XI+NZFITYh3JtE2JUBtJLYwtVxyua3nhvYTpFBLdsmoMQixWOz6rVoKLEJmadDzg5PrZ0Zsfb
 KLWWydDcwt803gB9yXnf1awY8Zwo2fCT1pbUWo9aolaTzm8+sjab6XC1skfXFJOvP3jtGRN8KXP
 JGUwqeMNk8LKp+QmnRY7t4qSHeQjAw/wnVW58DYe9UYFTooCN/97FmZmpcTvFtEVIdAYGfwSS5p
 DA2tiLWpxOjXFqPzfGZM9FDfgVJuUSmZtOiZ90sQb3MoiKwiwE3FCLsUCxmr3aRr4BkeK0ohRXz
 mKRuSgueEvYEEPK1dYw==
X-Proofpoint-GUID: UIHgMNjB_Svsfdl5xtRehts4FwarQHO_
X-Authority-Analysis: v=2.4 cv=LoqiDHdc c=1 sm=1 tr=0 ts=6a282b5d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=QpH9IB84JAnPMoRP7PIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_160402_147509_6F6CC195 
X-CRM114-Status: GOOD (  13.62  )
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 61 +++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 977de44b816e4295dba89ecb77c6df60f6f08d15..c5635f22e2a7a68fe665a5b5236901b17de6983d 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -4,9 +4,13 @@
  */
 
 #include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
+#include <dt-bindings/clock/qcom,eliza-cambistmclkcc.h>
+#include <dt-bindings/clock/qcom,eliza-camcc.h>
 #include <dt-bindings/clock/qcom,eliza-dispcc.h>
 #include <dt-bindings/clock/qcom,eliza-gcc.h>
+#include <dt-bindings/clock/qcom,eliza-gpucc.h>
 #include <dt-bindings/clock/qcom,eliza-tcsr.h>
+#include <dt-bindings/clock/qcom,eliza-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -1779,6 +1783,19 @@ aggre2_noc: interconnect@1700000 {
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
@@ -2657,6 +2674,50 @@ mdss_dp0_out: endpoint {
 			};
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
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,eliza-dispcc";
 			reg = <0x0 0x0af00000 0x0 0x20000>;

-- 
2.34.1


