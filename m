Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB1EE83070
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 09:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qltUqOfSxitFH26aqGz70TycTTJ/d1VqzyG6H1vAznQ=; b=PvbO+fCG2Q4XcZHBDaKh4YBUcV
	JNihx4lCCSsLS5ExCkQjqB3gobC2IOlLuRVv48tTiDpH9mnb3GNK9p0wNmN6EB5fGjXHYCkFTvC8L
	8bGoY9LMmcVORUeKUM1YGlKhSlB2AltKtIrxnObhJ/v49urqV9CJi418kpg625hL5EYDpgsy3WOcG
	0qK5HRsoEKu7CfvDtEed08R7kKCDGu4iCeAKYaEAwPq1iLJF/OXfZYGIryIDtHDC/lVY5ojIXAQUj
	u7eCeYEtG6HlzBVkl1eEpErR0isQ+VE2byFSeZuLVfS+gXlLuRZqzkb3ygripIUxKuTXjiFxGFw07
	ptlJe8qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnCml-00000006NeP-2GHl;
	Tue, 03 Feb 2026 09:33:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnCmh-00000006Ncr-0mXt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 09:33:24 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6136psdA255014
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Feb 2026 09:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qltUqOfSxitFH26aqGz70TycTTJ/d1VqzyG6H1vAznQ=; b=JkXVjU7YdSchS3bF
	uy7H1Ika6jUZWx68R9TC3hvSWBxT8cIT1iAS7ZCvS2Fydo125ca+s91VKrGpqyDD
	/1D5peGbIKpHD1Sm66/cGYUV6zubab1FL/SbPKY3C5thqIlU4BdNh5sSv0ihu8rZ
	xLQOcc0y9xDHdHrJw3BZVpMTdanlAqlGfQJ3+rnKywTpY6tbDS8u/zNGiTFRbJvK
	7KMnitTrGTgJqyBOZCWZX29hBUJ8uf/FapBm+4w3rd57bYil3mHDSxvXyYYnvoUR
	IgLka9pRLdSEmCgzIsCLuWaLIwqGyQkkAGHa/ax+Fnn0VSv6LZlW4g0gnJ5AIyke
	SXQOmw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2v0kkhff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 09:33:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a7d7b87977so51893535ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 01:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770111202; x=1770716002; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qltUqOfSxitFH26aqGz70TycTTJ/d1VqzyG6H1vAznQ=;
        b=DPEzZUejiRORXx+5kaqOWlXBPNadJO2wN7Nx653VreCODjfpmXWIFPP9HM2Bj3vcBn
         qmFCz0giJ1I9jY8Y6R0HmSSCCYn0jfr8hifX7KJTJjW9tq2b2A7arG0HQwx5vVq4I7c/
         TOHY7w1oijcLAobLD3LV9AYlgVlFW1S8+KOEmyBZr6RmADRlxzbP+01hXAK/66zGzzjV
         UwgutisKNEuWVHJ+w9Cz0NmjOnZh3txXb+dIXCoKSZ4DRWL9DAvBlJerPGENNuPSb1eY
         dwvU/qS3O2YI8+sHur2cJ+A+jCFJnGVlZ2s+cfHPTWXh354O9VI3hsRQOw26PnVYYQHZ
         m3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770111202; x=1770716002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qltUqOfSxitFH26aqGz70TycTTJ/d1VqzyG6H1vAznQ=;
        b=cboWA/2jvFmY0iq+AoK9EnSthmZ+mPD8EuKG19hF6YM/fJdCcW9ucwKb39CgESY6dC
         IOFXw5Tu1vE6KA8isz2BKmO0QWmY9PL/mlONbOtbtzjIa7u3ZiCy7jqhighD+4gV/VAt
         eb0Zp5oxRl86Wcv9qjPGJBlBn54kAfH0ziEN19z5IXZr3BpIvjsrYdtR4Ex19TYYCAgk
         tPcAqGROufkvNRfdjo0C8m9NA/saMlewh/a0h/o9WipQMDlhqH4QFt+PfmWN3S6f8QL5
         KYkvHzlg9yIEkb7gv/yU7+x9+bBy724FgxS6G+zGFnfB548yayXNxrEz2qV97iJfcelR
         N29w==
