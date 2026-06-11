Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD275CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 18:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+PfK1pXGOj99PCCrizdBT7nW7VolhzI0bx1MqJ3nKuI=; b=mETx/jGdEqvlRtUR3PSpaMkq88
	S4TGsH8YM+CqR5/m1ZfdlyM7EKZqU9bNsKOluhmbJyN1PJTgmjnOZ/5dj1lgoPTpe4qzsFd8MwVFP
	H7tfc0Gzr/Vh6ryRK7+EVZ/W+585XjCuqU1ERFmGcOA/cVlerd06PEpuM3VPdWr0BzZsmZgklRJcr
	p0tdJ9hPrpS03DVDrzAwo3jAmLro4ZCTSxb7S3ZdYU2n+QS+V8hwjcv+vWDrBfn9MhDB+yXw8djSY
	laAMqYZahxAvZWABhm5I+Ib8/5rJe4wLpXK3Ct+B3eICU7o+7qi5xNPBfwM5wTyRgsRF20Yb2qHf4
	0zrW2/zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXkI6-00000009tk3-1mbc;
	Thu, 11 Jun 2026 18:38:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXkI4-00000009tiX-0IJL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 18:38:09 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BIRnFF1433758
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 18:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+PfK1pXGOj99PCCrizdBT7nW7VolhzI0bx1MqJ3nKuI=; b=cBpGu/iPMSDZKQOl
	I5yfmD+8S+to6BxfjOiuV4YTmtdFJ7WvR/SCXLrtdtLP9jGZjVze1Ehak6Xx5aXl
	3HOBGEDSrTh8Z6+drm5ZVXIEKEbUZKUsyo0jK91tcETK+7rwtdZfHrrd0/SBCGni
	opcc7i3VHsI8lizD37fGci9frCWoWEfWA0o/3+X7VWw6baMty+3WhNzav6Okimh2
	TwLDkXDK73cbuGVhK5pBlAZMuB1FzcYTy+ghkPhISzHJoc4DNQmb0CJ2P6MH52zI
	gmBFBFV6BQpOTMu7oE81ilABEnIqUu0d+BRIj07spNrqxtdq5lGBL++bf9n91lOK
	Mwpw2w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqtb5jdec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 18:38:06 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-842446a3851so110050b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 11:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781203086; x=1781807886; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+PfK1pXGOj99PCCrizdBT7nW7VolhzI0bx1MqJ3nKuI=;
        b=IuFE7FIRvzF5WdkzPk4oKvI2V1VyQbdUGebZsE9v1v+sEISjMXfDEDifWuInObSA6h
         5lkLs2w9TeRZhR6OFOXp/5J5tkp5vyumQHtO8JM/fP7i1goaxCrqyp5zbd21CbEVi+kG
         f0khdckP2gUhkv970Za1AHPFr6EbndLnXmCEh6QF85pSdS7/jdvzln/y5/ABApSH4BPB
         GSjUTRAvfoCvYOTGzOFDWpzb1lz7PfLzy/l14gHXVPTAzTjtVMBjt8Aspd9UqrcbLzZi
         cCgF1CURCj7vrk1/dBLhljSb76BJQ1cD/gjHR86rW1MsI88yuwQ/JkUc3d4+2yyo32sR
         GyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781203086; x=1781807886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+PfK1pXGOj99PCCrizdBT7nW7VolhzI0bx1MqJ3nKuI=;
        b=luJj7neAkKeR9jerblo08/xYFwwKBTwQgCzl1lgrJDJapoiUQYFEkWVdapr7qACLrG
         3MLcisufUk2mC6m95OiPuBksuxxAqBt8HDEkG+qkicIvV/XTgJ6uMxPoaNuFXGJgV0o2
         /u11WlRl2SEEGCKDM3bj6E/03Zo8fHGbqIlifX+sDSVbw2q/ltnEGxd3OBu4pP1xjQas
         /pHzzI1JUnDAbUK6h5S0vOkWGfEeoFLnWf73TY7cS77SmJbT5Iezh3+C1NWXNFlCsZwg
         gLgOVndsuDSiKHWaOk4Xpj+OeavVRTaKnUOEFqsbpcNv7glh6skaaC+Mjs6O/ZlaZNRl
         1o2Q==
X-Forwarded-Encrypted: i=1; AFNElJ97ve6L3eYiana6xRBMl44kDkUCmGznYwF4SWihwXrn74Vwa4fs0GVCm6bzvDnOzplahA9K7hn9Chwf38u4nkF0@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8t1QUpZ0WtKSjzQquSpMAns8VW4lgXci9VQMviVl6NpABfMVd
	Bl0QQfQsiJUG/dvyFJQ7fbXmufFfzKiH9vuHuZZujRcsR9t/COlllqVe38sHF6u2vSxyu6XHTy6
	Z1GMyCOMk5P9EjZwxwPLBDxbeNM5vSQxv8b01Uyg3daV6450c8jRsNMH8GeqPI1c7HgVKGMsieD
	2EBQ==
