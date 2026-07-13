Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8F4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 14:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+RBNDWpZ0ECEPwpAEHCXeSOceBEtakk936rxO1jOWpw=; b=c744fnNoI11Bf8MiaiI2KTwQ6G
	EOlK13/+7G0RVgfSX14zpN+qtUeenHCnkuMOJpbjRUKgj/DrsfxBWsI4LnK9Xsb8JNheYKdpjnReN
	f/WivAp0RpD9DLFlAfFBQnw9C3yyuNUkmuuIoSmD+esHVTJ7cVhIvyGKIHfn/gIaQF2uu6QxEqjtn
	BX/Xp/FqpdLindKCW2T5hXX2rAqI1lvhd5ox41joKl6HEz6jrLP1KqdEkzmZcxrzNfeIuYuVXiywA
	DWzjcjaqHnyXI9eRq0RZtCdZ7hK2eRXwERM+5+RR95AhPnJ7EvHqzC6F/lWb+M2+WqhcntFgPU7BG
	AmIxgCAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI4Y-00000009fsE-1R6N;
	Mon, 13 Jul 2026 14:55:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI48-00000009fVb-3pIt
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jul 2026 14:55:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+RBNDWpZ0ECEPwpAEHCXeSOceBEtakk936rxO1jOWpw=; b=iL86rKBKmKA/8uYq5Qf5hkHo60
	9BKqmlx1sEQ9w8XuNHo8yJrgjvw1TH7S3m8ru7CRTm4sQW+rkGRXWS7MHEoInhcRCkF2VBZ5oY08u
	BjqpwbO0Pv1dNF1tqYJkXPV6gpV05tcozthZzxsALO/kOTHSPaOz2ZbR2RSCZx0eUrfrq+huF1Uqp
	fdaRslEoJg6QJe9yM2Q4vQx2EIFT+jK93XFIG9quRX90iuwHZmqBcfmSsReLmauky7wALSK4F9IfY
	zItW1DIXDqxTH0uVd3KN5/MI+KciBqvaNvGly/sCLXM9OynJr2tG+y914fHdopvH0AvV8uDnhXXbd
	nmXO8OHg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjI43-0000000Bjuf-038p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 14:55:27 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCEB9Y1429201
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 14:55:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+RBNDWpZ0ECEPwpAEHCXeSOceBEtakk936rxO1jOWpw=; b=hnVlKmxnXPMktPQm
	yk+j1bTsKNGPKreQoVJyWZI/ztaKVl+Ut8GfBihC5lBvInp+KDtkC2twuPxM6qXP
	KCP8vKxoAzeYtn9k8ajpbo2hYYSU7W1ZnL9pME2qWyV0SgZHoBv5obpTE9t3WJVs
	N79RNddngnMcn+/UNmdcOBZanpXOPEqZw1FsscxRGGH9gi4m9VMnErj1C0TbhJeV
	q25dyT0/VhNThOUFN8ntuYiQY92PdtrrbQxLd4EvdqETLmLAX02QUD0WonTP9Cqd
	Pq48ZODrm9HvvVB0Dr3k/2UzB778ujlRLhuQnMPt3AGekDMNpY6/D9wIcA7xCBcM
	Nmz6sw==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcurn1p11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 14:55:21 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6a38164d9d5so2402375eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 07:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783954521; x=1784559321; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+RBNDWpZ0ECEPwpAEHCXeSOceBEtakk936rxO1jOWpw=;
        b=Uii8WossMxzZWg2GEY76NYbhtTQz5Gnu/jf2p7fydRtAQufmroMzZbgoPhAbECHZzP
         llxHEjDr7qRUBERp4WL10h2c1eEIYM4FPYZOXON9jf4N0QtNAiNboewInNYKl4vvqjXr
         ZpnY+9CwjHbc88S8F5TKiVZzrjMIpvG7p7zUKHwxNYKcvqBGEniWstjbFmDq1xT7duIE
         RMyjTxV8BlmOp2BNOk7OuP130cpm3Z4o5HRPqMRK0iLKis/rDeioIZ9xmqmh75hjjwKE
         dc+QYkHL8rFyZtJJYc8u9xhsrr1ZGLRWDLsHEkRLnAfCxdFnZ7Z7AOu6LAHU6XoAbL61
         c9jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783954521; x=1784559321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+RBNDWpZ0ECEPwpAEHCXeSOceBEtakk936rxO1jOWpw=;
        b=CCyQbmj8hvuYsMJrpWif85VYXeSyICKo9TKh8JQLRcVSGQ2gu4gsKdddSCi/pKbjdE
         Glfv4zirRsFyNOOnBIEV4j0ZSDUvPikojAG4tB9v4jo5YIvRL4aODWj3HgCr6SC2J6oc
         3RkD0lPtTdAF7MsCPRtZEmFtTkKSIbvmK9AUE6OyS73Emr9hVQlAeZeDaZ+ORhEv09hx
         WsGI9S3j6TnZ7p0Lu3EFTw0XQD2GkSKAI9ZCerLJuFUPfzDD6g4Wa/W0PHi4HE4W1rb0
         V0/KFlALCSkhfk0NqQBbZyPqDuXOT2LEbUdqy20Fmj12WOhEiZYIxnhlBNy6m8C5LENC
         9dzg==
