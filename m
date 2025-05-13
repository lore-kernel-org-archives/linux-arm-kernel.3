Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06A4C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 10:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ylae4Ll4XqNmNgm02KxyYLuLgMmXCKZfW750alXaKGY=; b=qfqo9hZdN7VZzhilleXWFoSX64
	3MGuGlYgYeANfANP1O++F4HBCAs92NNgswOqozT6L8vEQqvrOoTlDLFzk/RE0mg2/vOVsqAe4kk4e
	h1OVB6XjjW5Z11KDxtVT+QLzshFgKDjHpR96cfgnG0BmYbZ6BaNESpqSaC3IwiiSL6KcKT6vbX9Vd
	ZR8bFYEDMFA01SP01P6UESqGwvPDf5d1Lz22Lfe2yhqFuh7Dqx6buILzVeoCL2rGsZsi6MhawV85M
	m5wov/EsCMXNrKVBcwON0y9DXw9hc4flj3f2XLE1n62kpo2BKy/9w6+F2rzk8eIgEDInDyk2+xe6S
	CodBJ0HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmcz-0000000C2xw-0yLt;
	Tue, 13 May 2025 10:12:49 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmat-0000000C2XZ-0UzW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 10:10:40 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-440668acbf3so2694635e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 03:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747131037; x=1747735837; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ylae4Ll4XqNmNgm02KxyYLuLgMmXCKZfW750alXaKGY=;
        b=MfiOduyagAeIBv85gBcf30Pfnw9+UGU0RRi91KqyjJBru4LrjnNMvfqPwBtRJksu+q
         OgTmWQap2wRoOe+sFvR47VcSMir81mima1WLsDnLvpS84Hps78oDCmuZbhYgtrcLVout
         bYFZUpX9ZwB/w/fhQBPj+unep1pZLtalmGlye5lx8Vw+Dmf+8FV9G/pS7HqTe97HBJX4
         U5MtYehQmKzZFj1aZ+DN4EgM6J+kaoSimM09dsIdzxfK73D6PbVZRO+8F/CPbkWwlrG5
         cubG2QsqRKF6XJLbau7ZhM9DjULsGNwbZ7d72KXzTSfkHYV0eYNDizCEWcA30slEw2jU
         RMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747131037; x=1747735837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ylae4Ll4XqNmNgm02KxyYLuLgMmXCKZfW750alXaKGY=;
        b=pLxrwCKuEKouVF1h3xV89cb757o1h+bI467Kfif/EXMutzUbXd3bDzno6BXcmiEWNi
         CTOXXdMlP4jSQwBCRMcHqQacUWqK0tYa8zO19sPXoRhLafszTRUFuJeKYXtpibVaFVp9
         THByJSRTeT5EqsGg1ySEY0xtdmuFMDAfSW2XKkSX0jqYN25KRu/6crsTBD6OpIcZ262E
         jp/b0/PBJQyJKQ4ilHhBmoplXlg1KnCy/zujZdmVQt2nZNc8Wb8wyA3m8Laz8MIZuLGi
         aLTBex4+q88SBHHEUjF+sEKeKn6kpPwpJQ5BEA6YI2rHyR0Ee5rJDxVURd202IMkGqFK
         Ds8w==
X-Forwarded-Encrypted: i=1; AJvYcCXlMMwgVxKjuWd7hfef52GYbnyQaiJ+CQBlJ5E5skWHiV73VL2MLCT1NF0x/rdFZOrIk/qe0SR6FQENE1rTtM5H@lists.infradead.org
X-Gm-Message-State: AOJu0Yy88V6vstvsajKGUfxVvvQu5g73JN+jNuSrDCJXJdm2J/eYAiGl
	nPbLAhE8Wcvm7nJG+ex6dboK9oKI0QQT8QUUnXpqsXz3LY4NkJVsaCB1eOaazQE=
X-Gm-Gg: ASbGncuBphlf9//H2Tb+w4JSA9kyi39KxcdYFWcmnETHIhb41b5AoWmRzWv8DVWfi/A
	8dxNOWjKuglYr8JBazf2Wi/uzHAHaX6wp7kd2Y5kXs5zCWx0r3B6JeOLs474lXP1+RTi57bLcGM
	kPK1RIcqiauFhzKcUzyI/chTCVc5oLhMVRr12tqOMRoqTj30nozAloxB5UzNLHhv0gtQkuIoU4s
	wjd6cew13aco3yOci3V6y3xLvWMocp41Rho1GZ3iXX1dtL6dQsCffgLoWKYTLXZUL/q5eHi7HK0
	bo306fhphe5UEJx/F7tvbPsnEFlAZGhpWMhKtDpNHVf7ajTjVzjdM8k9Hy5hUjJd2S8b3/WP7QQ
	qhsxnb6pFDUaSE14wOSpmb6azWwGPoAgQv8qDnhc=
