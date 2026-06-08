Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF34CCD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=; b=afKgVc+J5yM8GHt4Zeyy4lxeye
	6kJ9uNWpWj5Uhujf9Vt4ZvuNmsK7e1Jo9/KDdLLZrx4jugFTKrLoVMsvBELLE5qr2aCBrmC5gRCRZ
	0lg9hRTozpVfGzq9+WY5+0mMXnP0rf3KpV645zT6UA02JUeLATYXAG55KXm9HEMqKDcb7/vc/OiWq
	xWtGusiR28w3AnqIBfKprudQ7Z332qFQtEAb8OaRqJwGh0smtAkKyBaFFV5hbau9D47RCOUksoLWn
	8Fhhoxh6UwceGrXovzJKrftCOnj5MgoWCGlKjXHK58UeouMjXPOforese0VDz2FVK1AB8DVKkAnwO
	vKduwiGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWasD-00000003jUA-3DHo;
	Mon, 08 Jun 2026 14:22:41 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWasB-00000003jPH-0vfM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:22:40 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-68d232ed3f9so7074318a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780928557; x=1781533357; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=;
        b=bD00SjSNRBuD8oQC1k4ZMsfkj92JtEHAAeOL+tJFmdeT+SMgmiquCxUHAb13NXtfuV
         yS96tdIiPOVlJzADiVtds2j8Tcr8GdYB4QjECAaSYbxSBBSW0fRtG0Oqh13pegEV4eyI
         l4UIUQgYNwRIe1VBEGI+KcSBh8ZOVj53tU2kg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780928557; x=1781533357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=;
        b=Ba/M/bcu74hvpxY+sjdBKp5UmvaB3ORCL7cea4Am7Pmaj70PUyEst+hk4pyrK/kDcJ
         8VrClnhdZ1sTgaNWuso3KVZT5+VqQ26zYAP5wxaGj1hxPBIgsY7ocoKNjPjBJj+623uT
         M2rLxdirUW9sBN2CjTLdRjqHRgg905OyvPRLWBTvTYYN2lGbwxaS98WzxWvrfFYMj0t1
         cLY/wbWAg75xaPF3zSaaZCFLpGqH0otsu8cYsm+u7Ej5If7iyKnLMnaCtAawuE2sRmXq
         dsxY64cQuSCZfBaPEFiCPa2nSF5FAuB0eptxOjcZEUE1AHlloQgauB4Hj3hZVf4NF0h3
         Zb3w==
X-Forwarded-Encrypted: i=1; AFNElJ/umxoUH2a/8hf76uSE/M0SEkWQDfvtiQ8Mqu+n/1gqyoU+wxU0je8ABxrUW9H/T0gDpmb9sWdNQvaEPRmJ0q0j@lists.infradead.org
X-Gm-Message-State: AOJu0YxeGXNb4bax2NPTiwDXq5Hy8UI8itIjxJu0HduTdADWm2Ool9fV
	G5xu3UeKfckTHQBjUaXZZ1aZ0klIDqv27Mw56mLdWroSK1ijXkwB7GwetIHbY1PMLzU=
X-Gm-Gg: Acq92OHjMvPFChuBHusZH4VW3N5nU96In4YsILTiaB880/6d42tXJwOTeMmMrJQM+gF
	HnBRmF3sePNzSrzjreTkS97NSlArQChzjXANQPtIkMWUVzM55YsntrJ/jgxLdaHL4X/x8aiEkUb
	EwXx7q/nyNY6y9HcydUaLrGsx/AE8fvXYT8RZMtdpQgE8Cyi5IjRboFH8CmPRhH51iT79PnLE5V
	U6mDqqOWM/nfnagCVOGVqpzKXoIv1O9nty6jJPgjBQUw90nWAdNXsvS0yvVqPpuyC/HtccN4neq
	MLCL26Gr7gU2J3CwMNJub0aEUZDblbk7BcAlFqj3u4JWBLfq/ZjGRgPLCC5sXR5wMS2SkaFLq+R
	+lr9I6gN0jdnMXBNmT5LY5udAjJ6YBkxW4EAAL4D0ARFet3EPoHxtjqXBXLhTn5nhctW5SaKdwq
	szfYmRNlov54SoxbkVFvKW7O8QiWhHDymwnHEAwFKaRR6g5oNtj/fpXKCUsZ5hMRQ43Okn53X+B
	YYRByHB0pNSa02w843jdlCBJsLy9uDYt/XDEJ6vm8X4X3jrqr0tpZqi11HfnwBs0+C/CQ==
X-Received: by 2002:a17:907:8693:b0:bed:5a4f:9fd9 with SMTP id a640c23a62f3a-bf370e6325cmr667273666b.6.1780928557174;
        Mon, 08 Jun 2026 07:22:37 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307a35sm881847066b.52.2026.06.08.07.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:22:36 -0700 (PDT)
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
Subject: [PATCH v5 06/16] arm64: dts: st: add i2c1 pins for stm32mp25
Date: Mon,  8 Jun 2026 16:20:23 +0200
Message-ID: <20260608142221.952245-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
References: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_072239_265433_D8680F3C 
X-CRM114-Status: GOOD (  10.16  )
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

Add the i2c1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 456ece7f8ebc..db485b9ed904 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -203,6 +203,25 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	i2c1_pins_a: i2c1-0 {
+		pins {
+			pinmux = <STM32_PINMUX('G', 13, AF9)>, /* I2C1_SCL */
+				 <STM32_PINMUX('A', 2, AF10)>; /* I2C1_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	i2c1_sleep_pins_a: i2c1-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('G', 13, ANALOG)>, /* I2C1_SCL */
+				 <STM32_PINMUX('A', 2, ANALOG)>; /* I2C1_SDA */
+		};
+	};
+
 	/omit-if-no-ref/
 	i2c2_pins_a: i2c2-0 {
 		pins {
-- 
2.43.0


