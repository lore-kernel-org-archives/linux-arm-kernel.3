Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3AFFC369C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kSn8ywScBr2S49CSRan+oKzZUY5sWQo+CXS/MBhnnS8=; b=YqmN1Tx29oNPm2
	0AsMvdDqiKddUrZyglUW11d+MN/I0iT1eu2BJit7SjsR/Rcx+oIhJ36D0Ezxl5JncGHGlwY0EEmCF
	t6qZeU3r755uSK9l5Is3/vpikIy1tYw2vV/Iu15cdXKlTwmgcobsXWrCQ/j1Xgvdx6/NTH3VtGPLv
	/03Z0aUg1cbnZR0205Ei8HhMJfGpVDf4niU7C2IQ/A8U32POroUCa8dHnHvfUyyWv9qdaBKckhRjT
	9hbgzk6HSPsIy5sLoAuFWlTn7bXvsTMKaI/fSplqji74zX2PRbaoGcWFWn110MCbZjGWLixQrS/dc
	75ARE87nz5BMtaNB0yJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u502N-0000000983F-2TOC;
	Wed, 16 Apr 2025 10:30:35 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4y1q-00000008nQh-2RfA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 08:22:01 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-30de488cf81so62183761fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 01:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791711; x=1745396511; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kSn8ywScBr2S49CSRan+oKzZUY5sWQo+CXS/MBhnnS8=;
        b=hoTsqcycGmTdtB++DgFPmTkERPtOeiMTiwM+UBb9sNT7AjaU1fAuabROKHR3yJnjUO
         pptZ0bdxZ+fcR9CpmG1PBwLJvFEFIVjFKdkqi9NR9rEKyPT2hPWhuNrLvQrU3Dfs/gUp
         S+Cg236NWmdaEbUYJnu9tm8ypJEIG4Np0Ulq7DOZV5uHRb7K9Ut5+U5M1w4KbXV/oMcD
         IeclEwajD/2KFkr25OmlAooA2TyLvg1gWIEW8p/zMJ1WCVlN36y5eB41RTmtVEgTNXBQ
         55XQ8of6ag7+r0cSxHbkbRCYsxWSXadL+TVGYiDZUrv80iodZtqtGmBi/ADgnJ2ndWQL
         APTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791711; x=1745396511;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kSn8ywScBr2S49CSRan+oKzZUY5sWQo+CXS/MBhnnS8=;
        b=WbjzPGIVqyaLDnF+krSS5AIzjEP/Z0XASkNJ6BXPj+acUJ/jiYkiRGDCcI2J0tg6sX
         WGrhijRdmDGbGTyGFgmLO2IYX9g2rG2gUuQGJH/Xt94J/xU4ic7y+YXRCnpRC8UVJEh4
         m/1IAXdXme1PDsmJO1lCXNY+yIXAtlWYTZwzIrrfz56xaQ+2thUrH3uY3GF2owqgD4lw
         Bt9LqpDHIZ0tNZtRZnSQMndfWlDCh5OKlzW21KM0xDIgec1ARzxDN7yErCPVurInk2aL
         w9c5uelFrgmVTGDDuhuiM/uQZv1kUOwNrbk/yPIInMfZrN/hrMnWOQLdeJ/7vpxqZ9dq
         qbqQ==
X-Gm-Message-State: AOJu0Yz93IAkh5VlXvTxkqxeLXPKyQQC3396kFk9ySrkaPK4rURLLq8e
	vqRikZQbte0TjnlRi05crBjga2fVl5Mjr6ATzRYzFogxvkVz4QIUM6oBAjfrYyM=
X-Gm-Gg: ASbGnctCexb3hI1XvnHIBv/ae+YU7zZEL0DCqmvCwmF5gbqBN3N/h5wRa1RbrUj8PY1
	8ggVFB77nS+3F7Ser2fL29V9tnW8QV0IEHaOjm6HzUlI2mFCR49zCDeu1oVEco5m5A9gcVdPUBY
	IZ2wmpRsvrNuOrTT1j751+fJlBZ23HMdc2BAItR8eHF8stS3pEtO35Ce13MPu/2gcknvGvUoIgf
	PEW2UPU+0n+SIHmlpBm1xCMxGfvf81034wIBnmMgpEclV3FlZAOZBLBIaKoeFe1vfyJEnjpy+AI
	CVk7e2HYkj5vKIm6Fxnjv2263Yh/qPVwFYhiEHbT5U0txP70kodD
X-Google-Smtp-Source: AGHT+IHs8w/edsjtM3rOM3Yclg32oaNqFZGls9C6H68akxr8+2plKYYeBm64f3z6Q4QArp+Lekmm2g==
X-Received: by 2002:a2e:8404:0:b0:30c:aae:6d4a with SMTP id 38308e7fff4ca-3107f718b7bmr2182291fa.26.1744791710377;
        Wed, 16 Apr 2025 01:21:50 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f7b20sm23025391fa.97.2025.04.16.01.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:21:49 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH 00/13] ARM: vt8500: DT bindings and dts updates
