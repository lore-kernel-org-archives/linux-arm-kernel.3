Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECF8CD4F50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 14:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yoBfkEc3j9+rJ1je+ryUB6XrPniOs4Aeeb5/gWWWZ7A=; b=E0ml4B9vLilmFZAN1oKo3GN1IH
	6w2OAAz8DMh/VC0gt2drG+L2ivx2NvDI/v32S/cKsWRH3juojydx9lAYko3EcO4P+qESSa/8KbAXP
	3NkBFK3FoKpRf2+wjA4QZMaEyEzPwiHbgvPSMzB2HfJ4ipQybkyAW5qeTj5J2mGC8KVkzB2ekxV15
	hjI9Kljs6DXsfdUl8Vq5ypoY362F1znDlctkzKiFxkp1Dg/iO9Js+q3hhjPU7+EWGi9423N2RP5sK
	eOwdpNst5oJG937cvUaWvKBEDcu6+hgIOwb3TM2zOEWLcwiQlgKkTl0UEiJBhbTFZSD/ilvO+InWx
	LbBQSTyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOz15-0000000FzJX-2VhX;
	Mon, 18 May 2026 14:32:23 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOz0x-0000000FzDJ-3ejZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 14:32:17 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-44ce78ab5feso1999960f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 07:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1779114734; x=1779719534; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yoBfkEc3j9+rJ1je+ryUB6XrPniOs4Aeeb5/gWWWZ7A=;
        b=Lhah3ZLZ79BeJp0mstovCTSer9FLpDeces9piVvANH2i1mfBRfd+ci68pDGTOJY0Wy
         Oul/jXaiwXS7KlyViNvjX0oHTbG2zMMjIlVy0unTZpL30rS279vY7Ry2Yk2Xud/dSK9Z
         /d9HCPmRnfC3Eh38D/llCC66S+89j++92WMFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114734; x=1779719534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yoBfkEc3j9+rJ1je+ryUB6XrPniOs4Aeeb5/gWWWZ7A=;
        b=clhOZxOh/0mifikM0qErI7S597PIloGnX+jug30VSObFbu/zAbxJsmqL6dettQmcmq
         PpqcTEHaHAP28iGkPrsuB5piDqRQnFUx9PVXJ4ytHQ1nZC75/OfbQAfxyVObIg2fD3dO
         rm86Tm9FKbcoe2t/cx8QI5FNEU6sqwCJbib75vk6uuYOJN8Tp8+CyYanOwimTPOqFev2
         vYB2WuLXvK7abjGvCNKjn0SsB995JEd0qK54ATyxQIoKMwQQQjAMIBDAnt3fskQDcuAA
         /2NHBU7OpBBVkisKPs5p9PJ6ECx/imCHHKu6ppv0Bd8x2cZ9YFqj8wS3uzhqHdBu5gf0
         fifw==
X-Forwarded-Encrypted: i=1; AFNElJ8BkjyEtIEMPCmB4v0CkxQ+nMNVW9kp4NGdjLL2+aXqzZghEIBtf2xkI1YAM4dB43/9Z2Me9CELfUt2JEZq9+0v@lists.infradead.org
X-Gm-Message-State: AOJu0YynDEtMoP6fyDEnPKmXsvMzF+SYffoa+I6I1F+mmtZdFBvzrN8X
	oF6e+xkvLK7VWYRl9LjW3lvI719RqbilUgVpOFMN3cQnuCPJ1lHkL3s4jofvlWzlhik=
X-Gm-Gg: Acq92OHZP2EOq6llho9zoj5qg4Ji0xZFLrxaL+QLKevGrcU3Z+3XaqRkyoXo+24qIT6
	IiuY3upv1UfilAVxeYAWLg8tdVySOMNF+BTQdSTItmcOcfTgoXONedGt4m+cXWYRXGHnUjEGLLu
	LxH61SILigZyPcCtINMvQ11f8z8aHrIpt2K/8Vvlucf86nCHkrdxZo+p17/P6Qr1lZlvpXZhvca
	rw5VdqNhHTq1rVNnVRRg+a+7p4BmM94jvXldZUKU7Uy2IShDn5LmjL6ORCqpRKHGdM5COFsLUN8
	yZK4FwPa2WUoabuleN/QRpFJGUQZgP+NG/3i+Sj8nygp0wWduHNMzYJxE+07KWV0he8MS6fqU6z
	7PmPcgSH/4lNPaPMYRVOQVcNBnVr4WN6oLp0YVRxTTB+Ll9GAf34ZKXsJtOjhr4c/5Yy4+EXj0h
	nb7zF+BMOFnPTk47T/BvGag+sfmpROEULT66RxSNcLyYhYf4BUhwHsPAge0MZMUy+59sP9kdIeu
	3MtgkY2TgLrcDQoc2aRU54EmIUsBwDzTWg2xXRkZ2Two5Fg
X-Received: by 2002:a05:6000:18a4:b0:441:1df5:480c with SMTP id ffacd0b85a97d-45e5c5a8f0amr24773510f8f.42.1779114734167;
        Mon, 18 May 2026 07:32:14 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm39564572f8f.23.2026.05.18.07.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:32:13 -0700 (PDT)
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
Subject: [PATCH 08/15] arm64: dts: st: add sai1 pins for stm32mp25
Date: Mon, 18 May 2026 16:31:23 +0200
Message-ID: <20260518143150.3138712-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
References: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_073215_924116_DF4791C9 
X-CRM114-Status: GOOD (  10.84  )
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

Add the sai1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index eab8ebe71660..ab1e62cf2bfc 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -520,6 +520,51 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	sai1a_pins_a: sai1a-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('D', 9, AF3)>, /* SAI1_SD_A */
+				 <STM32_PINMUX('D', 8, AF3)>, /* SAI1_FS_A */
+				 <STM32_PINMUX('D', 10, AF3)>; /* SAI1_SCK_A */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('D', 11, AF3)>; /* SAI1_MCLK_A */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <2>;
+		};
+	};
+
+	/omit-if-no-ref/
+	sai1a_sleep_pins_a: sai1a-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 9, ANALOG)>, /* SAI1_SD_A */
+				 <STM32_PINMUX('D', 8, ANALOG)>, /* SAI1_FS_A */
+				 <STM32_PINMUX('D', 10, ANALOG)>, /* SAI1_SCK_A */
+				 <STM32_PINMUX('D', 11, ANALOG)>; /* SAI1_MCLK_A */
+		};
+	};
+
+	/omit-if-no-ref/
+	sai1b_pins_a: sai1b-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 4, AF4)>; /* SAI1_SD_B */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	sai1b_sleep_pins_a: sai1b-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 4, ANALOG)>; /* SAI1_SD_B */
+		};
+	};
+
 	/omit-if-no-ref/
 	sdmmc1_b4_pins_a: sdmmc1-b4-0 {
 		pins1 {
-- 
2.43.0


