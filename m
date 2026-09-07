Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663B0C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 06:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WASUx8wqkzAjaBL+GRpEgQ7y32IiKrNjX6OK4Rklm50=; b=A6nEaVjUBYhs6tMGxoZgaFpk0F
	kzExcaTFf0yNW+YAcyd0NCxYnK+kmoow4EwoyvNBnNDT/QZGsnd8TyQtMdb+DGyG3E99MV9hZt986
	qgEqYSspswA6kx62LiQfcRzsS6+UDlBxShk4BtEPn1dVZr+fj2l0Ey12/LsXrnnIfc0zhLsEIdGbX
	gMn/kHp4pG7F5vykoBKVc7CEKyzjxxHwwnNth6InuFTbyBxacrTATlb3TDG+Uhl7CVJzkHJ2zhjIQ
	M4Y+JpCValx2IxEIDEjxQe1xeMyafSGkRmKsLW1k7A49HgrYTEfy3gzyhi4m6j2w8s4e8rUDP8Jib
	59kANNoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Svn-000000061qH-1gf6;
	Mon, 07 Sep 2026 06:34:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Svk-000000061o6-3Fmd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 06:34:13 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873l2UM1699683
	for <linux-arm-kernel@lists.infradead.org>; Mon, 7 Sep 2026 06:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WASUx8wqkzAjaBL+GRpEgQ7y32IiKrNjX6OK4Rklm50=; b=T0M99GLf/XfQe6LT
	GBWp39Ka4yPQ8snHcuE8oVAitfCAaCzVhuxtcT3dylkbl0eaf8VQ1BOGohLVI3oq
	XJH4i26uxQPfN2zZ8ekMc0jrQ1yAfmbir9gasHQnXWJ+M29xNQ5MmptMVnIwjgfx
	GjWLMKDYzzswvmyKSHM3ccoNmN3+U7jbvncrxvhNq7I2RuNwOytclKPY8hqjiNeK
	e5IrSgkdy+C8L2MpOZvpq+1BfouCQZKVIrudYKtM9WW1wGUJ5Gz58AfrqI+HFhrt
	frUzbc+DGFcCvriREK1R0RfunUO8gq5euBxq3eXQL4DguWvyL73gAsdkGtpM8aZU
	Iq6lRA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggc8jda43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 06:34:12 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso6225446a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 23:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788762851; x=1789367651; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WASUx8wqkzAjaBL+GRpEgQ7y32IiKrNjX6OK4Rklm50=;
        b=ZzUaRJRAdr4IZ4aUAXePdFMrwsr+atZ/b03zFNNNsKHBaJtrx0sL2ZkX9QO5ss7oNm
         nelK1icOtokqgl5gCCYm9ReDHtEkG82m47RNlzjqR9Zw9UDo3eyATWExu2sq0ZBk9nN8
         x0pheHRSONti1RAJ1gKcLIpNtU8C15+Oh4Wsgq+s6hFl6TJkxLfpZLe3hm9PMF7x9daP
         R/4BcfCnvbTY2oI1kSAmbdR2stGgbLFs72d+1EIs9CPVIe5WmhwTVAEdT7gNPZ5twyum
         teVXu59f1Bn4C2x92nKxMdBUi1fWfKPW/LNaX5dK/lc4x9/8//TCyZCZ1XAXrvjJZFXw
         NwHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762851; x=1789367651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WASUx8wqkzAjaBL+GRpEgQ7y32IiKrNjX6OK4Rklm50=;
        b=jHu++nb4SByvR/YTLngVSNmdHRBViil5ij0y0Bceosy+M0gQRWj80g2dOl7OnuAMKE
         E49wZEgAo92MpH9a9apaJrifOyyUAhUK+1is8Vja3wHpB7N+ueYjC1YFMh8ItwoYgDE2
         VHhiPeX11mUpHdYwp3WoCLvjHHvlRqs+fN/XAAssbdqOD/HgZOeg6XvJyf254OJvjfeK
         MV4cIHWNbBINblPjxcUK6sVKtG+GFnsaPPzVeyylASRDxz7sKHuvPIIoZNNCQeOLkUzl
         fMu1ltvKJqsI9sED1/5NJyNtWvagQ5UGI+ErKXFvJRYt6Y7jBsc4vzML3QP4s2sp41Sp
         Ap2g==
X-Forwarded-Encrypted: i=1; AKwUvByaTfp9pjjgMlCN+rrNdUBaoRGm9qhMkKfOQAn3KxigIfybEHBsn0YZuh0yGsjiCfADTCDgUZYrgk5qBqCE1wMw@lists.infradead.org
X-Gm-Message-State: AFuF++mlu5PdCR2ZJrZIPo/ZCwlvksHEFvyaRDw8fCe7wCXgD9I6r53r
	MMYRcAZnyQsirJEavR/ozb/nJw348/LYoJ6jLzz6u42fl05V3/fvqWoCpsPuVZFtWLxgSbpPCK4
	842JQMVxgeMKJe9kQjHGqzEgseCZwjs5XQuxVDpsV8uCc0OjHoPrru33pRvmsFMUMx98TQIANlp
	gSOg==
