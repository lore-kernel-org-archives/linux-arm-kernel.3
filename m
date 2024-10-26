Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770FDD0C604
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 20:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HF90UXs9kTQIF90liDg8fx2fiF+U0Tmt00BxqVTgios=; b=n3+FNRDKE6umDT
	ZQzf5HmpERoUE74bvktiap8TkiaN8pthps3A+Jqf2pvHaN+VNl+dVhBcwQiUJCLEnAkZarVoLEXEc
	kXoch5gAxWvnqzpmzfC9/Bq8seHCSgpbX5TRpbyHd1dIZmyzmkNyxr5MJTyyYJGAeRpIPeEJwPMx4
	3JRmAztOuOSMnEELZJ+LmtxxQOWv36lh3HeDGnPRWWbih2848uo/yU90ems5WB+qp9tDigFejkpjs
	fHOY6cr6TF/Jpd0ZL5SIWQb6U0f29Ls+URgP2vu4N1DlczvbC7eydKi6yLLEkbbvwwmtEW9ju/Lhn
	8sfcrchiHKcxu2onYfqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4nVw-00000007Csq-3Grv;
	Sat, 26 Oct 2024 20:36:00 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4nSv-00000007C92-1bvj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Oct 2024 20:32:54 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-539e5c15fd3so2835575e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Oct 2024 13:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729974771; x=1730579571; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HF90UXs9kTQIF90liDg8fx2fiF+U0Tmt00BxqVTgios=;
        b=d3QeXeCCO9M3DCZQaIROW4wv2KlgTFWLJhZf1VXSezHVKEpoqb8j95O05RbwOxqaJ7
         UTLkWLM2HgPUFVGIczErXhdNlKjdeL2BgyccmTt4jc2sLc8p6HHi6gBNwtG6/8uxKwwv
         H3kC6fDZqGTn4hWrHPkL73oJ6IOSVIDeSOTF3HlL7V8xsPDT+XvjQP0cyTIeKeRM7qqS
         q/UDJkQLDA2IXKJ3efhcNjp/Tc+Nisjte9FRshuJlD72sT1NY3iZmNAQiR/urGCqv+CN
         FcBwvuvdW35WNLfLbsEbRiMh0WGvYTMuh1aRUVIx26U7c314NcMQQ+0/j0AGdwFAd6Ot
         qK3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729974771; x=1730579571;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HF90UXs9kTQIF90liDg8fx2fiF+U0Tmt00BxqVTgios=;
        b=NAgidvU60MVKgUBBZ9q6DjbvOUJQOSq6zgqlSdeTF5u+CiOp9tbuOYMjTsuMMF+OUv
         9bHXb5/cDV8ajCl4kWyT+stAQP2UXPsx/llE5LSgXxx7Mro/WrgR4WaK94L6NPrWN4+O
         mSi4MiDhMjCFXmbz8QaZfSGimJiYaaiO+dzewf3v4IExL9iezFxWj456kA3QqbpLv+3+
         3a6PX/iMYBWF+0JkOqcDhSSKCwwDm3XUpftcucq96orBraTJbxF09HmNb0fQ25mTzNvf
         mE/11jBUEr3uK8hIt4mEAS3jIld5fGddA7/52OULBDMX1b3XyI0O7SUcohn5j4Fkam2s
         ZoyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7l33UTobntZyrvtbI1EiQe+aK5XicNFY3Ge2ydKXoTrzkNBqLuxFHXvsGFLzKY47Hy6t3V8P5Xf0CvkvmQRRH@lists.infradead.org
X-Gm-Message-State: AOJu0YznTtdkTYWC8Cpd+XqYChO2eHKJG2cvTMR6355yn7u9hM3tnEJQ
	0Cs+m9x+RNv/8KZ3jWvynJNSDXCtNmEY/Qs8zhR7BKNpea2FYPlXv7gn5w==
X-Google-Smtp-Source: AGHT+IE3SKNbeVLeGX39XHnr0blgOLm1GkrqEWdR6tFG0Rk+a7gOlPARd7s46wjLc1DdWevwB0ADtw==
X-Received: by 2002:a05:6512:692:b0:539:ea0f:cc43 with SMTP id 2adb3069b0e04-53b348d31eemr1162557e87.19.1729974771087;
        Sat, 26 Oct 2024 13:32:51 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c9439sm595872e87.200.2024.10.26.13.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 13:32:50 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Subject: [PATCH v3 00/10] Add support for Exynos9810 SoC and Samsung Galaxy
 S9 (SM-G960F)
Date: Sat, 26 Oct 2024 23:32:31 +0300
Message-Id: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN9RHWcC/22Qy27DIBBFf8ViXSoYHjJe9T+qLAwzdpBqk4JjJ
 Yr878VJF67UBYsLOkf38mCFcqTCuubBMq2xxDTXoN4aFs79PBKPWDMDAVrWw+l2n1NxrRTcKyJ
 0znjhHavAJdMQb0/Z56nmcyxLyvene5X77b+aVXLBCaVGgVagaD/GqY9f7yFNbNescETNHxQq6
 lzo1aCkJZBHdHtVyvR9rbOWVy/m+0K8vk9x6ZoBtFPWGARUaIJ1pt0XWS+0Ci3IAKqnFhU7fkf
 X/FaxfErzmFIVXqYrNwBaECopAnZ172nbfgDWkkiJXwEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729974770; l=4134;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=BVUserAhlxXaLf5vKV75bAlUGlUoUuJDtgf69pVLDu0=;
 b=v4bk8vzj3ycQNePCRW5lDbWTwIMLhmyNOm0YdSZdQ34sUyDINDF+20rcnknWCRbCrJP/wTPiG
 H20CfUDFVtXAdep/nMEePOH0AeA9gbplUls27HUffU6b1dlOz/uoIlA
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_133253_471790_223B7B52 
X-CRM114-Status: GOOD (  17.62  )
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
prerequisite-change-id: 20241026-mongoose-pmu-52240ed310cd:v1
prerequisite-patch-id: 41ddde9c262005eda3624e381b4a0892836187de
prerequisite-patch-id: d1b80350c60949f7f2671895518ad4b1ceb51e4a

Best regards,
-- 
Markuss Broks <markuss.broks@gmail.com>


