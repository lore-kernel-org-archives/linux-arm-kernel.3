Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08931CCD18D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 06:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7oBQudR/weydsEbe0yzzrN3yEVj8ux7cDJxdvM4KdKg=; b=r2C0mZAqo4jxeNkE/kV+yTljcb
	EtGwWIwiq8+vaeciFEbTHGBzWRsbDZDhi1Jw40dKPkIx0hOwTYfKoN2kDhyCf2rnDi9+eEhfrjp1j
	1oDgoxDk41VdOGIHnTM8XtVJatOhL3QsvFIQmwUVSkUr0PGIzo5VhJvTamlsJ6YxwrSknzSmSW1oX
	oE4Npf/bif60NHIXyNd4/h8sF1UTkLpm/Ggg2rBygblf1aQZkJcj4kghxGycZbuODlq/K9qyEMUrW
	cQiTENwZoQphT3MP2xKInsRA92KpedToFHTJSWV/Wtva1MSALGDuhb0zlBuZAFIoMNYnrBCyz+291
	VH/HDTXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Bmo-0000000CLWJ-1jA3;
	Mon, 13 Oct 2025 06:11:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Bmk-0000000CLSv-3sNO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 06:11:56 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2nJHE011079
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 06:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7oBQudR/weydsEbe0yzzrN3yEVj8ux7cDJxdvM4KdKg=; b=pWimpRKNPYoaq5Ki
	rCJvjWA8Az/60IAUzdV1kM68e/ogOMfoTaEXBtoYctFFl3z6hoW53KF/8k6nvl0B
	cgwC99TASopYeJN+9C/OYIMYNmVV2evvUy6qNCPtcsFLVfZpXeZQ7zKXXqvoHYE8
	l3HEqIn03LBK+HsgKpAJ88Nsm+IXgFilV9pnlG+oV3QWexLLNQ4VmL0CSHwtaFBG
	0ikkeHqeS3Mhkkgw1aNODZHwFL+A2Nep3ebGP+oALwBrl7lKOqGKI1C41826Uwy3
	BLHoTk5vOtb066geC7dbY+dlijMLvPuCaW3ocRlZ+wrEAJ8DVyhkaoKIdRQ1rRk9
	1JS9rA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0buckf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 06:11:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-269af520712so83555585ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 23:11:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760335914; x=1760940714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7oBQudR/weydsEbe0yzzrN3yEVj8ux7cDJxdvM4KdKg=;
        b=MdtIFQSDPJN2+qd3MWoG7RNDb/1r5dbIFEaXJgST191+b0NnCoxElTpQ6mbqW7KMlc
         olEk/JBo5imm6xFCxR/q7qS3g77zxKfpUfkd+0SeTiR4bFDeFc8pjz6pIR+UAMMwOzEn
         ZYETWfS23vnlpmGxfu1eoT/EmvJc7CdzZWc5NZ9uBosLExMI6BHs0ctUh5QsgVpXf2cn
         mdHqKvXK1Vm2ZnWQN1EYBRKeXubanJvdaEcrbLCgN1YyUisgjHiB4weziKE5Brrgt4Fo
         u7El6+RzL63uhiVfDEDGu+wxJWWTbxmtISsdRdQe51W2PfVOfTM+lZw4/s2YvSFdpRRB
         lOrA==
X-Forwarded-Encrypted: i=1; AJvYcCWvrZtPPjB7UL3X0kcNt7TEPZXbH/sJmjdS1qyssY7Yt0lRIku8t5sE1IAFx0iucYq7wX+0jXM17bbhcWLdsGII@lists.infradead.org
X-Gm-Message-State: AOJu0YxjbCWD8XNQO/Uv3+uquPr0NAeO1u3ed4WIK7BK61FdNRNDbEWK
	FEt7Ssi19Qs8xpE0VINemU/JfxZvI+SZkm5gRxlaC493WtNaCZL3mJ0lPxRfRPFusSwbOx9Cc8l
	gxGmt2XRSv5og0HhJ80Ln3RDAXJA44zkokF58KMOZ7a9SIL15/fwqN3Amq6iaUbLBuBsVA9tVMl
	3NsQ==
X-Gm-Gg: ASbGncuzYQW9HjLj+fs0zqyMr97QsoOPllZa+Iqoi+gdD8drhADqPoHD+TqrKZ7+TZe
	mzZ+i88PsNUYx2vKUVBzX5pZdvguJ/YQg0HW3nPFo94ssokL3pWsTQj1DGEq1WhGAASHhj+NXGL
	yghkk0NTpFAfxnTnvr+0Dfu9YDwQ6URzGP1w8m1yinx3qjZvTtKK/nVhTdLaBwK+6cQN72sb5yR
	O0Wa8hfcrKaMh46Z9Gy63HudHQM6hqctJD9WCyaf4M+B5hzdbaWkZF5z/Od6Kk1JTt05xv9/QHk
	9oikHxg4rGrno7AmZmbvVcNu7lkfsE0r/VCAEexLbBbY+qNndTiZRl4fJyQTA8h3zKVep8fJk+T
	Wy+gKwBlqsxjBNrHW1KfIoZo8jbo=
