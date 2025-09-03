Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F966CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 17:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7UyeZEfRakAOXRipKZZzHzlSyL5Gy818R1oSP4VasTw=; b=QFaNb7Avo+Dqqt
	PtGZucc260o34aat71tDXOZ2+AJCScehTIAkFzGySwXM9dW8yHGTMPNKABuYCkmS1ef/6b4w+NxOY
	lh81Zz++h3KPsz80ov24oOA0C5FQFq8aMCDG4ON4ndHnTrUqITV1cudjx6nzbAseTOv/wvSVyRv0E
	ZGxeZDg6y3ya7ydkzhohFdWcyYZeF18XI0slNfktcrybiIJ99U+8aOr4JUJ0dE4eY6to0Cz8n593R
	WmFnc3W8k4MbJ8FeOFwOsoVj39aMvQlUFIFtWxo0hFmpEp8X01GNw5MFSOq3d9t5OF6GLyOrGcVI5
	IopHV5gDZQFL8MP/E0Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utrha-00000007F8x-1jBh;
	Wed, 03 Sep 2025 17:55:22 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnyf-00000006f2E-1b6I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 13:56:46 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45b7d485173so40921055e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 06:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756907803; x=1757512603; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7UyeZEfRakAOXRipKZZzHzlSyL5Gy818R1oSP4VasTw=;
        b=mOdzG/zKunjeZHWmuq4WtxE3/xN80NPkD1qlOSpSq817PAyGHqzdoMqqQaGyqGFhz/
         jQcLjPC5pY5moqsX7EisIlrhB8npwg5Iqfi+CCP3mqHGrv3ZDYe38qzy5LHopELx3JOo
         7ibeWZEciYfob5A84Iq7+TAVgfQxCLnXxfRbfGBK9+ndQVHcLoKnnN2ReiPM4tXGbopK
         w0uXy7yzLC+36o+TT8yg1eQeeegoQJxAmFROCMh1PgnbbSQW5C6BMuaaw1R66Aa3+fOs
         a8/triHKsyFM+8gIqXzzZn3WxfQiXiJoe6yn+Ze1WU1liFFfLYVfBpua4jCzPsqXnwyu
         UzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756907803; x=1757512603;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7UyeZEfRakAOXRipKZZzHzlSyL5Gy818R1oSP4VasTw=;
        b=OZwNP4GcLILce2lyCgmyzZDFRbQhWtZ2mEWCBnIxtm6j5/qhWQc8wshLzMhiNOnUsO
         XsXlNuwz17HVGx5vYJ+BONweqWTHBy/oHKxiynOZfNtI4wm5O9mckdpCgeLxheDWB07I
         77Su3Rhmtqf2EtKVLx7StJMKTO9WxMRvGs9w2unTZy/wpOyWJjWp2O+sA5DE9blmuauX
         EgLfWzqGq8mwZjVl/j7QTWc5LkwcoKF0Uh7+/qMhcQ0P2PwtDPUy6dM3ZNr5UB4KdlZo
         AgogZk2ypWIVvzYPnNW+6YpEcLnc+hIZPSJuZuYhdrevdQFmw51Si1FmLe+Yh/3pxyzc
         rz+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXq3j5PwAU3Erw6RqoV1bOZupebU08izAo0bHMc/j/aJEMhrqPWYLmMbuyrvQ8GMQY+LIwQblAN9+XvUJXHUM4M@lists.infradead.org
X-Gm-Message-State: AOJu0YyNsQct4fnlUxBV866/vz4mAq8kdmmFRMvwQX+jy0QH+/0CqzTN
	Y3KBLOaKFNPtQha7Svn4T9aQCNQzDzlXPNQYSXI2ouAvMecZmDBLtNTa+QrFPiGeLo4=
X-Gm-Gg: ASbGncseyBsFDcJgQLYkQHNJCexVVK9DPuxD7TpWqwvE/CbV1wNSKI5bYnkbaFWM/w1
	G655WIL47X8NDAx3n+4SHBltafgQB8+aGtiRLAAz8oQ0D4Khr+LYAnNKU4TqjtsBsmlBhHvMoRO
	DWiSqAGX7dt9P6cCarTXvy1se/4mfsufjiTlWC7XQBIT5vEsVq4E4+a39dieU+RmSWAvgutFPGJ
	R5VeVYQTX1TB5yAFqeRo/2qgtvo9+iPzh5xYmZj4+g5Cztn47G4ZGGNN7ljok879VM/tIR2DqlN
	mj8To3cHrEwNW0VzhxOzJ+QTvo+wDfYGh2MG5KSXh7YEapNxCGQPcT+uUmdY+DfJpiBcW3JTwzd
	m0Bsd22x7hWnwWLyi8SekvHogsCVMjlJ1ebz76ekZ/4T2m2xyaj1lUQGbnAEJvBuAKIALl/a+WP
	0ZX6xrDElYPnqZ
X-Google-Smtp-Source: AGHT+IGAz13CW9qYdP4E1mRFLDKZhAD79+7ZMxCzGrpXuKeHY3BrVbbM+xV+kRrxmTmdkbjk2yyj+w==
X-Received: by 2002:a05:600c:3ba8:b0:45b:6705:4fca with SMTP id 5b1f17b1804b1-45b8558b82amr147687525e9.31.1756907803419;
        Wed, 03 Sep 2025 06:56:43 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b87632365sm197257135e9.16.2025.09.03.06.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 06:56:42 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 0/5] exynos-acpm: add DVFS protocol and clock driver
