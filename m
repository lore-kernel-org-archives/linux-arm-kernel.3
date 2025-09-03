Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6D1CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 11:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCAA24aLVQ5UCYBRXPQVDGjfntLRUibp0ZLGnQkGxKE=; b=LJ1OSmBfJxVz4PufOAQRTQHsez
	2Nn55/89UnPRoL9evnmUzSrb1G3JB52LSo88lWTC/KtyqMEnZPXUe5OQKduib2SWAaJrZXVv1l/zC
	uOTQzfEMChvoAp7jQPFypgy88aMIjzfW/nzp6EO/WrsbpKJjmde7NE9wUGDltqg4Z4Or8V/eJrFJ3
	d30mljvEvP/caHlnpkoAciHZPNu12ARAFOjZRFtMg7sPZSHlWBaooKJODHOgGGf9q2ePHrFZI7FUY
	ygoeUrNJPumRg3cgtsvZHmlgAb7FwZCSqheTh75pTbWS+LmNmivg8S4shZUUQz7NrcKITsmBR7xKx
	h97b0J6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utlEj-00000006ATu-2mq6;
	Wed, 03 Sep 2025 11:01:09 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utkCL-000000060KY-0vEU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 09:54:39 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5839j0hu017831;
	Wed, 3 Sep 2025 11:54:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	zCAA24aLVQ5UCYBRXPQVDGjfntLRUibp0ZLGnQkGxKE=; b=GCTJxlivJZPLuLp7
	EXwKH9yLkzlTnqoMuX8htzGgM3tbXpv0MmStcP+WXp+1Wii6y/3RhdceufXeBoCm
	i0gOW7RuKzCnDyd5gDV8Mu/k4EqSjREBhPvxlYgN5rH0L8jHHHb6gvdQCVE1hgfO
	JPk5wmpMzInaVutthCcwzHsdA9FT9ykfeWWNwwcM0ugAKuGZsrYYxSG8vcPreL1T
	XGNKAjZM2FKt/Z+VjgaMM0nu1GdVZ9DKCKiul+cDvlIqO05lTC+ySC+lGnqLVzi/
	g/lebYtQkOepkvNAlX254oJE0/h4BypuOrySxUQfKIaMXC4VCXUZbPOwFsAL6PQy
	dGyh3Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48vc8m5hxv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 11:54:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1ED9140049;
	Wed,  3 Sep 2025 11:53:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 00EC8373227;
	Wed,  3 Sep 2025 11:53:13 +0200 (CEST)
Received: from localhost (10.48.87.141) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 3 Sep
 2025 11:53:12 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Wed, 3 Sep 2025 11:53:02 +0200
Subject: [PATCH 1/4] arm64: dts: st: add eth1 pins for stm32mp2x platforms
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250903-mp2_ethernet-v1-1-4105b0ad2344@foss.st.com>
References: <20250903-mp2_ethernet-v1-0-4105b0ad2344@foss.st.com>
In-Reply-To: <20250903-mp2_ethernet-v1-0-4105b0ad2344@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_025437_543972_FFC3F32C 
X-CRM114-Status: GOOD (  10.98  )
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

