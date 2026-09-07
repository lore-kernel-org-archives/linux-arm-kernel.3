Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1926C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 06:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPyvDLh+aC0OEcv55eKGy0rZjUEKC9UNKb9SvdGhdZM=; b=CRJMWCi5jKZmhQlZXm4sawHeyV
	ODMLT0syWu9Gt5brjjoBQYwKcHAicBhzjgzt+YFRAZFkhYnDq5yjoNAoKqKMWd34v1UPu6B78tdZU
	Hc4mdqyLSvnH0RP2WP4wfEkMgishQTFsKBF9sUSZJNaLgq8UF0VhA69iCb4zaAwLCc1Rws2mFt9z8
	x77lenjQPYg/aa4sg0BtDv9v++iuxe+4H7o5Ld1TJy+njIcR54zFhGWj84Kuz0mItliWs1+FmEAMN
	5170DrIhMCutUWvIuCWK2xwNs+bRxGAhe4vxwNdEzZB03x0fmimJPdo1wSbzahxHi85R6K3MzeETq
	vHcV/9xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Svs-000000061ts-2bds;
	Mon, 07 Sep 2026 06:34:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Svq-000000061sO-3KUd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 06:34:20 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6875UBBb3121068
	for <linux-arm-kernel@lists.infradead.org>; Mon, 7 Sep 2026 06:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CPyvDLh+aC0OEcv55eKGy0rZjUEKC9UNKb9SvdGhdZM=; b=HeYIGvy2mWNdAiSI
	czcoNGOVG16mlrKAjqWWXvdtiWT82LUzhM+PUYwNTuQ55vGZncGJOGsoM47ot/Y3
	qZ8T6PsshokVl4Og34dHL03eYAOo0hDvZS7klwIrh3XFe3jI0SNgOMk1C6nDgTPs
	7zyX4lTXTzi9Sfx5+/N1UIxeAnCXN1nwif51kQsNN7/LRBDiLg0kH7o4glY7SGp4
	rWwsFIa7eevkRuKVv1ZLf/o1M5rd5FMuzj/Sxe+7hxxpiwiTFldbHKURjnlHFZu4
	+S72GDxVIctHvs8dJLdyiSugk5CZfYdCaN36lebvMVXDp7OIpRG07y6phaRFGocu
	PtMkng==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghq66g7yb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 06:34:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3968dfff779so4537532a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 23:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788762857; x=1789367657; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CPyvDLh+aC0OEcv55eKGy0rZjUEKC9UNKb9SvdGhdZM=;
        b=EDDtY+rKfYhTJMdLR+RBqVUtGOf6/5pBO/BCs0/gcGL8HL9LtHFNEO5224pI4c8AJg
         c81NWLWbW4t5nknznMJDpEyiWTegbT3WTE9M29xHMSuvBmB9jwWjJTEB7pOmwrY6IDJV
         N1BpkiwcCUvs+3gWsyvGU85UBfpOa3mBvmRogGPJ9kOkXVGz9QqUDOqn0bFhtb/uVOX7
         wGQRIXtmUDeONpFfdkNey/ZXBTV7dUS5oHVE5xq8Rvrcayj7P3CtJCbwIEpkbM88mr5L
         sVTzjHaGxNoi0D0/+SWyKAvfoycE00YkBdjwt7IX5Dgc5A+IPiWcwSCqMD//lfFHFqfK
         9sig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762857; x=1789367657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CPyvDLh+aC0OEcv55eKGy0rZjUEKC9UNKb9SvdGhdZM=;
        b=OCl+fcPOK0iFaFZ6emF1bIoLAVdl60TwpRtXAjM0G8JNqvU0qUGoCT6pqJw05Ge58W
         bemaR4UR4leou7pC6lc7Ku4zN7dN91OJlhMiDn2MGtaFis0Pms86zPjXVp0YW+jbpvM1
         6GMYqDENAYXJIwyw3bPjptXMzliKOb+ddX0stDaUCx4UZVg/Jz3VkVHBDjlj75OeGVej
         dGMfPetEJS5+GalEhHjmJ4Lbbrs4AYo5JjRddQBpmpJ0JvUBS6imwMtq7XRcMXRDw9CL
         1R80DaBHz5UvzNGgSeFP3R5kVvYdUCaYoWyRGUItiU5jLXDx339yc1bGgGJRAcjFg+WR
         iSJA==
