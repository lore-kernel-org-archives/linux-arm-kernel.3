Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD85C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 18:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F2n2o30Q/kVq/KYG6vVQ5aU24ZZC3guR83pv90r8Jms=; b=XVvy9kHc0tBf345TMbPKEgaP2X
	sS0AlmZ1xv+0F+bLivE6kUoX4FA8zBtraNEHLH/reTGgE3FS8JyjgDJPp4vHYc1TTlju8y3tR7SkB
	+Ly/UntcHwodnbpUuWsi4ypgydaY/GI0hHH9cWuelEy8R9MXqW+SmIhQGF25XBACki2wtsfCI6+IW
	UA1CsC+7+cRXjs9yzHYYplLwl+tYCKiGuadYQmMsYfSVGQFu8yO4Ju0kJzTdnj9CVBffSRXzVle0j
	3ZMP9jlexazkpKgQPlPZ5fgxHn5IQ/2KQJfLR5Qmov24RBG/ac1Ag0lLm9YhClcsRNcj41itjtjiY
	UumYbZzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFzTl-00000004Gi0-1UJV;
	Fri, 16 May 2025 18:08:17 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFzNh-00000004FKH-14xE;
	Fri, 16 May 2025 18:02:03 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout1.routing.net (Postfix) with ESMTP id 1C40840504;
	Fri, 16 May 2025 18:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1747418517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F2n2o30Q/kVq/KYG6vVQ5aU24ZZC3guR83pv90r8Jms=;
	b=oJwnIq5jNUeLmQxVWrKPXhVsAyly2zJgpt4ZdJged5/coNw1NBVVKaMARgKMGRZuRpo6z6
	dvFM+whBi0n3GdIRcnVXoVn2tj4IRUE9vU1kMougYxGMFcO6muTH6+CxtUJt3uxglVTtsL
	QElvXrSxNtQjZQY/U3oGcLhK7gaD8aA=
Received: from frank-u24.. (fttx-pool-157.180.226.139.bambit.de [157.180.226.139])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id C82BC1226D6;
	Fri, 16 May 2025 18:01:56 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 05/14] arm64: dts: mediatek: mt7988: move uart0 and spi1 pins to soc dtsi
Date: Fri, 16 May 2025 20:01:36 +0200
Message-ID: <20250516180147.10416-7-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250516180147.10416-1-linux@fw-web.de>
References: <20250516180147.10416-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_110201_441554_C64BB6B5 
X-CRM114-Status: GOOD (  11.31  )
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

From: Frank Wunderlich <frank-w@public-files.de>

In order to use uart0 or spi1 there is only 1 possible pin definition
so move them to soc dtsi to reuse them in other boards and avoiding
conflict if defined twice.

Suggested-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi  | 14 --------------
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi      | 18 ++++++++++++++++++
 2 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
index 37e541a98ee1..23b267cd47ac 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
@@ -328,13 +328,6 @@ mux {
 		};
 	};
 
-	uart0_pins: uart0-pins {
-		mux {
-			function = "uart";
-			groups =  "uart0";
-		};
-	};
-
 	snfi_pins: snfi-pins {
 		mux {
 			function = "flash";
@@ -356,13 +349,6 @@ mux {
 		};
 	};
 
-	spi1_pins: spi1-pins {
-		mux {
-			function = "spi";
-			groups = "spi1";
-		};
-	};
-
 	spi2_pins: spi2-pins {
 		mux {
 			function = "spi";
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 8c31935f4ab0..ab6fc09940b8 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -209,6 +209,20 @@ mux {
 						 "pcie_wake_n3_0";
 				};
 			};
+
+			spi1_pins: spi1-pins {
+				mux {
+					function = "spi";
+					groups = "spi1";
+				};
+			};
+
+			uart0_pins: uart0-pins {
+				mux {
+					function = "uart";
+					groups =  "uart0";
+				};
+			};
 		};
 
 		pwm: pwm@10048000 {
@@ -244,6 +258,8 @@ serial0: serial@11000000 {
 			clocks = <&topckgen CLK_TOP_UART_SEL>,
 				 <&infracfg CLK_INFRA_52M_UART0_CK>;
 			clock-names = "baud", "bus";
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart0_pins>;
 			status = "disabled";
 		};
 
@@ -338,6 +354,8 @@ spi1: spi@11008000 {
 				      "hclk";
 			#address-cells = <1>;
 			#size-cells = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi1_pins>;
 			status = "disabled";
 		};
 
-- 
2.43.0


