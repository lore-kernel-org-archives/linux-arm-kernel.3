Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A320CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 17:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SHWN/CpABQpi5ue90hqnc7ukBQhLZVofwHgxOgWNJgY=; b=RgXWGZbOD1W6WKXBXj/2WVUjQI
	r7fizhAi5TFwNScxSDpgCSrsGYp/4XMmWwTj4/T5P4Di16KxOaYDpjYl4yIYZYkBsX22evVBz+8yU
	zYj6qS9t86BYFmqx2fSJMgH4v96CEMCqsPVnWIxLptSE7XGHxaWJ/3K0oIfhLlLvxTJ/1h0CV6bdD
	6Yg9bzrUdbXC7Qptd9UvRzFtlbfwAffPe3yMcdVGpUHTT77CSJ03TOGuFADQUPbdXaR7R/bjwSa52
	qAWsuaz2PFTVmVdisc3WTQXgvmXezS8XW3GuoOMbg/DypUnptEAczFZinayf3FJteqr/roCG+0vlA
	a0vWa9Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRvLl-00000002gFa-0HVL;
	Tue, 26 May 2026 17:13:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRvLj-00000002gDs-0Vbe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 17:13:52 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH18v12164212
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 17:13:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SHWN/CpABQpi5ue90hqnc7ukBQhLZVofwHgxOgWNJgY=; b=L7dFU35Z3epDssGg
	M2xP8S/TbeWLV1VeBbolA6B3kNJAPHA4m0X5VDYROVYcjaXuC3qtMAi9Za0oKz54
	6v5L2ZOtrkbfiAfnomKnXGj12kbO9HtQFDhSvjXJtJL1AZ33JrdVkg3aiFQRN4d2
	3M3UgHvzVctQ2r29ErlmV0qvJqwrSoGIgwo8LuEcWjL0lPKVasMNDxvl/SBbD+Dq
	dxHkcAG/lJSSt+kw2rW4DNLFk9dkxSrMYQ/M4ZRdUGYWQV+h+npmhDc7oik0siGp
	s63lH/dZ9uKGveKN/P2QYo5GZzqnmK0CWpv4jWBjNQ+kU2MO4aTOtFPmfYeDNCaG
	8F6tmQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqvwwcrt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 17:13:50 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-83f7e7f7457so6824585b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 10:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779815629; x=1780420429; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SHWN/CpABQpi5ue90hqnc7ukBQhLZVofwHgxOgWNJgY=;
        b=Dm7CQbBixq63O4qobxmDohaY37eGVuWTPv08tNZzeb4Mv2th1hTmz4IFVQ07RCd+rk
         xsjNIstgjYG5Arl55X7ohKjXBsvMXnNqmQp9U/RstO49++ofiU3IbidBBme3cqdP9Y5K
         0rmjX91GjlO1fRIkbrUxEgjj0lE5i3Qtp0PcplRtfMhVn1Lm2ZGB1DobiR9fVtovlz68
         BBsybPGpHokZNQ2GKj3eLFR+rkm73q9LSPDchtcjuhggLfQ7eZTqe/Je75wb+sqHvqbp
         u9jbivF0dIyBY2g5H6Doj+Q+lo1UUpYnamTd8QuCSyP8zvPmja79js3VxwSHPKN4huTC
         1//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779815629; x=1780420429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SHWN/CpABQpi5ue90hqnc7ukBQhLZVofwHgxOgWNJgY=;
        b=oxv6ItEWHkheTidw/t4cVaiooD51R5zvSfFAcLCO4OZ146FHZ8/xRKi0Cu50fmC4Kt
         p1wup4F7nOP55JzWoQ39b0lTca+FtgzjlOIdkYFBY/fUHM5N7tDpNBQKZkfjzsXLCojj
         OeGi/mMDK9mJYAOvZ3Fh39r+En3QqDtQmdubyfX/lpkw0d1bmrrTwMbd3DEnw2V/ONbi
         ZVuJFidzaKDAJUFhrZOlfKxslhxcdjFXBHvljU6NdYuzULyGLX5Rfew9dO/54/jW1XX8
         RuykmzxGtHNkrmbcFMfjrTzCVkUScmoKyi6PSrapOHHTiJsndwYHGPDZG/eh6s5d62SD
         TSuQ==
X-Forwarded-Encrypted: i=1; AFNElJ+cVTd5k6G98OKmb42Q2vq6vKOWlR2htcqjyZ3dE93lE7JBoErMk8L0NrfENX59Ury90DIp4mKS/gv8JqLfN4x1@lists.infradead.org
X-Gm-Message-State: AOJu0YzJchzTUoh1iuKKvq6MhA6ooJ/CFrDSxNzECxBtDCCvZBteAc5H
	46jvUExRlF7H4NcJaioJGyxP6OEzZdXkASyZxOncbA3ymo9R23mouUm0h/3/A7wXAQnfy1KcySQ
	V6VDoSbol4kcAcRP6Xo9Gi8WpVjepH8nx9w4/bcFiXmunn8iK3Raeytb16sGFJ0dMVW3xvhquck
	fJog==
