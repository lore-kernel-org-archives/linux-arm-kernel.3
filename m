Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A56AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 13:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QiIndNH9dEzlzGL7CyrOUWiq2FGP174uSAo7Crt9eYw=; b=DmZIzTkArb6jAs1Qw73PNLMzaj
	iWTDN7V0A3HpVehYzCFmxtolDDe7KcCNBFZd+WCKRBy6XPQlqSHAXF9GpKGvMowlAuC1JGGRH2/zK
	PPMBuHULfyvnP0jnZQaJTji7GxyJsuTneyn5HMER+1OIoSkwjQuV6mm+AtTeiVSo6osJLSflp33U3
	7uA/zJJjE29tD0hbHlquF1ZkqUT/thz+ZlTCzghnh7QVusVZ+hYhorksCMnpJ6TNWYRg3q7IwWiBx
	jcqscA3cNgJf4Hmm25M6loMm5t0wNV/2MkwnoChVK3MpAFF746M+A4Y9cbbAYIBns/4UOSg9rBkg2
	0NPU3diQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tScCx-00000007Fac-2aVY;
	Tue, 31 Dec 2024 13:22:51 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSc8F-00000007Er3-2wMC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 13:18:01 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43620a5f81bso9653165e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Dec 2024 05:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735651078; x=1736255878; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiIndNH9dEzlzGL7CyrOUWiq2FGP174uSAo7Crt9eYw=;
        b=QJ/E92kKdDEYPi0f7Qsfd1J/s+voJUz5ejOn8gV2DV0izXwR6fweuzXMVXYw4/uZeI
         pqgMVFe0wEwdAMM9cE9wCxpKHhbB04Gmz7qhyi00KDs/nfvOVN9S8xOoDdD+9UTstn4W
         r7pj6sxViyuXw/xTMwbEKmq0TeDenTwPkicCdAN/77pOF0D7/IAd1W8ANDGqnaCLiVXY
         4wt/LW1S5VcDnEn7NekXdlHYxvoyFYFKCzAo1ydB4dwI4lFKVmDH+7Nu42G8qofSvRvy
         58MfWtRa1o28GPd9wmTx1jFtZrVdt35EzMnZktQx9y3EzOazPddyMJf8IDKdGWJtNava
         UhWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735651078; x=1736255878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QiIndNH9dEzlzGL7CyrOUWiq2FGP174uSAo7Crt9eYw=;
        b=fihS1/VjPkrf+gRQoCyKZofD6GH2uu4aUVt+e0gLKKVLZ70vIqHAGlmlJutZl+9gNC
         +yzZwh2/RiLxPFfpgesCH4qAsd5YAmy/ckuy374qmjS7j2IXfxNlIcm0SOwrxhdiPgYY
         KlmUrqLhgyljlhxNQ4ioekGRetV5twBD3M1dFD7msgJ75/RlyqW57NYy9w0M6NeQZ2/o
         fgSvrqHzhosf/s0XPY+EUuKgDV+xh8IRCavngOOe7cqeQvBgOdCBry/bA/QTDqqrh8eJ
         ams+HqdHxE/6E0hHMxq5Se8c3LF7yc0QMmIV4nK9OkKBeiyymWFlVjCh/pOcIz5oLXN8
         rWqw==
X-Forwarded-Encrypted: i=1; AJvYcCWIg9Cv7PFeCLhl8Yu/+Kwdg3W3W3u+I6oRt/YsRFnRIiV2qIb54VOCQztYJ35aOqfXq5JuwRdp86wcUpz7ZHgV@lists.infradead.org
X-Gm-Message-State: AOJu0YyTb6BMPfmKwIjCycIa3vtYqSbQRriCw4NEdscG/h4bmNP1RpQi
	QdRkDp22PdAuf/I8PVWavVyj16wCWqDk+gdXBGKIybbSVOZJmfQSOjGFm80Bpfg=
X-Gm-Gg: ASbGncsnWBk67JOyrSfNHAhh8aKlcBQZTK06NLsY+EBrHf0BtpjuxtIU5Za62izkSKr
	rbbM5VsoxT3iw1O1VbVesSpJZsG//Aj5J6t8HU/AhiMeWZFv+uGzLtrC7aS3LRscL0DmNxfRAwR
	cOygLVAPP30h47X/yPsu1i9rzGF2Ub52iUuqUnSwF2JLrus/GGPUCFlWsb8qO7mnneUEK07FQ+d
	Un6kNxm9KMxpbLQmQY+kRsqNkcKX1genhwnAnTtDi+Ps4vySzzq5qQnTu273s3msq1vZGk=
X-Google-Smtp-Source: AGHT+IFVEtvYE67HJ7VdU/l5KrgWkC3CkvWsWK1hbjrDA7cq4LCs/IzDCew94Z0tCX56MEGV7xGI9w==
X-Received: by 2002:a05:600c:45c6:b0:434:fecf:cb2f with SMTP id 5b1f17b1804b1-43668b5e06bmr127243005e9.5.1735651078219;
        Tue, 31 Dec 2024 05:17:58 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b441bbsm420068305e9.40.2024.12.31.05.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 05:17:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 4/4] arm64: dts: samsung: DTS for v6.14