X-Forwarded-Encrypted: i=1; AJvYcCWm1BTh5dXQLjLA/AVNvvGUvgpapqzLLT15RYWG7/fTqe8zQMLYoB+ta7l5fMH4OuJVqNSluefwlDOYG0f2w7cX@lists.infradead.org
X-Gm-Message-State: AOJu0YwwKGYCem3SSlSX9EFASZYHQPkHAIDgI2Q6ncmYAKpESJ+xwyTq
	6RhPb5IzuqmuxHOdklaZ58HkKrz1McOBoaowSr+iLoQpvhq57Pz4+HKLCtkBK3gw6iW8VeIy+i0
	gEeqqgTdJmeuWsKMmWey4yvqj+sBYaoCL9OOc6ulhbcpxH/biKW/v++JcdlWa+8eHYQQWD26cGg
	XJYQ==
X-Gm-Gg: AZuq6aJ/crthUyEXPst7uad53aDpM4jg3ePFHA3ggFP9pIT9ZMg334txm7JJczvButC
	SUE1kd/eR1iWRzzO+ODDS5VSnimnPAgD8KaGaRmzGmqToZerPuzh4n1PaIXlWXPPwKsouwI264m
	LME1ZD7pFddkMeBAYF1k9yagvxNm5+V1AklIBD868E9doe9fP9lI1Mf4KGxkCI/EOvgv+/r7FHT
	iYrC9dr62wGK8RHX1hcEeqKPgLJw9XAU82VPlYz7DxIjMQ6P3J3Uml9eN005J5JC0uo60BYjSRE
	a5hQhyx9XvhlXnYL8UJoPb++JOsd26EQwPUJ7zZ54wrBC4Py/aqkBzkvVmxs27xcr5hTU+0cMCj
	xPHUAQIUBQVjSXkNq6SAwUTDO0kipqtC+EFUQ6sOnUP+kDfjn1A/LX4tX826EEkA6jBp0kLIn
X-Received: by 2002:a17:903:38cf:b0:298:4ef0:5e98 with SMTP id d9443c01a7336-2a8d81b5e92mr165912975ad.56.1770111201989;
        Tue, 03 Feb 2026 01:33:21 -0800 (PST)
X-Received: by 2002:a17:903:38cf:b0:298:4ef0:5e98 with SMTP id d9443c01a7336-2a8d81b5e92mr165912675ad.56.1770111201517;
        Tue, 03 Feb 2026 01:33:21 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b3eedd0sm162489155ad.3.2026.02.03.01.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 01:33:21 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 03 Feb 2026 17:32:50 +0800
Subject: [PATCH v2 2/3] arm64: dts: qcom: hamoa: enable ETR and CTCU
 devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-enable-ctcu-and-etr-v2-2-aacc7bd7eccb@oss.qualcomm.com>
References: <20260203-enable-ctcu-and-etr-v2-0-aacc7bd7eccb@oss.qualcomm.com>
In-Reply-To: <20260203-enable-ctcu-and-etr-v2-0-aacc7bd7eccb@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770111187; l=4204;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=MmRh2JiBpDaFVC7myctfzKWNEp/EVU+H7DSEDhr01cc=;
 b=nKhz/tZ73YjN+u7I6TzVKYsxiiUB7OTGb1oZiZI1TdDqN6lZnR+Hy2NaZ8iuf9mgnithxKk6y
 VdJ0eikjG9dBxKsiBdhOhKqmftgHNpi519RY1sAEGbRi6jqyuhYDRdc
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=Reqdyltv c=1 sm=1 tr=0 ts=6981c0e2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kFQAvpsttJVeTngcj60A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3NCBTYWx0ZWRfX/LqSB5QdClh8
 SevInZLEguYawlhgrUpvn1A+QmT+tzFAAcpd9l+1HUXobpYjjN4eeGZUQRQtKRV2qG4cW2y2JTE
 0VVqLAw8eBcPlI5ZPIRGjUX3o4jeIkb0VDEXyfzbBMWJNTeJN96vFf0zITET9ysEUBrh9vT9oG+
 fGIycmcgLMWLytpoqRAIIbGIZqDf9PSdcSV48/LUrgF+ZW2QJQia8WPMvNHjOxUTgAvkkMCm3LF
 +yDUx8e170n23dFf+CEXgfCU/8NoXtxcAbkjYLx3Nj7r8e96NAj/TBZr234v857mJvRhw0GVR7i
 8Sf9Y0VROT4ONEoewA90Pe/4RNtSOJF2wVQps2NfgltUNIKIW8gpnDoHayi35hIBIdOyP6u8m9b
 1NqaRM8YVq+XtnPY9yiPRHuM+4jYKvtvTWnV9khrtIZ6nnIXQcHig0+KoEsH1Ch7PnSu5kQZT3t
 shayIAjD455MWAD3u3w==
