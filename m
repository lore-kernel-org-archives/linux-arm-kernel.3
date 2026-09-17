Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BC4C982CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 11:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uJhXSOoOh7cjCe2q1aXhRqHQZa4x+8gunPH4pO3XSOI=; b=tEhKAcOZGjpTcgGiqsJ6UV0OiF
	/2ncMHyChHEkBXTg+S/D0DzZ534jWAtgICSEtJYCeq9jKwHsGe2/Emxl2zcfFGokFSfi57LWHFPvy
	xmm9DieGE2F3xGV0EGwGuDg+Fw9MGgDM9xQqy+LWBdpUKzet53czkNQv7M4r7/ZkVoJeUt9bESFY/
	WAhmMxJs2KMO8LDfWSFZbkkgVP/Dl8ljDNkzsDMkNJDSRYdB0sdhVmEXP5aXpDTTIZj9wBMKYMNEk
	+97v0jfXXVBJ8IHTPCOlmz7zQKpWkLlTBISU+f+uTfWmfSFDIOU2OkOLntXBbn0QVH56qcMMYsc9W
	1zAe22tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7AVG-0000000BD95-2jCG;
	Thu, 17 Sep 2026 11:42:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7AUy-0000000BCxV-2BkP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 11:41:53 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zc101257860
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 11:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uJhXSOoOh7cjCe2q1aXhRqHQZa4x+8gunPH4pO3XSOI=; b=Bw3LXefjWBqcnrcC
	D1ryWwZ9+kGrz8mafCIOK+YwnK1cwyAm4rORW/j/ciFFCL6z/3PGqat/fkzJqEbF
	2pi9eKkfSbGDRNJSw+HXwkysURTY0qm5d+MIAPH8Kl64bfmyR42mYJBk1uB/J8En
	Lv5xysA7hn6OfVT6r6NuWURpvfwRb/5NsKxPWPCAyd9uta6Tm2tVTrPBBz9mdnki
	y8SrDuyD295mqGWbnsATCPiy542QhsIP1RVKONF74tFauP9WXB7cvdnS1EL98VsK
	QKRGWH2j6PKXCi7/DkKeLiaLpcwdD69yxk+AWDWurRu9yU36ctsm2dDBrh7Ft/H1
	UsvOJw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdftgj99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 11:41:51 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-86a43fc3527so1038545b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 04:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789645311; x=1790250111; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uJhXSOoOh7cjCe2q1aXhRqHQZa4x+8gunPH4pO3XSOI=;
        b=OYT5jihD9t3XrMW8/NjFa8KCGdVG3Ut7/biyU05kTS8idRv/pP3dC/5aCn/Z7cPc4R
         4ppxGbctYLj2lPsWNkVr2XfCzsVhc8asPRC/F+KjLCFGHj0IYs1OJyVK2XxvP2SaMV/v
         PUCslxdX4qFVRjMJVdFvj1FbYG8ZupoGRa+fwPlMb0HmTW8TXme84ngQGEJxpPFyC88l
         +649kDEmF4u6CiLhsUH72+AEGVeFcRMlOtBOcLdb0MaN3MD4PZR1nyZmq6asKTgLk3X2
         vkjdXSi/0ae5y70Hi5q+lr/nIq34FDAptZkLJ53uk7eFHvFtfyc2Yprv3ELrEHOxDr5X
         MZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789645311; x=1790250111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uJhXSOoOh7cjCe2q1aXhRqHQZa4x+8gunPH4pO3XSOI=;
        b=QQzGlDR1V5XLVqHNEWNCrX/SjEDYcxo19kK9MdVrhmWf3hWZopbYjHqUnG0ndT/7zM
         rUILyf8letC4K6fRn690DJoJSXLmqFLp4dW4JPD/TvtwlbGQZLobzBKpsrRxqws4obfp
         r1BJ7+fB2mNsU36DYsqhd3BbE326hqdEBFkCXIhvsQQqY5Z/x8UoqlnEBlH33PC4aMV2
         AlFTtHmhRiDoc+mJCjkQWeBMUJ8xqMQU5MzQCSyIcuchk5sWn0166dT7qVqr8pBP0jYd
         8Xirj+ZwvjtvrIgODcLhJiSRusSS7DjapNsgK6KiyYJ26PceoRjwQ1dhhTJ2UwZu3sKl
         KxMg==
X-Forwarded-Encrypted: i=1; AKwUvBx70pN2I+uyPi5p+h/30ii/SIIbWDMzegid/2zKL3B4Imorfl+mGROOE9bkIbeaZmwfDo73tdcqkw9QBFu3Rz0n@lists.infradead.org
X-Gm-Message-State: AFuF++lXfYDvVu/JBHLjPR9V2XgGARZjEGUgaK7eTW38PnMJm1frHOxW
	t8j2+RClYVIx4m++7vLGcfj183J+d73kL5KVkiXlhYYTU5WlLQ6ZJzW3x/ravIp9BoHjpRrsUHF
	7ZYn62Aj9P4vv/iMGGkbwSSppZQe6u9QuaTC5ORWtlG85SB3bz5vx7UIvjUH3erMbbN+SA71tiS
	fdCQ==