Date: Wed, 16 Apr 2025 12:21:25 +0400
Message-Id: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIVo/2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEwNL3fLcEt3SgpTEktRiXVMLQ4NkM1NDI9NUEyWgjoKi1LTMCrBp0bG
 1tQD/e5EXXQAAAA==
X-Change-ID: 20250409-wmt-updates-5810c65125e4
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, netdev@vger.kernel.org, 
 linux-pwm@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744791712; l=3242;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=VWW+FjoSMr2BVYRu/X2g0WXpS/3nXWF7DuGik59WEqM=;
 b=OE98dlaCoHtAdZilXLnTnuUMVF49Z4hZHmnAalJtuuKjjULVM27W5tpvrpJQD1KM7AV/MZCRX
 fNJJtvtC0pHDBujTVpynkLYIbwLLeVLKIXeMo4GnDqOoMsFzt4LL7uX
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_012154_656447_11DFEAB5 
X-CRM114-Status: GOOD (  11.35  )
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

Convert some more VT8500 related textual DT binding descriptions to
YAML schema, do minor dts correctness fixes, and add a DT for the
board I'm actually testing those on (VIA APC Rock).

While at that, also describe the PL310 L2 cache controller present on
WM8850/WM8950.

Note that this series is based upon Krzysztof's linux-dt/for-next

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Alexey Charkov (13):
      dt-bindings: i2c: i2c-wmt: Convert to YAML
      dt-bindings: interrupt-controller: via,vt8500-intc: Convert to YAML
      dt-bindings: mmc: vt8500-sdmmc: Convert to YAML
      dt-bindings: net: via-rhine: Convert to YAML
      dt-bindings: pwm: vt8500-pwm: Convert to YAML
      dt-bindings: timer: via,vt8500-timer: Convert to YAML
      dt-bindings: arm: vt8500: Add VIA APC Rock/Paper boards
      ARM: dts: vt8500: Add node address and reg in CPU nodes
      ARM: dts: vt8500: Move memory nodes to board dts and fix addr/size
      ARM: dts: vt8500: Use generic compatibles for EHCI
      ARM: dts: vt8500: Use generic node name for the SD/MMC controller
      ARM: dts: vt8500: Add VIA APC Rock/Paper board
      ARM: dts: vt8500: Add L2 cache controller on WM8850/WM8950

 Documentation/devicetree/bindings/arm/vt8500.yaml  | 19 ++++---
 Documentation/devicetree/bindings/i2c/i2c-wmt.txt  | 24 ---------
 .../devicetree/bindings/i2c/wm,wm8505-i2c.yaml     | 47 +++++++++++++++++
 .../interrupt-controller/via,vt8500-intc.txt       | 16 ------
 .../interrupt-controller/via,vt8500-intc.yaml      | 47 +++++++++++++++++
 .../devicetree/bindings/mmc/vt8500-sdmmc.txt       | 23 --------
 .../devicetree/bindings/mmc/wm,wm8505-sdhc.yaml    | 61 ++++++++++++++++++++++
 .../devicetree/bindings/net/via,vt8500-rhine.yaml  | 41 +++++++++++++++
 .../devicetree/bindings/net/via-rhine.txt          | 17 ------
 .../devicetree/bindings/pwm/via,vt8500-pwm.yaml    | 43 +++++++++++++++
 .../devicetree/bindings/pwm/vt8500-pwm.txt         | 18 -------
 .../devicetree/bindings/timer/via,vt8500-timer.txt | 15 ------
 .../bindings/timer/via,vt8500-timer.yaml           | 36 +++++++++++++
 MAINTAINERS                                        |  7 ++-
 arch/arm/boot/dts/vt8500/Makefile                  |  3 +-
 arch/arm/boot/dts/vt8500/vt8500-bv07.dts           |  5 ++
 arch/arm/boot/dts/vt8500/vt8500.dtsi               | 12 ++---
 arch/arm/boot/dts/vt8500/wm8505-ref.dts            |  5 ++
 arch/arm/boot/dts/vt8500/wm8505.dtsi               | 14 ++---
 arch/arm/boot/dts/vt8500/wm8650-mid.dts            |  5 ++
 arch/arm/boot/dts/vt8500/wm8650.dtsi               | 14 ++---
 arch/arm/boot/dts/vt8500/wm8750-apc8750.dts        |  5 ++
 arch/arm/boot/dts/vt8500/wm8750.dtsi               | 14 ++---
 arch/arm/boot/dts/vt8500/wm8850-w70v2.dts          |  5 ++
 arch/arm/boot/dts/vt8500/wm8850.dtsi               | 23 +++++---
 arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts       | 21 ++++++++
 arch/arm/boot/dts/vt8500/wm8950.dtsi               | 11 ++++
 27 files changed, 386 insertions(+), 165 deletions(-)
---
base-commit: 62db22c2af6ce306943df5de6f5198ea9bd3d47b
change-id: 20250409-wmt-updates-5810c65125e4

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


