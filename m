Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DE1C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 11:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d0AxWTtHAl5qkJ2pTsdEn68dPe4XsoapBpxQmFo5neA=; b=U6yL5Qs8dbB6KMdIca3MxMydeH
	7fr0eDTYek9VUCL5UyiJH3hUT4jklUnYXhH0GXLLhnIQTxf+LUWZ5fz9cIFlNOeyO66ZI8ImymmgW
	x5iQSirSlHFd1T9IXlToNNv/z2W6Jzpjh9Ubxtywi8Ubqqn9pSiqiu3JwMnzT05lsEbYdmUrLWxVB
	oXEQT/c6359vVk5Q8UMQmfUm34XDuW0IL4nKlnSWHt2/sksByauLhjwpYePYXULdaOis4KVcrACgB
	8EdhKTtbdt0TEvH7fzfedXcMxm+ToI9qFKshFUA6EwB4hgdQX8geW9GucDt2skXmKoCoaMDa+l5W5
	pjWRrwgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwWG-00000005fk6-0AdO;
	Thu, 06 Aug 2026 11:44:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwWC-00000005fin-2pJu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 11:44:14 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nfIL2724661
	for <linux-arm-kernel@lists.infradead.org>; Thu, 6 Aug 2026 11:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d0AxWTtHAl5qkJ2pTsdEn68dPe4XsoapBpxQmFo5neA=; b=gU1zl93T5jCPbr4l
	WWDj6gLTvCdJ1/v3Kg4SoiYFe1kkyr2Uw9VdsrcLyFn1L0TjhuN7Ct+bgBTeAHjZ
	Oo49azSly12MgP+aCDlGxbvPUagbj/ilFPcq6+cKPkwLeUP2vLT6vWWv/sf4gmA3
	n05h17rfRKGTDJzyj6utN++DbL15bUT/gklwxPzubmvjsOYRsdeuuZbfXxfSDlIw
	BLKbfiA22ABZOp3I6Ci7k7ty7j/SKqlLegiyDi+4q8NOX6/ncBGQXdQBfz3EqRIJ
	kRYccDBvl047G6ukb53H+U/fSYhRpSr+mzBwanqvAR6aBVVMCWo6f0pnQ7Qi80we
	enCZuw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv9dmm4fd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 11:44:12 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848d21bbb55so3683898b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 04:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786016651; x=1786621451; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0AxWTtHAl5qkJ2pTsdEn68dPe4XsoapBpxQmFo5neA=;
        b=D1nQIEyj+pxW28sE6vdmsGkcvyqyqR8EVisqi+p/x7mdsS8ZbgEV+3PSSTh4myToAJ
         4x/tKHCnMMCwX3EZbkUs3wY4CBH5v1jM0eunn1e+rKtPho5ytk7BZDij/y4f5AW1I61V
         wuyYFe+qM+PkDlraiYSqrHx2LFuDRhDHzf+LkF5nYB4K9S9Zs25I2t19d/ZhTeOR47L5
         eSNj945Onoajh0nP0b9mEayvOL8s8dZ1piZvrvg/FeI+vbpoVAaP0hEStVMWJPHAIeBR
         p37hRUMA97C3vywdBzzGo7DorAmSlC9XbcMIspOEgqzp25wyl7SCCxWJglkF2K6uwnYz
         J8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786016651; x=1786621451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0AxWTtHAl5qkJ2pTsdEn68dPe4XsoapBpxQmFo5neA=;
        b=J/1AFSFOlYe4TqYBIyLZiHqkiHxzdVZhq3ZxcHb93YdTVqhsqnZ0mDQHPWHVFIJHKs
         pu8V/Kj9ZUqkVVN42d5ene5IZXm7nAZ+s1LqZpTvBJCSECu60/9if16TuC1XDwzKejTw
         XY3tqg+IKbe9D0HcVlqoU05HEphtAtgrOt45WDgTvuOTiOwjcPGyrZ1oLHyu+nfsIw5D
         +dPXDgSW9xwlSVLYRwh11Nm8Sj+cB2HC0MMDatk1XpueWvgrylvQcyrKWMwFpyiSTU4s
         /dA3OTvVQhN1TrMWWYx13NHuOgnsnmo6FzgEeSS9B4/GTnpKlGvo/Fx+qmjXF33QabsK
         ysfg==
X-Forwarded-Encrypted: i=1; AHgh+Rqr7WKzNIgaiA0Jms3KYXKZx5W3OeUc/d/LDrRy1zJRz/dOmS9PsKNQWN0tnUZCMVYRwPGFyxQ8iNEPYz0pFLK5@lists.infradead.org
X-Gm-Message-State: AOJu0YwJLxF7B0EIi4x31n7agJE/g+qG2+crPMD7yafEUc3TBgLD894x
	XdY/rIdCGUlX0w+qFyaP6lfrtz+jgDAJXeV6xEJ0452E7MYrppdnYQwfqtwc/GpKHJVQmOT+Odi
	WLAj7FUdLgJxRo2P3tRQwxt7g3K48ri//g35Z+8zjPr4ex7mWHGEM97HsZboUq5XtBFWVWXswuL
	s/MQ==