X-Google-Smtp-Source: AGHT+IG/cZVqXuc+pBf7UL6B8hCIaPUE80iB2obzNalJ0Q7d8K7s5vC7GfG5dhzBEFWg6B/3BfGcWQ==
X-Received: by 2002:a05:600c:4451:b0:43b:c0fa:f9c4 with SMTP id 5b1f17b1804b1-442d6dc7d2dmr55413605e9.4.1747131037326;
        Tue, 13 May 2025 03:10:37 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67df574sm159683635e9.11.2025.05.13.03.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:10:36 -0700 (PDT)
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
Subject: [GIT PULL 2/4] arm64: dts: samsung: DTS for v6.16
Date: Tue, 13 May 2025 12:10:23 +0200
Message-ID: <20250513101023.21552-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250513101023.21552-5-krzysztof.kozlowski@linaro.org>
References: <20250513101023.21552-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3490; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=Mw1tyq5QfND79Wb5z/DsSwOKjJVKpecFlRbtqfJOXOk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoIxqQiLF8lqPQxiZfFjJOOgAXgivq851DtvWOY
 wVxZ/pDpeKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCMakAAKCRDBN2bmhouD
 10UlEACKFX9blnyKE3zoty0mjF32nefBZs9EruwNIxVFRMKIsmm2hKzldWArgXhgb6aoVoGIduW
 LQQOvhJn6O+OkpD6yBQIP2oe2XldQYWlTbRoAgSrAUsfRmwHrZnBwdCRnKY6ajkLKzrvOK/KqWs
 oXFFAqVioL5RTPrB7oWsmxOGeybClBjZ6rZmGEegEDoJPUK6ei8ndY1DfUtvsFGqGt8ZdQn5Z20
 Hr5yqbWHhcqhl5PdIMOFWpPq3wR6T3V1PvpS31j42tnnFzedqAKI7dvW4o+vF/qvfP65IowxBiE
 sQzmN4zBdX/4kCZDIIuaeYgIu8vwahq8I5HcMPvwUOfwQZ9UsUDlrZxSUKuvaedmxfKL2wrrCU0
 Xy2LMgTTRml+IaW1VqRnwkBU+VS9xADEQSQsKES1nRAQQZCCQ2rRGvP7oRTEBlXTn+QqBw6zq61
 3PsOUr7ZFy6LC8oRvH+/EE/gj5OVqXCjH8enrQSTZhXdOChXSyTiVnP6fOwFP6gO3bexky6UTFD
 GeKM7Q9KbtLKjzqpbfQF4AUm3Ki4679C8cygq9wTsF4x8avxsifvXzFgmsMxnB25TJnG5vqaYFh
 tdcWVxQ21s7ry/qZahuxUJ7Blz9+l9lpvHWHbAFtwDRRbyoLa0THuU1SdCl3uSr/qZtLpHr/g8f 8SWqs7R+GK6l9UA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_031039_163710_688DC4EB 
X-CRM114-Status: GOOD (  11.84  )
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

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.16

for you to fetch changes up to aaf02428fdd50b818c77644bc0b8a0b282ce8ea4:

  arm64: dts: exynos: gs101: add pmu-intr-gen syscon node (2025-05-13 10:02:17 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.16

1. Tesla FSD: Add Ethernet.
2. ExynosAutov920: Add more serial nodes, clock controllers for CPU
   cluster CL0, CL1 and CL2.
3. New Exynos7870 SoC with pretty decent coverage: pin controllers,
   clock controllers, I2C, MMC, serial and USB.  New boards using
   Exynos7870: Samsung Galaxy J7 Prime, Samsung Galaxy A2 Core and
   Samsung Galaxy J6.
4. Google GS101: Add pmu-intr-gen syscon node for proper CPU hotplug.
5. Switch USI (serial engines) nodes to new samsung,mode constant coming
   with DT bindings v6.15-rc1.

----------------------------------------------------------------
Faraz Ata (1):
      arm64: dts: exynos: Add DT node for all UART ports

Ivaylo Ivanov (1):
      arm64: dts: exynos: update all samsung,mode constants

Kaustabh Chakraborty (5):
      dt-bindings: arm: samsung: add compatibles for exynos7870 devices
      arm64: dts: exynos: add initial devicetree support for exynos7870
      arm64: dts: exynos: add initial support for Samsung Galaxy J7 Prime
      arm64: dts: exynos: add initial support for Samsung Galaxy A2 Core
      arm64: dts: exynos: add initial support for Samsung Galaxy J6

Peter Griffin (1):
      arm64: dts: exynos: gs101: add pmu-intr-gen syscon node

Shin Son (2):
      arm64: dts: exynosautov920: add cpucl0 clock DT nodes
      arm64: dts: exynosautov920: add cpucl1/2 clock DT nodes

Swathi K S (2):
      arm64: dts: fsd: Add Ethernet support for FSYS0 Block of FSD SoC
      arm64: dts: fsd: Add Ethernet support for PERIC Block of FSD SoC

 .../bindings/arm/samsung/samsung-boards.yaml       |    8 +
 arch/arm64/boot/dts/exynos/Makefile                |    3 +
 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts |  630 ++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |  613 ++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts |  662 +++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870-pinctrl.dtsi | 1021 ++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         |  712 ++++++++++++++
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |   14 +-
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi       |   48 +-
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     |  536 +++++++++-
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi |    4 +-
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |    8 +-
 arch/arm64/boot/dts/tesla/fsd-evb.dts              |   20 +
 arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi         |  112 +++
 arch/arm64/boot/dts/tesla/fsd.dtsi                 |   50 +
 15 files changed, 4406 insertions(+), 35 deletions(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7870-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7870.dtsi

