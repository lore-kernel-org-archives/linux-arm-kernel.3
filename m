Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC3DC83F10
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 22:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uNbl8U+xncbpp1a9NMqWFqisIKUYudEbkTWWSf/ClaQ=; b=0g3g3rpttD4jG8y92L0pS6hBca
	Y0REFQA/ExFWmHGeQHwrXwcPq5m8c7S6u7y2MSg/nVdE8M2v44mNq8tuU+U2XzeoVjx88dvS/nLgb
	KYEdYuHnRTuTkugR+iPMGCN4+Oq9ZFo7WMZCrM115YjCMzNTE/3VF8bkYIv9F/67mnYbq2+6fk/R7
	kftkwdnpCGIlZ/WD9MJFH3tPkf4J9YzUXuRLz4aYqwUiPIxkPfseIMn+lguCNBcv0oRQa080TM5x3
	bGXVAprLZ6JY4Ou/sXHSUKVYwDu7PfoASA11846ti8FBj9zxNcjVklTHaszot/llrNw5nGp3OV+o3
	WbcSpJ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdi8-0000000A7ry-23st;
	Wed, 09 Jul 2025 22:56:20 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZaGT-00000009gyB-3pH7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 19:15:39 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-454a3c5d6f3so251185e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 12:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752088532; x=1752693332; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNbl8U+xncbpp1a9NMqWFqisIKUYudEbkTWWSf/ClaQ=;
        b=ocM9xHv6kMD2ROj3lVRlMeAUGDs0t2BMwq3B0RB6i6vfHY7dEwCA5ClM1raE5Dx+oC
         CuqJEMpY3hdN2fRhkDToypmN31ONgtm58XFTQXDdpKulxob9YHQXUWmriYRg88ftCF58
         KZwG9eJDpV3zk1fWU5Ii1wJnTf3Sgw2hOgIzBI06q8VV0fQCpHW+2v/VZRyK4oKRqoX4
         FyWRNN4b+pRmSArBK7Y8a+i2h+RzosggbSigGeEq9fwMvwQ18WAwqubmZ5QTCib4GVTl
         GDhYeNNKVRsw/McfVf6D+uvDCWNQh5e0O9Tf5my4zXgHpftauOJU1dkcG9AGycoFHeYY
         nBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752088532; x=1752693332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uNbl8U+xncbpp1a9NMqWFqisIKUYudEbkTWWSf/ClaQ=;
        b=NcAg3vhwZs9YsgwrG4dE39M2TXtLy8Vb0G2Ouz4X+gnS3Bf05cnsGWg6rYwirqBH4H
         OS+UVQnTAZI5dHXPW6ykuHXuZMfqai0yo3FLxl/3Q2UEX5aJ+xaUkcW3+poiKCzLP6zU
         cbZWdbCD2u84bDkCrHzELYEL0Jvwxtvi0eXI3Glq98SNwME1IAmqYYTe8M2cp6qI5220
         liMDfgpjOFCoPiJVlDoe8Hq5+U1CBd0vLlVHYhc5PL8eBWk5svIivtFefsw8/uBuqrc8
         R2v8ZzvN0ipDNMenk87q8zGIIGWbAsWCNZOQGJ9e5zp+9g0hohzbe97Ii1J3EkrBhDHl
         eMzg==
X-Forwarded-Encrypted: i=1; AJvYcCXUyaqi6V7sQg0rensG1XYR8PAqT9fJ/4ndIlsajsmw/69sWFdrThsUFB/PxI53KltvFgIxFgd+a2DKC/oMdeqI@lists.infradead.org
X-Gm-Message-State: AOJu0YzkmpUkvCYP8IznOtbTi81/ZQFaYMggTQSbEoQs8f6KFPfsiSlr
	mfdcNPGV3PAm2T6uy/RW9hycDhZ6ZimVUOdggCkV3OHjMD6z3PjiU85znr0TLhCFM6yZCL3uS2h
	FGMG4
X-Gm-Gg: ASbGnctbzdeLXdxXGw7FBOiZ9s6CHJ6ncR1AKIvVREnURe5fp0FU83TWlsdj1HqjrD1
	lAGobsGf3+x559UGoKHypG9BOhdIFMdwpW0HvYSd6PN4x0VdfLLudGNnNcoXX3BNokcMoyNCGGS
	EPzKWpV5NyCm8/WiX0QIDlORBsP2xV3WbiCEN9AZYeByExLJJEDlZKJSQvjKr+urkrbvjION9vl
	CKCo0WyvvM106+aPXGWZ7Vq3ZQv2gsfGvCSnStEfON2+yv0osMu39jItz7PMDKwRGp1z7xTHcRV
	o8FC8yKiq7KUVTgWApsczf3XbIT27+0sXC7Ug8S9/T0Op2IGxSvRcuHMdZRtvi9O2VypfYEdid8
	=
