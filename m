Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 793D0E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 07:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IiRzQGvYDAz4MPsV15s205gnwIbUSzxfOnx1MkYKPcU=; b=e5uVn8EPiU7TLexCTfke9LdDuf
	VaOKpihR01md3OAwleM05+YWmfR12+4nD13KkdjsJiL+GXh1/Padp+MYfGoWjiGHYYInSbkFqmJKJ
	ldTz2W/P0U2yfKNuJvcKQDGygN0z2BBKjzn0KYGxMeF+vWs0LWo8CmvF/CzsfpOj+e1r/0U0KUKzs
	Qc3619FOcIFRqhTG89P0iqjMqi+m7y254ftIRpD8O+YJPJYwS68EKZkUmqYgQOa+i0376PLPfRs9w
	nMSeFCoKUlCI6MnDxBw/DoJw+Qpdj2C0iXXswi9qWry9+FQex5yhqzb08tBuKMzMddWjP7FVcjqS+
	BjKoqLGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNRhK-0000000CX6h-16b0;
	Tue, 17 Dec 2024 07:08:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNROW-0000000CTJw-3EOJ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Dec 2024 06:49:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=IiRzQGvYDAz4MPsV15s205gnwIbUSzxfOnx1MkYKPcU=; b=HKx6PPNGW+gZ8wCPllGzYS3HSZ
	93w9ZDeNBzaM+e2bE5s0gThQNS71o/XU5DfTVgFI/lt08pMN1kd7g8NJk2jT0qZq7m9qu23vy0Ngz
	NjGyPzrQntmBmYrXxQhkrATnad3nFUgzOSVj2bitKWBwVlU1sDLGhlraYrTFvQZddcrXljfOKENHK
	ny434OlbCfxB2iXKm+93mSWFg3WfQSeYt5JZckoSK9VTWGeMq14JflS9PDiVamWvAI/L8u+DlLcPF
	dR+5wTUTjy7IRcZXKnHsA1Fu0AOiDQaK32tv+YwCuc8rHuIFZVBiQSF0qbwMKan79ml5u8Z/xiDpA
	9ETX17VA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNROR-000000050qj-1sid
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 06:49:23 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGIbjAo010023;
	Tue, 17 Dec 2024 06:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IiRzQGvYDAz
	4MPsV15s205gnwIbUSzxfOnx1MkYKPcU=; b=GGvE/6Mbf6VIYpvE4gkJ0a+7loQ
	8OrqOBECi1euq4mstJioV/fmpJKe4nymFO/VXQzDYg4y2vH7fr7fgTm5c0Oejc3C
	w7Wva5lpDElKHFAr9SRDpxCMrM/c7+Kll3CnyKGGpjmSeVq+7uelOYMlYKN51elQ
	pA3FUxnI67v0zLKMeWowEpKgT6fL/9rqsk9f1FIt444ltlmHl5LJhknJwWUDiA35
	hBD8h+HRVhMH0ll8AxuqcP6HWkSItLcB4Q+Is91/SMNQYyXqbfWcosZIyvpezybV
	sZIy+L0THCYpCZz7GM/+0UJrfPHLS2P+s3w3NW20cI0mHBMR+WufVc564ZA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jsn9hf4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:49:05 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH6n0Jf014904;
	Tue, 17 Dec 2024 06:49:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 43h33kx8yu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:49:01 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4BH6n1oR014949;
	Tue, 17 Dec 2024 06:49:01 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4BH6n1Yr014926
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:49:01 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 1292E5B0; Tue, 17 Dec 2024 12:18:59 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@quicinc.com,
        Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
Subject: [PATCH v4 7/7] arm64: dts: qcom: Enable cpu cooling devices for QCS9075 platforms
Date: Tue, 17 Dec 2024 12:18:56 +0530
Message-ID: <20241217064856.2772305-8-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241217064856.2772305-1-quic_wasimn@quicinc.com>
References: <20241217064856.2772305-1-quic_wasimn@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dSHkelXadJpWJJ5GJ8BhFYwoLPGczhge
X-Proofpoint-ORIG-GUID: dSHkelXadJpWJJ5GJ8BhFYwoLPGczhge
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=1
 priorityscore=1501 spamscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 suspectscore=0 mlxlogscore=840 impostorscore=0 adultscore=0 phishscore=0
 lowpriorityscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_064919_971382_7AF350E6 
