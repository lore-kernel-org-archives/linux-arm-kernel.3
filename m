Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE525C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 11:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hnDUVOhAh+Fh8cO7Y7RD4qrNzVPEPq0KcDsh/Yij7Qk=; b=zLtFCNbFSIb8t6koypLZW71T7t
	8nQOcIvg/wXKvJoOFmdIyJRfyrGcZca36PR1sqC7FQahgRM0BwpXbbo2Pusqxp3427OBC1Wb2iuBT
	ntoN6KG0/qhPWITa7fd6cCLSTMet419EGGnnpDcNTSsH37i8l7LmWbqhdod9iWzyrmq/ng6/etQ9s
	woXFTU9fTq5GzzmcuOTGibulXLWQ1wGN8oazpWL4GEexRYJykG8sfL+m/RLeMZiLb4181QFTYqEdl
	maVCPN2SYPkPAGVCS12h3oAQtgL4LF/iNYvDQsaj6nj2GIL1SN7Chk08EUpzgHZJu/IzIk6ti6SxA
	TX9tpN/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7AUw-0000000BCw9-1Ow4;
	Thu, 17 Sep 2026 11:41:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7AUq-0000000BCqx-2K1S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 11:41:45 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZjfJ1520197
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 11:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hnDUVOhAh+Fh8cO7Y7RD4qrNzVPEPq0KcDsh/Yij7Qk=; b=kke8hL1HDeTyIIqe
	YN6BTnVZ/bq/oSG/d2T3Nrvn0xSW8fFuHhMcPw8UZUJH896o4HiG842qfQ+qOMn/
	gj+4i9jfV/D+H/yzNn+qGNWE7fJyB+Bv/4oM8qbmkJ2At+x/O2sa3VdPU4GjP1SY
	p8S8Dli5cGMS/8NU3Fu0zN1jUa70hQcaDCoOARVTTPjkpV5pmJI1Kga89LakxPT8
	GOqb4oZWO07CMTmzC0laS9zq4QFfMwcZb+pCzBPdTaENxfMSbP9W2L271OHnPQ2d
	yb+ImgXKq+w0Wi8UJGcXeWf2w0LBDOVkCZj9ZDSw81dSKeISA0tRnVfeoIzmGG93
	sBHz6g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy7hc25d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 11:41:43 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc44d708055so1357283a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 04:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789645303; x=1790250103; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hnDUVOhAh+Fh8cO7Y7RD4qrNzVPEPq0KcDsh/Yij7Qk=;
        b=K+rxx6KJLT+XfLLVIfukOYTtrm5uVyAYjoUvA+H6yhcLUAnplXPTGbzG4q+JvQOAdg
         aWFhBC2NUmYPT2lX/dC3lEea/P4Uxw2q/Cfkw9Z+ESjyy94r8sf2N2IN7JL1Owcskbwd
         Wt2KXtRRJYB6Z97YpCkfBNBxhHLjKx9zFLW0Ni6QZvFaXnrF8le/GWxBI9HICMRWNX6K
         ZusodVQhK0Lp0grgbPuvaCEnMFadmS8ZEnzTSXo9ymtimmGSEdQYuKFE1XtnCQjIlNlh
         i0s+7qSLU5laYuJ+eALTjVU4hRZ4CXMUZE414phNYu9shLUnlHI3DKdYyDwmxLj4qDoG
         mtdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789645303; x=1790250103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hnDUVOhAh+Fh8cO7Y7RD4qrNzVPEPq0KcDsh/Yij7Qk=;
        b=jvXfFVCesPFkusZwyb+WHpCcK9yQv/ktAOsrIA/QW9PuudqAQB7pOVPfiE1iwaYoH+
         Qe31L3m5Ar4ngX8HABJAc8xZpLeYdipmbqdZOZ9P9vl0w8sydVBjsXMqGvEyaz9D1zOj
         ipVmDJf6StPY6Yb7k86qdVbdJt7nsPIjWKBD0ZijFcDD/bq7aqF5Gu/On6Dga9jXlEZR
         zgw54gu+5z8mA+Uc9AkDk6f3zPgeV8KkdvsJzKCA3VRa2nrRRkn3c8syPD6w0w0UPQ0t
         ZQXGmCdPjbWdDoI3xv0bku6RdSqOzOsrVxbEoXxNMrUC82q7kE2COB3rqWr8EDh/oL9+
         VylQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwwdbT4f+jV1yoab3+6C8o6ndby0WME4+0KepKllBvGzYyYJGiicGDYw54/ckW0HR5hi7N0OCD9WOWHDnlZjH8@lists.infradead.org