Date: Wed, 03 Sep 2025 13:56:37 +0000
Message-Id: <20250903-acpm-clk-v3-0-65ecd42d88c7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABVJuGgC/22MTQ6DIBgFr2JYlwY+EdBV79F0wV+V1IqBhrQx3
 r3oyiZdzsubWVBy0buEumpB0WWffJgK1KcKmUFNvcPeFkZAoCGStliZ+YnN+MAgLSghHamJQOU
 +R3f37z11vRUefHqF+NnLmW7rn0immGCutW0FE4wLehn9pGI4h9ijrZLhYII4mFBM6xojuWat5
 uzHXNf1C3fN1dHbAAAA
X-Change-ID: 20250819-acpm-clk-28d2a78e0307
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756907802; l=3867;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=Mt2KpjzPULxrWRBMrQwI+fGFUPZG+amrTgGkb7YvIyw=;
 b=DakkBlIHpn7tVePCz5oJ4zp5oD53iKk03icPlLMbc4NT51IpDoL/zCPk2pTUJ/MwmoE6lU8Ae
 7iEo8dy1mf+A1vb7kEC2c50vYYSwnyl6A0XAf8u2C8lCIsizEpn2dc4
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_065645_431072_38B4E994 
X-CRM114-Status: GOOD (  21.47  )
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

Dependencies description:
The acpm-clk driver (#3) depends on the bindings (#1) and on the
ACPM DVFS ops (#2), thus I propose to have an immutable tag so that
the clock subsystem to merge first 3 patches if it really needs the
new clock driver. Patches #4 and #5 have no dependencies.

The Alive CLock and Power Manager (ACPM) firmware exposes clocks that
are variable and index based. These clocks don't provide an entire range
of values between the limits but only discrete points within the range.
The firmware also manages the voltage scaling appropriately with the
clock scaling. Make the ACPM node a clock provider.

Add support for the ACPM DVFS protocol. It translates clock frequency
requests to messages that can be interpreted by the ACPM firmware.
Add an ACPM clock driver to model the clocks exposed by the ACPM firmware.

Thanks,
ta

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Changes in v3:
- dt-bindings:
  - move clock bindings to a new bindings header
  - update commit's subject, s/add #clock-cells/add ACPM clocks.
    It also suggests that the bindings are added.
  - prepend "GS101_" on clocks binding name. The bindings name are the
    same for GS201 and the acpm-clk driver will likely include both.
  - collect Rob's R-b
- clk-acpm:
  - move clock definitions here instead of keeping them into the
    ACPM protocol driver
  - use platform_driver.id_table to differentiate device type
  - fix Kconfig dependency, || (COMPILE_TEST && !EXYNOS_ACPM_PROTOCOL)
  - update commit subject, s/dev/pdev
- exynos-acpm:
  - move clock definitions to clk-acpm
  - use devm-action to unregister clk-acpm platform device
- Link to v2: https://lore.kernel.org/r/20250827-acpm-clk-v2-0-de5c86b49b64@linaro.org

Changes in v2:
- dt-bindings: clocks are not longer a child of ACPM protocol. Instead
  make Alive Clock and Power Manager (ACPM) node a clock provider.
  Update commit message.
- firmware: exynos-acpm: register by hand the ACPM clocks dev (new
  patch)
- firmware: exynos-acpm: use defines intead of enum
- acpm-clk:
  - switch to determine_rate
  - drop __init, __refdata, __initconst, this is a module, we need those
    methods and data, after boot as well.
  - fix the assumption that the clocks are defined by ID in ascending order.
    There's still an assumption that the clk_id < nr_clks, but this is
    now covered by a sanity check in the clock driver.
- arm64: defconfig: enable Exynos ACPM clocks (add patch together with
  this patch set) 
- Link to v1: https://lore.kernel.org/r/20250819-acpm-clk-v1-0-6bbd97474671@linaro.org

---
Tudor Ambarus (5):
      dt-bindings: firmware: google,gs101-acpm-ipc: add ACPM clocks
      firmware: exynos-acpm: add DVFS protocol
      clk: samsung: add Exynos ACPM clock driver
      firmware: exynos-acpm: register ACPM clocks pdev
      arm64: defconfig: enable Exynos ACPM clocks

 .../bindings/firmware/google,gs101-acpm-ipc.yaml   |  11 ++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/clk/samsung/Kconfig                        |  10 +
 drivers/clk/samsung/Makefile                       |   1 +
 drivers/clk/samsung/clk-acpm.c                     | 203 +++++++++++++++++++++
 drivers/firmware/samsung/Makefile                  |   4 +-
 drivers/firmware/samsung/exynos-acpm-dvfs.c        |  83 +++++++++
 drivers/firmware/samsung/exynos-acpm-dvfs.h        |  21 +++
 drivers/firmware/samsung/exynos-acpm.c             |  26 +++
 include/dt-bindings/clock/google,gs101-acpm.h      |  26 +++
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  10 +
 11 files changed, 395 insertions(+), 1 deletion(-)
---
base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
change-id: 20250819-acpm-clk-28d2a78e0307

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


