Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B708BC55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 07:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q8e2F85Jk42cknJBTKAisusI5iJFywDQWX2RRkkLus4=; b=bghsFZVXvzlnwmkkSfxVLcYoLa
	MG4s8xW+R7YlRWSayyZAqXdQ95pv8nx4LVrC66W73iig4jdNWY8FpsFxJ9Zvh5vmcl0xMJhDpp7ZP
	+IAhXTBXxj1QR5S4wwQoXeBTfMrYV9I4C7YC9MCbSYynhR+rgasWO65YklpvImHDUyjH2WM3u7Csi
	Ah4hV1Ev2op3cmLgkCMGOPVcFLckLMmzzJHW27AB4WSjkr+F6dlBOYIt9++dV7JOgBMjkm1QTTLWv
	BwzuazmTvTMBLEVrfJ5Y+3ZBNtEkEYruIPTmEUB/EVPF46P7NnxKppBxTSsrbJ40DrgfMysiTFhFH
	TqLtC3UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnKK-0000000GXgN-0NzB;
	Mon, 03 Aug 2026 07:43:12 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnKI-0000000GXc0-0zsF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 07:43:11 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-47fd4ee0b01so1861225f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 00:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1785742989; x=1786347789; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q8e2F85Jk42cknJBTKAisusI5iJFywDQWX2RRkkLus4=;
        b=D9gTwz3rb4MZIRK47c4gUBiKBTCp8Y5GAjXZXkxsU8dfibf3bOE9GZNF3oiKTInjKu
         Fy2ghxBL9yMIkd3WJGZtzz0UIsHKPKjTjed6EAD8tP6wUZE/YmFiFT7p15Xr2QwLd5yT
         CyOQbPRjPI8V6k68myFamYTPafKEpZdfek1PU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785742989; x=1786347789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q8e2F85Jk42cknJBTKAisusI5iJFywDQWX2RRkkLus4=;
        b=Vgw3tQH3qLICx4ao46aJljYd/JJdxRgZTWOn2c48mBqy3xvKm61LguRVB2mGl/MLMH
         fYQKw8sbpvi4i6sUxxGyWZaaEP+TL5VX+PFDpubQc3P6Tntunrn2AymxmaD2ZrR2mzwA
         40iuh5FRzSNRkY6DtyplLGlK0Ihdb2B2OPz0dBl7pmY2HvWtR8DCmZVQ4M29XMEP3K+v
         tCkV/LjonnFDrCidkCxKXc29lovvtQFlAC+GPBiGmCJlWRfzppsZa9GB61deTmNpVMXV
         4cOPsfu+baoPWUSVgHw7JPwfmclEO2TA87UBfcTh8w/sJVDZ9THJda9+7w6ooQXg2u/I
         JN8w==
X-Forwarded-Encrypted: i=1; AHgh+RrPL7M5fqXbwFpIX+1BnD4Xsnyhmww3x6zmKRf8ieoBhK/C54pkFyI5ARGTcESzWwojuJfutPStFFTD8X4Q9rLG@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3xnfsthCvKJ7P9oDvBBnS5x1VE4x1PHsjzuPhVKOarBCAqz+H
	/ZbVYVUGlASaFoXVhyjgVZiX7uGlMArVS3xwaamh7LLU4u9DDuHcYAKuZy50mJljNMq22CYWAu8
	zq/Ji
X-Gm-Gg: AR+sD10P+MP+fd1csoCr9zKoqBe+MiM+gSij+ZFapxO48Io5pC0K6EfECgKT3ifujeU
	WfyCt7IO1MGIn/5Hs9h+fONA2jcGu+4B43qkhcV+6nMNdGAkymM9+M8+Jxk4m7jWeB0pHU+ZNw+
	tClXVn/gHbzG4l85+f9OvKEvcjQax2hdb+Zr5nJCjkIPLoIgOBQzNjFzdyfphEItgcxe5JHCBEy
	10U6gDhTFZ3mQ+dYKa0O8o2vIgNshhArbyJMerIrkbP+KwadUQU19YlTvaOH+3+f6wMPBdrfTeF
	hjgUtttDt9+4b5cJgfDtrYpf6xNz+neqd/C37nlvXHKql4zIWF3A2miRw2lHTcVZxA0TIboJwrW
	wM5IjX+OjEOJE/ma4eSZuAYqta2XlWOkHy7cjboS71RFV/+FruKvf7ClGAKtCkbf3IkYO6gD0jF
	qTEliyVsMj/9bB7KJG6LU+S+DPinstiV6gE/1EpnwTKdVrAFC/veMqfsi9piLMJjVY86S+c0lOV
	VSISZit4vCil/d43bGe7mLfxO2py6UJLBrRID6ZJgtZniEnSQEQE3QaQZ1UhGsT7Sf6OAgKDJh+
	6WWDs04ZKnhMJrcgfLK9eUtXUsQVUyn03LbF/nsadQKzQN/RHOW1RoNOw4RLBkOk
X-Received: by 2002:a05:6000:46c4:b0:47f:6f6a:6a7f with SMTP id ffacd0b85a97d-47fd72ab2f2mr17824879f8f.8.1785742988685;
        Mon, 03 Aug 2026 00:43:08 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm30370503f8f.7.2026.08.03.00.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:43:08 -0700 (PDT)
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
Subject: [RESEND PATCH v7 12/16] arm64: dts: st: add spi1 pins for stm32mp25
Date: Mon,  3 Aug 2026 09:26:07 +0200
Message-ID: <20260803074224.3821911-13-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
References: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_004310_289755_7FAD859B 
X-CRM114-Status: GOOD (  10.74  )
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

Add the spi1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index c816a6aece47..4e570e2e5157 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -702,6 +702,30 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	spi1_pins_a: spi1-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 6, AF3)>, /* SPI1_SCK */
+				 <STM32_PINMUX('I', 5, AF3)>; /* SPI1_MOSI */
+			drive-push-pull;
+			bias-disable;
+			slew-rate = <1>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('F', 12, AF3)>; /* SPI1_MISO */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	spi1_sleep_pins_a: spi1-sleep-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 6, ANALOG)>, /* SPI1_SCK */
+				 <STM32_PINMUX('I', 5, ANALOG)>, /* SPI1_MOSI */
+				 <STM32_PINMUX('F', 12, ANALOG)>; /* SPI1_MISO */
+		};
+	};
+
 	/omit-if-no-ref/
 	spi3_pins_a: spi3-0 {
 		pins1 {
-- 
2.43.0


