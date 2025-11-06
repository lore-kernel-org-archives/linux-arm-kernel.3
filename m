Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BE2CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 01:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5MkKiRXBbE3lf0Fpqo1FQcvBm1IsA+kYRCJdRWEmlHo=; b=NQ9ILXCsKqvcoV9CTl995YP8gj
	uYOEszoDFg5VvNZ557aE0BVG0+d3xXryKcmpgD5xNrejE4F4t2fW1HaPTv9anNnNRhN4I0y4GL8PO
	DOI50mWPgvldieC47lmzESn69cUVKm/kSBl/5Gg+jLmKU8jHcLStnxYTxsXEapsjK7J/zYty5a1OV
	u8OYjMd8fCCynQVA1Wu3bu4B5gN/4a7IvAOtzOXBRag2h70zTH7d3TN2qFsOXdE/LQ+QrnhnMAFJE
	eHrJOjwoDSeAWEWflQRENBHLeSnSEoDXVeqyTAzoFlTbltBKXn+RorqhG0WrXD3FYSwc0RHSKJu/8
	OX1rkiSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpG8-0000000EigW-2eN6;
	Thu, 06 Nov 2025 01:57:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpG7-0000000Eifp-0zUp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 01:57:56 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5KFUMb1726836
	for <linux-arm-kernel@lists.infradead.org>; Thu, 6 Nov 2025 01:57:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5MkKiRXBbE3lf0Fpqo1FQcvBm1IsA+kYRCJdRWEmlHo=; b=pmMGN/gkSNpeK88B
	kSQ/dL8SCuBFIM4feuq6o+y+nqZgxbKLExhojQBusMKDXaH/msiicV3GsqDEmnaZ
	bz0VBHNmt02aOq9cJUAf6gfMIZ6mM5z2CuX2PUf7OwC4yyJA34MBVilSLPBKG30L
	mbVsvvg9WIXYrigR0YobO5EyGsy0Lqny0hiHnWTtOqh/tuYRAorxilbSrnNoDUCK
	JjvwBlvrUsxRN7KNSb4b/n/XKFzuyuQbFr9GS+jj1vM/ZbpffgQjrcAjjnJ1Cj8j
	cykZGTLQevxIGR3rUSxVQBix0L0hICGZuz1tlgG8hAH9Vvv7Rp5hMy30dPUoE4m5
	TWm7EQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a82mt2xc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 01:57:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2952cb6f51bso11923705ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 17:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762394274; x=1762999074; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5MkKiRXBbE3lf0Fpqo1FQcvBm1IsA+kYRCJdRWEmlHo=;
        b=ZLw9s/TfCBFtP1bym/8RdOTVzUcQuGHWjDqGpwATCIZfIWlWG8CqPQcao3M9NayjOT
         Rt5PZtCCwbpGxWRtXfXm00R+1QDjKZbmrvjvKEK8d3NwVosi8VHC3e0BEuODgtgYZFVw
         QedWV2GXQ0KW4uQ45E2MJicK7CzsDp+IvK0JXnZjwe4atj2RCkGozCpwjUhAAS6SARGo
         onZ6dRa4jtgCxoOHxeqiy3tRGSPd0VEY0hkXWTdL+RUdbNgJQ8ms/IhzACAZj8iuli7V
         UbDJFWIPiaARlmJ3NFkZdR9iPb4G+RLA3tllUm7oCuGAImAT0wh7oFs4iCMjGHIUUN9+
         9LMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762394274; x=1762999074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5MkKiRXBbE3lf0Fpqo1FQcvBm1IsA+kYRCJdRWEmlHo=;
        b=EQq54+msMtjQYAGQaoonfUMBRdtYHQawsYLXX1q4xIKHQtc2bZdExSnGRXBRVmB+3k
         cazN6X1pFQIOM8UNGasGbihQUJDyUSyFi0WPysR0wLGEFZ6iT5aCnqpnurqesfo1Ms2B
         hPbfawmTiAlyyv73GlhwhGBCcZ6U6H5ae9JQ0+wIINL5CKmHkUcBG/gslvFL904N5DYa
         VaRKaKgxsJ82+RUwrjJFABUlZFrnid+3JAtdNLZCaA1RxCCxyBaVaV1L6eDIUMbgjhuR
         U32egT+3+c/OXTCb6m/4CpxMcM771JyFGvisHVhUBdzV7E2ePaWRrUg2Ix5Sok5cMcQZ
         KPLw==
X-Forwarded-Encrypted: i=1; AJvYcCUgpsH+EHoVJECIF48XP9JsI97eI82lJa+MEwsIiwcgzcJSCkSPR50n3rlpGc7QsjwJMIqmzJ8r7T264Al6DL8v@lists.infradead.org
X-Gm-Message-State: AOJu0YyrMkzgduPZm5A+UhIvZ5Nb2bTJmF8Ls8APSrU1P4Xo+OdoQKaY
	LrBr2aQXas3Xm3H9Z1zKsCToWi0btW+R6Iki0xYvL57tVCHUoRHG/jv9EePs+5TCX3Q21jZfMp1
	R+sY2QhWaZIS71WFWwwcE9GNvVYL0oyrEQomQ/bw8/31z5keKhcQzRgEGJfUfuh2MfZlvnSOrb/
	x9oA==
