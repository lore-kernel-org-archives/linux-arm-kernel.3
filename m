Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BD8CAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 09:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w3UHXqdgFCGeqIB9S1HebNikF2UsfUnlUORJJ/kjR8w=; b=gXx4gh5U4/pppFNpgPSOirxu3d
	XZ0Gp0q+0Sx3q0quAqOTX9eyKbqYpJsY5/yY1r0iJP+Sz27lemDvxG5JybBPdiwyj5gsL3ePzljEg
	qfRAKzh3YlJBlULTzUuyOd3KqKmT9DmsNFNwv58xIm/nhs/97ud4Y4Jgrh50cPhy1SF4PV2TtL8/0
	DCbchsmSAUvJZgl+P0DXbCC2sUep2kIqX4L4qFWfROQVu9H9i1xF+0+C0eXfT0rboQJzpg6yj0wrj
	jq5BwdKfflBKt+AYhfeMGXyCpPAiQGZIPZHw8D7FFzix8QfMsqcqXa6otAdFUY0j3nm0JWnL8ezbc
	/xxBu+ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwdkQ-00000002A1E-22zq;
	Thu, 11 Sep 2025 09:37:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwdkN-000000029yQ-1r9O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 09:37:44 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B8VjHW003689
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 09:37:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w3UHXqdgFCGeqIB9S1HebNikF2UsfUnlUORJJ/kjR8w=; b=UqcB+gBeJWzGfWEp
	2xoLMKNsvtDEBHy5j0vC9yjv1TxcrgdSsqH281dQe5dTInW1Cp5EzyxAenbUIs52
	8zjKMspG2m650NJARK8kovTnmrnupT4huzn2dDc6aPFEHtplck6XT2ctL12iGZ/g
	gHcdeEAcENoDW/FsVHSD37rk3FT0p00stNjI+mWLo83AkIcjxIFg2lkwok9OOEyW
	Y680QfIb/SF9J2QTPZFkTuPFAjHn/PzrsXp7BaQVLYRzaGRCif9iXSUHbu3cYPOf
	MwiCJORpl+A3ZbH5wf32OZ5iWR4I8i49J13U3vgpB0NZptWA8ooB0AA1ji4N+8y6
	27VsXA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493tyxr707-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 09:37:41 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b47174bdce2so431140a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 02:37:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757583460; x=1758188260;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w3UHXqdgFCGeqIB9S1HebNikF2UsfUnlUORJJ/kjR8w=;
        b=kH8eBZ4jiK9nO72hyqR/0mtr73OsTQ/f6Yl/hOMYAXFukQv/2nR5RlUZ6TomjNCnmm
         lLMmX3UujUtPBClKSC5D3BFhngnRVSXSfdJevsSPVWyZ3pQL1HkJarqw2KgsxIoqWDFb
         2EFZsHpGsdb96jxFIvy0zEYl+kLVEa5dz/5ozw3crJcPlL2sralhh6+Q6El9I2IOMv6v
         ig1W1b8Cu4qRkzfDVw5zKCBEtAiARUpcpeKlsXW28ENHbpDl62W+aGJhDTiejEpmEsY8
         tphtR/thPx53xT6+u6IR65zjmAvf5zIBXqw5aGkE4QdyeQs6R3mhY0Y7Vc/JPffLZa1h
         lSXg==
X-Forwarded-Encrypted: i=1; AJvYcCVAdDtHqf3JdFmXoprxzdtWj96oERLDc3PvQg05Ah7sEGI8nESDMFKG3wTBY39GlN6RQ99TiRKiULuN76G0itDv@lists.infradead.org
X-Gm-Message-State: AOJu0YxJwtYXgrC2EK1PzeeVvobMmUiT/8ZspTNuR/iwUv2EWXG64b/x
	wn95R3L5x5kGKLyULRzQvwREsq//PPIJTw1LT0gSU1GcDbX15VfN89t7wQawg5RrHD0eGtdc4ZV
	B0iHnk6ifx0/ajw7ae3pd9/b/3aO5Pn4hAtK7I0K9Wh6HSKEKoMcpYhOvnDxcZIjLA6I249AC9O
	sKEg==
