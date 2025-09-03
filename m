Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5512CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 10:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kr0qsv6QevC8O4Vu08rbDlOZZqjwFJtz5rUmJDaOsGA=; b=ndogJeWzV2l5wNBPPdbrgssff8
	mXHe6/11Pd3ProSScONqV/4jWkWZ1a0es3E5sNHPyAsEuFWS20Sb590rAjhMcA3cc7UazRaDrOkmy
	wrkhXANmmejimXA5b1p8+TbW3VySwyob4XvIMECIaOHizRnFhK9VqI2GSyat41HSBdmZ6bJudIRcJ
	hRIDl1Uqw/7TSQ3/YPG2BAtESr9cQI4V2d03lj5ncldbod01CM5b+eTx8jjvqzXIqfjryzGclVRVB
	/JXg+h7fbZuyJphwSPRKBeCLZwVkNVv1TOqrI8Ug237VsGavDwiQWSZOOvqUnyssvp7we25urhY8u
	/J+KrVXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utlC3-00000006A5h-3mpU;
	Wed, 03 Sep 2025 10:58:23 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utkCL-000000060KZ-0ukz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 09:54:38 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5839lVCA011971;
	Wed, 3 Sep 2025 11:54:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	kr0qsv6QevC8O4Vu08rbDlOZZqjwFJtz5rUmJDaOsGA=; b=VsTEhjG5tkbM2PwB
	KtYjW8Q3Q9BQO01q/r8PVnPvPB8d2Z/Tw11jzAwha/vvs4qfXt19SZYyujqrq2yR
	V7uXAKJgqYcR3xvbXs8oHh1ia4afBlBDrkYcqzKnwNaHmWWvAHwqHpIqo6FeFsmz
	qxcubyAu+FlXGNiwai1oqjRp5ZxNfGSKkktT25I9veheKPhY+NBM7JYCRGcRppUr
	75GCk3URBkQL/A8S4ujbwuIbTI8KuFtuehHM6sxnFfVH6H8VYBhY5QVkg70KGirA
	zGh1H5YwI+5vbyb9RPB5bhjUBhiPAq6eY1XiAM37Bb53PF9xlTznj2VO4CaWuSGf
	KlBcRA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48ur6fqnu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 11:54:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 06B6B4004B;
	Wed,  3 Sep 2025 11:53:44 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 59CE52B5137;
	Wed,  3 Sep 2025 11:53:14 +0200 (CEST)
Received: from localhost (10.48.87.141) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 3 Sep
 2025 11:53:14 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Wed, 3 Sep 2025 11:53:04 +0200
Subject: [PATCH 3/4] arm64: dts: st: enable ethernet1 controller on
 stm32mp257f-ev1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250903-mp2_ethernet-v1-3-4105b0ad2344@foss.st.com>
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
X-CRM114-CacheID: sfid-20250903_025437_542149_6194104F 
X-CRM114-Status: GOOD (  11.74  )
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

ethernet1 controller is connected to the RTL8211F-CG Realtek PHY in
RGMII mode. It can either be used as a standalone Ethernet controller
or be connected to the internal TSN capable switch. For this board,
keep the standalone setup. Also enable this peripheral on the
stm32mp257f-ev1 board.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 4ff334563599b46e987474076798337e75e16ef7..725846dfaac925646f43db542ed803dd7b9d85dd 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -19,6 +19,7 @@ / {
 
 	aliases {
 		ethernet0 = &ethernet2;
+		ethernet1 = &ethernet1;
 		serial0 = &usart2;
 		serial1 = &usart6;
 	};
@@ -133,6 +134,30 @@ dcmipp_0: endpoint {
 	};
 };
 
+&ethernet1 {
+	pinctrl-0 = <&eth1_rgmii_pins_a &eth1_mdio_pins_a>;
+	pinctrl-1 = <&eth1_rgmii_sleep_pins_a &eth1_mdio_sleep_pins_a>;
+	pinctrl-names = "default", "sleep";
+	max-speed = <1000>;
+	phy-handle = <&phy1_eth1>;
+	phy-mode = "rgmii-id";
+	st,ext-phyclk;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+		phy1_eth1: ethernet-phy@4 {
+			compatible = "ethernet-phy-id001c.c916";
+			reset-gpios =  <&gpioj 9 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <80000>;
+			reg = <4>;
+		};
+	};
+};
+
 &ethernet2 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&eth2_rgmii_pins_a>;

-- 
2.25.1


