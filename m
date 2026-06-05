Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA3DCD6E7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 12:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQ4ASpkWIwpAgEFSrqIIvG0Nmxdm6HTzVKFF+4kwu28=; b=CywlHRasB8tYYuOiZNh/SnQUBN
	dtsLumlkS/w5jW0W+7FaZq1C9No5PDPkNzpbRjPgc8LYRSDO2b7HIiBW588XmEj5CfoISuQgAnrRz
	o4zpcxluvVrXjNCEAlwGaruJgaw7C2J58uT64RisSFX/ez1aF3V84MUDZqC5eZetnaduSJO8PiZ1N
	6AkCVwtgzMZvxfb9Ji8Jn8TK3GucwIb8i9Uh5+aIqvmP50m6utxHiob9ywH+nhbsGxasbg2V19AmF
	NGKllOyYTAfVsE9XOlENt4R3173K8gM9VVtR4J2Ok+usW7b2ktpi6O4pA0PwNtWIXlxQKMerWnyd9
	V3aUCsxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTXG-00000000blO-2u8I;
	Fri, 05 Jun 2026 12:20:26 +0000
Received: from mail-wr1-f41.google.com ([209.85.221.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTXC-00000000bgI-46Iy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 12:20:25 +0000
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4600cbb06deso1028099f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 05:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780662021; x=1781266821; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQ4ASpkWIwpAgEFSrqIIvG0Nmxdm6HTzVKFF+4kwu28=;
        b=EU09PIfqVkwEzuxu7m6NZdwGlPrWQX45G2N0blQwuoF3xlJLa3wiUnxZynLAXjvDhw
         sQoAEbcOBOiu+ZXJWVUTwSNScUQ2ZBUq7zPIh7eR1nYRZSah6JHZz5zsIhxwO+ekkslX
         JTivDW8p2tlRiaA5oczWeiZkHB2Nw4RYYkXoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662021; x=1781266821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rQ4ASpkWIwpAgEFSrqIIvG0Nmxdm6HTzVKFF+4kwu28=;
        b=errTgdXtqgbqX2JpIMbAqK6bTLMxI0LpNh6ixLFgHqSDzNZpRAjtDC0MtgO/JQFUoR
         qM0qB/Gzb/8XdCS+qG56EO+viksbm++pv1MJ+Dc7D4r4bY0WGZ6yt8RCWN/oPnf09nor
         q+U5QIkWTNHuT/+fzIxPj2vaYI1zLczFAxcQVIn1+p1XsFtRTWRmFKU4AGDKycmiy3LN
         dnkg8HmQIN8DKlhIGYTD7saOWYqM5GfPdqqlw+sGdK+nOBr9wQQg1/ZaJMU295n/WuGf
         sPiqD8kFLv2kf2Kp25HUFnR1LhzKr+S42eLuubcZtFSdGTSrywymshHaQaxjX0LCfYea
         JyuQ==
X-Forwarded-Encrypted: i=1; AFNElJ9FKAMxncHnmYfjBqeTTcj+J/PGiGzQ2HXU4eMI8s7P7WKyAFchBBLYWigCaQ+SxAoaEKN+jHUW8ZHRw0oMLrB8@lists.infradead.org
X-Gm-Message-State: AOJu0YyeTDegpXSGK4y+LafbIoDJ89fuULTo1KAXeYRWEjyJRVRZkWHW
	BZgDJIivhGOrTiDCNKdvjbbRpMHqGpU1Xl/YAo5oYSMYsKGHagEkc5mI9edCZaE2uG/Vif/1UJb
	w17FQ
X-Gm-Gg: Acq92OEdK8b4Ld9S8fpgzq8C38Hw82QEMVkA5c9jzYMbKxE3q1xTOaZm8PKrs9oBsRW
	BrWoFBT5m9xZiemn5kmhaBUv2nlJK8sRHGqf54H8WN/E60Vi4D63QWsfCQwMd2ETV/C1K69tlqP
	imjj9fDloqKwM8gUw7zawjCtEJ2oKN7t9cOQdl7ZIMHp1NQZcoYbhUjhe52tan1JwzHQsGOIPs3
	d9l0X+3fPtpyT+3mO4xSXfyyFKajpk4diZdQ7K5tfxRNRBKOr33VUK35AGBQLBxz9fD3YO7BMpu
	Yitp3B31d11pddq3fAxyToJQzId7qS7i93qsIAV6IoP2N/mfDd7Njz/6OAqFatKfpx44aqb0UrX
	RX9UsJvhQM525hPAyXzMjq4t8wTMC11raSMQbXtJYYgYsk9V4b5qvzFf/4cS4iE8NJctGmPqqN5
	mnE7qonzqjdoNEQX3RSu5+s/PReYt+XAqhwWFsKHAocaNDsBcbCtuNDtkL7LuS1IB2yBxaxG2eI
	Edd3BymcYhH7phFveEnbh/Yfd0dyMHqH8+HmB8jLM6VjZfHbxVPDz0fYrKLAewmt0dwpZhEvBEQ
	p+LbJl9QRwmUtAlhb193jNGBFdBZpppSkomdW9QiaxN9TA==
X-Received: by 2002:a05:6000:220f:b0:45e:8526:7dcb with SMTP id ffacd0b85a97d-46032b7355amr3795497f8f.7.1780662020749;
        Fri, 05 Jun 2026 05:20:20 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm24785883f8f.2.2026.06.05.05.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:20 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v4 10/14] arm64: dts: st: add spi1 pins for stm32mp25
Date: Fri,  5 Jun 2026 14:18:21 +0200
Message-ID: <20260605121957.78409-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605121957.78409-1-dario.binacchi@amarulasolutions.com>
References: <20260605121957.78409-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_052023_975472_9505BDA5 
X-CRM114-Status: GOOD (  10.19  )
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


