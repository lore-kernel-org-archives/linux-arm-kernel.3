Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EDA8CD6E74
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 06:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S0e8wESPhIuGnKBPbF3YDifoYbOSIP99q8OpeirAYTs=; b=3NMCy4nSpAkQoSMX8Ke22Kn3xo
	tNValNto+ehjHUY+osHWYfwawDt9pSDAd73mqFHC3tdPIAqTVrI1cC5TG9NlQZ4qE77gdbi4Uhrm4
	A2sSX5HKi70w4Qhi7H9ilXERGFVJRLf/xmTnXaJrjtDeClPyHwKm66xNFG0vLPjThwFgLOw1s/av/
	7fOtNw09sFooupayLab8siP8Mqx9ii5bKNYLrXL8zAEU8I2YnRw2UuAG16b8Uze9uMfblRrsLdAuf
	Dd88QfwY+FwKYXmHasaYAue9asGdVkNBBurOFAyPka/GBaK1k3/tDozIHUjSaDk1THrBbxdeGvUt7
	f9Zm6U9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVO3V-000000009bm-3FFD;
	Fri, 05 Jun 2026 06:29:21 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVO3T-000000009YS-2zIe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 06:29:20 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490aebf33e9so8106195e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 23:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780640958; x=1781245758; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0e8wESPhIuGnKBPbF3YDifoYbOSIP99q8OpeirAYTs=;
        b=oaThqm49QnlTenpnKxizBlaXrnhHTF9vsKaBQTFMALLq83DWF63YpIUozYiANe053H
         SGqEXa1S9xiGvFSTiKVh63wx6LCf0wUZTJt2EOEDHRxCrw05oHljcFENANFKv5QzKW4O
         ADEmPamPCUI0OwtVa30jGC/lQxuPuVb0dqRbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780640958; x=1781245758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S0e8wESPhIuGnKBPbF3YDifoYbOSIP99q8OpeirAYTs=;
        b=Bmzn9w6eKd8tbgjybjehT5UFR4JxHDv6wF3Dlv7IPpDBym1SuzZFbcfGi8IQntl6to
         ChevHU3sJlXd3H8F1r2hkt/wYDBGLyx+0Ue5POdUFTl9lQnAWkD9JhQVlKg28AzNjRVB
         WsikzvcgDD5pi7gIctDSItrbe3UUzG8wiWGiNyvO4IcsP2a4orblQYHNLOaFsmZojZVO
         L7Dxzo5vqC5RwBUY26O/kg8Who3oEqBFawxeEmndcpV9oaFX97DuxscmGrqb58beb085
         E7Ufts8qAcoUtZqfbBsYxHcpWv7rjuS1epq/f4G3rIxaajW6zok64TAOk7EoDItwLWRf
         n9uQ==
X-Forwarded-Encrypted: i=1; AFNElJ/oRkrWJ7HRsCtSLOtpq3IeZvmV+omRPv1P83rIDxPROmihDhGm6AMrF7sgyGArfVB2inedAqv8LTnDIIRCVxDG@lists.infradead.org
X-Gm-Message-State: AOJu0YxmSMkWK+vsQPoWyV5JjqTZdiD2UROmTBevI0KAiQgsIf70z3Zy
	L12NqzF6qKaEUwSxhl33NjhZag7/1QcWUIhd6n8LogdBaW2IFh6ZzzRiz/xR7IuW0Hs=
X-Gm-Gg: Acq92OGShNGWQN8L4QkaUNo0wqSujIpDeogD+MxqvKL0cM+egvjydGAA1gEUGg8pDWF
	mglG44VZ1N9Y5ZCFfi/qi8Injl0cppmzKoIWqTRB9XaeSIUoU9fvtZdLe0yUdwLUdVcSZHFwr0Z
	O4ELz4+ir6xSPNKN0s+XhM9OpUkEAe+J3h5HklV29OMDQ6Sk71+QN5MEcMrjCYEAXXoAA7CQzIR
	tAEyFapwoXDkRXEaGEYOKVYLnlzDo634sIGZV/aR3h3LgREg3l5Qdqy1U9t/6YFvlzuasE3V2gG
	tK7nvezvXDIcyDPL4v9xORg5af/adRLv/V+gnjeAlhzTGtAlmR7c+KLPQMcrmExDxXVmw9JJYv2
	cBNCzGdshYLILTUMhOE1rPKgLfiW8s8JSrNSFRplHzu/X9cqoCNAx5FPhnpH1ldXG+vhr51fJx5
	4EREVcLZQrTv3y94vJ54Ht7ZHGi5l+kJQEloweS6d3PBiqNolu1ghpWtSKtrsgD0UkPHbIhDY0I
	miwql/qWoh9vAlrl9v2DjAwlhfik3t/nYml5z60HWG23NVGjxhpn4RdeowC4qSEOOex0Lae5dUL
	4ArRGlchSBbtMYjXBATFq+Ixm28o5Gi7ImY=
X-Received: by 2002:a05:600c:a088:b0:48e:5fb8:f80f with SMTP id 5b1f17b1804b1-490c25f9100mr28298805e9.24.1780640957790;
        Thu, 04 Jun 2026 23:29:17 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm23022648f8f.19.2026.06.04.23.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 23:29:17 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v3 06/14] arm64: dts: st: add can1 pins for stm32mp25
Date: Fri,  5 Jun 2026 08:27:34 +0200
Message-ID: <20260605062900.368376-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
References: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_232919_764228_40706F78 
X-CRM114-Status: UNSURE (   9.99  )
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

Add the can1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 05bd07a0a561..4be01a6574c7 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -331,6 +331,28 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	m_can1_pins_a: m-can1-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 9, AF7)>; /* CAN1_TX */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 11, AF7)>; /* CAN1_RX */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	m_can1_sleep_pins_a: m-can1-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 9, ANALOG)>, /* CAN1_TX */
+				 <STM32_PINMUX('B', 11, ANALOG)>; /* CAN1_RX */
+		};
+	};
+
 	/omit-if-no-ref/
 	ospi_port1_clk_pins_a: ospi-port1-clk-0 {
 		pins {
-- 
2.43.0