X-Gm-Gg: ASbGncu+XcYwO8OR6AQTAfa6dcX8Lrgcmyynpg3IhA9ciWI92N12EU0fQW4mL/KtFU7
	DIhF24g/gegbxTsnnBBGRpHkHlZ8nu0HoUCAe8Sq0XPsFQXaN9FP7zrFln+7gLP1BNLa2uFWxa7
	bohP7WNXb9/5+noiNalAEn/LAS4U8j9NbGrbMok86BvTQQ7TOLYPC4NEqMyaiI3VRV0A130WIvk
	aNN53V0Qeyw4YsLrgj7589Ef/Qw8WHXgia26++guIdGiZvxxX7pT+lzXrQZPxXDE/XEp4iMA1HP
	cjJiyBFYmxhft5jINZYGxPoyhC7yI09mkm/JwZcx72OG1QDAsniE6Gv8heFqR4vlCHjtuuaVnzH
	MX9SSl2G7u/GK/w+nDd1cFmIxhDeW5f4H5zOUsnUyikW2zzMFmyqb/sl8Q/48bQ==
X-Received: by 2002:a17:903:41ca:b0:26a:8171:dafa with SMTP id d9443c01a7336-2962ada5a6dmr73325915ad.21.1762394274077;
        Wed, 05 Nov 2025 17:57:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHg3zuB8jhhHQtF3i/xJOL1T6MX0TBIHHOix2P4rEMcbSwlF46A8Upq6h35Ggl2Yj74pIMVyA==
X-Received: by 2002:a17:903:41ca:b0:26a:8171:dafa with SMTP id d9443c01a7336-2962ada5a6dmr73325515ad.21.1762394273606;
        Wed, 05 Nov 2025 17:57:53 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c93e5dsm9115725ad.81.2025.11.05.17.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 17:57:53 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 06 Nov 2025 09:57:26 +0800
Subject: [PATCH v2 2/2] arm64: dts: qcom: hamoa: enable ETR and CTCU
 devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-enable-etr-and-ctcu-for-hamoa-v2-2-cdb3a18753aa@oss.qualcomm.com>
References: <20251106-enable-etr-and-ctcu-for-hamoa-v2-0-cdb3a18753aa@oss.qualcomm.com>
In-Reply-To: <20251106-enable-etr-and-ctcu-for-hamoa-v2-0-cdb3a18753aa@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762394259; l=4204;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=7VSD4rZhCzv8NdJ8v+27nAr+/WtZ4IGwF8g9oS/Ek8Q=;
 b=ZuaD9B46ChHvo6NySqR+CnBN7j1JzBkdCBeITt/n2oe7oA7RO5Gxz8SOPXD6rMdjZkEJLQbQO
 K3zkrTeM4kXBgrhlRXADkWVzxiIJy9RD+vFpE7aCw8KwdYKbKSsyCBe
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDAxNSBTYWx0ZWRfX4A8rFm3l0CV9
 2JE4nm/7dq2FA3l7yVkteJeA7cOkYT1MsUexIQtN3ZhxfirNF0RSWA+24WZIM7oVrCfz9jMvOnY
 1g8T98X2Rq4ueSNEgWxilz1jlf77780iubWR9kZGQwxlPZ/XUunsy3ITrnkFQn6ViCnjKuky4ZX
 bXMx3wqEaAr6P204dmr/M/PBvKowWhKFc+8z8edkBLOTPGIL1uhPta1NlhOxd1ZfskeshmgPHlz
 1hStkxe9eFnDxRXux3IeYnn2DqnH2x7DIgge6zJerRkEdFmCbSV6FeFTfLKZ6adzvrLw7ewzE9A
 GnZ0oS33rSHzmuKy6v+XmS/Ybwm6wzuoQ9t2Df/HFC466/r/RqVUWbJCoau9uoKe8xTchTmpx9v
 3epQo4wTLJ8EDg5BsKN4CsHGrE4Edg==
X-Proofpoint-GUID: X7OkOm4YLAAh9zV2ozPsg8p7YYVh5fLd
X-Authority-Analysis: v=2.4 cv=LLtrgZW9 c=1 sm=1 tr=0 ts=690c00a2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kFQAvpsttJVeTngcj60A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: X7OkOm4YLAAh9zV2ozPsg8p7YYVh5fLd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_09,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511060015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_175755_288741_B3F92AF0 
X-CRM114-Status: GOOD (  15.06  )
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
index a17900eacb20..3b90133da4e7 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -6713,6 +6713,35 @@ data-pins {
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
@@ -6927,6 +6956,122 @@ qdss_funnel_out: endpoint {
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
@@ -7240,7 +7385,20 @@ swao_rep_in: endpoint {
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


