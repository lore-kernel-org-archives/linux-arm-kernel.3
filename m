Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D619BCD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 07:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VMYIMAke9Egc/yVx7PIrN4xAB45Me7NI309julpzCAg=; b=ydVxpz5YPQevotP2tl/NWniHau
	ecuV+h20ezOtYfsRDFRWUfnl1daX8CZmEi4juYVAhh2eNnJ9rwu19XqxkcBHjP6I6vgFw+QNLQtRS
	TGKLMSYNiNHRaC+uko1h8Ht68igsRhBBA6yPOskf2wpbcSYumzFRbEnFaJAu3I0aeXtm8ZOJpH60C
	zj6UJgr4fIQqHTlxD4mMhv5aUey5PUlpodBKe60vT3QwmYVB8Km/YJDG3Q02FNLz5dXaNaGsTETad
	eGlng0uBmn7bTRj+xnb3yQzfICG1od5R1HW1xF/tdSfKEiddGHI4eDSSk4+7ZeVF4WNWLLWPzVXzT
	UMvnyJPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1VY-0000000DkT8-1tfv;
	Mon, 15 Jun 2026 07:13:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1VW-0000000DkRk-0Gob
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 07:13:19 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6ItPx3332452
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 07:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VMYIMAke9Egc/yVx7PIrN4xAB45Me7NI309julpzCAg=; b=cMKg0+CcGZtEofP6
	Vm2Gj5fuqMQcQAnKlpt0K7N8H4hMgZhCTO1ZqCTEUfzV7ttTak1RgAHxglDOmCrZ
	hQ/9wXVXhVo5SSfFHgJaeLjOn4HQXBNSralSgefPdfYBaokyMahWXBiz+JFJ+LLv
	SD9fQFczZGuVvHJ/VNToWZ6KQCkxTZnsw8Bq2W49t2m6JMW0Oilli5xQsz0A985Y
	vpvY+CVRr+TvGQUXIHfhP5H9YiK1/lCPr7Zd2ptZvhRzJPQy0eMrWMFYJnH943ri
	LI81TcgIzVk0X4J19TU0I9J7UDKsrEKqN+EkW0jJZSm/Ma+GBvSUjWp2f9STudfS
	EgLpYA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4erye16638-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 07:13:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36ba98cc003so2109826a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 00:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781507597; x=1782112397; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VMYIMAke9Egc/yVx7PIrN4xAB45Me7NI309julpzCAg=;
        b=BuRCspASJJbOPC4T8k+N+vM3t9ogH6IT6yLsKdE7N60FowVMdhdK9vh7T5YRhhTCVp
         W1LCZ4AH2gY6wiLpnACK8b4qB+rp9tOKbr/5WRIwbATSogl2/+ldFV/UZ3xuyYgQOEcJ
         7IN+X9/dC69ewwKs7m+vLEAoxi+G8d+Q5W4jpqwgbUQmMapYk8dLSXvsnXxOiwBv+hJu
         BUh3Pe46jVdrc5eCdiJwn4hUGHdZj9PmB6Z3jCGsez5qzcupxh0Nn5vYYdFlRG7gRmEm
         D+OHId5FAvTyVUm93k6kC4kblJZ8RF77iypUCNqgmat3y5b5Bdex0yggPN5X8SsECVcW
         /upg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507597; x=1782112397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VMYIMAke9Egc/yVx7PIrN4xAB45Me7NI309julpzCAg=;
        b=EOf9KC/7TnGqn5KnNOkLmKVvhAa78PFTEwdI5O6W/DM4viCCOqEEhrhDS7dTHdw1ti
         uumUCdU6WPHI5I0YCHIrCEv2QgRoylBOZDjsXJesaT9STnR3Vvqv2GqIylUp1LU6zBTp
         fuJQk7l1w6bC6fa9QzBQ9qqeDipjfCG4NqFS8O97hSfOHp601WeA2NhRfQR53Dxx9c2f
         fU+pnlp1LXygDW3f1vJKsOxzqJLBsklrjbxW35ETwggJTWni9dKCywLQE6q6LMwUJduv
         JnBOcGoDrdbheq3MgpTOA+tOuwjIGvFhmM+aWyRMGStFMnrwuonhbo9O3lgiBWruBWAj
         eh4w==
X-Forwarded-Encrypted: i=1; AFNElJ/uFdSp3MAvCSu9xxsVh6D1OJpvK926lWidMFpn4JGOKzkIFmI4HDq3SiOtXQCCFKX0ZayYwWqrdDMLTX9oM2ok@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz/F9kJiligVihgSK7B9sj5rFc5nJHf0NFx5I9h0IPmsq29VnO
	2xXhilAoPucbb1oE6LdT4+0XbVB2lPPFBjjbF7/UdqGopqtAH09YhkKdbQG+rcmK3AX0DxN8jo1
	tBqDnfzS9qbgh7UI8oMvTcKJLSJBGSZX/6Xy4gL1HpbQeNnIZHp7LKzi9uh3+WFDy4i8+kHmOsb
	ZiRQ==
