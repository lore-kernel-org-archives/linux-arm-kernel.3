Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF69C44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 09:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cVUooRcnsM0Mw8liPOqwiMPOxm9R+oX8vt9NMitZwd4=; b=MZ2yQbUw43Em551XaWE7KlqktW
	7s+d3XoKOXdRSNzsxEqZY0GcDWTVCRbvSDvQXFmU2gOHVWJ0yZJ3ZGslju+qaWfLMv6TY80Rz2WUe
	3edyRkGJ3UKXBqoUO99qSf/vFym/xmyqnwp3yxXENH1cbJ5E5lusUeTD1xOn0O08obhhMw5QZ0LUw
	pArsqyie+SLvQPxxyZhxCngSEF7r5bmtSeE+Sx75IXFJsCHmdXbo1J4wwk1mf26MWTe7uIohw3XEe
	elXzy7fIQKy1yutmadki9gvVdgxV4lKfstKXAP+YOLUrLj3x+C4UTMFaO3AroeWBRsab/LGrKumO4
	xoMLtgLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCys-00000008jee-3Ywy;
	Mon, 13 Jul 2026 09:29:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCyl-00000008jWl-2kWJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 09:29:36 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D77Mej810492
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 09:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cVUooRcnsM0Mw8liPOqwiMPOxm9R+oX8vt9NMitZwd4=; b=UtKGg4LhMcd+whFy
	kcyTaHOEqdqGLg3jJTG0eZgVMLh0x0hARLqbEkclMYjT5g5ezKJ0Q3JPvMWFxpuE
	+Uvvbo1hRNXJOBxkqixuxehGcaJ0lqi+aeuL6SX2sRno7UNwrRpwVNBREz+7L+bx
	DyHI7EYYhkGFDTmNppe/m52XUpSBImLIOf4xEKtLVblKjgHU8YQjvqmQvZRGE/0V
	vhm/00UKdlb3BmlhXMH2bFu/x5Pe/HJhOJlcMaqs+Zv1td3I0B9dZeHLhf5Dl88u
	s4KN/ynkS8963ftZtT5g35Dkxyga6zC2e1KWR155mAIf8fNlWM1TDzQ2UyjNgNNp
	9g6ikA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcubsrh9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 09:29:34 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-384419c6c74so4198888a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 02:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783934974; x=1784539774; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cVUooRcnsM0Mw8liPOqwiMPOxm9R+oX8vt9NMitZwd4=;
        b=dndH6F06GaFscAkSt7ZKrWYVvud/5l0nAtJM2lKPoo6KG9nJKKuS0H4orKvCWXq6L4
         MNCyxgqebvUwNAroLgHVDTNAETbvCevCR0EkvofvzdqWV6uHKosWOP1YpKfo4DYR5Zm7
         a1Ml/mXQcAO7KMsxj90lkdJp2B8p8euemneMJdG7Tr0pYgTKxWrZTPTV7wAmPBgDhp6v
         mcxoQREQ4GU7m749r8Z7Lb3sxz6HsX46pA0t2xYnkWxUbZy+ZBw+jgJClHZnA9DDsIB3
         ipJNDH1S2il+UbYfo8KQJ6Gvkzp1XEzE/FnpoIIdOB3BXu65wkKBk2aJDpLE6dR1wlkA
         vzGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783934974; x=1784539774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cVUooRcnsM0Mw8liPOqwiMPOxm9R+oX8vt9NMitZwd4=;
        b=D2H5d3pW1n6gRE/aK70k2r8tgIAK3xdzeFvXjw6vPR/i6eMtp1hQ8qS/id4FRPSVo9
         dsxKUunfiPzQVG97O+vmWDuQtfdfW72PnmXnlL2AxCbMtyGnfYF971xFFhZjNKyN/Nee
         Ky/Ti0ozuJ5f+1e7lCXDbZXO+N5mS6UJUswPPpoV5O7oGjChKl7LPNMrBiTGuHu7qeso
         ZoRnK8TLZxPzaqwIKD8RWpH1LlOw0qTKNoA1fodIvhVDSm8ZAIGaDpmlqhvK7/G6LosH
         UAMUFTJ+9dypBcgQx/PYNlC2F6Doqh49/Yj5RBOPdvsDwUL3z+psz7bIZ7PuCCm/EBj0
         ZWtg==
X-Forwarded-Encrypted: i=1; AHgh+RpsD7KJ1kSAJRTg1LtZHQ/klk3xs6rc5JsW/BZFfBhh0K6qChqJLOZSZ1dVGXSLDejF9PpTxr1D9H/fRWhLKkrx@lists.infradead.org
X-Gm-Message-State: AOJu0YyIX6GcZFYYx3QlyqjdD5fLn2eQDmpDmbuffu2tgkbwgtEZENQL
	xMZeUsBaAFcNDpkffasrMU2aISuw6KYGBhgRfYtenStUuJJWOYvFt8aywgyUab1cYMyXEdpIjxm
	eD1ymiHSy85xXBSd6KSEbMJgdF0FshwVMgCfjSaooWQGu6OSWRZ1JB7Bg6qssMrHirKfpkPM93I
	w/+Q==
