Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB20CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hXhCAfGf0Dhrwl1fYtWsjCC+QRGfLFtW6oj0NY7CcVg=; b=pNM2ZafgG1yV1E12kpzNxaH6BM
	X5ZugOk3sNcGbI6b10VKYtskrc3haGQHRh/PzWs+gYQ5nI/CgggX4AJnFX+rs8v8cj1m3cBpr4IyH
	/pPsCrtzf3y6Qs4mZ+gRPwVUX/RxsKRgYcOxzlEu4Flp8Iq8jKnijPJ7wU3DkeCUUvENNHiojUhY2
	v43YQOIdh/j50z+nL2qVn9NmILpvFbRdK/CopXBBteOdkrRAAG0I/5VhhCBOD6b74SaBMD7iaQhFo
	O2B919G3w8zmQ7uweV0TEdafyDbvyQ6h7pshsReEDI0HFDCPneomvpKnztkD1jHXXC0AforPDVPZ0
	Vgyv2EDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWasQ-00000003jlq-239e;
	Mon, 08 Jun 2026 14:22:54 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWasK-00000003jcM-2lO8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:22:51 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-691b0090cc5so2432667a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780928567; x=1781533367; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXhCAfGf0Dhrwl1fYtWsjCC+QRGfLFtW6oj0NY7CcVg=;
        b=bxLNi3z/X6OUwDB30wqxehyFy5uPiH6+05usdIYW4dwBmp3+RlfiWP/zZTb/vH5FFt
         ZV6zgBnzqvLtY219AK7f9N1a9DQ3h4CycTuK4jmHkW4tHADiSYNMfsilZffgkw4mhZGL
         /NWYA96p+AMISNojKH0L7Y+eqEQUBYdj3+S0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780928567; x=1781533367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hXhCAfGf0Dhrwl1fYtWsjCC+QRGfLFtW6oj0NY7CcVg=;
        b=MUCxyPMUNfGrSc180JfuJk7PLYkayHk4NA1SFk4j5HNEbHyNwbc8NkLk3liB+62gwn
         tay25UFmsH51sY9CJqE98Sa4pZwdr7Tadcek5W1prY+143CU693PBseuEAAUTrYMRX5C
         9nRN7dU8Sn5RX1BJ/0kRd5mOKAw+Q3EB36z2lAKDDUnVVVN2otQXduqzXkREG88YFmAe
         xaR6oezJx064xTWW2+E3VMcjR5xjuq34egHFlLAgY0VT+5RmtiBZB2d1s4gQ78a7ofIZ
         7E2sPhskxxq4PWDv7bmN/Pkf9I0tGLInAc/E1+qCF/JOtIN+lZVWXXjrkA/cpZe1IKU0
         0HDw==
X-Forwarded-Encrypted: i=1; AFNElJ9/51vg5/fvZMKQS0qWbOpCwZN8W30cManDKLd4zAJy5YV3yyy3X/gWzhVNIFIXHlNj/FfN+DnF/GyEjoItMbvl@lists.infradead.org
X-Gm-Message-State: AOJu0YxYWVvlJEHru2ikEffSdR56SXRINuKwzGid+M2qmnMFS843frRG
	UXbumkg7PAoxsyBSjYQ8afht+SWRn7H35H1I1qYYwps6C523xpz8G6jA9k+os9XUr/E=
X-Gm-Gg: Acq92OGQ55gB9eufEO1UwBC7fb8bCCF9k/d8kvxCKzTfggMjRo7rxwkxGkAm4iQ/6Qi
	bV40HnJt5kU6gkxPe8TK+86zOD4m9vqADBxCCMCSEWgsWLccUl+WQYYlG2mZoKyj1BcjNVEVdD6
	0e4J/MhzdOngVa+DWEOEcpIXwa1PTQnu4PFhLh4Xcgf5kKYZhEXACnr0IHExeKKn7WLhhkIECMQ
	/WVVg7aDPl1UdoViRwOMvDciDOA0/oGXPURIIH6NBNzyOHgLZauNzoBjTm4taHyLEfWrmwW1mt4
	uDbDjjVL5x5OPbS8QKRXFofgTgZNgSLTtMpLIL/y7b7Y3sBu0XN+tg5xaJj5KRdRE+3kmPeQ+i/
	h6/w8v1AZbsfNJwz3AZYd73GoVYGb4HgTKT9rcfLAIJASG67/PllqJjvlVlre8cpA03OtP+LZiR
	5mXS2+h0KOMW4z14oYL7m860EqI4KzDFt0r7n8CLyirxe92nw1w+QE7cSg74S0FlURAbcX6kVF+
	0cSIrUaQ1oEu2DVSuYjAojTlmAlVD1eC70ETtZTARjfG3DWTQ5OJEF0Qac=
X-Received: by 2002:a17:907:944e:b0:bed:a213:a89b with SMTP id a640c23a62f3a-bf372c31d24mr774338266b.37.1780928566673;
        Mon, 08 Jun 2026 07:22:46 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307a35sm881847066b.52.2026.06.08.07.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:22:46 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
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
Subject: [PATCH v5 11/16] arm64: dts: st: add sdmmc2 pins for stm32mp25
Date: Mon,  8 Jun 2026 16:20:28 +0200
Message-ID: <20260608142221.952245-12-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
References: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_072250_330681_B782D582 
X-CRM114-Status: GOOD (  10.65  )
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


