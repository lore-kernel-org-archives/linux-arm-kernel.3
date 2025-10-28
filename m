Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417E9CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 06:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YaZgNUsoK/Ovbts+heLvAayjgu7szxKqoivYDa4ZRjs=; b=4FwINjapjtdiaXv/Dc1xZcU7k0
	NCgqfQwSBJfExs/jx6anL3rL5bsEVStG54+8Q95AZlFUOxTjZn2pUoFODfNR1y9SXnncA/LhcTleG
	96Gfbeio0wCR67RJYDn05JmsjsaxKeLYDk2FSgQfF+dpP40vXwgxgWYWvuMqqP+LwXPnAek/vVV3p
	PLWaIctLnMtIEJFFkEreY0Os1yrMSTmpvyw3IbXtIa3mVxDD6mZbjBAKP5JDZtLrn4W9qrVWJDMEq
	oVmv2VevzCJ3y95DLrXSxMn+qdneq8F707HybiOo4E6Mwe4g9DLvFmoIdeuZdwrvPkzsK0IbZJhnr
	zhyoKALQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDdCj-0000000FLev-39HM;
	Tue, 28 Oct 2025 06:29:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDdC7-0000000FL5W-0goM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 06:28:41 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S45esP574308
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 06:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YaZgNUsoK/Ovbts+heLvAayjgu7szxKqoivYDa4ZRjs=; b=c6vZSQL5GMNiXP6i
	8GYqDbPkj9mIh7oMPS+KJHb2aOmmpKxMAYYxVqOhwIePYyrzqcB3Dsfx1DXhO1t6
	EwlSZ2+tLScZHGPYwbBjVj8oGFd9qwDn+YyL5NxennIGdDCGaW8kxPwpIxZDNMm5
	LpQD87lBgInJs0Dj3Ya9aaqrHpvQKV0ZZ0CcOU+DDXmtTummUhLSLomNd18K1eBe
	8w5PnRe2oQz5ZuhqdQdI1swj/cylVjsr3mP6mBugwae9j/A6nGDn8u9+XbeC96YM
	d8RFY7/gBSt6PUM2a1che0jTNJptkdJ+OqI0opObPij/KWGSPKWLYg8FRqLlbMkz
	WnoXkw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2pge8anv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 06:28:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-28eb14e3cafso110296885ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 23:28:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761632914; x=1762237714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YaZgNUsoK/Ovbts+heLvAayjgu7szxKqoivYDa4ZRjs=;
        b=ml8y8WbbEl8o4dumZahM84wSOOPidAhxXUqYdriSsmoYKCitbmxVpY9bO4IMwnIIsS
         qOxrRjWGtMNspIr7uENw6YYyxrJH3CLewGxEzrdQjUexoEUJjwjapco8GXQiuFYJiwCO
         mzENhwfxmWClVT+YSHw5itHcpUvZNG67DSsRgu1DdPPWLrC9AgpYrU3+70zL8qDRG96p
         4w+x0qhdEEYel70RBoYJx2ZZ4XYn9AWucGKlLxRehrs8Jd9QsLuE2DeHuhS/BXntFChJ
         O39sOEZWGy4WWaUUByLAPlVBFNULnRm/SWZihYSPpOqaGrAbpy2miMccwRXk1r5tDc0B
         kI4w==
X-Forwarded-Encrypted: i=1; AJvYcCXDoH7IZOnYU7RVYQd2QicEzGCQnbKT2/9b1I5KTvHIgOPXjJkocXcFo/h+IbF6VuZ0QcegB/NNWK7PtbPUiewu@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4KpElfc6qkcoLiMXSf1nTwJQAVSxFG50qFizQZhgRU2xOj1mR
	At7w5uSvsgTSCAcPSBtXjAkbn4IzVs9V/r9BwGRtUcvBggpX4oVa3M4cu7lkfTJHbQN3agMKFSq
	z9hzIhPdT57fGeccOYarkE/yVq9hBzIJynnN1RBw5L0Vb8vge2BU7uXWr8m2eOx2YmOZGn5cP99
	5QkA==
