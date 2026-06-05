Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701F7CD6E7E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 12:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DRVbzjeKV1ymytOpSDZJEn1esg8I6P0sJ/LROeeCjqc=; b=pACw4JTvtI1e/v+LRS24GnErOV
	RazasxsHrpWT5YXnEmgb+hNRzxrCw077xT+i6e8iUme6hw453+auzUyX3YoFDlI91t1LC79suo6Pk
	9McKxVOtmOQeII68QIzXWS3BYJ+FIEedUMDWP/lTnLIVycmsO1J4yZpzAzCj/fJ2hGWeEiygZaGSn
	rdeTN5b/U6qM8li5hMdhvDLnb3u6/0IUpd6zWuMOLj3yTxoH0DYqJeO4qwti59dvAUAhDOByNx3gA
	i7mLRLVZLBEM56nCD6rSMoWHo3v3bCdJEkGIQD7PvI3uzdyaMVFZ15cZT3D2d8h+OPrtIXNyjHGiR
	SEc6hHIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTXG-00000000bkg-1dZb;
	Fri, 05 Jun 2026 12:20:26 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTX9-00000000bcl-1dUg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 12:20:20 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-460166910e6so1015816f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 05:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780662017; x=1781266817; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRVbzjeKV1ymytOpSDZJEn1esg8I6P0sJ/LROeeCjqc=;
        b=oDlnuETN3uU8fw0E5MO1ljZ7C0HZmwPk8OU1QGKaCHlQxfw3VAEJxd5nvpDKX7oHaW
         gZLZsrXsyO/lPs8OoImOGMmltX/zYEQsZoMVKqZFymgTFS+QQpCMQ05+RkJ4WVXs3Hx7
         8NNQ+KQRgtci0EW7FXpoLAqu9lC7GtrhpSMPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662017; x=1781266817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DRVbzjeKV1ymytOpSDZJEn1esg8I6P0sJ/LROeeCjqc=;
        b=KjtdfDO95QLS/0qMb8tRw+iakdOEHF2Apl1imciZMmmu0Tzi/v/rUcn2oBg8YSnIcy
         6ADLkmc9DeRtEYMjQ3m1h+AvORz9SSvyJprZfhxuG9KAEsmmcF/qKBNhuHqd4ad3D82W
         jJmgVpxerB1RTy4/QEMM2unuMYFOEM0UwV11TD5tUWA1JqhDDGiHjG+4YGbNT1aFSaaM
         iTrrLYZpJHH8H7usHFI4DrqmpAaVX3qi4fsJeOXR/f5oyiiCj+6nyKYeHXnXvb6N8EIC
         1U1VjPhfiuptLq1h7gdXwBqTucWB4+ObeCKo3rpg2nqfy5xngmYQKl6lyVebpMWafgws
         ysqg==
X-Forwarded-Encrypted: i=1; AFNElJ87vbqqO/2bhUlRmJX/jDEt5o61z4PNwmvcVX6oP3NqMqeVVxZVO1nATm+aV60BnncAA7aj/TSoj0wWlsyM6ol0@lists.infradead.org
X-Gm-Message-State: AOJu0YxM92K6vI3OPlvN3X+5H5YTGgqxRs9eZGRwo9O1ALJXYO47+Lt/
	C2maiWJnb+JY/X30Vs20lVnHv23VubBC5+CJPZXxfZ6M6vuzEo4MQnHrtrSQg2wM6Nk=
X-Gm-Gg: Acq92OGadIp5jrmvCkNBda8X7BAadM0SA/1lVdqnEQyG8x3orChaosxGfmYBxlW0wO4
	hqNibmPy8I5YKD3UGe8Ya4ZlwJDq/I+8DCtbVtkaPODFKoBrj0kTN6nFgMLj+P99mFstCIVmEdb
	nSGNcRFt1VNGXs8/oy/4JV9kImNgQrBlbZ+rmeyK1YHI/hxDCgwLie6/FNHQilQSNdHyTOaqE/W
	/PKsJzF6ujZUMZVT5GoM1orR9Oz41v7hglQXJNhS1dpFPEa1mp3MbzMeUsvK2eE/75SYYtFVkbk
	L8IoF7vtubRyqAG6e6xC0iTCF8zPF6lU2nK0Bxn/D2H57AExgAJEzZlY/LKzCwukjBBhnO8SCU6
	u2iJOZIz/tAusIYviQCY+pQT4ov5JZ694A7NrT6UhqXdZ4wmHui7tk+7qFChmBgf/PdW4cfekU+
	tFHlOicOZoEWWoOV2yc2zNzMvkqZCRJQRPVeX3b045sq+EnRgrCUjJfl/SEArta7uJ/zTBlxoyF
	N4PoUK/oLNZB3+jyi3kbhsp6JTH7X7XTQ+6yzU1cniseplW+kiSv5HXfghkafKfKo6HhPcZclYR
	UK7XY/WQ+IwZLz1AH3dLktXTzVztJIyL03o=
X-Received: by 2002:a05:6000:b82:b0:460:1301:dec8 with SMTP id ffacd0b85a97d-460302dc4a8mr3890971f8f.3.1780662017493;
        Fri, 05 Jun 2026 05:20:17 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm24785883f8f.2.2026.06.05.05.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:17 -0700 (PDT)
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
Subject: [PATCH v4 08/14] arm64: dts: st: add sai1 pins for stm32mp25
Date: Fri,  5 Jun 2026 14:18:19 +0200
Message-ID: <20260605121957.78409-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605121957.78409-1-dario.binacchi@amarulasolutions.com>
References: <20260605121957.78409-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_052019_455412_0696103A 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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

(no changes since v1)

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


