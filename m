Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7BBC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 14:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t8U9fkTWPX3IGi5+rZVmJk0Nc5kpobD3uVQ0a6RST9o=; b=XEzZ2JjFFVlvnaBC3sKXjoOJO/
	gkOBVmh8HO1KcSv3gMuSh3mqRLeIfZnJdQJm45KVijsA+CbxC4QOL9B1G5UoRUudkFtXZQEFwaB1a
	nr50yr04KmQ3qEoxE3+rZu/gmhnHnC/DAJeOxAb8v4fepxFR1QDsHDtTxvEkJJWrUeMPJNAB8ALPd
	Q4K1mYso5sP3l5s9YS2btn+raD+Nu8rgSsa1ZCJOmm2h/evq2lRWmRBFZIbuXq3H4ZbTQbVA3sTuO
	kNN8WqH1A5xjQK/skrYCLHrA4P/5vtFZaO6xCn9gDu7cvk7b6L8xj4kgkwTLYqIIxTvgvRIdQQT5W
	xWmsUJiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thrMh-000000048rc-0IlO;
	Tue, 11 Feb 2025 14:35:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thrKo-000000048G0-2TJD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 14:33:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1739284438; x=1770820438;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gtNS9zeFbVWWS25/rs7jIWKTO8fa4yHcUJ9AMC8j2xQ=;
  b=L8mGDkbBpzF/dis5W2SeW3KetoCHvuuSFv75TqkARXB5fjHUVnp28/Pe
   yBHUWkzsHn8m7l8Rz/IPGlcJEGWXkVEsQ0WahnGHu4z1KLMKtxGgo6czT
   wfj+rER80gdTK5aXjjILYzwnIGCHq3JjV4yt1OXzWTpNvSNGTtgQIJj2j
   YFBuzAUySNbRbdcVkBRLygfOnS/CQCfp0Idz5Wj6nYfB171E6BA8j32bZ
   jqtqnmuGP+bNq5l0FfE2CVPGJ688Kxo1mSoSsz1xQGeYUeObuWEAknjnW
   A7At9y1Y8EJbiEZHHx+zgesnGDv6JUuyN4rwuo8fQq8t6ef/fnJ/muNDV
   g==;
X-CSE-ConnectionGUID: 35UA5pLrQAmrHtJwTcQ8OA==
X-CSE-MsgGUID: tahRwJItTf2T0EBCEQdO2A==
X-IronPort-AV: E=Sophos;i="6.13,277,1732604400"; 
   d="scan'208";a="37535218"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Feb 2025 07:33:56 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 11 Feb 2025 07:33:27 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 11 Feb 2025 07:33:25 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 1/2] ARM: dts: microchip: sama7d65: Add flexcom 10 node
Date: Tue, 11 Feb 2025 16:33:01 +0200
Message-ID: <20250211143302.4102-2-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211143302.4102-1-mihai.sain@microchip.com>
References: <20250211143302.4102-1-mihai.sain@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_063358_646656_197C04FF 
X-CRM114-Status: UNSURE (   9.32  )
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

Add flexcom 10 node and its i2c-controller subnode
for usage on the SAMA7D65 Curiosity board.

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index 854b30d15dcd..a38e04a86b6d 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -132,6 +132,27 @@ uart6: serial@200 {
 			};
 		};
 
+		flx10: flexcom@e2824000 {
+			compatible = "microchip,sama7d65-flexcom", "atmel,sama5d2-flexcom";
+			reg = <0xe2824000 0x200>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 44>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0xe2824000 0x800>;
+			status = "disabled";
+
+			i2c10: i2c@600 {
+				compatible = "microchip,sama7d65-i2c", "microchip,sam9x60-i2c";
+				reg = <0x600 0x200>;
+				interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 44>;
+				atmel,fifo-size = <32>;
+				status = "disabled";
+			};
+		};
+
 		gic: interrupt-controller@e8c11000 {
 			compatible = "arm,cortex-a7-gic";
 			reg = <0xe8c11000 0x1000>,
-- 
2.48.1


