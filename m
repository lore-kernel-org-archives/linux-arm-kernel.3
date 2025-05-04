Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910C5C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 15:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+ZiY2b1FLpsy9r3AGKcw4zckDdyCiygN84DOUybmFlo=; b=IajSKtZnqD8XYA6KldsWz6X0ig
	HIXxIp5EBxPav7Qwg4l8q/1b0oHx8oR+acsLaTZvNRC7TnvzdKqgOM/tKisQ4lNOGkfTBYWgXAAPc
	X/jWS6zR8NBebmDMRt7BrAl2goXtFNlaBAgKB7gMolrKewX1SYWvKjBT5qXJDuyVhjFV0jr2LkUa7
	QcQxkZo9GknnZBwRlJPikGti/LbAqbVMxPh1Xaa5Kwef7Hav9QBVmsNmvJQ+yUoB3V5cd91HVwNw1
	rh9+s2nk7AyuNdL53lfKO90t9CTEa6XkOjQeGao4lawyYT84n4QFokELighTnp5IDuxuzjSfnEwvB
	JeKDuggg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBbAx-00000005UKD-3u2f;
	Sun, 04 May 2025 15:22:43 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBaoR-00000005RWC-2Cgr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 May 2025 14:59:28 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so6336739a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 May 2025 07:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746370766; x=1746975566; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ZiY2b1FLpsy9r3AGKcw4zckDdyCiygN84DOUybmFlo=;
        b=fD9utkvJVRV1tFuHft88SDwPdBo7uI4ZN0WjxCHLjQomQowqeKlIMML0lqHUR0LFSc
         uwxofUWhofPI/GDclKS4/1iGXVwuOQe+GXcueEpitMX22MCMyji+NXUjCwbN0YA3dMiH
         +A6X/UXI8IBvuMOwql0f3AASbXOttzNSCy5zLQpXsYjYunD+Dy9Up/k8KLVpGU4JD32v
         gvV5/d8J2mIWI+QHitAtKdd2v4rPMp7qwC/EKhHg6S39SJ3bupvxPP9OTAI7NOw5ayGT
         fIpQJ0+ZYoD98wQHBt7Dxs4P44vPQ7jwYrQi7mW0hAXx/43qSAXq4gjjgcvZ8qEZD6DQ
         NVvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746370766; x=1746975566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ZiY2b1FLpsy9r3AGKcw4zckDdyCiygN84DOUybmFlo=;
        b=C6MF4NEe/JbT2G7q/T5eeTXdUr+9RrfJxEiQq9TNmQAUhrPBXTK/RlvX1V/fTx1OYl
         lv4wRBFzaEpiZpZxtllggoC0kXH7jHx9Afj3O5CxZACNYxzlLFru/W/JDjqK+ka8JlDA
         PYbP7OTCxeIuoHMt9Inih3qweRJsKWO8jgMEHlY4uI9nS7uXH2x7l2Z5V6PYYFROc4fm
         X9X3mdTFoLTzYdgN6vrkQATyKDKdPa4SJqUh11WPUG/WZUsvTWn5CrArE/sRarQKGvYM
         fZg+zb01tMEADGixfPx2M17YCTUjQCxvEdUE8dVJIhory7qibm+UMaiI+qGBMyvp3q53
         S2NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMvIYbot7YG026RAZoqiuIlqPZEtJinKGR6icgMgHIk/P8hhxjipAoMgQLH1QGRV+f164wn1AnpAvAzycM/A8c@lists.infradead.org
X-Gm-Message-State: AOJu0YywhUJAi5DZNAcK0RZwF2TDhcWzudzq9FZsFYPMSqh7jpII2w/6
	tiTilUbdD+KPVUUFMCKksIQzvhpqMh5zfy8B3gEVxl+JU/flJHOt7d41cw==