X-Proofpoint-GUID: tpJrjY7rKjjyBr8J2CuW8ncXJe6kocu0
X-Proofpoint-ORIG-GUID: tpJrjY7rKjjyBr8J2CuW8ncXJe6kocu0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_013323_227005_A671845E 
X-CRM114-Status: GOOD (  14.48  )
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

Embedded Trace Router(ETR) is working as a DDR memory sink to collect
tracing data from source device.

The CTCU serves as the control unit for the ETR device, managing its
behavior to determine how trace data is collected.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 160 +++++++++++++++++++++++++++++++++++-
 1 file changed, 159 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index db65c392e618..88ec29446ba1 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -6771,6 +6771,35 @@ data-pins {
 			};
 		};
 
+		ctcu@10001000 {
+			compatible = "qcom,hamoa-ctcu", "qcom,sa8775p-ctcu";
+			reg = <0x0 0x10001000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ctcu_in0: endpoint {
+						remote-endpoint = <&etr0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ctcu_in1: endpoint {
+						remote-endpoint = <&etr1_out>;
+					};
+				};
+			};
+		};
+
 		stm@10002000 {
 			compatible = "arm,coresight-stm", "arm,primecell";
 			reg = <0x0 0x10002000 0x0 0x1000>,
@@ -6985,6 +7014,122 @@ qdss_funnel_out: endpoint {
 			};
 		};
 
+		replicator@10046000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x10046000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					qdss_rep_in: endpoint {
+						remote-endpoint = <&swao_rep_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					qdss_rep_out0: endpoint {
+						remote-endpoint = <&etr_rep_in>;
+					};
+				};
+			};
+		};
+
+		tmc_etr: tmc@10048000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x10048000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			iommus = <&apps_smmu 0x04e0 0x0>;
+
+			arm,scatter-gather;
+
+			in-ports {
+				port {
+					etr0_in: endpoint {
+						remote-endpoint = <&etr_rep_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					etr0_out: endpoint {
+						remote-endpoint = <&ctcu_in0>;
+					};
+				};
+			};
+		};
+
+		replicator@1004e000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1004e000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					etr_rep_in: endpoint {
+						remote-endpoint = <&qdss_rep_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					etr_rep_out0: endpoint {
+						remote-endpoint = <&etr0_in>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					etr_rep_out1: endpoint {
+						remote-endpoint = <&etr1_in>;
+					};
+				};
+			};
+		};
+
+		tmc_etr1: tmc@1004f000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x1004f000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			iommus = <&apps_smmu 0x0500 0x0>;
+
+			arm,scatter-gather;
+			arm,buffer-size = <0x400000>;
+
+			in-ports {
+				port {
+					etr1_in: endpoint {
+						remote-endpoint = <&etr_rep_out1>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					etr1_out: endpoint {
+						remote-endpoint = <&ctcu_in1>;
+					};
+				};
+			};
+		};
+
 		tpdm@10800000 {
 			compatible = "qcom,coresight-tpdm", "arm,primecell";
 			reg = <0x0 0x10800000 0x0 0x1000>;
@@ -7298,7 +7443,20 @@ swao_rep_in: endpoint {
 			};
 
 			out-ports {
-				port {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					swao_rep_out0: endpoint {
+						remote-endpoint = <&qdss_rep_in>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
 					swao_rep_out1: endpoint {
 						remote-endpoint = <&eud_in>;
 					};

-- 
2.34.1


