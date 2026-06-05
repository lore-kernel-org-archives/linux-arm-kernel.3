Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B876ECD6E7B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 06:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQ4ASpkWIwpAgEFSrqIIvG0Nmxdm6HTzVKFF+4kwu28=; b=dB7gInFRLcOjLMkq4ImkQCFTIc
	gLTmCVjma/7/gF6SASbbmQn5zRKCc6x6bJR8O+V7+Ej6cHdBZrOFT7b1H869lmpEvQuz+pJwm9Dlw
	Nn2hfoh2NSOIDpASsUvTqnwdefw6PRiOpCOIRhA3k+B2Bzkd/YfSqPbXQP5IqkDAraPxKJmTyp83I
	fTAIJvz5bwiK8pnzXPja9WMoptzIfQFwBGoIbRjmQRG3W+yoRONgDK5ZUEiTSUJWD5RwaThircnlC
	JtTS5jC1V2ChdZLK/xyozXYPI5kOKPu4TxP455MdhQTDs+QQY+acXmSn2sylot+HunUN3NsW5dP8V
	Mr0bmABA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVO3h-000000009q9-29H9;
	Fri, 05 Jun 2026 06:29:33 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVO3b-000000009gI-0Qii
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 06:29:30 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-45ef189aa1cso1089125f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 23:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780640965; x=1781245765; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQ4ASpkWIwpAgEFSrqIIvG0Nmxdm6HTzVKFF+4kwu28=;
        b=ftf33ms5n05a94Ny9YaNgV5KP3Be3lORMGseOYEv2PNk6akfvh8ZDraGR7PbGviH9I
         JdWWS/g3e5jpJ2VuQLQwyoQ61rGj8p1VgJhOPbFUvjg1Ka2W+JcaqdXGvF8Cle3UbxYM
         j1z62w2Mm88UyZJNxz85PV7VAi+vObc0BadvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780640965; x=1781245765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rQ4ASpkWIwpAgEFSrqIIvG0Nmxdm6HTzVKFF+4kwu28=;
        b=skKVKhdO20TTClfUkD8r75sDlIYxQn5iwDi2Zrmxa/XHuXhAKiQJLizqbxKni2uPeM
         zVOz8+Xw6YZv4xI5M0+3K9W8SBct0/lL6mxotzRBwB+Of+gNNyBZh0TmyzuvfBA+aeyz
         4nxMiuV198+IrlvGl3ovxdZXMNmuQP0GUSvGbx+nGGhJ4fbiJuzeWd6psqRbXhUF/Tm1
         Uvrle36kHG58EZMHVjoQX3P/znoZz5udIQwfxV0JllR+IL64XvSCWd+7fsQz49dPyD1A
         +NHnvdmUgXqVSQyWcmLjp1qyyADJpHjNnv3s1Ij68/SIQy8WTt+ksb/qb89HVo20ybIP
         9+Vw==
X-Forwarded-Encrypted: i=1; AFNElJ/FTI0hevtqzyaiFt05thdrTrJ7rEbm2ZlwUS8lcQ1XBVnUmgI11fRX2nJaEMv1VLfe/kqiNHluqYqNSekk2Xzy@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1w25QQqK0+gkOpkHOmQPpwWnQsc/ClYTlTjm000WKch7ivPwC
	p7y7b2fx0sqz61FOlszKpRedfaOL2bbHSBz5RD7lY+weCZHgTU/FHPpT112H8g8dksEmA1V8i6s
	RwaF0
X-Gm-Gg: Acq92OE3RfpDCNAk7c/7wyk+W6Xj7PxT40JBoXDIs6sVJs7TIVt/El5KLGWcEZKWPq7
	NN236vk0uHIyXFDn4g6pPeakLgdhuKr/TC85Rty0LUL2bPIA+JFZ36W6NZBv/TRRbY6E5SU0P98
	B1tuMOzhFP6/SHXkpaVxCg0cbDlis1VkwJuXlICeNqk8uFbCJOBvFTPBylR1Y/WVEArqmwKgXxJ
	xtClhuZ5qTiin5/1rE5JKusr0vd7xDPHKaBOMh5oqdoflcf07FTzMQ8+xM67M4pyugzmHEsxSY9
	bc03s30MjBz0kzuOeg/TPZJCqieorPMMxLWfOuBcVTQVLuxQQHmX8QR0gmFWo/bls2Ke5JzWh3Z
	ZNlumXuaJtCAovQtXcQeQBreQiSF1JRbZXv9lskfY7fyt6tywgOo4yEsaoyY4WFceAOnDRWs0lX
	7ogBwNR+mpH8Acjx43ti0/vjd8GWFyM0URLFqp04lECFVwpxHprYga1n14z2FThfFJG+MZsSB2P
	Hb9CqX9J34L0KmpaDayNfBuvLQRUTfMP5pRgO/uncF0prfpJC5GCTFwBf7e9+HpooJiUb9dfaJ2
	Urt05ArNDHfUwHZQQO7iA3WkbNppge0xjlBm27oHG77HvA==
X-Received: by 2002:a05:600c:34c1:b0:485:4388:3492 with SMTP id 5b1f17b1804b1-490c25716dcmr26314855e9.11.1780640965299;
        Thu, 04 Jun 2026 23:29:25 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm23022648f8f.19.2026.06.04.23.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 23:29:24 -0700 (PDT)
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
Subject: [PATCH v3 10/14] arm64: dts: st: add spi1 pins for stm32mp25
Date: Fri,  5 Jun 2026 08:27:38 +0200
Message-ID: <20260605062900.368376-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
References: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_232929_478885_1D23BEC9 
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


