Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3616C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 15:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M/kNUTOdbC7EKSH5yBbwmpZAVzw6PRlNtho+61DZvd0=; b=vxVjMXIZcSx45sxGlA4t68kC1g
	sLpDHArXm+rYHvLjQMc7twYx5WAyk0ezJPugVOOHZNgJuybtMdUGM8Miz7PhFtX9AxIPaPIu6HdqB
	NIucvaG02USUbcvLzFmlrQrCG//rZ4BoC2/gU4xN5RgOGu05TqXSHp98XEYIe9RdlkAHN8S97Tu9Q
	LPbAdLJbMRDo+JdLIlGk5gckrJE6Q4jCgi/ywO6Bq6Btj2lvC3Ol9HZWvY75//867YyjSR7oCgc0D
	ZYDqIAjj2a4oJdTfgWMJlnfLnNsBfgWRuREkIquNFXUhFMjtRX/8BuHrYDqFGwtDFvqikcMse0OYE
	lYR0qyxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5za-00000006CeG-3VYD;
	Tue, 24 Jun 2025 15:55:26 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU45m-00000005nFn-3cpF;
	Tue, 24 Jun 2025 13:53:43 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-553644b8f56so486828e87.1;
        Tue, 24 Jun 2025 06:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750773221; x=1751378021; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M/kNUTOdbC7EKSH5yBbwmpZAVzw6PRlNtho+61DZvd0=;
        b=Rsqa9W8Kg/XCsfDiGfnofzkt2eWSsJKc+aLtx24WTRYuCGeK4yY8aO652tIbzUlUF9
         /YSwOaAS1SPI/cki3PnO22ommN5lltSZ3PZP/QOjIGG8n8OCZduZfwtFHNuDpUyGNltH
         PxZ9bQgJQFiJs3wueE1wkU+VjuiHRyTCexZg25ljWoYOKjaBabKRu5ivxRapiBO1pmBJ
         JwFsvufQk+evuI6bMcijw7i5DAhksk+XK0KEXR5DpTW55bLCXZDgoq4eJh4MHHAsMDyC
         pYTiy0pQZnJvbDgeQsGbNE6TpY3JIbcJnUQtVeSelaIOesXZ1+KSl1j7BqSXMia2rBWJ
         80Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750773221; x=1751378021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M/kNUTOdbC7EKSH5yBbwmpZAVzw6PRlNtho+61DZvd0=;
        b=pmO2C2XYh1zwdYMBRyLRnYedRxL8fkA40fKMsJIRLgQ9+lZsWk2E7lm4UYXqoJTDox
         Bm32TlevXTxUPJhGILWbMfw9Va9+n36WzaQFbks7Jd3LlhcNd92umG28f1N7t/buYOC1
         YvrD/gzZzBKN8AlOSy6GZXK5yWAw8nEYGCzzqUhBRZqxoThfYYqXvBkfG2GT369QzywS
         2cvoiI6xCDh69pjL4dBwgvONMxjTQrDk0xMrL4wRVDaZAmg1wzqhICP/mCR7nHzMD2bg
         vkR3DPk3OOvlarspap2l+DAmbztjq9EsLAym4nSu51tLAB+4In2vf8mFapZ4Q/zSecDw
         hcyA==
X-Forwarded-Encrypted: i=1; AJvYcCUvAVeQnPFcCH0G+wgEflTrnasqplf4iBc3FUCzaNjvEATjN+Ncfd5ZidQtDxAEuDlGhJI8EGQLuKZvTUuaR44QXQ==@lists.infradead.org, AJvYcCVrVpSbECxvxv5A3IX9JciAKswUL8I8xRaPnRe89PEZ1T1lUQZXwrA6lZo/ZmG1c3Fb/nN/QqtrEKjLqh9A@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0NjyMjOazXG9T6F+lalsGNBpFlocOByF5DEKjQVQ7gco29Nf9
	R4lCeqqOnPeDrT5ZfJew5lEPctNfyj1R6l2W4vvxEdP50kXo26h5CX2p
X-Gm-Gg: ASbGncuODMb3s3UfWCuIDPMYvGuBAJBVJT7WPTU5uhTGTleuRSTS7tl6jNfgByn6gei
	7shIjUgVjohyq6DdpxWMUVeX0XWXNWcqP8DJ/7t/r5nnAGjU/9GADfYaPoSgAeWz+Kve0d7NJ7E
	6B7wJl8mSL9SbU8DHDNfkoTxTd6ViIfK3veje2qxZziVrxYt1a+Lb0MSubiDhPdDBeCJlzJU/xn
	9QZBVhpiJTBPIm3+NMI8u0GaftJ0uYilsfISsq8VWuGGN4txR08Tr76xjTJbwNL1VFzwsnAkIrA
	bopixlyV3IR051p+MOS78dSwHeHw4sSJltL/ITgYeQnsxTQeshiOrU18OeknOzhZqtrLHLqbj+k
	37qf5yDZG7XfdBGFl13hl5dkBou6TBFA6O+W83bwD3fOMimvvCYIgCTrSeQTMXA==
X-Google-Smtp-Source: AGHT+IEu8py0reQYVPpn8LASHx/iO2R4OjsoWGj/5WkGy9D0unPBfn75Kkp+T1/d+Wm91hqFvsrYWA==
X-Received: by 2002:a05:6512:114f:b0:553:adff:87da with SMTP id 2adb3069b0e04-553e3beb932mr4323147e87.29.1750773220869;
        Tue, 24 Jun 2025 06:53:40 -0700 (PDT)
Received: from user-A520M-DS3H.sberdevices.ru (broadband-188-32-30-96.ip.moscow.rt.ru. [188.32.30.96])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-554e6dc186esm1282905e87.114.2025.06.24.06.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:53:40 -0700 (PDT)
From: Alexey Romanov <romanov.alexey2000@gmail.com>
To: neil.armstrong@linaro.org,
	clabbe@baylibre.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v12 18/22] arm64: dts: amlogic: gxl: correct crypto node definition
Date: Tue, 24 Jun 2025 16:52:10 +0300
Message-Id: <20250624135214.1355051-19-romanov.alexey2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624135214.1355051-1-romanov.alexey2000@gmail.com>
References: <20250624135214.1355051-1-romanov.alexey2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_065342_903890_A9ACACC8 
X-CRM114-Status: UNSURE (   9.78  )
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

GXL and newer SoC's uses the DMA engine (not blkmv) for crypto HW.
Crypto HW doesn't actually use the blkmv clk. At RTL level, crypto
engine is hard weired to clk81 (CLKID_CLK81). And remove clock-names
field: according to the new dt-binding, it is no longer required.

Also, GXL crypto IP isn't to seconnd interrput line. So we must
remove it from dt-bindings.

Fixes: c4a0457eb858 ("ARM64: dts: amlogic: adds crypto hardware node")
Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index ba535010a3c9..aa37358382aa 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -68,10 +68,8 @@ acodec: audio-controller@c8832000 {
 		crypto: crypto@c883e000 {
 			compatible = "amlogic,gxl-crypto";
 			reg = <0x0 0xc883e000 0x0 0x36>;
-			interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
-			clocks = <&clkc CLKID_BLKMV>;
-			clock-names = "blkmv";
+			interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc CLKID_CLK81>;
 			status = "okay";
 		};
 	};
-- 
2.34.1


