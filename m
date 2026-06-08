Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDAECCD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mf08+e18iQyaBCmXia6is7dzqtiU26q8LvKBSudwg7A=; b=ed5lttZqnWxnF10mLw0tMVm4gP
	cgDH76VUqhreTqGszGBOTo3hrdrYUO+P8DsOQHugS324xbkKAJqxDgVC0Ty8WridNvMU5+tqbbjQ5
	J4mfEfjYxADOFlCjtmrzKeW1KioGfv5u+dsRQTr2/pHIg1QFIBofKkM90JsamiG9ReSnygb1bh/ph
	ubafT3MHYizJGLGPFP+E+J+5robRv6iES9TBZf8/DUIWOfYXg8Gw12M63HOvnxVIemUwIXGEQhLCU
	QEtF018S2+idHc9BYPie2fzZZ+FZGGmfXw/aB8TL3NXq8GAtB2ZpqAcXKPFE82ICOEMR/vvr+CYCU
	zCw5wpxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWasI-00000003jZs-0TtJ;
	Mon, 08 Jun 2026 14:22:46 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWasF-00000003jUM-0XTT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:22:44 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-bec3ffb95dbso678664466b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780928561; x=1781533361; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mf08+e18iQyaBCmXia6is7dzqtiU26q8LvKBSudwg7A=;
        b=HrrocUpQbq/j2ZNmBee+5Hg+CcuRih1ExvjA3ttHGe60DnWEXg1t9IAs87SHEbczLS
         GFxVA0Z26TIb8KY9KVdUKjZOEnlnFmaf3Ymj+Irn4q75RPYAodVCNmZ4kxlx4JLpvUJj
         inFiIeLV/bvFjK+i2dDZc0lrVQyst7bAnaOUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780928561; x=1781533361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mf08+e18iQyaBCmXia6is7dzqtiU26q8LvKBSudwg7A=;
        b=NLDHa5pxNP9j8ecefAkirxM9Zp4j1alYjb9XB4Vf6GMTyc4sWAklUKKle0vjOyyGPx
         lwvfaZOnuBYPje5GsA2xRIrV0AsSXUXlCh1UvsHWpNw1gtx2DfeimmhBTCTEFW9AEe48
         hJMVzko9Eg9cxdw+T+P8oXcuGyxtKzdhQyMCKenWGPNhdCJXxnlEu33VdDodcyDk7nSe
         x/Z2M9l7qIgh4u0t/uMfFZzHjuyOdQjbZO96F81J9Wuceqz9jKLxKPToFsehSEAnk7rw
         itfvFkfV7TBF322Wevaq9D1DMW4x54hHr/pdwAHBrR7+ITNU3ZIUA+q5oiPiVlwEjB6i
         Q3vA==
X-Forwarded-Encrypted: i=1; AFNElJ8jOw/sGRC8kpXh8xiy5TNw9H03KHCScDIaDqPpnl4UJEzSUPVmqZnruAqSQ5Sygdnw77WUk3wxA9+Wv8ToyNl/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3hAUteyqgUT6JilzoBKPRE05GUShatjsvP5ovpBpqSzS3el0t
	eOXBKEzEvbPIK1kcf3uC8X7xE2TJjoreZe/xKVzaoO/0Josd8+9RbzjfiOdMn+dIb2w=
X-Gm-Gg: Acq92OHrHNxiCWUwz0AYRi8Z6UIwsNlEu54Yk1RU+6FKYvJxNUlcxvNTdeGWe3vg7yO
	lXXSO361PzJ6g2E9bITOsdxJnQQUvUNLqjI+3UHyHItVHuj0ZRazA+LeQSzDlpFm0aYY02tgA7l
	j98aD3BF8xvVc7bff/GQwapL5cWGA5S29jdagBQ4NuI5eCAkx5+0Bo6i6HgvtpoWfXgOn4o4sYG
	ha++2jIFpTNVZVdHGhLdHGgrdleRzd8xGuPTJkHPewYH9oWNHP0XBbPSB4SweLvzZHQGAkIihV5
	QSDzlGQ3TYZRXybAjmHotVZsqwcDWJS8btv/1TZIPTIu6Xw/Q+h2rosaFjYnIxS2+1OIOiuxA/M
	3/wl6OKO2QgY4JjG0jAB2Kp2M+5/UzpifjfYHrT4KzPX/lj4Cb5usq1wGT2jY7N1/CBlCPWHuqn
	Dc6/g95Xuk2UiPu4ocCup1ymV0w6aPJALQMRimPq/kYgC//hi1s11zc5mqWwhW2w0BVz7v8aarG
	8AHFdLfyZtArKgN3xbZFO1sYsLXMMu9GjEjh0gpq7FKJe+YtaKelI7qD2E=
X-Received: by 2002:a17:907:9483:b0:beb:f459:718d with SMTP id a640c23a62f3a-bf3729338e1mr767674666b.34.1780928561050;
        Mon, 08 Jun 2026 07:22:41 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307a35sm881847066b.52.2026.06.08.07.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:22:40 -0700 (PDT)
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
Subject: [PATCH v5 08/16] arm64: dts: st: add can1 pins for stm32mp25
Date: Mon,  8 Jun 2026 16:20:25 +0200
Message-ID: <20260608142221.952245-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
References: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_072243_204455_241903B0 
X-CRM114-Status: GOOD (  10.08  )
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