X-Gm-Gg: AYBFou3bk6ZHXNsK1hFkMhRim3u8nwGSUyESaOIli7J7ozeKXXjzi4tjXXZ+9+wzCvH
	qDQ17hF8kIIESOaH6Q66QR+z3uChrsdQWQDgwOFb7uBmduKivC98CTSvha2poUOFngwy32DPiT8
	AZRk050o3Nmb/lilaBeTKYEOt+mhLC8OhL6WLkn8f7T+KDhISXld1U2ojW3w22MFYLopT7jXTXK
	ZV4RclXAHOa2lDzvlvf65XFTse2w/fn5lnv/oceb+U3HqW8xPKwNHqcCESmTxBO8On8nRU6d/BN
	Hqvdnu+USjLTnJDV9J0udEpG+hi1w0aRuhG7rUXFG91UDhFLb28XjBS2x4dEqOx4KFekmJqSplz
	P+P/L/b9vL5+lwjaMOAlxFHyL9OL3zkNVc7Wo
X-Received: by 2002:a17:90a:dfcd:b0:396:4cbf:45a2 with SMTP id 98e67ed59e1d1-39b84cce5a8mr368787a91.14.1788762851490;
        Sun, 06 Sep 2026 23:34:11 -0700 (PDT)
X-Received: by 2002:a17:90a:dfcd:b0:396:4cbf:45a2 with SMTP id 98e67ed59e1d1-39b84cce5a8mr368708a91.14.1788762851034;
        Sun, 06 Sep 2026 23:34:11 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33808be8fb2sm2440549eec.14.2026.09.06.23.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:34:10 -0700 (PDT)
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 12:03:53 +0530
Subject: [PATCH v2 1/2] arm64: dts: qcom: monaco-evk: Add Raspberry Pi
 7-inch DSI panel overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-rpi_dts_overlay-v2-1-a4989322ce00@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788762840; l=3148;
 i=shashank.maurya@oss.qualcomm.com; s=20260828; h=from:subject:message-id;
 bh=8N7TY4Wx00YA/qc/Yzv+tudh7jh85F9onYb97CA49Wg=;
 b=G7W8n/gqGUYM6VYeoFH5gl8G9XCPhuP8IzLkJj543T04lV4BW2rrUIVQdyBAfSkG8Q7WLGnY0
 Bi4dMbeXCxEBr1zkZg2WLV65vntK2SOczXvRxl84nbjQ5O8ptlpo6l5
X-Developer-Key: i=shashank.maurya@oss.qualcomm.com; a=ed25519;
 pk=xld72d+QYBwDMDcn3+QLCb5AUsj/D0j8klGIuxWd860=
X-Proofpoint-GUID: mDnAy-21a1JNxC6evunjPzneuj_IZrVB
X-Proofpoint-ORIG-GUID: mDnAy-21a1JNxC6evunjPzneuj_IZrVB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA2OCBTYWx0ZWRfX6Lc8JtSVYiWP
 ZY9Q6dJSvImxY5M7e3JPCu/ZE33O3BtvKtg/nyxnJhQvGnhfExljOLQhPJKP4RpxxeMXnzrF69J
 EohJNNKr/5isK2FoXRHhkyEwMiz9htaQkg3zbP4Dpwm+WkMFcB2vFdh06qcepkmH9JA4EiQXa26
 N/A43DYb49yM5oTsDZVC46Cc/a7/YBSNCUCrxVolk3h20QRNVXYvERnt1wSirKDK/BPPUnZzFe+
 3CME/GB3ROGYEkmllw4ECFZYyEFi4eK7krbbZIyZQo+WDB5JQNtcyQoSRQma5L6BlFRvRGGx/fS
 xYsM1sc1ZKffJGuemNrlghkajvyt01BKJqZe8TG5yI+enSH06Op5zDTqH/f7xII96X5fbipVvm4
 zTSp8h9O7ISGWUXTzSCE/IJnG7n0VzbcbBbWK2fqz4HZe2d4YhZn+4OGp+y62QWLJuAgJDGc9BH
 Kqm+9r0zxaJ7ppodr6g==
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a9e5ae4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=eOe13yjVLI-PHPVp4M4A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA2OCBTYWx0ZWRfX409i9GO/kWYD
 5SLOdjjC2YozXuvQBGJ+J81bmIFzwYXpvN1UakX5l56OLun4Us3e8iTzkpHzW5GtEIxDohfZgbJ
 j72gymQ79WQIC2+FyUxs/2SSdJlN+PQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_233412_843804_E6DB4345 
X-CRM114-Status: GOOD (  16.88  )
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
Monaco EVK, using mdss_dsi0 with 2 data lanes and the panel MCU on
I2C8.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  2 +
 .../dts/qcom/monaco-evk-raspberrypi-dsi-7inch.dtso | 82 ++++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1c86e7e98f55..38554195fc98 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -71,6 +71,8 @@ monaco-evk-el2-dtbs := monaco-evk.dtb monaco-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-el2.dtb
 monaco-evk-ifp-mezzanine-dtbs	:= monaco-evk.dtb monaco-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-ifp-mezzanine.dtb
+monaco-evk-raspberrypi-dsi-7inch-dtbs	:= monaco-evk.dtb monaco-evk-raspberrypi-dsi-7inch.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-raspberrypi-dsi-7inch.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-raspberrypi-dsi-7inch.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-raspberrypi-dsi-7inch.dtso
new file mode 100644
index 000000000000..f27b5a4a6093
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-raspberrypi-dsi-7inch.dtso
@@ -0,0 +1,82 @@
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
+		pwms = <&reg_backlight 0 50000 0>;
+	};
+
+	reg_dsi_touch: regulator-touch {
+		compatible = "regulator-fixed";
+		regulator-name = "rpi-touch";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+		gpio = <&expander3 5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+};
+
+&i2c8 {
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
+&mdss_dsi0 {
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
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel0_in>;
+	data-lanes = <0 1>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l4a>;
+
+	status = "okay";
+};

-- 
2.34.1


