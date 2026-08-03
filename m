Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801CCC55175
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 07:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7oUEPB4rJ19ry2ffYzMEEFC7kNls3yAJStjl+lVDAw0=; b=AWMXIxHNsYuwMmkmErk+aMLSta
	pHKUCUyg0ZJtnzhcr2Ng2sdSgNuvCb9wpa/6IeEX+tq4HZm2hmr/sv9AnDBWLpE+/A+B/rrszh7kE
	ICdUcKnuJ5s4787ikypk+oCHZAUYjmnvTOrlZTPTrBCA8smOLbrU1kPOhHBitgCZNgYE3mSyZFogf
	7LThrBfZ/70/IfTDDvSf++hJWFfWkdwhjqYQhMeQwmTWapbVXI5D4SCvg3xFChXYCwV7RpQImyyQn
	K5pTYLucQGd/v5pPR15xTlfhQiuTQepc93WhogwqX0GWmXNlkVLV+p8zSqBOihIOn6QGzygFdZau6
	fP0Xqp9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnKJ-0000000GXg4-3z0q;
	Mon, 03 Aug 2026 07:43:11 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnKG-0000000GXao-42w1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 07:43:10 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-47f7027ca11so1868680f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 00:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1785742987; x=1786347787; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7oUEPB4rJ19ry2ffYzMEEFC7kNls3yAJStjl+lVDAw0=;
        b=BNzmRmF8//mK0NQZC5UgbO6fpKtDZALD+P6FDXl6xzLtT7DVbGshahQylQ1Rwh2Abl
         7M8Ver12XfZjFemIoeG2qbNUH4XL32UaAF9sdWE6Sh1kx4lovTOcqSc8y1RpuA0u6t3M
         350TpS+nCOrF3zAjBQQaIwpKDAa5lVr1kzBc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785742987; x=1786347787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7oUEPB4rJ19ry2ffYzMEEFC7kNls3yAJStjl+lVDAw0=;
        b=pWUZC6ZQnRMgfQeKGCjNfIzxzme3aLK9DZdylPo4HFlHvdTXPatHnMkJxWZ6z3KdgE
         BewlbjU8v8OSsXNAT3wAL6L82PJCG3XzYUUUZNPZ/KYvoDYJ4WO2sltupTcxD5W9cYHU
         JrbmL1VN8T/Q9NUn6I+96jNkPvx7DSlbp8bWiQPjCU56JRzZoefXMkmRob4zU/rax5i6
         kM1hKE3chgObmJtNlqYeeMFxNhV31IcLaUF1aUUBoVb+wtDu9GydVxe/ysulTMhf1pL0
         7GSABiGP/RY0jeYt+7qFpaoDk93lUuEXaioFVpBjTTaNudc0Jkvcnkio3fqzJW93QAlx
         YGeg==
X-Forwarded-Encrypted: i=1; AHgh+RrD/x6Q5UhuCZPPmJAn92ji3IswfVQXmmIfA1WHgXwZ02dsDGMz0LuFZCUr4N34LR69Tkx9+WJetWT72PCuO9Sv@lists.infradead.org
X-Gm-Message-State: AOJu0YyrzFNrEt4iX5XOlClo8i6arsIYok4N3GLXY38/jx7dwDmZCB8e
	pv31cPEXSwpozz2Og3oigls0laWjb8P33ZlVQPM9u8JEHfceM5FLWRo40Fb5+i6tHhw=
X-Gm-Gg: AR+sD122VNGh6E/JDqAkfRq4YzCuZfLGFKqdZmHPr86n7kZuENMh4g3tBXgShBnhWHS
	EQ0DhVuWeH7dYFMSElMDQUmwlBNvu+zi1XihDBpOiHMN4Dk7Z1O0U6nOU12h/frUYFM+FDWM8uo
	ssxIUNkZi9KkSBLNE1+XoNKuxiK2MhumGVGyyLc3BQyPWwY8rvpPBK762Y6Am7EJvdwBEUEt9lR
	TlBgEOALY8xo61ua0tMlamEoU8xAs/fY7/AIB5DqlvhPvJYp083gr28nfOA8bJXcsWraHZ3akoH
	Eb7s0VrtZ7PY2ahv7CKknxqJ/xfTQqnHiHw9uJ/HYZEIclnhYE29yBOHfhlsL9bcHRK33OJ79uN
	VFZ6ux3eVwzzvJzeq4thlMTZOdzFqAvqn72BwZrHmLZCmwFNVCJjbm83B4Wn/QETKIavuyB5MR0
	EWd4rCujjuQ7HRvRYnKO/ZXSKuVwdWdx7zgobxPU6f62K458oWs6NZj2EIUx9gKwTPzTmqfqjwP
	dPbPTOxlCrxZ8jE9EAHOZUR4KYqZpS6lBH8HPdAqGPcP/UPTXC3n/mf1A6yd5UWjFqZLGa/+EiU
	ZBghQYAN+gN/JQIBiHa1ZztDbVfK1ZGFzk2LHFPVxOhfiT0rBqbOjOntmPZBXeVg