X-Gm-Gg: ASbGncuvBkCvLwTRAzUDS1xb2TOPO8gzw0cInCDX08ZTuQ1V34fTNVM9UDsypjnTwUg
	eRZamFnFE1ljinAiYxDoA8Z32f1rNqx/XZXNxre0owVxCz3irhmInmBlpaBQPjuumHXKVkWHTZi
	CHwrmPt7vqGJ7oBKqFdybMmyNb8Gf+WHkcrJgHQT4veqget/gUde4WofVP6SwlYOHVmOGYLN2Xc
	MQUYL+iOtqrlqiR+a44CNGVqSJxYQGJbLZzc4dSoTZtlUFUzcFNdU6FC1CUw0kRy9z+sj6G/vqr
	jVWvpVTHOj9/fOcrk/upt5mZDYZgk7MYobGz+0OKugJI1wP8ND3YEF4tduavyQeqo4azolx+EEr
	FTK0W9jjRiz+HN5dZA7JQAfWHtxqwch2QSBCC65M360Om7tSRTOf3+qRM
X-Received: by 2002:a17:903:22c1:b0:286:d3c5:4d15 with SMTP id d9443c01a7336-294cb524ebamr30677655ad.36.1761632913889;
        Mon, 27 Oct 2025 23:28:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeNsRVXIiisXxFlksCrtzl2xo1re/edBVSUCRuEZKVFeHbiKCDyQFxgqpaCmyE4mf3PxGEow==
X-Received: by 2002:a17:903:22c1:b0:286:d3c5:4d15 with SMTP id d9443c01a7336-294cb524ebamr30677135ad.36.1761632913341;
        Mon, 27 Oct 2025 23:28:33 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf359asm102503265ad.12.2025.10.27.23.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 23:28:32 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 23:28:14 -0700
Subject: [PATCH 12/12] arm64: dts: qcom: x1e80100: add Coresight nodes for
 APSS debug block
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-cpu_cluster_component_pm-v1-12-31355ac588c2@oss.qualcomm.com>
References: <20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com>
In-Reply-To: <20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761632890; l=18913;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=OMJVWvctaf/jehI7hOKPGAqI0udn0MwJRTHWVdjf3sE=;
 b=8B2ejYcA2Z4zW++Z36CzupWjsNp/k7HGXk1uaDaWWOdG61j032t/tGxE/IzQdGWu1F9Go8u6X
 jwoUwDxzf/KBW7O6Ca2QZGPzZVOMfsgs1zZJ8VNNXfswGzSRaMbeBkQ
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-ORIG-GUID: CSeWSxsz3d40vxsBRAFOeB4Ea1AZZpyw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA1NCBTYWx0ZWRfX8qgVnU8NXn3C
 wtM1qRnWyUm8ej3NAiuiaRUGxoTAczgIX2SdznPhYsUL8lcI6cH4c9dfVEUnkEejr31QZ/LVcQ5
 puOOunI38n5FPH5JUJpNYcuAhKhBEFQ/sL3xgTwzzAxIHnqKmm5P79CMfuwfKAh5WXEOVn4dBuw
 47qIPu0o3w82RvgTtKXoUhheKYXtCbKZscVNgY9WzXKY8ZtrxPHC9AGlKefuynW17ABRj/FFhEE
 mlk99V4fAaGKBqglzXrJ1rWbpsZ9mNJhhs/IjqYlzgSypHfeJOWCXJoZRgLM1nXOjkh1IVhnlUp
 JvJCc4CxJJkRibbVVmaNlNqV/hN4Z6iMMv63HyLllTBgZhE9xQzTekeGAzX3gYYRrzlp8pnda0I
 eaZ2PvwIbqXCcd3up38Oh9oKSy/8gA==