X-Forwarded-Encrypted: i=1; AKwUvBzdD304ymCtF+yVZyjCoC4HtbmBHWrX4PAy5HEWPlztlKSbTMG8hAVGtJQ4MhePK4ZQZB000VVYBr/nMvmdy7Zr@lists.infradead.org
X-Gm-Message-State: AFuF++nMAylGoc2wZxXXT73HRQ4BXeUkpMgS2DO7oyzfGZzkq06bqmxz
	r4ZMX0aaEPyTgbC5X8/AcMlZ2Tk3YCJY4i7EQFC3/pVgAeD8OOV7jB34GEP0Vqyu5TBZwZuLRGK
	xft/78GilnwH1cFaxz7HDiZB2AgeJ+QYUXmVukPftMvlHdukIPr8qMW6zcFcszQpngJ7siLqwuv
	MRYw==
X-Gm-Gg: AYBFou3yMUQfaHn5qRQC1PDWwOA5+/iCznaZLfSMyWv4z1vMSroGE4nMZh+uPCx/G+C
	ZM1PYbiKDiOYead8x7somazz6emS0h4doG3qx/HLykCcaYHdU83/gI0KVA0BB5O7jtlv7/rnsgX
	8fpn9ajsi3DQoSpnyCnUVshz7tbJ66Z3Uj8Bd4P/2qTtjlJxj8lBw4z2DIeTvVF/7k8+mQfhHcZ
	JM8i0MmOIUEqeAd/Nln8bdQ9mxLU+igIlpBIC6IbSNe2OgsaYLZxncSznew0eCXk8L60hWJk4do
	jhrPygioO+ajHVkDFLlmQ5iZH7kD1SIwLPuv1Xs6p7M1QySTa4JnSOE4hjceWnwO5qCYf55uer4
	KYORAB8+zmgnT0WOr586OvabUa8+EgA9KH1FI
X-Received: by 2002:a17:90b:2244:b0:380:86d8:8162 with SMTP id 98e67ed59e1d1-39b0865353bmr29029558a91.18.1788762856762;
        Sun, 06 Sep 2026 23:34:16 -0700 (PDT)
X-Received: by 2002:a17:90b:2244:b0:380:86d8:8162 with SMTP id 98e67ed59e1d1-39b0865353bmr29029512a91.18.1788762856305;
        Sun, 06 Sep 2026 23:34:16 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33808be8fb2sm2440549eec.14.2026.09.06.23.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:34:15 -0700 (PDT)
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 12:03:54 +0530
Subject: [PATCH v2 2/2] arm64: dts: qcom: lemans-evk: Add Raspberry Pi
 7-inch DSI panel overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-rpi_dts_overlay-v2-2-a4989322ce00@oss.qualcomm.com>
References: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
In-Reply-To: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788762840; l=3162;
 i=shashank.maurya@oss.qualcomm.com; s=20260828; h=from:subject:message-id;
 bh=sTcoJe5DoruJGaJbA+mDYOnpK2K4WQXqyShMTozDpQY=;
 b=fEgoxoRnGmVyJ0qWPpbfbKMOuFe4N1ntb4b3AYDYqiFdqYmnaSWD3jyxDIcciSE0KZwneZsiw
 gsKe+tASmBqDVINlicgjMfUodvTloj/VgUx2Lt6ZWZU0IY+byNutA4c
X-Developer-Key: i=shashank.maurya@oss.qualcomm.com; a=ed25519;
 pk=xld72d+QYBwDMDcn3+QLCb5AUsj/D0j8klGIuxWd860=
