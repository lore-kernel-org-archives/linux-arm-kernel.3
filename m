Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1346ACA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 09:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJ0/Tt/kuxDEq0whlqJss+EhIMv/omiTAfRt3e6XHWs=; b=cgbyZx5vkZ/uN1ObFegfGzWEBv
	hF8iLhw40fh4KQkAKaM+6UDb5YGfQQw8UzZE621Qyv8HmzCNmkkWkTIOwLU8W0KAWuIN1bheeNaI9
	f/lXYgmjIB/HniL+70eJ2WRuZRCuJxksgvYhjNOrg7WlwGw0HUehOb7aHHSGiJU/0LFTw73svvblI
	6fetymj3fEOMZo0hmBQZf2ACDxg2tWATaBG2oWoIeliFRqpG84LKtxeuibez7Bl0NC3hBGq10x5Ow
	pairUvlxTpRt3C6PjvzFp1oLnXlHNQqINiSxjTzR3kSpuPTpAGjLtigpm3fU60evxdXSublYsMNLt
	ra1KNnWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUSM-0000000319C-20Fw;
	Tue, 29 Sep 2026 09:49:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUSC-0000000314u-1Zms
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 09:48:53 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7U4Ha3834019
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 09:48:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RJ0/Tt/kuxDEq0whlqJss+EhIMv/omiTAfRt3e6XHWs=; b=A0pd/Ev0L3SBo6aA
	F6xqd5F0m2zXrAMhehv88KPNhuv2d21TxbnhgTUBVyqtTG61cZN8sI91pPExbVOl
	0J0zfLk/tJkPA9fjVkcK+6D9zVumZQuU+xR7JcuB3oy0RXjRcxxXoBXp/mYhYE37
	tI2btw+vHN/ziST7ZD6ZeXuvrJqSzuh6c+TsheucFHVfskjcdZA1wblofjF0eNmo
	bix9iVfi75WT9/e2PnHKu36oOtloHYD3njtIAUepVIWa9upKqAigJczhPEAFO2jK
	HPv1TJhTKpsf5AI1/LvrU6wTghDoHQuk5HJzw0ipeF/Kzmx5Vw3FnA0rT+AupMfP
	KzXaJQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h01vkj4d3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 09:48:51 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1383723dfddso2823533c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 02:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790675330; x=1791280130; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RJ0/Tt/kuxDEq0whlqJss+EhIMv/omiTAfRt3e6XHWs=;
        b=FTus7I/FnR4FYyQ0izc2GTt0ena/tweIBa+inkom2yysno8zFHCeBZZsyTe9aYOwOn
         NF5wQLQQucKOFnhJWOdKErw+JNPTTlytMbfMVCtoVNPHg11GyeJrW1bzqBHZdhFCHmQC
         gjM4XA8lCqoJHv+9/YP6vl/bjj7af6G0vAKlV9eSyjS6NGeB+cQbOFll7Ls8wxx0E/IW
         lS5g13+jHTCl507Ko+999bBE+ZUm7sj0tY5RZ1gmABTZKck/OnKECaxMNsprfq7uSx7p
         iWVOaoN4gwkLhLosi+YovewlY+opvQKtqthsTzr67JqT0DCWqgc7uWd6EqrNP+IjY8Pa
         cGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790675330; x=1791280130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RJ0/Tt/kuxDEq0whlqJss+EhIMv/omiTAfRt3e6XHWs=;
        b=dCQ+hToeT5OUZswFatkThUJMeMMozPDnFRAIxviSQkfBRx29Iy9UeMTkAuMBYHrL5k
         YR8dIXk+Xy4VvW8D4Oq4RD+p2f2O5XeTyzWsMRGe5wPln4ovBeTtZc87xyoJUVe069Gl
         f/0dpW/Q2gvDdW+hQQLwg5MFHvEgbrXzim04hP3yAB0i5abSo5sPUe8aUO3w7WZsOJh4
         Y1E1VHsgHFtD8GGqi8BIBXccOhX6tp06ewNs6VFXEwKiycNOC/GzO2+0d2fytDWn52a9
         SCqE8tbFEOv3gQ2i7KxPZUN9zDm+9sssC6cntaMY7nWL2l7twnSsjkod44VrH/1rKnOc
         K4NQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvLhWyN/0Q8GchIEx/rbW178Gj3fTMgXknxniW+Y1fSZj1x6/pqI8G5jvE83CaaItdSrBCJUT+MKT9f4TNZPuJ@lists.infradead.org