X-Gm-Message-State: AFuF++k0nbsxO1UPWs23px29DYO1bNHnQiaV9w/iE+r5DovlDXsCNGAg
	dZLyUZb+5wQtJcEWHz6gh0DT/UCtjY6M81u0wfJ6DMvPISXLsfVL90oxYI06bZ06nnoZcRnWfWx
	xJRKO2Vc9SMBsCzyZkkVWfp6C0My1Pj/Jd4MWGC6aoWP1R43wii+Er9XzeirxvP+bpaY5DflCQP
	Co8g==
X-Gm-Gg: AYBFou3WJMrR8ByRT+V0GVwcjkWLc/tlDHS8YfUnGigVNHzR/VR9cXCeLfQPy8+YMTf
	dHYVn0LlGeaNu7941hLCKbI4jAQ0ko3AnX3zd6N2QFjTeFnAvMtyBhli6xsimhZEX+C+VarNK9B
	YFgXuYp+sb9bs6C8iApO6ARRKY164w698yqUlvGB4k0M14k4P7Zs7rVGU6xbRu3g/VwoYOWMDm/
	tKmjobrt0aZ3rCdaxu/69s+OM8Yfwt+TGFl4s2UCvE8qGucFCkXeuE0B/MmGZwCsXGPbMMsCDql
	uwXm3sPtd7YgstKveY1Nq0jAfixK0BDS3aclOPy/cEGMx4kLG6gs05rnxDbu4a0iH6Gs4/sn+Pr
	Oh/sI5Bsar2C7pwxzdbNj1e4lHFmrvw==
X-Received: by 2002:a05:6a21:6803:b0:3da:e1b5:2baa with SMTP id adf61e73a8af0-3dd5f4041a7mr16587023637.2.1789645302537;
        Thu, 17 Sep 2026 04:41:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:6803:b0:3da:e1b5:2baa with SMTP id adf61e73a8af0-3dd5f4041a7mr16586942637.2.1789645302138;
        Thu, 17 Sep 2026 04:41:42 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50acc1178sm3066557a12.30.2026.09.17.04.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:41:41 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:11:03 +0530
Subject: [PATCH v8 4/5] arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera:
 Add DT overlay for Shikra
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-shikra-camss-review-v8-4-9b9596221cfa@oss.qualcomm.com>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
In-Reply-To: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
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
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789645263; l=3728;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=deDrLmDsf9SZKV214Q2Dy7H3xnrrBmFZbNNq+U+2qqI=;
 b=l+CQ164s9sQZp+Tip/2k2mocjBE/YCW9c2lggvgmmMQYTCn/WM6Vp66nBBaq3mOhAPt/+Zy2O
 D6zXkJbxEmHBPCXfOLSPJ6QtGTxeaiy+UuAR4X8tkW4WzeTnAlVgRDR
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2MiBTYWx0ZWRfX+eS9S/Q1SlnC
 LA9ubheDlCJQmHxq/F2CqA+K/RYBoHPCBAS89fpUndQd1/KOfkZWqM48FbkIMX6gUmgqC2Hgk+/
 LOscWIlL9kSsd6q4PPkXnWLAOUl+aHbdfX819kxnCIDPIQBudUcNeNscnllE3TaGAeITFc3ZhSw
 1W7Rc788Ykcko2xh3JhRodKHslXooCmlXftEZJAPYzyO25ODHrkbGkrZV/8T6GTq+BPwUpAwn28
 9aYKA+y7Vhkjnoyu7JbEevl89V8+1lasdh80sEViPhHoIp3F+Zx2DXHFnmsOkNS1oovXYvvFMkS
 q7/oR86Gu12dPvCmad/nVIEd44RNokvP+jARPl/Mpg92mYZLtD/HTEbpn8DfB4csVsxP+gU2fWz
 uGLX/57O+KOP3Gl/Y6/Jl0Ca5019P3MMPyN2cDhyvNlgERhAcFDzV4GaIlauE3P97u+HAxVkKYl
 6TM4CV7E21INDwlUjLg==
X-Authority-Analysis: v=2.4 cv=L8aI0OT8 c=1 sm=1 tr=0 ts=6aabd1f7 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OGCdAuOInqFJiNoUztwA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: k8w7nFeWCsHzCXWOvh3LCHS-wbMZ-RBg
X-Proofpoint-ORIG-GUID: k8w7nFeWCsHzCXWOvh3LCHS-wbMZ-RBg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2MiBTYWx0ZWRfX/u8E3Xz9Jj/d
 CArtl+gnNZi26RWijUODGNKveqjyQ4S97HHtKp8Pq6jHeYUywcz8sE1EgVoyq6FzZAM9HSVX5Yq
 ZO4L4nhAXaNxZW9Oo39LQIXKI2hF3Z0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_044144_721367_797ACFE4 
X-CRM114-Status: GOOD (  18.12  )
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
index d6547fb18edf0a99f4384d8cb073ec03b6785941..02f340aaa2ca542d0d175ff965198b29ac48772f 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -360,6 +360,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
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


