Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2E4C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hgRWl7dvcHPI/iM3lLLq/fDWsyOLgllUFc6gqOMV6G8=; b=08iCfa/9WIwg12+u2p0pCuDdFQ
	wJNUwaORmTTWaZsbXn9rGhVTomiLRu4XttlwTWs5Iy29eBbJ1JsKLpovYd/jxP9GNTu3A3Hdtw72P
	CpnbhOFhdzTDQuHjRqTWmciD3VgtmW4N9lXLaVUyrrSlxmr1FPuHh1wZEL+C9Hq3orU4lMCaPpcvg
	085Ea4cSdAfU70EkKzvAVSG1e7GTDvTEYkvpBaR52cjxDewyPImtpP0e1mfObO6JSgdNCoCSeno47
	fzJkP9Jb2exqHRoszlAdmIjAS5P9U+xXN83dNOEciV7MexSXL/Ekx5m0lBqOKN48y20P43tMFLRyT
	v0kIwGKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis8P-00000006tKO-2Vq4;
	Thu, 22 Jan 2026 10:41:53 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis8M-00000006tGV-2RVL
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Jan 2026 10:41:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=hgRWl7dvcHPI/iM3lLLq/fDWsyOLgllUFc6gqOMV6G8=; b=KBAK+YltM9DJm+p3I/Q4/zckkl
	+UvoDLNLmsiIUgVnrEXAFfNMg3Xec2onEvXGdFt1+Gg3o+hcDUq2ShLhsj5QPHRnjKY6mCMHQxS67
	E1iJj5+Xm67fqCYN7o5jpty3epSgIUfBgkqWrPSMBq97yFivg5jD1j/98OaPestV2xpFm31sLJuC9
	2z1pqtR7jS7J9EapovOLwYoR/W812783YcW3TT/0a1vKBeFxJ3ro9yn0sEEzZkjL4X+QCiZ44/IdY
	dQBF8hTKrdpFxrs3WlPdRqAJKEb0tYWBsuyAIwn/SJBnVtytygzJPs+qfALGJg0fu0qq8LoGjsdLZ
	9UCbVgHg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis8I-00000000BpK-1mjj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 10:41:49 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M8p6uk3463159
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 10:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hgRWl7dvcHPI/iM3lLLq/fDWsyOLgllUFc6gqOMV6G8=; b=m0QEvOtzDYFZji+V
	YmKfUTj2q1Otp1mzrvY1xBBwnc5brRdiH4A35CJ6lRGECohlj+C2tciAkwyWYYk6
	hO6hxZrQMwFO/gVx6S7IPp+nX1vulSSGfU7KLSest8L6svN9gAD2QcvEWBhx4uGA
	6FI1bmpeix+nDNZM/Ijfl0rb5/vM6W9YBb4mgJX2hrk54ZAHKq7c6OE2RWwi5j/d
	fxtpqcmqRDE1QWD5h2jtoezT02vJUJypah/VjXJ9R6/Q7IR+d0EH9k5zlH2uEW1v
	sU+Z7XfpVhuBaa02pSGpu2Qjtun50eBheFJlClPawnrfzzayxDWladmTUfT31BtV
	ysIxZg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu0653hhc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 10:41:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8ba026720eeso251832885a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 02:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769078504; x=1769683304; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hgRWl7dvcHPI/iM3lLLq/fDWsyOLgllUFc6gqOMV6G8=;
        b=bzT1GJwk0xm2QV/i/VdUsCWVmwgJl1Cp3W+BEIFEcim7vb6woLt8Yy9Uez4zC3fNzn
         h0DUrDx5KoC3kdcYlxxT4i27rmxuYwnaetmnTxrc0cnHNXVXXWVGmZyZbfdpRF/nmAJg
         D3SGZ3sT51DaTEtUbaVdG2wER4TYzO8G0fhBbIQXS1KUxQNYyxQGcNk/8oQU0kp3agOb
         msSFXO5Cy4Vcz7WFArIVpLZas72cNz9MuTZeBjnoRIB6G5hAfPp0H2CwC0thg9figK8H
         HA/Nk4KQIZpLM7Keg0jo9NF/f6RcD1tF8pTPBOGHrS2BTsZ8a4jUbdZrDy6ec6JSS0US
         omSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769078504; x=1769683304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hgRWl7dvcHPI/iM3lLLq/fDWsyOLgllUFc6gqOMV6G8=;
        b=ZKEyPS5z1TS2m3rV8vO9YOd7CbF2cty/2QDnDl2gZ/4XseaXmV2/L6VbLXZaqa7szD
         3WTYH+4WRKUmFDAjzrns222qQxH3vNFHlKcsHAclHEpVuWv7gcnHishS6H/vVVxOhVOJ
         8nUfqxcMLrQdkYToXIbxb0Qmh1iNC/4eq99KizI4E2H5AxGRCvLLvR9tXHrJJQaRokzd
         t2xzfaFael4qcLCsFxbLMEJQjMRWQYWdPBCpKnnVuktGg71XHpVzTSoslB/xL1ArKGPJ
         ZKvP1GtGgSfIbEYO+X1b8RkxTQDIQVppb1cBAtoSSw330pxq1p8ujxC5YS/Ne1JoQWiW
         jFjw==
