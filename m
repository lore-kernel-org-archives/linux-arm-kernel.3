Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CD0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 09:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sSZ7t5V/1PHtqZoF8nlySg/mPA+7I7GC9LLE6/wWuss=; b=eNIGVFU2Zebpjxt1skZO6KncHY
	wTScx4k1JHJtf/yQ7dbRHiIiTNTpCoG6S28X9VkDktiiGMySmxopWf+bIRxzA7vE98I52zpiYKhzH
	uKcwge0sDkDL/bD/HSByYNefUCYkuHQ0ZOXqFP+5S4eY6xXK7OvY4VylzmRq04dgbE8wpcKA24lOl
	QYMi5QzMI5cPkWRDwF4XZpHqb1tIaqlWz1Gz55rIn9dNhonPhz2NEfJTjVp6srUE6FENvW9vjHGbA
	uWQYCYvtY4CDRrC72DC6+ICAayHE0AMlexgc9/Q5rZBq+3K8bM5kR8luGXGjiyu/rj6kPulw4w/Ic
	ir7J1H/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCye-00000008jQb-3onM;
	Mon, 13 Jul 2026 09:29:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCyc-00000008jP7-3ej4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 09:29:28 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9M4G31090535
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 09:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sSZ7t5V/1PHtqZoF8nlySg/mPA+7I7GC9LLE6/wWuss=; b=N7xNIOg6XHYnBa7P
	BcyAYoQtCvjgZjqfB+qSMcovEVT/UdJGw4KaT9NaTSfVSwnDCZOVCsQX6b0G9KHX
	1qT7ftMycWobPUf9mJV7ZpMSI+2yCXv6Niym9CubAodkzJ2Y6j+tHPWKLpFLTidl
	a4LwRU5DbOXvX35CTl2Yd/bwydC1LF42r7jTrZG59Aw5pNc04SrfnIxbassmjgGT
	PGTc4Zi8spdGm6vJxmeYRTtnW7C1w/ffneCP/JCBC6iZc3nopTcKGOyCj03egX7J
	zRfbERtdt1TbMIzN6IwI0qfpueNdQo+akuJiTPuuz70eTs/j2aSH07ocTdrTAtXn
	OK8rxA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwavr0xf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 09:29:26 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88ad1558f4so7696891a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 02:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783934966; x=1784539766; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sSZ7t5V/1PHtqZoF8nlySg/mPA+7I7GC9LLE6/wWuss=;
        b=Ly6QYNf9I9EuNmygrsU8KfsZVSoQWgILZj45OHb/GzhdeQwm7hHr6Q6+RanLb4RLKk
         M7UrpMbsFxu1R+LVlp1MND4/eZUXamlo7rkiA+EHzmGuWre2wswnb8k9BhQpUgzxD8Tk
         C91PoiVJpytp8sAYqsVqd63jQQppcblDeha4qJTT1NAbilcHU05dWBZpQusR+oLMUw9U
         +1TAfSiaZrN9zjn9yDdeSP3ZJDrv2Xre3jgY/E3RLmc35xKKfvM9ruYuZeV5+wOOoT3D
         RMXaNGUZeeT+eQeRyrTPFOGRVAcCs+Hv4v6RJKv3Keyxu8l/tODMbPUBplIqO0uszhq4
         wlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783934966; x=1784539766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sSZ7t5V/1PHtqZoF8nlySg/mPA+7I7GC9LLE6/wWuss=;
        b=DWIWf7ORwg0I08YDGJHSiKsZfxs1q/n9pO6YHa9j+P4KoJK8cTIlbpy5uH2CG9t6UV
         4eII/LOk3iCDjmU28X7WKQyOH69VtSr8xHCkk7ILk9FASS+GOptHzPi08vqwa88jRknu
         KfmVuGVPPMn0vuRykN8QfsewK3NnScElrVuNXlIb4zKZX8bWEgKcXZJawHSx5II8V1gN
         vcozu7hdUSMlD3KRmsH62y6qnlYFG1c/Njn/vcwPtXSqFVGrhr15oIs0K318aHchtqNA
         mxblebgtxeLFsuZtGYnhVDnZ4xYzjNwTWKUw6VMQOlryQUTsRebuiH6jE8Ah2sCGPHmF
         NdKg==
X-Forwarded-Encrypted: i=1; AHgh+RrrtIdM25/Bo/W10lfegcntpZp9JJDNNJU7nMxUULRZ2Mb0c+KaWSTfsThYA/in2QbqS35krKFTB5SN1zi9oZeZ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd9YZFTGGkUPyTId23vATuTnImWD0talyNpRWgk+FDAfA6DBX7
	+0rAbwNp2pJ0lDwfn8TTtJO7afu6zfw0BhUcW2X3ASC2dPalNT7guFMbvpUHKoBD4+mcLygPROZ
	Z7kGuyu2k7nmZcuNW1Gi7LTgVPZ7xQa58R0uQw6Dr2kLsCZBLXPigTzFaWzvPAC/xsAiMmPumyV
	1TMA==
