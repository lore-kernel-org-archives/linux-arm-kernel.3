Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F64D13570
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 09:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jJZ/N5H/92rMRLmF3zGIuUS3kiG8D/BSE0Wn8eb2g+g=; b=Ua9g9/NrDHV2FG
	SgkK6ywvDhK2l1hx5HqiVtdiKi0VigPKI5bkhVOozsQ/73I5csjLVdmoUNhJmDhm9mUZwr0B1S0+A
	Kui6a4Y5kZrMI7uBDjy8t9J3rgBWHLgKJ+Fb1SZZH8/Re/5KMCEsavDpTnB1XKP3rnnNue5nNUTZ3
	01keLNJBwQkZ8p0AHl8eEccjOp9fUQQ+5aQcuykULqN5c3zYjipJ3917FBOaiN6NdyE4+9LSr0HtS
	1IMW+U4K7WQH3DsQ65iSjHoFM0DwivYa+wDvifOHD91FNLqjD2wNFcnpSfHS8yutkZl8d16uSDArI
	EvBL4Gen+f7D+DAGyWGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5MIQ-0000000AHFQ-42Z9;
	Mon, 28 Oct 2024 09:44:22 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Lxd-0000000ADdA-3CxC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 09:22:55 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-539e3f35268so4795813e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 02:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730107372; x=1730712172; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jJZ/N5H/92rMRLmF3zGIuUS3kiG8D/BSE0Wn8eb2g+g=;
        b=SfkFKgn9PJMsIgyS/s1/oKPoEvOikg5LtwGd6NnCvTkWKadcnUaXK5ygGazjqMvu6W
         k9SJBNPTj4ISQIblWxqsj7Rppd81lsKvHfDuz6qp9zwJQ0gSpY6MaXBIwFd7gLUMFIB7
         AbdCnKq9PHwikgoqTkRd8uhXoxqqmBK9+hSUqsIOUekRRJrAGQgsJKvbmDhmWlpA4gCq
         XD0Yfa/jJKJBC3O2Jz8COOY4KbMkIQnq08Z83E4gYp5JsK680f5folMJZY5cC2+4U67I
         p9GUrds7Oq0ns8/FDsn3xUgfuNHy+wZsqabyfeBmAES4c7EXSoLtropM5qUFs8ruMvXv
         pe0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730107372; x=1730712172;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jJZ/N5H/92rMRLmF3zGIuUS3kiG8D/BSE0Wn8eb2g+g=;
        b=t33JRsavHDtCGjdjK046pDOFAfCUxqbBmxATE3V9L5tNh8Ed0Kk2t+kzOKh+xwZer5
         7vKtYm0uBqoyaRWZXPghL2rRrUrIBQMjm0q2J1sAhdC87+cBylSKtf8I1bHtBhQRPQpV
         gMQ3t1XciskvDBZiiVOCexkFanZpbNSfw/d1nJ0cXTSH9tJMYiwO2vL2JnZ+58abYoY6
         Xs82eRB9/UI7LiE/2CzMR+v+6DwSGo43eanb+HcHNtCc5jclkqT9EC5Gd01cKe0462wU
         tzWDBlZornoIBoKgyugFdm7adL75C8aiY/7FVi49DvoynsRUHqVtx4OW4FmRxoGkxFL0
         h/qg==
X-Forwarded-Encrypted: i=1; AJvYcCUeuM15NrmAntyNl5l/13MGZD4FgfyytGmpmLXcBiet7aqOtet3ftYDkfieqtYDO/xVIlEc9i/aB0T19hqy0nw7@lists.infradead.org
X-Gm-Message-State: AOJu0YwkfoIn2d1oXaWviTFdQIpsvdHRxeyMmDo4X4bt2U2NhFslPjiD
	RNpmhFoJTfdbuYSrrg+hIPRiw6gqIzVRicu+qVwTYovT62qG+h8w1SsAyg==
X-Google-Smtp-Source: AGHT+IG0x9Scdcs+etVMXKYxChdUdHKQu6TV5m9I0D5Jl1MaNkhUK8rWpK4GF+NFN4LwhTItKkiezg==
X-Received: by 2002:a05:6512:3e08:b0:539:9f3c:3bfd with SMTP id 2adb3069b0e04-53b34a359bbmr2132385e87.58.1730107371611;
        Mon, 28 Oct 2024 02:22:51 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1af331sm1043785e87.152.2024.10.28.02.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 02:22:51 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Subject: [PATCH v4 00/10] Add support for Exynos9810 SoC and Samsung Galaxy
 S9 (SM-G960F)
Date: Mon, 28 Oct 2024 11:22:28 +0200
Message-Id: <20241028-exynos9810-v4-0-6191f9d0c0f1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANRXH2cC/22Qyw6CMBBFf8V0bU1fEOrK/zAuWjpAE6HaYgMh/
 LsFXYBxMYs7yTmTOxMK4C0EdD5MyEO0wbouBXE8oLJRXQ3YmpQRI0zQNBiGsXNBFpRgzQGMlJk
 mWqIEPDxUdlhl11vKjQ298+PqjnTZ/tVEigkGQ4UhJieGFJe6VfZ+Kl2LFk1kWzTboSyhUpaKV
 5zmwOgvyrdovkN5QnUhDUghKKjd1fnTxsPzlT7SfyvN8xsq9xhGLwEAAA==