X-Forwarded-Encrypted: i=1; AJvYcCUCgUiESLr+ADU3WM+EMbUWZ/YDtIaUQQO4lBZR8N898Tt1meRvFteehP6rOh6m0zxG3xHlS+N9bWiDHNL5PrAH@lists.infradead.org
X-Gm-Message-State: AOJu0Yx99lqg7smoiUi2O9U+84XknGiQhWTInxQbj7RN7xT+QkpBOGfl
	xVERaH818ZGTwjZCEE/nj1o/+r+6ahp30iNw0Csdm8DM96soT4QRg9mBM1NlkgCarMzAVTxizDn
	8TnYI8cPXLccjUucv5dqudFjrTxSdPTzMELg9P67/jatlHRZikXpNHwTT2aBsjKWdpfeIAnF6Uf
	s/mQ==
X-Gm-Gg: AZuq6aJenxCSohgNlpljP1om8V42179TzFVNPrfoxTCoTEZMwh21X27EE9W8avTfgci
	ktSXWbpYNd1Oxb1YukTgaMNlz7fqOwmCQRUCrFUITx7fadCOs6Gec6Vuxf2gzKF+DRSoAIcMdyE
	jX+BOoWuJI8xh255RNY/gCcqJxqKnpUQxzPgK45lHCRBg/oC90k/2thB6FjmkrJdoWoTIPtSxpK
	Gjlh9j8dU+p4+2dR/QlL+wKfZVXUnyx5YcFBEN6Cir+cg/B9WO6omXkHfTSZbxYrlgqswkOuBYp
	8wlM2NEAFQci1hNMBaTnT8pJmrcTI1NPIJcSsON/fVLKWkcASHeRz5+G4DQpqvGiB7TTBRq/zgX
	RSITKJQKvMx0/jr76/5JhaJK1eSqxirFn+Ku5uNSjCiuoA50OwzmLTYacOLSwiQYplLEoMiCrn8
	e5
X-Received: by 2002:a05:620a:3910:b0:8c5:38f2:810e with SMTP id af79cd13be357-8c6a67a411emr2605787285a.82.1769078503719;
        Thu, 22 Jan 2026 02:41:43 -0800 (PST)
X-Received: by 2002:a05:620a:3910:b0:8c5:38f2:810e with SMTP id af79cd13be357-8c6a67a411emr2605785685a.82.1769078503284;
        Thu, 22 Jan 2026 02:41:43 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a7260229sm1387868685a.42.2026.01.22.02.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:41:42 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 18:40:50 +0800
Subject: [PATCH v4 5/5] arm64: dts: qcom: talos-evk-camera: Add DT overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-sm6150_evk-v4-5-a908d49892e7@oss.qualcomm.com>
References: <20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com>
In-Reply-To: <20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769078453; l=3019;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=t5OG46p4ljnSn6Ugt7/7Wx2T2LZF7712SOUc7lxrUEc=;
 b=n986DyQp3CsKwqwcFIuFzEWA3NaquONuV/voJTXw9fQ2RNi8BCnuw6M5vTv6vfYrct4IBiw01
 XcK3Aznm7QFBudn4AHwfEtODiasgAacyDuP/OgV5lAl0gYRNYY+fCyR
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=HOHO14tv c=1 sm=1 tr=0 ts=6971fee8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=G5RPoKDYpsqj7oBEIzsA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: BjLD6TgYfvZRRXjSJih7PHnSFH52FRA5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3NiBTYWx0ZWRfX5qX4Dybr/btP
 nZhgZRWdgrKqQ9V1YUDM6pDutD/B9hm2gk69xQhAaXNSOBJjdx09I9nvUZpsxi795LzA08uRYHY
 o6Bc6Hn3Kgk+Als3rtUvX699BqUIXGoWVEuNg/0/xx1AvQzZRBDAE3wOE68ErVFxi1uYLmeseI4
 GSus8JpaOfhdz9bCqwDPaDFSaSHYLGCIx9XcT4OHot+09sQEOUsRynmiAAZHLMpRRr2INs3wZvD
 T+O1wyOYDu2Zss8MGmlBzyuQCB1cJU0MUQKjI0m2bPycJooAK7qrMlpWqOKdsrwE6cPsrCh1DiD
 hr951no0DFQ0XW3tiEqB24g/t6if+xf9nfk3v4mxPa+GaFJXNYBShP9PyiQsr/nEUU9sv131z6o
 EVCoeUvr6CwqOSkaY/7L9pbbXdxeEYvkfR9CfbTkM5W9xz11ysBCK+xDAbqWWeBbi3CqlehPWvX
 CrLgrSaKdKeyOO9B+gQ==
X-Proofpoint-GUID: BjLD6TgYfvZRRXjSJih7PHnSFH52FRA5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_104146_706816_FF0BE648 
X-CRM114-Status: GOOD (  15.39  )
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

Enable IMX577 via CCI on Taloss EVK Core Kit.

The Talos EVK board does not include a camera sensor
by default, this DTSO has enabled the Arducam 12.3MP
IMX577 Mini Camera Module on the CSI-1 interface.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  3 ++
 .../boot/dts/qcom/talos-evk-camera-imx577.dtso     | 63 ++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index a2e48b58323c10735c8b98996cee6669e4f918e7..b505b5b1aa2feaaae691977b35a2d872751c4a46 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -349,8 +349,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtbo
+talos-evk-camera-imx577-dtbs	:= talos-evk.dtb talos-evk-camera-imx577.dtbo
 talos-evk-lvds-auo,g133han01-dtbs	:= \
 	talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
diff --git a/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso b/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..53006a861878f9112673b9a0ad954bed7a5fdca5
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,qcs615-camcc.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&camss {
+	vdd-csiphy-1p2-supply = <&vreg_l11a>;
+	vdd-csiphy-1p8-supply = <&vreg_l12a>;
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
+		reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam2_default>;
+		pinctrl-names = "default";
+
+		clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		avdd-supply = <&vreg_s4a>;
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

-- 
2.34.1


