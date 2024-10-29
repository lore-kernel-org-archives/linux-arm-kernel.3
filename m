Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D22BD5B164
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 08:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TdLVHEgAnDeeZJpgt9lNzYa9R3kdXRO8iLaUE20D1e4=; b=1JLe42I2txgyQ/mnL+RGRxLmcE
	ReP2eJnL2yOdo9Q8tV2VboQ9gEFU4fpyZvLsgRrHh4p2AMm1vucUpjHZKj93rjqhQxWXWepkiVyuh
	AhBHoBs0Qt/ZYONA12WjZV2FfC9VK/rVSBry5fpsSm7r8qYqazds2e3JLbkeWwdhuvv1ptzvovVgO
	2Yt41H/FVsh+pcgiHiKMONiDheRUB5ZehAX0+GpKdi5jTENcxCWVZwYC3SMOKF/zSjqecK2IaSQkV
	HWPdq5vvoEzu2cHfOpTwXpEo1kYeTOb9OnugzfPphLMKh77jcuCzEgij0uU7wZ4E775zOoUDmj2bb
	fiNeLTWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5hO4-0000000DdtV-1jvs;
	Tue, 29 Oct 2024 08:15:36 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5hIn-0000000DdFJ-2uGW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 08:10:11 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4315ce4d250so6349845e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 01:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730189408; x=1730794208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TdLVHEgAnDeeZJpgt9lNzYa9R3kdXRO8iLaUE20D1e4=;
        b=OOaU47vElsx6jOEK/HspKyiqST304+oxn2RwndoWwORmsPtga5MgEPE9PVmnZITmkh
         5cfjeSYZN35XDjyBarexQQ9+uRT/2S6nHRZeWh4liB9QifkRDn/3YcotsmgESp2MoI1V
         T9aTEmfvvANqD4ZYTSDA4/1+SHhodkxoFmfW0vQo/2RDsQ0sdk+VFwqB08SfOka8/bUE
         uLxVD6ugBA8sHSxrVX0p35M0SWKwJvSipaq64xBx8K5GWyF7H3SR5YKPSmy97cxSiT8y
         mfMXYaUDghcy2THyQbPj7BQfvVaqga8hKgRTa/Xm8ScxgV45B3ZLCUVTC8+rEsDdPl27
         1xcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730189408; x=1730794208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TdLVHEgAnDeeZJpgt9lNzYa9R3kdXRO8iLaUE20D1e4=;
        b=jeziIDDw6rQi2WkCgJtUT0Cw5d/mzR4ew6YDbXkiEER331JhKbaQF+5YbmVtbyaHyD
         Dv5bNib6PAQl/821c5UulWTMq42IFSl+om7YnUxG0ADu7zDchYOtWqDtAmZR0LBYYAZO
         /7jfj41rGrtTbN/UGX4HSeFvYFuzsTSNQoy34KreTIa/qHyMwQAopvDhBNSXXDS2RDyT
         iJ3/lLK8LO3R9ZQJHDJsjo9Jg4BHx+7vYfUYogt2iyBQ/BEMJiiGNeA1VUlNYrNQ8ZX2
         ZMVfSE2U144hK2rWmnpoICshj+S83OsEqmbhXCHYwXCFAEOmCF8Xy6qTxEQLE8kiO8UV
         GlOA==
X-Forwarded-Encrypted: i=1; AJvYcCWyyToGSSfTyVSplz08V0iHj9uJcO7bSAJSIWLbpV6eI0/Te9xw84ksgylnwzJrt56ncjRfQrK6NhVSmMTtwJxS@lists.infradead.org
X-Gm-Message-State: AOJu0YxHGNgzMRhI6w93im6toNnDKSjeU51fKeZm5bZ6AbiEU1TW7hLY
	hecz1B297fGU4z8Aj2GGz4jeMELV7zGPjBHiH+kO81CwieR0c6UWQE8iN9dLK8M=
X-Google-Smtp-Source: AGHT+IFPu2wMrS/euT8irH3OgZ7YJEZf2yrxBrSR6HBa5Xa5vaMAfjGfZ6Uj/qbvaqrEJ8cQwUIugg==
X-Received: by 2002:a05:600c:1c91:b0:42c:b9c8:2ba9 with SMTP id 5b1f17b1804b1-4319ad2b318mr37979105e9.6.1730189407813;
        Tue, 29 Oct 2024 01:10:07 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b55f784sm165467485e9.19.2024.10.29.01.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 01:10:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/3] arm64: dts: samsung: DTS for v6.13
