Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E517CA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 03:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KXjuorbWXcBYyzyLsypUMy+M+Ccbc45oTf2VM31XR8w=; b=Wm2cHJVfeR/xCIEYVo3aHW/BML
	THsDW+CsM8y/X6xhqhcFcawYmKDUGhO6XMCEwP9+xKAWU5XEPT3XTN4Xv09qECTGVuaa6R417kUil
	VUpy7EZ/vo8jqGQmT4Agk731YoYqzivqUAym/E71BvQ+xu1ikxkAYTMUBT3GFuE3oRAsX/3XzStcW
	qSD/kvn+PFFdM3N9RmkTMsXF1WKGCi9mC+N6bTQeQw1CchgrpXhoY7g3Hea5deKTUSeRdKz8fSrBI
	zzRdK57Aubnr5P5FmLOC0oVOe397w+05ZhnJz0HYfbmQ55BBEO/8L663cFOuaWlzp3VUgM9LApSfq
	EUwzVyaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC7Aw-00000007e2m-0tpG;
	Thu, 01 Oct 2026 03:09:38 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC7Ad-00000007dxc-3ZZi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 03:09:21 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso55177625e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 20:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790824158; x=1791428958; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KXjuorbWXcBYyzyLsypUMy+M+Ccbc45oTf2VM31XR8w=;
        b=A01naBkNlkliD2RjSOz4EOAIT+xwh5Mr+r4UeCLM5HTq0i/W+fsysC920S7/d9Fbz/
         cwypwDhEB+ZAR9dkEuurypklUvrpEnjiwrxEOjhD+8/0b2FoeAIBAuHcyLtybkh8agqQ
         iashVeXVz9DwB9gyUpmBjmBNp+I0bBo+LyPpFXmoFq4+B+r8wXl6Jzr9st5W9S9/AGbU
         cE+xy0/TDI5bYYmtxQrCKi8pD2etHPFIKtUZUR/OpXIy9R05ZN0XLPUsNVTW5QAT2/sP
         KhyjqI6EsYICXczFUbhsoEsYI7o8aph4o3z42FpZuLttUY2uKUa6ztqgzMo8OKOMK5+q
         ngpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790824158; x=1791428958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KXjuorbWXcBYyzyLsypUMy+M+Ccbc45oTf2VM31XR8w=;
        b=LjNcwmNVF8Q9NRTqqELm3vndyUZ2+s43vymQr96xqC3vrA4h3IdsB+BJTMKugbbQkC
         CSaf1L3HmQGf/yRq7WX5WTmlcnxH9UZDib3O77b7Br0aJ9a2w81DK3osmWS4V0WJHcSO
         lrh4nn8ijpJH6Gobp+nUEXxgHixosDMuWYetQl7E7CSg8FWi0QLu99kg71yKec2sRwq7
         n3EvB00tutRqdO8cd+BGqpRNQXVU9J73uaiYwzHZwrrP57UACawavirzX12ZuR/Wk3WI
         wxP/6z4H9WNP0qftDi9iXVUWxfH74QgbJzYH7QfcTtBtH3+MGYN+IF5V5rpeGunXjG4e
         191g==
X-Forwarded-Encrypted: i=1; AKwUvBz3zF1JRh9uavugo3Y5uZKlZkTjv83RNFUd0mO9NQ84eIvD9vnDM3Un8IJPT8Az+ccW2ZwW4l16ymKUQ2Z6RexI@lists.infradead.org
X-Gm-Message-State: AFuF++mgaWSJOiXlo3kGwETgwIp1LLQs2cB/vKlxApsE7k1nd/5d39bo
	2eULcTF7hDqm7selXyK0baTnM81p1eGsy9/Luggf7hO/IzDKISbVmiBhC0iboJExzx8=
X-Gm-Gg: AYBFou39XTZRQkuTkOu3JikczoL+sCitlWirIaFSe6b9k5l5Cyrmzh+pL6kpAsAYpbr
	Pi3Wz2Z2R1hpG0aevJ2ljkTKJy/qexNGafhGzBIX8nUewbMgEIsmVm7DOe+75AldmoG1INB5kiu
	J+GPkircbMQJ+28eQEK7o/PUngKS+jzgnmVYHUmuHqfL+zPhY3adMvQt5uMIROQOkozYAQh96nA
	tJQSrDwEaF+69zUW/PjwbgKuLgj9jEtVQzfa6Rmn55KbKjSL92BeTg9oPiapu8MCvO3uZHCY6sA
	4VdbA96A2XgmxZiNBwyKrMwkLul7k1Zar4i+3Gw9KBOjdOkJYeY61l0dnYeZrVFlzbXdPRhg+8j
	EhZKwigwJD6KMdVXa5fZ8/WCvqEhSoVpk+XwS1EGLeNcIpmyB1ldl5mpq19BEsx6ACiG5z83yHP
	JYnlKVPzr04DwIjViVbtWTuFgAdh5Di9lMir8LekenU0Uyl7r02jftA0wWA88ty5M1FxzYcJQMR
	oC4ckcPtlmqp0pTJmqGAMaTGKvm9IGKUE9BIna7Rc49Qnd2B+CftlO5f8EZIg==
X-Received: by 2002:a05:600c:8b88:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4a01ad98373mr52694045e9.4.1790824158363;
        Wed, 30 Sep 2026 20:09:18 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f9145e6sm27091885e9.5.2026.09.30.20.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 20:09:17 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 01 Oct 2026 04:09:14 +0100
Subject: [PATCH 3/4] arm64: dts: exynos850: add ADC node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-exynos850_adc-v1-3-791b3516bb9d@linaro.org>
References: <20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org>
In-Reply-To: <20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_200919_916090_71AFF71C 
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

Exynos850 SoC has the ADC controller within CMGP (common GPIO) block.
Add DT node that describes it.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 8a4771899a8e..eb87225a756b 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -355,6 +355,16 @@ cmu_cmgp: clock-controller@11c00000 {
 			clock-names = "oscclk", "gout_clkcmu_cmgp_bus";
 		};
 
+		exynos_adc: adc@11c40000 {
+			compatible = "samsung,exynos850-adc";
+			reg = <0x11c40000 0x100>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			#io-channel-cells = <1>;
+			clocks = <&cmu_cmgp CLK_GOUT_CMGP_ADC_S0_PCLK>;
+			clock-names = "adc";
+			status = "disabled";
+		};
+
 		cmu_core: clock-controller@12000000 {
 			compatible = "samsung,exynos850-cmu-core";
 			reg = <0x12000000 0x8000>;

-- 
2.51.0


