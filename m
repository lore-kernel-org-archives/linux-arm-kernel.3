Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E1FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 09:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7oUEPB4rJ19ry2ffYzMEEFC7kNls3yAJStjl+lVDAw0=; b=Rudz/KZQjDO94eu6NgFEi7Hvrf
	a/x/+zhF0zEJNvz5iSzZYbqzWh5cDRi4he99ByY1KjCCIemihVDxSpoiZJQk1RzO/NxIzyQEuVtBz
	AN0D2H4+V41dE/45JJgWI/iOiWgWgnpN9FngDz1Ebl+CEIWHMls9FUDX3g8l5/Ea6utr360VH5OVp
	wzmRkhfwDCz2jT+1omrdGXcUm4Otr2UL743CXg33BNHE9QzMWbx58btYZj/aC4grEQvHdyTnyiU6D
	O5pCGx0A0yh0f5YgSIRoFfKxdIHQJry1TrkWgmBqYdeomwvTRbV6wPxcEmPNIvU2mtEiHSggnaHy7
	oMCfZZ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUkC-0000000GPp2-3XSU;
	Tue, 30 Jun 2026 09:27:04 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUk6-0000000GPer-01Tb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 09:26:59 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-4631679f204so239272f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 02:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1782811616; x=1783416416; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7oUEPB4rJ19ry2ffYzMEEFC7kNls3yAJStjl+lVDAw0=;
        b=gfP/Z+mhfHFlJWdRXBLHIoH21Q4eU/sa9OwErmohthQz5T2sPLRnsomoFYRcrjgBFq
         xa4MreFSRXapNSu0ajsO3qkCOByYIqz9vC1ZTdgp/sk5r/0FXo/+VJKgpUTaGwpAgGNd
         l4/AvJl5yi0C+h38TSt5K2eCyW7jWMZqqd+t8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811616; x=1783416416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7oUEPB4rJ19ry2ffYzMEEFC7kNls3yAJStjl+lVDAw0=;
        b=DBlwrBkHUUT/LRB97e1DyyXMveHZVp1pN1zBQOr0QE77MPRheWna4K+y708QY2mmu5
         epHWKWxg4Ho5yWQI1tNLHmfJrQ0VxMdwOq+FU9zhfsx9y5rjUsgGYc7Jsj2vJLTAs3VD
         FuYS9anxfPP4ldSkuNP+iuqTP7fyrdR3wJG5qYtWRWX+SOpwfI36rj/od2NZaXM4YPwN
         7/wqymi2AsbXcR0j49L1QyrxfR8NMuyPuyrUDsp1BipvYRZSd3vH+Izuchkb0Vxg72JZ
         mhfsZwbUXT6uGcfDoWq2Pm3VGtKoSiCnudoUXN6KBHgmIdGi7DOAnoZiPq9wkecrkR0q
         MU+g==
X-Forwarded-Encrypted: i=1; AHgh+RpbT4BIKpXuxLQM2eevxSw2r7vr7re24VIE4HtYUhonQuSz1D6IBbDgjfoQc4TBv2bknTTOmvUe0KwFmVnZGju9@lists.infradead.org
X-Gm-Message-State: AOJu0YxdxYQAqFtmYWMsmKGeHr3fUipbcT/AEUpF/4Tg6wY4r3q1Likz
	iX5bzsu2m5JELQyz1tMDS0j4s87tJ/BhQYZjdFd7d6w+3qjcyrEDP/NiH7VPrnGgnXo=
X-Gm-Gg: AfdE7cmqTw8DymFzGHtFMlasMayOocanpcjCmVkbGw92ceJKzn0iAX1jqZO/LwV1ZoQ
	uaP9B7EjFgqCiCjJiodxjUle08labrlHrl+gnNdqWp2sXehHVbllOfZUaOhy8eFm7S+5jXWdbg4
	s7dqmT1Pb+pY2fsmtVX04XAA/1EgBdJ+zsK9oM4ksPEq1BcfAR5geVmohSH9hF8RD0clI7aKuin
	5pyQc67rMB4VbTHXYD9INaRtzz2ATCGqaJ5A3wvqgq+sjsnnuI4XrCONIzHxTIjCB/A6lGi/yA6
	y3pyH56N0/Ta9Ee/MmYytmJPqF5KsJPMb30EXdsMz2A9o/R0AwkCEfAsAGh4TEAw4v/FDX4iIja
	adt9IrsVViBxbE903kVeNCdXTQBBJJ23NQE3gMY6mD2d1/6NaUcaf3zzRfLqlq5mW17yu3sUTRd
	QVcedSut3rwv49zmWG1fEzq+oVmdmNcf+kop3rPCqbGd37V0G5dZ93qIgIGP/dqD+2PDJMDMvNt
	2dpMFYOiUf3K3218J0auraHJ76qbX3jvdXzHl4Fo3pMIrOxtmAjAn5L2i1puIvn8mZFAMDCp2Aw
	AkDW6G86AuDd7DuovE7tTX35
X-Received: by 2002:a05:6000:400d:b0:474:8dbb:ccd0 with SMTP id ffacd0b85a97d-475dfa8909emr1360377f8f.19.1782811613890;
        Tue, 30 Jun 2026 02:26:53 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47567a6f0ddsm5669083f8f.37.2026.06.30.02.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:26:53 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	domenico.acri@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v6 11/16] arm64: dts: st: add sdmmc2 pins for stm32mp25
Date: Tue, 30 Jun 2026 11:24:40 +0200
Message-ID: <20260630092628.1695560-12-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
References: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_022658_066856_46B476D6 
X-CRM114-Status: GOOD (  10.63  )
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


