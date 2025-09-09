Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6DBCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 18:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NB3rahRir377R/zsN8HMeSS97H1bc/fP4p5/jH1URm0=; b=nS6i6ZeqUiEiaeF/B0PKl3xaue
	WiWNbuYMJKuZPuzyl9SG2SG3VK5qCGFgmg7Dw3qfczZA6RiqqrsGEuNdDyF3D97OEaEm7anIMJP3X
	mX08iOxm7zdVt0Wb0lqiigUZ933ftLZjN3fymC9NJrSryz1gn4RzZbpyOv4AXtuXudYWJuHmziNJx
	ar+WqMDuP2bhMItab66IfTQc+F2o650SRynWlouMNI0JxM0VHe/alBbHs4oXEFApWeAd+uaIICGy8
	CheMlqpbxzrR6ySx3bRqDBhOcWnTWWal0fkzdspzuOj++aV0I4hecATYJYXQ7Lo6jdwhXFgIX+qfC
	PA/upBWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw2f0-00000009HwY-3Zie;
	Tue, 09 Sep 2025 18:01:42 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw2ex-00000009Hv2-2krB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 18:01:40 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-aff17215facso67949466b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 11:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757440898; x=1758045698; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NB3rahRir377R/zsN8HMeSS97H1bc/fP4p5/jH1URm0=;
        b=GwIMEakh+fk0oMWmpLQVFBiaTW9taDWrBJx/sMTnYV40nhbuWx/uOjOWZt4cgwNheS
         PUXIs9/IZgjbt0LPgaxKjDLwW4WMIT5SVsvcjajL8DimAbh4L5hGhNBCIZnN/R9P9dnt
         XK4T+kyaeCeajBaxWAsQ2VwwdWL4YTqXzGpnujhYTumIMQTFNn19olRwgGTHCXf5qbMg
         aXbtTdSAOatKikURwKEJWWVia3+dcfTsvq3ZCDZiiKixNi0e4/Otnh+aQARgLlgUJm1U
         Hjvi6teJTo3fHj4LXXJYBiJyA8zUfrOEtWAcZP+RG1SxhVdLM4wPWLCSSTdttpjMpQ4x
         46nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757440898; x=1758045698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NB3rahRir377R/zsN8HMeSS97H1bc/fP4p5/jH1URm0=;
        b=JKzru7HqueLqWmkanW9Mjkz1hHCOxp55ElJHSUwDv9ibpUvLaS9/TmfqRPDIgtk+ml
         35kW2iwlRcfD9tPgSiIL57LK4tJ6BAZHBeCBvpg8WYghIErBTBrGH4oq5G2EV9UcqjXH
         hmLbyNllr1k5yF3VeolNhIWA2sbpDSjS1m9+AzDcdxKUWXWzMuXQkJxy06N7l5w36ZMy
         s3wHf9hUSumW5nOnIzKDVeBoyXEoUOLlJgk5RH+V99DsENtdsfjryKd1YuA4RM8qKFHM
         eAfHwcEmZvjXEqRt4coIkSdci36ni4PXvfd9+7akK/+YJC1NLdbXfZ9YMhMeYFWSzVmZ
         krkQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4waqQND1RYZqTE5K6paN71Vm/jp9K7XVSadFM7Z2sfWUFTBczFlpBjvQyN4yORleIzm4oizqBvfEyAdI6rUBw@lists.infradead.org
X-Gm-Message-State: AOJu0Yxsqy4pSbafCpWgGyIsR5HD+Hg+Go9cDdKQZyBCo2WoBqPVG9gF
	QxinTxkqUlgE9riAjxJf7roOa0QAdg/INLePtL4G/TTRO95BwYb0vLgT/jfVVb2KQ50=