X-Received: by 2002:a17:902:d483:b0:28e:78b9:5780 with SMTP id d9443c01a7336-29027402cfbmr279748465ad.47.1760335913637;
        Sun, 12 Oct 2025 23:11:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/7dHhAvuvDyMFASfG1nV7vjlwqk+Xg+aNfMfNBr1eV+CjzlR0oXaxFgm2QBXq9baxEEAPCw==
X-Received: by 2002:a17:902:d483:b0:28e:78b9:5780 with SMTP id d9443c01a7336-29027402cfbmr279748195ad.47.1760335913112;
        Sun, 12 Oct 2025 23:11:53 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2904f61a1desm64388675ad.82.2025.10.12.23.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 23:11:52 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 14:11:18 +0800
Subject: [PATCH v3 3/3] arm64: dts: qcom: lemans: enable static TPDM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-add-static-tpdm-support-v3-3-a720b73e83db@oss.qualcomm.com>
References: <20251013-add-static-tpdm-support-v3-0-a720b73e83db@oss.qualcomm.com>
In-Reply-To: <20251013-add-static-tpdm-support-v3-0-a720b73e83db@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760335892; l=3216;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=cM+KsUjm1CT8Q4hIp2dfJ8uGxYpJWqBu6GWePVipu+s=;
 b=niUZtQK2sHWXXqAzI24xd1rCBjQ0KFEZ2P9GaHcYMlWkrf7WJmHFusVPyMcgZ2lb6bdsDJ6JF
 AnEHO6sh9GRCNJov/G9xDJJ8KLy+DDPZ/lqDpjSwep6tO4oqFqjL7d2
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: 58-cY0f9WH9BiOSB2CJCv639Fci0S7sL
X-Proofpoint-ORIG-GUID: 58-cY0f9WH9BiOSB2CJCv639Fci0S7sL
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68ec982a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=_1kJojZ1I3LL_-Zbm_IA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX+KZ1a2WBln6o
 Xx4P3kgGMtb/8AaBwxU91efU6Q0mB4zB/XmItqkV6kUNnXvQJKD3/FZs5oB34eJYCQxyP5vS6Ic
 eLPSlfaBVPoUmecH0PS9qeZE4xQJQEGLAqEBayoYmABpTxV4Tw8qkKN5e1g4zIJMmEUGGm6V74v
 QRnet48zf5mi8YCuL1wuPZG306nmRkzYNmtl43DO5NKstnKhdADhhGtJo/kyFEOgeZpZY/AYHqL
 QIAQtrLdFrgnNysZdYD19scliGCsNcCTCLyWKa81nqEjuR+Hsd5TjgFetBz3MSBf3aZFFyKT+ai
 cj91uv9SA4eaPkly0qxMX3K1Y/mJdmUDUmkzIGEvZiHWkqL5KJDV3KjaakNKp95Svan0TwN4eAh
 8qdHbdGwmioWgHyI7D/t9Fx0M+8e3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_231154_995790_1E877ACF 
X-CRM114-Status: GOOD (  13.21  )
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

Enable static TPDM device for lemans.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 105 +++++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index cf685cb186ed..3646e2347068 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2961,6 +2961,14 @@ funnel1_in4: endpoint {
 						<&apss_funnel1_out>;
 					};
 				};
+
+				port@5 {
+					reg = <5>;
+
+					funnel1_in5: endpoint {
+						remote-endpoint = <&dlct0_funnel_out>;
+					};
+				};
 			};
 		};
 
@@ -3118,6 +3126,60 @@ etr1_out: endpoint {
 			};
 		};
 
+		tpda@4ad3000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x4ad3000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@10 {
+					reg = <16>;
+					dlct0_tpda_in16: endpoint {
+						remote-endpoint = <&turing0_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					dlct0_tpda_out: endpoint {
+						remote-endpoint =
+						<&dlct0_funnel_in0>;
+					};
+				};
+			};
+
+		};
+
+		funnel@4ad4000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x4ad4000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					dlct0_funnel_in0: endpoint {
+						remote-endpoint = <&dlct0_tpda_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					dlct0_funnel_out: endpoint {
+						remote-endpoint = <&funnel1_in5>;
+					};
+				};
+			};
+		};
+
 		funnel@4b04000 {
 			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 			reg = <0x0 0x4b04000 0x0 0x1000>;
@@ -3390,6 +3452,35 @@ aoss_cti: cti@4b13000 {
 			clock-names = "apb_pclk";
 		};
 
+		funnel@4b83000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x4b83000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+
+					turing0_funnel_in1: endpoint {
+						remote-endpoint = <&turing_llm_tpdm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					turing0_funnel_out: endpoint {
+						remote-endpoint = <&dlct0_tpda_in16>;
+					};
+				};
+			};
+		};
+
 		etm@6040000 {
 			compatible = "arm,primecell";
 			reg = <0x0 0x6040000 0x0 0x1000>;
@@ -8256,6 +8347,20 @@ arch_timer: timer {
 			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
+	turing-llm-tpdm {
+		compatible = "qcom,coresight-static-tpdm";
+
+		qcom,cmb-element-bits = <32>;
+
+		out-ports {
+			port {
+				turing_llm_tpdm_out: endpoint {
+					remote-endpoint = <&turing0_funnel_in1>;
+				};
+			};
+		};
+	};
+
 	pcie0: pcie@1c00000 {
 		compatible = "qcom,pcie-sa8775p";
 		reg = <0x0 0x01c00000 0x0 0x3000>,

-- 
2.34.1


