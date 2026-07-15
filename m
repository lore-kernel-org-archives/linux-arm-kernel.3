Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0E3C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 06:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q8e2F85Jk42cknJBTKAisusI5iJFywDQWX2RRkkLus4=; b=MHf562iXRrEqjLG4DPefBD8NYF
	uyM8ANLdNzJ0MJ6iWFPnwQWwTq3O2Cn6tbCkqqY7W435e2UCL6CVPwjLWze3NRGLe1FSMQyzsk1W/
	r0ZC2PFKlerePONOmGpfYs1hb5jFf+vr85p+uHzHiKK7q7y2rySv8566bp81N8q8yGuKHKRvl2Rn9
	iB4tIPEgZPfsUDx7rc2Hu0DpceZpGgUYHh3sj2JK2KhUZXwF2Kh19cKddp05GPqnzAiF6pd/tlJ+q
	z4C9WKoW4LKxLpNybiOZNZf6wcP0gHUaldbclXACICK7KikzIR0Jc9oi/FrE8kgGWU0+IXprgamma
	mRgLIKyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjt15-0000000Dsec-2ZVP;
	Wed, 15 Jul 2026 06:22:47 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjt0x-0000000DsVp-0AVK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 06:22:40 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-698bf053053so2734258a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 23:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1784096557; x=1784701357; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q8e2F85Jk42cknJBTKAisusI5iJFywDQWX2RRkkLus4=;
        b=gtnIyGM8mRtnonKuD4CsSI4YqbwPjXT8QEa5ROV0WNhkJNBp9ULkil2ywD/r2hvbkn
         ltjURF5ClLMvfTluAAX2gEfBEGOxYXczu0gwrQ0jI5DvGZeCBmjebkBxC70jbPDTzknD
         Dj6bnqAFP46PL6TUx04tplz0rz3mmAGrlIPn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784096557; x=1784701357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q8e2F85Jk42cknJBTKAisusI5iJFywDQWX2RRkkLus4=;
        b=REhLid7lOVoFaZ0xvvD4pypjKonzAKFeCps6P/fiYq9xwnZ0ISnqZ2QfgrcXI/PA8H
         cPrGIPOmz3VTqZzEcqafKOx4QweT4Q2OCG9CdbnQRueLTSOVuKIB0nFkTJV6JNx/ynbH
         WGcdd89NfUKO9RJZ1Gplem7bBesqcmCKsnAjtPsnSfQZSSoXA/Udtm4BQS5TGOmaBdFo
         aIFynl2K+z4OkyEwra5ltejiJprrYxolvnZrCDHjSIJL13bTV1iNhTuiOOJZDG3PiYzt
         H1PDkzCzYfMOyFOrXfEQI1DauSOCaoJE96tXeN6MmCFELY+klgyH8cFmzIR7QFndS3Yu
         6FoQ==
X-Forwarded-Encrypted: i=1; AHgh+RqplZYLnTfvTFxjkH546W9o487LQEC2+sBSr2gMHLo4WmsluNloycqkDnqW44lGokJUYa0loFvl/d48SppoaNC2@lists.infradead.org
X-Gm-Message-State: AOJu0YyG1iLd/H1qBW0kGXEQxyZRmUMcxGzCi1Rc+Oap+fsxGw3ILRaD
	zNMe++tpyTpTjnNlJpY4+ZlEPvc/ZTkXF9zq9imH9vnqC8TFUAji38qfEK56pA/aW+A=
X-Gm-Gg: AfdE7cmvSRXv6jGshuzquZXKfUGxBu8tluRGDzu8qiIpeVm73yPvoS7Gl+Oq21p66wc
	8xDahpbw/sJWjJiSGkIjPawB2hp9iexoZLmft4Slc98mysRQreQUz3dxu5Bqupr9KwWhsxu4rfx
	dOHsx/OZmJngD+uctEzqyUpBh3dl+ZQ86MC0nX9ylXBRWZblauSB8hMNElbrAnycidBk3rJtTJy
	/5tm+lVE5bwWiljf/2JmhILcDeHhQeIGsRT1dsdJ2pYdJBW9TvnRyFaNaAnuHQugFVxbru/9+NZ
	JYlaVFDd+WOGuDzJjTmOzTjfiixp0WX1VeAyzFEnD+SPd41KVsr9ACx1AeHbLgrkj+YEgBhJnOa
	zLkMoz6JFxR6QEjUcpv8A5IsGHyhbYr8nCJmgHbYbKGVbFj2F0zLSXkQXkf+nrRbUZIh2ZnsNPY
	//2SnjTBJDsanqyXo50uM0nCO0R+l12LGqPDsIMJ0te8SEdLh8McJ4CR4fqi/0HeckOJto3icrS
	KWClHF5RcYTviQWZ50MKwE=
X-Received: by 2002:a17:907:9d19:b0:c16:6f41:8bf1 with SMTP id a640c23a62f3a-c166f419610mr273689066b.3.1784096557067;
        Tue, 14 Jul 2026 23:22:37 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.41.101])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d0c3cf1esm1028820366b.44.2026.07.14.23.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 23:22:36 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	domenico.acri@engicam.com,
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
Subject: [RESEND PATCH v7 12/16] arm64: dts: st: add spi1 pins for stm32mp25
Date: Wed, 15 Jul 2026 08:20:29 +0200
Message-ID: <20260715062201.3599458-13-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
References: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_232239_105477_14A64753 
X-CRM114-Status: GOOD (  10.61  )
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


