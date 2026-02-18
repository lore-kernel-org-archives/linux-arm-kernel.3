Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239ADE9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 13:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MoTbc/oD0OyhhEGqv2giwAcUy2p9JS4wITvmke3ZLCc=; b=B/0YDVLqO8DFsPGdXrgNsuJsvx
	D3MMhox+3abEE5DnjCTJT94zBKlkqIIpfSz/omFZzG8X63SBFzBlthTwd8oix4HleC0IFIBGUjOhq
	wnTe8/2zz2aO7BptS7FDqXY7fi8EjTnl+yL7qVpnfQQ22Jbj/CqKDO/AMDpUvgCDJGF4JNEICX9cX
	EIyo5U/jvU7Y3sk3+M+obiHesQRuXtcR5FkRkIELW8G/10j85OqLTb7WXZzpu9vP1k6noVTLViA7P
	RLbDuHVIYsOT1k+GLvuhKaLxTCNnrOewfgDMAik61IynJauDKFwhXfEKEUSgosbz6M8RJqBQriHVy
	0D+Glktg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshXR-00000009rNk-2IxL;
	Wed, 18 Feb 2026 13:24:21 +0000
Received: from mx-relay99-hz2.antispameurope.com ([94.100.136.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshXI-00000009rE7-3GLg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 13:24:15 +0000
ARC-Authentication-Results: i=1; mx-gate99-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=MoTbc/oD0OyhhEGqv2giwAcUy2p9JS4wITvmke3ZLCc=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771421042;
 b=bB0R3aSOudSkPu3YnGPyIBvPeACbiVBzRxPstWlwYWQGG/ys2ABRh8PLEIDwQaPvPYPq0li7
 zdpnB88cX94RmkDRNW796g/Sx6rJadPaA2QL+cdzA1RRqQzqWbc4H8ovrPYfvgYnf/CqUPd13Mo
 kpRslQlRHidwyCD7AO12Rn7ZPjhEthmKSi53JXmlec0EX5EhariftKDN9PugXk1MSSDQFLsuYkU
 3YbsRsOTpVp0uiGhKfK/xfD018oFBEfgIdGx3LrqjDEa7ehLHB7w7XuurCtCs9/AelVggBfGTQt
 Inb866N0VnIboMCa/qAuBrdj+Qe/nzleKBGOl81WhPiYw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771421042;
 b=DYniTLjmj1BTPY3J2AJdgtBzxYbB1+yuopShopNS7wdoqBU3M4nX0mHLV/UTfxuh/nSaInkP
 xO8somBBiRbe4wy6AQ1F3rm0HnUIMDdlU9jgeYabPEnt9o9a/WFY0Parbrw/bBhsjG2cEOr0/x3
 aTav3Msx2Wdo3ae0/oYOV8YvxavZAjDA22rWc9M9NAMVUBVUfj7ZdznzJYEmG11MlqpP/lTDC99
 HlanlZ0HPy0bYcz5j8++YvyVn8POhBPycJpSyro+01LHxmTSuG7j3k1Wn1XRif+b6jbS38maxVJ
 LPSZOaW6nfi/q4dotfnqVp1wVZIqlPvIbgZRzQQlXD+vA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay99-hz2.antispameurope.com;
 Wed, 18 Feb 2026 14:24:02 +0100
Received: from merchelm-W2.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id D5AFB220714;
	Wed, 18 Feb 2026 14:23:44 +0100 (CET)
From: Max Merchel <Max.Merchel@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Max Merchel <Max.Merchel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] ARM: dts: mba6ulx: add boot phase properties
Date: Wed, 18 Feb 2026 14:23:36 +0100
Message-ID: <20260218132339.32157-4-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218132339.32157-1-Max.Merchel@ew.tq-group.com>
References: <20260218132339.32157-1-Max.Merchel@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: max.merchel@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: max.merchel@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay99-hz2.antispameurope.com with 4fGHJx4N4Fz28mW9
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: bfaa624291ef2e7c54e646dbcffdbd37
X-cloud-security: scantime:2.078
DKIM-Signature: a=rsa-sha256;
 bh=MoTbc/oD0OyhhEGqv2giwAcUy2p9JS4wITvmke3ZLCc=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771421041; v=1;
 b=fRq4RY+gChcZsaJcaSSbiu2JKTKMA2s/IUAR0JoNJPj84z8NUsN7e3jif0fTiw3DPG/cG3PO
 gcF/M4j3bKU+iBEpyzXFLWfnCEdm86ZOvj9DTpY6gG7pIkSRn8A1NCuAv7barGZhG20jeeKpnCf
 6TDXD4ZDHvRhrPIHQCqGNYZ3ZsEbMEodM4BiJ/CdZC3vPJq2cIgATOXdQ1Id0+jP4+e6LlDV1fB
 L7WNWjFgqwlEWxm/pEcQ7AHikl36EJTODYKM0DOcnA0g482M0gGLMWFzqyMe0J4YRUK0P2oQMfX
 81M0fm5GwS1yuampUHAmfNnSTnhj/AWXEfUGXRIVdPKbA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_052413_532351_FB6B2408 
X-CRM114-Status: GOOD (  11.15  )
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

Add boot phase properties to MBa6ULx device tree.

Signed-off-by: Max Merchel <Max.Merchel@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi b/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
index 65fde4f52587..1fda60d62ffe 100644
--- a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
@@ -95,6 +95,7 @@ reg_mba6ul_3v3: regulator-mba6ul-3v3 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
+		bootph-pre-ram;
 	};
 
 	reg_mba6ul_5v0: regulator-mba6ul-5v0 {
@@ -336,6 +337,7 @@ &sai1 {
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
@@ -392,6 +394,7 @@ &usdhc1 {
 	no-1-8-v;
 	no-mmc;
 	no-sdio;
+	bootph-all;
 	status = "okay";
 };
 
@@ -399,6 +402,7 @@ &wdog1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_wdog1>;
 	fsl,ext-reset-output;
+	bootph-pre-ram;
 	status = "okay";
 };
 
@@ -494,6 +498,7 @@ pinctrl_uart1: uart1grp {
 			MX6UL_PAD_UART1_TX_DATA__UART1_DCE_TX	0x1b0b1
 			MX6UL_PAD_UART1_RX_DATA__UART1_DCE_RX	0x1b0b1
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_uart3: uart3grp {
@@ -542,6 +547,7 @@ MX6UL_PAD_UART1_CTS_B__GPIO1_IO18	0x0001b099
 			/* CD */
 			MX6UL_PAD_UART1_RTS_B__GPIO1_IO19	0x0001b099
 		>;
+		bootph-all;
 	};
 
 	pinctrl_usdhc1_100mhz: usdhc1-100mhz-grp {
-- 
2.43.0