X-Gm-Gg: AfdE7cmC9RnCsNHcASnqB1cX2hLc9okOyRUIrYn/g/hUyOCLkkd+M/5EtZfKnyAe+/u
	kTwb7HgtgcLuHIqhn+syV+RkZ1bPeFjyNMEUClEQHGd/FlAd0zdsaqhOKBHRpSucFqY1Secm+4n
	xUdRV4geXryf3xwzDZh8aGvpsIwAX70n8BkNEpICbOiNHipLxmkYzh2+v5Pan4iMfbLIzGlGKaH
	WYm4mfiKeTB6mLEVYD5ShvzJ9j+AIJViwlltrFtxzNtCVMT+uZUvM+V5b76oDrnP9ftieBWMrm2
	ceXX8c4IjCdQfF8rj2QP37Ogh46qpAFniWJllIfOYrRqR5NTr1fSlsrgwi/rB74zH94txcifZ0V
	2oL8YNvQplKKE1fcOyeptF6HghWeLMrRvSTRfR7iVFQ==
X-Received: by 2002:a17:90b:538c:b0:38d:e5d0:9bd with SMTP id 98e67ed59e1d1-38de5d00b5amr4999368a91.26.1783934973439;
        Mon, 13 Jul 2026 02:29:33 -0700 (PDT)
X-Received: by 2002:a17:90b:538c:b0:38d:e5d0:9bd with SMTP id 98e67ed59e1d1-38de5d00b5amr4999349a91.26.1783934972978;
        Mon, 13 Jul 2026 02:29:32 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm47495569eec.24.2026.07.13.02.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:29:32 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:58:37 +0530
Subject: [PATCH v5 6/6] arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add
 DT overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-shikra-camss-review-v5-6-db53be15dc4f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783934917; l=3663;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=OGpAN/l+ZCNB62iqv7OJ8/lTOeHL+3Z+8yqdVcmNtTY=;
 b=9E8lC1f9kmO9Np8MUIG9D+PhYi8juyqtA6Z5p2DNlLrGugaIVWnCBr2+FeL3zPsWnq3MDfnbn
 Ir0kEZxN5Q5DaQxhtZdep1f6ltwH7fTjvtv6eLC5YGwMKdA6WLZrZN2
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=Oq9/DS/t c=1 sm=1 tr=0 ts=6a54affe cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OGCdAuOInqFJiNoUztwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: nt16Pr9bFAkSnngyttYcuu66Bl4hKa9o
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfX8QQZqWtSREKx
 yv6JSZetSaiDTj/lhZ2xxWXf8cebkMy32QviQlyG4u57zY/dOPZ4++ckdV2Tj2APA8iI/nRrZDQ
 znXkiW2xJa8TmA1VrmuSBMKBjjKK7Bc=
X-Proofpoint-GUID: nt16Pr9bFAkSnngyttYcuu66Bl4hKa9o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfX4bEc0CpLlwex
 5yspnpWoZc7sXFvz35F0aujFJ+nmzpdwhX8QvRhV/uTxJ+cRg2hei32SzOxg6ZiAOsZECdVtHzn
 COaoXbSXlUoFNWP8b8NHylNjXsuDJ8ykzpxqOcaW9MZ5rS0k49fuWpzRn9P8xUcd6O1UnfEgCzq
 nN3MeusO9HfWTs4gQs0/d0rPSXx2xJE/uxoC/27SAi2u8FyQ0LtA9Rh9M9p22eCtlFYjIA+jU1p
 ld9ImaR+ntvkO39bsbDwWND33v/oZPRvl0qyDtAv3SMGwfJIw7y3Tm1W3T8xfktGCYZe+DPUrEa
 zyV9QN6oaqdadSZJwxgEEZHJfdCqXHfxvKzQ06XWJMxwh9LcsyZd1BQS8c4zpvEybdtX+9Dt3LZ
 lgHWW4F8miSACyCmKKyFkvGgqxxsy7vrkW9i6IKt+vWd5ptn+AxS9GJ1gTpX+PFuIRz+3df3BTp
 R2fGoX7v3z/ddbog0fw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_022935_819557_E5CE7263 
X-CRM114-Status: GOOD (  17.81  )
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
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  2 +
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     | 79 ++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 16e1701b6b338c2fedcd4aac4e331336c59780a6..e79419194d9aa1ee2b0bc8e836e7c28630f90a50 100644
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
index 0000000000000000000000000000000000000000..d8c968a918c67cdebc0e7c6fc14ef820c97ecb75
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
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


