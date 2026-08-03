Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDE1C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 07:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W4P3RDq+QoFIrungFJ6qmguRlrjE9G4sn4ESNQyuys8=; b=hYZbF6uCA3ActVcECLFDVafkzy
	yy0KhI43MypZHHrMvPW7ArAkXnD+PSkXN51imeGoE9xZk+YWARUj2qU5x5raspeX/Y6340z/cHU0c
	6Zalp/v0SlBnj6qRYXi41sO9LFIYyvvSBs0zDqcNGZXhATsd53gwdC1T2yv2t6AKv+dno4TnsS9jV
	PMGRA5fLBCuSMkPW5eeTWGnX47jKJbcIgyIp1r6rcnz0A98N+OH1/49wjm3rDh1z6Zcw5idQ9Gp7j
	6s7ym5QerNDOoDI1m4YT6Tn+n4H4BSADBqA6nbDTfRmvPe26YJPfWu/BJyQe3VU1ca+4J+a81jEFo
	k7isv89Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnKN-0000000GXlU-13kN;
	Mon, 03 Aug 2026 07:43:15 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnKK-0000000GXdi-0zmq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 07:43:14 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so18223225e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 00:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1785742990; x=1786347790; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W4P3RDq+QoFIrungFJ6qmguRlrjE9G4sn4ESNQyuys8=;
        b=FrYD+0ztvqXeApZWponb5MsE4foNtxVuXB4m32lL7jGT/6duzLR0a2wUC7GDnQpeyy
         c20V7YhZtAtOBAuj+0R0Eesw5GLWR7mjOlJyocAeAr5iG6cBoyogUChIf5KonnPh9FHx
         fD8PAjI8tappSkhdwNtkeX210PuQ7OXivywNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785742990; x=1786347790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W4P3RDq+QoFIrungFJ6qmguRlrjE9G4sn4ESNQyuys8=;
        b=IBsbwVfScAX7RuZxKNp7ss5N4p0DWI8y046kKxpzi8dWaXDhZCg4lvhuvELpqlmejC
         HZydZaZDoIlSQcwnRQ9wYjByYbtRFcbLaKABJzbqtZVv7sLKcMBF1nvwXwxTAs0r9fjX
         sGeivFs4wVoOCJHlKAqR7NTUxU9rHAAWQMaXYRtTyCAghk/cg/xbOEZoIRZeeTjY0us4
         wYND+PSYoctJsREPA6NLZocCXNc3YGLfphmRwj9cgXUNyd9nZCXHgdeDdK7Vif7hkFby
         24qfnopTfOAuCRSlMtV9xsA7uA2Xd7zWjH3f9NdFRWuONyxrW98y5BFKAA0n3W5E4IiW
         Y0sg==
X-Forwarded-Encrypted: i=1; AHgh+RqJoleRV8x1nV81a/dKM0iQbUPK5TNTSENiApoW9dOFz6c94RKOfqIxph+tuV2DVU0cv2eksfY2sTMqjeimBIP0@lists.infradead.org
X-Gm-Message-State: AOJu0YzX1h2ZdPCaOofi/TXR0P5vUUnaJcbMmo3eC57ZxbF4pL0NkqUL
	vcEBn5Nnl/qYB5RaimFA6iCHjSPjl+JoeieYSSm7i/QpODp7kgf4HiQBLV9WI4588Ww=
X-Gm-Gg: AR+sD13jgebB49yNhWwv8qghJpVgo9i7qdcB5KzRbXBUHWm6WEORPAw3mTptK6DPdJK
	UUwsBbSymvGfsvxx9slizy4OIwEcsNcRHDjCo+4qpF4lFk2mE7+pG9rbzRm4TSsYYIV6g0nGV1V
	qZKLxRbNQn78/fZZELTAihs3dLRzPmR1eC+wBABpbVTWd/P6TiPJBTbW6sz66vHzpVJs3E0ADC4
	k9grYGWXEpfkADPqUUQRagbhAY6Qlr1yHqRUzaeUmND9GsoZWaUCupYJMGTGogoAUbDGbr/jmf2
	Odx3/D3OPWVOBDlU12pVQwArT5VuZmWd67kNIpsiYER3y8h6mobwY650HVSWTfaP3Y69YJ8u3jE
	pDS6qY3f1TYx5oJGE8xkBK73dll6SnnwSYGLBByhqoSHDsajeSI/C/RG7KASymt2Y0/5eKS4PYf
	BWn4feI5S0WvGxGSMZ2gpKOYIUDybTrEPztqwRQUf682ymPYJ1264QDxsp0afTVmYXrtTxRBmEy
	pG5yhUZl8qCvedzX7LdOAowUDlVfcUCwclqTiRUz4JSQzpMeCLexj5ds1gbB+48nnGtUkvaAotn
	l8/c9MKULuzvK44ycb7jL70lTEa3ybiRh0myrZ9RswkR3Dkd38+tahFfuG8cpwHu
X-Received: by 2002:a05:600c:524a:b0:498:28b:1025 with SMTP id 5b1f17b1804b1-4980c66c838mr180454545e9.5.1785742990105;
        Mon, 03 Aug 2026 00:43:10 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm30370503f8f.7.2026.08.03.00.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:43:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	linux-amarula@amarulasolutions.com,
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
Subject: [RESEND PATCH v7 13/16] arm64: dts: st: add usart1 pins for stm32mp25
Date: Mon,  3 Aug 2026 09:26:08 +0200
Message-ID: <20260803074224.3821911-14-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
References: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_004312_346774_E7DCD275 
X-CRM114-Status: GOOD (  10.70  )
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

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 4e570e2e5157..d515e44832d7 100644
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


