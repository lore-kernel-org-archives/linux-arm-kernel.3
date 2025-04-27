Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2082DC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 07:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URqZNBSvISpfkOaSlJCBjJ4EBAiXVSB4aYiQ2cb72Ks=; b=dgUZy9SbZrFEkvmk53dwH9KxdP
	HFaG35Cm695ScmBOIRQnCJl+ufN5rzQoRRDFDnNYIeniZHuwt4MhOa6O1be8JqFgws5oMy2IvJUZr
	6hHLCGHntNGbqPJmb7EmJvAxIo4h4muz2bk1sKeLzm+bu87aedm52koCFYkg6wqcwYYmAi8ON2aCD
	ms+3I/rqsHavJPIGsasZWDxeqO8sUx2sLFz/aLxDOQdupKngmvZCFohOPBrn+grm+g8ZX+gijOJqC
	jMZtky/Jgqzu2kdcI2jMOKLgU5meDSHT7XtjQe9kUICgldiDMWjvt+3H+5diAFqH8SEOEj8CuaNNL
	u+nfEIuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8wrp-000000038Ji-1ZFM;
	Sun, 27 Apr 2025 07:56:01 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8wgS-000000037EX-2eQH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 07:44:17 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso17154955e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Apr 2025 00:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745739855; x=1746344655; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=URqZNBSvISpfkOaSlJCBjJ4EBAiXVSB4aYiQ2cb72Ks=;
        b=Z1VAJGgCEADTAweXRZVp/WvOdqK/mH4yf1L0DH+zOqKGAdCxSjwG2GOK0A8ARdPgyY
         7ggUbA7Am4Vexgh1x+KqRyGhqd+j62ZsPrz+91nAOW6GfkllTHSIyp9pMt1RR5HAPHaO
         xYODaGh87pPqn6uOVh0qTUHKtzdMQ+a5L5CZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745739855; x=1746344655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=URqZNBSvISpfkOaSlJCBjJ4EBAiXVSB4aYiQ2cb72Ks=;
        b=X2abHV/QlPDseA+Q6SDkAgvVbCYx8ITbHL3zYv3rLNFGgP7oPeWF9UlOWtlDKLX2jp
         Uv+Y2Q7PunER7WGpIbzcuGCTbuLTcYFljAjJnutRAnBfDx+kFGfibLBeKQTiZxeZ0eRI
         qZDpbDhZXj3r9iLqSCfix+22f8WUYmrq1zJDxojqtCIJdH91fs86IyLjoDhzgJwopz8j
         V7I7sr7axn9XufKzo9xgTAB633pe3EHSDllLCOxO37km8jVCf+NOEY/duQiCv1t7gmQv
         X5rLo82RjOBAQ2F299V3CTD1QkzSgDD9UXswJtSwO053+NCoAwMtyUd4mqkGL2fKVXtm
         0hnw==
X-Forwarded-Encrypted: i=1; AJvYcCWjyFQQnHhlUDcD8zBNETeyOBetj2GITdSjxzomp4zcg6z7RqubYNf7yPvXQ8VkTOL4TOfWd2QRaQ7OnywLVxsw@lists.infradead.org
X-Gm-Message-State: AOJu0YxFoXxlTQOG29LJwCtQzMUgnPTW9fs7sM/2+ILvEVZgMyJVmpwf
	mW1KD03hO4zNjFR6spRifNbRsnH7Ba+h/nCI5zw0iSz2655EV9Xzp2UuMppccnI=
X-Gm-Gg: ASbGncuQWFvRRecbVZ55aNywKBZFz7302NdW+edKXQ3varFze2vUXPGNtGhOQMGmuKp
	Y4HNJW8cbnfNGOc87kDx++Bf7y1Ds0SMJ7wCUcZiDy98FAzawOvP9/ntjGN5SsVJUKwx9lC7zPa
	5XehBgyH2uYtfq51O2W19hbCK0GLuc0ZBLjiZOGV81sTVZQgIW1eD4vZTYx530Lrre9aeQxsKhB
	rGnWKB/4x5Hmwzpi4W6NW36nJ2/8dhFLcu3RnxXQoWX7PK2EtaIztqlCDtfPjMsvp3FWzsHKROD
	81L7Y7KRbe+1l8s1yIemTftbe+91sXNH6ph8/qIFMGT0urop1Dviw2PkEayMSD5fGBMcYTeOy02
	U2xT3iA==
X-Google-Smtp-Source: AGHT+IHhG82qhDLAZy00txDJNFJskd3rBxAaXWQjSVQfnIUphGYgfQ2PTE3YQPQE1g+s3Wfi/jBgwQ==
X-Received: by 2002:a05:600c:3d0b:b0:43c:fc04:6d48 with SMTP id 5b1f17b1804b1-440a6346aabmr74474805e9.0.1745739855396;
        Sun, 27 Apr 2025 00:44:15 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f8915sm87682015e9.7.2025.04.27.00.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 00:44:15 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 5/8] ARM: dts: stm32: add uart8 node for stm32h743 MCU
Date: Sun, 27 Apr 2025 09:43:24 +0200
Message-ID: <20250427074404.3278732-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
References: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_004416_668795_1E206CEB 
X-CRM114-Status: GOOD (  11.01  )
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

Add support for UART8 by applying the settings specified in the
reference manual RM0433.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/st/stm32h743.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32h743.dtsi b/arch/arm/boot/dts/st/stm32h743.dtsi
index b8d4c44c8a82..2f19cfbc57ad 100644
--- a/arch/arm/boot/dts/st/stm32h743.dtsi
+++ b/arch/arm/boot/dts/st/stm32h743.dtsi
@@ -211,6 +211,14 @@ dac2: dac@2 {
 			};
 		};
 
+		uart8: serial@40007c00 {
+			compatible = "st,stm32h7-uart";
+			reg = <0x40007c00 0x400>;
+			interrupts = <83>;
+			status = "disabled";
+			clocks = <&rcc UART8_CK>;
+		};
+
 		usart1: serial@40011000 {
 			compatible = "st,stm32h7-uart";
 			reg = <0x40011000 0x400>;
-- 
2.43.0