Eth1 ethernet controller is present on every stm32mp2x vendor boards.
Describe the pinctrl of eth1 for each of them.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 126 ++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 5ac9e72478dddb82be0ef7432d7e728932b2f4d6..3a2a82de48536ef4fe625b69a61e91f746b0d53f 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -6,6 +6,132 @@
 #include <dt-bindings/pinctrl/stm32-pinfunc.h>
 
 &pinctrl {
+	eth1_mdio_pins_a: eth1-mdio-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('F', 0, AF10)>; /* ETH_MDC */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <2>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('F', 2, AF10)>; /* ETH_MDIO */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	eth1_mdio_sleep_pins_a: eth1-mdio-sleep-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('F', 0, ANALOG)>, /* ETH_MDC */
+				 <STM32_PINMUX('F', 2, ANALOG)>; /* ETH_MDIO */
+		};
+	};
+
+	eth1_rgmii_pins_a: eth1-rgmii-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('A', 15, AF10)>, /* ETH_RGMII_TXD0 */
+				 <STM32_PINMUX('C', 1, AF10)>, /* ETH_RGMII_TXD1 */
+				 <STM32_PINMUX('H', 10, AF10)>, /* ETH_RGMII_TXD2 */
+				 <STM32_PINMUX('H', 11, AF10)>, /* ETH_RGMII_TXD3 */
+				 <STM32_PINMUX('A', 13, AF10)>; /* ETH_RGMII_TX_CTL */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <3>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('H', 9, AF10)>, /* ETH_RGMII_CLK125 */
+				 <STM32_PINMUX('C', 0, AF12)>; /* ETH_RGMII_GTX_CLK */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <3>;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('F', 1, AF10)>, /* ETH_RGMII_RXD0 */
+				 <STM32_PINMUX('C', 2, AF10)>, /* ETH_RGMII_RXD1 */
+				 <STM32_PINMUX('H', 12, AF10)>, /* ETH_RGMII_RXD2 */
+				 <STM32_PINMUX('H', 13, AF10)>, /* ETH_RGMII_RXD3 */
+				 <STM32_PINMUX('A', 11, AF10)>; /* ETH_RGMII_RX_CTL */
+			bias-disable;
+		};
+		pins4 {
+			pinmux = <STM32_PINMUX('A', 14, AF10)>; /* ETH_RGMII_RX_CLK */
+			bias-disable;
+		};
+	};
+
+	eth1_rgmii_sleep_pins_a: eth1-rgmii-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 15, ANALOG)>, /* ETH_RGMII_TXD0 */
+				 <STM32_PINMUX('C', 1, ANALOG)>, /* ETH_RGMII_TXD1 */
+				 <STM32_PINMUX('H', 10, ANALOG)>, /* ETH_RGMII_TXD2 */
+				 <STM32_PINMUX('H', 11, ANALOG)>, /* ETH_RGMII_TXD3 */
+				 <STM32_PINMUX('A', 13, ANALOG)>, /* ETH_RGMII_TX_CTL */
+				 <STM32_PINMUX('H', 9, ANALOG)>, /* ETH_RGMII_CLK125 */
+				 <STM32_PINMUX('C', 0, ANALOG)>, /* ETH_RGMII_GTX_CLK */
+				 <STM32_PINMUX('F', 1, ANALOG)>, /* ETH_RGMII_RXD0 */
+				 <STM32_PINMUX('C', 2, ANALOG)>, /* ETH_RGMII_RXD1 */
+				 <STM32_PINMUX('H', 12, ANALOG)>, /* ETH_RGMII_RXD2 */
+				 <STM32_PINMUX('H', 13, ANALOG)>, /* ETH_RGMII_RXD3 */
+				 <STM32_PINMUX('A', 11, ANALOG)>, /* ETH_RGMII_RX_CTL */
+				 <STM32_PINMUX('A', 14, ANALOG)>; /* ETH_RGMII_RX_CLK */
+		};
+	};
+
+	eth1_rgmii_pins_b: eth1-rgmii-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('A', 15, AF10)>, /* ETH_RGMII_TXD0 */
+				 <STM32_PINMUX('C', 1, AF10)>, /* ETH_RGMII_TXD1 */
+				 <STM32_PINMUX('H', 10, AF10)>, /* ETH_RGMII_TXD2 */
+				 <STM32_PINMUX('H', 11, AF10)>, /* ETH_RGMII_TXD3 */
+				 <STM32_PINMUX('A', 13, AF10)>; /* ETH_RGMII_TX_CTL */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <3>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('H', 9, AF10)>, /* ETH_RGMII_CLK125 */
+				 <STM32_PINMUX('C', 0, AF12)>, /* ETH_RGMII_GTX_CLK */
+				 <STM32_PINMUX('A', 9, AF10)>, /* ETH_MDC */
+				 <STM32_PINMUX('A', 10, AF10)>; /* ETH_MDIO */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <3>;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('F', 1, AF10)>, /* ETH_RGMII_RXD0 */
+				 <STM32_PINMUX('C', 2, AF10)>, /* ETH_RGMII_RXD1 */
+				 <STM32_PINMUX('H', 12, AF10)>, /* ETH_RGMII_RXD2 */
+				 <STM32_PINMUX('H', 13, AF10)>, /* ETH_RGMII_RXD3 */
+				 <STM32_PINMUX('A', 11, AF10)>; /* ETH_RGMII_RX_CTL */
+			bias-disable;
+		};
+		pins4 {
+			pinmux = <STM32_PINMUX('A', 14, AF10)>; /* ETH_RGMII_RX_CLK */
+			bias-disable;
+		};
+	};
+
+	eth1_rgmii_sleep_pins_b: eth1-rgmii-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 15, ANALOG)>, /* ETH_RGMII_TXD0 */
+				 <STM32_PINMUX('C', 1, ANALOG)>, /* ETH_RGMII_TXD1 */
+				 <STM32_PINMUX('H', 10, ANALOG)>, /* ETH_RGMII_TXD2 */
+				 <STM32_PINMUX('H', 11, ANALOG)>, /* ETH_RGMII_TXD3 */
+				 <STM32_PINMUX('A', 13, ANALOG)>, /* ETH_RGMII_TX_CTL */
+				 <STM32_PINMUX('H', 9, ANALOG)>, /* ETH_RGMII_CLK125 */
+				 <STM32_PINMUX('C', 0, ANALOG)>, /* ETH_RGMII_GTX_CLK */
+				 <STM32_PINMUX('A', 9, ANALOG)>, /* ETH_MDC */
+				 <STM32_PINMUX('A', 10, ANALOG)>, /* ETH_MDIO */
+				 <STM32_PINMUX('F', 1, ANALOG)>, /* ETH_RGMII_RXD0 */
+				 <STM32_PINMUX('C', 2, ANALOG)>, /* ETH_RGMII_RXD1 */
+				 <STM32_PINMUX('H', 12, ANALOG)>, /* ETH_RGMII_RXD2 */
+				 <STM32_PINMUX('H', 13, ANALOG)>, /* ETH_RGMII_RXD3 */
+				 <STM32_PINMUX('A', 11, ANALOG)>, /* ETH_RGMII_RX_CTL */
+				 <STM32_PINMUX('A', 14, AF10)>; /* ETH_RGMII_RX_CLK */
+		};
+	};
+
 	eth2_rgmii_pins_a: eth2-rgmii-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('C', 7, AF10)>, /* ETH_RGMII_TXD0 */

-- 
2.25.1