Date: Tue, 29 Oct 2024 09:10:00 +0100
Message-ID: <20241029081002.21106-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241029081002.21106-1-krzysztof.kozlowski@linaro.org>
References: <20241029081002.21106-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_011009_757423_6AEB3AC7 
X-CRM114-Status: GOOD (  13.15  )
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

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.13

for you to fetch changes up to 0a4907eea61d1b7d602a817f6c1de31609c48367:

  dt-bindings: arm: samsung: Document Exynos9810 and starlte board binding (2024-10-27 20:58:44 +0100)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.13

1. Add new SoC Samsung Exynos8895 and new board using it: Samsung
   Galaxy S8 (SM-G950F) mobile phone.  Only small support so far:
   CPUs (Samsung Mongoose M2), main clock controllers (FSYS, PERIC,
   TOP), pin controllers, SPI for cameras, timers.

2. Add new SoC Samsung Exynos990 and new board using it: Samsung
   Galaxy Note20 5G (c1s/SM-N981B) mobile phone.  Only minimal support
   so far: CPUs (Samsung Mongoose M5), pin controllers, timers.

3. Prepare for adding new SoC Samsung Exynos9810 - add bindings.  The
   SoC DTSI was not yet ready, but it is posted on the mailing lists so
   should come soon.

4. ExynosAutov920: Add several clock controllers.

----------------------------------------------------------------
Igor Belwon (4):
      dt-bindings: arm: cpus: Add Samsung Mongoose M5
      dt-bindings: arm: samsung: samsung-boards: Add bindings for Exynos 990 boards
      arm64: dts: exynos: Add initial support for the Exynos 990 SoC
      arm64: dts: exynos: Add initial support for Samsung Galaxy Note20 5G (c1s)

Ivaylo Ivanov (10):
      dt-bindings: arm: cpus: Add Samsung Mongoose M2
      dt-bindings: arm: samsung: Document dreamlte board binding
      dt-bindings: soc: samsung: exynos-pmu: Add exynos8895 compatible
      arm64: dts: exynos: Add initial support for exynos8895 SoC
      arm64: dts: exynos: Add initial support for Samsung Galaxy S8
      dt-bindings: clock: samsung: Add Exynos8895 SoC
      dt-bindings: timer: exynos4210-mct: Add samsung,exynos8895-mct compatible
      arm64: dts: exynos8895: Add clock management unit nodes
      arm64: dts: exynos8895: Add Multi Core Timer (MCT) node
      arm64: dts: exynos8895: Add spi_0/1 nodes

Krzysztof Kozlowski (2):
      Merge branch 'for-v6.13/clk-dt-bindings' into next/dt64
      Merge branch 'for-v6.13/clk-dt-bindings' into next/dt64

Markuss Broks (3):
      dt-bindings: arm: cpus: Add Samsung Mongoose M3
      dt-bindings: soc: samsung: exynos-pmu: Add exynos9810 compatible
      dt-bindings: arm: samsung: Document Exynos9810 and starlte board binding

Sunyeal Hong (2):
      dt-bindings: clock: exynosautov920: add peric1, misc and hsi0/1 clock definitions
      arm64: dts: exynosautov920: add peric1, misc and hsi0/1 clock DT nodes

 Documentation/devicetree/bindings/arm/cpus.yaml    |    3 +
 .../bindings/arm/samsung/samsung-boards.yaml       |   18 +
 .../bindings/clock/samsung,exynos8895-clock.yaml   |  239 +++
 .../bindings/soc/samsung/exynos-pmu.yaml           |    2 +
 .../bindings/timer/samsung,exynos4210-mct.yaml     |    2 +
 arch/arm64/boot/dts/exynos/Makefile                |    2 +
 arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts |  126 ++
 arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi | 1094 ++++++++++
 arch/arm64/boot/dts/exynos/exynos8895.dtsi         |  386 ++++
 arch/arm64/boot/dts/exynos/exynos990-c1s.dts       |  115 +
 arch/arm64/boot/dts/exynos/exynos990-pinctrl.dtsi  | 2195 ++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos990.dtsi          |  251 +++
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     |   50 +
 include/dt-bindings/clock/samsung,exynos8895.h     |  453 ++++
 include/dt-bindings/clock/samsung,exynosautov920.h |   47 +
 15 files changed, 4983 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos8895-clock.yaml
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8895.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-c1s.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990.dtsi
 create mode 100644 include/dt-bindings/clock/samsung,exynos8895.h

