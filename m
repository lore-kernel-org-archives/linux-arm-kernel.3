Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B31C4450B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 06:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mf08+e18iQyaBCmXia6is7dzqtiU26q8LvKBSudwg7A=; b=bNIEAqbV5qtySR0buzoRE2Z9cz
	5QZ4NY2r9IQelwrxiKorjkkBZvgu4n6tBU8R/1voc7QxbgsC9EFk2QfBOzjGEONxV7taZla8RDxJy
	5dAmQ4GB5kIHPAPt2JwS5LojjzYz5uCfqXrhVpYQnnJV+405H1MsnwE98PN/xr6w9f4JjeoRdiwt8
	5gt692wtSIrBigD7N9mGxKPW2fy29VTSYOHYMn6VJMJ4ojxoeJZDVtH82BkBEa7CRS5/EUsx8YfTI
	UdGgJVn2OU/wd5aAZCh9qGnsY/nFQbBrnKikqY9zv/wdKdLgCGaS0qzII1qLsm1rkds/tqQXs6Vd5
	j0DNqsaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjt14-0000000DscQ-0dDU;
	Wed, 15 Jul 2026 06:22:46 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjt0o-0000000DsNQ-1kFY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 06:22:31 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c16794450aeso50466566b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 23:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1784096548; x=1784701348; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mf08+e18iQyaBCmXia6is7dzqtiU26q8LvKBSudwg7A=;
        b=MfZuvIRAdXcf9w+UeJbD47ltrunU0hu6sqC2ftLmtGFOFq6GQeEwp9g9v0LolO0QeT
         SsbWM8mCvKJMtY4ZwalNp2PMokNt1ty4JjcGVKWxyiHX0m6nAADinPLO14aByBR0oelY
         6wN7bq4MQikoeHfjib3f4pV9l0GlJHQTOiv2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784096548; x=1784701348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mf08+e18iQyaBCmXia6is7dzqtiU26q8LvKBSudwg7A=;
        b=TtbrdnLBOfHiK8Jkfdt11VQszB7AlmQgWfh4JC92UVG30S0RNcDz585kS/tXgcqKZt
         hsWWN4QUEdVirCRnJRggcsp41oFqc2NBs5GP+Jq6UlzAqD9ThuGnPLQGCq85QElIZw3O
         iznppwCokEOnAhxe0Fc9stFz6wP1qqtJoNRoQ04S4/cGARWnMUWpAIKLS/bSxLv9MoQC
         HurtJELqVgYHNbus0Nki6rDVo74Hq3zHBuvzpp93RkdhW6HvIr/qBYG7M/uhABno92Fz
         4i/pbqdHXOKs50voCRm0oWsaE2i8MJLaTbjH0xppDQIQ1wBhVLygTMjkREvRG5B9CJ79
         Q9Og==
X-Forwarded-Encrypted: i=1; AHgh+RoFs7LR0Zhjbhm3i9Nf2Uf9ITedZIAvzQjRVRHSZ9pCljNMuqaqqJEuQVPTBZvAJ/bGskgOAcJc6QAcYEsz7hoR@lists.infradead.org
X-Gm-Message-State: AOJu0YxKK3vSGEaZgQMO25wsk7lo2tZNeqta6iXPCnoQS9q/KK1cXMrh
	XI5In/1mBGZaPEuuI5rH7m5ZymsWkGg0f+zEvzPeEoflWpD1SACMP934ewIBqgMHPMI=
X-Gm-Gg: AfdE7ckJLhvnliYmYRuJe8X1TBTQOxIq18PJVAFZ6YtOGedQlRvfUZBOl65RUcVtue8
	z/bbrLqKRPGrj1ONjoOLycR8Ga8i+yTrcXK5temovn8Lk8oKz34VrE/kU7mGUxBaVzMIyDhubp8
	cmGkI1J2vBSeMKAzfsytB5hVkoWJPZ5wTA9qu0j5qIGGSB5+NHDrsnT0ApnN68coE8W1IYXpPLo
	mfJhlLwPYx8ZH6R+5bNVw1SgLrr8iGH8TUeAi+eFdWV92MOQxwD539+jGu3dlmBzxO6NpqthYJW
	Hwj7mOOmeTeCeUxaKPYBAo6s10RlIfZVbf14rVwLpi9lyrCQP+LeBKcBkKW0A0xtV0VasXptTKL
	54fKR0Q3ZFXvs/c2TeKemC9M1VIC/VRfrmQGDHx37+YG8/oYbbSURyU2yWX/n0Cj/ym+CQM9hr9
	ZIlJ+7HmkiorufeaFwb0xCCcX6NZaxT7QlNfAaz+TWzRuEkmr7gI62RzlhUovCTzzhG9o2fKW0g
	7tqMjl6IVKyv8O/XYQ76jc=
X-Received: by 2002:a17:907:962a:b0:c15:f69f:a175 with SMTP id a640c23a62f3a-c16619b70b4mr339217766b.62.1784096548575;
        Tue, 14 Jul 2026 23:22:28 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.41.101])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d0c3cf1esm1028820366b.44.2026.07.14.23.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 23:22:27 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	domenico.acri@engicam.com,
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
Subject: [RESEND PATCH v7 08/16] arm64: dts: st: add can1 pins for stm32mp25
Date: Wed, 15 Jul 2026 08:20:25 +0200
Message-ID: <20260715062201.3599458-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
References: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_232230_497935_C6186864 
X-CRM114-Status: GOOD (  10.42  )
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
index 50f454630cf2..6482dd47e977 100644
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


