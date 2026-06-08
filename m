Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 267AECD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uowIbmQnqqTqEZNIE5zF312ZxkTUFs3Y6T+ij+Tr/3U=; b=wTDF3a8RiKL27NG+3h1SoOFG5P
	lXgNpAk9wiCQZT2/bPKA/qAoFwi0opv91AsgW/meTgaZHD9o4ZzuOvliSv/3K+8/J0FI/KBkybF/3
	zhz7eIdtFRQOhG1zjhOikvfRrGQaSI1gO/qgKrPubPKtrszG6UnXMQMXDTQYRDw8wRjrsEYRIG0xo
	r+LtDl5I3UDKTpJC5ziMTsG5f9MMrXP4G8llENWGMUZjCV5gOT2PMJkQbnvg7qxVZkNDr6asvlcLV
	HNEjPKRxvMcw0Q7ZZbdq5Es+FTdHoeeYd1vQjsfovTkFE+JUbxOSkvkRHR57W8LJEPId+6JCTdLZO
	M1EhSZvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWadt-00000003hRb-34ZP;
	Mon, 08 Jun 2026 14:07:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWado-00000003hNG-3yWJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:07:50 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DRG7O3682608
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Jun 2026 14:07:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uowIbmQnqqTqEZNIE5zF312ZxkTUFs3Y6T+ij+Tr/3U=; b=lDKnJ3kSgJhbfbqt
	MNVlv7Ls73L2WU+K2WCuwEOle4vBhZgNxJsquGcD3Djl8ylUxfqZdz+JZDz7c+BF
	DPljUoRAVIhn/ZYwRiCcHA6wZgVr9tiGOp0kwtGXYiIIHiWbGKmDAK8/CwYKL28O
	McN1llrjJbxIthWUjBTpBva5foQ4LuqSzh8QH6bQYCpRUpvqAhDOR6l8hChr14vS
	4y9jl9kWgg8Cc/OcksYDe6vXCWgQ9HovNzmOMc+niAEIQO4HZVnHLW0B9UkbJfuj
	hH5d/wdMrBoDqRpXCmHmpPbB+T4+26oxQf3aceeNCGkUrcuaOot/haLykNMNZ+R5
	gH5xcg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enx2rrcyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 14:07:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf335549b8so68578725ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780927667; x=1781532467; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uowIbmQnqqTqEZNIE5zF312ZxkTUFs3Y6T+ij+Tr/3U=;
        b=TNVfQSFnVqi8JbjmI//oRJibWiS7I0BgtUfovW+Pg1MiANC1qzJ/QMe20FMOrpySVX
         iMnGTxt9BqvgOqf098ht1LhBMFkSba74/st8SyVwkGSPnZhWswETDiK1UFtPwsGOmJXy
         6HuegC0HVzZcTndEO3BUvpITKL010uqZgC52cf0y6Q+IjUD2Kpy4WWMYdWGH4NdpnrtV
         bPW/03bMo666GcxvtjotxqIzr+WqJ4QOF6peSnAUQDP1sa6f4g+ZCTDANNz0GP1REZ27
         BL/mbyIFi85t3yu5wCVxA4C21LVMd1KFyb04M+9ysll1rV0ePjDm9eh8FUaB51dVb3pQ
         mnrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780927667; x=1781532467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uowIbmQnqqTqEZNIE5zF312ZxkTUFs3Y6T+ij+Tr/3U=;
        b=IQswRVo/S3p1hqBvrh8YLYvcq+3V1GwK4uBkQkWUP9iJWsS8kz52ikpXIp443LhFwy
         hoNtC8gMMxLK0OZPJ7WkJg/nfBH+xTJFoFVVJH0+OkTqtNT0vPoZsTg4W9O8c6GI+kVO
         jEsdtkodgjF9LG3jyUCQPuQq/hhP5tRZ4MiBheEPcXibo/RAJv4TqK3iKUp6fXVLsO/p
         gfJyAsL3Tto2S7E5bBMGUL7lD/TxkN962pI6Bdrl3zk3QqA9T+04V+IEsgnukWF3cUxM
         SrubzpLH47Ba8oVlFsdjqYjFuQkE7rELg/adnQ5g7+80onJTTbzIiKxjKc7q8wcSL+8a
         d/Xw==
X-Forwarded-Encrypted: i=1; AFNElJ8Cf6rNDSW/f7miRn3h5dar1/APE/EX9Gqb43fuB+DVYT6kZaKKmTUP9yPApmmqeiAf3LDVkb7phugUaw7klA/b@lists.infradead.org
X-Gm-Message-State: AOJu0Yxagr2vpjBrlNyED0hpgX4Jv4SzaIHiZFlzjShI0hiyQH/LorM+
	XGu5hgJiUntav5R8PCEZHN1n2RofMqhCAJUMe/tqvY2s+ESa1RR1Zth6b+3u6TJPvnpLd2Fs6ZT
	DalgBg4bSYPVEk2Ng1w6ICqst9TmdgMYeFUYoixmJ7oof1KvYjp1/V7y1qwyRHX1SwHj/20+AX4
	sz8UxUl3YgXx/j