X-Gm-Gg: AfdE7cnfsC/Tn2TyypOkVQx7KsVv8t6llfEEsd7AW76RK46Tnj3A/O9Dh5oI1Mwm/5H
	1CF/d6R0MEdzKXvqJo9Hnvk4hGykJbo5HEo2EghrfTiZaGsCpv8cjpokQ00MM42054p/BBmMsM2
	P21TqdtR/0Qp2W41krqC+qy8msfd5ixxuA1kwnzmiwYzkEvE9uZFAF2yTvrZ/mBzu8iUHWsYseq
	rdQj7ETDFItHC3/vPgcoNGoFSAqWTCLmc/Eqgq8t3IgEymwE4dekqPnJHaKtlqNtD9H22/twLEm
	OSEY1t07tjGxoHYE7K/baZaToqaIWxRBJbajyUegfDiumz3p38wcs61O0vB9faZZN18vdqR/3gr
	pkSqZ1TW7pPMgTiNPWR/lXdr/tzp/l+/U2jqziuOZzw==
X-Received: by 2002:a05:6a21:7105:b0:3c0:9c19:658f with SMTP id adf61e73a8af0-3c110d3a4e1mr8672778637.73.1783934965662;
        Mon, 13 Jul 2026 02:29:25 -0700 (PDT)
X-Received: by 2002:a05:6a21:7105:b0:3c0:9c19:658f with SMTP id adf61e73a8af0-3c110d3a4e1mr8672742637.73.1783934965170;
        Mon, 13 Jul 2026 02:29:25 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm47495569eec.24.2026.07.13.02.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:29:24 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:58:36 +0530
Subject: [PATCH v5 5/6] arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera:
 Add DT overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-shikra-camss-review-v5-5-db53be15dc4f@oss.qualcomm.com>
References: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com>
In-Reply-To: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783934917; l=3728;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=H9Q9S4nCxWb1Zm1udfcX8xIsLkHTU6m5iJ+3MH4b0h4=;
 b=n6NGtWx1z0UwRlU/KynoW2KeIaBqayHnbWyDUSFlDl3NEIs+7ENUg3o7YcZdvwQK69ZseZugq
 fixPTl0fEILA2m/UmVn6vIMXeEaPHUt1o7ygjNeBlrSfIR4ifbwG2ec
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: pFwr9Ei-YLg7RJn7qzVo3T3KyMKXfQ-S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfX+BqJY0PBiX77
 MeP09zLB9JaUqww0l9P0phaDKjRxS/0qgku0wvcEexdJhRV6oCQ9lfucwTGp8+cgFMALzlltVcF
 1jDzOhEMyIc6IWmYSsfZJg5EQ57QP8A6/DP5+3qQwu8UKrSdg4jtgw+4LCuusmRABt05SOSsf0h
 VUCL3aRk3gv9sSdo2vhIYe/w1AfqhML1WDiRm3xsRKjAhMv6Ny2Dq9BmXS8xwa1aXGJVnoC18k+
 KBbTQrj+r/YDzSr/JEHob+k8q1jKvpOa0wmH3vNddTFWy2kEDsyCxxDN/6glHLeDslVNcLV7qsE
 33zBrxQ7WKnnMVbCUDk3wlp8Xc9PbLgzwtS2le6CddoJTssI7H62XjX+MIxE3jExEdKsyrjiR17
 laW1PytWy8T6EsojrBSCFk2K0ckbYukfIc5jwpfvlCHtl+VrlJF3mc1/tiBgfiEhhTeFFS9R+YZ
 9boxhpBi56JI5VygOlQ==
X-Proofpoint-ORIG-GUID: pFwr9Ei-YLg7RJn7qzVo3T3KyMKXfQ-S
X-Authority-Analysis: v=2.4 cv=dZSwG3Xe c=1 sm=1 tr=0 ts=6a54aff6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OGCdAuOInqFJiNoUztwA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfX0j1QTB4OxVGD
 kUM9fUAKP92J7/wzFgamLFfSP+vzNN99nETgntfGKsimTFZFiUiEikpK2OTrhbQ9Kgf+ooCKPK5
 QtVMY1Rtq1SC0r40eagQxs714M84xAo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_022926_925505_309D9151 
X-CRM114-Status: GOOD (  18.39  )
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
index 33e9199511aa1c229de79f8f1e8bb598a31e49c1..16e1701b6b338c2fedcd4aac4e331336c59780a6 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -337,6 +337,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
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


