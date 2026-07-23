Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F247CC4452B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 04:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ogOnkizJDQbuq0BIHPpDBbizrKgtonMZlEbEehGvr4=; b=GKTJ8uWA3OcGUQVjWao0T5uXsv
	huzkpTF8lZkbPxCtl3RwKUqoJsGuS0Q0AhIdD0ulMpywzY8XuEG0ZXyhwo0QH4FA8I1UwI7mtMai/
	4YD31ZVSUU9P7odF0jYPxO3j2phCzHTj6PApn5Aox/RFhdZ/zbfUJn2kGsF/ExknwECkK7kMoUAaF
	Jknq8IaiNLrPhQ3ru8U816w++Ugz3xZwSI66tT5w6ziFPSpwIkY2L2xWGY+Fw49zF35+dU/yK//yO
	nshy4sJdQRM6cQpyfCibxF6lDfrTVndpcb99ZULAk8xQ+aROXjcED9iqz2qNWS8swU+pnt4MasdfS
	712yFuYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmlIg-0000000DQA2-3SXx;
	Thu, 23 Jul 2026 04:44:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmlIe-0000000DQ8X-0VpK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 04:44:49 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0Wrw02537735
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 04:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3ogOnkizJDQbuq0BIHPpDBbizrKgtonMZlEbEehGvr4=; b=ko9yxgPnI2Jg62yb
	wFAMtqQT2XRL9LivtLbBLDosOgM6Pcn1K3zjQmTtCh8q4K1BIGOCxCz5rlJxgKeC
	xp5cMech2j12I/6lrKQPEgP/cBZ8SY9NBKC5fuDRpBgI18d3PG1pJiKEEODnSeVU
	kFdGyrRcu6ZWyI+sPsLdlutqwn0Ed9HR1FD+HB+FonnLZ/uV+OZUXI/mt0CSzTjA
	UZ3SVBx+BihL5atNuQpCB3etkx+cysq+jU6HzTvzHr14Yo11IN9gpTW9zGG6SPwk
	TsXfUt5X8gVVc0Q6to6YmYy1cLDHruxMyKhIdI9QXsrm++iwv5Q+1nY2tpbtCDpv
	EW9pRg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk5cc1dgd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 04:44:47 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84e0234967aso244310b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 21:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784781886; x=1785386686; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ogOnkizJDQbuq0BIHPpDBbizrKgtonMZlEbEehGvr4=;
        b=S3NqyY9eoiinWO5VBhXkKEJMpFU6AfGWVlp6MvCofMjvZTF9vQ3tN2vmXPG2AygrJ1
         /Urst/CppupsKBLMHAfej9LEf/g6bo1VJiC55iSmoAUKuPCLRBPxfJx+FH6F3n1h2oK8
         99vNnOU3OLdX0kyZcZ3rCpvd+CvnwO8NO2VhLpVmr4n6JRSxWW2CEbOPeKx91iWrydUO
         CU6l+0KmkVGHdSPTT/LafuYGoVggbIiE1wW5tV0Ysgltzb/I4FcCcdwwyyUUPFaQhM1t
         +HJ4pv1jICCL2/e5WntgTFadKPIHQ2gCyq6b+TwT8CIIhPcDzt/fuzcivjhn+WdCKqVe
         dlog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784781886; x=1785386686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ogOnkizJDQbuq0BIHPpDBbizrKgtonMZlEbEehGvr4=;
        b=O5jdJs3Th1PUtOpEFvjWyPwnGprnHCNbAkTvxEt6OcEB98p6eCeMr/BBNPH8B/ri8x
         LkcZPm9cZ2jK2iT5nRxiotKm1frLz+SPU1ycDqwilhzX7WTKIkPbUU1Ci0IC19XJ22b2
         sIOn1dB4xmADtHqdMLtFFqUUvm/imgyzQzJzK/Rdly5DtHxetO9BlFtI0cZryVauAwBL
         dLeYC4jNHDyvOAhCFMKMuzmfgpySqkMW38cxlBEgS0gSNJnqNV3VzptNNPHZNDHQ91ns
         3w5AYlxif3WX7Gh385rTIDl7//gzLpy5RTuFwA+VQbEnMo0ADHd3atjooh3OOTF0lgJn
         x5Rg==
X-Forwarded-Encrypted: i=1; AHgh+Rri63w8AHIiQ9NJWKkKsnUptshDVDhp9J3XWYe1EhVWuf07t+AHzfH8KNNKlZmkTc1hVean5oT1A34IShtENjkY@lists.infradead.org
X-Gm-Message-State: AOJu0Yzxqj18LRZ0O/5GllWx9feN+yKexLcZL2PZL9BrKZ0DAq+SdgxQ
	zDOtQeLussVeSFucG9KOCO/2WAp+2iR2+PZT7AM2LjytyIN1UGV0JC/9CCH0NoTqZAQF3Aik7U/
	fGSvhjFqoNnfimmZ8I8FinLR/BEiaxDysMZdlaL9W60jY49AxJWIKS6p4kMaPJWOy6tAZy7NLiw
	UCYw==