X-Gm-Gg: Acq92OGAF1iiPpx7TzuhgXTkHCVb9w+8O2rUnqoZe0gZox0FSAA/H39rqh9Zj/tfE/h
	M7pye9WF6SKeDws5JM8mOlXAWFS0UTXdPk6u93+DYd31hUIA+xL14o9P53r6I+vt7fYlpO4k83z
	N1g/Eg4aEqhCZWi0OC9XsvFMd7b1x7Rfsczm+P+N1kRgDy6SsJ7eF7JAWs/MpQzGx6UKol6N/bU
	7Jaa+474XdIl7nuWOCRdbj6XQ2LcZ/uc1OxJ/YjVg7intSotBP/GjqPE6mt64Pboj23HGoMaVMB
	fiqESCnmMV9yrWo8Hco5vWnFFy+f8mhXa39KQhyEdinUk4AuGKCbVHTW+2NlX0tSsDkcs/PKr79
	1NeNBOHNR8HTnOovzwN19AXeMkThlD2GtqydPVz7eQXruN6XjwnLGNLgVtqC4mIA=
X-Received: by 2002:a17:902:fc46:b0:2c0:cbd8:5ff9 with SMTP id d9443c01a7336-2c1e8209a20mr170708495ad.21.1780927666842;
        Mon, 08 Jun 2026 07:07:46 -0700 (PDT)
X-Received: by 2002:a17:902:fc46:b0:2c0:cbd8:5ff9 with SMTP id d9443c01a7336-2c1e8209a20mr170708035ad.21.1780927666352;
        Mon, 08 Jun 2026 07:07:46 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1646e5c51sm183935955ad.0.2026.06.08.07.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:07:46 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 19:36:44 +0530
Subject: [PATCH v2 7/7] arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add
 DT overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-camss-review-v2-7-ca1936bf1219@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780927607; l=3961;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=A0s5+Il8ZVmbH5Bso5yDr6ndaAOTDuKArql6IBzS6b0=;
 b=PCkywFV7Ad1LRXpneXA8MnC0iB+aPRyZ0mGEDWhbytABVjXWkm9rSmmQUKCE2QhjynCeF8zXu
 OKdXzoaI0E7Am0/2XMN1Hv+zsuifI5Kn6HZcFpG2wL1M7leJZQ5MguD
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: jZlIp-vPtH7xyDxDbGCtpuT2OIpQYepx
X-Proofpoint-ORIG-GUID: jZlIp-vPtH7xyDxDbGCtpuT2OIpQYepx
X-Authority-Analysis: v=2.4 cv=JdqMa0KV c=1 sm=1 tr=0 ts=6a26ccb3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=OGCdAuOInqFJiNoUztwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMyBTYWx0ZWRfX9imLrYX/TdCu
 fdN2FduWXTXvv4o0YIGHZCrtCkWexEvRy5o7ItHJhAWh1i3iaLvw2wKKdjfa1wwB/yxJdZSSMCX
 szRLhTBYYCYv5UrnBY930RMfLKgoFOoNK+6jQd1hAqtp1gdtp31yjpTwsOnpx37qP0RE3neXzM1
 K0vZlEGUpaH/X5Jnlq/P95g+/BNXvsTJEj632/SbT4mVnZ5UAZVUz+JCdkpxpnLKEDDkq5YusDi
 0Yt3BT9AOlHh1RADkOJNClLtvyITeBlY/DYBB1CsdrUazIEqr9V+Q6ESknRVc+gHE/m2C/cldqw
 KTN4iSQBbX5ZOxwuBOC25DwPqiio9bhJD+u18ITd6AVmOZ6x6NPmuzoGqx2w2LhvVRSMNG6Fgck
 EUESZzqnKMX9/sRD7hrU7DCMe7H8e25sU6059LmiPepDJfp6F4pgfbTinYb22YztC/moetRo1Ki
 AN9sfbMzd5815kTRD6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_070749_113332_3CDB84D4 
X-CRM114-Status: GOOD (  18.40  )
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

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  2 +
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     | 70 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts        |  9 +++
 3 files changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 76b8f144983827f4905a72935e8d5291a227dc97..09f2318d1c12c4239a6a7bac4ecbca38eb65ffa2 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -340,9 +340,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
 
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
index 0000000000000000000000000000000000000000..340d6303adc6e1bea55f1bd0598175f0cb269737
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
@@ -0,0 +1,70 @@
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
+		dovdd-supply = <&pm8150_l15>;
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
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 3003a47bd7594206f0ac54957e0af509fa365f54..811fd5da4af7babd412d70fee84434849846dc2f 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -38,3 +38,12 @@ &sdhc_1 {
 
 	status = "okay";
 };
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


