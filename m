Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54AA9C98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 04:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EHd2P9cWUvhze37CjDGU3L2BOGNEXwJl3rNmq74c3F8=; b=cDkiyAH1QYf7c7bRKTIAS5i8AR
	f8Q72Ofpds5Lg3NdAhYKfcRWYjPe56c57GiDhDTsMtdZYzCco79HOuJkWWcmMs8xqT07eO/z3QxW6
	Z/s31icwPOM2SfsA2nzEDIaJu1zVEIjZUQqha8T4HBxd8/AfMX/wufHPxajcarhJKgMLYIgXj0AJf
	y7i4cnCvkFwi7VN8Ssild0UyNM8t5biaCbPVvyNTLI9GDIoiQ7qjmap7hMZbpl4TuixpHDU9AsMCe
	mjm0cuWt8v8c9lMm20e8HLiv/9LIfVJ8x3LO2F0uOAW5W5+EzZvnGldLcdzzwR/Y9hbiCaP3VZL/v
	CvbVX/4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9F3s-000000078vV-1RUS;
	Wed, 23 Sep 2026 04:58:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9F3l-000000078sE-38Od
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 04:58:23 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3quRL2389855
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 04:58:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EHd2P9cWUvhze37CjDGU3L2BOGNEXwJl3rNmq74c3F8=; b=DXYahJ0l2Hg6a69F
	2zEWGrrAclr0wW7n42JSPe9jHalMww94TJpkgjcocSRy82+GdRQC+p76xmWsNazX
	+9yoRFhLBoR0lLphKaIARShtVT7CfircgFBs4iG96k/FKE6CmE4QWBTEXq64YjoZ
	TmAmLrRMk+Fmsqv6tFSJ0hWd/Ds+msdoaShzlf9fzoexCVzFoHaIUZkeK5AmxeWB
	K+E3iazp/mouKjPyb6bhpJJHzYTVV3JI7MHAAU2qYu2OcTB2LS71RwRTflTG2zhh
	Cu8v2TGyh8AVstEX2xKzeLl2Qhc9SZGmLoJyziuPuLx5GbUPo6oJm4VAbuzAkuGi
	S0LeGg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv78n06h7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 04:58:20 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30f1b904861so669095eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 21:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790139500; x=1790744300; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EHd2P9cWUvhze37CjDGU3L2BOGNEXwJl3rNmq74c3F8=;
        b=H5Yl2eXbCX5LllNNJQTlcOHzg/EOv0XsKZj49Y0OKKDBFVww7fjlovnqFQ59sUMK2G
         ckIVNIBHvBz6MoeOgIw2wM63lx+BZ+v84SDorARrsC/JUIMOa4NhXvk2VGgikK/vqlwU
         jFvX53Rw8ArteaqLiI/lSWqX4rDn13jI7Sr8PGhJaa3zsS3enAC5xmQ7Sn6rz/3OS4j2
         MZ/AwxT4p+DA+UX3iARI8tIRIn/EFaKwZ13CLiGVqVX+z1zLkAhq3kACQIFSwQifeQtW
         awALH8xxKu1yiSV3BVxJEw2ecLnc6LtSU8xvnch2cq2SDbLHuNAnxPtiHRiVPYYjkIY/
         IGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790139500; x=1790744300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EHd2P9cWUvhze37CjDGU3L2BOGNEXwJl3rNmq74c3F8=;
        b=IPp2Q7bDR+UmdxG+THyLad022Jixtlf/DcXxE344E2N2jVwvuJkbrjQTLNAf8SsuuT
         Ja9Sr/Vo1uoRimDDCb6uQBLpHQQQxVilYOoH3nHyp/kWODIE1Kn0LuIEoDZw+TbVIFih
         9kQT6E77+7u5qu3hZxac8HVtKztrKGCAMr0BMDPvZsQlH1cL/5KApHjN7e/e42rwca2x
         kyIO5noVzWwgzQI7c6qQVe097mLw7EVPzhFelvFwXCyJK8ADIM8JGq8e0ldqo85nUu5w
         g/geRaukd9wqSWpeJ2sxY8RGFeNxLxGV0GV7igVlQ2lesxk8d2JdON/h+L7MC4eiP+xi
         InSA==
X-Forwarded-Encrypted: i=1; AKwUvBzJhJLF3S7RHgvhG+goJT25BJjfgOEtr3CZHDY18aZQm0XeTBUypDJO3+MCZSCWhgkE4vpEiQuIoWky6qDNwHO6@lists.infradead.org
X-Gm-Message-State: AFuF++l5UkxuYpZSC6wKJLpe4xcICSKdDOEzbIGitI08yjcnYGAS3G9u
	iKOWhjWSM/qMn3qoiplcSbdk/QdeOFV1kxHOXnoz4lyPNie/zAIMChLin7xBYxkp+x4dS/hm5tC
	X+tvtxiQMY0ckB8ERYwevzMfnx9yFF20jlqXU1vY6F3k7n/F2jl7mNGC6wNB+R1aVL5EAxE/jW3
	/3kg==