X-Authority-Analysis: v=2.4 cv=QPhYgALL c=1 sm=1 tr=0 ts=6a9e5ae9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=rHGbxVKOk4E_Aj177jYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: ErdsLWZKCpgIerDL50smwItz4OmDSZyE
X-Proofpoint-ORIG-GUID: ErdsLWZKCpgIerDL50smwItz4OmDSZyE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA2OCBTYWx0ZWRfX1llKiia2al19
 xycJH7/1ft4IrhaZ48nF2wm1vrpyz6IpPIPlCo11Sefp45JxpVjp3xdYw22MRTtoQWYJAmckQUi
 Ss/4pxmV4dKC0VFzG3Li4BCb2duLnhQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA2OCBTYWx0ZWRfX2wzmBXzpOS/4
 Fxm7JhaF5pSyfmDzVly/x7MNYEiOYGKwn+WZbrZe/FPwYmvbUskOw/Xj+w3JNCTPS0PWIZcUzv8
 CGKNBZU3Z4OBVgT2YD+zD9rTOXQxihtLwXTAaH4jgt55QRLjRnMM1h2tlGkDRMFjJtADYuuJbD4
 n3UTR42h3nG877HqLrzvwpqilfpZr/vQ1//eZorOs9uLdinMJVm/YOS7Ri8v96n9jeGc38XfXdd
 HPxiA1hmTWFEXayJ4aYvdxkQdMS1xBrqfGFLBji4mjX7JGWdm4h3tOB206xBAYSHVXT+ZnhLUk4
 XP2FyUGj4TuKWQNorRR96sLTFQCZ2aItB8+q/zp3vTgOGsk4T5ExMNuDYldb92tlETR91LGnbO+
 MqUposG23MiRdJ8TAHVlhilPMitGuMeu2EobdJOPWPwYDKU4eX2IXjyLFKH2lxY9O8wdfaGg/3V
 jQsQEyDqHM08FMehllQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_233418_956775_3CE280D7 
X-CRM114-Status: GOOD (  16.80  )
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

Add a DT overlay for the Raspberry Pi 7" DSI touchscreen panel on
Lemans EVK, using mdss0_dsi0 with 2 data lanes and the panel MCU on
I2C1.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  2 +
 .../dts/qcom/lemans-evk-raspberrypi-dsi-7inch.dtso | 83 ++++++++++++++++++++++
 2 files changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 38554195fc98..d17b46a043ad 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -57,6 +57,8 @@ lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
 lemans-evk-ifp-mezzanine-dtbs	:= lemans-evk.dtb lemans-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-ifp-mezzanine.dtb
+lemans-evk-raspberrypi-dsi-7inch-dtbs	:= lemans-evk.dtb lemans-evk-raspberrypi-dsi-7inch.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-raspberrypi-dsi-7inch.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-nothing-asteroids.dtb
diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-raspberrypi-dsi-7inch.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-raspberrypi-dsi-7inch.dtso
new file mode 100644
index 000000000000..14743b3c3863
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-evk-raspberrypi-dsi-7inch.dtso
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	display_bl: backlight {
+		compatible = "pwm-backlight";
+		power-supply = <&reg_dsi_touch>;
+		pwms = <&reg_backlight 0 255 0>;
+	};
+
+	reg_dsi_touch: regulator-touch {
+		compatible = "regulator-fixed";
+		regulator-name = "rpi-dsi-touch";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&expander3 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+};
+
+&i2c1 {
+	qcom,load-firmware;
+	qcom,xfer-mode = <1>;
+
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	reg_backlight: reg_backlight@45 {
+		compatible = "raspberrypi,touchscreen-panel-regulator-v2";
+		reg = <0x45>;
+
+		vcc-supply = <&reg_dsi_touch>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		#pwm-cells = <3>;
+	};
+};
+
+&mdss0_dsi0 {
+	vdda-supply = <&vreg_l1c>;
+
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "raspberrypi,dsi-7inch";
+		reg = <0>;
+
+		reset-gpios = <&reg_backlight 0 GPIO_ACTIVE_LOW>;
+		power-supply = <&reg_dsi_touch>;
+		iovcc-supply = <&reg_dsi_touch>;
+		backlight = <&display_bl>;
+
+		port {
+			panel0_in: endpoint {
+				remote-endpoint = <&mdss0_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss0_dsi0_out {
+	remote-endpoint = <&panel0_in>;
+	data-lanes = <0 1>;
+};
+
+&mdss0_dsi0_phy {
+	vdds-supply = <&vreg_l4a>;
+
+	status = "okay";
+};

-- 
2.34.1


