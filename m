Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9214CD6E7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 12:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S0e8wESPhIuGnKBPbF3YDifoYbOSIP99q8OpeirAYTs=; b=OueNL+o4pfAdwncrlOFyyllMNS
	Hrx9KgAeYII7WpU5KNhvwj7apqQz49nWHU1jZufLWiPbTOHnFs58QL3A2ewaqhEh+ViHZ7gdXRolI
	Oi4Q9Zlh5GINE6ShvfLgHiTzUbbZ8DEbqvSQLSX9SAjrnb6UUGKCpv31T5aL1Lo1U3y7kpt3bxmX/
	7dhrzLPefXjlDy66fTj6XP4miDbXLUSHHAE7iKdEaK+Z1kARUa6iYD1X7fnEkvzeBu0nDH9wI+1Vh
	4wq2h8KNB9tQUzfr0KOCTh49TjJXwYpnb0/cQ43cZ7MOFfhsKaZ+cxkA54mSQOJ7G21UsPpOlsJMB
	YwytVrsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTXB-00000000bfY-0gGb;
	Fri, 05 Jun 2026 12:20:21 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTX6-00000000bZD-0g7d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 12:20:17 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-490af320e2aso21695815e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 05:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780662014; x=1781266814; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0e8wESPhIuGnKBPbF3YDifoYbOSIP99q8OpeirAYTs=;
        b=QzCaDTnC8qC7MuPCQKHO+KduiYG2vsU5k/lqG7CDWI93aJeHIF3jGnW0o0IvH2aov8
         9smmK+cPcyTKh3k0+41WUr42j9iTzTPIkeF6divFSE+z/HVAaILGvz+TfU8rHHOPNTsV
         tfcARYwjfIBOE7R+ov9CIRIKQj2oo8uaP6f0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662014; x=1781266814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S0e8wESPhIuGnKBPbF3YDifoYbOSIP99q8OpeirAYTs=;
        b=dcGvsPu9fsvwJPfdnhBbn5u0ijksPxIJDAR8kPKq8fGcxVdrCMMUucQ3nS3LBV83WW
         fJxaG8wxuCSz51tEos2gHROEbtkHXq4TrIJ3Ril2YTm0Rav2zF2jmsKWeA9nriNQX+P5
         o0YlGPtRr+sNJ8AstPL/GaMp9ovQlS5KDM+GdCiTCkMHlKybAQM6DnavJPG0rEmHjA5F
         EAXMJ2mqO+xtSrFB7O2vq21NVTTt7ts9u/5h3JYthdJrSa1zLu/95Io2DtRcxea/fEqN
         3lw9KJcD9Dk41xXHSVopSatyI9HHiry1AyJr4nOgA/SIzSko8PGyaJH1MMNnXDvd40Z/
         cGoQ==
X-Forwarded-Encrypted: i=1; AFNElJ8GolC3zU2fPypMC959SNEoozxRlaQodTIoQgkbLJzYP66jm7Mln2IHKgSIKWy8BiIEKkL6q2CYlVO2FEfuR5Se@lists.infradead.org
X-Gm-Message-State: AOJu0YzEQctdb44MAq1JbdsK8KWAfh38PRsqEcoqS81/7RLJ0buZ1/0b
	/+RQGYwiH8MnRmkV0chmaiV/qqOMNdtze1b4HWYqx9UWHsYe85spF276h1ocmG7EqI0=
X-Gm-Gg: Acq92OF+emgOxwS9QPhegIYS+bh4/+jxDa1Bn9Fv4hGSwLPLx5k78KY199X/eD8WppL
	vbWCvC61umZ2aX8Fix4JcCvVwicOZaMDImHeldox5uk3oYR/bNIFcDjIBMfo2PXn+4ygFIhtcDj
	iazg62AlFIy0gYOPg/8Pcqvf6JOIXYsFhttNHukL350a/BUhP4ShTKP0WYl9b8ueZGJbpMj5jJ2
	rYFvt/npIZWRQGN1HjCiyEkGXs66lek5oQ6O5oa3TLR7GkGWAhvgGkCGQ48imE06q/ceGYa+AMP
	pxsW/dXbCuFex+zbgpFD7gZLstnhB9VbNPrthwQgj4/VJOrxazuza0wwDQyqkNnBAX4rmE15SM0
	KEBbjLOtugXizQUaaRzZnbnP4wXanYcLLA8olkjwQ6dhRioq58Oa7MESG3qPot/fyJgodbT9hL7
	RFfv87rKjMhU6+nquMi8pdwIZqCdstqLigowPJT3i4WK6IyBw3wEZsUZKRCCglrxgJFVBDIpsGG
	IItvldnhFP6hqfYnN6Db4An94sk0BXGgj5lnkkxu5DE5EnDHVUUjMWB8ukRrvChH/N2egbojTt5
	QYAwXm1BMhz6KASaJ1I0tv2tmFnsOyfci9iUEx8zbgnzoQ==
X-Received: by 2002:a05:600c:358d:b0:490:958f:2a5e with SMTP id 5b1f17b1804b1-490c25b22d7mr59154005e9.13.1780662014287;
        Fri, 05 Jun 2026 05:20:14 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm24785883f8f.2.2026.06.05.05.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:13 -0700 (PDT)
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
Subject: [PATCH v4 06/14] arm64: dts: st: add can1 pins for stm32mp25
Date: Fri,  5 Jun 2026 14:18:17 +0200
Message-ID: <20260605121957.78409-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605121957.78409-1-dario.binacchi@amarulasolutions.com>
References: <20260605121957.78409-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_052016_210298_E4F4EE4D 
X-CRM114-Status: GOOD (  10.00  )
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