X-Gm-Gg: Acq92OH/nkaTtvlASRQNE/zyihmbn+IyEdiHap2O0hO9WIVLWUE1mU+E/yG1J3I+m9r
	8t+aArGpvufW+yZuNNzMuWTdt8nhMGwVgUKuXA9J4G7uL9b/2BrJfMwLzLscSZ3S4Km4ysHEUZf
	oUvRKFbkdOlJ08Uz06D6bExy5s0f2S4pyG6cAJjcK54m7JpsddZHIl5cpvCZd1TOmm2avwOizGt
	EWPcvwtjlRR7lv1bBVUqSxbEoT4O2ctob4sBfuEjd6XZAxyrMuP3rd+FCXeYIzXw69Xszr71dg9
	wUY2TQlGe1f8Ss6rlfbP3G7Zo8gTFN9tW9SeYrbW+s5qCjinx5a88++Is0yPzArySx1Ktjk0UMh
	WC0xQYHOFJEkIk2jVeRho6QIXQ9NLGmDStifDkFz0yas/Sh9vHNnd
X-Received: by 2002:a17:90b:4d08:b0:368:b01c:85a0 with SMTP id 98e67ed59e1d1-37a035ed628mr13606865a91.14.1781507596567;
        Mon, 15 Jun 2026 00:13:16 -0700 (PDT)
X-Received: by 2002:a17:90b:4d08:b0:368:b01c:85a0 with SMTP id 98e67ed59e1d1-37a035ed628mr13606824a91.14.1781507596089;
        Mon, 15 Jun 2026 00:13:16 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a2668cce5sm14867474a91.16.2026.06.15.00.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:13:15 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 12:42:16 +0530
Subject: [PATCH v3 5/6] arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera:
 Add DT overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v3-5-8183481f48d0@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781507551; l=3728;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=uTL9b6XbA0RtAXsYmfuH5ui5uiOY/IkXuIsNHvc3KvM=;
 b=IB1ghu+w4PvpyGH6m0Bdnutb3tvpsG7T2pM4eyAH//Ujm7h8j2hvoG5mLCD9eCaT/meO11WSe
 FQqQreHmmuwCpXhO2fvpzM/r8856xfGl5oUyy3yAlAdzwqvM1GBTdVQ
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: 4Br2XQgCt8ZmX-a6_37xg5BsI6iYyn-f
X-Authority-Analysis: v=2.4 cv=MNlQXsZl c=1 sm=1 tr=0 ts=6a2fa60d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OGCdAuOInqFJiNoUztwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA3NCBTYWx0ZWRfX8NHdgycAnF4Z
 BOEvCTCZnL9e03umPwJtlhyHwBqXDzkOuSkHOLRUTmRSybgPpw+fevkSu28pcWIFNLndC+ODtFL
 oR4apWI00P5+VShAnVnPpmgu/h7YRJE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA3NCBTYWx0ZWRfX2VLgmnf2KKpy
 g5DoRcrNY/NCju+fPW+yShFNq4m4XdxHOLJhaO+bGew7mgKo+1GaX/Da+JC7rOx0QglJbZdiqwr
 gQpNeJ0c52SeXezRZnr2ZIxHUXzenmKTRc68UlwiIfs4Tdpok5oqGJnzRkAOOHQY7H0NDHHducT
 IvJG9iuMeaYxbkBoMK78NcQ+0/nz/2jMhioMREEtDB3fR9YERGwg+MdnkLmF7LPA4QPu89al/PB
 d0GulDA0nez2Eui1aXPm1mrzqzGLc0/akDCioPqFv9puPZLpj+tF1M/VhcGRZbnwavQw7g79l4y
 7+udg+tKXFwIHS0JRXZpQ5KY9gAxsZ2tEYBcWOlLkbvXzNHpjVYEYyHG0tEsIyN8S/UgRQRLVKt
 Hx6c/OyA5fPWMDvU7d6WSCScZK5yhf5JhspDuhoSyyPoeE9H18QiK6hSlmBi75LZQZmsi83ALvD
 R/1SM2edqns46FKeWNw==
X-Proofpoint-ORIG-GUID: 4Br2XQgCt8ZmX-a6_37xg5BsI6iYyn-f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_001318_111630_11683F93 
X-CRM114-Status: GOOD (  18.90  )
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
index a9e9d829fb962386b3975f345ec006504607130a..76b8f144983827f4905a72935e8d5291a227dc97 100644
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
index 0000000000000000000000000000000000000000..037cef17ca8196ddbb5c1b0c301702e4f0ea3a47
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
+				data-lanes = <0 1 2 3>;
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