X-Proofpoint-GUID: CSeWSxsz3d40vxsBRAFOeB4Ea1AZZpyw
X-Authority-Analysis: v=2.4 cv=fLU0HJae c=1 sm=1 tr=0 ts=69006292 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_9YiIY8xfo59NaDcWFUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510280054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_232835_223905_2EBC978D 
X-CRM114-Status: GOOD (  13.37  )
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

Add below Coresight devices for APSS debug block:
-ETM
-TMC ETF
-Funnel
-Replicator

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 885 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1p42100.dtsi |  12 +
 2 files changed, 897 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index a9a7bb676c6f8ac48a2e443d28efdc8c9b5e52c0..9058ea8ce62c706667b931a8f4c2e7c666c6bcc4 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -6597,6 +6597,14 @@ funnel1_in2: endpoint {
 					};
 				};
 
+				port@4 {
+					reg = <4>;
+
+					funnel1_in4: endpoint {
+						remote-endpoint = <&apss_funnel_out>;
+					};
+				};
+
 				port@5 {
 					reg = <5>;
 
@@ -7887,6 +7895,883 @@ ddr_funnel1_out: endpoint {
 			};
 		};
 
+		apss_funnel: funnel@12080000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x12080000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					apss_funnel_in0: endpoint {
+						remote-endpoint = <&ncc0_etf_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					apss_funnel_in1: endpoint {
+						remote-endpoint = <&ncc1_etf_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					apss_funnel_in2: endpoint {
+						remote-endpoint = <&ncc2_etf_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					apss_funnel_out: endpoint {
+						remote-endpoint =
+						<&funnel1_in4>;
+					};
+				};
+			};
+		};
+
+		etm@13021000 {
+			compatible = "arm,coresight-etm4x-sysreg";
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu0>;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm0_out: endpoint {
+						remote-endpoint = <&ncc0_0_rep_in>;
+					};
+				};
+			};
+		};
+
+		etm@13121000 {
+			compatible = "arm,coresight-etm4x-sysreg";
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu1>;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm1_out: endpoint {
+						remote-endpoint = <&ncc0_1_rep_in>;
+					};
+				};
+			};
+		};
+
+		etm@13221000 {
+			compatible = "arm,coresight-etm4x-sysreg";
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu2>;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm2_out: endpoint {
+						remote-endpoint = <&ncc0_2_rep_in>;
+					};
+				};
+			};
+		};
+
+		etm@13321000 {
+			compatible = "arm,coresight-etm4x-sysreg";
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu3>;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm3_out: endpoint {
+						remote-endpoint = <&ncc0_3_rep_in>;
+					};
+				};
+			};
+		};
+
+		funnel@13401000 {
+			compatible = "arm,coresight-cpu-funnel";
+			reg = <0x0 0x13401000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd0>;
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					reg = <2>;
+
+					ncc0_2_funnel_in2: endpoint {
+						remote-endpoint = <&ncc0_1_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_2_funnel_out: endpoint {
+						remote-endpoint = <&ncc0_etf_in>;
+					};
+				};
+			};
+		};
+
+		tmc@13409000 {
+			compatible = "arm,coresight-cpu-tmc";
+			reg = <0x0 0x13409000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd0>;
+
+			in-ports {
+				port {
+					ncc0_etf_in: endpoint {
+						remote-endpoint = <&ncc0_2_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_etf_out: endpoint {
+						remote-endpoint = <&apss_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		replicator@13490000 {
+			compatible = "arm,coresight-cpu-replicator";
+			reg = <0x0 0x13490000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd0>;
+
+			in-ports {
+				port {
+					ncc0_0_rep_in: endpoint {
+						remote-endpoint = <&etm0_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_0_rep_out: endpoint {
+						remote-endpoint = <&ncc0_1_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		replicator@134a0000 {
+			compatible = "arm,coresight-cpu-replicator";
+			reg = <0x0 0x134a0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd0>;
+
+			in-ports {
+				port {
+					ncc0_1_rep_in: endpoint {
+						remote-endpoint = <&etm1_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_1_rep_out: endpoint {
+						remote-endpoint = <&ncc0_1_funnel_in1>;
+					};
+				};
+			};
+		};
+
+		replicator@134b0000 {
+			compatible = "arm,coresight-cpu-replicator";
+			reg = <0x0 0x134b0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd0>;
+
+			in-ports {
+				port {
+					ncc0_2_rep_in: endpoint {
+						remote-endpoint = <&etm2_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_2_rep_out: endpoint {
+						remote-endpoint = <&ncc0_1_funnel_in2>;
+					};
+				};
+			};
+		};
+
+		replicator@134c0000 {
+			compatible = "arm,coresight-cpu-replicator";
+			reg = <0x0 0x134c0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd0>;
+
+			in-ports {
+				port {
+					ncc0_3_rep_in: endpoint {
+						remote-endpoint = <&etm3_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_3_rep_out: endpoint {
+						remote-endpoint = <&ncc0_1_funnel_in3>;
+					};
+				};
+			};
+		};
+
+		funnel@134d0000 {
+			compatible = "arm,coresight-cpu-funnel";
+			reg = <0x0 0x134d0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd0>;
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ncc0_1_funnel_in0: endpoint {
+						remote-endpoint = <&ncc0_0_rep_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ncc0_1_funnel_in1: endpoint {
+						remote-endpoint = <&ncc0_1_rep_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					ncc0_1_funnel_in2: endpoint {
+						remote-endpoint = <&ncc0_2_rep_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					ncc0_1_funnel_in3: endpoint {
+						remote-endpoint = <&ncc0_3_rep_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_1_funnel_out: endpoint {
+						remote-endpoint = <&ncc0_2_funnel_in2>;
+					};
+				};
+			};
+		};
+
+		etm@13521000 {
+			compatible = "arm,coresight-etm4x-sysreg";
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu4>;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm4_out: endpoint {
+						remote-endpoint = <&ncc1_0_rep_in>;
+					};
+				};
+			};
+		};
+
+		etm@13621000 {
+			compatible = "arm,coresight-etm4x-sysreg";
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu5>;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm5_out: endpoint {
+						remote-endpoint = <&ncc1_1_rep_in>;
+					};
+				};
+			};
+		};
+
+		etm@13721000 {
+			compatible = "arm,coresight-etm4x-sysreg";
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu6>;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm6_out: endpoint {
+						remote-endpoint = <&ncc1_2_rep_in>;
+					};
+				};
+			};
+		};
+
+		etm@13821000 {
+			compatible = "arm,coresight-etm4x-sysreg";
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu7>;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm7_out: endpoint {
+						remote-endpoint = <&ncc1_3_rep_in>;
+					};
+				};
+			};
+		};
+
+		funnel@13901000 {
+			compatible = "arm,coresight-cpu-funnel";
+			reg = <0x0 0x13901000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd1>;
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					reg = <2>;
+
+					ncc1_2_funnel_in2: endpoint {
+						remote-endpoint = <&ncc1_1_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_2_funnel_out: endpoint {
+						remote-endpoint = <&ncc1_etf_in>;
+					};
+				};
+			};
+		};
+
+		tmc@13909000 {
+			compatible = "arm,coresight-cpu-tmc";
+			reg = <0x0 0x13909000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd1>;
+
+			in-ports {
+				port {
+					ncc1_etf_in: endpoint {
+						remote-endpoint = <&ncc1_2_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_etf_out: endpoint {
+						remote-endpoint = <&apss_funnel_in1>;
+					};
+				};
+			};
+		};
+
+		replicator@13990000 {
+			compatible = "arm,coresight-cpu-replicator";
+			reg = <0x0 0x13990000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd1>;
+
+			in-ports {
+				port {
+					ncc1_0_rep_in: endpoint {
+						remote-endpoint = <&etm4_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_0_rep_out: endpoint {
+						remote-endpoint = <&ncc1_1_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		replicator@139a0000 {
+			compatible = "arm,coresight-cpu-replicator";
+			reg = <0x0 0x139a0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd1>;
+
+			in-ports {
+				port {
+					ncc1_1_rep_in: endpoint {
+						remote-endpoint = <&etm5_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_1_rep_out: endpoint {
+						remote-endpoint = <&ncc1_1_funnel_in1>;
+					};
+				};
+			};
+		};
+
+		replicator@139b0000 {
+			compatible = "arm,coresight-cpu-replicator";
+			reg = <0x0 0x139b0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd1>;
+
+			in-ports {
+				port {
+					ncc1_2_rep_in: endpoint {
+						remote-endpoint = <&etm6_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_2_rep_out: endpoint {
+						remote-endpoint = <&ncc1_1_funnel_in2>;
+					};
+				};
+			};
+		};
+
+		replicator@139c0000 {
+			compatible = "arm,coresight-cpu-replicator";
+			reg = <0x0 0x139c0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd1>;
+
+			in-ports {
+				port {
+					ncc1_3_rep_in: endpoint {
+						remote-endpoint = <&etm7_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_3_rep_out: endpoint {
+						remote-endpoint = <&ncc1_1_funnel_in3>;
+					};
+				};
+			};
+		};
+
+		funnel@139d0000 {
+			compatible = "arm,coresight-cpu-funnel";
+			reg = <0x0 0x139d0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd1>;
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ncc1_1_funnel_in0: endpoint {
+						remote-endpoint = <&ncc1_0_rep_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ncc1_1_funnel_in1: endpoint {
+						remote-endpoint = <&ncc1_1_rep_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					ncc1_1_funnel_in2: endpoint {
+						remote-endpoint = <&ncc1_2_rep_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					ncc1_1_funnel_in3: endpoint {
+						remote-endpoint = <&ncc1_3_rep_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_1_funnel_out: endpoint {
+						remote-endpoint = <&ncc1_2_funnel_in2>;
+					};
+				};
+			};
+		};
+
+		etm8: etm@13a21000 {
+			compatible = "arm,coresight-etm4x-sysreg";
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu8>;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm8_out: endpoint {
+						remote-endpoint = <&ncc2_0_rep_in>;
+					};
+				};
+			};
+		};
+
+		etm9: etm@13b21000 {
+			compatible = "arm,coresight-etm4x-sysreg";
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu9>;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm9_out: endpoint {
+						remote-endpoint = <&ncc2_1_rep_in>;
+					};
+				};
+			};
+		};
+
+		etm10: etm@13c21000 {
+			compatible = "arm,coresight-etm4x-sysreg";
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu10>;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm10_out: endpoint {
+						remote-endpoint = <&ncc2_2_rep_in>;
+					};
+				};
+			};
+		};
+
+		etm11: etm@13d21000 {
+			compatible = "arm,coresight-etm4x-sysreg";
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu11>;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm11_out: endpoint {
+						remote-endpoint = <&ncc2_3_rep_in>;
+					};
+				};
+			};
+		};
+
+		cluster2_funnel_l2: funnel@13e01000 {
+			compatible = "arm,coresight-cpu-funnel";
+			reg = <0x0 0x13e01000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd2>;
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					reg = <2>;
+
+					ncc2_2_funnel_in2: endpoint {
+						remote-endpoint = <&ncc2_1_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc2_2_funnel_out: endpoint {
+						remote-endpoint = <&ncc2_etf_in>;
+					};
+				};
+			};
+		};
+
+		cluster2_etf: tmc@13e09000 {
+			compatible = "arm,coresight-cpu-tmc";
+			reg = <0x0 0x13e09000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd2>;
+
+			in-ports {
+				port {
+					ncc2_etf_in: endpoint {
+						remote-endpoint = <&ncc2_2_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc2_etf_out: endpoint {
+						remote-endpoint = <&apss_funnel_in2>;
+					};
+				};
+			};
+		};
+
+		cluster2_rep_2_0: replicator@13e90000 {
+			compatible = "arm,coresight-cpu-replicator";
+			reg = <0x0 0x13e90000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd2>;
+
+			in-ports {
+				port {
+					ncc2_0_rep_in: endpoint {
+						remote-endpoint = <&etm8_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc2_0_rep_out: endpoint {
+						remote-endpoint = <&ncc2_1_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		cluster2_rep_2_1: replicator@13ea0000 {
+			compatible = "arm,coresight-cpu-replicator";
+			reg = <0x0 0x13ea0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd2>;
+
+			in-ports {
+				port {
+					ncc2_1_rep_in: endpoint {
+						remote-endpoint = <&etm9_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc2_1_rep_out: endpoint {
+						remote-endpoint = <&ncc2_1_funnel_in1>;
+					};
+				};
+			};
+		};
+
+		cluster2_rep_2_2: replicator@13eb0000 {
+			compatible = "arm,coresight-cpu-replicator";
+			reg = <0x0 0x13eb0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd2>;
+
+			in-ports {
+				port {
+					ncc2_2_rep_in: endpoint {
+						remote-endpoint = <&etm10_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc2_2_rep_out: endpoint {
+						remote-endpoint = <&ncc2_1_funnel_in2>;
+					};
+				};
+			};
+		};
+
+		cluster2_rep_2_3: replicator@13ec0000 {
+			compatible = "arm,coresight-cpu-replicator";
+			reg = <0x0 0x13ec0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd2>;
+
+			in-ports {
+				port {
+					ncc2_3_rep_in: endpoint {
+						remote-endpoint = <&etm11_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc2_3_rep_out: endpoint {
+						remote-endpoint = <&ncc2_1_funnel_in3>;
+					};
+				};
+			};
+		};
+
+		cluster2_funnel_l1: funnel@13ed0000 {
+			compatible = "arm,coresight-cpu-funnel";
+			reg = <0x0 0x13ed0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd2>;
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ncc2_1_funnel_in0: endpoint {
+						remote-endpoint = <&ncc2_0_rep_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ncc2_1_funnel_in1: endpoint {
+						remote-endpoint = <&ncc2_1_rep_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					ncc2_1_funnel_in2: endpoint {
+						remote-endpoint = <&ncc2_2_rep_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					ncc2_1_funnel_in3: endpoint {
+						remote-endpoint = <&ncc2_3_rep_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc2_1_funnel_out: endpoint {
+						remote-endpoint = <&ncc2_2_funnel_in2>;
+					};
+				};
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,x1e80100-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0 0x15000000 0 0x100000>;
diff --git a/arch/arm64/boot/dts/qcom/x1p42100.dtsi b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
index 9af9e707f982fe45f62a9420b1e6baa1fef4d2fa..9b5fe04ed05cc33fe6d0a3535648d318f6cc3a80 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
@@ -19,6 +19,18 @@
 /delete-node/ &cpu_pd11;
 /delete-node/ &pcie3_phy;
 /delete-node/ &thermal_zones;
+/delete-node/ &etm8;
+/delete-node/ &etm9;
+/delete-node/ &etm10;
+/delete-node/ &etm11;
+/delete-node/ &cluster2_funnel_l1;
+/delete-node/ &cluster2_funnel_l2;
+/delete-node/ &cluster2_etf;
+/delete-node/ &cluster2_rep_2_0;
+/delete-node/ &cluster2_rep_2_1;
+/delete-node/ &cluster2_rep_2_2;
+/delete-node/ &cluster2_rep_2_3;
+/delete-node/ &apss_funnel_in2;
 
 &gcc {
 	compatible = "qcom,x1p42100-gcc", "qcom,x1e80100-gcc";

-- 
2.34.1


