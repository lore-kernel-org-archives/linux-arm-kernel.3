Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD45ECD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 14:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RCHIPZwacuOf0o7fSIdc7VQhv0GmhSFgjV6dD0HjIec=; b=MstNZielNWho5LLDEMbbIkgaOo
	UvnyRvRsim1NNAjnY0rrXAArlTvlZCM3JWngy+X+RsNwOw7DfMFSzJrYUAgfYhiMJvBs07/0Z/0A4
	kGQlFPxPcVFe1Ev57IuLDKdwrVO5QsYQ3WN/YNVH81yVInkSPpg3vAqEryVbA4B0zH0kUQ3jTBAU8
	U/h59bje9xIT+LL4ZgtUWXkaWeTIX5RXP+D/MieJLekE558tq+hwWrGn9ylyHDxHNuQYQHe4L1dHP
	9SJJAnPHul+L8OfFCsaCpruO/vJeIQSqEznhG9hNufJKdgf7D/yeZkzf84vVYLImBXn1uZFIRBsVd
	2zaYqazQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOz1N-0000000Fzct-24ln;
	Mon, 18 May 2026 14:32:41 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOz14-0000000FzGK-00gy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 14:32:23 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-bccd251d622so410713066b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 07:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1779114740; x=1779719540; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCHIPZwacuOf0o7fSIdc7VQhv0GmhSFgjV6dD0HjIec=;
        b=nD+XGp8sfOH7NhH5jNRoKUomxfPhVmEvOSp0kZzG4CocnEd325UOfR4ap61oQI7+R4
         H4HF+v9+k33UM3egO0eTNK5kV5GNu1Zsb0e71P4V2s2S5IT/4GXPjfF+rKVKhGvFu2/M
         5OZg63GXZSpIwN1BChzC0FqU5yT1yJygJutVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114740; x=1779719540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RCHIPZwacuOf0o7fSIdc7VQhv0GmhSFgjV6dD0HjIec=;
        b=GK+cq0mXjONfzdQ47grt159k+frhieIOZv5L9O62GyODiXWATSffozsBURuXuyPGGB
         NsYop2TLgymx4qzzaBFXKJyGN9GQ0uHJwXfPwpDLCCTQZFG1eGF+cVW8yMCxjhA9UHBi
         IlH6qipvgsxNzr/mKPuWppuMNU86GoFd4UmbJiTgTse0nZeMjibbBal0XIfyu1AeYSP/
         40uM9SsdbB4HQOuyi+QloT/uEcVBL8l6MZLasG5z05PXPaVAL7spXVU8C20aM+SlLtVE
         K7TVLRlWD0ToiIcWBsBfXN9C0KEPC9Aj98Vcn97qq6BWuYeKoIlIjcKigiPP/sA3qvid
         fEjg==
X-Forwarded-Encrypted: i=1; AFNElJ8JFW+piaViSJzT88wo3Ool4NS6MFTAxH95u/rvdzMdsP1JvgHmYi3DtQJ5bTfcjU7vJUxYo59d1oGGmcj+il6F@lists.infradead.org
X-Gm-Message-State: AOJu0YywclKdb18bh2nPqLn41PfRfQqTiPheUWpiwTDB1DSFZUZhVtbk
	/kzrorKV1EK3VhaM6M1ncbPQJzRHXtrSbbKQ46BfwMjYo82FiPoltPQnrxfS2jhcvwnR9nzbdUa
	v1XGn
X-Gm-Gg: Acq92OFHS+u53+2JwK8sfG+x/8lHeWaDoorl/d5UEVquOw92XI1x0Kask6VFwWT9UHh
	sp38j8OUNEBZ88W8lGwJ6054Zcb5bU31PlCcZcUfE3z9xKvNaFwV+1/e1Rpro+1xes8/5GiKWli
	kE4ISZjXNqRzx6jDwv6ZD9NOrEO3XHJuNV7CuQ9/RXEJ9ASMVSrXvfQq4t//FPvLm3In+q7n3PN
	puT3qCVV3nS+CbKolLcRllVc4+WfbtmVgVbG6uhWzz9quktnEtzlOD7/nJzK/bK96ZBBjxPnuKe
	D/zV8ktbY2VJJYAXLSJHlVLehdjpeNVhQQm5BNJ9aPofqeVO4soCJjroNAbUfXkLf880Pq3Hq+i
	fx+uFfij4HN0yPl+olYkyNf5rmTi0qw9k43mT+OGvIHrGhM45M5lEYlbXfUJC8ubqJBDo0FKP2O
	80+gZXTxy2GIghZQGm77NJu9IPy/BpMtmK9XFPlhnqpKP4Shjv+87fZ3JFb4sCooRdgD5TX8Q6H
	s0U8gR02ZFoS6zHbdJctvohcZq8peY0rfdPss+bUa88SHx9mnYdKe+3TtQ=
X-Received: by 2002:a17:907:272b:b0:bd4:4593:33bb with SMTP id a640c23a62f3a-bd517ad5b94mr840117066b.43.1779114740148;
        Mon, 18 May 2026 07:32:20 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm39564572f8f.23.2026.05.18.07.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:32:19 -0700 (PDT)
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
Subject: [PATCH 11/15] arm64: dts: st: add usart1 pins for stm32mp25
Date: Mon, 18 May 2026 16:31:26 +0200
Message-ID: <20260518143150.3138712-12-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
References: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_073222_049941_9175D3DE 
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

Add the usart1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 46c5197dcd63..a72c458b2c6e 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -766,6 +766,39 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	usart1_pins_b: usart1-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 8, AF6)>; /* USART1_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 10, AF6)>; /* USART1_RX */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	usart1_idle_pins_b: usart1-idle-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 8, ANALOG)>; /* USART1_TX */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 10, AF6)>; /* USART1_RX */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	usart1_sleep_pins_b: usart1-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 8, ANALOG)>, /* USART1_TX */
+				 <STM32_PINMUX('B', 10, ANALOG)>; /* USART1_RX */
+		};
+	};
+
 	/omit-if-no-ref/
 	usart2_pins_a: usart2-0 {
 		pins1 {
-- 
2.43.0


