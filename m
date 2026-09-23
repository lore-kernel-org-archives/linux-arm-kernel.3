Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976DFC98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 04:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ALesk1DpfGIEfjQUFR4dRWvtQCbr1M6t9o6IkKBqb7k=; b=A6ar4syAqT2V3DgOCFl1cRsZHV
	gj+jdGu68yXjm0gK6RDG6bFtGpbWBb8kPSEz1CYWNd/D4vijwY9jBnjr+yLKYbfzUhtejmioXboFW
	Q2BSN9TAlKND758N11U/a6r6aV1YjgpFEWim2FcJ9wER/NTNcTywxy7gDn6iM+6IZAUk4Up9C5tUD
	KDxr5BhauBlIuSPcmHozfRlr5Yvhrk7fBKtvWy+xmYTsZ0a51iBwL25m7T+XzF0wFKIHJyQox3SiU
	Jg95ZP0TwLpaeVsFYT0ZjxRag2GFmWX33am+zO/KAiU7MVnCA6YrPgJUBurB9EJO4vrOqqFHuFNII
	kADS9xWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9F4Q-000000079Ej-1mPY;
	Wed, 23 Sep 2026 04:59:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9F3t-000000078wp-2UXw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 04:58:32 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3iVv23095889
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 04:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ALesk1DpfGIEfjQUFR4dRWvtQCbr1M6t9o6IkKBqb7k=; b=hDfm6N9LGUkWs1rc
	ziVwnB6GrscRv4S59/jPdpkqTgsuGJtBSozxi2VPs74e/8OVHmpScSRkTlk4zfAk
	W4wpcD9wUEKiSkmx1uSfthMxEWaqSNW7WCmDdF8YjYuf20isoDw6qQ8Ff4daplYR
	nPOWnGmaxCqcFJpgt/ygygzUXpdNdktosjFSxVGa/1L8QldG0wQjmExGoBEbThrd
	iZEb5zUGVH4x2CuIE/WlL/Aq9MSj4H1k7zoUP3u7FqSpUxr65X734kv+QDTHOS1u
	e+bzLfgxu7Tj8f7cO/vr/wUvoGZRDNQDRrlRW8Qz+THF0JosY9AWkhwLVwsLzjjX
	hs9nCg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv428rv9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 04:58:29 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-334f782d1abso1673081eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 21:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790139508; x=1790744308; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ALesk1DpfGIEfjQUFR4dRWvtQCbr1M6t9o6IkKBqb7k=;
        b=Je2frKhxBsyGgr9YjywoVmfdyuB4JCRf52ycpX7xogaX9n329fXqtC0iuNL9HlNBdF
         i0bEGj1Go0HRENRHRKOz7JOc4EjO39TCfI7+YbEXZ0hFMBeMMwECwx8ZLBe8PJ7fHFmW
         fBRf1glP4PA/1YHlsFIsk7cgZ4StPxHgfkaV+Nwb9GIqYEypo3PvdjOKjC42g20q7H7I
         QphIXPXWm9i9KzwD7qydeBGTTj6TZwRQTSDcmmpRKLIf7iq8SYJZDOL2dv00t9CDIqtM
         ZOAuheqqBjhyq7MtPrXNdPgz040dF08xyyd1Ex+qwmfIWzZRxy3CXm5ZRPUCxG47Kwri
         Zswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790139508; x=1790744308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ALesk1DpfGIEfjQUFR4dRWvtQCbr1M6t9o6IkKBqb7k=;
        b=qP8gHYShrXuLh8ZhxfaJy6VRzpNs/47zlFvTE8AAkSBm5QqNTlCF6w7ZaCEDCjtpYU
         saRiZNDrPe9QNwWFO+krrzcwMmr7F0uLNZIjcziOUjBaU/TuKyL9O/ZQlSKATiMRdqEG
         REhzVGctGBPmZE4fEunpBu3Nybq+8EZWw1BSWHQJYQ709Q6BhgymfFKOZTA5RhlzN2Td
         MoSAEmDgRNZZEUaxeSo6izvuax24s4aI6Y7DmQ6T3AqvUT79gXc0S9ehkdeJtSU5+v+T
         /YMFU2jCaa094uof4fLn7FNIQsEiV9Z4nKxX4HvXtCU45XdWNrATjJngwm8HbmBpx57M
         gjyQ==
X-Forwarded-Encrypted: i=1; AKwUvByFIExVbnOknFJqTjPTrAvd+SEZmkc0trE1BGeheVMItXRNmQLIFIqWEBZkYNXu/HcQ21Rh5T0QD8L63iqdHdze@lists.infradead.org
X-Gm-Message-State: AFuF++mpNv9F1ugCoeQ0pBA8A2pyH+2qR1+NKvTXuy6872i1ydJFmHmG
	GC6lDfI63Vp8pK8Ug+NGAF+YBfXd9/YFezzLfzEaMOpgaBFpWU3HiNmDwbx9o2JaSXc7G51bY1U
	gBNcZXGUvKtgdq4j+KzyiV+QEaf2fjflncCms+CcdV1FwJQtNlZnlL7g8HBICLKvFU/0UVJXRMW
	muhg==
X-Gm-Gg: AYBFou2MQWzXaOjF+KEGweqwD+6Gz3kh+Oa9BpsztSjFZEtC7wHRXk75fdKIuDIvE7C
	WdDY1xCu0ty/DiF6auXlobiXOnN92L6nNmJMYKZn/CC4mTQep+IUmTjgMyyBNaJLgzY4QdHSbPM
	aLJ2zwbOHxp1gUwMl3WYMrBgyHQa4G3CN57jiztRBFp8PJx3n/rQy1DufYg8mfff1fMi26SF7j2
	GKF33gnapDFHwyH7r+owUYFP35kNQpZjZrS7SHaXtCxpXVxRBNVJsGkv8hbgk/cUH6jnXA8sq5g
	82SNySlf0/UT+j4uD3/gbuenXBK6yg/0YZBbRn+g7Mi51MEh+9Kfgl6D2sLsAakamtdE6yt0gc7
	zaSBqtZvHFxamXfDo+CTDzLLP8vIw9bhilPukAFek