X-Gm-Gg: Acq92OG7dcR3lotqKMwNuCIOGwL9/0eI/PbbjFBwvsFdfNQ3bsaWt8ITGgX2NyprfyN
	0gMM22TEU3vp498QEkRZrppDmgI/9eAtg4hl00jhVWBo00jtcefKouSuNpBSH0aRZeEkEBSY3Wd
	x4+OSDanD7EBs2bPJIh7ULNgyPk3HELvJjgBxWOo3Vd02MgGFVrEoeq8MqDgwvIShrnRuGISrGw
	eCBZkxN52vEKjBKJca7bijDncp+j86DhwqJWBL/AMP2518ilDJCRVcy/Z/1Z2aMlYs13jUfG6pO
	T88MtMDNsksW3K0ZEfNAVS9CcWUASuz9WZetXZjKsrnpqfdG6aHvoLZee1FI01Ex5XngJo8JWpm
	/HszgXLdYKV42Glrb8LnjOZ5Njwx1TtwHgH/F/6XXwXuQfQTVJ3o=
X-Received: by 2002:a05:6a00:9086:b0:842:6a3b:60c9 with SMTP id d2e1a72fcca58-84336a9d215mr4674347b3a.24.1781203085826;
        Thu, 11 Jun 2026 11:38:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:9086:b0:842:6a3b:60c9 with SMTP id d2e1a72fcca58-84336a9d215mr4674302b3a.24.1781203085349;
        Thu, 11 Jun 2026 11:38:05 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bbbfacsm2555666b3a.20.2026.06.11.11.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 11:38:05 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 00:07:04 +0530
Subject: [PATCH RFC 8/9] arm64: dts: qcom: shikra-cqs-evk: Enable ethernet0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-shikra_ethernet-v1-8-f0f4a1d19929@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781203027; l=3540;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=YOkOPlGx5N4cYnsDHHVcCPeF3FpDW33P72uZWcaYh6E=;
 b=ApzXY5wzC5GwOGHJ+Bi+P1WJlfEbrlFV8OvAOFu0dF8rKEc0eqdqInIl5UvOofMKR+Ozi7EGS
 aXR9zT6D7iBBRAsftI1F8xeifG1vaXy210OTMjSl43TEtFmVWFUgKk6
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfX7Nupjc/3T2Fe
 KirxfClEilyBbj2dilx9x9Zv6QTg1lneEH4qbljQEjdY1Ac8Xhz5RgxXZA8N8j3M8SUlO7xwOEF
 aLOXaoBV9IzjDFLHOn0y4akBHEWYE0oY0uvgXQgAfmwsgdKoNLZlUzipN+4wZnsDKtdxkTFDjTH
 0dqySu2sw4ua3oaAW6b8IdoM1NQ0Gux2rwAGNsoNnyRYb+mItut7TRlohfLMYnJub/eLu7jOKWt
 GmVUAGScpr8OE85GVsfRXH1rGzSoWoRpOxM/Qvd2IVhVJrKWTgDrVT8xXjhfSvWiB4AGr4QNeCu
 hVCEfjEp/fhAPt/TgsH3b26S8MhuiFToB0gIStVZ6GV00GdRy1Fnx19Kq0Z0vjWkbLT2AQH2hgH
 xS06zVfWqaLkhBApIKUrc1i5yIlxr4KOy9u70qM6BemfHxIbfnC3UMRD7Dv2SHA0kCfBMzh6Xt3
 HbD0XVpfTTwFLZDdlyQ==
X-Proofpoint-ORIG-GUID: F2H1g4NKU8c6jbV9KxzwNAvP0-5aBSWI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfX7Xo8xzP1Xd9N
 l2Vg/Gbk2OwZ5EaZ7iFuTEyeOK43qfMdVbJci8ZEboK5NMbN98QfdUw5YM5LZKW9+7GcwrHd3a7
 fcfRr+huYJMFeipfrap9wnIGP3Jsjjs=
X-Authority-Analysis: v=2.4 cv=e6g2j6p/ c=1 sm=1 tr=0 ts=6a2b008f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=flSr5DCihV0d4yMzew8A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: F2H1g4NKU8c6jbV9KxzwNAvP0-5aBSWI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_113808_239285_420A57CB 
X-CRM114-Status: GOOD (  13.56  )
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

Enable the first Gigabit Ethernet controller.  The board layout is
identical to the CQM EVK.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 119 ++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index 26ff8007a819e46bbc9ffa3dddc6fee6530a4a7a..1f2e4f6dd7cca436f62ba9f09cd328e5a2079095 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -7,6 +7,7 @@
 
 #include "shikra-cqm-som.dtsi"
 #include "shikra-evk.dtsi"
+#include <dt-bindings/net/ti-dp83867.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. Shikra CQS EVK";
@@ -60,6 +61,92 @@ vreg_pmu_ch1: ldo4 {
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
+	snps,mtl-rx-config = <&mtl_rx_setup>;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
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
+	mtl_rx_setup: rx-queues-config {
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
+	mtl_tx_setup: tx-queues-config {
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
 
@@ -95,6 +182,38 @@ &sdhc_1 {
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
+	emac0_phy_en_hog: emac0-phy-en-hog {
+		gpio-hog;
+		gpios = <149 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "emac0-phy-en";
+	};
+};
+
 &uart8 {
 	status = "okay";
 

-- 
2.34.1


