Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A434ACCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 10:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6AOYj+NGGeRZ7Yqf6v29L00+UqblIskONx8KDUVHi1Q=; b=5Bab4DyARllRvl0mzIECJlpqa/
	mQ6VlApqmOp+NGzZv/aaeVkgOsXTvpoeP4YfQ4UcfJKgsY17RZGXiG1C9P3aw2wv3vvjq4wL3QW6/
	lixG4QttUweCDz65ZvpV8qVZ3xwimsHG8VStRwP86vMDz34EldJacPG4ct5TCVXSp8sD3xDKvZD4m
	g1u3JGIUyoHoJZ25f/CVMk4kSXsrJsyGTs1Srt1mF07ABSkYk6U8AW3PS9LdVl/KQWTv9cmyOyV3t
	aiQxMRSdED0fwaXPtHXBDEmmByXJ0JlemyxBMVgleHVeQ3YMuJvSNJ/kK7o8U0R+on8RFwauKey0q
	T36Sr1jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDggi-0000000Fivl-1znO;
	Tue, 28 Oct 2025 10:12:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDggf-0000000FiuY-3uTt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 10:12:23 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S45Lbl573685
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 10:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6AOYj+NGGeRZ7Yqf6v29L00+UqblIskONx8KDUVHi1Q=; b=e/RUqVnX6twUu1R4
	1SL5Y5v3qcICnszJ+UT0irCp/VoYOI/uNdB77jwr1x8hk/C4xNMnXfajzfuQWigr
	GR/Puw7ZXSjPVmMCYY0LWRjNN/s4REYi1Z9gBalYzlbtMkEABjCFWpalDhuenWJX
	SqTm2vS3LaPUv/2Un9ugR0IpIoxG6pWrkTizgHpXSO0DvvKTqnjXBTwI6zMHpQUj
	1OsDxRZZ5P5wTwwUqDU8yD+rq35+NU9I82sHItgLJPMB3KhynBWSNyb9Th5RfN0s
	jjm+8du6e7Jfy5iGZJCVK8TQIhhAkGkpNAkvxpSho0JtLVXGNMwJhx7XQ30WKjDV
	FmDAnw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2pge918y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 10:12:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-290c2d13a01so43000765ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 03:12:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761646341; x=1762251141;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6AOYj+NGGeRZ7Yqf6v29L00+UqblIskONx8KDUVHi1Q=;
        b=KxeX78wDAjKS2oL4qs21I2UVi1lVZBxuY1whzJvCdZgplpyr8KgP8+fOvuQDm60l2v
         lJjbA5QTcI2qZ9Tc0m8aM+WvX9GHTBPblFUwhn1ei0O61/tf2fBtfjRIU7BqSsVZs9EY
         /uL8rtFLh7s9dFhhszZ4HLgZmb8UROgkbfAEPlyEAqN8NN45x+O1L7YCr4BqWOX7VAHL
         scMsSdSbmzQ3IiZglga44MEo84HXxasgObK0AP1GBQLycxSiyr7WJKjYzAbXqAJ+YBix
         mOpXSX3sHP/NWeVOseuJLyrDb330D4+k7lyjs3NyxKEKlD0ZUc1wk0WJr/oNPxJCj7zb
         0DuA==
X-Forwarded-Encrypted: i=1; AJvYcCWJSok9iv0l9vU5QE+vaq/kMaX4VCJY26agyI3j33Sbejlv1IYeqC/ps8S5/oXvc0QqgDEPN+qBZ/Mri/NQM/oz@lists.infradead.org
X-Gm-Message-State: AOJu0YymaUCT+5i5+sQpYkgpK46o9OFxa+8lA0WI/lTck4o3vaGohpsl
	hEX7k/b9lfYNDFu/SAh+zjpLQNgmNgsmUQqGwfCg+7n93TmoTqGpCyqaKlIlCoPdLRhL81TVdAP
	ckyKJzrCxjhAWJ4CbzFqxv/vA3vU+I9+bIAg4krtZT3zWbNXzR9XIqQYwqosA1V9ZlqoBqa/oel
	XmCQ==