X-Google-Smtp-Source: AGHT+IGhNA++7xZg6xgr84ItwYyhelF2UwYcUcnBnnifNfCSp2rTw7/vvTd7m7A27LjCuZliDTQLRQ==
X-Received: by 2002:a05:6000:1ace:b0:3a6:d256:c5db with SMTP id ffacd0b85a97d-3b5e4543f00mr1268338f8f.13.1752088532254;
        Wed, 09 Jul 2025 12:15:32 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47285dc08sm17159588f8f.98.2025.07.09.12.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 12:15:31 -0700 (PDT)
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
Subject: [GIT PULL 3/3] arm64: dts: samsung: dts for v6.17
Date: Wed,  9 Jul 2025 21:15:22 +0200
Message-ID: <20250709191523.171359-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250709191523.171359-4-krzysztof.kozlowski@linaro.org>
References: <20250709191523.171359-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4153; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=OIoxzz9nTa1KEMKLgwavRzStSsKZ+ayPWesJQHTnF6s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBobr/NKL27EF4KQkesT2MoJWrhmPLTsMsLxQTV9
 Ys2GZMKRgaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaG6/zQAKCRDBN2bmhouD
 15fBEACHFwozinLrM6K5N5e/2mYfNzEFTl+V7ougAttEa+lWvR7tcmGlIPgGwtJ7KvaEmJZRgQi
 JWz9dMlXIRsxSVVQFeJpZfYs4gSA2OD/3Bxx4Jl97R+SD3owvFjs257RvrUivPKozjHKw66nOmf
 Y+qxXHUWEecUo47WKYlPvO49sYYa9oJVrNehrN/XyKoVvrsG7LnKQZLH6bxA+0LS672gz+CSBsS
 ZNFwPTKMs6AzgODHnsbjNmprq88Zn3UVCn6o30ovvFtPQ6VqHraX8eDpzhqtX4sM/Ohm3U2iXib
 W4hgDwkVNWwKSjDlW880VqRJmlPasLUISOcOVN7M04vuBNDDwoIa8qYb6ohBRdJq04DMVXwXuZ/
 8esRKXWR2lwag8K+8dutaP4KELdh/LZYZZU6rfIK/jwxkIIp1XnlPkpHMSH+thYcPSh5Os3L+mM
 aCw/qK1SXGohHc3jXPKwQ3ZVXE7Wgs25906EepQnfFxZx/fClmnaQmvkwWnEDvlsRUxqB64hmlO
 Horjnau8jTBMt+ftOp8ht88yQdEXvZxOkYSaW5F55kuH2zqCRwvaF5v7xksl4d1mIIsp8KPBQrK
 IMB6wjl5kYn1h2CL23F/TDg+uCV1M9PO0vWORqdxLV5sxjxKEwvq9AC0gIga5TOpvtAyJoXLWm5 IIYTqo/9PlzLIEg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_121537_919250_3B284027 
X-CRM114-Status: GOOD (  14.28  )
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

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.17

for you to fetch changes up to 49a27c6c392dec46c826ee586f7ec8973acaeed7:

  arm64: dts: exynos7870-j6lte: reduce memory ranges to base amount (2025-07-05 10:23:36 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.17

1. New SoC - Exynos2200 SoC - with basic nodes, pin controllers,
   clock controllers and initial USB support.  Add board using it:
   Samsung Galaxy S22+ (SM-S906B), called G0S.

2. ExynosAutov920: Add CMU_HSI2 clock controller, remaining SPI nodes

3. Google GS101:
   - Prepare to switching to architected timer, instead of Exynos MCT as
     the primary one.
   - Add secondary Maxim MAX77759 PMIC to Pixel boards, managing USB Type-C and
     charger.
   - Add incomplete description of the primary Samsung S2MPG10 PMIC.
     Several bits, like regulators, are still missing, though.
   - Add also secondary reboot-mode, via MAX77759 NVMEM.
   - Switch the primary (SoC) reboot handler to Google specific
     google,gs101-reboot which gives additional GS101 features (cold and
     warm reboots).
     This change will affect other users of this DTS, but to our
     knowledge there is only Android, from which this change originates.

4. Exynos7870:
   - Fix speed problems in USB gadget mode.
   - Correct memory map to avoid crashes due to secure world.

----------------------------------------------------------------
André Draszik (5):
      arm64: dts: exynos: gs101-pixel-common: add Maxim MAX77759 PMIC
      arm64: dts: exynos: gs101-pixel-common: add nvmem-reboot-mode
      arm64: dts: exynos: gs101: add dm-verity-device-corrupted syscon-reboot-mode
      arm64: dts: exynos: gs101-pixel-common: add main PMIC node
      arm64: dts: exynos: gs101: switch to gs101 specific reboot

Faraz Ata (1):
      arm64: dts: exynosautov920: Add DT node for all SPI ports

Ivaylo Ivanov (4):
      dt-bindings: arm: samsung: document g0s board binding
      arm64: dts: exynos: add initial support for exynos2200 SoC
      arm64: dts: exynos: add initial support for Samsung Galaxy S22+
      MAINTAINERS: add entry for Samsung Exynos2200 SoC

Kaustabh Chakraborty (3):
      arm64: dts: exynos7870: add quirk to disable USB2 LPM in gadget mode
      arm64: dts: exynos7870-on7xelte: reduce memory ranges to base amount
      arm64: dts: exynos7870-j6lte: reduce memory ranges to base amount

Krzysztof Kozlowski (1):
      arm64: dts: exynos5433: Align i2c-gpio node names with dtschema

Peter Griffin (1):
      arm64: dts: exynos: gs101: ufs: add dma-coherent property

Raghav Sharma (1):
      arm64: dts: exynosautov920: add CMU_HSI2 clock DT nodes

Will Deacon (1):
      arm64: dts: exynos: gs101: Add 'local-timer-stop' to cpuidle nodes

 .../bindings/arm/samsung/samsung-boards.yaml       |    6 +
 MAINTAINERS                                        |   10 +
 arch/arm64/boot/dts/exynos/Makefile                |    1 +
 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts      |  169 ++
 arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi | 1765 ++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos2200.dtsi         |  561 +++++++
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     |    2 +-
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |    2 +-
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts |    2 +-
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         |    1 +
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     |  378 +++++
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi |   96 ++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |   10 +-
 13 files changed, 2996 insertions(+), 7 deletions(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos2200.dtsi

