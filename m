Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48642D0C601
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 11:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LGDxFbsJCpgRnwwlevb7m4c9bmH+TBe47/8+WZp8fvI=; b=XSPKDpl8UF7/5Y
	m5/kdauPAHSSPXNzojTc+YzZhA09lDamTd/24Kgu+tKXEXRwyGEvA9otWY3O4Ups13YgmLg/KLd8P
	RJ7QhTr2i9IzfA/kl8HgWcEOcIjm8xUE5nJ/YDelahJnYKTTN4Rj4GJpEUVBZia0QKXwAkFSv+4wO
	cu/aW9ch1f4xMo74jRFDAKyGhjWLMeofq51mXY2+dl0b84ckhNtPutU1uieRTLwx3SnkWbO7iGIUY
	ihNb2iBfwj5AHOKlgs0m341tvu4HwXOtj0iSdgjUMMcUqrcMfBX71EX4tqItx4wLQdW0Urx8GfcyS
	RazuWwSk/0PffGlxa1YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Idz-00000003XAF-31Wg;
	Fri, 25 Oct 2024 11:38:15 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4IRL-00000003UxK-2PZZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 11:25:13 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-539f84907caso2134706e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 04:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729855509; x=1730460309; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LGDxFbsJCpgRnwwlevb7m4c9bmH+TBe47/8+WZp8fvI=;
        b=jubMGjmZ2Rnq9IJ3HllQi7sZm10zH0HHa1PBTQdjzRpvaMk1VA8ZzklGy99iF9kcKQ
         0HU8pe7YZEd7AZV9JGa5LQv/MCUwrqpRYnxGnMEynd2Vg2gaG/rpEgcIfb8hR78CTBxS
         Msa3ZN/xhbJnZHKb+yA1/fppqvuTlSA/Bh1UEVQTLnJD06lw002S5usKItLEbqZ8blI2
         FP7l47wDzqqkgRwgLAbkGpClDL741aXpH7veQ3wBzu07n+ruSOIJztUqRfwjFbDhLOBz
         V9SVzU85e42H3i+k/aLVmiIKvXzYOLXnEgf9jel24sabkoFSwOO3clYmgoXkUU2T11C/
         Ouag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729855509; x=1730460309;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LGDxFbsJCpgRnwwlevb7m4c9bmH+TBe47/8+WZp8fvI=;
        b=aQvbtnHTQAP9eZlacdai4nMSQYbonDf2vyQiyTh095wjwBbBpCiintyhp04xpxPo++
         6wz4jepgD0uY7nIqcM+ILEBbsPEZyGa2wQSaFPc6ykgqsH+KFJ3UxHTEAzo3BarcJjsz
         Pj+HIaL3g57IWL2G8frxi17vKsRNklfZhdpD4n0o4rZ+Z2r/QpnDnuJlf2WEHJEBLmwV
         7Gn5XomQbCI/2OiLZ+AY2v+hDuxjWo7egCBZmCZ0g6U5hYNFLibwGmfwAOxXjCrHexB0
         oR4tKRcB/Z5YPkA8AsKcb2MglrvevVavHqy0cRnZgDSbUBqdLDVT8WWck3KUFTf33yQF
         xbAg==
X-Forwarded-Encrypted: i=1; AJvYcCV1ic3Pboqp0K/6vPAy8tkqPDWmeOkrWAtc+ilyn9GFIkunbQKnvB5YMso80t9CC3FHGETSfvoRANCG+CYbYd/4@lists.infradead.org
X-Gm-Message-State: AOJu0YwpYr3AOFSGApctSVBT7mOCCcV23CuCpA1vrsEEdAoPCAltSKbt
	90DPtS2U4VG6CHcx3Kvji0lOk1HoOGzRzJ1lPP7ooY/g0DBtU4Cf
