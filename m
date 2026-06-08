Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A698CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q8e2F85Jk42cknJBTKAisusI5iJFywDQWX2RRkkLus4=; b=qU4onjFa0JSE29yzBbXoQxiAlR
	OKJGljI6TPwJnLfOfZlH/+U9YfpKbHzrdXwGEX+iM2jjGz1R06P8LQXvVH3AIXhi7ghKf+lDeBc+P
	0BfOAScnAFF0xV3yvOX7yhm5Abmo47bYeaCT+Oe4jHZmK0oi1DXIThb5xX9x3JHw1hKqFqGO+K9Sx
	hXuMsngfQldPOJ7KE9dQLZ26prqtDXQhPMRLVuIjbgndesyiL10WTRoS0hQgeEkXX1B9oFeWOHxyG
	nGrsjgeWps+oA/kloOOz8hmjt+A5oWfLTrPts87qGHSx2zNmUrOPElurSfYGGq5aoMXSEQEBGvPV3
	g2YVsXzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWasQ-00000003jm6-2UYv;
	Mon, 08 Jun 2026 14:22:54 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWasM-00000003je0-2SKU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:22:51 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-68c5eecdd56so6480382a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780928569; x=1781533369; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q8e2F85Jk42cknJBTKAisusI5iJFywDQWX2RRkkLus4=;
        b=Qef5vBruaCpkmx0vwFJTVgYW4z56BB5nWILts5xGoPkLzOWHdHoyepUjItNValwGKB
         1e6fcta7tkaDBhbMR03iJ6Znamoh9lay0FnNBNHS477urLGUNaDpeQ0hYIxf49vgVHih
         KsnTR1JUaca3HqDb45+IAcMpj4XCXIYw+MZ/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780928569; x=1781533369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q8e2F85Jk42cknJBTKAisusI5iJFywDQWX2RRkkLus4=;
        b=hJJq+Twfvhd3bJ155u3uBW4kDbOOY9HpoTluPg5z3MXQe9DLipy3dHANlt82FYcKiR
         zbnXKtCTAVmsh29xL2ijO0NK/t5TM6nYGAOHS9B6RzzSRT0IQfKf+6uNEqTRYDaHHaIT
         jTUwp7Yrmj1sZmzyW2T8zvfX4x/f0wi80eDG+bnnNUgfS/Q0ZKbGIIlvrQw7a/u2GTzX
         XRltFK4s19LBYG0AzB/mGDmQwSIGLrMNbsV2L5kF6teKCGsE/RSrwKPmaHz7Ih8Pl0CB
         D4A0XVguhTfrCxlOxfk6IuZoZ/b37YKZIDo0enA2gl+GtEnr6plWGPlOy6CIwX+ReuHG
         8BEQ==
X-Forwarded-Encrypted: i=1; AFNElJ80A5qrMT+VCkIx3JPk1+mDoUxoD4ez14cNm7hBm3nMX6QcPrxsrwUNaaRreyfiCEN3cGjUMrdmoXrU39FGuEaf@lists.infradead.org
X-Gm-Message-State: AOJu0YyNnnH82pc+o+v7f0pw/j7SlhUIstscXBD2QCSav68D5c0bM2C5
	H9/lOJt8u9gltvAff/IcCQEg4frfxICRuq4g72+kq4uZwgkHnE1EsVRh3A/at/Zhobo=
X-Gm-Gg: Acq92OGRoxu4+5fLIW0hPBtTienrtS+n4G7biTCFNOyDXLjtnHxzb758uoPvrv53vhC
	b0FQJ/ZE22PwFlntT3f/v0hlyvyA0F6aFoShIfTbP9bohni7AiA1+6EgPneoTSaGlwmoTWtlLMy
	yk4r2RmDxFfTqY2CnaydQ+/Lnu2AmqNNymGQ1GgbVFPCL5VM4O8yLLtKxjLFN6COnBHhfge5355
	BMzzkaxBjxoEsBDN4ylx/ChNayA2n0tyzcpjEGQJZ5zl1W2UeI4LOA+59TaSwcoH4VuwhAtGtU8
	gAZemnMBOEHurJqx1VdCPxFBDgqj0BSD759mXljqUZzN14bdk4k7eQ5j++pKuSMm/5AVUqhs5Nn
	+XM5T81CGDAISH1aRncQVGB89saEQoZshAThPc5NrwktM/aRJ+b+9doJyeE8aEJiIeFHI3la8rF
	/0NDol9Bxo6hz/A0xyfVxLfBb32b7CA6tjkruLkNlYiNmGikORFazXtXwXXFKSQKnO9DFfvoD+g
	mXz9DbzlnZJIXQhftAacE0aMzUuNhpJlCTlGCOkj9nZkfH5YFpQCHzszn0=
X-Received: by 2002:a17:907:c486:b0:bee:e2a2:bddc with SMTP id a640c23a62f3a-bf373a0010amr730229666b.46.1780928568461;
        Mon, 08 Jun 2026 07:22:48 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307a35sm881847066b.52.2026.06.08.07.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:22:48 -0700 (PDT)
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
Subject: [PATCH v5 12/16] arm64: dts: st: add spi1 pins for stm32mp25
Date: Mon,  8 Jun 2026 16:20:29 +0200
Message-ID: <20260608142221.952245-13-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
References: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_072250_646359_B82D43DD 
X-CRM114-Status: GOOD (  10.27  )
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


