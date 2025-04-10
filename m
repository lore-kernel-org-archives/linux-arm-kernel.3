Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC80C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 11:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nKmaXQ3UFu+nSFWbeJhZzch8svzvXdM2x6AWlzQyZ1s=; b=3g64gMT6Vi+kASppI7diZBspsy
	e/xmp/zvpoWXsAhWYUZIpIdm9p68le3s/kQh3bRqg71++1LRwfuT28RCUH0qd/OkLYhYto2jlXBTA
	3Ea9JL4JEWu1NjXNm4mImr9UxFQZTrSM0aDPD78+8fxLObCIeg7nK5JrufH9NuNxZVhwqUUer5GPf
	CL7ItsOR5iaC3GV3eJsB5Ar15roRt68c2jQQL0nfbPDk5iTNfXBFBjq05aXzqRPQYsJaMeiRiyhRM
	uxb4Y6CaXtTYw405tTo2Lsoj3MppivpUeYRCV1z6qaA886Ir1Sye33tlBwIxXBiqNCpwpM7bpU2dI
	COpDf0Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2psz-0000000ABHI-2HER;
	Thu, 10 Apr 2025 11:15:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2noY-00000009rMk-2waJ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Apr 2025 09:03:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=nKmaXQ3UFu+nSFWbeJhZzch8svzvXdM2x6AWlzQyZ1s=; b=ZHrKmiozt9jY8sP7XulJW6q76X
	bJVs2pwqaXcA8jvY76Ug8w85MA3k6Sma0vPFH1oGgV0LP56Wbmk4RI3QM+P1dVb8qOBC6KUhIhlMT
	xFZAR5UnjwQn3wH/5bVxfJ6SgCb4hYP9s7ds6g4SqM32mdzKEciOq0vbwLU2PKgm/CPP+fXTIo279
	jFdmjVBJcJagiVk5eUag9HLWPLWEqYj7AA9T0j+wsQ0wRC++4dW8S5e2iImzOLWoyEaAEzlKISdqn
	t11LZeqi8n7tNVtpDICfc4NeCWNzwLxPaewfif0QexXD+9qiJx9oLrvqrNZvt/pMbuPQNWkLcTSCX
	T1yTSfRg==;
Received: from cpanel.siel.si ([46.19.9.99])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2noV-00000008mgB-14Un
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 09:03:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=nKmaXQ3UFu+nSFWbeJhZzch8svzvXdM2x6AWlzQyZ1s=; b=iLAOBNDKuCAZ4fSOF87pM46hHx
	AKlMfpAF8YT1TKll0/ZqfRUClyyn6faAxaNk+EakbsPEzxG9C9RXdIds4Uo+xlSq4EYN6Y+yWtlJn
	ztUG+Ln629m4+0T4zl3ZZ4TK0eCltdIiLMc2BLdfH3AysbTVoUrA6P6EHvfH+NwzU+bW0oIOnjlEI
	pPR0LPQ46CyY8Oc5TGr44AbErU06VT6oRIOIa05wv/kFfQDbMeYD5uefMB/xsnn440DgGw/F55d+p
	ebOMKPqdjM6if9EjPxVqjang77xfq5E8u+YbQi0S5Dmaw9BQwqbsA6LuYwnJXGmVpJKn5KFyumROK
	fKnKtLZA==;
Received: from [89.212.21.243] (port=41926 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u2noV-000Djj-2B;
	Thu, 10 Apr 2025 11:03:10 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 13/13] arm64: dts: freescale: imx93-phyboard-segin: Add EQOS Ethernet
Date: Thu, 10 Apr 2025 11:02:51 +0200
Message-Id: <20250410090251.1103979-14-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410090251.1103979-1-primoz.fiser@norik.com>
References: <20250410090251.1103979-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_100311_608888_99739742 
X-CRM114-Status: UNSURE (   6.25  )
X-CRM114-Notice: Please train this message.
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

Add support for the carrier-board Micrel KSZ8081 Ethernet PHY. This is a
10/100Mbit PHY connected to the EQOS interface and shares MDIO bus with
the Ethernet PHY located on the SoM (FEC interface).

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 .../dts/freescale/imx93-phyboard-segin.dts    | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
index 08574b146400..92f0cb6eca26 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
@@ -91,6 +91,28 @@ dailink_master: simple-audio-card,codec {
 	};
 };
 
+/* Ethernet */
+&eqos {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_eqos>;
+	phy-mode = "rmii";
+	phy-handle = <&ethphy2>;
+	assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
+				 <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
+	assigned-clock-rates = <100000000>, <50000000>;
+	status = "okay";
+};
+
+&mdio {
+	ethphy2: ethernet-phy@2 {
+		compatible = "ethernet-phy-id0022.1561";
+		reg = <2>;
+		clocks = <&clk IMX93_CLK_ENET_REF_PHY>;
+		clock-names = "rmii-ref";
+		micrel,led-mode = <1>;
+	};
+};
+
 /* CAN */
 &flexcan1 {
 	pinctrl-names = "default";
@@ -176,6 +198,19 @@ &usdhc2 {
 };
 
 &iomuxc {
+	pinctrl_eqos: eqosgrp {
+		fsl,pins = <
+			MX93_PAD_ENET1_TD2__CCM_ENET_QOS_CLOCK_GENERATE_REF_CLK	0x4000050e
+			MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0		0x57e
+			MX93_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1		0x57e
+			MX93_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0		0x50e
+			MX93_PAD_ENET1_TD1__ENET_QOS_RGMII_TD1		0x50e
+			MX93_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL	0x57e
+			MX93_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL	0x50e
+			MX93_PAD_ENET1_RXC__ENET_QOS_RX_ER		0x57e
+		>;
+	};
+
 	pinctrl_flexcan1: flexcan1grp {
 		fsl,pins = <
 			MX93_PAD_PDM_BIT_STREAM0__CAN1_RX	0x139e
-- 
2.34.1


