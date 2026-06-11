Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FBCCD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 18:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+qgmHOGmRapWq0OUXXvIAYW2o7E/H8TFKc0cwHnGMM=; b=hl251c/Yhz5Xsd13kJcW+5RyG0
	00eOLX6cuxxRCTHf+l/KLIWviH5/Zlyy2fE2wLJwFM47WLy1o8mFnC1sGrsBiUq5ojgTe8164GXpJ
	7o+JI4ua7GK2sjhP1wVRtDZs5fR4GOWUR2zBYnT7gRWreaJNHCFG7XJCA0Pf3Kz4Os+aXOnDb9Wh3
	rKMmwGCGJo/B/LOn/phIndpEOyFR4U8Rw4Q/B4Xt1fncjlrYmK3zu5xHaqBcs2HDxvXvQ6Yh4D2lc
	OMxsv4ozWfEFCmyfDZ7Pt46OUKxZgkA5/Y6rp+OApmXhMeCLkjY3zkVNNv6n/3nAJyoiWImdFIIGv
	a1uPho1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXkIC-00000009tpa-2wu3;
	Thu, 11 Jun 2026 18:38:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXkIA-00000009tmx-2816
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 18:38:15 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BISW0j1302553
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 18:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w+qgmHOGmRapWq0OUXXvIAYW2o7E/H8TFKc0cwHnGMM=; b=oRWz4di9ND6hN99G
	G3yEcSDwzj8xLcMa0+clj4YI8Gk7xkDWKM0Mk89+CbSb6nQs5u/pDSRyQPAAPQFK
	X3daIoEpaJmwI/nTcVjWiAx9+wVF4mTUQ3CxNjoI1VKJZGwnmljsdfnvGqBPyhlF
	523w/ifj/+K2hYwTAhlGy0HOoy9xNof8zOS2Q+GbpADle0GAMLtREemKNx9zORzP
	NjzDahAeP7oJ7g2kZ4pnrSw9vJROU3o0pOchDvYQ5MgujXC+rCIOvIpe7nt/X3Sk
	Mr3IkhrRp3ck958jOz/jHD90Yrc2NsvNnXyM5jdFBYE3LDf4vGqksG0fWaIzsZBK
	r+N2Xg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6ud4ff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 18:38:13 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84247fed609so109883b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 11:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781203092; x=1781807892; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+qgmHOGmRapWq0OUXXvIAYW2o7E/H8TFKc0cwHnGMM=;
        b=bOzw73LGSI1E4gChrSr7fOk++jl3tC2f2C3G1RLG+oianzpRfbl5CNbRsKhtnl5Ogz
         ulV4fMcJr6lyS7VUQrLldjD+CidFmK46lElAuUPG8jU9UlQ8rvTf1GJmPYOKd0cACBlz
         Wew16FoH3153qQwUDkYIJydGogsOeeNLXHSdMkZHqk8bHqN6TEv3rKcwoo0vSXmeA7ko
         N7YWfYP3RNJXYBTYyV9SavFBaFMg3Rnl2cg3rDKb2nfmphXYBX+zH80qbCJuglkPWmUI
         L4ztiM8h+QBJy72xvloC6M9nvg8EENC9WhgGlGC7r1RaWa+yNDGloGh+s7LM0RfLy1Kp
         mGkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781203092; x=1781807892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w+qgmHOGmRapWq0OUXXvIAYW2o7E/H8TFKc0cwHnGMM=;
        b=YZIhKLleFiNOMUvbS5TIHrWnpdLhAnah4PPgf+GRDnz/zvNbLCijqod14cwGIq96zX
         Fd7uuknbS4Ojn/dJOZ7PhCBj1Ce3EXQx1XkQAJPmLtrz1EiaivbKXhT7gjh/7uKv+TyZ
         AqE+m3+Kb54VybJRFKaP5ARTZrRH/0Y0iqKbWxm0wVfBcu6dXceZ1heiEmtWbPYCL5+1
         yM8lEpJX0GZZZKHUvu0x4hnKb87h5UJ0iy9dObJYT+kwLrDVc/vx4Y7cqUk2suZvSSw2
         q2eQQFRgBBw7aeZIDga65ja6LSOpWahhZSfK3rHB8HGuiUcEPFfdHoRtNlQXt89+pfJi
         Rvdw==
