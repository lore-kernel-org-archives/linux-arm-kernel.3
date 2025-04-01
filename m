Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ECDCC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 16:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xibV9xv0u7t4eDfIQDKmyQEnbmwm/oWSPcnGjHqI2DI=; b=vP3ayhs2LDHOY0LIFlzJbRaVmX
	WQz21YmemRDuzAwYQEQpLdx0ojBSpC69sCIBN4VQI6qyMdMRCorgFxH25Ry+uF5z5rt+u7DOCu5Xq
	YR/Nuu8LbqPKamiFDx6GOrN9CdY2+mLMTtBmRII6xjSpI+mYJKNI59x+1yqcvAXEqCc85dOlugHoy
	3ygMpK2mmCf43tXkPFnOTQ9FwhFvS2WUWduGodlsFSjniHTxfyOREgEFWqZTMmlb9aT+Xf/U7mIt7
	dosWs3LqCefAnKTtK8lwzyAndo/cq3C7Sj+kKP1roxAqWTOcRiBViM/mv922B1kLia1kRxcFerXbp
	w5PCpHIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzeRJ-00000003s3m-33KS;
	Tue, 01 Apr 2025 16:26:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzeEy-00000003pSZ-2oR2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 16:13:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1743524008; x=1775060008;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u+o05G3JYoXGtiVP+5vJQeNhqzZa/lKtInVusu7G/70=;
  b=dhZAcyVweTdr7yhpva3682DlIoRv96Ew6CNr0PXCcqBq/pBrGyvWF2EK
   p2xA+wOoQNGku4dUvSYvLOBvpOSTD6KyEz4rP7Jk00kdacz6FG4FvI29A
   jYssG4eo4WOjRV1i4CRudpumxnVdI4YRblCVu+94/r9u+J8GcqN9Or83K
   RLDnBW1dQJ49/jRdT6+bvnd7qEGCrFyyOj9sYfeP5U/2FYFu02pHzBqdV
   zClgUjS1+aaFufSTNq8bCNgt7gFLmh3wEGYfU4elKaZmj7vld4FKifcP0
   p4+nynnYniv+OxWVlNrASU+WWfOJSGXgmKRyr++O0vdocY4QGRMCslKm6
   w==;
X-CSE-ConnectionGUID: ggLzNIpETriZ0zPViMY9HA==
X-CSE-MsgGUID: 6MZwuanKTDGxweZifBIEXg==
X-IronPort-AV: E=Sophos;i="6.14,293,1736838000"; 
   d="scan'208";a="39512782"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Apr 2025 09:13:23 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 1 Apr 2025 09:13:02 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 1 Apr 2025 09:13:02 -0700
From: <Ryan.Wanner@microchip.com>
To: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <onor+dt@kernel.org>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <nicolas.ferre@microchip.com>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Ryan Wanner
	<Ryan.Wanner@microchip.com>
Subject: [PATCH 6/6] ARM: dts: microchip: sama7d65_curiosity: add EEPROM
Date: Tue, 1 Apr 2025 09:13:22 -0700
Message-ID: <96ee6832d9b55acfae8d3560f625798025dfd89c.1743523114.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743523114.git.Ryan.Wanner@microchip.com>
References: <cover.1743523114.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_091328_791267_51BD1678 
X-CRM114-Status: GOOD (  10.01  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

If the MAC address is not fetched and loaded by U-boot then Linux will
have to load the address. The EEPROM and nvmem-layout to describe
EUI48 MAC address regions.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 .../dts/microchip/at91-sama7d65_curiosity.dts | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
index 81abc387112d..779412f04a11 100644
--- a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
@@ -234,6 +234,24 @@ regulator-state-mem {
 			};
 		};
 	};
+
+	eeprom0: eeprom@51 {
+		compatible = "microchip,24aa025e48";
+		reg = <0x51>;
+		size = <256>;
+		pagesize = <16>;
+		vcc-supply = <&vdd_3v3>;
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			eeprom0_eui48: eui48@fa {
+				reg = <0xfa 0x6>;
+			};
+		};
+	};
 };
 
 &main_xtal {
@@ -251,6 +269,9 @@ &pinctrl_gmac0_txck_default
 	phy-mode = "rgmii-id";
 	status = "okay";
 
+	nvmem-cells = <&eeprom0_eui48>;
+	nvmem-cell-names = "mac-address";
+
 	ethernet-phy@7 {
 		reg = <0x7>;
 		interrupt-parent = <&pioa>;
-- 
2.43.0


