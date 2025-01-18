Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5547DC02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 11:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H28thG/7gsRTlTRsLj1+D2yQgfkc215Y94p59uZOiFE=; b=a3vIIz6VRrfaDsQc6Tj32kE+I5
	sS1YnHkws2STngC+VNxcgUj/ZUjjEv2zFSLMELbCzpD5H8FP6sVWebi+3dUag6fA1qD09UbVrHHKe
	7yfP/Xay6AHoWx1CW9GbyrbIwWcASAQNvDIKrUWHw96S72ezPNzPTo0DjmDayZ9oW3nbkUm2Iuj7b
	EgO3FZ6twGuUEofnOVEr11XRECm/hXxSovUFAK27L03LtG35hJfQQCJRFQYfsWFiaM33Rppa3WBDA
	F9Mh+R3vknh8LMF1oZaooH9sL6Xr4YtCy/f21eR9IxecvHEYTc/Gfk2RVXxK70Wub1okwV+zQOZNL
	rtrypnTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ6rS-00000002FsC-2OUR;
	Sat, 18 Jan 2025 11:19:30 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ6ma-00000002FLO-1Wyd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 11:14:29 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4YZvBG1sPYz9skP;
	Sat, 18 Jan 2025 12:14:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1737198854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H28thG/7gsRTlTRsLj1+D2yQgfkc215Y94p59uZOiFE=;
	b=kaTwn/fHEHGBYnp1dw9JHTRsIyTYMIgllPDUTKR5v1Q/9kLVqiVqIULOqP/kyIQTlrnkpS
	w9YOJ7wJP+wr4Wah6ig/lV87Cio2BZ0p3VngadKPCKPfRVL6t0cM8rrpcaT2WWsBwwUHiz
	QjGF6H1q0HFuP49AZ7IW90GO79YlNeHl8IbYWjw2S1mtIKWs8+g/m3iB0L5UZSQSDPKb70
	ebyN5Gz6Nt/ZesN5tkp2cgXJ1hYT8fmjOYp9xnERZSYv6fqFE565lVUOClsovKD7Xymf7D
	HkNqyiPMFqP6AdlMaD0qxqY/PuDZJDuAKDLsFZ4g6bsFOSEZqa7mdQbTvNvzFw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1737198852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H28thG/7gsRTlTRsLj1+D2yQgfkc215Y94p59uZOiFE=;
	b=l1BYxfzUMVMmMMk5Z+TPBG8SM5G4igr70Go53lMNYRxzqFSwJT5ERJ8keCpIpqjRJuHyVa
	k+DhWskXAMXknYlqYzy4dkxh05fljqdzcMiAA53BJu1A8hLrPw22PjetfVQMK+S0YAtESB
	stTG38EcR6rClow/9lj4HKMo2jZzRJrTyfIWPCuKHK+rt3RZ6dU4fdF3c2HtS6szDXLD7n
	TBwbFe+44Idvh9DLH2IcS9r97Ks6eIBB4q48AJuk+A53vkuwNf2vKwB+EvO5wgTNfMdBlg
	QX7onfkT87KeFC0nnYDKCXG9qVC/OsrTNJMV1dVnTwR75IL2HDHmsuyER/Z3sA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/5] arm64: dts: renesas: spider-ethernet: Access rswitch ports via phandles
Date: Sat, 18 Jan 2025 12:13:09 +0100
Message-ID: <20250118111344.361617-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250118111344.361617-1-marek.vasut+renesas@mailbox.org>
References: <20250118111344.361617-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 6idgtqos3ymrujijt3bpiaj3u8jemggr
X-MBO-RS-ID: f8d397af97b6b2107a8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_031428_563028_5FB86314 
X-CRM114-Status: UNSURE (   9.39  )
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

The r8a779f0.dtsi now contains labels for each rswitch port in
the form 'rswitchportN'. Use those to access rswitch ports and
slightly reduce the depth of this board DT. No functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../dts/renesas/r8a779f0-spider-ethernet.dtsi | 87 +++++++++----------
 1 file changed, 42 insertions(+), 45 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
index 5d38669ed1ec3..069f36ba53a4f 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
@@ -42,61 +42,58 @@ &rswitch {
 	pinctrl-0 = <&tsn0_pins>, <&tsn1_pins>, <&tsn2_pins>;
 	pinctrl-names = "default";
 	status = "okay";
+};
+
+&rswitchport0 {
+	reg = <0>;
+	phy-handle = <&u101>;
+	phy-mode = "sgmii";
+	phys = <&eth_serdes 0>;
 
-	ethernet-ports {
+	mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		port@0 {
-			reg = <0>;
-			phy-handle = <&u101>;
-			phy-mode = "sgmii";
-			phys = <&eth_serdes 0>;
-
-			mdio {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				u101: ethernet-phy@1 {
-					reg = <1>;
-					compatible = "ethernet-phy-ieee802.3-c45";
-					interrupts-extended = <&gpio3 10 IRQ_TYPE_LEVEL_LOW>;
-				};
-			};
-		};
-		port@1 {
+		u101: ethernet-phy@1 {
 			reg = <1>;
-			phy-handle = <&u201>;
-			phy-mode = "sgmii";
-			phys = <&eth_serdes 1>;
+			compatible = "ethernet-phy-ieee802.3-c45";
+			interrupts-extended = <&gpio3 10 IRQ_TYPE_LEVEL_LOW>;
+		};
+	};
+};
 
-			mdio {
-				#address-cells = <1>;
-				#size-cells = <0>;
+&rswitchport1 {
+	reg = <1>;
+	phy-handle = <&u201>;
+	phy-mode = "sgmii";
+	phys = <&eth_serdes 1>;
 
-				u201: ethernet-phy@2 {
-					reg = <2>;
-					compatible = "ethernet-phy-ieee802.3-c45";
-					interrupts-extended = <&gpio3 11 IRQ_TYPE_LEVEL_LOW>;
-				};
-			};
-		};
-		port@2 {
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		u201: ethernet-phy@2 {
 			reg = <2>;
-			phy-handle = <&u301>;
-			phy-mode = "sgmii";
-			phys = <&eth_serdes 2>;
+			compatible = "ethernet-phy-ieee802.3-c45";
+			interrupts-extended = <&gpio3 11 IRQ_TYPE_LEVEL_LOW>;
+		};
+	};
+};
+
+&rswitchport2 {
+	reg = <2>;
+	phy-handle = <&u301>;
+	phy-mode = "sgmii";
+	phys = <&eth_serdes 2>;
 
-			mdio {
-				#address-cells = <1>;
-				#size-cells = <0>;
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-				u301: ethernet-phy@3 {
-					reg = <3>;
-					compatible = "ethernet-phy-ieee802.3-c45";
-					interrupts-extended = <&gpio3 9 IRQ_TYPE_LEVEL_LOW>;
-				};
-			};
+		u301: ethernet-phy@3 {
+			reg = <3>;
+			compatible = "ethernet-phy-ieee802.3-c45";
+			interrupts-extended = <&gpio3 9 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
 };
-- 
2.45.2


