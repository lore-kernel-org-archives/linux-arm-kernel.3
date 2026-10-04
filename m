Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACFBCA5FF6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 14:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GPOuNv0irDtQ/vuxlu7cI6Ij9jweTS2TW7/WIglbMeA=; b=kuVtv/vxW9Q9tB3ys+9WznVBzl
	du3472gHPJKbQBPOIggReHsF/fXnonc0LZD2BGSoGzGLBQgdWoFDsyZnPguPPu+lsBvTsuRmSZOwI
	WU5vR/I4s1UXAIb4aDMy8nj+j+ZPQXf00F0ekdFfKDMwLrfllMZXvLttevCS+nfg+0dXQgsn0TNII
	JLSg0XcbuDtRup1qd+le052dX4y/Zz0f+r2Dah/cMl6znBXb7crxzN92JijT+nha/vWr7+eWPokRf
	cCQBuspnAXcOsgN+VWnDW+334+UTzWBYhwQuLFwe3uLvom48V1VtAiokWqKojoFiIrCNc7t/LfsFm
	0NEZvouQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDNOh-0000000EvTL-2BqG;
	Sun, 04 Oct 2026 14:41:03 +0000
Received: from mail-wm2-f13.google.com ([74.125.225.141])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDNOb-0000000EvHt-0ZRj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 14:40:58 +0000
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so3639145e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 07:40:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791124855; x=1791729655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GPOuNv0irDtQ/vuxlu7cI6Ij9jweTS2TW7/WIglbMeA=;
        b=wlFE6me1rI0pvgbqOYET+hmQdGzdirFTmfrqWhko3fpHYoySPsj3ThnCEV2+InT9N5
         b8hEAf/V3ceOE+KvdK1zWtj3Smh3wZNhlMA8I1KfwrDDw+PvUi5Q6XZZAMGXp+WbN3zG
         SGOErf7wigqfJIms/nkaop2j4tCM6wEVh/TYeD8GPWjShSOgsiuXTMJ5zqIzINbM8kCX
         1QYFTLDQwPDf4SHapo2Bu7uIOiUstcdLU6M9JyXwFki8FjAGNEOgn9kwS2R0277s4j5u
         RecamoaSVK1sie1aHavtI37c/3uOUJ7hHHiHlZZvQzkRqq0yCosKhDeYEh0B7QbDmonV
         ujuw==
X-Forwarded-Encrypted: i=1; AKwUvBxEHvlJwoC5dzcV2gi6TsUy9zJWJVYMLe2/R/qoPuIO4F2tLWxD3pVh2H2rskj2b925ttKZCjhPrCdPI7H1b4gF@lists.infradead.org
X-Gm-Message-State: AFuF++kooTVkEYymzvL+W4WKbBJAkrmlhqhfLQva1RBhLUu4N1ErpY56
	OvCEILWc/BD+hwWd8+KX21kJXLBVqXTvFqR8YdcnHnwgGWw1qVSPoRX7
X-Gm-Gg: AYBFou3x1yJgGXQ0+703O1ZuUUl2UggeF2XiiZSANzL0fJUpDIyRm7rLY4dtRqzG0FX
	owQSZpRt67Ayy8Ihzh8F76XdAz/offLa26Pb3q1Hq//oReN3jNq8QL9RkUNdHW6MVm5EKZMM5f2
	H7FhrsAsafsuKSY0z8YoNca/P+Be1kFeQLRByC2iuMO3x4luBhBz4M1oZe1aupmnEjnXd863sO9
	7WiqPMOFPY/NRJMtbNnYdX3y62qZNeqgC8Dty+vb2cn++JCDXzRgsqjZJxuJrV3vSTIFQ6t4Qgx
	yeoRMU6W/7um/bjwR+8LlYpGFsFea6GzQelbsZw23OErRPP2pA1VT1bHzPGGytRntV6AsO0f3PX
	5os8HTPprCNfqP/rEa6aoULRpPPRjQAVCLzkqx40lcq2MQ3tS4QVSWU9Eldavo+2DRFhNlnKvzf
	4YIfyn350QUMjnl4lOb90Uc2H1OtKCQiOsvTT5SsB/7veGtTbS0LkEAGvYk00sSx6JWLRLItqxR
	+JcNUKeHYKiiKj63ToPcemBlYA+K1Vc1A==
X-Received: by 2002:a05:600c:530e:b0:49e:63cc:6324 with SMTP id 5b1f17b1804b1-4a027534c46mr153735405e9.6.1791124855450;
        Sun, 04 Oct 2026 07:40:55 -0700 (PDT)
Received: from threads.localdomain ([84.68.183.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027740a2fsm298907685e9.13.2026.10.04.07.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 07:40:54 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RFC PATCH 6/6] arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
Date: Sun,  4 Oct 2026 15:40:46 +0100
Message-ID: <20261004144046.391444-7-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261004144046.391444-1-tanure@linux.com>
References: <20261004144046.391444-1-tanure@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_074057_420759_274F1125 
X-CRM114-Status: GOOD (  14.43  )
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

The board carries a Realtek RTL8211F gigabit PHY on the external
management bus, connected to the MAC over RGMII.

Enable the controller, hand it the ethernet pins and point it at the
PHY. The clock delays RGMII needs are supplied by the MAC rather than
the PHY: 2ns on transmit and 2000ps on receive, the values the vendor
kernel programs.

The PHY interrupt output is wired to GPIOH_6, so describe it and let
link changes be reported instead of polled. The PHY reset pin is driven
by an RC network on the board, not by the SoC, so there is no reset line
to describe.

Tested at 930Mbit/s sustained receive over a minute, with no MAC error
counters moving in either direction.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 0fa83362b417..5d0365ddde72 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -14,6 +14,7 @@ / {
 	compatible = "khadas,vim4", "amlogic,a311d2", "amlogic,t7";
 
 	aliases {
+		ethernet0 = &ethmac;
 		serial0 = &uart_a;
 		mmc0 = &sd_emmc_c;
 		mmc1 = &sd_emmc_b;
@@ -256,6 +257,33 @@ xtal: xtal-clk {
 	};
 };
 
+&ethmac {
+	status = "okay";
+	pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
+	pinctrl-names = "default";
+
+	/*
+	 * The RGMII clock delays are added by the MAC, so the PHY is
+	 * asked for the mode that adds none.
+	 */
+	phy-mode = "rgmii";
+	phy-handle = <&external_phy>;
+	amlogic,tx-delay-ns = <2>;
+	rx-internal-delay-ps = <2000>;
+};
+
+&ext_mdio {
+	external_phy: ethernet-phy@0 {
+		/* Realtek RTL8211FD-CG */
+		reg = <0>;
+		max-speed = <1000>;
+
+		interrupt-parent = <&gpio_intc>;
+		/* RGMII_INT on GPIOH_6 */
+		interrupts = <154 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
 &i2c_m_ao_a {
 	status = "okay";
 	pinctrl-0 = <&i2c0_ao_d_pins>;
-- 
2.56.0