X-Gm-Gg: AYBFou2EWtAi5Rxwa9mYNtLWURjYO7BUTU0ItBpvyFxNkfsJ+ycEHd5x3VeC4XyixU+
	ZQm3F5c28j02ooW6KNa9AbkElTpaJDhUlegBsuX8pnizIIPUl+P+ahH8/09Ng1NviSdvx0MSedv
	iEGUd7Ne08cKghRZUUy08VctSXVVEdQodwmWO5awtzIJBIk1FcWCC8evApztKoV8I0FWYcGtPLR
	/HYPtR6+rDIE2jewqVk/kA+awIUF2tFv7N9X2XL+j28WWm+HHyxZISku3fGaLyNRtxyUWvXmte/
	1PSu7UAAqjqbydOGTBJZ3OxkrlibN6lzGkj64jGvUD8NvYMTpzSROo41Rf5KiTHorugyhP8yXfY
	EoVNO9qsQwf/hefl8uytl5usWXxB2IA==
X-Received: by 2002:a05:6a21:9185:b0:3da:3401:c13b with SMTP id adf61e73a8af0-3dd7256f000mr5385393637.7.1789645310616;
        Thu, 17 Sep 2026 04:41:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:9185:b0:3da:3401:c13b with SMTP id adf61e73a8af0-3dd7256f000mr5385340637.7.1789645310168;
        Thu, 17 Sep 2026 04:41:50 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50acc1178sm3066557a12.30.2026.09.17.04.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:41:49 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:11:04 +0530
Subject: [PATCH v8 5/5] arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add
 DT overlay for Shikra
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-shikra-camss-review-v8-5-9b9596221cfa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789645263; l=3663;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=TfAZkrQyH/2Nx/S5qf316QvGg3gZJpftAEMQtTUDcT0=;
 b=WQuOMChYboYzEnDWR8vQ0V5Mji2g2iiMArZvPnPifQnM8Pl/TdWMIoI2xXqDjPWAWlMMlS+RH
 fJwv+ka64QVAKicEOjKcPDbcpJwRImTlYzMaz9iNMcEJWYxz5p1+tVN
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2MiBTYWx0ZWRfX6qbz0D9qsCOx
 akO7j2g0ajK+BCIom5IbBqZRN4PGoPJWNp2+n7FC8kIM5p+Cdaqfufe+GmONnlZGOKydHO2oGGN
 nRdAX6bc1R/NvzmWlI6GcDkKA0aUEUSFDBIrzeSAUfIy6cYKfRps1AtCNJBa4/037Senvwu5MuO
 pn7N5pbCYosshntv2WQ0Lwwfc5EPKF2Uvimi8dlOqHoCyWuAzi1jjXBNIAGcUQzILm9owXyTiMc
 /QVm3VTDK6FWYWZjC8lvKTubgIryq555yIBDNw4DNbKOADsmu2dBqvcjXXoqw7vX4Qz70Y3tEDm
 xZL0SCqOXZB9qSSbsr0QsgBnTnBC4+wOaQlzDPuXvfQKjTbTBR+AT+eBda3kYOSwQpRFD9ModMQ
 aign2/C1OrYJ3yYfpRUIzc+9R4uQfZQqwpWsfo35ZZBsRfIqWYr0v7nOBGNVG8Z1Xg0l7onGJtD
 VjWm3RzSs/DBGRv6b+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2MiBTYWx0ZWRfX27Fo9cmRFd/D
 E8P0+nFaVks/Q8jcLF+uAG/AFHsgzc2GGUuwFmyZEi297zhN5LUhLslFObFgc+bEzc+EqaC+alE
 vMdiq2gIkhpz4JG197TbPT/5aDTC1ko=
X-Proofpoint-GUID: MFNHVpEWxfE-2t03pfFLHKIAaLnEO9bK
X-Proofpoint-ORIG-GUID: MFNHVpEWxfE-2t03pfFLHKIAaLnEO9bK
X-Authority-Analysis: v=2.4 cv=K+W3jCWI c=1 sm=1 tr=0 ts=6aabd1ff cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OGCdAuOInqFJiNoUztwA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_044152_686102_C9BC1284 
X-CRM114-Status: GOOD (  17.24  )
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
index 02f340aaa2ca542d0d175ff965198b29ac48772f..c59f0e2231b57b1dd1975c189820cd703d4d5d48 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -363,9 +363,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
 
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


