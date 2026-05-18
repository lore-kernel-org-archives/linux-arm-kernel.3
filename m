Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFA5CD4F58
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 14:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M+2fG1k6iz5J9vZ3VHDwkeyqO1iLOvyLGZ3RtktWg+M=; b=bQVA0NkyiC/nFvBZIxUTQFDHh9
	wt6K+xA5mKwNhMFjvGnp5zA3U7xXHrryhh8m/9wezaIGmlsQzwr+I1E0+ri/8KvlqYt37xlHYe5WA
	ZK+k+/5zFOa1y1/3ga1Vz9PS8MuOgQlusU0OLYDm6e8JofTgTRkEjspeYPQlS4tMYNUueQ20p80Er
	gbIHm5oaYZ7C2svKIAOht1KTUfVKhwD9iDKmZ/TgYQ53UhhPFsbqoND34yMazlG9sitDFTcc3EN5I
	XRgYDz0wAHaErbEyCbTetu09PygsDTW8AOJ/y9QKvQkwwaBY5TiOkRiki51L144n52TNDIiQnmbAb
	uHjLqByQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOz16-0000000FzL7-0wDx;
	Mon, 18 May 2026 14:32:24 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOz12-0000000FzFd-0tb1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 14:32:21 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-45d96d21e82so1372495f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 07:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1779114738; x=1779719538; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+2fG1k6iz5J9vZ3VHDwkeyqO1iLOvyLGZ3RtktWg+M=;
        b=Fa5kmipfBqXdSANcJUOMSAJJtXkOSkN2xwEPjY4/CNipbSC0tmOlCWA/8etxF6D/tc
         oowaIHY5QbhiH3N/Q7+ClBSYvR91I7jGdeulcxDkaaPKX7Yf9IOEqiSphTQLnN3zlufN
         ehVS9x+qS5Ycl2sj+1au6TM5LC5Vv0t6WQl3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114738; x=1779719538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M+2fG1k6iz5J9vZ3VHDwkeyqO1iLOvyLGZ3RtktWg+M=;
        b=Vrtzw7vj4Zqn3J3atsZgVvcZa2h1q624oTmoYN99e8zbj8cXhZJ4trl1M8Ichr6wFk
         K8wdUlyzwPNaSdE4n8C7MyM5V6rbDq0+468sDgVhP7CZp4xLSTMydz7x34P8xg0U4moq
         JHYYIkZsNglxRUoGeVcU8bb9gCGVor74vLpPLjK/brMfEZSpesyqZ7lxKChaEpc6kYFU
         qPJh3Tikgs7qgwHTgNYXbHo5SO2ScTQp0UziQKtDGYEDutMhBIB6nkVubco7pN0M8GZn
         6wcm2WqoMLTKENF+7aNU+DLtOWVebpx7wD9hmgXSFySbMiiuQN4QhldgmK+u6HjTMhn1
         pfLg==
X-Forwarded-Encrypted: i=1; AFNElJ8HrqZuqZXnkWMTvOcaJqlYuiZ5YxaIPwF617NMDbGfquQnQmTKtGvdDCFGXxzr8Zuuwjo+EOLeioCJmatfYGzr@lists.infradead.org
X-Gm-Message-State: AOJu0YxP7SgOF5EgoZGRZC9HiawmHFkggyXT5O7pqfaLM12u/rGzyv6G
	P2N0pTyRyZz+FVjx5hANZpyT4kOJXGdLlPqaFQ6DrB5Xd9ycivtwEzcucU9wbsc5fTw=
X-Gm-Gg: Acq92OGXZz5tUaOhFVB2CN1BE5eM/1B0hkqMTidHBbul6B8/F0bJRaDVcV9sC0H4Ux4
	M0YeSykkhc3GDbR83C/V1KcGvkM4n72XYJ0YB8SPEvEbgGx4Squ8BuN3RGF7Gg13Biw0ZJw5CXA
	MWKp6MHJoB6wbl1QaE1RNNtVNGsL6NEM0UMj687Jk09dp6jfYYht2eFFhUJuCpUruM6N5V4JcKc
	g59Tj29eXAGfCyVORO2/f9uzMwzBNg/K6D6Q7W4dvCBudrFDXtSdKnJEPK0Zd13A8iHEFaKL8IA
	XjjuckkPYrHuCGrYXIzWJnCTeQ3P+VubGxuFzvmEsiTKwk+gihePKxUYYPGPtd4U3IsZejfDQ/h
	4bPYFDf9bNPtDwUWxUA31E2GOHQ2KYx5GijW+vxEODOKtKOnYUgWAUyEteDFMJ1BQ7t0H+rJnRp
	OyKe8XWmHiThFBVPIaRI+a72fWxSKGHuc5+0cZ2iewh4L4MhR+6lRBI52KPW1WIbqHg1+7DrrsO
	3MRDIUf6tIFK+TJRqhoyWOC4oHqwIHVxQzIvP0Zu3SznE0G
X-Received: by 2002:a05:6000:2902:b0:43e:a81d:c475 with SMTP id ffacd0b85a97d-45e5c58fbf9mr24055470f8f.6.1779114738301;
        Mon, 18 May 2026 07:32:18 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm39564572f8f.23.2026.05.18.07.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:32:17 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
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
Subject: [PATCH 10/15] arm64: dts: st: add spi1 pins for stm32mp25
Date: Mon, 18 May 2026 16:31:25 +0200
Message-ID: <20260518143150.3138712-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
References: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_073220_768126_3544BD89 
X-CRM114-Status: GOOD (  10.85  )
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

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 62f898a55d45..46c5197dcd63 100644
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