X-CRM114-Status: GOOD (  17.35  )
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

From: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>

In QCS9100 SoC, the safety subsystem monitors all thermal sensors and
does corrective action for each subsystem based on sensor violation
to comply safety standards. But as QCS9075 is non-safe SoC it
requires conventional thermal mitigation to control thermal for
different subsystems.

The cpu frequency throttling for different cpu tsens is enabled in
hardware as first defense for cpu thermal control. But QCS9075 SoC
has higher ambient specification. During high ambient condition, even
lowest frequency with multi cores can slowly build heat over the time
and it can lead to thermal run-away situations. This patch restrict
cpu cores during this scenario helps further thermal control and
avoids thermal critical violation.

Add cpu idle injection cooling bindings for cpu tsens thermal zones
as a mitigation for cpu subsystem prior to thermal shutdown.

Add cpu frequency cooling devices that will be used by userspace
thermal governor to mitigate skin thermal management.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs9075-rb8.dts      |   1 +
 arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts  |   1 +
 arch/arm64/boot/dts/qcom/qcs9075-ride.dts     |   1 +
 arch/arm64/boot/dts/qcom/qcs9075-thermal.dtsi | 287 ++++++++++++++++++
 4 files changed, 290 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-thermal.dtsi

diff --git a/arch/arm64/boot/dts/qcom/qcs9075-rb8.dts b/arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
index ecaa383b6508..3ab6deeaacf1 100644
--- a/arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
@@ -9,6 +9,7 @@

 #include "sa8775p.dtsi"
 #include "sa8775p-pmics.dtsi"