X-Gm-Gg: ASbGncu9sfv0Pg4bFshIHqVaZ5l5aJ4YUKLH+MbwNJW/0Ndef38zsYOgWZ/XUbrwd9t
	WKqqSUD27ue2mzoGW4q7l1jGkAHDgbSQ+jh4vM12tMfEljb+2h6YaJWwVvhjpWvDIBSg0r8Ny0d
	ZwoUYr3frnly7YzmxcL136VC9H5p8P2kqScKD+d1ed0AA2VLDV467z7Nn0iQKsuTzen7IGXpMBh
	iu35GLYqoOcn8i4Ef9dBffLUg8/344QKhiDMqEMSvg+wVSdRgfdZLrlxXMIBUOybJ+oPkkoVDV5
	EtpOKwkxH2ik0yyLsQ8gsWGR98Ax8BKR8ahMyQW3JGqiY3k8DXf4ICZ1e9a5Sip7rhTz1D9TIDE
	o07Cxj7OfvfGNwPvGCE3clRiLE24=
X-Received: by 2002:a05:6a20:7fa5:b0:243:f797:fdf9 with SMTP id adf61e73a8af0-25344415f91mr24187326637.47.1757583460509;
        Thu, 11 Sep 2025 02:37:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEu9YOZsZOuJnUdWvgFgmY4PYUBMxZZD9lcxoU+0WLLvtqymvqPqUK59rKHJULHd4TVHHP4NA==
X-Received: by 2002:a05:6a20:7fa5:b0:243:f797:fdf9 with SMTP id adf61e73a8af0-25344415f91mr24187289637.47.1757583459997;
        Thu, 11 Sep 2025 02:37:39 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7760793b730sm1512930b3a.15.2025.09.11.02.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 02:37:39 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 17:36:58 +0800
Subject: [PATCH v2 3/3] arm64: dts: qcom: lemans: enable static TPDM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-add_static_tpdm_support-v2-3-608559d36f74@oss.qualcomm.com>
References: <20250911-add_static_tpdm_support-v2-0-608559d36f74@oss.qualcomm.com>
In-Reply-To: <20250911-add_static_tpdm_support-v2-0-608559d36f74@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757583439; l=3216;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=L+PwKAgWtbu8sGdlpwaIwc/cd28U0PqRE0W3q0+fCYg=;
 b=JcA0QLGXWHd2kmediDYKM6VhiPirq95RmC0532BBjaR7LcUdf+hREFHNt+hWn626tRjkb4ZK6
 EItpJudDx5sDOWxLvv/Nf806J0SaxvcxjE58x9KfA2eIAviJyDz3W1l
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: RT1McJHJcyygmwvAR_cT99k1bg0a3Pi_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDA3NCBTYWx0ZWRfX0GARwla8Db0z
 RARrUhKL1WiMt+c2Acaz09CU1tYMhCiHQ4Vkf49WtP/xn86wZNGUJONK/v6u2YtWzw0qIjepdN8
 Z/GYwv21Vvs8cv98XcIoTloAoJ8RztVtcjjxQIhbzCT8mqMct6UmkV2g7Y/UGMvP/KInnXkdh0D
 NMQCFqYpHmk8JmOSz1nckdB0DfIXPbJgsZt6wkXZ1g1TNppSOlO9pwkLzxH9mXZ37Awkq8Vh9oV
 EXRcjQ0kj1FR+1Z3jctROalvTJGhnecFZq9ANiDvBehr/9VyJ5uRfOOemrzs2OQBosU/t8MjFxJ
 skr5L8dfvK3fhQQlFxABCO5w2SWdhAl9QOXJywUkCOa3MWrpoq+rGamRnuKIWYzGXSKNd7D1Zj/
 SpwrqenA
X-Authority-Analysis: v=2.4 cv=VZn3PEp9 c=1 sm=1 tr=0 ts=68c29865 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=_1kJojZ1I3LL_-Zbm_IA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: RT1McJHJcyygmwvAR_cT99k1bg0a3Pi_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509110074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_023743_609547_CF8A3818 
X-CRM114-Status: GOOD (  12.98  )
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
index fd6eb6fbe29a..c3de6e295af9 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2960,6 +2960,14 @@ funnel1_in4: endpoint {
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
 
@@ -3117,6 +3125,60 @@ etr1_out: endpoint {
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
@@ -3389,6 +3451,35 @@ aoss_cti: cti@4b13000 {
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
@@ -7703,6 +7794,20 @@ arch_timer: timer {
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