X-Gm-Gg: AR+sD11s5swZr5JeYg+iEFTq/MZUjQXMbr9rqiQ9fItAJhUhaiMWmB0MUmqhE8KKPIY
	RQQbCQsYYMCnTg+mhAFtTLnl72TiC7x4NFH6WYQq3XD4ewY5DpZgfMuvOcHhSOTUuz+2KvZhUY+
	V1L0FHjIcLitaw820u7hH4LYj2mxvYSW7IWBrDAawlA+a7KAwmHMlYW9YZyc58JuNDwyr0CPewC
	JsAh2v0DbQDIynXVpR+WwXFiAiBoogCeJ6qLnn9EQsRIe5Hwh9NlvpmGzcemceAhiGMUyBIkOWJ
	Ux90qm7mu88TC+TGXC7sWLuTC3RtYWqUVPWG487TtPmdrni224yHkSbG/0BLe1APAzZk4m2Yknk
	gnxVU574zMQcULw+5q9XmsGlwhlrN0xY=
X-Received: by 2002:a05:6a00:278b:b0:848:7b92:8e74 with SMTP id d2e1a72fcca58-84f2e0dc994mr17478213b3a.39.1786016651271;
        Thu, 06 Aug 2026 04:44:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:278b:b0:848:7b92:8e74 with SMTP id d2e1a72fcca58-84f2e0dc994mr17478151b3a.39.1786016650815;
        Thu, 06 Aug 2026 04:44:10 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f456b75dcsm1234756b3a.34.2026.08.06.04.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 04:44:10 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 17:13:29 +0530
Subject: [PATCH v7 4/5] arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera:
 Add DT overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-shikra-camss-review-v7-4-c7360fd6a5ac@oss.qualcomm.com>
References: <20260806-shikra-camss-review-v7-0-c7360fd6a5ac@oss.qualcomm.com>
In-Reply-To: <20260806-shikra-camss-review-v7-0-c7360fd6a5ac@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786016613; l=3728;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=flYHAsWqMe1Nmyeu2IpHX/mwqnQXdwl3hGTsXJ2UJ48=;
 b=+NRK1V2w+DTmTUaqLRTPFAq3rJUHzPs3aeOzAqPyrR6crfUEjHKjnWNHtpZDXgE59xenOHx7W
 pkS6MLmq8lxCjt43CH3uX1Fyd1Z/uKB4H6voc8q1+28zPel/UfHnlq9
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=TJR1jVla c=1 sm=1 tr=0 ts=6a74738c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OGCdAuOInqFJiNoUztwA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: cVOZtURy-kPO4eo8PsIo4Kbd5-63Msz2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA5MiBTYWx0ZWRfX/weUEoJG2ii8
 m7esz6LaoeX5Rf9IbCGakxl5k1XiEsBxl2BSszalAdTkwyn74Ql1q/dYHf75MiNwhV4POSOgxIB
 M3ryUFPhdL35XLcKbiYBxiQ0mneH7AE=
X-Proofpoint-ORIG-GUID: cVOZtURy-kPO4eo8PsIo4Kbd5-63Msz2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA5MiBTYWx0ZWRfX8F/tvtGW88sl
 WHpb4P6NsAp65DE21uZSEWtBy2wCdpkfYDztY/pA/mmmQ+GRtuhRtDQbvYVusnIuQzuK5rMHoDW
 NwOh24QXDHOkEKfNgs+oxN8YunqII2JYtZH+5IBUaIuwm2GPlTheHsHamV/h2uMit1/auzjgOSe
 qaXW3NFkT89ugJlI6bRpjaRbhbYIAzEEgUPX7Zl28/N1F9Q/PK2qw9zo12HdCAHC3StFfRI2pJ0
 oMnO/cz+6MBIyLGg8G5BmyghW411pTnlw41cOaKtoAdK1Lus6gIjOlk2a0iMbeGlh2Zg3ORAI7i
 Hzq1Jpv6rH3DNZvywXRY9/2aA/jIhaLgSFd+RX0iPgUVVz17gED7W2s1q2W50CRJ8w9VZhezb/r
 WoclJ1MNOClkoFiJjbp3LxLeRiQw6QSbfkO2vIRiTGQnoVMcrUj5eZJrrAQnz/x31WCVeCvpauK
 EdQ+Npg0U6s82J3PiaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_044412_719242_A3E72D06 
X-CRM114-Status: GOOD (  18.06  )
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
index 1c86e7e98f55d539f5292816ce06c9a46bd4904c..03ed24afad5795b49848a2548c0facdc9f3e7115 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -339,6 +339,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
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