X-Google-Smtp-Source: AGHT+IGLZ+DwA6Tv+psqxv1iXTbBvh4nLKYcWHwMvOU0NZepTzQtBH2heZMmyHzsdO30dYav8AWDTA==
X-Received: by 2002:a05:6512:692:b0:539:da76:c77e with SMTP id 2adb3069b0e04-53b23ddcf22mr3404001e87.5.1729855508445;
        Fri, 25 Oct 2024 04:25:08 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c90c0sm144028e87.189.2024.10.25.04.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:25:08 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Subject: [PATCH v2 00/12] Add support for Exynos9810 SoC and Samsung Galaxy
 S9 (SM-G960F)
Date: Fri, 25 Oct 2024 14:24:47 +0300
Message-Id: <20241025-exynos9810-v2-0-99ca3f316e21@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP9/G2cC/22MQQ6CMBBFr0Jmbc20oqGuvIdhQZkRJhFKWtNAS
 O9uZe3iL95P3tshchCOcK92CJwkip8LmFMF/djNAyuhwmDQ1LpM8brNPtpGo3IXZrL26tBZKMI
 S+CXrEXu2hUeJHx+2o5307/2bSVqhYtI1Id2QsHkMUyfvc+8naHPOX/PxgvOkAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729855507; l=3840;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=54KeIELGN5UoU7VoTMqUmaFmxCb6rTL4TU17Be6imWM=;
 b=aFoIQjX4s33D+HoI0XHlci/aW6O5Iloyc1/DSx9Q7I4F7SnEG1WTOSJvqq2kcGnSIDGXDPyz9
 S7TvTxv4posB5BR3Egq4IG5rt1QLJcAB096BsSCEVtJjEBTym4LTI/n
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_042511_658876_2233CECD 
X-CRM114-Status: GOOD (  16.60  )
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
Markuss Broks (12):
      dt-bindings: arm: cpus: Add Samsung Mongoose M3
      dt-bindings: hwinfo: samsung,exynos-chipid: Add Samsung exynos9810 compatible
      dt-bindings: pinctrl: samsung: Add compatible for Exynos9810 SoC
      dt-bindings: pinctrl: samsung: Add compatible for exynos9810-wakeup-eint
      dt-bindings: soc: samsung: exynos-pmu: Add exynos9810 compatible
      dt-bindings: arm: samsung: Document Exynos9810 and starlte board binding
      dt-bindings: arm: pmu: Add Samsung Mongoose core compatible
      perf: arm_pmuv3: Add support for Samsung Mongoose PMU
      soc: samsung: exynos-chipid: Add support for Exynos9810 SoC
      pinctrl: samsung: Add Exynos9810 SoC specific data
      arm64: dts: exynos: Add Exynos9810 SoC support
      arm64: dts: exynos: Add initial support for Samsung Galaxy S9 (SM-G960F)

 Documentation/devicetree/bindings/arm/cpus.yaml    |   1 +
 Documentation/devicetree/bindings/arm/pmu.yaml     |   1 +
 .../bindings/arm/samsung/samsung-boards.yaml       |   6 +
 .../bindings/hwinfo/samsung,exynos-chipid.yaml     |   1 +
 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |   1 +
 .../bindings/pinctrl/samsung,pinctrl.yaml          |   1 +
 .../bindings/soc/samsung/exynos-pmu.yaml           |   1 +
 arch/arm64/boot/dts/exynos/Makefile                |   1 +
 arch/arm64/boot/dts/exynos/exynos9810-pinctrl.dtsi | 503 +++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos9810-starlte.dts  | 120 +++++
 arch/arm64/boot/dts/exynos/exynos9810.dtsi         | 273 +++++++++++
 drivers/perf/arm_pmuv3.c                           |   3 +
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     | 154 +++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   1 +
 drivers/soc/samsung/exynos-chipid.c                |   1 +
 16 files changed, 1070 insertions(+)
---
base-commit: f2493655d2d3d5c6958ed996b043c821c23ae8d3
change-id: 20241024-exynos9810-b3eed995b0b9

Best regards,
-- 
Markuss Broks <markuss.broks@gmail.com>