X-Forwarded-Encrypted: i=1; AFNElJ9qd/cJqr6gx12XxSgjn1seXlH0SVnRFlUL5vs7TvXihCe5UlysoQxTTFaDoMFExcWVPpQKFl4L14JKt8VONWdN@lists.infradead.org
X-Gm-Message-State: AOJu0YwC9NnSQV/t9xXeXihoQpoe21uagrfDl20QjKvb/jmWtNb74b9O
	XG30MPxcfClvYbuJMVEqidSg0I+JZ2ArTtHMnv049jVeQh8kbWIIERY+7fUuwQGBnSzIEyjs8ea
	L1fd3ozV78zPmujqQ+yfW/8Eb46+FRdjFs3eNE7MJ8TF8WMtjdtwQMA1GRXP/fTQ5GAfp6Jmt14
	Hvjg==
X-Gm-Gg: Acq92OH+GWGL8KZudrlGx5GPdJrKzQHifIfjpdOHcHRtmQg33CfLmIh3uCLBg1/CoLA
	z+VF+puhRnKPXHUlE1xUUGU9WR34RF6C4sCYtiMjfbuqZBWNJo0Rt4+3NGk1YCpsDyBMjAA829I
	KvczCg1wt6gJoU/n2H3NYFbt3y93nUTUOFDtyAJ/F9dKrNRNpNeozv21G7M7rm8jMR5ivt7YEcA
	5zflzFoQpo+Wwfn7/DlwG5hyxB10dg2j0WqzjOTdU7FOKuWTFZC0I5fTWe/ZQuIoVRhbraxGi3P
	7WjCqeXqYaewU4PTHjlBb4HmFbOKol6wpuztdA4j6PNH433zuHRXf/YYY9+tjwdYEYTqefYFGOp
	3EK//ALdyth9X4c8wFgnzMblng/SBmIziBItFNUEr44pExvzPdhI=
X-Received: by 2002:a05:6a00:2d9f:b0:842:6e9f:9dc with SMTP id d2e1a72fcca58-84336a9eda9mr4743097b3a.34.1781203092254;
        Thu, 11 Jun 2026 11:38:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d9f:b0:842:6e9f:9dc with SMTP id d2e1a72fcca58-84336a9eda9mr4743069b3a.34.1781203091712;
        Thu, 11 Jun 2026 11:38:11 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bbbfacsm2555666b3a.20.2026.06.11.11.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 11:38:11 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 00:07:05 +0530
Subject: [PATCH RFC 9/9] arm64: dts: qcom: shikra-iqs-evk: Enable both
 ethernet ports
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-shikra_ethernet-v1-9-f0f4a1d19929@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
In-Reply-To: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781203027; l=6213;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=myQOn368a4bEJkBKFi/AB/zdqSpCAE0Tjjhf3d8zs78=;
 b=6L7bDPM92n1GA/dkSKoqtFmo6gyQYaMeE5heucZ91kgX9VpAsVQwHgdprUw4av+2T6FNB/nz9
 +AyD4snXWCBAXT+Z8d1k+pmY4pSmAWMuwqYKYRYboWPIa4RtjbLydzp
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfX8ow4h6cRzZyB
 Gp1HvcLl448KcdECiIkrbdOg+/dBImlAsa1KwmlxUBJMUQ0vLbo3lDQTiQUUa0FxijEV2QHs83c
 /hRbwG1CcmOcI6t35J4BMM9Z7SxTSRU=
X-Authority-Analysis: v=2.4 cv=atOCzyZV c=1 sm=1 tr=0 ts=6a2b0095 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=8zPImXEJHl8ypWhI0nAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfXxxhCdyvO6rCe
 H5grT0rIA4UNlAU5FVmHshKorp2Rpbsj7HUCaauoQKyq086UVYAR00Y90m4KwglEeDUAPweqWbK
 Gojr/uP3mSAE37XIpQGIZEVmh6NyqPWkCDYyqLDBzpdZeH5ofSn9Vo8wLR7WfMv25lQE1dOxm4U
 FiFfW/mklUp83xPmQkdLK7K+TVxhql10abQjwMnAk5aJHx+h+KIck4OfwZoT4TtV+pIeGSiMT/t
 eX0t2usy4feOBL9xS1EI6gJO7/0YcMEwWRPS4/ELhZFjLYumbw4WUFmJFH9cPbeqZPQ/Vv115bF
 ugJb0k01n5QrmLyZ6oVPYmmVI9axJY0KPzfHv1voIlzwHt3W6OnYSE/eV3F8H3e24AW9gxotlC+
 +EmARSjU4ghfnAHhdOHTt67KQyyAIe0ZzCMEfdppX7wEFjW2BQ45VMB5jbWGz3eV2bTDast7637
 735BBW/0kyQ54SrmrWw==