+#include "qcs9075-thermal.dtsi"

 / {
 	model = "Qualcomm Technologies, Inc. Robotics RB8";
diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
index d9a8956d3a76..5f2d9f416617 100644
--- a/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
@@ -5,6 +5,7 @@
 /dts-v1/;

 #include "sa8775p-ride.dtsi"
+#include "qcs9075-thermal.dtsi"

 / {
 	model = "Qualcomm Technologies, Inc. QCS9075 Ride Rev3";
diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
index 3b524359a72d..10ce48e7ba2f 100644
--- a/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
@@ -5,6 +5,7 @@
 /dts-v1/;

 #include "sa8775p-ride.dtsi"
+#include "qcs9075-thermal.dtsi"

 / {
 	model = "Qualcomm Technologies, Inc. QCS9075 Ride";
diff --git a/arch/arm64/boot/dts/qcom/qcs9075-thermal.dtsi b/arch/arm64/boot/dts/qcom/qcs9075-thermal.dtsi
new file mode 100644
index 000000000000..40544c8582c4
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs9075-thermal.dtsi
@@ -0,0 +1,287 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <dt-bindings/thermal/thermal.h>
+
+&cpu0 {
+	#cooling-cells = <2>;
+};
+
+&cpu1 {
+	#cooling-cells = <2>;
+	cpu1_idle: thermal-idle {
+		#cooling-cells = <2>;
+		duration-us = <800000>;
+		exit-latency-us = <10000>;
+	};
+};
+
+&cpu2 {
+	#cooling-cells = <2>;
+	cpu2_idle: thermal-idle {
+		#cooling-cells = <2>;
+		duration-us = <800000>;
+		exit-latency-us = <10000>;
+	};
+};
+
+&cpu3 {
+	#cooling-cells = <2>;
+	cpu3_idle: thermal-idle {
+		#cooling-cells = <2>;
+		duration-us = <800000>;
+		exit-latency-us = <10000>;
+	};
+};
+
+&cpu4 {
+	#cooling-cells = <2>;
+	cpu4_idle: thermal-idle {
+		#cooling-cells = <2>;
+		duration-us = <800000>;
+		exit-latency-us = <10000>;
+	};
+};
+
+&cpu5 {
+	#cooling-cells = <2>;
+	cpu5_idle: thermal-idle {
+		#cooling-cells = <2>;
+		duration-us = <800000>;
+		exit-latency-us = <10000>;
+	};
+};
+
+&cpu6 {
+	#cooling-cells = <2>;
+	cpu6_idle: thermal-idle {
+		#cooling-cells = <2>;
+		duration-us = <800000>;
+		exit-latency-us = <10000>;
+	};
+};
+
+&cpu7 {
+	#cooling-cells = <2>;
+	cpu7_idle: thermal-idle {
+		#cooling-cells = <2>;
+		duration-us = <800000>;
+		exit-latency-us = <10000>;
+	};
+};
+
+/ {
+	thermal-zones {
+		cpu-0-1-0-thermal {
+			trips {
+				cpu_0_1_0_passive: trip-point1 {
+					temperature = <116000>;
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_0_1_0_passive>;
+					cooling-device = <&cpu1_idle 100 100>;
+				};
+			};
+		};
+
+		cpu-0-2-0-thermal {
+			trips {
+				cpu_0_2_0_passive: trip-point1 {
+					temperature = <116000>;
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_0_2_0_passive>;
+					cooling-device = <&cpu2_idle 100 100>;
+				};
+			};
+		};
+
+		cpu-0-3-0-thermal {
+			trips {
+				cpu_0_3_0_passive: trip-point1 {
+					temperature = <116000>;
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_0_3_0_passive>;
+					cooling-device = <&cpu3_idle 100 100>;
+				};
+			};
+		};
+
+		cpu-0-1-1-thermal {
+			trips {
+				cpu_0_1_1_passive: trip-point1 {
+					temperature = <116000>;
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_0_1_1_passive>;
+					cooling-device = <&cpu1_idle 100 100>;
+				};
+			};
+		};
+
+		cpu-0-2-1-thermal {
+			trips {
+				cpu_0_2_1_passive: trip-point1 {
+					temperature = <116000>;
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_0_2_1_passive>;
+					cooling-device = <&cpu2_idle 100 100>;
+				};
+			};
+		};
+
+		cpu-0-3-1-thermal {
+			trips {
+				cpu_0_3_1_passive: trip-point1 {
+					temperature = <116000>;
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_0_3_1_passive>;
+					cooling-device = <&cpu3_idle 100 100>;
+				};
+			};
+		};
+
+		cpu-1-0-0-thermal {
+			trips {
+				cpu_1_0_0_passive: trip-point1 {
+					temperature = <116000>;
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_1_0_0_passive>;
+					cooling-device = <&cpu4_idle 100 100>;
+				};
+			};
+		};
+
+		cpu-1-1-0-thermal {
+			trips {
+				cpu_1_1_0_passive: trip-point1 {
+					temperature = <116000>;
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_1_1_0_passive>;
+					cooling-device = <&cpu5_idle 100 100>;
+				};
+			};
+		};
+
+		cpu-1-2-0-thermal {
+			trips {
+				cpu_1_2_0_passive: trip-point1 {
+					temperature = <116000>;
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_1_2_0_passive>;
+					cooling-device = <&cpu6_idle 100 100>;
+				};
+			};
+		};
+
+		cpu-1-3-0-thermal {
+			trips {
+				cpu_1_3_0_passive: trip-point1 {
+					temperature = <116000>;
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_1_3_0_passive>;
+					cooling-device = <&cpu7_idle 100 100>;
+				};
+			};
+		};
+
+		cpu-1-0-1-thermal {
+			trips {
+				cpu_1_0_1_passive: trip-point1 {
+					temperature = <116000>;
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_1_0_1_passive>;
+					cooling-device = <&cpu4_idle 100 100>;
+				};
+			};
+		};
+
+		cpu-1-1-1-thermal {
+			trips {
+				cpu_1_1_1_passive: trip-point1 {
+					temperature = <116000>;
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_1_1_1_passive>;
+					cooling-device = <&cpu5_idle 100 100>;
+				};
+			};
+		};
+
+		cpu-1-2-1-thermal {
+			trips {
+				cpu_1_2_1_passive: trip-point1 {
+					temperature = <116000>;
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_1_2_1_passive>;
+					cooling-device = <&cpu6_idle 100 100>;
+				};
+			};
+		};
+
+		cpu-1-3-1-thermal {
+			trips {
+				cpu_1_3_1_passive: trip-point1 {
+					temperature = <116000>;
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_1_3_1_passive>;
+					cooling-device = <&cpu7_idle 100 100>;
+				};
+			};
+		};
+	};
+};
--
2.47.0