X-Forwarded-Encrypted: i=1; AFNElJ8/lF24bAQPn2mQ7+y69r16oCzHqs82IXpphqOY/3nzu2Orsv+J9sNtAm/1OCtjGz1FiGecbWqsGflneNtr520I@lists.infradead.org
X-Gm-Message-State: AOJu0YxXhlJsWmUjnMU6+wlbqRMkZBr621jvwyo+6YqAxoRG9AOdOnPs
	mNRMxkd+oW/r983NL6rOheqt3ccKrQL1YF9dp2blPotZgSsJUzVmiKCTMzkGlCzyLMGmjgiTwVK
	NJvsJs7QsMMaEIjaAAQ58NEUvONgg78XeLLooBuPWNIknIAB1HLzjWIf8YL0+CNjTJeFcKGbRs8
	HmAA==
X-Gm-Gg: AfdE7cnJgwiWwMdm64iyVYZMZQBb7CWSKf6E2lZfOnMzWsEBb5C081U5jkSh5FW86gK
	aeW53FLwP0Uqjkx4vu9UjbWEHzuIEdMHD+DGN6gXp8v17L51fbPx7+oYJAEYmfjA0ojo1fGiS3h
	XzVo9a9Nk5hjMJ/iXI7bOEvhRRVhbRU5U8w6tUvGVWFXsi5vB0ETtqMObXlPdwC37HD2O/mgOcQ
	z0stozniImyR8XRV+rJc3B0gmTb+soDwXEIs+eHzwyPB29Y0eG4XWHn4QxPoC5pc/R3UJ1kLdFU
	cdUhLeuwTHUtqe7eNnCtvzajCVVBjFyB9ZdaQDDmQFDE9FxFR5pqM1CqKAUkMRp9CzLRiVxQHBP
	l0T1wx0Z2PMCXegSrapfdtBzOaNQGcxIyBt8=
X-Received: by 2002:a05:6820:134a:b0:6a3:c52b:b95a with SMTP id 006d021491bc7-6a3c52bbe58mr48666eaf.29.1783954520784;
        Mon, 13 Jul 2026 07:55:20 -0700 (PDT)
X-Received: by 2002:a05:6820:134a:b0:6a3:c52b:b95a with SMTP id 006d021491bc7-6a3c52bbe58mr48636eaf.29.1783954520268;
        Mon, 13 Jul 2026 07:55:20 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a38e9bc8casm6728746eaf.2.2026.07.13.07.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 07:55:19 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 20:23:48 +0530
Subject: [PATCH v7 10/10] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-b4-eliza_mm_cc_v6-v7-10-4d91bcef50eb@oss.qualcomm.com>
References: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
In-Reply-To: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: 2OasmHHRDzVu4OU4a8OiaYT2tt_ZhV1F
X-Authority-Analysis: v=2.4 cv=IcK3n2qa c=1 sm=1 tr=0 ts=6a54fc59 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=nFpjIs4uCRy3fSY36ugA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfX4d4Gqdmv0Yna
 cehWB3ECltVpm0AuUpK9q0yLVKatRljq/ggzOWNjpV5Pzx2HdDJqOw+8lerh2ay+yEdvfHnAIe/
 mucqVVLSn5ZnrVWZCwRae9XD7I42Tqk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfX6LA8szXhZ7a8
 j77h/VkRXd1VEYG+unOag1OflBoqMQPmp37rzg26C34G+chgQp4wnPnh0+zhiNwxEk73M2tP2ga
 HX/MUqMW6c41DxhGe4ggo7QQowLBgpKzaN7f6RlCjNee71+6daTJUYwGbWcg2vy0gr0/kFMES3H
 OVJhBQX1MBmUyx7nFgmZkyX1Zjj9D4iJU4zIVfPTU3fgSvDErDacZfuCE0KKYTcZMEffkjLuY8D
 HlBWpTvtARlhZDCwm/jLIMMz9B+EAFYTVa2MMx6wMNTmTal/ITw+RcJJf6tVjeVIu03HyxjIe7N
 a0T4LghYn2kMLUuTR5yKw2Dp4vFZYJyPNaageWQPXpvAi+iGh2qnwXvJF0d3/VX7gThIk3RPwKz
 IdUv9UQQPIEE9p5nI5sS4KkZ2dmq+/rOKrgvfjIgYtxDnHem9dcnfFZLs67ZTXwjuvYAsxITkxi
 TBOR5uT1e5s51iuJv0A==
X-Proofpoint-GUID: 2OasmHHRDzVu4OU4a8OiaYT2tt_ZhV1F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_155523_434647_BF520577 
X-CRM114-Status: GOOD (  14.50  )
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
 arch/arm64/boot/dts/qcom/eliza.dtsi | 76 +++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 977de44b816e4295dba89ecb77c6df60f6f08d15..fed88a699fc264cc49e0bda79870a8dfb0b6c7f7 100644
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
@@ -1779,6 +1783,24 @@ aggre2_noc: interconnect@1700000 {
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
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,eliza-mmss-noc";
 			reg = <0x0 0x01780000 0x0 0x7d800>;
@@ -2657,6 +2679,60 @@ mdss_dp0_out: endpoint {
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
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
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
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
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