X-Gm-Gg: AYBFou20qlDTmGLRHjSTJY2LIunxzciKfxG6Eb/r+fJsPW6cUzJle5glNs3d8Fm06DO
	+JDKkhi2LMXrJaoUV20mHIOXiKLFsRXvwgmx/9/OonLZKo2wU5edJLxhmv80XnSXmpm+LKX3pmY
	3w0CtPB6TDnhLIwB0FBF/+1jvDwQIOXoQtlbVCZ0O7qZEWJ1JJdG6XhfPkgWBxzFnnFrYy8pqo5
	HJDyzfDJDWoZwK6VZprlk9vQ7yON0Uf0ur3gB4a3WQQMdJKDF80CWD7vIch5qqUrthA05i+B61K
	mpluA1Bwi8T5tKBbh8khLNxf+w6vrPcawUCMhSnHpPImC/1IbQXmZWWC43wucL4AzNvgeftSnyj
	8LcE0eBwr7o33NIhDGk14by9spKMI0A==
X-Received: by 2002:a05:693c:41c1:10b0:339:7f8c:7f9d with SMTP id 5a478bee46e88-33e8d8d21d5mr1625659eec.28.1790139499475;
        Tue, 22 Sep 2026 21:58:19 -0700 (PDT)
X-Received: by 2002:a05:693c:41c1:10b0:339:7f8c:7f9d with SMTP id 5a478bee46e88-33e8d8d21d5mr1625617eec.28.1790139498947;
        Tue, 22 Sep 2026 21:58:18 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96e48e3esm3168907eec.26.2026.09.22.21.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 21:58:18 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 10:27:31 +0530
Subject: [PATCH v9 4/5] arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera:
 Add DT overlay for Shikra
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-shikra-camss-review-v9-4-09f5fbea1309@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790139451; l=3710;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=QqOCZ4UANNvHsyhOiWOL6rnrRj4uZgu6LeQYl7gibVE=;
 b=pIzV70UO2zPoKcDhrQ6FQbygzEHdlH1iw245DkaluIP89rCOLf883v9OozqlaODuL8Pf9KxCr
 lHSKKmoXfa7BSy+pOkUAIuuBrzT0xAyJKA3SpitFDKQ+vkWf19V+2t/
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfX7Pq+xuUYuA4U
 Sw2bPftxtVb7mvQBmqB0f0MgAZR0QsoY5vJVaG+udRSDUQS3p65JCeTratdj3SG/SUN+dDhyg/c
 +hyL7RFyhfMtyUNWDNZr7H9axYHRuNM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfX7hEJ8jPW6X/S
 v6OVEggYiaf/3jyLLsCaFtmhVNKypufr+WwM4SMygpLnKuKBdqENRbIkEtt8v3v9JLYWNieNQKr
 9hsbf3BUkJkicT3YoSL/6zTL45dT/T7NVNW+ZyHEBE+EkHIHUyGPJ6Z/pZXsPwtf0yibFDekYrs
 yWYMr4or1iTXqU80hyReDIiC5fAY0XDcKqFjAQ3apMa7XmBzJWZyI6/zuv1NhxHb+zKirIK6BqU
 sok5XzC0fToN/k5EGepDQ0a3bzmoPNdjuiJBYJmzTmstylFFl4HmEztGlvJsAYGCiwzLAVXT1Oz
 f7eSvukHIV6qoEt1sUe84izf0/02XJ4kGcEYZNZClGzgd9B3YHCXjJHPj3r2hOZnpe1kFm73BKe
 Paho1s64UuflQqq1o8cIy0xBQs/cSBP+xP8MLCt69LzauVEq21MnhY4Jts2ZpZi3eldkm7gvPTg
 Rl4ui39m2hiDZ1YWZFg==
X-Proofpoint-ORIG-GUID: hEt1zxxr-rQnXylZ9v8_C5aeEEDniB3Y
X-Authority-Analysis: v=2.4 cv=aNFlOr9m c=1 sm=1 tr=0 ts=6ab35c6c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OGCdAuOInqFJiNoUztwA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: hEt1zxxr-rQnXylZ9v8_C5aeEEDniB3Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_215822_025297_A8AC27E9 
X-CRM114-Status: GOOD (  18.91  )
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
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  6 ++
 .../dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso | 72 ++++++++++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index efd7bc724ee15d3cc3fe391cc93da334e116df86..c049c3b0637f306c242eb42bc3cc11a333ae012f 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -363,6 +363,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
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
index 0000000000000000000000000000000000000000..791589bc7642ea9edb1b2058bacbd519a1aaf2af
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso
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
+	vdd-csiphy-1p2-supply = <&pm4125_l5>;
+	vdd-csiphy-1p8-supply = <&pm4125_l13>;
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
+		dovdd-supply = <&pm4125_l15>;
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