X-Gm-Gg: ASbGncsaBOwx3Puv0CyS8HXKwjUZLmHsRHQkmre8yzMFS5sVGSXbRPMOQoVg+KW/VZt
	kv1PMD05bb0qNbhdWjmKodsCaoBZjnPKHF/Wo0Krgy5qF+tDxg+s7wumKWeY0w3iBQlOi8yYLxW
	uCalK7WnYxPwcEIieE2kbOzPZI9qFvHkFuKGjK1si5OJKwdGp9Il4x196jQJ1yMEbv0TWOfQvsU
	VlLY/hpVglkQSv1hUMkSQcS+JOhIyJgE6RfNb4twiQfH9ZiwdtPulfv8p5AsLvSCeB+gB/XxeOc
	XxSf5X4C3oapZvgU1pICYG7r9Lw8vPT+dm9qJ2MECNSP/zHh+qCYzxnRoIR5nLdZoh8Q3+1uu8L
	M+0DGpBMh/jZb7MQIij97tGjSQL2S7UBCnuFqfNpWpdigOMHw9l9zn2nf73p7ug==
X-Received: by 2002:a17:903:15cc:b0:292:b0d0:2ef1 with SMTP id d9443c01a7336-294cc722b29mr32133175ad.18.1761646340557;
        Tue, 28 Oct 2025 03:12:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQcK2UoPhoEuKHRrlWuWBy8+oO5uc8TBTCYd9RSa/HN7HmGG2vRuqfaewpomWa5UmuaODLLg==
X-Received: by 2002:a17:903:15cc:b0:292:b0d0:2ef1 with SMTP id d9443c01a7336-294cc722b29mr32132545ad.18.1761646339772;
        Tue, 28 Oct 2025 03:12:19 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf423esm110408755ad.19.2025.10.28.03.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 03:12:19 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 18:11:42 +0800
Subject: [PATCH v4 3/3] arm64: dts: qcom: lemans: enable static TPDM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-add_static_tpdm_support-v4-3-84e21b98e727@oss.qualcomm.com>
References: <20251028-add_static_tpdm_support-v4-0-84e21b98e727@oss.qualcomm.com>
In-Reply-To: <20251028-add_static_tpdm_support-v4-0-84e21b98e727@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761646319; l=3216;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=/rV8b02lFbRn8hnY0VJDTTwq6M9xJWBmQ2RE2hCI1Ho=;
 b=NW8JrTq58ErqSr16wGg0PZvUE6ItBGloVWbTHohKLxaFebf5hWosb78ZE7f0jF4wGUAcuYMie
 pZa9rUTi8emBz2PUihhD7npvKKnpvnBjjSlHcaLEb4CU6TqJMr1/yvC
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: _0JFDdsz2Gi50CkxmXtburgq2gllA0qD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA4NSBTYWx0ZWRfX27A2cZIKx6Of
 3tAO9d/sKMdv/reSOCLYjMAUEYZaDWv2AmY5c1Mj/DLLp8GQdcQXYpQ2VnaL7Kb+3fjPEnBpZSE
 4nV9K7dMITGaOPd/LPZZ4vZXnyqAOSNUh+wPi9JvlHY1zE9Xu0OF4rYItSMAOA34nitzBSsPxiD
 DhjWxylQ4/TYkZJ+mdFX+aUiJv8dKLjALuOlojU3sVQVvEF3eqFVd85pYGPK3k4qEIiWYHAtDWK
 p8tkXNgSilN6AWO8QBiUO6uqyIRDCJYbjSpQ5gE7A2Vmvh1eD8grf4ZjeOCfvrmhcbnTQHT0D+w
 CuFTefTj8CUtn4t2BBGGJVQff3D1tontI3UesLTeR3R3nJh2FGGgMyvYZnWlKx83tgO9jLIouSr
 0tQMVA3x+KmZhRnpeSsXY5iW6q+Ohg==
X-Proofpoint-GUID: _0JFDdsz2Gi50CkxmXtburgq2gllA0qD
X-Authority-Analysis: v=2.4 cv=fLU0HJae c=1 sm=1 tr=0 ts=69009705 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_1kJojZ1I3LL_-Zbm_IA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510280085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_031222_012729_C2ED3B54 
X-CRM114-Status: GOOD (  12.31  )
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
index 0b154d57ba24..8a93b353d11c 100644
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
@@ -8269,6 +8360,20 @@ arch_timer: timer {
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


