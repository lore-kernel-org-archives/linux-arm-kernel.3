Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D667BCD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 07:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O+okVD8ssr3GgTvCo7FatLeqFw/vAJdaEkp9FFWDQmE=; b=mIUXt5jETh5Uu/5QQH+uQ80LVk
	Hy7r+ihQJ/swjr7OyksyRzY59fzAl2AUqq1bEsYmJ1ZdRm2viFFdlKa00iqO2GI7waU+dlgq63gqe
	5mVn+wQMWd00dVT6OWo3i+SIEXps/jvdjyQ+hLbhsQBBDxFBmWmLzGcuKFYeSynEAfYXn0hF6rxlq
	WrVrSAfWQFkuvTtIx9ht3fJMukxvpcTbNmOCrt7bSMIoMynLdhfLDroID7m9L5LQvOmOvBzbWvER3
	9XJVwAI5tIHXfKtSvdy+kY+OJOj/zxVuW8pMHv/IBiB2Y2g9GF8MO/LwesepFEAGqilWi8J3f22Th
	aFLx3s7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1Ve-0000000DkXb-3bXO;
	Mon, 15 Jun 2026 07:13:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1Vd-0000000DkWK-0QDT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 07:13:26 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6J8XS3250392
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 07:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O+okVD8ssr3GgTvCo7FatLeqFw/vAJdaEkp9FFWDQmE=; b=P87njQv5UEc1WKHe
	s3z+N3dUD6NF8urUymNCpqs9uVD2rQZ0aOwAgwUXKReywS5LIl9Bi3UwZ6A5M9Ic
	Xl4UwkhXLuXbuJScwtmkLXTE6ODQHdgg8cZF/hLfzs3h6TFFrDQkkCxvCRkCgPJk
	baczb0d0fp4INeV6r5ZzkoYCU+mGr8Gyjm+5t3CNTq2nDr7F5L7+9JVVYFfymYYp
	jhkJl5h4XfFDEkhALeERoIjyZs3pFRukl5Qhd/rIMJnQawcDkHVFTTqwAjQs88eI
	hG7Ezwpd1akez6qlFa3650EmxMWsqjEJnMfCh+ry0mis0SK7AClbe1fm1VIZ0Y9o
	c+l4Rg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryybx1cf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 07:13:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36b7f696b40so2364129a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 00:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781507604; x=1782112404; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O+okVD8ssr3GgTvCo7FatLeqFw/vAJdaEkp9FFWDQmE=;
        b=iRaKOwkamx9/SGb1rf65jiLbrYBzBSazFQMsOZeJGD7ydB0etKyt2IQy5hVCaWnGgM
         qWijQD4WzBwWu3XA/GOtDwdIjIBarrTnaQ39CyqLsUZ+tEHbqF8JiSZDEMMpTZR37Ta0
         EFumZzOqMMd4GYAOejSPUUGLaO1zxbdN71evyxgaVGB3CQ4EgNVQQ0qxJRN6ISDsseZ6
         l2xrnoyIsgtcxkA9/f6VkiHqTntseJxiizlo8yrnbgQzs2nPijDrPBnIRUuJ+BKTkC6h
         NGazf8IEq4eaLVzDnJwXKT7YPlW6nMeLTZsEDmUOASYm9sNSqqMeoy3zSnRy8mxEQJeQ
         /5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507604; x=1782112404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O+okVD8ssr3GgTvCo7FatLeqFw/vAJdaEkp9FFWDQmE=;
        b=apPwEK/jhzmgdpS8V7yc5X2iwStxZyFjJM60+2XVROC1Gi1BSsbiHPGHEBKyJ8am46
         05amZaIeCtpG1Mndi26a4txmwwxsMpIyErF9HyOQbbLrlJ+qVmVCLQvoWxNliHqhL0YK
         mtWxHK0+9qV8tAp8OSwxdbypclyjNYWtlA6f9QXTABxMSUV5npAJ/+UX6UqHYy5mljPP
         gnPwjXpDt0j6YUwhmZST6J2BlfV2LdolWFa6EJk3+5tthkAySziAFYohNCBZWJ0O6jo+
         2d5PoiYK6/wNnt6f5OtlSy5fbu/8GWiAVGdm41jTvCq/JKDkf0rL6gUka1HkzG4NwOwU
         QcDA==
X-Forwarded-Encrypted: i=1; AFNElJ8fEP+DkGJwmoAZ0FV3OGyHy9VAWqpEKw4O6XhmJEoSRAmMz5RNOVw/q4HZt8EIM3dtgbevRYFB/8iEHj1tQXhg@lists.infradead.org
X-Gm-Message-State: AOJu0YyTAI/XdrlbqK15Pp22ijQ32E7SfCR1uCpfSbYLhFfaqSTOb7Vl
	JonD8T9ppw2K4hbP4HUyElqXi9i9ucuziO1MEuzk4E3bhct+aX20oXHLrIRP+BI2hv1IgYw4OBq
	EkGh7UyyXTC3sGAEQc6XdlDaUmgg8U5/a1MWpkPYgd4lv7Cir5NwzOriYL9YpZzqpWAtJjZB1/5
	/b6g==