X-Received: by 2002:a05:6000:2203:b0:47f:cb39:10c4 with SMTP id ffacd0b85a97d-47fd72c75d5mr19759957f8f.12.1785742987097;
        Mon, 03 Aug 2026 00:43:07 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm30370503f8f.7.2026.08.03.00.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:43:06 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RESEND PATCH v7 11/16] arm64: dts: st: add sdmmc2 pins for stm32mp25
Date: Mon,  3 Aug 2026 09:26:06 +0200
Message-ID: <20260803074224.3821911-12-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
References: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_004309_019275_9B2A3B1D 
X-CRM114-Status: GOOD (  11.04  )
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

Add the sdmmc2 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v5)

Changes in v5:
- Change SDMMC2_CK pin bias from pull-up to bias-disable to
  avoid signal integrity issues on the clock line. Suggested by Sashiko

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 002fbc724b9d..c816a6aece47 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -622,6 +622,86 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	sdmmc2_b4_pins_a: sdmmc2-b4-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 13, AF12)>, /* SDMMC2_D0 */
+				 <STM32_PINMUX('E', 11, AF12)>, /* SDMMC2_D1 */
+				 <STM32_PINMUX('E', 8, AF12)>, /* SDMMC2_D2 */
+				 <STM32_PINMUX('E', 12, AF12)>, /* SDMMC2_D3 */
+				 <STM32_PINMUX('E', 15, AF12)>; /* SDMMC2_CMD */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 14, AF12)>; /* SDMMC2_CK */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc2_b4_od_pins_a: sdmmc2-b4-od-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 13, AF12)>, /* SDMMC2_D0 */
+				 <STM32_PINMUX('E', 11, AF12)>, /* SDMMC2_D1 */
+				 <STM32_PINMUX('E', 8, AF12)>, /* SDMMC2_D2 */
+				 <STM32_PINMUX('E', 12, AF12)>; /* SDMMC2_D3 */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 14, AF12)>; /* SDMMC2_CK */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('E', 15, AF12)>; /* SDMMC2_CMD */
+			slew-rate = <1>;
+			drive-open-drain;
+			bias-pull-up;
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc2_b4_sleep_pins_a: sdmmc2-b4-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 13, ANALOG)>, /* SDMMC2_D0 */
+				 <STM32_PINMUX('E', 11, ANALOG)>, /* SDMMC2_D1 */
+				 <STM32_PINMUX('E', 8, ANALOG)>, /* SDMMC2_D2 */
+				 <STM32_PINMUX('E', 12, ANALOG)>, /* SDMMC2_D3 */
+				 <STM32_PINMUX('E', 14, ANALOG)>, /* SDMMC2_CK */
+				 <STM32_PINMUX('E', 15, ANALOG)>; /* SDMMC2_CMD */
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc2_d47_pins_a: sdmmc2-d47-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 10, AF12)>, /* SDMMC2_D4 */
+				 <STM32_PINMUX('E', 9, AF12)>, /* SDMMC2_D5 */
+				 <STM32_PINMUX('E', 6, AF12)>, /* SDMMC2_D6 */
+				 <STM32_PINMUX('E', 7, AF12)>; /* SDMMC2_D7 */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc2_d47_sleep_pins_a: sdmmc2-d47-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 10, ANALOG)>, /* SDMMC2_D4 */
+				 <STM32_PINMUX('E', 9, ANALOG)>, /* SDMMC2_D5 */
+				 <STM32_PINMUX('E', 6, ANALOG)>, /* SDMMC2_D6 */
+				 <STM32_PINMUX('E', 7, ANALOG)>; /* SDMMC2_D7 */
+		};
+	};
+
 	/omit-if-no-ref/
 	spi3_pins_a: spi3-0 {
 		pins1 {
-- 
2.43.0