X-Change-ID: 20241024-exynos9810-b3eed995b0b9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730107370; l=4187;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=LaoIjVefHly8xHuPd7wZXRSEeRjEx9/k2jRv27uNo9o=;
 b=NwrL3Z8glQieV9u8Lg0G6hcirIBC6uZIfEOkVuPlwdcHRMx/7CX0LiAxUBApm85oxFRdLUOrs
 52EQG6iq9kpBR7tbAkA12oK70ga38ZibZQq35ldXSwdb1nm0H2pC69c
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_022253_852273_3CC15144 
X-CRM114-Status: GOOD (  18.53  )
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

Hello,

This series adds initial SoC support for the Samsung Exynos 9810
SoC and initial board support for Samsung Galaxy S9 phone (SM-G960F),
codenamed starlte.

The Exynos 9810 SoC is also used in S9 Plus (star2lte), Note 9 (crownlte),
and perhaps more devices. Currently only Galaxy S9 DTS file is added but it
should be fairly simple to add support for other devices based on this SoC,
considering they're quite similar.

The support added in this series includes:
- cpus
- pinctrl and gpio
- simple-framebuffer

This is enough to boot to a minimal initramfs shell.

The preferred way to boot this device is by using a small shim bl called
uniLoader [1], which packages the mainline kernel and DT and jumps to
the kernel. This is done in order to work around some issues caused by
the stock, and non-replacable Samsung S-Boot bootloader. For example,
S-Boot leaves the decon trigger control unset, which causes the framebuffer
to not refresh, so simple-framebuffer wouldn't work without a secondary loader.
Ideally, there'll be a kernel driver for the display subsystem some day to
resolve this issue.

[1] https://github.com/ivoszbg/uniLoader

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
Changes in v4:
- make DTS build again [typo, misplaced ;] (krzk)
- lowercase hex in pinctrl (ivo)
- removed the perf patchset from dependencies (krzk)
- Link to v3: https://lore.kernel.org/r/20241026-exynos9810-v3-0-b89de9441ea8@gmail.com

Changes in v3:
- fix a blank line between tags (krzk)
- align with the opening " in eint-controller (krzk)
- sort the memory node (ivo)
- drop the \n (ivo)
- drop the perf patches into separate series (krzk)
- elaborate a bit more on dt-bindings (krzk)
- Link to v2: https://lore.kernel.org/r/20241025-exynos9810-v2-0-99ca3f316e21@gmail.com

Changes in v2:
- sort the pinctrl nodes alphabetically (ivo)
- move the interrupts from pinctrl file to SoC dtsi (krzk)
- move the wakeup-eint from pinctrl file to SoC dtsi (krzk)
- sort gpio-keys pinctrl-0 and pinctrl-names (ivo)
- rename the bixby key node to "wink" (ivo)
- sort gpio-keys subnodes (ivo)
- sort pinctrl_alive gpio-keys pin descriptions (ivo)
- fix the Co-developed-by tags and add a signoff (krzk)

- Link to v1: https://lore.kernel.org/r/20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com

---
Markuss Broks (10):
      dt-bindings: arm: cpus: Add Samsung Mongoose M3
      dt-bindings: hwinfo: samsung,exynos-chipid: Add Samsung exynos9810 compatible
      dt-bindings: pinctrl: samsung: Add compatible for Exynos9810 SoC
      dt-bindings: pinctrl: samsung: Add compatible for exynos9810-wakeup-eint
      dt-bindings: soc: samsung: exynos-pmu: Add exynos9810 compatible
      dt-bindings: arm: samsung: Document Exynos9810 and starlte board binding
      soc: samsung: exynos-chipid: Add support for Exynos9810 SoC
      pinctrl: samsung: Add Exynos9810 SoC specific data
      arm64: dts: exynos: Add Exynos9810 SoC support
      arm64: dts: exynos: Add initial support for Samsung Galaxy S9 (SM-G960F)

 Documentation/devicetree/bindings/arm/cpus.yaml    |   1 +
 .../bindings/arm/samsung/samsung-boards.yaml       |   6 +
 .../bindings/hwinfo/samsung,exynos-chipid.yaml     |   1 +
 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |   1 +
 .../bindings/pinctrl/samsung,pinctrl.yaml          |   1 +
 .../bindings/soc/samsung/exynos-pmu.yaml           |   1 +
 arch/arm64/boot/dts/exynos/Makefile                |   1 +
 arch/arm64/boot/dts/exynos/exynos9810-pinctrl.dtsi | 503 +++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos9810-starlte.dts  | 119 +++++
 arch/arm64/boot/dts/exynos/exynos9810.dtsi         | 273 +++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     | 154 +++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   1 +
 drivers/soc/samsung/exynos-chipid.c                |   1 +
 14 files changed, 1065 insertions(+)
---
base-commit: f2493655d2d3d5c6958ed996b043c821c23ae8d3
change-id: 20241024-exynos9810-b3eed995b0b9

Best regards,
-- 
Markuss Broks <markuss.broks@gmail.com>