X-Gm-Gg: Acq92OEmuXo0gsz31G/VluZryN+Zh+tCH2rqmODw0FcX8zZ0/Zx6M+FUCnfBN3rYWpZ
	zu3xwEIWXr5iF8nXuRrZhXc0QlXhp4QmA3BFBQZBOV0aaNuoJ4ykWslEkM3EzocfIzk4EWFjZ88
	4rwL0sY8VxOAqLciWOUuGiU3/ELal4CfvJukrpqY6+G3P9BY5xdGUF9vzFMNRAsLlGMnidJhImx
	O4Eq5UbjN04GH+KeMYyI9L8b0ENGLX2nh4mtJOxFkDMCLbWFtLjhm1wnjaHYcHtyyIClDwo3pv9
	Tm4B/vxrnM7c5cqxKSXplo2Sy1oO9UVRNh1t+Rr7MpadpmpcjCaGg9xu9z5rFO41KdiHlCSv4tY
	6gY3SAb6jXAEq1X3gyh6C4JgmZVxhuFuEG6iXk3ka9ZARD9+5J+/H
X-Received: by 2002:a17:90b:5627:b0:36b:9835:cf96 with SMTP id 98e67ed59e1d1-37a01e2fbecmr13426986a91.2.1781507603842;
        Mon, 15 Jun 2026 00:13:23 -0700 (PDT)
X-Received: by 2002:a17:90b:5627:b0:36b:9835:cf96 with SMTP id 98e67ed59e1d1-37a01e2fbecmr13426964a91.2.1781507603363;
        Mon, 15 Jun 2026 00:13:23 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a2668cce5sm14867474a91.16.2026.06.15.00.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:13:22 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 12:42:17 +0530
Subject: [PATCH v3 6/6] arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add
 DT overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v3-6-8183481f48d0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781507551; l=3663;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=E7CeGzLsAvE26qPQBzedfdcKyXCu72MrhvI0MBEY7vc=;
 b=oKXbX4Mg1Z1NzqLOxWaXB5EB9ZWK+zefxeRcBA11wXCYJh2Mou0lDq4j8rzw55rUHdS5kfQV1
 Rkuxe7ZJBiaCyHJpuvEcVQ1DPWHtTQU0PZzr6rG8QibNPAM/OQeIPt9
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: b0qwEym6UGF99weKFfb81WkeSg6oCgCh
X-Proofpoint-ORIG-GUID: b0qwEym6UGF99weKFfb81WkeSg6oCgCh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA3NCBTYWx0ZWRfX4Oh+9CfwlWAh
 AVIk5gc49TBko88IGAkKheehT5pHsMj5bM1tX7kXzo4evwRW3BkXrwSnmLpuzKbNhkXqYdaF74D
 +b7YcF1oxvf6I0sWn+awiTFe2L4ori0=
X-Authority-Analysis: v=2.4 cv=JLYLdcKb c=1 sm=1 tr=0 ts=6a2fa614 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OGCdAuOInqFJiNoUztwA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA3NCBTYWx0ZWRfX9qAP2z/8s5ce
 2Z/AcuE2h9vBZQRoMmuyHala2H+cEPJyESAXnu6dRS8sndKXQ95pxCX+PFplu4I7fSErykImpuy
 6rcexV+QBxXNd+ffhpfjhONrSNaLf0sM4B7YTLhPiEuO8hoELm7HKgTKcfq8TIW3LlcbPEvGlbE
 aGBFL0eWCTziettcK6kBjVHFHXRDgpB1tUR+8+9lSzRkTijjh2ruFL/I+Az/YwHRaT75Kr3RIDk
 zkpx5MrBKoOmk2vh4+eqJazcY7apiZdXv3k5/uOzUjsgW7+kd3s56B7KHCqCI+E/etyn+JObzZn
 4ieNVVnYLsrsmP73qr7IbLlHvxs2Vv3neVAbbmAE+uvcrLc91QZEG2ZXgjWQv+qtClUqPIndNva
 3/JpcYPOzNNkAZ72X/FSOIVEgQDoGwnEptjOpEm+7zT0T3bSHdMJbR716kBjGuULM8JgdPGChkV
 zqKNs+xK8LKbCTon7ng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_001325_151301_731222D2 
X-CRM114-Status: GOOD (  17.89  )
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
index 0000000000000000000000000000000000000000..d806fd9f520e9ca4b854714bbf746d049bcb7f9a
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


