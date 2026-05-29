Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DFB2CD6E51
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 14:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S0e8wESPhIuGnKBPbF3YDifoYbOSIP99q8OpeirAYTs=; b=0OSBynbo55tDRK1O2k/ERZ0+4H
	C/EBQYhItV/L8GZrEf3L84RD8i9SxUrm6NlTgJ3zv9XOMc02AATzhYfuPnBgXGNW0NXX451E06xry
	QG5jXRGrydhfPbdJgUZupnzzNIsAW2HQzLH6uT2PHtToOfWG3FtlEE24ligQH1wE8azKbQ+cjGhFL
	1IGh9lNjMuXVXxY+wCjWzmgDIatMcA3eD+20rlbXNmexNYSHZnIzEaniiCwCoDA/Bmy9fnmPIkFwH
	89mFZiTSjXUOORAQ8sLLMaKkhfRiGIZJbeOJw8iQB0RLm6GGS1gZ4YgbW9tvgX+u1kRsJchVtcI1Y
	wPA2AFAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyUp-00000007YWG-209D;
	Fri, 29 May 2026 14:47:35 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyUi-00000007YRV-0wGi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 14:47:29 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso90604855e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 07:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780066046; x=1780670846; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0e8wESPhIuGnKBPbF3YDifoYbOSIP99q8OpeirAYTs=;
        b=O6ygkvhFJdP6Nsot/MVzXr+Z6h9/KcFPxy24vrXkdKd9lgmkSrZVy35nXGVH68AbgZ
         XVs46w/iAnn0hNZOPySfp7UAwKBxZnuHgy6TUnrDEOf0DezfONP4BZxGjK+nvPdGQAYj
         zTaTl2+j0iinkeH+y9ooohE8TufbZJlNR52Kw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066046; x=1780670846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S0e8wESPhIuGnKBPbF3YDifoYbOSIP99q8OpeirAYTs=;
        b=mAV4aqNTkcWYcIIuMsT4W/qOgJoCdpQaR4EiU2gln3N8Pt+yyhZEcvRnFGv6JlEOUZ
         rONfdOdDKFx9qhfzcPtbS/3JoCVrY+4qTmdXVc8d92Oabjb2R1CThXs082lkTZMTLAcp
         TsL6D1c7rku3zqgrp/huFs4ig7+qiqW3Ri4pjt5NFFUVqj33mUid6IM8+kceiWZMWyHy
         62+N1+HiA8I+FRql4zMSf/NUC0pD4Ww2RoC9erWjrhTzzrAVYdWVyzT1fEm76an+5VH3
         dN+xqJJFpcozku8kxk3x6tbuO5Mjd3dT8TyaIjojAAl9XtdsQdkXPEDYhbD+gHUVvEHP
         2eAA==
X-Forwarded-Encrypted: i=1; AFNElJ9WxsT0U+AXfHqYHNdv/4xsz2+Qqv1Pzk9aXLJJv6driC2v3ZtzgcWfjJnH+Op2Z24doiExTKwhT7ISiRBIQwVs@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+cqLa+hrfD0dVUAHIm6oeuNUpnmEX7Mjva/euK/IWUGytf5Z6
	6QdRGTfvTQBEaQNb9Q5HDT6klVYq5evVKzUrM5k53ihMt0MJuRpOQfitpz2rwB9cFqU=
X-Gm-Gg: Acq92OGVny0wqJd8SpqmCl65RC9EZ0F3ZzDHqIYYyaO8srxiR3xTIwpiQuBYfqnpY73
	nL2C9bqdscKbEM5hhcdGvjwAhCRrx+DgIXjrwKm9SixnIqEC+9Yn8if0nMsdJcW1W+ANqC4hcp3
	+rmi7EmFpMD2TmAGlpD28odpKRhNSeNm1DD9mcYv7Y2b6cnfD8Z3fppKjSWMoLZn4x05sZ4brd+
	hLFUKdTcTB8XnrJqVVLWlVyeWtg7KI6Nn+6ZI6ZCKzm8YMWlWah6Mh+MRTtbZDhgk7wGPS1ZVKY
	8Woo4VhcQgqxv2a2Py+UNjIT6RSK/qEM/E2LrOThIUQhWXO79NYW8ZaFdjcWCs6WaT/QbrLPFur
	NPtUcOeP6fC7GNvh4xqkd2I4mYdXFlj716Oe3rLFHhdtHyWJf1vdj5/YV7z36HF68OjRUg75NYL
	+KE0kPY5q8wcBGFajBu8jlqBLhFYhj5p9Nm64r4jCXk4ncLLxiwnNrXEJijpm2GPysPWUycWn3y
	YOQu07fxynmIfzjXq284FQ7HCO9B5cvCYm8NlhpW797hoMzm4aUR0NGA8Y=
X-Received: by 2002:a05:600c:3212:b0:48e:5d91:cfe3 with SMTP id 5b1f17b1804b1-4909c078fd4mr36226805e9.1.1780066046319;
        Fri, 29 May 2026 07:47:26 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6eb470sm38694785e9.10.2026.05.29.07.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:47:25 -0700 (PDT)
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
Subject: [PATCH v2 06/15] arm64: dts: st: add can1 pins for stm32mp25
Date: Fri, 29 May 2026 16:46:20 +0200
Message-ID: <20260529144707.3931919-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
References: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_074728_279060_B1924BDA 
X-CRM114-Status: GOOD (  10.26  )
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