X-Gm-Gg: Acq92OEWVeb2ven6F3+hSD9rUXeSohd0BVIN6UrY7E3iBHpS429501CZunqlcKWNl8H
	zWKM/vA50ozodcb4EmY956NOnqxQz3AICdtUveZKhxoIuxTEsfHOFISfDdgYZrESZWJSLfp6hvi
	3t4QHX5r2FISdtjFcQ+pDtzfeeab+khr/5KCjLGWB6HcobHTsphi/AJ0e/QVc8ZJHJCrCWoI2cy
	am4TWRSoy1dgdqYdUGL4jebT9QqGtha+Z0owWPZ4M5tZHGbGRDtxdZlqea0D0dE6irHuI760y0/
	iedCIyOXdQBRA3+tVkitu0vj7jK1dNqbrMQ1+FqdOd7UWzAE2tNY0zo5U0+NTP2kzjk63x7rKa3
	O2EPGlemZVG0xEd+dScMqVcwbsaNdN3xxgmqWlLUHPR1GakbU08EZtBF3xh5xgrQ=
X-Received: by 2002:a05:6a00:4503:b0:837:c1f8:6e55 with SMTP id d2e1a72fcca58-8416112c734mr14803828b3a.14.1779815629313;
        Tue, 26 May 2026 10:13:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:4503:b0:837:c1f8:6e55 with SMTP id d2e1a72fcca58-8416112c734mr14803793b3a.14.1779815628747;
        Tue, 26 May 2026 10:13:48 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165009761sm15736235b3a.60.2026.05.26.10.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:13:48 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Tue, 26 May 2026 22:42:51 +0530
Subject: [PATCH 7/8] arm64: dts: qcom: shikra-cqm-evk-imx577-camera: Add DT
 overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-shikra-camss-review-v1-7-645d2c8c75a7@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
In-Reply-To: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 9Me40P5LvP0h_TAfuLfXbBioFIjWes9u
X-Proofpoint-GUID: 9Me40P5LvP0h_TAfuLfXbBioFIjWes9u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0OSBTYWx0ZWRfX7R0AKLvyTySQ
 WS6nwuqnzOAXKHVi9dndYBYrK53SUf3gKWDIS2YMLPtOkUVFUPB+HnGKPvnQ1yZCQni4VvI1pHM
 OTB2H49SnNlvyAw1SXiJi/7mD5wPA4xwveJK3JmYd69NwZRfV4pEOAVeLWR7SJI9pCL8AoJE+Lp
 lLTM+VMAPEYmsHcV9FyldiZrzuQGCU5m1CltlN8Uc5MlaLKjpyVW6s8KtcOU5ILlkUOYxCmIN57
 O8pJvzHvVF8I/t7SxrVaDQO/4vuqrRZr9UK5H+pI6ieTgOSqdgYR7sMzHnqV3ALD2+rflHL4OEw
 W0HKnhEGIthFgwuTFCdkAzsoEaS77t7xXYDKXcK6sqAvbQCqeKj5aDWUcSWhCtF9aZANOjUknAR
 EUVgB5FTeVjdYM0IJTKTNjzKeZdXtPL+MqeUbkouqJOK1EePBKXKT60Msu16RgPuni0TTFzPpDs
 /BpazcrPwS16EnYjMPA==
X-Authority-Analysis: v=2.4 cv=M4l97Sws c=1 sm=1 tr=0 ts=6a15d4ce cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=2GryoL8Qn4L11UQNV9cA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_101351_179434_0729C4D0 
X-CRM114-Status: GOOD (  17.88  )
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

Shikra CQM and CQS are retail variants sharing the same PM4125 PMIC
and identical camera supply rails. The only difference between them
is the integrated modem on CQM, which does not affect camera hardware.

Add a shared overlay for optional IMX577 integration via CSIPHY1,
used by both CQM and CQS EVK boards.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  6 +++
 .../dts/qcom/shikra-cqm-evk-imx577-camera.dtso     | 63 ++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index a9e9d829fb962386b3975f345ec006504607130a..df41830e18edff82893ca24ca84d7e03065d0ef7 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -337,6 +337,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
+
+shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-evk-imx577-camera.dtbo
+shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-evk-imx577-camera.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk-imx577-camera.dtso b/arch/arm64/boot/dts/qcom/shikra-cqm-evk-imx577-camera.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..aedcd164810cf687efb425da79ace7ec6453e3a5
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk-imx577-camera.dtso
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,shikra-gcc.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&camss {
+	vdd-csiphy-1p2-supply = <&pm4125_l5>;
+	vdd-csiphy-1p8-supply = <&pm4125_l13>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			csiphy1_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx577_ep1>;
+			};
+		};
+	};
+};
+
+&cci {
+	status = "okay";
+};
+
+&cci_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@1a {
+		compatible = "sony,imx577";
+		reg = <0x1a>;
+
+		reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&mclk1_default>;
+		pinctrl-names = "default";
+
+		clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		dovdd-supply = <&pm4125_l15>;
+
+		port {
+			imx577_ep1: endpoint {
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+};

-- 
2.34.1