X-Gm-Gg: ASbGnctY0OwT2sTsN9MOHXSPlNGpAwS7B2MQyBj8UiRPJgzC0hKGCodA9K2/mZBZUOp
	5kAMrcePlfBxybzIUrvJY34P2MxtTI9j+rhxwyrMHvjtzaEgWnuKsZe3ciJSZFYPqjP0I06wPN9
	L7Wu7ygdm6SWI8mRq9ZIwrZGnyGiHLWcOI2ZyRSW/KkRRa0UGQWEw6N8jRljbYAqg40IVAYOEHP
	JctTgwVItR5zNHGzJc7HuBcQuSTELg8kS5AvL1fkRXuBq5HtDyTZUAMe26lJwNwKMcCOA+CuRnP
	Mc8AL+he3pCSOX5/WiL1ue5HxIWOHe7warxuqqwd61Mi8I1ajBxkqyc3oEawYth6vCAubqRRLxM
	KkOi909Drfg8TB1ZHyI/yPUcrvj/0QJSU9UYMmkWFbeso
X-Google-Smtp-Source: AGHT+IGXL1lC6sfR6puzIfYw5N3tfqCgjfuu9nQRbjgZ453UE5FzV7MG4pX6BoUszCm7i8a3ZjXp9w==
X-Received: by 2002:a17:906:c113:b0:afe:af91:2e54 with SMTP id a640c23a62f3a-b04b16e17ffmr664688966b.9.1757440897721;
        Tue, 09 Sep 2025 11:01:37 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b078334e899sm26294666b.64.2025.09.09.11.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 11:01:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/2] arm64: dts: samsung: dts for v6.18
Date: Tue,  9 Sep 2025 20:01:27 +0200
Message-ID: <20250909180127.99783-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250909180127.99783-3-krzysztof.kozlowski@linaro.org>
References: <20250909180127.99783-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4448; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=lPSneZP6QA4IVA2DA2vcr6ck9xWg1uRXp8PmH5pXh0g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBowGt6T0IuM1YHzvBZgMmsxOPoA4RqAtH4l9R+s
 O/+YUMZ7M2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMBregAKCRDBN2bmhouD
 13ukD/9SHoOx8xFBNg3/qjAVgkV/PKibiiWFgSvp6djzxC911MYrbS7OtoTWqyhX0xK0iyHuOW7
 PN8neHL723EiARZT2emcAKewRCoVR+JIpupio/HkHlJB6y5vbgjg2IenEfimryx1cOrMNfqZQ+I
 cNO/zF9Ju65IZy3iewiWmkDa+fU3bmvaghQAFUn06v9pwFskOwx175V59C8dhz0esy0AzJ4WOle
 CynzK3kMyxW0zgMCfY0VJlb1tHLT5L3aKshyCcMyWobfXTYUEtrgMg61ixGjB5+N0mzpfsBXAIl
 RogLQahDUlFbZznXU9t2i+3p95Itak+WQIBELc+jNYF6nQ3sPzbnbrqN+APvTbzk5wGb7Qxda68
 YA7TQzvqUOy49Fs3M96g2MNNXPMAklgxHapdg/vZfpUPUUcANjvQUt0NAVSh1SfeiR7iJ6+XyCc
 ZPN1xATGm49wV0tIklKkRCCumCv7bcL+8N7uLz5UO/47GrBVJC2iKUxxSWs+mqzVczxOwqz7/y+
 mwDLOiqF44cEj8+rYp4ZVPV1knxExrSErXOhIFKAZabB6EEaJ/L/RLpMs7/6NZTAhFKbF832zDp
 soWki6uSTE8O+5IY83+E8U9FPyZM7SedwJ+wVqxLn2RE675/djB6hWgnzx7u4RDJ0Auo4oHsWdJ f9vWGBZswpSDS7g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_110139_722901_4E5D32A4 
X-CRM114-Status: GOOD (  12.87  )
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

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.18