X-Gm-Message-State: AFuF++lnm76K3PtaQIL4Zra38yyAdvbYPqKMCcmmHaFgHVTD4PWbjKXD
	/XnXjRpt4ZVx0AJ3QAnL67VQssBBQCgBbxjY13cLF+sf8SxonkKAP6aSDF6HJu3FM1p2WTRFdzl
	dLJNK+jow2Gsh1+p9E7A2lcAgVheSaLiYGBGfayyyEVKmFud572bUyw3Inp9bpPLqXbql6PPMcs
	Cotg==
X-Gm-Gg: AYBFou2D2vqsFD9ppHJ+4FPMh4aaOusYcXYZpPM1xpXzb3ZCixfR0KOF6EevO6oUIB4
	sItF0Pu6idA9IarOPzgYv0qWAZ9CXPtw9yEOE9tumbBQ56ix8lgPfAidfB3Nx6hjZheg+rEsaCG
	23J3EmFbDTkcOo6hNj1l0MA/H8eAkX8YHhC0bbicDB+L7dxqcgb5qhFpGmEUfctZpg48hypOiB2
	zmo/VF2DVDbP/voNuY8iINn3Ic1JN0TC/oBEzN+46ge7mlbZBXZgCGiwtTeyvRUbsC5tEJrkbZF
	etCRGCcglbaRwUQOpusdinVFLy7HmBD/1Sg3pfwvqSTvxzZ5m49ZxyjpsrL2/cgU/8c5oU3vqVW
	UD+CbRb6b4rrzmrHOl30cdnhY6z+b8vc/sPR49J15Jx/fmQHOJgv1URziUWlW7+vJUUmHWm1hd/
	TFzkxIuRDdZbfhR4PiRebBPmI=
X-Received: by 2002:a05:7022:f50c:b0:14b:588b:c80f with SMTP id a92af1059eb24-14b588bcbdamr2279016c88.10.1790675330124;
        Tue, 29 Sep 2026 02:48:50 -0700 (PDT)
X-Received: by 2002:a05:7022:f50c:b0:14b:588b:c80f with SMTP id a92af1059eb24-14b588bcbdamr2278972c88.10.1790675329466;
        Tue, 29 Sep 2026 02:48:49 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14bfaaa296dsm1056163c88.9.2026.09.29.02.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:48:48 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 15:18:07 +0530
Subject: [PATCH v7 2/2] ARM: dts: qcom: Add initial device tree for Kuno
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-kuno-soc-support-v7-2-530f62dc4020@oss.qualcomm.com>
References: <20260929-kuno-soc-support-v7-0-530f62dc4020@oss.qualcomm.com>
In-Reply-To: <20260929-kuno-soc-support-v7-0-530f62dc4020@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790675315; l=12716;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=AfHO8BmKa55rMJwC9Z6OIJCGOHxcreSI1r4oQXYYJlg=;
 b=OqDzP8VEwoDOXei9+ajzF5PoPQ9stRbrtHyru15+6RAFOdyPSpbZS1/l3gom22avDBB6Ivfmf
 8cXmsjqcPFYByYyOiQxb0twWH0WLJzUmM6fkyxCDu9nS3T1hc3vBsTY
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzOCBTYWx0ZWRfX3BVhCLDKz25a
 ADcK7+NDoLl7itzkjfH3gWwOWQGYvcA4q8ECkQ9uqouyVjUKVlfpbL6mg9JGgnhLVRhtjcYunmd
 qRBkRBovhylBzOG9ShRr9rln0PTMsqAxpBA+ohF6Z+jn0EVj53wBY4AAqD008QSYNMTCHj52NJP
 U8WHRFA/+ox57B58bGoHkkVCEP0+cunOopMaBwxwrckqusuNIW85e1K1j699xtUCeuDtzE3kN36
 WPbVr8PrtzkFFGYp0ISj1cQTW2utUv77V8OAjGLsZ4pX8wvJOnouAWZ+6P+RolMjlS83tUFYVnu
 +Am/6sib6Hs7InCl8KSA9KITG+hfW7RNds/Q+InvKKdoqLP5X7mjsNO6wZgeE9sC5ChOH5Ptnw+
 Vq24egolXiUIy+/h+EDpaefS9dmMPquQn46GH5rGbriCOd+l1QHlKOj9Vu1gm2XR5ltC7XwI/Vq
 54rsxwWygyXZDnB5mHg==