X-Proofpoint-GUID: fE1kbySdRHW_KfmrP7Z3b_t22uHhyGFa
X-Proofpoint-ORIG-GUID: fE1kbySdRHW_KfmrP7Z3b_t22uHhyGFa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_113814_678678_C0BD3954 
X-CRM114-Status: GOOD (  13.59  )
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

Enable both Gigabit Ethernet controllers.  Each port has a dedicated
PHY with a gpio-hog to assert the power-enable GPIO at boot,
pin-control for the RGMII and MDIO bus, and MTL queue configuration.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 235 ++++++++++++++++++++++++++++
 1 file changed, 235 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index fd691d53a0fa8179111b921bf3bacc08884b84fb..d69b63dbc8e44f1bcec064564236ea23673bfa1f 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -7,6 +7,7 @@
 
 #include "shikra-iqs-som.dtsi"
 #include "shikra-evk.dtsi"
+#include <dt-bindings/net/ti-dp83867.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. Shikra IQS EVK";
@@ -68,6 +69,178 @@ vreg_pmu_ch1: ldo4 {
 	};
 };
 
+&ethernet0 {
+	status = "okay";
+	phy-handle = <&ethphy0>;
+	phy-mode = "rgmii-id";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&ethernet0_defaults>;
+
+	snps,mtl-rx-config = <&emac0_mtl_rx_setup>;
+	snps,mtl-tx-config = <&emac0_mtl_tx_setup>;
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@7 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <7>;
+			reset-gpios = <&tlmm 135 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <50000>;
+			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+		};
+	};
+
+	emac0_mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0xc>;
+		};
+	};
+
+	emac0_mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+
+		queue0 {
+			snps,dcb-algorithm;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+	};
+};
+
+&ethernet1 {
+	status = "okay";
+	phy-handle = <&ethphy1>;
+	phy-mode = "rgmii-id";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&ethernet1_defaults>;
+
+	snps,mtl-rx-config = <&emac1_mtl_rx_setup>;
+	snps,mtl-tx-config = <&emac1_mtl_tx_setup>;
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy1: ethernet-phy@7 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <7>;
+			reset-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <50000>;
+			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+		};
+	};
+
+	emac1_mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0xc>;
+		};
+	};
+
+	emac1_mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+
+		queue0 {
+			snps,dcb-algorithm;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+	};
+};
+
 &remoteproc_cdsp {
 	firmware-name = "qcom/shikra/cdsp.mbn";
 
@@ -103,6 +276,68 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&tlmm {
+	ethernet0_defaults: ethernet0-defaults-state {
+		rgmii-rx-pins {
+			pins = "gpio121", "gpio122", "gpio123",
+			       "gpio124", "gpio125", "gpio126";
+			function = "rgmii";
+			bias-disable;
+			drive-strength = <16>;
+		};
+		rgmii-tx-pins {
+			pins = "gpio127", "gpio128", "gpio129",
+			       "gpio130", "gpio131", "gpio132";
+			function = "rgmii";
+			bias-pull-up;
+			drive-strength = <16>;
+		};
+		rgmii-mdio-pins {
+			pins = "gpio133", "gpio134";
+			function = "rgmii";
+			bias-pull-up;
+			drive-strength = <16>;
+		};
+	};
+
+	ethernet1_defaults: ethernet1-defaults-state {
+		rgmii-rx-pins {
+			pins = "gpio137", "gpio138", "gpio139",
+			       "gpio140", "gpio141", "gpio142";
+			function = "rgmii";
+			bias-disable;
+			drive-strength = <16>;
+		};
+		rgmii-tx-pins {
+			pins = "gpio143", "gpio144", "gpio145",
+			       "gpio146", "gpio147", "gpio148";
+			function = "rgmii";
+			bias-pull-up;
+			drive-strength = <16>;
+		};
+		rgmii-mdio-pins {
+			pins = "gpio149", "gpio150";
+			function = "rgmii";
+			bias-pull-up;
+			drive-strength = <16>;
+		};
+	};
+
+	emac0_phy_en_hog: emac0-phy-en-hog {
+		gpio-hog;
+		gpios = <66 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "emac0-phy-en";
+	};
+
+	emac1_phy_en_hog: emac1-phy-en-hog {
+		gpio-hog;
+		gpios = <53 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "emac1-phy-en";
+	};
+};
+
 &uart8 {
 	status = "okay";
 

-- 
2.34.1