for you to fetch changes up to 44b0a8e433aaad8aac51593a052f043aeb9a18d1:

  arm64: dts: exynos990: Enable PERIC0 and PERIC1 clock controllers (2025-09-07 11:13:06 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.18

1. Exynos850 e850 board: Enable Ethernet.

2. Exynos990: Enable watchdog and USB, add more clock controllers.

3. Exynos2200: Switch to 32-bit address space for blocks, because all
   peripherals fit there.  Add remaining serial engine (USI) nodes
   (serial, I2C).

4. New Artpec ARTPEC-8 SoC with board. That's a design from Samsung,
   sharing all basic blocks with other Samsung SoCs (busses, clock
   controllers, pin controllers, PCIe, USB) and having media/video
   related blocks from Axis.

   Only basic support is added here: few clock controllers, pin
   controller and UART.

5. Several cleanups.

----------------------------------------------------------------
Denzeel Oliva (1):
      arm64: dts: exynos990: Enable PERIC0 and PERIC1 clock controllers

Igor Belwon (5):
      arm64: dts: exynos990: Enable watchdog timer
      arm64: dts: exynos990: Add USB nodes
      arm64: dts: exynos990-x1s-common: Enable USB
      arm64: dts: exynos990-c1s: Enable USB
      arm64: dts: exynos990-r8s: Enable USB

Ivaylo Ivanov (4):
      arm64: dts: exynos2200: fix typo in hsi2c23 bus pins label
      arm64: dts: exynos2200: use 32-bit address space for /soc
      arm64: dts: exynos2200: increase the size of all syscons
      arm64: dts: exynos2200: define all usi nodes

Krzysztof Kozlowski (5):
      arm64: dts: exynos5433: Add default GIC address cells
      arm64: dts: google: gs101: Add default GIC address cells
      arm64: dts: fsd: Add default GIC address cells
      arm64: dts: exynos2200: Add default GIC address cells
      arm64: dts: exynos8895: Minor whitespace cleanup

Ravi Patel (1):
      dt-bindings: arm: Convert Axis board/soc bindings to json-schema

Sam Protsenko (1):
      arm64: dts: exynos: Add Ethernet node for E850-96 board

SeonGu Kang (1):
      arm64: dts: axis: Add ARTPEC-8 Grizzly dts support

SungMin Park (2):
      dt-bindings: arm: axis: Add ARTPEC-8 grizzly board
      arm64: dts: exynos: axis: Add initial ARTPEC-8 SoC support

 Documentation/devicetree/bindings/arm/axis.txt     |   13 -
 Documentation/devicetree/bindings/arm/axis.yaml    |   36 +
 MAINTAINERS                                        |   12 +
 arch/arm64/Kconfig.platforms                       |    7 +
 arch/arm64/boot/dts/exynos/Makefile                |    1 +
 arch/arm64/boot/dts/exynos/axis/Makefile           |    4 +
 arch/arm64/boot/dts/exynos/axis/artpec-pinctrl.h   |   36 +
 .../arm64/boot/dts/exynos/axis/artpec8-grizzly.dts |   35 +
 .../boot/dts/exynos/axis/artpec8-pinctrl.dtsi      |  120 ++
 arch/arm64/boot/dts/exynos/axis/artpec8.dtsi       |  244 ++++
 arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi |    2 +-
 arch/arm64/boot/dts/exynos/exynos2200.dtsi         | 1434 +++++++++++++++++++-
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         |    1 +
 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts   |   15 +
 arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi |    2 +-
 arch/arm64/boot/dts/exynos/exynos990-c1s.dts       |   16 +
 arch/arm64/boot/dts/exynos/exynos990-r8s.dts       |   16 +
 .../boot/dts/exynos/exynos990-x1s-common.dtsi      |   16 +
 arch/arm64/boot/dts/exynos/exynos990.dtsi          |   77 ++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |    1 +
 arch/arm64/boot/dts/tesla/fsd.dtsi                 |    1 +
 21 files changed, 2038 insertions(+), 51 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/axis.txt
 create mode 100644 Documentation/devicetree/bindings/arm/axis.yaml
 create mode 100644 arch/arm64/boot/dts/exynos/axis/Makefile
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec-pinctrl.h
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec8-grizzly.dts
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec8-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec8.dtsi