X-Received: by 2002:a05:7022:6984:b0:142:d676:146a with SMTP id a92af1059eb24-144f90a43camr2679260c88.9.1790139508208;
        Tue, 22 Sep 2026 21:58:28 -0700 (PDT)
X-Received: by 2002:a05:7022:6984:b0:142:d676:146a with SMTP id a92af1059eb24-144f90a43camr2679224c88.9.1790139507627;
        Tue, 22 Sep 2026 21:58:27 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96e48e3esm3168907eec.26.2026.09.22.21.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 21:58:27 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 10:27:32 +0530
Subject: [PATCH v9 5/5] arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add
 DT overlay for Shikra
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-shikra-camss-review-v9-5-09f5fbea1309@oss.qualcomm.com>
References: <20260923-shikra-camss-review-v9-0-09f5fbea1309@oss.qualcomm.com>
In-Reply-To: <20260923-shikra-camss-review-v9-0-09f5fbea1309@oss.qualcomm.com>
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
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790139451; l=3645;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=Ypq6Dg2eVufbD0MjECY4yykbq5Ag7/VlnHbUB0+5woo=;
 b=NHlaTzoTtEfC1dvSh+miiBbhXHuphwoVF4uPUO8q58vHBJp51O0iu6shpajiOpelJgb4yzArI
 LrrGc+pOAF5DyR1VjslbZJT7r3bfTurAcwVbswgTofksQnDIzfAK/ar
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=EZdd0/mC c=1 sm=1 tr=0 ts=6ab35c75 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OGCdAuOInqFJiNoUztwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: MIUHWijCrt-Bf6PtiDgBZgKsMuXrH_mT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfX73Ve982n9jb0
 qHfs44wgnmhM7mTsjCEKB/I379gpWjcxAK+svPGrzYpzeipwGd4o3wBR6IatQv/+PRIBc4H6Frr
 x61WJqlzd/SN1ODax9abaJf5E7hSY9hqwJg398UJf1WRgw/nkIKEzkDTAPDB9KLJsa8vxZuRF6N
 fkrKsadP7jXn5I8X6ypoP5+/oPzQmK6B/qgNnb2i402i085www680Z1Btw3G1Ol7728wI7VpGOo
 eZN41fD51sQp+fQyyhgwmeDcRS0M7z7rG737lAP3lhBj0LpMBlw57MlCKDqPImpTvpEJviATJN4
 3UrlfZy8XumEu4JV57AL4L6ojIO49Cb9VblZT8aikAvmY6U82JHudyGkD3V5Eg5qig9QMng8x8z
 eyqudCAj9CgkH0nVZiY07dzIY+WzVmaH1zOzZo4hnpilmDPrBp9L0QU/bZNivkpg33lgbarJpg4
 jRiVXeGg9cUncDou8QQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfXwe0pmOkOXBiV
 dWew+F1CGNnmrMR2UwRT8sasEHR4Kbj8ObEeVhfm79IY9haep+S7cltbdiSdQ1L4nJgiO1cOk+h
 7+ll5vfCo2bH8EEQOW3Zqn9oS+558ao=
X-Proofpoint-GUID: MIUHWijCrt-Bf6PtiDgBZgKsMuXrH_mT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_215830_955339_B917CCA5 
X-CRM114-Status: GOOD (  18.50  )
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

Shikra IQS is an industrial-grade variant using PM8150 PMIC, requiring
different CSIPHY and sensor supply rails compared to the retail boards
(CQM and CQS) which use PM4125.

Add a dedicated overlay for optional IMX577 integration via CSIPHY1.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  2 +
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     | 72 ++++++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index c049c3b0637f306c242eb42bc3cc11a333ae012f..15068e8dcbf451c1c3f10e3754d1ea430c20b030 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -366,9 +366,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
 
 shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
 shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
+shikra-iqs-evk-imx577-camera-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-imx577-camera.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..e10fb33996e8e8a01e72a23d4e6b59f4ebbd9b1a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
@@ -0,0 +1,72 @@
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
+	vdd-csiphy-1p2-supply = <&pm8150_l11>;
+	vdd-csiphy-1p8-supply = <&pm8150_l12>;
+
+	status = "okay";
+};
+
+&camss_csiphy1_port {
+	camss_csiphy1_inep: endpoint {
+		data-lanes = <0 1 2 3>;
+		remote-endpoint = <&imx577_ep1>;
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
+		pinctrl-0 = <&cam_mclk1_default &cam1_reset_default>;
+		pinctrl-names = "default";
+
+		clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		/*
+		 * avdd and dvdd are supplied by on-board regulators on the
+		 * IMX577 module from the connector's 3.3 V rail; they are
+		 * not SoC-controlled. dovdd (1.8 V) powers the carrier board
+		 * level-shifter that translates CCI I2C and reset lines
+		 * between the SoC and the connector.
+		 */
+		dovdd-supply = <&pm8150_l15>;
+
+		port {
+			imx577_ep1: endpoint {
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&camss_csiphy1_inep>;
+			};
+		};
+	};
+};
+
+&tlmm {
+	cam1_reset_default: cam1-reset-default-state {
+		pins = "gpio33";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};

-- 
2.34.1


