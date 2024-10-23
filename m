Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB435D2E03C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 09:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o3oz7XzRnYr4BG8E7Y3NV1EOsqUppoM4Gh7wTtLxU/8=; b=ZOHBMSyL/B2F2Wao6EA1CH5jB0
	1D4+kMfOcYswAuwxsdyl5TLMzd0Rs0K/Yb2jlNKe0981nIbhLdWtloH4si2fJ+r8RS0V4oILKNbNc
	bLoLfJGhGoR8wGOJkrx0WmxPitQvZm/j10JscJTzdDWi2XAI3I4PI/FEighf1cJXGgriBJ/RgQhr2
	2eIMR2Xjh1k8tdFbjMODClGY71eVnG2vUFHE1iT4qAMYTF0t4njhz37qky2ostuvcm+ovG7B2veIC
	8spnzKOm43v227cbXjRnksxZbm2MVjB1qdigB+/xBCpnqkgC7Sy2xM6RdifSRmyli5k9HKzDGGyMH
	uHOSgZWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Xz4-0000000DrWl-158X;
	Wed, 23 Oct 2024 09:48:54 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3XVH-0000000DktB-1gH2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 09:18:08 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a9a0ef5179dso953197466b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 02:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729675086; x=1730279886; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3oz7XzRnYr4BG8E7Y3NV1EOsqUppoM4Gh7wTtLxU/8=;
        b=DOCEfSJEbprCsQopZCC0zpggH2pcIFxgQ4f9P/yNmv6kJNe8nPqcW7qtjJZG0pd1Rl
         q630i5Fzm+7IpNRKN/G0k+1vSCLATqO+G9Pp7rrKyhRM8ExjoLMEzINogyyT84PqbGXg
         4mEOazM9Jc+yJSoZh+zy6Ebx0Mr6FdiIO24P4cA9/t3V2eJjeayYZKWAaRPPZIH02jzn
         AuJq32q2LdwypRqkiKWNfmY0bqkP50xWueobeeujTId7MkiDXqn1JRoVsCG8fgFx7WvT
         WpeWMF1io+4OywDuQW8wa8YoduPyLWbwU9bFq2eDta2uRyRGNz05UjdBbXBDTgybSAdR
         V2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729675086; x=1730279886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o3oz7XzRnYr4BG8E7Y3NV1EOsqUppoM4Gh7wTtLxU/8=;
        b=AhuRR/vc/KyC1oQ3kE/KXuoN73eLELtkhwn5y70/Ex6m8fFD9/QzjBuYk22My75/d+
         mKuefp6tcofWAvtLfhTpKGI/VlAqdNX2Q8evi2NCVGcoBQo7iW32z5kR8b5KfyHEkbej
         i+0Z6dD+9LQk4vN2iRE8hwgjd3TFh2lAqWeY72IN3G0/+/23LSBkYH5lvr3b4+pZx/g0
         3rfMMTEhRfnBvhiVwuUry+qBoxgV6nOqadCshu3V2AlNUZ9emcEaDrEMzB0Tg/VwRRLu
         YeA5ssMRm3TicfGQqqnoJpmafQE1tUOh8HK0QN6Kt41PTWdNEhej5muALJx51lzwU30L
         a4DA==
X-Forwarded-Encrypted: i=1; AJvYcCUPYapauUWBD55gs4LEQFQp0UZUBljSxZWrwu+ckyQQ1hLrdFIzLVhFg9Mz7nBZ9AWm/HlV8RNPdZ+lARlmfnGw@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+43SSVouwd6ALrNsHQ/8ZQclfvuuxuwwueJhXk4B3cfQ1eEkN
	dL3AqB+G9k9WSZd2pLkUq/wI7t1YD97LdaIrC6O5ydVEsOHtEQKD
X-Google-Smtp-Source: AGHT+IELm5faha5fBkO+OkQZoZplpoZtIS6VuriIaHnZFiemjbiSkn2GUdkWdEFBi9/ZsZQzY2BP8Q==
X-Received: by 2002:a17:906:c150:b0:a9a:2afc:e4e3 with SMTP id a640c23a62f3a-a9abf92d226mr174401966b.50.1729675085910;
        Wed, 23 Oct 2024 02:18:05 -0700 (PDT)
Received: from ivaylo-T580.. ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a913704easm449177466b.107.2024.10.23.02.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 02:18:05 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] arm64: dts: exynos8895: Add serial_0/1 nodes
Date: Wed, 23 Oct 2024 12:17:33 +0300
Message-ID: <20241023091734.538682-5-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023091734.538682-1-ivo.ivanov.ivanov1@gmail.com>
References: <20241023091734.538682-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_021807_468212_5C6650E1 
X-CRM114-Status: GOOD (  10.94  )
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

Add nodes for serial_0 (UART_DBG) and serial_1 (UART_BT), which
allows using them.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos8895.dtsi | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
index e6c8a4966..ad50cd4f6 100644
--- a/arch/arm64/boot/dts/exynos/exynos8895.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
@@ -218,6 +218,19 @@ cmu_peric0: clock-controller@10400000 {
 				      "usi1", "usi2", "usi3";
 		};
 
+		serial_0: serial@10430000 {
+			compatible = "samsung,exynos8895-uart";
+			reg = <0x10430000 0x100>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_UART_DBG_PCLK>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_UART_DBG_EXT_UCLK>;
+			clock-names = "uart", "clk_uart_baud0";
+			interrupts = <GIC_SPI 385 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart0_bus>;
+			samsung,uart-fifosize = <256>;
+			status = "disabled";
+		};
+
 		pinctrl_peric0: pinctrl@104d0000 {
 			compatible = "samsung,exynos8895-pinctrl";
 			reg = <0x104d0000 0x1000>;
@@ -250,6 +263,19 @@ cmu_peric1: clock-controller@10800000 {
 				      "usi10", "usi11", "usi12", "usi13";
 		};
 
+		serial_1: serial@10830000 {
+			compatible = "samsung,exynos8895-uart";
+			reg = <0x10830000 0x100>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_UART_BT_PCLK>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_UART_BT_EXT_UCLK>;
+			clock-names = "uart", "clk_uart_baud0";
+			interrupts = <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart1_bus>;
+			samsung,uart-fifosize = <256>;
+			status = "disabled";
+		};
+
 		pinctrl_peric1: pinctrl@10980000 {
 			compatible = "samsung,exynos8895-pinctrl";
 			reg = <0x10980000 0x1000>;
-- 
2.43.0