Date: Tue, 31 Dec 2024 14:17:41 +0100
Message-ID: <20241231131742.134329-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241231131742.134329-1-krzysztof.kozlowski@linaro.org>
References: <20241231131742.134329-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_051759_746055_3154D926 
X-CRM114-Status: GOOD (  12.56  )
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

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.14

for you to fetch changes up to f424523b1b516b3f0984feeb1d8218e904d17a97:

  arm64: dts: exynos8895: Add camera hsi2c nodes (2024-12-30 08:30:36 +0100)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.14

1. Exynos8895: Add UART nodes, PMU (performance) for the M2 cluster and
   I2C controllers in the camera block (HSI2C in CAM0-3).
2. Exynos990: Add Power Management Unit (Samsung block), PMU
   (performance) for M5 cluster and two clock controllers.
3. ExynosAutov920: Add watchdog and DMA controllers.
4. Google GS101: Minor fixes for phy and USB. Add USB Type-C.
5. Exynos850-e850-96 board: Drop gap in memory layout.
6. New SoC: Exynos9810.
7. New boards, all mobile phones:
    - Exynos9810:
      Samsung Galaxy S9 (SM-G960F)
    - Exynos990:
      Samsung Galaxy S20 FE (SM-G780F)
      Samsung Galaxy S20 5G  (SM-G980F)

----------------------------------------------------------------
André Draszik (5):
      MAINTAINERS: add myself and Tudor as reviewers for Google Tensor SoC
      arm64: dts: exynos: gs101: phy region for exynos5-usbdrd is larger
      arm64: dts: exynos: gs101: allow stable USB phy Vbus detection
      arm64: dts: exynos: gs101-oriole: enable Maxim max77759 TCPCi
      arm64: dts: exynos: gs101-oriole: add pd-disable and typec-power-opmode

Byoungtae Cho (1):
      arm64: dts: exynosautov920: add watchdog DT node

Denzeel Oliva (2):
      dt-bindings: arm: samsung: Add compatible for Samsung Galaxy S20 FE (SM-G780F)
      arm64: dts: exynos: Add initial support for Samsung Galaxy S20 FE (r8s)

Faraz Ata (1):
      arm64: dts: exynosautov920: Add DMA nodes

Igor Belwon (3):
      arm64: dts: exynos990: Add pmu and syscon-reboot nodes
      dt-bindings: clock: samsung: Add Exynos990 SoC CMU bindings
      arm64: dts: exynos990: Add clock management unit nodes

Ivaylo Ivanov (3):
      arm64: dts: exynos8895: Add serial_0/1 nodes
      arm64: dts: exynos8895: Add a PMU node for the second cluster
      arm64: dts: exynos8895: Add camera hsi2c nodes

Krzysztof Kozlowski (1):
      Merge branch 'for-v6.14/dt-bindings-clk-samsung' into next/dt64

Markuss Broks (2):
      arm64: dts: exynos: Add Exynos9810 SoC support
      arm64: dts: exynos: Add initial support for Samsung Galaxy S9 (SM-G960F)

Sam Protsenko (1):
      arm64: dts: exynos850-e850-96: Specify reserved secure memory explicitly

Umer Uddin (5):
      dt-bindings: arm: samsung: samsung-boards: Add bindings for SM-G981B and SM-G980F board
      arm64: dts: exynos: Add initial support for Samsung Galaxy S20 Series boards (x1s-common)
      arm64: dts: exynos: Add initial support for Samsung Galaxy S20 5G (x1s)
      arm64: dts: exynos: Add initial support for Samsung Galaxy S20 (x1slte)
      arm64: dts: exynos990: Add a PMU node for the third cluster

 .../bindings/arm/samsung/samsung-boards.yaml       |   3 +
 .../bindings/clock/samsung,exynos990-clock.yaml    | 121 +++++
 MAINTAINERS                                        |   3 +
 arch/arm64/boot/dts/exynos/Makefile                |   4 +
 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts   |  15 +-
 arch/arm64/boot/dts/exynos/exynos8895.dtsi         |  82 +++-
 arch/arm64/boot/dts/exynos/exynos9810-pinctrl.dtsi | 503 +++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos9810-starlte.dts  | 119 +++++
 arch/arm64/boot/dts/exynos/exynos9810.dtsi         | 273 +++++++++++
 arch/arm64/boot/dts/exynos/exynos990-r8s.dts       | 115 +++++
 .../boot/dts/exynos/exynos990-x1s-common.dtsi      |  98 ++++
 arch/arm64/boot/dts/exynos/exynos990-x1s.dts       |  28 ++
 arch/arm64/boot/dts/exynos/exynos990-x1slte.dts    |  28 ++
 arch/arm64/boot/dts/exynos/exynos990.dtsi          |  50 +-
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     |  83 ++++
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 104 +++++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |   5 +-
 include/dt-bindings/clock/samsung,exynos990.h      | 236 ++++++++++
 18 files changed, 1858 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml
 create mode 100644 arch/arm64/boot/dts/exynos/exynos9810-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos9810-starlte.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos9810.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-r8s.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1s-common.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1s.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1slte.dts
 create mode 100644 include/dt-bindings/clock/samsung,exynos990.h