X-Gm-Gg: ASbGncvrIBGWvnWKMDmHh9HkwFr9uh6PBtcoYZoQSWsSJJGjqnyr/tyuRzhSZlNzDWa
	d5B2/GgafysK/zXJt/piCexrusk5/hreFG2xUl6ruYRekEKgKPGh7hJyu+bnYr0e33KxFtM3R9V
	amI20LXYL00inOKW9evD/i3Bt6psjlFHGOvpQXbNndt0R7Q2Sa+LzOq4QjlEXP7FvVCKo5gpxn6
	3YS/LYYwYZXLm+RnhgY+87JtxVFk/lHp4kG4nA1tbeRKlAkyQ8eQDlYATplsf8rMoY3NagrS0ah
	8mlow+WDSsG9BQ6TnIhwvrBLqUEboJupWF7XSCpFLyNB7+v7Gy3V72nazn97zG7c//XzdEWdJ3N
	QD9FR1YfGCXAwTNPT
X-Google-Smtp-Source: AGHT+IH4wtKObtJgtR1AT9dmxZGZI8D1fxqQbvpRwTRDavVZf4FwcIKdlepre/v+4+c5U/zvyE1CRg==
X-Received: by 2002:a17:907:868e:b0:ac2:49b1:166f with SMTP id a640c23a62f3a-ad1a4b36f20mr356109066b.52.1746370765856;
        Sun, 04 May 2025 07:59:25 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189508cf4sm336614666b.138.2025.05.04.07.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 07:59:25 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] arm64: dts: exynos: add initial support for Samsung Galaxy S22+
Date: Sun,  4 May 2025 17:59:03 +0300
Message-ID: <20250504145907.1728721-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_075927_565312_CE08AC75 
X-CRM114-Status: GOOD (  19.13  )
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

Hey folks,

This patchset adds device tree files for Exynos 2200 and Samsung
Galaxy S22+.

[1] is a dependancy on the aforementioned series for the usb phy drivers
and bindings.

Exynos 2200 SoC is an ARMv8 mobile SoC found in the Samsung Galaxy S22
(r0s), S22+ (g0s), S22 Ultra (b0s) Add minimal support for that SoC,
including psci, pmu, chipid, architecture timer and mct, pinctrl,
clocks and usb.

The devices using this SoC suffer from an issue caused by the stock
Samsung bootloader, as it doesn't configure CNTFRQ_EL0. Hence it's
needed to hardcode the adequate frequency in the timer node,
otherwise the kernel panics.

Another issue is that cpu2 and cpu3 fail to come up consistently, which
leads to a hang later in the boot process. As A510 cores are clustered
by two, it makes sense for both of these cpus to fail if there is a
power issue. Disable them until the problem is figured out.

Samsung Galaxy S22+ (SM-S906B), codenamed g0s, is a mobile phone from
2022. It features 8GB RAM, 128/256GB UFS 3.1, Exynos 2200 SoC and a
1080x2340 Dynamic AMOLED display.

Further platform support will be added over time.

Best regards,
Ivaylo

Changes in v4:
- account for compatible changes in usb phy patches
- use status fail instead of deleting cpu nodes
- add a-b tag in the 1/4 patch

Changes in v3:
- account for the usbdrd changes in the exynos2200 soc dtsi
- drop usbcon driver from the MAINTAINERS patch

Changes in v2:
- mention the board codename in the first patch's commit message
- make all reg values hex in device trees
- reorder usb_con above usb_dwc3
- drop regulators for usb_con
- remodel usb_con_phy to take usb_hsphy phandle
- include MAINTAINERS patch in this patchset

[1] https://lore.kernel.org/all/20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com/

Ivaylo Ivanov (4):
  dt-bindings: arm: samsung: document g0s board binding
  arm64: dts: exynos: add initial support for exynos2200 SoC
  arm64: dts: exynos: add initial support for Samsung Galaxy S22+
  MAINTAINERS: add entry for Samsung Exynos2200 SoC

 .../bindings/arm/samsung/samsung-boards.yaml  |    6 +
 MAINTAINERS                                   |   10 +
 arch/arm64/boot/dts/exynos/Makefile           |    1 +
 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts |  169 ++
 .../boot/dts/exynos/exynos2200-pinctrl.dtsi   | 1765 +++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos2200.dtsi    |  561 ++++++
 6 files changed, 2512 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos2200.dtsi

-- 
2.43.0


