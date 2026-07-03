Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05516C44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 06:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q8e2F85Jk42cknJBTKAisusI5iJFywDQWX2RRkkLus4=; b=j9MwDSe41Gd7koUyBoiAZFadUY
	uW0jyLDasvSmA+Z7l2cwmq1izek3JJn08AOPasQ7M/Sxw+Iroikmd8h8O/vBNfaERywbyUSnYtre4
	DDvf+5emUG7aVLSYhGPILUvLOy8T5sRlvKGscQX2xhqsJN5TI3+tG5W/p7PNaZ8cXvpBLdrZaNINW
	7N38+SkN2c2ufgh/7vwofMbi0t3A9jkJl12eXf7dO8MqxBHhXkA1Md6X07O4BnwSPu39l7iw/oqRI
	9WwRxO9zMnjoTNSQlQaeP9A8/W3k+6843eTzw5A5bYhPdbVvAovXLOrsR56HjRZqFW3bBFFfuzVJL
	ih/9lw7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXl5-00000006DSK-2Y1q;
	Fri, 03 Jul 2026 06:52:19 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXl3-00000006DPC-2nC8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 06:52:18 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c1214350188so19905666b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 23:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1783061536; x=1783666336; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q8e2F85Jk42cknJBTKAisusI5iJFywDQWX2RRkkLus4=;
        b=il7vmirEhdQFfA4R3BrSMCP00dXiUJtDr/J4HyC9EXpzE60uICwOG/iajEmXHa4Cu9
         YVpl/bxwayYFp8VaQlknCIwft48jwftEMq+0x0keBatqrA6e+vovY3yz6O/lrGTE8abs
         aKdpwwbTYkneLKfQXdX5aOHCCNgjeNa68QnOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783061536; x=1783666336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q8e2F85Jk42cknJBTKAisusI5iJFywDQWX2RRkkLus4=;
        b=JXsEctJQ4Ad0s94Al63nEaiTttmbVJnyQOyH1X7h05furEwTiVcEiJ9OB1zdeyGuOp
         XNfiu9bbBQgFzneyc0feLmoJVWMEHIESR3MYPqDkFZVEaipcn4InM6km1lIQkvUGQK8Y
         AliIh3zBvNHz9ZRJbJaVGRWf9JsprMMntzEUWk+DlI+XeDK9M/D2aq4iuc/Gb4mDQX54
         9eApNAomHhEf5QhYQRUYbri878NJ/KTGkhF5Yyl1R4YbkhKBMMLblUtPcQbP3kFHUA8u
         Xsxul6ZeW1IPC0Hce8tsrP9fLSGhK+ncjxta1PTXoJWNbCsDV6zOsW1+UxsLI6Zb95Yf
         WNRg==
X-Forwarded-Encrypted: i=1; AHgh+RpEA0nGjR7FZWETokqF4RuiW9Utyrv5NckvbHOiqJT3u3HXlnviJGebHtNdPG7wZcEQQCu5ssdza/lIaLKJgxwf@lists.infradead.org
X-Gm-Message-State: AOJu0Yzgr7D9rgrLFyEOGtJ1WVUMfRsZ4FeuNIVHQ5gIq8BiYiGY4CLO
	ry5KPIw1yNiEgqxoApeRZlh3Cm/iOO0WWCsX3/SfVymqneZ5se+MQhVs0ZO//azt+vA=
X-Gm-Gg: AfdE7ckF1PXXRCJHeBhNiSBdiKHL1VKkWBFTN6+tX3k8dgAX4W8M8rprHxpHdEwR1v8
	+kius9Tfda9u6OSTuSzNcBuI7zbSaCla9bF/3QkCw2s9qt5oPkpkYKDZIx/QqRNUn0k//WzfNfn
	Fg0d/vqTxHyR6J11FBtqo3KKW5V6lDfCO/ziScs/0DfNwXUbQ4zeS/qbBI8CqeHBTwjjyph9gRy
	V4vlwOpkDqwfWDiLb7MTDmgaCuQScjNsPnsPSylu4QpeWfXYwueH269gMM8DYA0Qff7bJiDvhjK
	+Dr7GyC4MZIaULKM5vc5wEDYTMDtAfYfY7oxrFRdgCOTX2otdCJINPOwbRxxhazgmXEW9OfXO0B
	omSQj4sDf9FBKlhDQ8ymK77/Qld8auRn3DcRZxgJIF8crPw6RzVEvnxRILtg+qTb9wq8uvIu/aH
	29fOP5DaHtIktMpsyER0q+tDC/VRqew3QrLEWCGugCF8+HUQuOh5n3vLr0K2Hl2qYZL9votnW5L
	VDAN0oFkH8=
X-Received: by 2002:a17:907:1c21:b0:c12:7b3f:6c15 with SMTP id a640c23a62f3a-c12ae8ef9c9mr438232066b.62.1783061535590;
        Thu, 02 Jul 2026 23:52:15 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.43.95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4695sm235462866b.44.2026.07.02.23.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 23:52:14 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
	domenico.acri@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v7 12/16] arm64: dts: st: add spi1 pins for stm32mp25
Date: Fri,  3 Jul 2026 08:49:02 +0200
Message-ID: <20260703065110.1433283-13-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
References: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_235217_720184_598EA33F 
X-CRM114-Status: GOOD (  10.11  )
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
index c816a6aece47..4e570e2e5157 100644
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