X-Proofpoint-GUID: dzX_VVk0TktBuo6XTZ_0UNbNtczfnG8o
X-Authority-Analysis: v=2.4 cv=VcVir1p9 c=1 sm=1 tr=0 ts=6abb8983 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=9-UI-1Rtod8VBy9dXc4A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: dzX_VVk0TktBuo6XTZ_0UNbNtczfnG8o
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzOCBTYWx0ZWRfX5W2ZJx3K0aJe
 1/U+1k7UQXWfaJUlyPl1iRUANia03MYd+ve5k5hMUhE1HwXu7h4+z5/llA6NgXd7rC3DOCgkgiS
 0WvDHsoIWpIP27uw7iL0N4ON9I43pdg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_024852_549106_60892117 
X-CRM114-Status: GOOD (  16.83  )
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

Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
(qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.

Peripherals included in this initial set:
  - Single Cortex-A7 CPU with PSCI idle states
  - RPMh RSC with clock controller, power domains, and BCM voter
  - GCC (Global Clock Controller)
  - TLMM pin controller (110 GPIOs)
  - Interconnect (aggre-noc, cnoc-main)
  - GENI UART console (QUP SE3)
  - SMEM, hardware spinlocks (TCSR mutex)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/Makefile          |   1 +
 arch/arm/boot/dts/qcom/qcom-kuno-idp.dts |  25 ++
 arch/arm/boot/dts/qcom/qcom-kuno.dtsi    | 444 +++++++++++++++++++++++++++++++
 3 files changed, 470 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/Makefile b/arch/arm/boot/dts/qcom/Makefile
index 026d5b682b2b..7327a7b8180e 100644
--- a/arch/arm/boot/dts/qcom/Makefile
+++ b/arch/arm/boot/dts/qcom/Makefile
@@ -26,6 +26,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
 	qcom-ipq4019-ap.dk07.1-c2.dtb \
 	qcom-ipq8064-ap148.dtb \
 	qcom-ipq8064-rb3011.dtb \
+	qcom-kuno-idp.dtb \
 	qcom-msm8226-microsoft-dempsey.dtb \
 	qcom-msm8226-microsoft-makepeace.dtb \
 	qcom-msm8226-microsoft-moneypenny.dtb \
diff --git a/arch/arm/boot/dts/qcom/qcom-kuno-idp.dts b/arch/arm/boot/dts/qcom/qcom-kuno-idp.dts
new file mode 100644
index 000000000000..c2f6650d3fe6
--- /dev/null
+++ b/arch/arm/boot/dts/qcom/qcom-kuno-idp.dts
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "qcom-kuno.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Kuno IDP";
+	compatible = "qcom,kuno-idp", "qcom,kuno";
+
+	aliases {
+		serial0 = &uart3;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart3 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/qcom/qcom-kuno.dtsi b/arch/arm/boot/dts/qcom/qcom-kuno.dtsi
new file mode 100644
index 000000000000..9b111525e12b
--- /dev/null
+++ b/arch/arm/boot/dts/qcom/qcom-kuno.dtsi
@@ -0,0 +1,444 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/clock/qcom,kuno-gcc.h>
+#include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/power/qcom,rpmhpd.h>
+#include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,rpmh-rsc.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	interrupt-parent = <&intc>;
+
+	clocks {
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			clock-frequency = <38400000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32000>;
+			#clock-cells = <0>;
+		};
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x0>;
+			enable-method = "psci";
+			cpu-idle-states = <&little_cpu_sleep_0>,
+					  <&little_cpu_sleep_1>;
+			power-domains = <&cpu_pd0>;
+			power-domain-names = "psci";
+		};
+
+		idle-states {
+			entry-method = "psci";
+
+			little_cpu_sleep_0: cpu-sleep-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "standalone-pc";
+				entry-latency-us = <350>;
+				exit-latency-us = <450>;
+				min-residency-us = <1774>;
+				arm,psci-suspend-param = <0x40000003>;
+				local-timer-stop;
+			};
+
+			little_cpu_sleep_1: cpu-sleep-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "pc";
+				entry-latency-us = <550>;
+				exit-latency-us = <750>;
+				min-residency-us = <6700>;
+				arm,psci-suspend-param = <0x40000004>;
+				local-timer-stop;
+			};
+		};
+
+		domain-idle-states {
+			cluster_sleep_0: cluster-sleep-0 {
+				compatible = "domain-idle-state";
+				idle-state-name = "cx-min";
+				entry-latency-us = <750>;
+				exit-latency-us = <2350>;
+				min-residency-us = <9144>;
+				arm,psci-suspend-param = <0x40000008>;
+			};
+		};
+	};
+
+	firmware {
+		scm {
+			compatible = "qcom,scm-kuno", "qcom,scm";
+		};
+	};
+
+	memory {
+		device_type = "memory";
+		/* Bootloader will fill base and size */
+		reg = <0x0 0x0>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+
+		cpu_pd0: power-domain-cpu0 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+		};
+
+		cluster_pd: power-domain-cluster {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&cluster_sleep_0>;
+		};
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		quickboot@82100000 {
+			reg = <0x82100000 0x100000>;
+			no-map;
+		};
+
+		aop-image@82200000 {
+			reg = <0x82200000 0x20000>;
+			no-map;
+		};
+
+		aop-cmd-db@82220000 {
+			compatible = "qcom,cmd-db";
+			reg = <0x82220000 0x20000>;
+			no-map;
+		};
+
+		aop-config@82240000 {
+			reg = <0x82240000 0x20000>;
+			no-map;
+		};
+
+		uefi-log@82260000 {
+			reg = <0x82260000 0x10000>;
+			no-map;
+		};
+
+		ipa-fw@82270000 {
+			reg = <0x82270000 0x10000>;
+			no-map;
+		};
+
+		smem@82280000 {
+			compatible = "qcom,smem";
+			reg = <0x82280000 0xc0000>;
+			hwlocks = <&tcsr_mutex 3>;
+			no-map;
+		};
+
+		tme-crashdump@82340000 {
+			reg = <0x82340000 0x40000>;
+			no-map;
+		};
+
+		tme-log@82380000 {
+			reg = <0x82380000 0x4000>;
+			no-map;
+		};
+
+		access-control-db@82384000 {
+			reg = <0x82384000 0x40000>;
+			no-map;
+		};
+
+		secdata@823c4000 {
+			reg = <0x823c4000 0x1000>;
+			no-map;
+		};
+
+		modem-efs@823c5000 {
+			reg = <0x823c5000 0x10000>;
+			no-map;
+		};
+
+		cpucp-fw@82400000 {
+			reg = <0x82400000 0x80000>;
+			no-map;
+		};
+
+		xbl-dt-log@824c0000 {
+			reg = <0x824c0000 0x20000>;
+			no-map;
+		};
+
+		qtee@82500000 {
+			reg = <0x82500000 0x180000>;
+			no-map;
+		};
+
+		trusted-apps@82680000 {
+			reg = <0x82680000 0x600000>;
+			no-map;
+		};
+
+		mpss-audio@82e00000 {
+			reg = <0x82e00000 0x5a00000>;
+			no-map;
+		};
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		gcc: clock-controller@80000 {
+			compatible = "qcom,kuno-gcc";
+			reg = <0x00080000 0x1f4200>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>,
+				 <0>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		qup0: geniqup@9c0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x009c0000 0x2000>;
+			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
+			clock-names = "m-ahb", "s-ahb";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			uart3: serial@98c000 {
+				compatible = "qcom,geni-debug-uart";
+				reg = <0x0098c000 0x4000>;
+				interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&uart_console_active>;
+				pinctrl-1 = <&uart_console_sleep>;
+				pinctrl-names = "default", "sleep";
+
+				status = "disabled";
+			};
+		};
+
+		cnoc_main: interconnect@1580000 {
+			compatible = "qcom,kuno-cnoc-main";
+			reg = <0x01580000 0x19200>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		aggre_noc: interconnect@1640000 {
+			compatible = "qcom,kuno-aggre-noc";
+			reg = <0x01640000 0x33400>;
+			clocks = <&gcc GCC_SYS_NOC_USB_SF_AXI_CLK>,
+				 <&rpmhcc RPMH_IPA_CLK>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		tcsr_mutex: hwlock@1f40000 {
+			compatible = "qcom,tcsr-mutex";
+			reg = <0x01f40000 0x40000>;
+			#hwlock-cells = <1>;
+		};
+
+		pdc: interrupt-controller@b220000 {
+			compatible = "qcom,kuno-pdc", "qcom,pdc";
+			reg = <0x0b220000 0x10000>;
+			qcom,pdc-ranges = <1 148 6>,
+					  <9 156 2>,
+					  <17 164 7>,
+					  <26 173 1>,
+					  <29 176 1>,
+					  <40 187 1>,
+					  <46 193 6>,
+					  <52 266 32>,
+					  <84 249 1>,
+					  <85 256 1>,
+					  <86 315 4>,
+					  <90 43 1>,
+					  <91 45 1>,
+					  <92 154 2>,
+					  <94 158 6>,
+					  <100 171 2>,
+					  <102 174 1>,
+					  <103 23 7>,
+					  <110 147 1>,
+					  <111 31 4>,
+					  <115 175 1>,
+					  <116 177 10>,
+					  <126 188 5>;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&intc>;
+			interrupt-controller;
+		};
+
+		restart@c264000 {
+			compatible = "qcom,pshold";
+			reg = <0x0c264000 0x1000>;
+		};
+
+		tlmm: pinctrl@f000000 {
+			compatible = "qcom,kuno-tlmm";
+			reg = <0x0f000000 0x400000>;
+			interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&tlmm 0 0 110>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			wakeup-parent = <&pdc>;
+
+			uart_console_active: uart-console-active-state {
+				pins = "gpio8", "gpio9";
+				function = "qup0_se3_mira";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			uart_console_sleep: uart-console-sleep-state {
+				pins = "gpio8", "gpio9";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+		};
+
+		intc: interrupt-controller@17000000 {
+			compatible = "qcom,msm-qgic2";
+			reg = <0x17000000 0x1000>,
+			      <0x17002000 0x1000>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+		};
+
+		timer@17020000 {
+			compatible = "arm,armv7-timer-mem";
+			reg = <0x17020000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			frame@17021000 {
+				reg = <0x17021000 0x1000>,
+				      <0x17022000 0x1000>;
+				frame-number = <0>;
+				interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		apps_rsc: rsc@17040000 {
+			compatible = "qcom,rpmh-rsc";
+			reg = <0x17040000 0x10000>,
+			      <0x17050000 0x10000>,
+			      <0x17060000 0x10000>;
+			reg-names = "drv-0",
+				    "drv-1",
+				    "drv-2";
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+				     /* drv-1: placeholder (unused) */
+				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,tcs-offset = <0xd00>;
+			qcom,drv-id = <2>;
+			qcom,tcs-config = <ACTIVE_TCS 2>,
+					  <SLEEP_TCS 3>,
+					  <WAKE_TCS 3>,
+					  <CONTROL_TCS 1>;
+			power-domains = <&cluster_pd>;
+
+			rpmhcc: clock-controller {
+				compatible = "qcom,kuno-rpmh-clk";
+				clocks = <&xo_board>;
+				clock-names = "xo";
+				#clock-cells = <1>;
+			};
+
+			rpmhpd: power-controller {
+				compatible = "qcom,kuno-rpmhpd";
+				#power-domain-cells = <1>;
+				operating-points-v2 = <&rpmhpd_opp_table>;
+
+				rpmhpd_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					rpmhpd_opp_ret: opp1 {
+						opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
+					};
+
+					rpmhpd_opp_min_svs: opp2 {
+						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+					};
+
+					rpmhpd_opp_low_svs: opp3 {
+						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					};
+
+					rpmhpd_opp_svs: opp4 {
+						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					};
+
+					rpmhpd_opp_svs_l1: opp5 {
+						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					};
+
+					rpmhpd_opp_nom: opp6 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					};
+
+					rpmhpd_opp_nom_l1: opp7 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					};
+
+					rpmhpd_opp_nom_l2: opp8 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
+					};
+
+					rpmhpd_opp_turbo: opp9 {
+						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					};
+
+					rpmhpd_opp_turbo_l1: opp10 {
+						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					};
+				};
+			};
+
+			apps_bcm_voter: bcm-voter {
+				compatible = "qcom,bcm-voter";
+			};
+		};
+	};
+
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+};

-- 
2.43.0