X-Gm-Gg: AR+sD13S/gqbLmb1f4v/uWjL/6JolsU2+XzCujqOVsbo9RvSkvmTdPrXx13q0BD+Atq
	x919d15PoW9Km+4w3qszpP6Fi5DaA5t2TB1kvjfvR+o6sKSrnwp9tOdroY9w+GRDSBXKgwLbbw8
	3mb3ji4MJdPHhVucS89yGYifdK3XLjWzORtLYGLtHfeuFtYARsQShlgGFaBDV73r2ABWdgWcA7q
	E0DMX6qI1OatnVDAYK9adYog8LWqPgXfGJyralJd2FNG1910GlJZjnPDZqk1W+NxrB8IRt2Xld9
	gPji5wkAkws2O4uRV235h5I4vHttyuRbAxlG2K1cGWV7U0BoICJo9df9z3WCD081AJ/7tFWWuIU
	rQ9wnymQ/ofgY9HUp+zGqL50mpfbfsi8=
X-Received: by 2002:a05:6a00:3d12:b0:848:4080:afe8 with SMTP id d2e1a72fcca58-84e2b8c0dd8mr1961072b3a.22.1784781886126;
        Wed, 22 Jul 2026 21:44:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d12:b0:848:4080:afe8 with SMTP id d2e1a72fcca58-84e2b8c0dd8mr1961044b3a.22.1784781885645;
        Wed, 22 Jul 2026 21:44:45 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175aad1asm2327922b3a.44.2026.07.22.21.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:44:45 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 10:13:59 +0530
Subject: [PATCH v6 5/6] arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera:
 Add DT overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-shikra-camss-review-v6-5-7c46f9bbb4db@oss.qualcomm.com>
References: <20260723-shikra-camss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com>
In-Reply-To: <20260723-shikra-camss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784781838; l=3728;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=ZA3HAjflV0tkYLC6Nd8u+XrixaMrLTLfnMhVUY6WrUk=;
 b=fsDQyLQdGt0+M0g6Jbs9vEsnskbJSfkprD71lfYYse3dZ+f+VAClv/FZ3qv3yVTRSJFOvqcBX
 PPOVvCxk+vRCwutJYlt3CvKpqCcDkSqCdPGCqKUdxYLx1QQR5DUO2Nn
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: iFsh8obX0XgSy3mejFrKT8HAXh1NR9fZ
X-Proofpoint-GUID: iFsh8obX0XgSy3mejFrKT8HAXh1NR9fZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA0NSBTYWx0ZWRfX9Amy4tx3bf3m
 a4n75YveMQFvNOaDI7hffvhuI83BJNZwe5ACGNHMahmaiffUi9aB7Ub5RLPUOBS/JTL5VLOrfVz
 Np2JSBtfmH2Zrl0zqpbd4bXtim5eZQQ=
X-Authority-Analysis: v=2.4 cv=L/ItheT8 c=1 sm=1 tr=0 ts=6a619c3f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OGCdAuOInqFJiNoUztwA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA0NSBTYWx0ZWRfXxEftwdXaRkxj
 /o53cJw0m+pkExl83bwYXLI0/Q+Cboawurp2+A1Om93mdRM/rKjWYeAPUkN9bltyD1waGCFkGNb
 eNo08GLAR34N0c4H1FDy6rZ2SFC6n6kmEyv7zGa0w40/fNu+PM/uInzrdPXV04Nw39x4Bh0F65F
 Hgoqoa5slXLaCz3+H+KaK3wxna4zEuj3pgATv/x8bJx9UXjyBPnk+RyuSuoKCMnuDZ9+b5goWTN
 xd7kKjSlp7GxZthwEuOa895nzy8UKbJQHWU/oBquP/S+ifNDGHFWYuxCMfxFKn51ZzEKrOp5VjI
 X6/pRDIcOP9IBLd7HGIa7khwXUJDovrsvAEgxqVBlVC89itm7Ft/NsVQk9I8FH2kcakHgKMalEM
 NL86n2x0OJeFLxWCA5wOPSLxATw/3OUIbaoxOvZcaSdcCpMtzhhIwWTfGK2Q4KAFsAx4ifDErOU
 ZOGeWlrJOoANUe6aGJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_214448_317815_109F9DD8 
X-CRM114-Status: GOOD (  18.55  )
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

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  6 ++
 .../dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso | 79 ++++++++++++++++++++++
 2 files changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index e05414290d8e5692accc758bbbe472f2f959a0ce..c75e0ae736a96b047c04305bb109cacf06d06f07 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -338,6 +338,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
+
+shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
+shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso b/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..3a481d972cd27a2a324d96d8f47c161e11ea54f3
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso
@@ -0,0 +1,79 @@
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
+		dovdd-supply = <&pm4125_l15>;
+
+		port {
+			imx577_ep1: endpoint {
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&csiphy1_ep>;
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


